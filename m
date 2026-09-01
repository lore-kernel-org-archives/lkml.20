Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415CA3DA5AF
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 13:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788268324; cv=none; b=P5hBY5YPMSVeteuRec/PWVsGHlR9Sv4pA5dX/HMgh6YrJ3LlnWZAkuE3odkfsg2bzkrPH5bdAti95pzIkwyorWhcHpJlYWjpq7UvfO+omle9dlA9af8fN95tB0O6DuOT4ZXGbRaj7xaJziZrqT2K6M7sXBXxrB7r2rEsB9r9D1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788268324; c=relaxed/simple;
	bh=BEQHcv0SwOWfqWBbiMMeuyvPZuGnMOLRaO8xtQvMJ6E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GhVFXfVq/FdjVEkI9fImAj+fNURAafoUa1EykzAWF6r0QfSNNm1ic7ncJEvs85Wa+FevK42y5eKdj988vb0LJNIoLZ0clvgjO7Kxic6aWFtb2Ogv/RAlSpX6N4i/xuknjhYRCe5Zl6Oj3CkkB0zM8OY4k1k9eAF0Zji5bsPpAGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu; spf=none smtp.mailfrom=monstr.eu; dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b=0OxYaZra; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=monstr.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=monstr-eu.20251104.gappssmtp.com header.i=@monstr-eu.20251104.gappssmtp.com header.b="0OxYaZra"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1712a04ddaso772244266b.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 06:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=monstr-eu.20251104.gappssmtp.com; s=20251104; t=1788268318; x=1788873118; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+qm0atGcRQ+m4mNANBodg2h5SBeTwTO0/1aSqzmk48g=;
        b=0OxYaZrafAXF0/ZDa7ZW2ENQz7tVobSOZno3z3qmC39qt2pxX9pYp/22udIEihCxi5
         D+wajhyPdM8yYsxPIxhGbXwEpHjc1LdvFiXjtrEfmqQVMtaB9wTugLp0a3ku/jY5DUK8
         jNOczzbmKawfk9ZQttl9llWC2TDWorzXYG3TYw26jGnSfa2A3mnywcLAHTzQCX6dQqxC
         9+2SQjdpB64sObYkfQ0QF8CFeP4BEGnN3ZsKspOjQyMi4FqIECyV8/LBnWJCz6PMLME9
         SmfUILCopourFAHo7qlPY3DhLJWN36j055G0pjJpaLzMmdOpB5zhvVS+EZ7bhW0PFPkM
         sg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788268318; x=1788873118;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+qm0atGcRQ+m4mNANBodg2h5SBeTwTO0/1aSqzmk48g=;
        b=TRPRbighSkBK4f7dsP1OHka/AcTXB8ZHHOmfu/hyYBcuhShIlvW4gk2HXzsX0M97Jr
         4EB9Az26+5we9GfEYggeHdvp6WYN0qkLhZJAI1wUh/Uokx8eJe+XY5TUom7wAV0v/126
         34DNM0YQL+mVglt7lYYVWQyrG20aTV/Ogt+aj2B7dT+8ai7q8zDlxdqbii+Z4q9JXMx9
         sTp3fY9dOxQL+KYNG+mCm8zTfULKXQkSTgvxOVCB/HEwI1lasmbWZXKCeDemuYGXGORK
         ElQCcESwcl4XIbIQUEghlPLGU0Ijehz7vvJTOPGFHjmtgCClGRK8JoQY9BphTO06BE5V
         geqw==
X-Gm-Message-State: AFuF++k27IO0TVsyPphJ7Wf1IyAg6UTlfMvZICd2wGQmjjNpTjnJFqhj
	pn7ObFZgqCwVdLC39VyzS8DDpZDYNSw/Hra9gqmZfvLlyKkiO6AoWAuqiG1aXIyaWg==
X-Gm-Gg: AR+sD12Xzqxsfjiar+RME0Lvt39p+uh+M0S3nhCPTemDoY/Oc9OpQaVCCJHTK8553b/
	wAkQ6d5a3TB6FYYo5k7YgzMxEw8j1UpI5n9+zF5mxDxVH1hPcKW+P1bbUDuGv6brZhe5oVzH6NE
	PZO/lNSOMkwYXR+VTf078Mk4NH8bFwNIhS2zIJQYlCLqgtjfWYJLV23FK8VfBr1Zm3ITmtReUGR
	+l4bUM2I1LZOHTERHL1kx3DwKazoGu0SJx1xzgKJc8QIoiPkgSxo2fz2KfyQ0GPpFS0MGSHorS5
	I0O7xyLT+Ol10Z33FuIaXX4EMleQuX5Wys8gdwr5gHzsttlxyjmGj8COV/R6XXKL0FERvKqjawP
	a1pnqfxXxFL0eyf2r0WK60qof6DF96cRUZT7+J0NVYfQr1877sttszU3BS57wOFX64B4AfTKWkK
	iUIJrgod2J9ztBNLz8arZOHIpLpO05n5iPZrIF+pwO2V4J3PZ4ezjJaakVqeW41zJwpxNIWIgXV
	Pj/hOVXxxKNWjMJX40XEsl31QZOCDtGVKh8
X-Received: by 2002:a17:907:6d15:b0:c19:45e3:2f57 with SMTP id a640c23a62f3a-c2556dab2c3mr2230345566b.9.1788268318186;
        Tue, 01 Sep 2026 06:11:58 -0700 (PDT)
Received: from [192.168.0.105] (nat-108f.starnet.cz. [109.164.53.108])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255f1facbcsm578485766b.44.2026.09.01.06.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 06:11:57 -0700 (PDT)
Message-ID: <4ae62e1a-36a7-4d2c-a3f2-ecd09b03462d@monstr.eu>
Date: Tue, 1 Sep 2026 15:11:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] microblaze: prevent ptrace writes to MSR and pt_mode
To: =?UTF-8?B?SsOpcsOpbXkgSmVhbg==?= <Jeremy.Jean@oss.cyber.gouv.fr>,
 Oleg Nesterov <oleg@redhat.com>
Cc: linux-kernel@vger.kernel.org
References: <20260821103026.3627292-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Language: en-US
From: Michal Simek <monstr@monstr.eu>
In-Reply-To: <20260821103026.3627292-2-Jeremy.Jean@oss.cyber.gouv.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 8/21/26 12:30, Jérémy Jean wrote:
> arch_ptrace() accepts PTRACE_POKEUSR for every aligned offset below
> PT_SIZE. This includes the saved machine status register and pt_mode,
> which are kernel-owned execution state rather than general registers.
> 
> On return from an exception, rtbd copies MSR_UMS to the live MSR_UM bit.
> An unprivileged same-UID tracer can therefore clear MSR_UMS in its
> tracee's saved register frame and make the tracee resume in supervisor
> mode. pt_mode also controls whether later entry paths classify the frame
> as kernel or user state.
> 
> Reject PTRACE_POKEUSR writes to both fields while retaining read access.
> 
> Fixes: 2b4384542691 ("microblaze_v8: ptrace support")
> Assisted-by: Codex:gpt-5
> Signed-off-by: Jérémy Jean <Jeremy.Jean@oss.cyber.gouv.fr>
> ---
>   arch/microblaze/kernel/ptrace.c | 3 +++
>   1 file changed, 3 insertions(+)
> 
> diff --git a/arch/microblaze/kernel/ptrace.c b/arch/microblaze/kernel/ptrace.c
> index 236264e932d6..ac1f0503216b 100644
> --- a/arch/microblaze/kernel/ptrace.c
> +++ b/arch/microblaze/kernel/ptrace.c
> @@ -101,6 +101,9 @@ long arch_ptrace(struct task_struct *child, long request,
>   			} else {
>   				rval = -EIO;
>   			}
> +		} else if (request == PTRACE_POKEUSR &&
> +			   (addr == PT_MSR || addr == PT_MODE)) {
> +			rval = -EIO;
>   		} else if (addr < PT_SIZE && (addr & 0x3) == 0) {
>   			microblaze_reg_t *reg_addr = reg_save_addr(addr, child);
>   			if (request == PTRACE_PEEKUSR)


Applied.
M

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP/Versal ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal/Versal NET SoCs
TF-A maintainer - Xilinx ZynqMP/Versal/Versal NET SoCs

