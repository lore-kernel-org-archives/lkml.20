Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794505265;
	b=eg38S7OlIEv7v1KkDyrAxEIyu7YcxkPaOEx9oLc9VdR0FnGFs4NyMoS3a6b4kY45LU5W
	 /ujJjjlwpYkGehpGj2RQr136WTfl5Fvoe29Ku80XcEqgSgRFSouBtbHoiGmQ5fSEbBgTS
	 gIzJrttu8aBLpTTLKaggJZ6FUWsJFrB5emakVZfckSq6VPz3CTPKqNy9t01DEp6btd282
	 XXBKXhZiWK5Dh5GDaKIubjILU1zJPCEoOc5d+HlYBI1piuKMhCyOLS9+AYXP0Y03w8LPs
	 RbrNFqkmBxpDNOv1ZYw2Tj08LqtOE9j4Fy2K11H2J1Tas/cC2CkvafnYMOC9YHlg7pw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505265;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=gulIbZCmS0C3qCKYVEzdG6nvB054k2W20/UwIzcuJw8=;
	b=BD51+orihGTY2m5xanQhRNo3AM8nRLbWmqdFSCK9fiJxptGFulgoivelEx4sLEm6+mQr
	 4SsnHi8wxmJLNBXSTvtnHN/gcu0voqfBbKDO2PPZ2fjr3pkirqFRO3hflHUY2opydGm7H
	 ye/dGcPJZgiz6iXxMBGY0SAReazG4rpiLXjagpjivazkq8Lk/MVUwlgiFu1usEMWQMuTN
	 zKidsODkuWkwH7yvmbcpo+2z7Mi3aoZaoEySX7kTSj1sfR+K9FpN8Fj84GtQ7sgn5vf2k
	 myhIo7hOf3zCveElrX+c6lhCCbVJRY93MQdBPfsBbM5Bx1dykmqZ2xelYNGP8u6a5zw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sc7BXgws;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FC8A606A211
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 17:41:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FC8A606A211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sc7BXgws
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b7bffb5b8fso73680a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 09:41:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794505264; cv=none;
        d=google.com; s=arc-20260327;
        b=XUiX3PaWrAVXrTK4r5vddoqA65fr9dBpA1Cgc22SnAdX+TUbuc728eTxvF0dJL2q4D
         /C3jr5kY//DKY94IiQ87CMWQr6i4lPJxjvKJATjCEt9zDNdJ3elMn1cXXhN9cWxF6swo
         SYp8JvjnoTuVzRssjO+XZKRv5QcW1DwG8at+vaL+doNDQsxfacqbIFzg0srikt/Mfzxf
         OEmS0KscNjeGUD4g17n6TnfgzTPouZU6P74K0FC5xZ49relx93CTOSpCsnlleakFfvI6
         A7jiZbN3YMdhC+DCbAya2GggfmRK0NJOF4tI3y9wtZVqu+SyfChWA7EZC/Lrgsi9KMGA
         qfXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=gulIbZCmS0C3qCKYVEzdG6nvB054k2W20/UwIzcuJw8=;
        fh=/4g8Apk9QPIauywrVAiC91D2X8T6M/pun9T1hjklKSg=;
        b=FgYy98zcHqI+Wqkeofq+4YgxCdNyzrOce33vkx7oe6WNTwX/AIDAwWoOUnMSJN3qsT
         ddqqWrKGC++pwBaeca4Bc7P1+bjJMFxPAV3wwS/+fPMXwojtl5lP3ln7V0OPUaQdXNNH
         cifwRmVPXkicbm+tK5E4nHHYlud37Isf/TZNtwiiaEc4qXbNVaYus9nyQ73rtbKJ9fLt
         4HKZ2qOh+IycOtqVzC0iI+85hE+0rv2+iijfZPxRo2SWuM4iS8m+lyxMQDcG9UFSCJO7
         X/msAd21bCuTgUdPs/7829HBjGfk9MpnntTvSH+4X0hC7esFwwSEaCyopWtT4WJy1Yyx
         MO4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794505264; x=1795110064; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gulIbZCmS0C3qCKYVEzdG6nvB054k2W20/UwIzcuJw8=;
        b=sc7BXgwsB5JZBO86kgULdAnyoeKRHiO1bT0dST06bJxLHTE1zKiyi0diPhAoS76dPH
         Xfdwx1EYriLeCp+wgu6fTHPhnJK7FPUC2LWtlecK5u+c1aepeVCT1DQMdNr/0qPlRw4i
         YcTJOw26JAxt7QO3cXUj3jm07IERGMmilxTPNTs/6HkAPhdk6Q4MD62uoKmtQH2QEQHQ
         9UO7Hl4ZwnV7mAbX0mDG6TLKCgcnw5CkaQwXlrI8A6CnLp4uFsnqzPZiUix6N501VP4j
         Qvm9+ZHAtb+oc+E4joACDNBKoOwGTpp2mfMwucnh6PRh+J64qU6WBmYCZyavrVEFu6dE
         wF7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505264; x=1795110064;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gulIbZCmS0C3qCKYVEzdG6nvB054k2W20/UwIzcuJw8=;
        b=Vfyjn+tgEf8tf+hiVFYIzdiAaDKA0C7vGs6HporNFI6QvKZ/wFlC0wKNoMozykxv62
         Owp/PwOvpMpSZXSTikUPAYv6r0g8LifQUS8llXKgDN++L93rT/Cff3acg4cmYcANTMCB
         aMqUix+HyR3AbKTNa4n3V9u6OKrKfNxSNQO1vOKnQ9UZdD+S35Tof8fBvI8OpVDzB/2B
         YEzeaKU+zEqjutMTExQx705b8DlRyZCrzliF29ZTyNW03sVgJ1heS/MfEFI4rpXNe2fI
         8BUktIWNFZgl1rNTjL9dgc9+fJ88pOFWGUu7UNn4lkKL8E6H79d0VwvZi207xD/Ydc/j
         X1Tg==
X-Forwarded-Encrypted: i=1; AL+hErFPilZPIaYz9ImAx+aBYMSyN4yDLdqdCB0FHbni1fGDwTEsGuaFRU0WJI6DjrYVUcSGna+i9XyuJ+djK4Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z/quB5QOJvJlI9TcWUm2Uoc979tKEQrseWsWAKJLpRo/NstPuB3
	4KPN3g8f762N6u73Dg5TdQ5A2LrwAUO2koQujgwazvpcUHSj7afRM4h8s7F+fnJoB+xjI+++ySV
	0DYGYLSm11VSUR6iYuYhAL5Te+LIJ4IY=
X-Gm-Gg: AYBFou0YssqBzOnpIzN+J3CPhQiAJrxF7zV6NqttTfbOxrwlOzY7KpwG6Hdb1mEWMPC
	V9PJ43Y1iGCmdlAc/2ZECgeywaHVSCL3wPfGu5n0ypPDA6sg0BCX7+NtKkweVDWXrR0uCrmOJY/
	TFhy1LnJFp7EQ4qto+D6h/9KjD3RE2MtzCOJdl5PcxqrJXRJu611B87GawZM5j2B1A0ZMv6fKob
	LUFZy/PeUOfPWF9CGsIo3BOo8Cg0RJjlWpS459WJ/cKbaJieAgSFkMAP7cP2Qtj5hB1/ivzLIJX
	a3/U4Qri61S6B8NKZp+q+IGqBZuzefxvtG9v7bbGWlx3P34aow/w7P0DJWxINfc3Mj//6LyBKwE
	JTZ4rLZ4ebryu20i62vAAZ+AGAFO3YPnoH0N5TOFH8Bt/y3o0kMjI97c8xHFA33C2JRaaeqW+o8
	w+T0pES67zcQ==
X-Received: by 2002:aa7:cb59:0:b0:6b5:767e:f030 with SMTP id
 4fb4d7f45d1cf-6b7c088f8b8mr247576a12.2.1794505263516; Thu, 12 Nov 2026
 09:41:03 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 12 Nov 2026 12:41:02 -0500
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Matt Salsamendi <matthewsalsamendi@gmail.com>
Date: Thu, 12 Nov 2026 12:41:02 -0500
X-Gm-Features: AclHuK-rzhfZstrK9oYTveQMuv2rKMtHi1eKCo_ucxE8NDs7sn-o7nsC2VQ7AeE
Message-ID: <CAMPWk9NE_epOdOCbs1PGh8OQP4wjTObvjU-1Wopmu7SSNAMXhw@mail.gmail.com>
Subject: [PATCH] fs/proc/task_mmu: fix stale walk_end after a completed scan
To: Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, Muhammad Usama Anjum <usama.anjum@arm.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Matthew Salsamendi <matthewsalsamendi@gmail.com>

After PAGEMAP_SCAN fills its internal buffer, a successful final walk can
leave walk_end at the earlier stopping point. On x86-64, 513 disjoint
written pages return 513 ranges with the last range beyond walk_end.
This trips a bounds assertion in a userspace dirty-page tracker.

Update walk_end on successful completion before replacing ret with the
range count. Preserve the stopping address for partial scans.

Codex assisted with diagnosis, code, validation and this message.

Fixes: 52526ca7fdb9 ("fs/proc/task_mmu: implement IOCTL to get and
optionally clear info about PTEs")
Cc: stable@vger.kernel.org
Signed-off-by: Matthew Salsamendi <matthewsalsamendi@gmail.com>
---
Validated on x86-64 v7.4-rc2 in KVM: all 12 scan cases and all 119
pagemap_ioctl selftests pass. The unpatched kernel reproduces the bug.

 fs/proc/task_mmu.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index b87d3e864..14996d0ba 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -3176,13 +3176,14 @@ static long do_pagemap_scan(struct mm_struct
*mm, unsigned long uarg)
 			break;
 	}

+	/* A completed walk may follow an earlier full bounce buffer. */
+	if (!ret || !p.arg.walk_end)
+		p.arg.walk_end = p.arg.end;
+
 	/* ENOSPC signifies early stop (buffer full) from the walk. */
 	if (!ret || ret == -ENOSPC)
 		ret = n_ranges_out;

-	/* The walk_end isn't set when ret is zero */
-	if (!p.arg.walk_end)
-		p.arg.walk_end = p.arg.end;
 	if (pagemap_scan_writeback_args(&p.arg, uarg))
 		ret = -EFAULT;


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
