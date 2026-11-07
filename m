Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794053834;
	b=DnXdHapST79adNe8tnBU+iPJcJ3wol2VkcV6EkNR8JafydXrBSIJjOTDY3H7Md84SImt
	 nJinqb0N3sfFjAUZ9LPpJ9rHP6c9n9Css59KKIkxMLKY04hcuLbNC1URpPxb4tIaEuJ6n
	 KzHeuoG4YRupn2+hzUvPYeFr6Ym6LNjy4mp/6DhMkMFvrEvIcCESPcqR9lm2ciELtACdG
	 480Hy9Y9JgxvTksw7ZCPC7sL8bGA4NgGGfINOKNUM55MPs2ZJwmdhSZcxHnBqmco1XhyF
	 YeIsbVDJXpO4+VZsFXf5QTbcZEdyobLmPlDfzx852h4pEM1YwUokObADiLppxpQjF3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794053834;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KIQZbQKy130fuucWbkcIp9PHo39UBfLSN5H+7TgfSpg=;
	b=gIzyKLIk542aGDKdLgZ0ou7i+qZ6Huu6QrDMyQroX9ouhDHNJtUN8l7pDSiSFwITZy/U
	 RmSwEJHX25i/Ly85h3qIyHll/LspV4LoE9XiLg8NrBQMrEUmm1pF8/HiF3bENFwv4gMvB
	 Xh9gUjMSp13Wm1iRZlrVBL9cA53VfSEqy/hM6uq/D2P7ROGBV+HON0yz5BWjTlEqc7KcA
	 oC8qnFSPcpm7W79XkASks3ON1HKcdfZXdOQrmbaCt8M8O09hXX38RkUc/ei2qzEUmpzhI
	 tdv1eYpPtlocTApmD+Tekvl2i+L4DYSnDb/AGi4qDxzNjQIrXsKmKVLZRYPlrlKNa2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0x6F2Te;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CBF606A330
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 12:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5CBF606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w0x6F2Te
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e8da6ef7ddso8511815ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 04:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794053833; x=1794658633; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIQZbQKy130fuucWbkcIp9PHo39UBfLSN5H+7TgfSpg=;
        b=w0x6F2TeTmZK7yOvvONdVplgR2zaniUGKs45YabILlP9H9SW+aATY5mQd2usRzJ8iR
         iCYhqLAi3j9eQ/TpyC9vu/Ta4x92UBeJLvU6mJNXbi7v8IHEuICAg9MMbl6vaaQ74LJk
         Gqa5hMAHerGLipr9gs4U3OlaOqpbTljsUkL4tHU+AMlzkT1+yUXFeJ1mw5ydsN20KMyg
         yvZ4yuEvoxcDIKg1d+TvmUsblLVF79yG7B1lPmT1vfJQssjD3YMMIcHfAekkvgFd9dlH
         UZ99apgm6z3L3Kgrfg47Thhds9kgogWllCjZo50Gg1VRZIL73sQdICrh7rC02OZAkbUE
         dDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794053833; x=1794658633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIQZbQKy130fuucWbkcIp9PHo39UBfLSN5H+7TgfSpg=;
        b=RMqaC5a/RJTYQLP/MvLeKhNQCDUarYZ2n3UMaAO+KuBNJJjaU3FTcXx4xDDYJegDK/
         vh9qMCh2wo0nW8P8OADHoUFJfnmHUmFPhn8ZxIMiwLuKY3t3puAI/34u8vkuoPg2EbbL
         pRBvC7u3GkUJysle+kCbVF2n0pNGImlA2D+v2EkayDGovbyUYqdChSSBnvqZqb/GzHEQ
         yml1bn82khHHvXLRaKkC33xziPkTsk6SFb4dOz4QHLP1fIpDO06v9b5T4CTBie7Rnata
         T+pOXOJ+6HVHY22fVIrBQaM2aZW1V8az6YMhHGo00n7fevgUn2x3OB/EH6Nhd7DSekTV
         TxOg==
X-Forwarded-Encrypted: i=1; AL+hErH+DVHazK7vYq+kk8OdZLmHIwuOfDmBmqGQvPbeAC6ZnBjr7DBkKYphHHZqc5zvUidkJ0qk7ij7rGuRGk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4NGPc1XCg3WN03T1FTWbfyKp0/vEYk/Qft/UTKZYVlPfVRANc
	OBx4HE44ThvKUen2zgQBzGc4lYugQ7KCIMyW3ZSDjXouPbJ8ryFHicfk
X-Gm-Gg: AYBFou3N3JZmX47dlHf8WAHsNx5IaG19gSqN7S/Y3tLRzpEiuXUkO+EUdwAjDGulFfn
	oz4E3OE9LUpqOySyYpVOs1WWTtTGJg4jR1SjGZAAeh2EeV5xkeUM8Nvm6Ngcwj0W2Yu9PSRqt3I
	E3Gevoc0HyfuWToFxOId2LzCmNelQAfpmgFbbbHccIXY7qOIJq3947MzZkdVmpvTZLwJL2g3Z14
	Raywu4+wAEplISvdq3RLyJB50Ps7pZBvNIx+I0MCpuQowblPdVNJbiz7/Xl0Ip0pmu4DWMQ9pA4
	DPAVmrBcaYDhtLxmk23Rcf57j27LKBEpxGvwZb12lFkLOAkN2d5WMmSfeek0qnbU9V0zvgNgwKX
	PD65CHTjyv6ciRuLN4x1gL0c4V6QRch6gpHPybD2VQHec2VTcz+Biby9QD/yxLnJWIX1ckA8h+T
	gB6pi/yugXTA3weoeVhAQBdBctWMpI+UcAhGSfMwqApqtLN4tjVKPCL060h9Nit/Ui7eFiq8hj1
	wEbrNOgvk4Y3BY00t7OE6nhTHDolC+Y84obpkTIReeM0iPEhee8Bqcjd5NAFK3d7DtomLshpF57
	fYOO0QXnd4jitmNnLyJ+ptaV/H8zmhCj1TSGri7gChaPJKvV2Lwafw==
X-Received: by 2002:a17:903:1b08:b0:2ed:18cc:d3a4 with SMTP id d9443c01a7336-2ed40ded9bamr65229485ad.46.1794053832990;
        Sat, 07 Nov 2026 04:17:12 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d5f35asm12773555ad.49.2026.11.07.04.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 04:17:12 -0800 (PST)
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
Subject: [PATCH net-next v4 1/8] net: dsa: motorcomm: Fix VLAN SVL and learn limit definitions
Date: Sat,  7 Nov 2026 20:16:22 +0800
Message-ID: <20261107121631.1040612-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107121631.1040612-1-mmyangfl@gmail.com>
References: <20261107121631.1040612-1-mmyangfl@gmail.com>
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

Bit 3 of the VLAN table control enables shared VLAN learning (IVL/SVL),
it has nothing to do with S-VLAN tagging, so name it SVL_EN rather than
SVLAN_EN.

Widen PORT_LEARN_LIMIT_M to the 13 bits up to LEARN_DROP_ON_EXCEEDED at
bit 2. Nothing uses it, so this is a no-op.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 4 +---
 drivers/net/dsa/motorcomm/chip.h | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 33e5fc127244..693564aeaec1 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -922,9 +922,7 @@ yt921x_vlan_aware_set(struct yt921x_priv *priv, int port, bool vlan_aware)
 {
 	u32 ctrl;
 
-	/* Abuse SVLAN for PCP parsing without polluting the FDB - it just works
-	 * despite YT921X_VLAN_CTRL_SVLAN_EN never being set
-	 */
+	/* Abuse SVLAN for PCP parsing without polluting the FDB */
 	if (!vlan_aware)
 		ctrl = YT921X_PORT_IGR_TPIDn_STAG(0);
 	else
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index fc315f1d8f87..d9425afc7bce 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -240,7 +240,7 @@ enum yt921x_app_selector {
 #define  YT921X_PORT_LEARN_SUSPEND_DROP_EN	BIT(18)
 #define  YT921X_PORT_LEARN_DIS			BIT(17)
 #define  YT921X_PORT_LEARN_LIMIT_EN		BIT(16)
-#define  YT921X_PORT_LEARN_LIMIT_M		GENMASK(15, 8)
+#define  YT921X_PORT_LEARN_LIMIT_M		GENMASK(15, 3)
 #define   YT921X_PORT_LEARN_LIMIT(x)			FIELD_PREP(YT921X_PORT_LEARN_LIMIT_M, (x))
 #define  YT921X_PORT_LEARN_DROP_ON_EXCEEDED	BIT(2)
 #define  YT921X_PORT_LEARN_MODE_M		GENMASK(1, 0)
@@ -357,7 +357,7 @@ enum yt921x_app_selector {
 #define  YT921X_VLAN_CTRLb_UNTAG_PORTn(port)	BIT((port) + 8)
 #define  YT921X_VLAN_CTRLb_STP_ID_M		GENMASK(7, 4)
 #define   YT921X_VLAN_CTRLb_STP_ID(x)			FIELD_PREP(YT921X_VLAN_CTRLb_STP_ID_M, (x))
-#define  YT921X_VLAN_CTRLb_SVLAN_EN		BIT(3)
+#define  YT921X_VLAN_CTRLb_SVL_EN		BIT(3)
 #define  YT921X_VLAN_CTRLab_FID_M		GENMASK_ULL(34, 23)
 #define   YT921X_VLAN_CTRLab_FID(x)			FIELD_PREP(YT921X_VLAN_CTRLab_FID_M, (x))
 #define  YT921X_VLAN_CTRLa_LEARN_DIS		BIT(22)
-- 
2.53.0

