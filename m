Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794177368;
	b=UEGI4onUGM+Xbc8mQlGLNlQCT2ndFxuyl4DgxP80HHu1ix8+hFsAYisvG+gcQPEDXNL0
	 RIu261/zG1SDEX3zb5TnOuBMtbVUYhqgCe3i1e+oIzCuMFRdYme8R1bVa6R6lWmzmIMoG
	 rE3MAmFVsW23LrBNUk3zzH2CEvCH1BFL7R/4Ar0M9enCWN0IBgFw5fEZbiw+8XevnHeJ/
	 9H6rcjYERC8u0Of4hmezk32OfgeNT6YoWjd2eNC/H6wLFtr8Af0saVCsYeSCgeZE0fi5C
	 3zw1MyOrQ4rVgDQi1cZZXfezfWOlTK1NO+D7zw4DfxihlP5v1Hap0OLgT3w0SaKlrdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794177368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=0B84fgUAvEG0Glyv3A7RkeExOVAqdU6JtDjEommuU5s=;
	b=K9gyQRG6OleELNihFjdrO/VwZJ4m5r82OAwm8BLdaOsoomnzFZxTOgbnZ0zvsAJ2B0bj
	 YPYtZwXggITWZJ+gJcb9rfN00ttAoRd1PeJg0zXtNxQYA4YalGiICzlWYlNpJpnowVWzB
	 /DryFzDYGQzQv/0hdc4wREQxy60UK/DGqczlR13EcLCCaQBZjCmzArq2hdubQ3bkr/KzI
	 11WtpUbaazsYEi52+n+rOrcEPbd3ZhvaIxeSFsxX1HTL6jfgPdERdkmzXhZReZqLzKY3d
	 Bnm7S2NYrBQ5sPtxA5aJ3fuFeB94oQMn8dyaDvcR1sDbPahF+g502x9b+fJUiG8LaCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0myVGUE;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A3F606D80A
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 22:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15A3F606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o0myVGUE
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so429566a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 14:36:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794177366; x=1794782166; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0B84fgUAvEG0Glyv3A7RkeExOVAqdU6JtDjEommuU5s=;
        b=o0myVGUETIrYhSDiGMzAzUwj64MUtklp2Y9qAfc1GvUrFIIhzzPaL7EoavTacrJgIP
         VtmRTdUUic1gqHV0eLCEOcvw+/ydUgxQW18x+xkiqXNQzYUmA6dxGyJCylpe8BLrTa/S
         UlFpRYM32XnHsAUc6ov6VZs5So2lE60b7ojcDwodbhMXN1EkDfcR4gDK85xZqlks0BDG
         ecq0Va+T6sHti1Mr8AmFbgkjw7IPD7uixvMzKwTIXVN4Afin3AS9rgTDK++vQx1Hukxb
         tcVlyXE9iKNw5Iem6qjV5zK864QtDmNSzIyzVbdd16z3YincCLylWneKTvNp2lFBaslg
         kG2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794177366; x=1794782166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0B84fgUAvEG0Glyv3A7RkeExOVAqdU6JtDjEommuU5s=;
        b=t8JwkeVk12n9rPFpuzaXdYvEGve8U1GUJwefjeHZpF5fS0mTmBc9KIfZ4dhdCwHA9v
         SaoVFrEHN49RrNZUW41PfvWrT3uP6aHAYYkDeTQKvypafsRfLj6mtpBsrubL0vH6tzEi
         KA3Tcaw2dxsjGYi5XFjUieT9IuX/AXWkk3bStcKzuq3VLeDEzR9gbEXUDb7VUcVYIrTx
         cSjdfUovuRDkCnhpKN7XqonmdE8XfjUjk/V1RemsFSCv2F33apvX2zNe7f7tlNXHmwEj
         2Nn3Hrs+y3Etel3n2Sa21Jx1Gm0eCp+6SdfEzJ+36cQ9i756L3eU7s1qQKTqV7kWJGLM
         1sFg==
X-Forwarded-Encrypted: i=1; AL+hErEOfmJMRqYUAkes7EAuWhvZPKtfeeQ1OABEhRRHbP8J1rYMNG6s9QqRJwGUzpCuNOREy7V5cb9VvK0yHpU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8RNOOwKGdGoOTQQPvXDE9W9m8PLqFcYmX+07MH+YiTPAdRTe6S
	t+bXa8t3frmpgU4p57G2LpTmNH0x6pDlTAZFXen4LwnDFBlPJNE7uaAnjyJjCVJj
X-Gm-Gg: AYBFou1nNWhXeSh9lQTohLlK7iJoa0FTJuAbuy2oq9ikqT/PipH6k5wR3z8Ky4zC1st
	4ok164TS2mcARrsjt/W32LhIlbmhSFCkfVyK0gIpTYWHn5W6wCnEDFrN42ahe+Esk0YLiYOoffq
	GcAw6KiqAJbg7Lb0tLae4hiu2XzmxIA+fqJFbdeyD6tI276yEtcVxzwJtELUcuI4E3HHfWm+2Ao
	f0iGzC82qYj/tiFetGsKPMOSoypJUnigMAU9d1zZh5EBYQRC/DVo395PxRZUDC1KeUrxaS+PTa7
	AUuqecZusnjd41Xi9XJCOf+7iAw8FNiAg4aVSKa2dXhzYTN/mX86rJ9QBX6rzo7z2swda3pf/pI
	eKR07yBXUzFd1iI2v4qLOSWp9XNaok0ueH25U0R5ZsCpoAKD2EidNxSppOFIvItb9t7wz3wpX0Z
	n6SFz2Blekaf/PiQXugVIYygiLQSuVNJEydxUFRg2eJVQFvWVM8gTzcjGCaRn4coX/Y1L/FZFxn
	j4zD2AxuolBdxx4VMaq7QHou2h5R49UeJG90MIQtCKHwcF32v6kDEyZC2ImqjGnfhtflZLe3b9M
	hhsXMIChT+Okca8rUExer/4S6Cga2LuZobHDNw8uS95/dBBlVLe/LAYV/XCqvWtpc7QBYSDBaNI
	uUFcN4D+vqIma0qUf
X-Received: by 2002:a05:6402:1d55:b0:6b7:6f9:2ef7 with SMTP id 4fb4d7f45d1cf-6b722456828mr1336914a12.11.1794177366393;
        Sun, 08 Nov 2026 14:36:06 -0800 (PST)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b721ebc7b0sm859272a12.14.2026.11.08.14.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 14:36:05 -0800 (PST)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH 8/9] sparc32: retain mm_cpumask across TLB shootdowns
Date: Sun,  8 Nov 2026 23:34:18 +0100
Message-ID: <20261108223516.1125534-9-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108223516.1125534-1-linmag7@gmail.com>
References: <20261108223516.1125534-1-linmag7@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

smp_flush_tlb_mm() narrows mm_cpumask to the current CPU when mm_users is
one and current->active_mm matches. That snapshot does not exclude another
task obtaining a reference with mmget_not_zero() and using the address
space through kthread_use_mm(). Clearing its CPU bit can make subsequent
shootdowns miss translations on that CPU. Testing current->mm instead does
not serialize against that race.

Remove the narrowing. This follows the SPARC64 fix in commit bafb056ce279
("sparc64: remove mm_cpumask clearing to fix kthread_use_mm race"). Retain
the accumulated CPU mask until normal address-space teardown.

A single-threaded mm that has migrated can consequently need remote
shootdowns for the remainder of its lifetime; sun4m broadcasts them to
online peers. This trades extra cross-calls for correct coverage.

Cc: stable@vger.kernel.org
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/srmmu.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index aa53ec10cd8a..d3634bcb048d 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -1624,12 +1624,8 @@ static void smp_flush_cache_mm(struct mm_struct *mm)
 static void smp_flush_tlb_mm(struct mm_struct *mm)
 {
 	if (mm->context != NO_CONTEXT) {
-		if (any_other_mm_cpus(mm)) {
+		if (any_other_mm_cpus(mm))
 			xc1(local_ops->tlb_mm, (unsigned long)mm);
-			if (atomic_read(&mm->mm_users) == 1 && current->active_mm == mm)
-				cpumask_copy(mm_cpumask(mm),
-					     cpumask_of(smp_processor_id()));
-		}
 		local_ops->tlb_mm(mm);
 	}
 }
-- 
2.43.0

