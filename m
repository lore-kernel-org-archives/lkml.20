Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512811;
	b=ZAFSmvN2yQurR+f8BY592LRAIvChF6O7wt6by2sm9WNHFXqsk5GpIUFfmLk2grCdgArW
	 g+RqG4Aq2L4VcKo4i46AlvWOeGJwk+FFd3cGIjOs/hLCaVGe/6X5NWkUkMEv63Q3/6HiN
	 8nNzK6hNz5HyFCC74987+1hbmw9W6VOamwWQu3tD8cY436txaS8P8JpcHLSSurflK9Zk6
	 HfqgVGhTksQoxh/gw7pz+511xfOcb3uWY6Ee2xL1EtPMFK6i6KYi1x0BosuQ9cyt0rXHR
	 4RLWSqHtVYAFMh5MRejEMtCSolHU+CYebITBE0ummlVwMcw2mrJ3ECepkAEva/ZnKCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512811;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=81mwhGpyTQyS9ZkVfD6pCekgh9MbFG84V8B+r1a/GCI=;
	b=Nw3gCera6c5kZbueHNQJdawjhxq1lUxuzFeA5d+TpdAuw/3+dE4FdLA9YrJ6TShH6b7B
	 5S3jyQlO6WVkDhPA7F7UYtN2O10GGk+e9doIoQsk7val5qcH9L3CVe3Hxdd6UoZ8K1Ny4
	 wkKAUSH80EDE4eIf7Uyl7jPCTjMSL6qSYhGLLTrpzxRHWEm00v4sJeTBcmvZZdAcpaPur
	 upFWkTuJ9vi3oGTjv2REf+n1g1HvX6v/mwjK2q4Z7AOQ4V0paKfErgCcrh1Hnf5GE5REg
	 IH/Glc9iLYDjAbCEP4idl/oDtrDwKpeEaYU24+ygzcfNGW7OhGDYu0oiKIz03XHiBxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LhLx608N;
	arc=none smtp.remote-ip=74.125.229.5
Received: from mail-dy2-f5.google.com (mail-dy2-f5.google.com [74.125.229.5])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE376606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:13:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE376606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LhLx608N
Received: by mail-dy2-f5.google.com with SMTP id 5a478bee46e88-35dc2af1f2fso1762263eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 09:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792512810; x=1793117610; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=81mwhGpyTQyS9ZkVfD6pCekgh9MbFG84V8B+r1a/GCI=;
        b=LhLx608N3LUYyvG4ZkvU57cySokPcA3LxVvLvZ3KUJWWdbvRwPGVtyrryZPA4GaPn2
         /foZu3daLKSqANAh3G3DYy5elw/YF5XIofLx01GokDGrJtSqbfznwFOUMkedxIglP/lS
         gT3pp1MbB+rZyAWGFAQ+DXAvn31g6sHN8nKMAfIEcwNKmOU2WX+xllWc3n3IJVGPxRNb
         aWGjWT6+P0EQlhIzObWGsy7EAXan1mf89BzyW3Oz6BnNHuYn2UqGfbQgQzQPqAOnzESf
         Tdr7WNFToIFaywqj0LyILMfz5w/86wK95WKsCCbNfC17FKKuZ3NqPFQmNJzorZ2q0C+f
         zyuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792512810; x=1793117610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=81mwhGpyTQyS9ZkVfD6pCekgh9MbFG84V8B+r1a/GCI=;
        b=CzebKETd9Abmqkmn5MeFsAcIOrBTgf4L2xBrHHmsLtllVFXw2hsSeOQvtgxeFeB/Hh
         DRitJPXRG2GJ8is0GaOra+z/CrNJR20ebb+j+8O6Pjw7nFVTS7VO+zrt89zjKOYgG5RE
         soNNNM23SFzUrQjc9p/C7b3r/ba/ryzo9wAahjXtBLf0RBIedaYXlsQtVKts/4gN9V7F
         pFxpyHyOxH7HLPUjb3dhVqHR2ct76JKZrJ9HpDJkrlrorA74X/LmwzbkDHG0QB2dsknk
         uwUkWyxEzkqlF+dvCiUISgjJdz6ySddx57aOV6uAwh4wWv+BQkoI5f4HyPNKSXiO5KoR
         V7fw==
X-Gm-Message-State: AFq9FYIwX6F2gkHf5WsEcbKaegDHD5OZJ08H/eY4B0Budkb+Jup4I5D8
	S6eBKYoEWHO9AgEa/Ze+wtrxeo5sDn3tjwWsyd0ytPoEeQqh9r88/uuK
X-Gm-Gg: AYBFou1Y5l+sM4nSMrbAzAmSTU57oM2iOQ+S3B1WIDGizOcoONQftvoo0XLTRUD6Kxq
	BpYLhwz4fPpZmblJSAW2GZQ0QIPzC8lVq2qZADwcoimswGYgBvsQH8/SyJmb2NpLGN+LEGMHqNa
	gIuKIx6oHEDDWgzc6bNudRezsa5lM1m3Dbu9DwZU+RaaMa7Vi7Ms1uViVXAwLutm5OOdkPZvxDI
	EommIZiEHxIuC5yadXhONVq527tp2Wv+Wp/D85DdiSldP342xzgsYwV28EeX+/7Cvq38szt6b32
	DRGWKUh14gysT12+MACc+adhZ3QLHSYQa3yLjBIKiMZCR92n7B3UzVotbKdKonAifOLnmqMjtjk
	vfdmWvrGRbdJwR2Fmat0eiiOJpj9ODuf/tKqdZJfIngRqqZ7EKZ3F9qKQU7ehAsaAFta6qu0T4I
	NJAttHNz+C7s6jqYj4l81XIvI4Ifbr6I4D2J2cfpKl2+adjESS64R948IyFQha/t3BaBXFgmfXw
	UwP8XT1iCDMVOCNYxgd49MCQw==
X-Received: by 2002:a05:7022:1508:b0:151:70a0:6bfd with SMTP id a92af1059eb24-18512b439afmr17399760c88.24.1792512809857;
        Tue, 20 Oct 2026 09:13:29 -0700 (PDT)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b859142sm37128393c88.18.2026.10.20.09.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:13:28 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] posix-timers: Accept NULL clock_getres() output in stubs
Date: Tue, 20 Oct 2026 16:11:21 +0000
Message-ID: <20261020161121.85042-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

With CONFIG_POSIX_TIMERS disabled, clock_getres() returns -EFAULT for a
supported clock when the result pointer is NULL. POSIX permits a NULL
result pointer to suppress returning the clock resolution.

Only copy the result when a destination is provided, in both the native
and time32 stubs. This matches the full POSIX timer implementation and
preserves clock ID validation.

Fixes: baa73d9e478f ("posix-timers: Make them configurable")
Fixes: d822cdcce43f ("posix-timers: Move compat versions of clock_gettime/settime/getres")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 kernel/time/posix-stubs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/posix-stubs.c b/kernel/time/posix-stubs.c
index 9b6fcb8d85e7..5a27335a917e 100644
--- a/kernel/time/posix-stubs.c
+++ b/kernel/time/posix-stubs.c
@@ -83,7 +83,7 @@ SYSCALL_DEFINE2(clock_getres, const clockid_t, which_clock, struct __kernel_time
 	case CLOCK_REALTIME:
 	case CLOCK_MONOTONIC:
 	case CLOCK_BOOTTIME:
-		if (put_timespec64(&rtn_tp, tp))
+		if (tp && put_timespec64(&rtn_tp, tp))
 			return -EFAULT;
 		return 0;
 	default:
@@ -166,7 +166,7 @@ SYSCALL_DEFINE2(clock_getres_time32, clockid_t, which_clock,
 	case CLOCK_REALTIME:
 	case CLOCK_MONOTONIC:
 	case CLOCK_BOOTTIME:
-		if (put_old_timespec32(&rtn_tp, tp))
+		if (tp && put_old_timespec32(&rtn_tp, tp))
 			return -EFAULT;
 		return 0;
 	default:

base-commit: 348f54c435bf3177baa78201952810b255d44b30
