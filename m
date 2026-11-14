Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794637110;
	b=TiRL0zdKon4O5O+0Z77YNF6L00s1N6rJ+kfX/6/pLqvFzIuWs86IjbnDLbjRPcBy+BNq
	 BkqyhfhaLr6iTiZzT9c2Pt/vRVRIhP75BE5l0I7v6wQvsjDPf2+d7JiEOufV0na7vZmBk
	 ZmUmWztJWMk66zlXEDP93vM0K3D12sFW929ynAk1Ju1ejtOiOHxsFuDgj42nrWV9jUUB2
	 zz0/WJSV/iMjgY/L0D5EthIjjYX0hcYeeTg+QWGGtDggeA7JNdkNZkEpv3QhOiNXri2FV
	 9p9rLyrEYvlp4BPpH9mALsKXuJhTtv4DXvEasGsyfA6BrTo8hMNPxgWmQZ8A+Jsgo3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794637110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=grc2+M/hmuGZdiW2psJxXnm4//i3gJPfipJw6YvpPE0=;
	b=pE9B6GVfVFzoYqcgmDIOHvGIpWKVhZbRqeC1RmX3JMC9+UwOkM9saMSGfVrb+WVuyhre
	 TdKk7cyczj8kIF/3+dB1JL6sKFc0CEfG8CdEqLR1sCNa7ErP/sCiZ+LNE2OSsx18Dls42
	 j4CYaCDMlNCck1r9+c34rET3dQ7D0VV1jNPZqH3nPp3jWJDD0EAc2ksqW8nR0vcoDpuYN
	 rVT3w4bKPThLVFiwKL48N1+LYOPOIyncptCVFisoOqneYOI2+a5ZF1GYbkIz8q0pSkclZ
	 7C9lnqRQ31l+i7h/vpP6qDvzvfAqA1frjRhHPkGQk9z/MeS5ytJ6XQz5k9I2ICnW54A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhWluKqR;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994CA60A2616
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 06:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 994CA60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YhWluKqR
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-15ea896ddc8so2413672c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 22:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794637109; x=1795241909; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=grc2+M/hmuGZdiW2psJxXnm4//i3gJPfipJw6YvpPE0=;
        b=YhWluKqRJPBNKjLSnwMxbWoOzal/gMqZKRwXfTGY1HxJBJWSOZWJU3IrIPRtgkOZbK
         d/D0JsJZ3LaPP5Ff5TzSCMb6UBZQ87Cd+eVcQIzJKymJ9WgT//EEEaFVknNWEBbaYEIl
         7DgUvoFXfHWNwajj/j4tf3hnZBSFlAOexaLUhwVvy6EC1CrPT/IETZKY6F9NaznafgaQ
         Cvb+mmtJP3cB0Xtfx8VkKuGPRDjhyI2uKkvg1/PJly9hzyGNDNT7yvIVcSjxK78Qit5v
         Npn5KAczLorFi15UnddrmuCQc5oBsXxRL6gJdouv/ob5hO7azf2sra728M8Qa7HXNSAz
         3jvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794637109; x=1795241909;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=grc2+M/hmuGZdiW2psJxXnm4//i3gJPfipJw6YvpPE0=;
        b=i3hinXGapKk/ggVtDJ2jF3RbxZlOAkTztp7O6M/atFel2xyX+82GBtF24lW25TT0hC
         T+WQg0JfoLa0dJaLpg0Cz4EEj0NfSovg7kzzDbFkYpu9bvDwdr/e3fF9Ix7T85VSSShL
         eIdp5CK6ML4BuD64qq5bPLpU1Lge0rxlWFeNE5UZa3N1KTeyYYqvt9elDyjPMG1TO7t/
         EDiuWOny83+gZ3OorGjyYVG3tVardODQNgZ3gdXokE1qGhYyD2crz+2hLbP6Rfq+XMFd
         ldojoQEAHeo4I23PWgHaaIvbraEE0PjK48HLaUgW5eup/RQ5c+17gEkF3WtGkl1kMGX+
         7/sQ==
X-Forwarded-Encrypted: i=1; AL+hErGQ9ClycCutm+y3Re6fPdImkLUCuLK2S7qLmERs8wQroFEwteja9gcdnd3RbOlF3NC5/flelSG7IJaGU3o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9aWz0NKu3wEEzTUpTABVUTbK7gBUznQtF5UONVFzII3QT7RNeR
	3rAHlNg93GGEM2ti3SRUAZPv1BZlYv45bFbWf6SgVUNUoP5lV5gE3uf2
X-Gm-Gg: AYBFou2SUIMIqeq3+sNefsmPu+G4LCT++glT31Moo/Rj9WIDuOr2B7PZ4w1JwANbSBb
	o0flHPQXyhNxGxpMB77MAC3Ar4bjUJnoFOKCbLMVxMePyNNkOlBk0vPXSy/vgwpwl6xTUcXgKdU
	uiS9j501WZA7EzVLhUTvvOzrFdm5V6hObfZLFHg+X3NAElpmJpqjDCvOeItO1442Bg2XTTpnJO0
	heQdv2yF7jPXciQiv2lOi+4EhzjghGzNPCII4pZ/Ho3UdDzSnJ3Jar+1wWkLw87UDyXkMzvnFhy
	3Xm4TZSko4La/nSxVo1wjCp+8M4QCqybjsyjPfy00OiCKEBCUcEWTm6h/eArx+oj4D7JEdpLfSu
	DiOI2ZasQ9bXdNDFUZJTyfNZYrDW3NGrWNIcI7cQT+9NWTRwUd0IBTxfLR+1VIE0/0TIqHcYOMC
	Fi6AMnj8617QJ2L6WDhA8aQtOwL+3L1zosnnhdswe4UvXgVC0X9drZ2oHluVlo/FIfTRQj5WCaU
	Pgb2Fvz9hp/wOxgYxN0vhKE+rWYD+yKq4TfYRB4PDqV/EGdz2Ab7Sv/Hi6Q4jvVyCQHGYBfNQYq
	yo5xEIOito/5AIk2p9UKDW6RKTrv1q0U7zl+7xQmZrZxrJrPAxyYUSD3JmujHE+sfzEyfu3kZei
	obPCduSL9K0DpcymLd2+/9+ZpZCzmRlJM+sHEu5NbLTmZvkanL1LViO0VsESfZJBVNCm0ye91Ve
	Ww/Q==
X-Received: by 2002:a05:701b:2810:b0:137:5b9d:cf87 with SMTP id a92af1059eb24-1b502f99235mr4416928c88.0.1794637108636;
        Fri, 13 Nov 2026 22:18:28 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm13200536eec.15.2026.11.13.22.18.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 22:18:27 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Stuart Hayes <stuart.w.hayes@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Doug Warzecha <Douglas_Warzecha@dell.com>,
	Andrew Morton <akpm@osdl.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] platform/x86: dell: dcdbas: Use read_poll_timeout_atomic() for the type 1 SMI
Date: Fri, 13 Nov 2026 22:17:58 -0800
Message-ID: <6380dadbc5d515b4ce0d3322210ac44e4d541200.1794633178.git.rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <cover.1794633178.git.rosenp@gmail.com>
References: <cover.1794633178.git.rosenp@gmail.com>
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

For SMI type 1, host_control_smi() polls the APM status port in a loop
that counts down TIMEOUT_USEC_SHORT_SEMA_BLOCKING iterations and relies
on each inb() taking about a microsecond. Use
read_poll_timeout_atomic() with a 1us delay instead, like the type 2
and 3 path, so the timeout is in microseconds and does not depend on
how long a port read takes. With the delay plus the port read, the
worst-case wait grows from about 10ms to about 20ms, which only matters
when the BIOS never answers.

This removes the last users of num_ticks and EXPIRED_TIMER.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/platform/x86/dell/dcdbas.c | 12 +++++-------
 drivers/platform/x86/dell/dcdbas.h |  1 -
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/dell/dcdbas.c b/drivers/platform/x86/dell/dcdbas.c
index af4c1d2fe497..edc210852f2d 100644
--- a/drivers/platform/x86/dell/dcdbas.c
+++ b/drivers/platform/x86/dell/dcdbas.c
@@ -394,7 +394,6 @@ static int host_control_smi(void)
 	struct apm_cmd *apm_cmd;
 	u8 *data;
 	unsigned long flags;
-	u32 num_ticks;
 	s8 cmd_status;
 	u8 index;
 
@@ -424,12 +423,11 @@ static int host_control_smi(void)
 		spin_unlock_irqrestore(&rtc_lock, flags);
 
 		/* wait a few to see if it executed */
-		num_ticks = TIMEOUT_USEC_SHORT_SEMA_BLOCKING;
-		while ((s8)inb(PCAT_APM_STATUS_PORT) == ESM_STATUS_CMD_UNSUCCESSFUL) {
-			num_ticks--;
-			if (num_ticks == EXPIRED_TIMER)
-				return -ETIME;
-		}
+		if (read_poll_timeout_atomic(inb, cmd_status,
+					     cmd_status != ESM_STATUS_CMD_UNSUCCESSFUL,
+					     1, TIMEOUT_USEC_SHORT_SEMA_BLOCKING,
+					     false, PCAT_APM_STATUS_PORT))
+			return -ETIME;
 		break;
 
 	case HC_SMITYPE_TYPE2:
diff --git a/drivers/platform/x86/dell/dcdbas.h b/drivers/platform/x86/dell/dcdbas.h
index a05d7f667586..d5ad2363dd9e 100644
--- a/drivers/platform/x86/dell/dcdbas.h
+++ b/drivers/platform/x86/dell/dcdbas.h
@@ -42,7 +42,6 @@
 #define MAX_SYSMGMT_LONGCMD_SGENTRY_NUM		(16)
 
 #define TIMEOUT_USEC_SHORT_SEMA_BLOCKING	(10000)
-#define EXPIRED_TIMER				(0)
 
 #define SMI_CMD_MAGIC				(0x534D4931)
 #define SMM_EPS_SIG				"$SCB"
-- 
2.56.0

