Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792776738;
	b=nT8pL/8AplFlyh7rIXKIkK2FCs2DD9AimN2pQRA1KFvMsHHU5daqZCMGWZ+FdzaLag0j
	 c3whHNxQmJGt8fDmpkg4vQkGblFvxW+lUwF068OH7niIA9EolAEhdYh/f4V3YKzg9lD/1
	 //kRKLbWLShp+ANw09BZe+hGzvNObw4FVcQv+e62Ou/aFsErlh9N2bDpCBWEgQYp4qMCH
	 NZl79288zOLqib5pZ7ciReUm4FSqc830elcUdTzvobjbH6p4togPeoIl9lFNhML7EbhXA
	 8TRrIQ34/nG2MJH9QiXRXV3DHbc9nv3uZA8rUzizLJyE66LMGP2M164AbsHbi2h55uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792776738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=2r1x0Dt7yoigexj1LN19Sk2tBE9eYyGPD9hXhp2NAA0=;
	b=VKp50FmZKvcG0VYZ57SRuK2Pho3gRXxkkHpKqT7pIcIsZthc4LowhsJBoMozpHrsFLGs
	 sZNPPEji1NWboiBNFgHMc6/ytlHGG0ruh0ZWm+zKWC++mwsqLCufIl3Ja9zIWsDOuAeX7
	 NNdCZbKC5HRdmrSCby/JCam32xv5g0ciRDEu2BU3wCSYLcH9VM/Zt8PEuRWyOtiC+Rmo7
	 g90HvdNcuxtf4YelJeF2wzxKa+/AsmbLmnzzKQRCInnf0ax6Lu1jK4T+eV7Cj1bpV/CbM
	 6eRiT2yMDMv3lQjpjEyGDznZwkJ2h7qZdz8bamdWx2ri4B88AKWHS7SJC+M8JoE26Qw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwZ+s2Tb;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1FB606A325
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 17:32:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE1FB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PwZ+s2Tb
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso12287545e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 10:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792776736; x=1793381536; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2r1x0Dt7yoigexj1LN19Sk2tBE9eYyGPD9hXhp2NAA0=;
        b=PwZ+s2TbTyIPznOIqdpFwhuFG5Fy19HEa90OazWCvH+cPmycOtmyfWL+SqKTK/HQwQ
         wk2BXXxN+F0tq4OYymMclyAcq88/ZOr5JzCheM7u2rVQTKzcb4ID/ee58qKyN4sqjwHD
         Ugx54IAVQxOGsb1r8AklKuNmySnRUmhwZXpvbPSBLANvjA8V8Cugq7Yy+gjidYZ9ItrX
         zGnEnOp3NisHiCmk15ABB2eYOeiLWJulMU7h3jR79Z2C/SG9+DfFHFxzBUXPkR9WOgNq
         66kwfjKjyW3N0l7YynCUrEhDsESBWh/BvLmU8kwOspfvVX9y0XCJbhtR/wcAcfsvDWHn
         xiEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792776736; x=1793381536;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2r1x0Dt7yoigexj1LN19Sk2tBE9eYyGPD9hXhp2NAA0=;
        b=Ijtx+by60KJlP22kq7Sg+3Wc6Lcy/FIAPqqf+ptzppO6Hq+JTJVnBbfTi4hGzKq1c8
         1Cm6U4x+NMSFcpbh1iyIE18yMR7B1MErQs4F2l37SkEOvpDJhUWjMkOoOtxJp8sfSLYt
         0JW/crCRFUrivi7UC/yZyvk9ZerIQbpemvzMpPNm6FmNjmUPk+WNUShNJ+wRXEe5/Uw5
         Uk6fgRdU2JqNrogjMHWp/2vNgvSDH5qWIOGO+S4gvdexP7o3UXPd0Wov1SgBw9kSK/1L
         8s0DVuTPYf3SGH4NfDx8ZDQc9zRlwUkeGZ3uDtYiSHERs5ovejqCCwZ9HeVZlWya+ShZ
         3+2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzcn6ai6MO0Y6kFbY0WpwIA5+TAOPmFAlQ7/n4uaEWlBNWEBH6fGrTUTpf9+MZbZAKVU4Y49L63P/7L84g=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiNapRdF4X1U5QRDzt8/r+Uqg7c7NfyqEzVpVNLrdf5UcLU5N8
	FbwZPAnP0qjfBTcIc0iscSVT2Gl1AxhfRqZ2nYwhI1pIQ8L4ALiFIgEQ
X-Gm-Gg: AYBFou3zi9GcslI9nCH8jlP9X9GCzCQ5zyI9rlMxQ1ukBSPK5p0f8RVigNSb2c42jI6
	zArgRe90Ff9iW/QFUbOWU8T5qFunITEQ+JskMWr/0DWel1ckDA+FnMcMKhnat/LLVNSS7bVbNBc
	I1O1+vvOwCnTMlqAQYh7s8gHcB1Q/i+i0JT1kEtEQL0C38RO8WH9zX4m0jLa/NLHBWsqQT4IJMp
	EWseTQRep+BZ66E5WIU+Qy/tsc/9tJQm9tZ2/e59/JsSYMl8iy1wfT8WjtmE7XjD1HXTb0z5x5Z
	Ajig+4Xo0mMSc6o4lnEeK12wJCMAUMv8mMzHB53lF7pR9zvhHZXn7RF6/vB3lmaw9I1pQudLVDJ
	wXRvbNewT/Wj9Il9ALUyr0YQizPiLVJ8WpnWpMqlyqz8UfPkJOvoRLG56mS5HiluQoJ476OVxpA
	l10z+tKp15nb+2J3hBJ1nRKrLFqY0ZYn2tnOjUFQFCOY9fD8r3beWowt4nPYtsxpNK/T9rDpgW9
	JWWRN3ANBJFqR0t2rbanrQMEpVKx+JfC7WUTfJF1ZmfJ1+XiEAfUPsnKaBuvgK2SJlT3Aw5Gvzt
	cUVJUyUWY1q3oSveJTU3hdaAiAlU4vk7GfK7A+eawgrFnokmJAQ0VJVQY3QIqZfE7niJ
X-Received: by 2002:a05:600c:1390:b0:4a1:7ec7:a479 with SMTP id 5b1f17b1804b1-4a211ee53d8mr50695125e9.33.1792776736231;
        Fri, 23 Oct 2026 10:32:16 -0700 (PDT)
Received: from hermes-agent.lan (228.red-80-29-82.staticip.rima-tde.net. [80.29.82.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a312fc7012sm12475755e9.5.2026.10.23.10.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:32:16 -0700 (PDT)
From: =?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
To: Maximilian Luz <luzmaximilian@gmail.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: linux-pm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ram=C3=B3n=20Jes=C3=BAs=20Miranda?= <ramonjesusmiranda@gmail.com>
Subject: [PATCH] power: supply: surface_battery: handle battery event 0x1a
Date: Fri, 23 Oct 2026 17:32:15 +0000
Message-ID: <20261023173215.6233-1-ramonjesusmiranda@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On the Microsoft Surface Pro 11 (Snapdragon X Elite / X1E80100), the
Surface Aggregator Module (SAM) emits battery target category (0x02) event
CID 0x1a alongside standard battery status notifications. Because CID 0x1a
is currently unhandled in spwr_battery_event(), surface_battery logs:

  surface_battery: unhandled battery event (cid = 0x1a)

Add SAM_EVENT_CID_BAT_0x1A (0x1a) and trigger a battery status recheck via
spwr_battery_recheck_full(), matching the existing battery state events.

Assisted-by: Antigravity:gemini-2.5-pro
Signed-off-by: Ramón Jesús Miranda <ramonjesusmiranda@gmail.com>
---
 drivers/power/supply/surface_battery.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/power/supply/surface_battery.c b/drivers/power/supply/surface_battery.c
index c759add..a3fa899 100644
--- a/drivers/power/supply/surface_battery.c
+++ b/drivers/power/supply/surface_battery.c
@@ -26,6 +26,7 @@ enum sam_event_cid_bat {
 	SAM_EVENT_CID_BAT_BST         = 0x16,
 	SAM_EVENT_CID_BAT_ADP         = 0x17,
 	SAM_EVENT_CID_BAT_PROT        = 0x18,
+	SAM_EVENT_CID_BAT_0x1A        = 0x1a,
 	SAM_EVENT_CID_BAT_DPTF        = 0x53,
 };
 
@@ -368,6 +369,7 @@ static u32 spwr_notify_bat(struct ssam_event_notifier *nf, const struct ssam_eve
 		break;
 
 	case SAM_EVENT_CID_BAT_PROT:
+	case SAM_EVENT_CID_BAT_0x1A:
 		/*
 		 * TODO: Implement support for battery protection status change
 		 *       event.
-- 
2.56.0

