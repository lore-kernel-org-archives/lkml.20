Received: from mail-vs2-f42.google.com (mail-vs2-f42.google.com [74.125.227.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50FA41DDF0
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790232746; cv=none; b=AT/s2/E9zptScsSvIbZy8GvBmsrna7Tcjp1VUNHQ02Foetlta5AUcODXsGLqJM7rJC8d0fJ46brJI9C6MPIc1J4q8hmLSQ0ubw+/TQK3ackWS+mLXqL2iFY+sQFAiJ+nm0EbUNK2x4qI1wwMJdFbHVpgbadU9SXUI8pV9yIMMLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790232746; c=relaxed/simple;
	bh=bHdqhN6Uz/ifL7Xj9yVetsOtxe4Gixkb74+2Fem2cnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c/vlrp6/IXUIhxANt+s/jrT42I9T2J0OH3UrS0a5s/kqplLLmMb9LIugOjwJxPxhqbfYc/472dC6mWLLo0j2qHZ8/SP8f1INsnevG48aj4/uS5375i+Ng+l/qYsp2m2Qd3WN/B2KH+GrnCc3KgFPy2oVGcADCOcFdb+fBGgBZqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f42.google.com with SMTP id 71dfb90a1353d-5c963d7503fso680058e0c.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790232732; x=1790837532;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8AcTxgfWu2jVaXC9s/SfRyP478Ly0vXbsE/VdtFyfI0=;
        b=nGs66EWo54g64/nT12UR3PZL7SgL0lX90BAtyoNo1uS0mSRcXhAuxf8v9DyHD77CVh
         0pIaXnliy5cYFLtO2hKe3I0XUNQorbTRDkSrgnDbkz43l/KzPijAJv6IjM5uYIT44wPo
         mrt5hJfvQgzE0JvGHdV2ljgivNJFzvqna5BbjBq5XYTp5TlvMb6dTJ7l5foangKEn+e9
         SQZs8wsI0LJTEeAbZoZSSFod0P28fbMFl/53aBf/GuCizLecOeaEzToKPE9zxMCikEi+
         w3CO8iw5bgC1xXPcXEdZdz+65gu7m49WiqlsB+zfHx0T/26WybOLMYks+WzTCeXfNmpd
         8bSg==
X-Forwarded-Encrypted: i=1; AKwUvBwh4IekOSdHL0tAW9cApd1UE8SUzmXe37/NQodpBNDNq0wKox/k1G+tM8iNbQAUN7V/JGIOQzUeNFtZ6/g=@vger.kernel.org
X-Gm-Message-State: AFuF++mv+9G6MwhMktyz8/hj+0AWVAG6qqKqgKc8vcHIrjGYgVHCQjUN
	Ott1VbGeFqAMfE3Vbf4O97yAQUNBJIRhmuVIFqisGxDFyf26Uk/QASkm9d+zfchW6zY=
X-Gm-Gg: AYBFou1lMnORWCB32YrnnbA4oLwoKWx6lfrsLVsR+qI03g4QzNphS3veNZSrLjlq2Vx
	KTKcg9ymmTM12vFDJMWFjFwS9k5FfUjyIjUqPIGe8CJZC5rLoDZi9+4cG9drD/PQpbtajl7pZu4
	a9TyBICn5nRgS8BIB0+ceWVbf1AzwGOuw/KTvygxsGccr5JEOoT4JyYiMYxkEWUZqU4rYBrEQzO
	o4Vv/u9tlpfw5kO6TbGdKciM+gbd7AYEQmfCYEH1CikLKVv2tbsMKzZKTD81xH7hWvCSmIpIBqB
	MFyGEQ9UHjM8CwnhAD6ByaKWt+Wk8oNJdpXCMgqpXQe5bGOrC6PW1z7LT0Zvj/YHGE7FhUjA2nX
	9q+2ZxI81w3C719CDsVbroAkv2IReGcyt5/wHvhgyiyr8pupP/w+O3lkhL4X8dp4FvTaNYivJvQ
	x66rBrNuU+F/i3FVzjGOeF7CKTCnkI6rfsOriH8e8gZo+Nnx7SJMR0HYImVVPZpYVSYLJSIRTjq
	7h9laAethtBWnixCPXBgDbL/D7XIZgqsava
X-Received: by 2002:a05:6122:3382:b0:573:a779:62cf with SMTP id 71dfb90a1353d-5cb09cf83f8mr1178597e0c.7.1790232732231;
        Wed, 23 Sep 2026 23:52:12 -0700 (PDT)
Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com. [74.125.227.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f04c161fsm5528130e0c.4.2026.09.23.23.52.11
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 23:52:11 -0700 (PDT)
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78a6c77d255so700242137.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:52:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxyt8NmZH4pFjake9wu3HsQ85lpkZDZGjyuZwEWQVITqpKmTdkAwpJYrdLAtmxwWe4eUPJoz7tZagas5Rc=@vger.kernel.org
X-Received: by 2002:a05:6102:3fa1:b0:79a:21f6:20fc with SMTP id
 ada2fe7eead31-7af1bb76432mr890214137.10.1790232731325; Wed, 23 Sep 2026
 23:52:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924010418.726980-1-oss.patchbox@gmail.com>
In-Reply-To: <20260924010418.726980-1-oss.patchbox@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 24 Sep 2026 08:51:59 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVx4Ms42zU=C154kJV3CGQ1c4PaOjmBTc=8eVQge8NHCA@mail.gmail.com>
X-Gm-Features: AclHuK9x9fUPgKfTcFQFW-zdmziFaoehsLnYyUtoHh7DDWbbSEG86VZHZP8H3cA
Message-ID: <CAMuHMdVx4Ms42zU=C154kJV3CGQ1c4PaOjmBTc=8eVQge8NHCA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rcar: Release temporary device tree node reference
To: Yuho Choi <oss.patchbox@gmail.com>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 24 Sept 2026 at 03:04, Yuho Choi <oss.patchbox@gmail.com> wrote:
> of_find_matching_node() returns a referenced node even when it is used
> only as a boolean test. Drop the reference right after the match check.
>
> Fixes: a115b1bd3af0 ("PCI: rcar: Add L1 link state fix into data abort hook")
> Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
> ---
> Changes in v2:
> - Use an explicit of_node_put() instead of __free(device_node) (Marek Vasut)
> - Switch to my oss.patchbox address

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
