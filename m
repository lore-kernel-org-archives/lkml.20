Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793950732;
	b=mijY4A8T7PFSV69TFz1+PQvlRq+LZP+JImeEkg0KUd9lDmicLzC9bwQLopZ8/uR0nIwq
	 R5hYcu3V+EeB33N2vnyWL4K1wfWI+NHyvZp7Z3lPn0DmpO6UHreLUHL1FV2DSX+lzi7Dv
	 JLJyEriAPzAavjLv9kHSwj72Hao5ED5lPPL0WvraT78YIvlIOyX/XGl4JajAiLQNKxE1Z
	 ZXZLhyqMH3eYTiYkYwoo2UYv5crNIRHcMtFlOTLyuEe99GdmpaYLYjhMPiJTuZwlc+HqU
	 EQIzJDxodjJB64vU6h46HEBvx1AgeAwkirW+JlZJp8/LtbBBuMCp18fpfFKTGnireqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793950732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=jHE3vz7ikpP7qewD4PpZ2JFR+MDb2MgvZURmQJe0rMo=;
	b=2eybNttsDFwNzf1ey4XszdWPD9GujNx2xJKhYVQBuPhNtNj6U0+aWIaH/igOIK3MusJh
	 ASiiWzI0Aa9cpl3iHXBBIA/ROI7lpFjLYAKGiL2h6oD818wHmjXXKKF8tsiO9XvBYTTNl
	 z8d46kxsLajp3wq4XRRuEOl3CqVPQP2KPpX2/5L/24dGCexqlXaQkKAT7cJ9ZjySPqdAa
	 bEaeMYq841+/I8dqh4w8UvasJJRwgJ3Y2UNVvTAwLgMkUK5x40DJfvCYEVEIANeBRx5ph
	 Zdf96W8LtqRB+qRh/L4hiC/PwZwjrPFKLNLAufbXx6iC5u/lsK2twsqebR2V4JT+r/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NlNe/frr";
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7656606A331
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 07:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7656606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NlNe/frr
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so248959b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 23:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793950731; x=1794555531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jHE3vz7ikpP7qewD4PpZ2JFR+MDb2MgvZURmQJe0rMo=;
        b=NlNe/frrtlcja4ikQ6zCLaiq3LV/AVqKJVisxf8JrVlcEse+/QA0BrfzW2o7FLuIau
         5S+l9WISDC/r0FT+E9KasPbxy3ZN6MeHSdva5bkibt/ezw0h+PwEjCvtiC0A3x2X6Uij
         GvZefyQciriMPFvB+hirOSwBXIkFeyE+LqyvUgObE2fMSrPNyBRxkHDxGEbk4/+KitrX
         X5oQ/X3XScvH0ioGiQ5QPSF+71Oy8b0ce9HpQ9o+KzcNdZYyoW/IdJK6OKYli3zXKrso
         K7hpoTYx9S1XlCSwtq83nsMBU5ZVW/lseEUm+6k3L4SXxetZe6dyBasQdbinso7qJrJr
         QEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793950731; x=1794555531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jHE3vz7ikpP7qewD4PpZ2JFR+MDb2MgvZURmQJe0rMo=;
        b=iorzoE96XhCDfIVSwLvMzd5sPGY0oL6JMUcQtceL3Nd/nO2EZv5hyWRrs+Rqw1+ugB
         hCP1izXyebsCB7x4wOtrM5ABD3yD5VtiBgEJYDdPBp2qtNIljN+xDuqGpk773xowuCOX
         DeH+uo1VMMT4PiZNx7djS+37B7ziL49tZlS0WnhEnvvVuK6dhGA46FnMNuULQCbfEbAV
         vhrsHUcTlncXNe2TAlCfPkYiL6d8ONn9kcIQyDCYI4rb0KIhm8xZCfKefVnz6uwEhgjq
         GADKWWO1grGAPh0ry5ReYnqjcHLavVpbDG9BYQru+hScLKkaApWFsk2XwxQxWB0tvjFf
         x+PA==
X-Forwarded-Encrypted: i=1; AKwUvBy8MFcIEG6JbM5QyBHA1qNvD0GrqdhYsq0TSK8e2M6pFz69IeB6sunBlVtlbe9SeLlND5mB/WzSkX+r/3M=@vger.kernel.org
X-Gm-Message-State: APuU4Z90FzkgEG8bjyzH9k/Z8UgmBhNHU4wusICONBNYpYmaxUxBpZZ5
	UUgs0vHsvXaE/gKOLJx+CnFz1qTon/bbni0a+4QUz6jleB5PziIP5VaR
X-Gm-Gg: AYBFou1OHF9GfzG1cs9TwfOljsEgzakI8k9kQpXtFl4WYrvrVBerX6+xuaLU+bRtmnM
	I2dj0W7VEuU/tzlRGrdXyXZywT+qrftCHSe8Zwmmr6X/vpPOc6DmCYyILFkJOv++a9BamWHBu5J
	luWWpKoJFhV9qp+bW6657EinB8520uXY1o8F+z2CroWdPCghg6Bu0112w7IKpw3d6UFetFe2fcX
	LDTK8DzWgplmudf0ATLQE7ZaFHHJ74yJxq/ajeE70eOIE/2BLaS8QVxV1wlgow1b9NW63ldq/ku
	QRWkJT0L8SV42RQeJM2HUJaMgdY7MShmxVnzKNHlsV374fCgz9c75y5oUbEa0gGztjSIujoAJZs
	DtSy79OWQNbsmrUrfWbl0M7mYbbIpQoHI1tmXdNB9XaLQF8GfOw56DWVLSXSkiTA8g3m2CTrSyJ
	kzg0NrbkWIdlJLezmsJD/miv99gDIdjkWzatOIcDG3qlQaj9S69G0PB3wG5cxVxzpPOsS2u2Pv8
	NmpesFyqnuBz8ZeB9J51xkjQIMpbFJwTW9qR7bdDeTfdJW03iqZP1PpPBQtR7glLkkenr1SUKre
	7cLRvdHIFHrRyJ88OtVc//v9I3Pmqlbv4/oY/jczrA0LCu/YWPGnGHrW9F+dkdKIwGYD5j5kUQ=
	=
X-Received: by 2002:a05:6a00:10d1:b0:89a:19ae:10e9 with SMTP id d2e1a72fcca58-8b37bc58291mr1552546b3a.38.1793950731077;
        Thu, 05 Nov 2026 23:38:51 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:7680:28::4:396])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b3597efd53sm373484b3a.23.2026.11.05.23.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 23:38:50 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v3 1/3] net: dsa: motorcomm: Fix extack message on unsupported TC actions
Date: Fri,  6 Nov 2026 15:38:00 +0800
Message-ID: <20261106073806.112122-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261106073806.112122-1-mmyangfl@gmail.com>
References: <20261106073806.112122-1-mmyangfl@gmail.com>
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

No extack reasons were given to unsupported TC actions. Set a reason on
the default path before falling back, and drop the now-redundant
initializer of `reason`, so the compiler warns on any future path that
uses it without assigning one.

Fixes: 8eb9e7520b17 ("net: dsa: yt921x: Add ACL support")
Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/tc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/tc.c b/drivers/net/dsa/motorcomm/tc.c
index 9dbd61e48fee..90b017a11a1b 100644
--- a/drivers/net/dsa/motorcomm/tc.c
+++ b/drivers/net/dsa/motorcomm/tc.c
@@ -1034,8 +1034,8 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 	const struct flow_action_entry *act;
 	u32 *action = ruleext->r.action;
 	bool seen_priority = false;
-	const char *reason = NULL;
 	bool seen_police = false;
+	const char *reason;
 	unsigned int i;
 	int res;
 
@@ -1122,6 +1122,7 @@ yt921x_acl_rule_ext_parse_flow_action(struct yt921x_acl_rule_ext *ruleext,
 			break;
 		}
 		default:
+			reason = "Unsupported by HW";
 fallback:
 			if (cls->common.skip_sw) {
 				NL_SET_ERR_MSG_FMT_MOD(extack,
-- 
2.53.0

