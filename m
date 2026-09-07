Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FC151121A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788797158; cv=none; b=C2zQQIQiJEmA04MEYjPnZVcbkwyIDeHHMvSgiaF6fL0ZdOSWQzK55pr3JCgLR5ziUUgpORI7+KVbSY7tnb6QHqrfPe4qwrPA8lLTrp2XJr14sbYJmhr5N1YZaKKt0OiCYUwHoXKx/3lRbRlsC4Xwl9qFou0UeM1kTJqAaqJSdSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788797158; c=relaxed/simple;
	bh=hU7eRYQ2L+6W3KSv4c0PzkTILRIgPmu556oNrVZACTE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AkYcQ83442REmFjR4aXDb9k+EA21ar4kXDcXipYFo8aQzsiz5bwvild9LrzKI4Auk6KiAA0XAxBCahGofbRWvxSg27TckMOoYFd6VLPy22lNrEf5t7ZjkTGBakVmISxNHt8GGCH2qFl+J6K+dJfBX0k7Bfg3SsUumJYZkEnUiRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5c67175d176so1644562e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:05:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788797154; x=1789401954;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9kwN9YV2UIWR9vTDW/+7DxPdDKrz03iqFaixNrlJ+1U=;
        b=SqAl2PnMruc09B1opGS7i/vQL8s0UsdXmFnObv4McgczEaXIuwI6u0WXgBMByYvOdj
         RQbVr7JpBF52sXIalDjz7frmAbnre3/0/X3v3H9mjODUVswdEJMU/XPJgddV1gHO5Zpr
         I3QY53nKj3fqB6SpfOPH0ZazQEXQUThPu5YVRJwnluTu6tror9uIy+BTYeNLQvkR3flr
         iXMZHa8+IAtQI8DfFwuCArwdFYKLYW/sHt87Drm8wLLojhlspKHW6TlbqD9WYQdZpg9J
         VmbIdgBy4FMb0hRDrmYpMKskOYs1L7E9iUH54APfWcj9NClAJ08WAflcH+RQWNIuST/4
         +9Qw==
X-Forwarded-Encrypted: i=1; AKwUvBzyMS8LeqdgAX5PYVZrAq7FDr7gbMIdJifb9kPQCmi/Wpr8eL2bSWEIGD2Nio9hpQ7OCfZXjTmiQLqQ8VQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kx5DOPPxGOT53eOedpeRaLfu2q7LcHf9l5AoI7iBsU+gjN1tEn
	UpGUoJcBBJOnNj7k/q/B9srotB9gBV+MF2oG21+BSn7scYAj/zkpwOyKWE/c/16i
X-Gm-Gg: AYBFou3QG7F4+AS9xL9LZCzRyOJlzQZhKcj3TtgmEDMXOsh0vS+WE2EfvlSm+vTTRhM
	APWPQ3jgogNZmgA4wMW9iwlIbKE81ctDJJzqm9irhM927eqGvQjTmyhgiAVnU9MjrisPJtpfGJb
	yl8LZAMqboReCPeE0STgP9mNYvlE3AaiMY1g1DImcsOCu8Vy9iOot1mL7sNGGm+3XxKd2c7LPo6
	l9NCqw6TM4jDH9cxIItUIwdMD9/zD/Qvs9BlWz8qIV/1lSQ4nTskN+FfKVyrDuFTMVP8Nw2DPIv
	S7IRV8TcC5MKZy6JbaTmR8ODH3tC7HHoGz8oH5pFu6qF/pWvIC8eVvFoeUCgNdbhOUGxzZi3jz5
	v/oWIBhrLU6V4FJFYIWTplNnD9eh40tVjSVE+YoU1rDjm0E5ITBZa0aHdzN5NHIm09m4tZOT5fW
	YlhEvI3x9TmuEBiwoo4zC27oHk2EBK4j1XqfsRWPFitqlP9kqx4sKR3dGPzbqHFLdjeiGZu1L+f
	Cy9EfLb8nMDrmzukNIOQ/OL3r2ZpA==
X-Received: by 2002:a05:6122:179b:b0:5c7:b165:7057 with SMTP id 71dfb90a1353d-5c7ed3cf5eamr10584511e0c.5.1788797153825;
        Mon, 07 Sep 2026 09:05:53 -0700 (PDT)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9808ee8039csm7688440241.11.2026.09.07.09.05.52
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 09:05:52 -0700 (PDT)
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5c675de8e1dso1675438e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:05:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzsAQHtkdJKtaR/JH4VURMJseUzpU4khFjk0LJ1GYeB2o/YB+bss075ud1fAUL7Hol49rcJjppIg2bDuh8=@vger.kernel.org
X-Received: by 2002:a05:6123:67:b0:5bf:b500:c4f4 with SMTP id
 71dfb90a1353d-5c7ed285aefmr10980239e0c.2.1788797151556; Mon, 07 Sep 2026
 09:05:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907153711.653861-1-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260907153711.653861-1-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 7 Sep 2026 18:05:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUxPf41iwq15WSMqWiTgi9XM3CXJeH_-e+FS0T3kDMz3Q@mail.gmail.com>
X-Gm-Features: AcwNN1Wm8DHsL2a0zy-uAEM1hkCTVJZKfNb68aES8fX2T4VBPEpycd5vofPPqGA
Message-ID: <CAMuHMdUxPf41iwq15WSMqWiTgi9XM3CXJeH_-e+FS0T3kDMz3Q@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: rcar-gen4: Add missing PM ops
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-pci@vger.kernel.org, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Conor Dooley <conor+dt@kernel.org>, 
	Koichiro Den <den@valinux.co.jp>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 7 Sept 2026 at 17:37, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> The R-Car Gen4 PCIe controller is part of a power domain. On R-Car S4
> and V4H, this is an always-on power domain which is not shut down in
> suspend. On R-Car V4M, this is a dedicated A2PCIPHY power domain,
> which is shut down during suspend, and the controller loses state,
> which prevents the PCIe from working after resume.
>
> Fix this by adding generic suspend/resume noirq ops for the controller,
> which tear the link down on suspend, and restart it on resume. Use the
> same PM ops on all of R-Car Gen4 to gracefully suspend and resume the
> PCIe link on V4H and S4 too.
>
> Test case which demonstrates the problem on R-Car V4M:
> "
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/pre
> $ echo s2idle > /sys/power/mem_sleep
> $ echo platform > /sys/power/pm_test
> $ echo mem > /sys/power/state
> $ hexdump -vC /sys/bus/pci/devices/0000:00:00.0/config > /tmp/post
> $ diff -Naru /tmp/pre /tmp/post
> ...
> -00000000  12 19 32 00 07 05 10 00  00 00 04 06 00 00 01 00
> +00000000  12 19 32 00 07 05 10 00  00 00 00 ff 00 00 80 00
>                                           ^^^^^
>                                     Class 0604->00ff
> "
>
> Fixes: 0d0c551011df ("PCI: rcar-gen4: Add R-Car Gen4 PCIe controller support for host mode")
> Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> V2: - Add TB from Geert for RC mode
>     - Use pm_sleep_ptr()
>     - Call HOST suspend/resume ops only in case the controller is in RC mode

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
