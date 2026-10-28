Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793154219;
	b=QlTvbIOEBBAt9yMcAA5BphN3PL10di+4e6HtfQD1cGtd060t5doODI254V2T/H9NLuZS
	 8dOOMApwOpJBI6+olPtU+5jXJj8QXXDqbWxeb9ASmKiiQxhREGPyG19gD9XXAmV73YRjT
	 XQG3SOzxY0tCALAVhF5K2xqmJEd1eP/v0IkxaFZyZR4P1+2TbDEMFu5wwHpHzhHn4Nq66
	 xCy3q+8oqMH0HHlyS/G4gpq9Rphw7vKBDVCNeMjsVGZgNvJ4yHJJKNOeAlHVSsDpkjscn
	 FvAyrPT1Cp0SkwQv9jsF6NZO4j47xDmyb0KVX4pYimyRaveXt/4mcPYQaE9yWEFzzFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793154219;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=NMQnf8rSmJb2IgSBV0OamLewABgq3/6kweCgJqa8h18=;
	b=C8LLhmCHVwSN3YtY7ucuLEO2zFL9VTQfj3Xi8ymy4awlqXCssQK1FTsMKteXdAgmonGh
	 4iBTlaeYZgPEew5OzC9haVF6GBMcp5+EzPMPA2axRTnkCm8N05NnmJfIpjnPmkSWdTwr2
	 CxLbiLBhOVAy0MRffusB1K786aNPFEMCf2PAxL7FueD6o9rOWqcCi2DBkWAiQ5ABnjGYz
	 8UF1t6a3bet0jY41yNdGOH5CPu/AYC0CPFuYvxf9bVQ5xJ/qitKv7u/XRyVuLUFB8hMEO
	 313Mo6f43MtrCo+z9nA3apiD8zQFIURqrhj+qOF7bOvy4HsRt95xK15wqlSc+T4CcgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vl1YUOqH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25B0606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:23:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C25B0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vl1YUOqH
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5ba3ec92031so784580e87.2
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 19:23:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793154217; cv=none;
        d=google.com; s=arc-20260327;
        b=qbnM1RdS6VT5WsXuvKd+fHGp93X4tzgRZXbWpJXaXKjHbsf0FX3ldmvL6+ahqmbRl5
         QliEwaNg4tGI+BG6IBylLuxPbCBdGbLlGqL7PN4wyt8I9HwG2WXVo8y73fFFGpM5Cqpt
         7F3wkAP79OsuNQYvCqiPu91Bzi/OpdqDMjIZWxfrZrOIw0BL+mjDuKU7jCzW+/lBV7IG
         V2dBkjeZXtqiWfSpbRmSzm7HOTTJTvOwQQJLQUT/2QnrTUpqVpl7J2TABpyFvu8YH2z0
         qFE9LYQORgom7zjp3TCW4kTtYo5PJadIy1U2SLA6yOndOxfkjpDoITnIZCQF18One1B7
         dbFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=NMQnf8rSmJb2IgSBV0OamLewABgq3/6kweCgJqa8h18=;
        fh=MBBXrRh/6FdPAKW9BnaedL1rw0Zk33+2/m2GOC3NGXY=;
        b=ldnkZso7qUxFJt/KdVGh+UojxBQ7ZXEY5WYSAKW3mfwkPGAGsEYLq2+3kBqQCvIZuO
         kmHyb5hWQU7cIVV2bDNTbw7Vaxh7NMhH/LZEypn/NFzzD6IiKczdmwp5/OKX8geV4lom
         FOFdbZwYqXdD2W7nBphuxlWJlXGRayv/md3tvjNfLuzloQ2B20ilGd11rM6+KsQ/r4L6
         l6Gopl3XXViL+y1we5VNgbejixLNkOY1DMx+/fhbgb8KSzbSe6bFCrc25gfDEKC0oKzO
         thJDa4dYTNzPxIfuLV5f8aACygHvUtOqKQoU26kahOStrRsHcNEvvv/4sVAHpPE9PWr3
         CfnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793154217; x=1793759017; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMQnf8rSmJb2IgSBV0OamLewABgq3/6kweCgJqa8h18=;
        b=vl1YUOqHGv4FSVuU+MpRsZ1orgmp7endVR8qRCJ+V1E1NYC+NqRn6KfHuCt5eg6qoe
         P/TLE3L5J2O1uCCame9lT4xTLMAK4LdHNenMrWcBRgHt2RUz4o4FTwwSGqdCtM3gLjy0
         HG3OmmGLMmG1H8BOWggBr+B5kgsnVZ31d0DfGU+yRWEuzKmGE6c9NutPsTR+Sf3l9M0I
         IBZdm0H3pLUMVHzvBZHtr1PwZ4Rq/EHJWkJqN1DToLKC+hH4EpTki66IDU8vO8HEDOHd
         HsJf1eZAC1QA7BgzfHBI9fe44P2Tvk/EVq75qC1g6bS27DphCSZvtihewxjqyiTmLN13
         3Znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793154217; x=1793759017;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NMQnf8rSmJb2IgSBV0OamLewABgq3/6kweCgJqa8h18=;
        b=uK0HxDD+2LzeHoib4gos+l3tR5Kd+Xex90qsN4MPg93pKbzV4D0CJ8TJyEvV28Yr3O
         ES7Jhvu+UW2rzqDUB/gzoY2qpWD5Jq6hLRwWt6IVyBswj131hxEW2KLuYpMO8KEo59a5
         hzoaW0DDd42fe3OGa7yQx8i8zp5KSEdWltm798M59F8z4ckqoSB1KZYZL806kavNqJ2r
         uyR7JwJszzbPJLe0djKsKnTbZ09ibxSVvvXH9IYHaaPJJVVwZdYR1dsaOp/PCdrwvxUS
         TWEeNezJSH2kslLm00bcOezLWVTDirA9oJaKdmRmyxizHwrPPAzGy6/yuthE2ZdC5oYc
         MnKg==
X-Forwarded-Encrypted: i=1; AKwUvBzoWV91EFxaiWV+3PzXOBFZGZskymKUOL1lWhIMixed0MCtiKAxKtxx8ZDjnJDZ380LAOxX88z6me+sM28=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4C4+mGstUnfHbY/cxDgy6fptvm6P/Cslo58dug81FH3UOCbGu
	UWIFsKYcMVTQJO5qwdg4RkUb0SKgVXd74ufwZ3/F7JWpC1Z0sHQ0b1Df9udj28Q3puN5I0LoPXd
	ikuMTi1O3uOa7Tt+cAuPr07cHCosn65XzppxIoKM=
X-Gm-Gg: AYBFou1kdgFJJgDnP1Bn4m25QFRkqid7CZboZQTUNpW81I6rF9PqOeHtf29iuyfzDcz
	gvF8f1xL4SQOzhh77l7HjLvx1cTrzkKEU8b5cv1ACj37g94KzQ0zoX0Y4PxoknFiH4V5z/KZ/D1
	TeIXOu/gfovs55JG6wC7SCXolmy6qfp0Vt23s1HmSv7HHW+hhHmLsQaXKqDVkTIKsrKR98rBg2E
	P0xArH/7luP1a95CBBZD45GrH9x2DnyOG/joBq09gX0mkg69ArOT03DsSnc1Ms9bOAG3VcATbu4
	6gpAuKdqcjMWhRWQsE4+joXLnmssfvu+n/Hw3cfxXtv7JEgaaR7s4HagabLv1ba5wdAaXTh8bHn
	NaRAjcKKdA/2oTNCoGO6fTU40/Qu2cskMct16spgoESBkYtNT7nngzw==
X-Received: by 2002:a05:6512:1393:b0:5bf:b144:fcbd with SMTP id
 2adb3069b0e04-5bfcad56697mr450920e87.42.1793154216891; Tue, 27 Oct 2026
 19:23:36 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Sergei <fistboom@gmail.com>
Date: Wed, 28 Oct 2026 05:23:25 +0300
X-Gm-Features: AclHuK9TQ3jlszcX3q-6jan3r7y0WdMtqLdNNTXDdvzhKovX-HpF7W_fh9oyHSI
Message-ID: <CAD6ZPytCGim57_DthuUhM2cnqG9iCJw+yP=5v5btQ4cE7JBteA@mail.gmail.com>
Subject: Unknown NMI after resume from hibernation: restore kernel leaves the
 NMI watchdog counter running on CPU 0
To: rafael@kernel.org, akpm@linux-foundation.org
Cc: pavel@kernel.org, TonyWWang-oc@zhaoxin.com, peterz@infradead.org, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

I'm hitting the problem Tony reported in July 2024 [1] on an AMD laptop,
and as far as I can tell it's still there in current mainline, so here's
another data point.

After almost every resume from hibernation I get exactly one

  Uhhuh. NMI received for unknown reason 2c on CPU 0.
  Dazed and confused, but trying to continue

somewhere between 1 and ~130 seconds after "hibernation exit". It shows
up after 25 of the last 28 hibernation cycles, always on CPU 0, and never
after suspend-to-RAM.

Machine: Huawei NBLL-WXX9, AMD Ryzen 5 4500U (Renoir, family 0x17),
BIOS 1.07. Seen on 7.2.3 and reproduced on 7.3-rc1 (both Manjaro builds;
the only taint is U, from ryzenadj writing to PCI config space). TLP is
installed and sets kernel.nmi_watchdog=0 at runtime (that's its default);
the kernel command line doesn't touch the watchdog, so it is on at boot.

It's the same sequence as in [1]: the restore kernel boots with the NMI
watchdog enabled, programs the perf counter on every CPU, takes the APs
down and jumps into the image. The image kernel has the watchdog off, so
nothing owns the counter that is still running on CPU 0. When it
overflows, perf_event_nmi_handler() finds no active events and the NMI
ends up as unknown. After the wrap the counter just keeps counting from
zero, which is why there is only one NMI per resume.

Reading the PMU MSRs right after a resume on 7.3-rc1 shows it directly:

  CPU0:    PERF_CTL0 = 0x530076  PERF_CTR0 = 0xfffe53fa3a48  (EN, INT)
  CPU1..5: PERF_CTL0 = 0x130076  PERF_CTR0 = 0xfffa...-0xfffe...  (INT only)

Event 0x76 with the counters sitting at about -(watchdog_thresh * cpu_khz)
(23.7e9 here) is the watchdog's setup. CPU0 had about 7.2e9 cycles left,
and the unknown NMI came 69 seconds after "hibernation exit".

Booting with nmi_watchdog=0, so the restore kernel doesn't arm it either,
makes it go away: after a hibernation cycle every PERF_CTLn is 0 on all
CPUs and no NMI shows up.

I don't see anything in the resume path that stops the hardlockup
detector before swsusp_arch_resume() (resume_target_kernel() only touches
the softlockup watchdog), and the two patches from [1] never got a reply.
Laptops running TLP probably all see this, since turning the NMI watchdog
off is TLP's default.

Is the direction Pavel suggested back then (suspend/resume hooks in the
watchdog code) still the preferred one, or should the restore kernel just
stop the hardlockup detector before jumping into the image? I'm happy to
test patches.

[1] https://lkml.iu.edu/hypermail/linux/kernel/2407.3/01199.html

Thanks,
Sergei Gorbunov
