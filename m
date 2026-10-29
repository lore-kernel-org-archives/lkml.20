Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793262254;
	b=CqH95TQ1xDL2G48ueXAsqzNVnqFeEkHUDxnCjonYQbqBpdJBY9cXITMmxaTCFhXyunWG
	 T5P2Rl4ibphjr4f7sis7X7vqcgNgcUy1GtK1e9WlxScisj6Onzl2WVxLD74hJ46EQflx4
	 fHD78ufOk2mZXxpv+aEgxzVwM5B0iQvlWz2LUUMc3YsxMvUkekMW+iJFQTndKDuB62ATV
	 mFZhH/7rs+w1vrroKHaqlmznhMSMhMm5Q4fAjd2zaj5mKJzyl6pa63UPrz4q0dGa+tDWs
	 kAjFd7KP5qFfg1Y4gsDvp0547ofkoV2uS4T/bjOzSFVeCPGzTHf8ZCSTROg8FGticIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793262254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Jl62TfhWYAfPnyRC2G3aSDjU5xgDd+P3RO6y8pPbcO0=;
	b=u35V3PN7GgkwwzPuKO43543applfz6wVeeXpktpwaZNx3MXqgqgjdQ0mcK9qL3rEbMul
	 grVlSC2cOzdLdawvfEzkhmMC9f5tWDVULFoU1/hKD8m7Yi8lwyrILSpOypxagNmpeiSDD
	 XVR7rfXzaLyKGpU5CS9nEsEWXooQC9ta6ql7MXyCP+Ro5p/q00W8aVRvdbLGf4QhCgz0R
	 yU6g14gb2AFRtlHfnLYje4vlkvrrOBd+Lft3fu7Ew91k1W6coMnpmNNkw8R9DYNzhOGC7
	 9s0OfNZVA+MzVVazDwvAHmRIWK4bwcBLHvLuJEIigh6Q1PczIZ2Mss7ptW7XBb4eT9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=logictree.app;
	spf=pass smtp.mailfrom=logictree.app;
	dkim=pass header.d=logictree-app.20260707.gappssmtp.com header.i=@logictree-app.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aE6JFdCC;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A201D606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:24:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A201D606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=logictree.app
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=logictree.app
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=logictree-app.20260707.gappssmtp.com header.i=@logictree-app.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=aE6JFdCC
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cd5cd8d89a7so948662a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=logictree-app.20260707.gappssmtp.com; s=20260707; t=1793262253; x=1793867053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Jl62TfhWYAfPnyRC2G3aSDjU5xgDd+P3RO6y8pPbcO0=;
        b=aE6JFdCCM7LO9HwJ3nmpqUEZ5Tb1xgSgczp0QUjlpVLgv6TlMsf7w3ivWhK/vnw1TY
         +N9kasdgbbSCGzA/mfKxrMAhdiEuOwQGGkqAD2PIPoN/rrU1wROWH19hksp/yp6O80nd
         U2O3Kcxx37NH+woPi2x7cUkUqP3Zv/lp9vjbZ/tpn7ssENonLbqcLASC4spNRBAJd1Xj
         IDsiTiAeofqeeYS1NzAmrZNvedePS03zVYZRSOSouqNQ8mH85lOOl5sR3H9pSjdRiK7h
         y8oA1nrLpQlAdTsLnz4VxnsowpJpdzhkPkyXr8Op8OHILm2yhshgYxD88zCaigM47yi/
         mTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793262253; x=1793867053;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jl62TfhWYAfPnyRC2G3aSDjU5xgDd+P3RO6y8pPbcO0=;
        b=E1TJbs9pRb7ryXwdV5kkO/8roxVMj1l7YDQygPtwjqsvW+4ZDWct3LoGPgNSiPGm9e
         taxcTvgfyF6Qcz5PnJhYollPwG/pk3l5I5RRk+DbLyRWgktKnxQd0lLxi6d4ak9WlIIY
         q5S9tC+A4UsVq/TEm3qFj9TE31imIVIznDAgcGMqEi0uIl1YWt8ceYL310NTqCe0Cqfh
         CP6b6poyW14uMj0ZhvYqmOMm8R8nezxmdOpklxzjWJXaobj5sw7KoxcA7L+GEHk+K6Nz
         5Ok/yu+EAto5F0H0C/Bx9yOTc1x0Z+nXM8Kr1kg1WBC9BWog4RoLNVqQTkzK1PnO/Crg
         gOhQ==
X-Forwarded-Encrypted: i=1; AKwUvBwoqeGk7kLi+dw4r+U/VLQsbqI12U4IHpZx9uyiMwXYotFoY0CYz521EMXlE5nojYmim7cuHdG38YKlV7w=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEqdoHdGINKSEtKf+Vp4KvJ7lhS4VvnG7Rm5hiFD6PAJIXsTJY
	+zyykpGtC8pV/pfP5ax6zES3EWeU8fe9EjHXTp41RplxLb6LvHtAs0uRfcnzTrAOm4z2
X-Gm-Gg: AYBFou1pN25PupnpC8kKqS8RV7++xRIgnojSwgpjXK1Q4RjpVFrW5CJSN4iyG8f4PF3
	h7/aTCdixtdw4yipL6NfOMnjZgCDyGNM9SCrMnCeKBgwZFL+7CH1C237QX8juzUflBNcIY0mNTy
	MVtMGLdPRzurWMvJxHnXt3mey/1n4qPRB6TP77+b3YrpjO+HSiCtFzSRKeEm+4BAbr4duAMdy5Y
	RMsbpMuRsAiFANMTNaQddyDMtaUB3vVlPiqkZNrcSz/r6u88Zg5FVy1YGoWudvbqW7bLHxFy5Da
	/qGcJ5yM6tAVSjkkG76ex8dzTcA3pOlqueqzjBoypwg0pXEECH4S9KChxgeWMVnsZDe4b/ACu1g
	2aW69J/aJVqZAgFqvg1UIlrVo5yIsybesWvGaHURqDWglAz/2ttcKVH+75S1Rp5Eir32HQrmY9S
	8MBfgGsA+mLvY29zyWHqWzGXM/CQzq2VBzD4LLonP82550K3laE3DXJKToLHKNDvUiXKnx2dOgy
	5eKhBzC6lL5vB3re/P4n+8wID8EjlvdyKLisUhlUN3RdFTjWQUq1s1Hv4Vp1kJRR2BMjokAY1HQ
	0KJPVJoYjW2/N+0i/kvArjDimOrYFzxvoR90Q24F44nns2NSUtQ0J+wj+VFzOJnfd4u6+bnSefa
	9QMOphzJGqxyzAlHCH+2PMQ+FRKbRNoYPBXui7Q/zvaNgBPFCxvVkMJtrKEqgFDwAkTgaXnwkHa
	qD+QD4pJjolw==
X-Received: by 2002:a17:90b:1c8b:b0:3ac:b7b9:6484 with SMTP id 98e67ed59e1d1-3ae5817e0a6mr3383992a91.45.1793262252637;
        Thu, 29 Oct 2026 01:24:12 -0700 (PDT)
Received: from localhost.localdomain ([1.251.203.28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e7f9cd0sm3150530a91.6.2026.10.29.01.24.10
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 01:24:12 -0700 (PDT)
From: JaeGwon Go <ceo@logictree.app>
To: linux-usb@vger.kernel.org
Cc: westeri@kernel.org,
	andreas.noever@gmail.com,
	YehezkelShB@gmail.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] thunderbolt: Send header-only XDomain properties changed response
Date: Thu, 29 Oct 2026 17:18:34 +0900
Message-ID: <20261029081834.91559-1-ceo@logictree.app>
X-Mailer: git-send-email 2.54.0
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

Commit 19813551701d ("thunderbolt: xdomain: Avoid potential stack OOB
read") turned struct tb_xdp_properties_changed_response into a union of
struct tb_xdp_error_response and struct tb_xdp_header, so that
tb_xdp_handle_error() can safely read the error field of a received
response. tb_xdp_properties_changed_response() still sends sizeof(res),
so since that commit the response Linux sends is 36 bytes instead of
32: it carries the zeroed error field, and its XDomain length field
says 6 dwords instead of 5. The other responses changed by that commit
are not affected, because their non-error members are already larger
than struct tb_xdp_error_response.

macOS sends this response as the header only. macOS 27.2 (26B123) keeps
re-sending PROPERTIES_CHANGED_REQUEST when it gets the longer response:
after link-up it repeats the request every 1.5 s, ten times, and then
resets the link, about 15 seconds after it came up. thunderbolt-net
logs in and passes traffic before the reset. The same host stayed
connected to the same Mac for about 23 hours while the Mac ran macOS
27.0.1, so the change in behavior came with macOS 27.2.

Send only the header again, as before that commit. The union stays, so
a received response still has room for the error field. Linux
requesters accept the shorter response: tb_xdomain_match() requires
only frame.size >= response_size / 4, and tb_xdp_handle_error() reads
the error field only when the type is ERROR_RESPONSE.

Tested on an ASMedia ASM4242 USB4 host running an Ubuntu 7.0.0-38
kernel, connected to a Mac17,6 running macOS 27.2. With this change
macOS stops re-sending after the first answers, and tracing shows an
8-dword response with length 5, the same as the response macOS sends.
The link has stayed up for over 1.5 hours, about 80 minutes of which
carried a multi-gigabyte transfer every few minutes. Not tested: a
Linux peer, the error response path, and macOS releases other than
27.2.

The analysis, the fix and the tests were done with an AI coding
assistant.

Fixes: 19813551701d ("thunderbolt: xdomain: Avoid potential stack OOB read")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: JaeGwon Go <ceo@logictree.app>
---
 drivers/thunderbolt/xdomain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thunderbolt/xdomain.c b/drivers/thunderbolt/xdomain.c
index b187a60..563a8b6 100644
--- a/drivers/thunderbolt/xdomain.c
+++ b/drivers/thunderbolt/xdomain.c
@@ -509,8 +509,8 @@ tb_xdp_properties_changed_response(struct tb_ctl *ctl, u64 route, u8 sequence)
 
 	memset(&res, 0, sizeof(res));
 	tb_xdp_fill_header(&res.hdr, route, sequence,
-			   PROPERTIES_CHANGED_RESPONSE, sizeof(res));
-	return __tb_xdomain_response(ctl, &res, sizeof(res),
+			   PROPERTIES_CHANGED_RESPONSE, sizeof(res.hdr));
+	return __tb_xdomain_response(ctl, &res.hdr, sizeof(res.hdr),
 				     TB_CFG_PKG_XDOMAIN_RESP);
 }
 
-- 
2.54.0 (Apple Git-157)

