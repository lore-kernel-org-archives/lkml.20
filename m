Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793257426;
	b=1os2+Ke+ogKyfxh4HHXLsMQzaY0916SBsTu45R5ncdKSR5l66E6WN9VOQ2dFs/JzfDeo
	 a/TN4U/xIF79KC6yaDqMVCTpMaEd0l8d7Qar8daiqfPpDMMJvMYZvHlGInePZJfDSlR+y
	 EUHb/Wnpy4vwbC2AemKW8WBQrPnju+M2DX0SMcfaRZdqK0aw+olq11PTW6fk+kTmVVTVd
	 aXT3E6dMoRoFg5k/dx1hU1VUjDceUh5bOCWeOC45HppSDTWfWfrU5R7xX7HNnzFVw+47U
	 HsuWgtMUSHieCU59oDZc+BP9bGKWVAeeg7HWR/sewcKettxTO0xdlbOet4mWM2SBIoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793257426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=Wmh5BqCIN24Z4d1WjOHMBcROEM2qdMCDw1sDW+ZOtlo=;
	b=G0rJsk7R8gXaT2Ay9Rx+c3WUTMclR2cpemhwnDLlCHxNQ5m0rgRX1PpK+UUUUFIhCHK3
	 yUSsoUmZHiaYF5LVYPVPE2kczWKa13kHcOxbaTiDtRk7aPJR4Wd09htfDKsJpOkzkrJZE
	 V9GFff3/EoLhDt47kaW3WYNxOEfIwi3IwAcmP2DuX4Ij9fLDU1M5D5qkzvg/SrBKsyX6Z
	 zwcLZJNoDsj17mCpYc9/cihUsfLYljDWmMLUS2b24jn1+PvA2bvq2yzY1rqUlaP9knZO7
	 8JcpG1snf/l2TZhNJYEsCAiKwmxKkbrpPcXXrdUtUwOBcVyXrXnrMqLicd3wKeLPIdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tVoz7AAZ;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9B606A336
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 07:03:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAD9B606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=tVoz7AAZ
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a07078200fso930203b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 00:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793257425; x=1793862225; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Wmh5BqCIN24Z4d1WjOHMBcROEM2qdMCDw1sDW+ZOtlo=;
        b=tVoz7AAZ2irYMShZMaLIsF5JObl8tVX05MXEr+7X6NZL7oQzJRwE/T4RQT0Q5XhSb7
         0WarkG8+k7hXbq/M3zpu2WIEPAA5uFzr4bA1K+GRYBswxSOA01ZCHlOb/GPPPxddNuTA
         FV4ePeWDbuZcfkg8zaUQVPgVlqDhqsABdeS60=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793257425; x=1793862225;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wmh5BqCIN24Z4d1WjOHMBcROEM2qdMCDw1sDW+ZOtlo=;
        b=vGmwcqE48dohqI4vnf29Gh/+tPaMumFFrQg4iKCuSStVZ3oC/hUJsjg1Xjk/APUmCX
         D8Hb1qpwXmF4LQ58VRgaLcMl11bSNceU0E6aLuvMlZi8Oedk0nGW2I3ZQGUnBF4HlNK/
         r30Bkyyy9/P78vp6KiW5JDy9qDpdzMJfM0CqQVDgZwKUYHXkMv2YLOadr7Ax2fD1w9dQ
         BKGmRBmYJgLo42xuAFBQ6NZiiBj8CdiDDN1pJ3pJagA47ZBsGGnXd+cqrPg+OLmQGvxK
         WbYfpIQ5UxVgqyxhIlibbo+0e8TOjO9+68QYKPDHVYrD17p/1no17tduNzN8U3Ze5xEB
         s0Cw==
X-Forwarded-Encrypted: i=1; AKwUvBwz3EeOXblBd2nh2uO4hfuSzAeLfZ2pD6DPeb+itZmg+fazd7ClSygmviL3TqFe5pFBv0LdpkuA78+TzL8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLAmtcIIz5HuQcn7ykEA5Mu/fq0SKgko9yO2XHtYhxkz7bqlwr7
	DBtG5KSaPO2VlYgX5MkNHPuNsqDDo/nUbLvBXiKhXY77NF4WVly+8cRl/zf2DMXy1LQ=
X-Gm-Gg: AYBFou3TV2wkMcqMXfjKKoUVkk1xWvhs7BV9W+rfHgkQcG/Eyj5A4w/ZjdapQBNVz6x
	IfTOOgMAwuSzESpjTYNU0/JUT6uCN/eGq/VJDt4p9l3PFCL/UfRUALJvuIv1xZsoOLOtBCLrqN/
	ClxWDdOl3vrjJuAxKFOkgG7Lzf4iDuQyc+L/sFnw0wA9k5R47hMSsKYOhqEjkJ0gKl0ahnxpCfI
	8tsmfpVX3UQSqi0Dhft6d3iCPVx6AZ0LQ2F5MPVyyh/Gfw9ZTqMv+TtGLWoiloI47jrio+Y3Unf
	6L493qEIa8wXTDxPiaytywdhF7CzKAHnMte7DM58q4i1I2DCLTKcMafssV6ov1RLvaQxaurL+o4
	34AKXjgnozabk0M0nkkOqyyW8blQ5N/90cDXkPEfA22jDZiXc3awoV5M62xTV6rdnnokFR9HZEi
	YO7xoWtjRIoR3iFkXBkxFfahJxLGJKjV/Z9bvGQcRY/eIrDofFwT/Sl1ihfXpizHALhQJjTrU4r
	2tU8nW8CNDuxCm9nR/HLGHEDBRkhGTJRaC0awm/5xxUZnyV7vYdoxRkVKOpZ7JQN+b617xZ3ip1
	ixmBVINmlJlKUqUfPOVmV+LpSFeSb4s9ZmFRa7Gjy5547s93XdTgP9ocP0VGRL1Pvpz8WCuEMFV
	gCayoVmeBnf8FKpVmALMV3p0eOkX/1FP8dhILPd2YcDFDAyeNQ7znxkXojVOin94ZvZwqnjok
X-Received: by 2002:a05:6a00:3a05:b0:89f:7ed5:865c with SMTP id d2e1a72fcca58-8a6e72dace8mr3884111b3a.9.1793257425056;
        Thu, 29 Oct 2026 00:03:45 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a3d5bd52sm1949028b3a.8.2026.10.29.00.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 00:03:44 -0700 (PDT)
Date: Thu, 29 Oct 2026 15:03:39 +0800
From: Chris Down <chris@chrisdown.name>
To: Petr Mladek <pmladek@suse.com>
Cc: John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Naveen Kumar Chaudhary <naveen.osdev@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 01/16] printk: Rename struct console_cmdline to
 preferred_console
Message-ID: <auLvy8826MGpqeMI@chrisdown.name>
References: <20260929120546.328616-1-pmladek@suse.com>
 <20260929120546.328616-2-pmladek@suse.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929120546.328616-2-pmladek@suse.com>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Petr Mladek writes:
>The structure 'console_cmdline' was originally intended to store details
>about consoles defined on the kernel command line. However, its usage
>has since expanded; it now stores information for consoles preferred
>via SPCR, device tree, or by particular platforms, e.g. XEN.

A couple of optional nits if you respin:

>@@ -2633,6 +2632,10 @@ static int __init console_setup(char *str)
> 	char *s;
> 	int idx;
> 
>+	static_assert(sizeof(preferred_consoles[0].devname) >=
>+		      sizeof(preferred_consoles[0].name) + 4);
>+
>+

Double blank line here which checkpatch --strict is not happy about.

> #include "printk_ringbuffer.h"
>-#include "console_cmdline.h"
>+#include "console_register.h"
> #include "braille.h"
> #include "internal.h"
> 
>@@ -362,9 +362,9 @@ static int console_locked;
>  *	Array of consoles built from command line options (console=)

This comment still says "Array of consoles built from command line options 
(console=)", which is exactly what the rename is meant to stop implying (as in, 
the array also holds SPCR, DT, etc). Could be updated in this patch if you 
respin.
