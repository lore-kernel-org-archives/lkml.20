Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794496328;
	b=5ovWN6kk2s4WU+JFfqpH0eVwUE59CTiwtaSFR76hwUWwHVwa1ffKJ6kl9TXFiVY6UHFO
	 /OOncgglR1tXegflm8aip+Kf5oSvh7mLipnknWoMjwFcH1Ad99m2PSf7h0wQr8Zc/NSvp
	 14u4Acr5x29wli/nlvfoUb9xj8lT7HKkNuLmQe9w2xitdMmAG91y6OiMHYdzu/lEt4Azk
	 1+Ij+7zPYK9q7GfkO9yzgi1hLCJ6lDc7xp3GGBLLlEUtgDiSlM49WlJwIRgjOZhO9A3v4
	 3Dqxzd+6SXzz/6ilTaHPEcsal5EPvuVJi5gh1mSWqH7dUnKDvJTeizussnUyqwDkKUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794496328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=MIlgMaWOqCwnssLBrNwF0bPejmBB9nwmu6fUqmxVupI=;
	b=n+rGTFFpWYEc6P5l1lVf/geEjsLDOfBlrqfDLVuGpKEoQOJ7+ZdyZ/huXFS98RJVhF9l
	 j2vPfGmO5hHHvonY7m6k7dzrJrpzilya6Fl4OVXzOPVnKWoA8+L8IJzJlymg9KTAMTsJY
	 NMyPu8vOYqREGMr8UXg7Rq5oL/CuS3Aa2d36E0E478p35nRVmTMzClkWmCs+BdDA5zBP5
	 s8jJzkR/6bw3b1ze6d8420/f0u95El6PjlrKoSWs1x3jn3vC7Pty4qvEImdDeunShO4e8
	 Ip1SLJK4L/q3jG6M4yofZy08dXWAai538I0JpW/maMEwXppzTRfrW76kHPmaBJ+0nAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WGT2qyx6;
	arc=none smtp.remote-ip=209.85.128.71
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B0E606A323
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 15:12:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B0E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WGT2qyx6
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4a214a5f8a1so47188305e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 07:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794496326; x=1795101126; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MIlgMaWOqCwnssLBrNwF0bPejmBB9nwmu6fUqmxVupI=;
        b=WGT2qyx6C8Ikm5oJfWYex129SWCkOphE3WCfz90kC2Bh67vQPlDOKyjGlbpN2hUx9B
         Movacqk20u/8enFJQGHET8JrEBKISH2tLMIio12eFpX6nMWCkOD2ZUMmcprTUECFV8dK
         0wm2ZWNk0tk7+nqXcFXBfFefmjAZqO6KHf7DHBnvLgCVCUM12KtgQt6IWcyc1CGYo+qO
         rleHSG7Tgap+EGK6EjK+aG5e7YzMxbKPAs4IuSfiDlUP83EPgxy1Z4gtC+OlVW41Zo96
         84Ydp6nfC63rJQKTf2fhy1SJqRM2OZOY9VKx2FJ6HWymOQPH23Rn1Ulf7U//ys0RD5Th
         xljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794496326; x=1795101126;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MIlgMaWOqCwnssLBrNwF0bPejmBB9nwmu6fUqmxVupI=;
        b=IwQwe+eI4jyiSs1COzo8oDUd4GrkGIzUILTOksnwlWsDVxXOn+fRDQVN3gS88f2feT
         jHGGmH4ivTO8LDCadF8AYm/l7BG2Nk49S89LbR708DernmPYCy/zqllWka2RYIOAEskt
         yKdNEs3AAQ6DofjhEsiRSzmYKPNzxdk7MaVz+g2m0anj8+tbUm5wESpajBaM5hRu3ro6
         NSFxPLn5OrZ9sutflRqSoj05nPi07jn8kuGxBa4OHGgPgv5mObxlOcRONg57X0JtVuDj
         a9rZ3SmbTuSvRUb4bjV4199H8SekwwDvYN4AcK8jqsicGLF5dxF+c7IkKE46nvgWkklG
         CuFw==
X-Forwarded-Encrypted: i=1; AL+hErFW6BVF0p6kbixOLiWJL/+wWuCa3/hZ38CQHULfZdvJ1gZljnuPnRqUrsUQ0oxbUQ1w4dE2wI5rKPrGEeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/VVal/o4sHweBzExEmltftYwhH94ZfkzT18QY7kNPx2tXHNpMQ
	3nGXzJfDHS80A9lVNwRK8GCkC5hH6H493mAeZTinfniSuOIX44txSg1KzJCmlpsUgozozoXVIT7
	/Ca/V9UaZrQZyR+LwYGmLHw==
X-Received: from wrpv9.prod.google.com ([2002:adf:f689:0:b0:48e:2347:2d53])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c01:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4ba09395574mr130805365e9.35.1794496326089;
 Thu, 12 Nov 2026 07:12:06 -0800 (PST)
Date: Thu, 12 Nov 2026 15:12:03 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.567.gdb80ae8cd5-goog
Message-ID: <20261112151203.3129005-1-vdonnefort@google.com>
Subject: [PATCH v1] checkpatch: Add context-analysis attributes
From: Vincent Donnefort <vdonnefort@google.com>
To: apw@canonical.com, joe@perches.com, akpm@linux-foundation.org
Cc: dwaipayanray1@gmail.com, elver@google.com, linux-kernel@vger.kernel.org, 
	vdonnefort@google.com, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Checkpatch doesn't know about the context analysis attributes and
misparses annotated declarations (e.g. mistaking __guarded_by() fields
for extern prototype). Add them to the known attributes list.

Cc: Marco Elver <elver@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
---
 scripts/checkpatch.pl | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index b8b64f720191..5210b4ed25ec 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -526,6 +526,25 @@ our $InitAttributeData = qr{$InitAttributePrefix(?:initdata\b)};
 our $InitAttributeConst = qr{$InitAttributePrefix(?:initconst\b)};
 our $InitAttributeInit = qr{$InitAttributePrefix(?:init\b)};
 our $InitAttribute = qr{$InitAttributeData|$InitAttributeConst|$InitAttributeInit};
+our $ContextAnalysis = qr{
+			__guarded_by\b|
+			__pt_guarded_by\b|
+			__rcu_guarded\b|
+			__must_hold\b|
+			__must_hold_shared\b|
+			__must_not_hold\b|
+			__acquires\b|
+			__acquires_shared\b|
+			__cond_acquires\b|
+			__cond_acquires_shared\b|
+			__releases\b|
+			__releases_shared\b|
+			__cond_releases\b|
+			__no_context_analysis\b|
+			__context_unsafe\b|
+			__acquires_ret\b|
+			__acquires_shared_ret\b
+		}x;
 
 # Notes to $Attribute:
 # We need \b after 'init' otherwise 'initconst' will cause a false positive in a check
@@ -551,6 +570,7 @@ our $Attribute	= qr{
 			__ro_after_init|
 			__kprobes|
 			$InitAttribute|
+			$ContextAnalysis|
 			__aligned\s*\(.*\)|
 			____cacheline_aligned|
 			____cacheline_aligned_in_smp|

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.567.gdb80ae8cd5-goog

