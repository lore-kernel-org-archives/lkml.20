Received: from mail-ed2-f12.google.com (mail-ed2-f12.google.com [74.125.228.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E634349CE2
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789331997; cv=pass; b=nvZu7gVXUL2vPwh1vuDQzeIBfKeEvM+zo8ifxUvctKSz1v7IdB5/cxIfCOl1jDZSr9jht3c3sG5dRLD3bUEzPpvsJ/O76c5Xy8lP3Sat1vNy8e4WdROB4/KiehYhST982j7WGeZiZjtVFSA5/pxUdz2w3M3n6NND0tXZs3lPur8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789331997; c=relaxed/simple;
	bh=4TIZu3fYY90ZyFJn3Oy6Mv/sZIRvgaA/zzQxxb1e/CI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hayOVLzp/CmQ89dyk3GpQ1gf8jU0+BVN/DiIHqwKMYiKSg55iMqRLcurQoHz3eduOK4+GNODRifWtv4sYQlfUZUNOyDl1/ozqJzL48+rzA2/CW8QrySPSLMpdpcydjmcn6Oxeo/dt2QzkevyZ32v+jghlC89y/L+cfPTmTxKm38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lpQuozJ/; arc=pass smtp.client-ip=74.125.228.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lpQuozJ/"
Received: by mail-ed2-f12.google.com with SMTP id 4fb4d7f45d1cf-6a60591addfso1905073a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:39:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789331993; cv=none;
        d=google.com; s=arc-20260327;
        b=YS0ZTKHoJsYOdGW6SnoirRhNKw5nHnzCRVb0u+I4hc4SHjBj8oXnddFQtQDj4TLDe5
         XDG+ENj1Ct6QtzJGZSLDmHfq//J3UI0zJLhDrn+Vqy1dWpz8i2gBIA9AYHO/uOjaJId8
         kiYQ4GuGuAPH6U4uDoGjDoKSZSSC3E92ZpIcJrILz70Se3XjFZr/GpTKQ9cs5JwZ1SLb
         x2gP97hy8Z9fn43O1jwmRM7ZNw+36JzLP8Bb9kI1iLCAOXy5bdzhv9jojbnZu3bNXwIp
         BKJY3AG8NtsUO0QTwqnM8hiKtdEZ8EbQnUT0iPhVYkyxSaLZovYbsfHgHVj3z5amTRRy
         G+RQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F/g6G1QJpmcbX7ChC+iW3/9ptzGNtvNJ2UeRpHiTF20=;
        fh=QtPa8n46kTQkjs/NTG0+kp5UY6DIThhrpxTAjUtCaok=;
        b=XVDud0fJ7NC0YHoj0gt4/pjjbsuSbDoUiWpK10fJN+aLA4Spi/efN8yaTn9tnXtCIa
         mUNWIg3cKi68jFWxZ1PXfTgwTDqB1Xrn19Yj2dk4tOEeB4szJODGg/0HFz7saMafWHgC
         572MtCctD9RxArv5azHrOqQZcwS4tDpc/ViZ3Z15NDvoCUt6STuQgwXLZ8oRibiOIvC/
         mtUbnRO/DNnDVsy2XnBvPM4jzsurFWhOQfkJ5ygvvvm4/VMtG4gvdmnClKVToJvm7If9
         yYOEsYjcaelyB/RQcf1KK1FL9G7IDlT79kBkUskGEUoYxWTZVy+WBu5NsO1I1Xp1pgBS
         1RoA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789331993; x=1789936793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F/g6G1QJpmcbX7ChC+iW3/9ptzGNtvNJ2UeRpHiTF20=;
        b=lpQuozJ/IY1ZRz/TRVgteNqFwyTUsnBTiKcO99OSeEcOymmhQRTlKc/9PQdT1Ggp8H
         6/YhT2b8SfOUQxCzBMMyPeSuVcUXTQMvKDFwTE1ZJMe1Z0NRXxH5FRUkq0PrlwmTugqf
         61R7HmUyWMTi1J0UGUVk5y5z+ajIaxR7OcyHWZJ2T3TVfdmISlGokB1+3ZyO4Wc1JoeH
         rGdU3erEdPsJNaMqmKrPFY05SwnM7ZnBM5BljiMiPa4lCwoFKm6EUFva1uci8AmfzX74
         L12hCj9fcA2YzmUqUFdM8Xsmn+k2XVm+FW6dgYfmuyKo4VanLKyTb4av5xjLz3mF+/8E
         1xAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789331993; x=1789936793;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/g6G1QJpmcbX7ChC+iW3/9ptzGNtvNJ2UeRpHiTF20=;
        b=ofOPQpmhoVBBJDt2HAtQA8HEa5aWbaV/piMbQrLCpzUGfZao4FGF40rQPDqqmyUHXg
         29TkMEmThoca4lJE6X9VJc2crOQRKK0qn5gyeIdqoMFAIuKgDkRdwy11uxtv4cX3Zvx7
         qFjrEiYwhjI0QJvbMUtgkOKHsBYTCFiMRX7fjlLyZFbuPUWb9L1TIBp+2HppgIyyBPfX
         gXnf/VeeJCTdJvk3BLeu2iQtGMN6ddpCqnbkHe8/lL5EI4tMKUcgGPpWkA4ddo32grdO
         OybFsdN6AQjUMnF7RI5YxExid/kFswbeF/aNIkzusHE65nEap7HkW3k23FlA+2W5iN1e
         v8yw==
X-Forwarded-Encrypted: i=1; AKwUvBwl1Y4z+YaG1gdyg3L0bzdPZRhG7/kn8nZcguDmIWKw4lza2X2VYiE56rCUTI7V8CpPSMU3Y/WY0lDLRz0=@vger.kernel.org
X-Gm-Message-State: AFuF++npF5FZYcLRXCtEqfznqffGivDM2vTiLmJA4qVrmGk0m9bxEFM7
	OzsuKf3QAiVntYzzESEq119RK6aubcBrz7J/VNmnLQYH/sYrGD1+slv5Y4gQiI2L6KjttIrz8xb
	P0Qibfkx8E4U0qFzzNvK+uC2XnXXU3w==
X-Gm-Gg: AYBFou1c6iHQ1kN9VRf4zMzlguQOu6GjGfBW+cA09pl4XrHkHb4TlQK0Xd+19tioVTB
	Xc7aYCwyMImeBmBbY6CX7KkiKUpqoRpy/VRBjmEZSiL/wD937tNZ03Nxu6qlpoJDVW2n+vuviUa
	vTqCrEOfdxr6PSXNVXDT8995IYWphxAE/MW7yoTnuq8YQTXtXUGbotUEVGjdgbOO/zHx3JoIJtb
	U9M3wD5uTAz19z1KxgYW+q2uT4LbIuXQeYZEI73PN6Hl0iwgwzlbRDRUGmScvpD+2Quc45JQdWF
	l4YwxnVk7X71BoDYhR13fm12jKUv3Ol9ubYiSJJPCDHaL4EVqlRL7DOe2/nWMcmnTXlsgRBR/9Q
	6id3X4+cL9/9esEH3sOklUuZdyg9xXyjyYxGO30mvbETQMKZ8gMzdAUvxK1rRMGlMMg==
X-Received: by 2002:a17:907:724c:b0:c25:ee92:2d0d with SMTP id
 a640c23a62f3a-c29857007famr452694366b.9.1789331993064; Sun, 13 Sep 2026
 13:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911033219.34566-1-mhun512@gmail.com> <20260913144635.GK48209@horms.kernel.org>
In-Reply-To: <20260913144635.GK48209@horms.kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Sun, 13 Sep 2026 16:39:41 -0400
X-Gm-Features: AcwNN1WXSyG3AyW6584G8j1Wr81DpX6Hfo7mLJKq1SiWGULXOiUL7zcRCXjlNAQ
Message-ID: <CAGEsz8G2N=To8-jvMvBRW5cP1wvjJfPQ84kqh5ObvB1bTv1Y+g@mail.gmail.com>
Subject: Re: [PATCH net] net/qla3xxx: Use managed PCI device enablement
To: Simon Horman <horms@kernel.org>
Cc: GR-Linux-NIC-Dev@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks for the review. I'll keep the existing manual resource
management and add pci_disable_device() to ql3xxx_remove() in v2.

2026=EB=85=84 9=EC=9B=94 13=EC=9D=BC (=EC=9D=BC) =EC=98=A4=EC=A0=84 10:46, =
Simon Horman <horms@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On Thu, Sep 10, 2026 at 11:32:19PM -0400, Myeonghun Pak wrote:
> > ql3xxx_probe() enables the PCI device and balances that reference on
> > probe failure. However, ql3xxx_remove() releases the mappings and PCI
> > regions without disabling the device, leaving the enable reference
> > held after unbind.
> >
> > Use pcim_enable_device() so the PCI device is disabled automatically on
> > probe failure and driver detach. Remove the explicit disable from the
> > probe error path to avoid disabling the managed device twice.
> >
> > Keep the existing manual cleanup of register mappings, PCI regions and
> > the netdev. These resources are released before the managed PCI disable
> > action runs.
> >
> > This issue was identified during our ongoing static-analysis research w=
hile
> > reviewing kernel code.
> >
> > Fixes: 5a4faa873782 ("[PATCH] qla3xxx NIC driver")
> > Co-developed-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Ijae Kim <ae878000@gmail.com>
> > Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
>
> I think that rather than introducing the use of managed resource APIs
> to this driver, which is not encouraged in Networking code [1],
> the preferred approach would be to add a pci_disable_device() call
> to ql3xxx_remove().
>
> [1] https://docs.kernel.org/process/maintainer-netdev.html#using-device-m=
anaged-and-cleanup-h-constructs
>
>    "Using device-managed and cleanup.h constructs
>
>    "Netdev remains skeptical about promises of all =E2=80=9Cauto-cleanup=
=E2=80=9D APIs,
>     including even devm_ helpers, historically. They are not the preferre=
d
>     style of implementation, merely an acceptable one.
>
> --
> pw-bot: changes-requested
