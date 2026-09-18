Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2A251814A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 18:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789757198; cv=pass; b=b/lH2tVdDPTgRHc2A239umc/tAVeqPW29W2qN44FvSfpAysku2oUBPofvSlTxx+BtH6ydqmpm3Ebu5U7HyDFYry8Z4LBP4xgP/BEOmHvAkaOdHh9RgsogMB4kpIN4ePcRuFSxsOVptvtRjLrF+IjVA75SvAmSFDHlT4zL8r41gQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789757198; c=relaxed/simple;
	bh=4duNaHN9/gEp3EvePgZDwc5W4m0d7tf8MXPsQMuq7D4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eJMuBrd9jhsbJJjPDdBBd0NvS48vp01sGWc6o+7o/va3hfdTYW/vc2eO+u09paIZb/iekPbwyaRMj4AdZwCKN89+GvGUiBd4KWq0L1NANvHt+NatDRS3tSXUAb6M/ssUAD565C8nzR/zqUlgHFd3Lyfz5NL7PpcLPGTN+iHdIX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d9iZYe0d; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d9iZYe0d"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334ddcso9658045ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 11:46:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789757191; cv=none;
        d=google.com; s=arc-20260327;
        b=XQIVbjCwaPLfDG5CgW943pI3dErBtt20SMDPq5hQmItIqS2IQIszr9xwpifgoCZ5S6
         VKGMd0YZaJ+lCRecYjJxh0UOD7F4iGF26UiZZMb/25LH7klksXW6Iw5X6VlzQpJmOnST
         q4S2mqmfUco34ohvDnEzJiPY4g/eX12F3WP4VKpnwZvZ1FUmxoWW9NyF/NiWF9tzu43a
         H0XaKO5y5CQlrVtf2YozsdlURfBSwU+SaoHxcz76i1N1YUjd3UPltrYLOay1S+PGNKO4
         AY1hh49RE/Z/3m51EjFblcV3tpfhq0CsjrlHFFlC8zZ8H9/1+WU1a9zxzF5P4hiPk0yi
         ltdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=/ee0VLvUQixFCPQpqE9NNQ1XD02eR2naqEmOES62VP4=;
        fh=vwDH5esIv0YbQkW2qmzax9Xj/RMN9t1TZ21+hLYHk+4=;
        b=UaD6hqf6QjWsvfCSyI6eprRhsmR+HJTqoUj6VRclrGdUDTmoItkNq5SkUkvADGyK+L
         myt5gyD5Fn1le1Wblt8kLX82004hG8waZ6bzKzIXQPzv9G73wgeShZeuTjGYrttD/58f
         ahwFgddpPEnMVIeD23iLUjYR4yJpWTODSabJua+DGGKQ5EyBpg7BbzFeQUT7Ld1cvtka
         EyziU6JEWCxetvCM5uzCuRiF7Dg5EvkPT8UkSeOkQzMXq2j/7FPWKDiRhMjGh27fvhSV
         f71Pebj1BtyOrY84ibjbkHGZJHQJ8GtHLrfO8ehZw/tJiSlx7eVTeakDdlpv5lC06GAY
         OSIg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789757191; x=1790361991; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ee0VLvUQixFCPQpqE9NNQ1XD02eR2naqEmOES62VP4=;
        b=d9iZYe0d9iH6GNh6RocHrszNT/PXOoXhgad03erYEmcUbMt2nZM2ZsYVki+qz1MSnQ
         yLUZ2LDJd05QK+/DuSnVL1EzKwNoqMPY+TKkB4qzLmyV0fZcmN3dpNZgSqBNhzFjooJ3
         u73eZg69GLYcMrxkk8nd9Ap8YuZAwb2c+xd01f4N4mwwx76ardVla5xy3ajbDMhUbj5C
         yAPleRPGegdXZTKUIWyQI+KUOHPN2il6NJwtJB+3sYiN+vFOmAEE/ERCRD4cfyQf3zn5
         q/vlqqJfIugeNGvf+Agq0GoptMs1lZF1A7/9k/AtkTLIIArtzjIAkmuBe9MdvUZJm19t
         j62w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789757191; x=1790361991;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/ee0VLvUQixFCPQpqE9NNQ1XD02eR2naqEmOES62VP4=;
        b=Euc/WkNvQ1GoumbiJRGh5+ll9O8wd2ub39fykSJJSknJMU/IgUEKNlAJ/g+qaxsNUV
         z6t9mIdKydNx/Yey7tmbvM/GmCUtimnDYUYKJ2/iSEhENvXgXOlmRkMmE/HWYpQmiUQ0
         XlONbBpueX117vrd5tEneQbv2eJjrMX3E8mhPFrZTfDDICPARuqjhPRo8aDiaU0hM8C1
         KusYKMSgrscSq+6WAheLX1NI92Lm01jceiKg6VImtsXIc8ko8zLHddTR+mGe5B1YK6E+
         19oFQpa3XBC45TWJiG/F5fcB4hd5Fq4OQfJVyNUTJYA3nds+VlxbPLULrmJrQdCyDYFc
         Pq7A==
X-Forwarded-Encrypted: i=1; AKwUvByx3mPGzxSCJxUrBbnKkrbh5SGzp01LBxiu5R7IiR6JmE5WjJT+mZhUbB0NWkGtUOGrk3FxiMfEkXn2iQ8=@vger.kernel.org
X-Gm-Message-State: AFuF++koJYm7DwfkzUOj1KylQNyVEju6d+bCvPr96D/vfCEm/CbqlVwh
	w4KNsV7cr+6vF1cX34XG3T5PrqJ8CgMxxuRe5KPLAuQnM5R2c4fQRYKeMWBe7Fiyf5LCC1v3ocz
	GS1CcgDdzsKAsXhmDek7t/FYlp26TcOU=
X-Gm-Gg: AYBFou1MjGEeW95Pf86JJp7BEGnMeLpsxGA91nlNRacl4ursWzTvOeypmX/F989/+95
	ClCvx0SOeiRJLzTfpEZOYsS1OlTQmyIFZZZSKCGsdLVQKNGel/AE6XdSdyM2hivzmELRVHWI8nx
	o1OoMqVOkGeUX62fk0Ksei00+KINbkRuT/sPxqkpDQ/6DeAST3CYNbZeZ5YefWUVJApQnbPHaX9
	f+bWRQy+YCXtxcUqm2NHkOvTe1CX/d2th00GGK5YJGECss9PRzFCDoc3perGGprziFq6fPntl9t
	+a82jJP1NFFoq6CWE05DX8jqm8mOQ3Q9eUvFT6fHvB7H3ENhpHofQQjhIvSnRTwNnL0GPlGllqU
	wuNxlJSb16ASDsCjUph+8xtSaM4hFGWUnw8RkfTgbjLXMue4qnUip
X-Received: by 2002:a17:903:2350:b0:2dd:4168:7bd3 with SMTP id
 d9443c01a7336-2ddb1adec54mr73782955ad.12.1789757190859; Fri, 18 Sep 2026
 11:46:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alexandre <alexramos25.pt@gmail.com>
Date: Fri, 18 Sep 2026 19:46:20 +0100
X-Gm-Features: AcwNN1XzdrXmmyzr9pRgsPQEm8D00FcQ6mRKJMpf55bVhtoeYZ3E7tCHrzwipL4
Message-ID: <CAKw2PKFc-OtXxv++3VDSaW_LUh5T0asEjbWiwz1R5Ai_KvL2dA@mail.gmail.com>
Subject: Question about "intcall" function
To: x86@kernel.org
Cc: tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

How can a 32 bit C code call 16 bit code functions without any mode switch (CR0)

arch/x86/boot/bioscall.S:
.code16
.section ".inittext","ax"
.globl intcall
.type intcall, @function
intcall:
/* Self-modify the INT instruction.  Ugly, but works. */
cmpb %al, 3f
...

arch/x86/boot/video-bios.c:
static int set_bios_mode(u8 mode)
{
struct biosregs ireg, oreg;
u8 new_mode;

initregs(&ireg);
ireg.al = mode; /* AH=0x00 Set Video Mode */
intcall(0x10, &ireg, NULL);
...

Kind regards,
Alexandre Ramos
