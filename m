Received: from mail-pj2-f28.google.com (mail-pj2-f28.google.com [74.125.227.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F614B7A44
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 18:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789671127; cv=none; b=s/AtI+0LJAV3CbJ3a0wd9qkub+Ew9UHKFQtODVFOaY6yauy4I/rNLI81roRMJnhZdxiAnN0nkZBUL/xuLHaVblN5YaQqR3TtC+xAwmj9Tq31RgyNlJr7+bqtd8JkYtspj/TnMmbaf8rWR1o9wq2ZeElZO283cg42YPKRx72bzdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789671127; c=relaxed/simple;
	bh=t2Rh5HicDYfUhDshXxIV+ToBVIxCOdkpflXNAhRUTLk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gpYI2Px6h1TwSyWry4V/T89r5rOEOAysW7cqbA4up17NcNmtUjYRPwzSM2iTbkcTisV67X0sZ/6i8ZMSX2pCCI9X1eE7yJL3KfSnIJ5NrRnhUqhj8aE1I8804oEXCf/9ndBBH3Z3+Su4rM8XyUubAvYEG1F853KrrtsZFT7/PYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T5pxtX+6; arc=none smtp.client-ip=74.125.227.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T5pxtX+6"
Received: by mail-pj2-f28.google.com with SMTP id d9443c01a7336-2d91c22d27dso8068055ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 11:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789671125; x=1790275925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NmX2iathH1BothbInV/Ke+WVEC5Ed3SbwmWKrISd/bc=;
        b=T5pxtX+6IDQgsCLgsdHKya62Qy+iLqBixxRGItznFZ2qExnkwK5zPbLPSU97n09kPT
         kwSt6zXMgzK5GW74d2FoX9hiHPPFBOCfGqtFsQsCQpCRZcJMPT0TbJWX+vEuB8ND7gxe
         a5gIp9KfPXyuGLmVfXh0uAxbdWthhDShicbT2vRKYMEmCLx5WFRKkMQv1hvzrF8JRAZT
         mum8WZXoiIihZ4UzF0dOBZtyvPg8RO60tc1APefWtFN1WfhRuCeCzEEVfrWNZZRsK+GP
         DPSEiLZeompA7Ns+0ShqNrFEhhlf98ubFsm1xnX+vjxtlSj+1gmWaZG4nxoTSS9alAVY
         hn4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789671125; x=1790275925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NmX2iathH1BothbInV/Ke+WVEC5Ed3SbwmWKrISd/bc=;
        b=zrzYhRKZkFPOSA7Qs6h4mVIcmBcfKIT+EK79Hb/quboghweYUjuUErOmQa8P9DwFBE
         RhdIEeFZyqpJhueTt7zOwh2+jCRd/Zbd77FlBOsOhx5mURhdqV4JLVHqDKaHrzg2XSSq
         4Kccii557PGIr0T+XnbjZA2wvWQNapyq2fGvIfAAjThFFaTazOpHe/Jf8krVsK95585a
         BOHokUD6PhDLTC2Bm80/S8hjN+TWrUpFVHn9WTqs8sahotp7d/qWf8IIbF4uDTLBAPSc
         AfjzsgIxrRffaaoJmpkCqL9hstWRXFlBf0FU3v6N5OOCnIN1FVdb7nx1PJIsCNttHcHH
         uOQw==
X-Forwarded-Encrypted: i=1; AKwUvBx+yYl+cyK0Em/BUOr23w/+/REAGrPGyoRmAZT8iV7Bn76u9NKAzlPVMvHUZd2S3KYGH2hrWZDsl6wooug=@vger.kernel.org
X-Gm-Message-State: AFuF++lLnaTgOxOIaH/K53bLcs94lM8TUNXbKJE6NRiAQfmzIzJCOEVb
	OK5rN++XuOMNOhkmZBKGGfq7eLc0KIg1Xl8lm7o91kVebrSd+mfxZsps
X-Gm-Gg: AYBFou0O17h5Mm5izxArgUQMaxMrM+hfv/h1k3wKJVFR4snpdHlGTSCdPj82P6nxF8D
	oEGZ+BWw6bqBAXg1A+oW+7eqJS29mMFDVO3CNa+P8baWCojwD3QBxI8Sdi9oMaC400vjD/mTZcE
	BiKBq3HaYkc/tjmu3mnSSSsZhLdKY4P56JZT/pk+6DohToTI4JZHwiu5OP/OXVU1W7SQMrv4aLi
	q3gDV9RuxJliv0S57lU1K6tCDYJzDJRitGR245LzjNqsi6jx79PzWUTdTjkK8w1XkfrfoTdzXcF
	L/C1XRbJQPgM7BOXMjPzWvJiEQxtwKgP2ZYUPxEksg6DbHCBpP9+RnFW1tW83wLGpBM+Gb9D0Jo
	z9iWwzOz0Z6GNK1yqSTjzEt+PzdrQtr4GBX8ERCn39sqLGub2ONNh7Xwd09cUmh/F+ftM/UKjmq
	pLxRks8YXuveqEdcfBoX0swhwuka4aLBuCJeDkuhPtDi9ST0grRcU5PVeIWZ/+hL4vFq5sOMHjN
	mxFeOwzGCmURVzmBrY3JfcgRQ==
X-Received: by 2002:a17:902:d4c4:b0:2d8:d4dd:24c0 with SMTP id d9443c01a7336-2ddb1b97ee1mr2276265ad.21.1789671124852;
        Thu, 17 Sep 2026 11:52:04 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89f331b7sm31032655ad.82.2026.09.17.11.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 11:52:04 -0700 (PDT)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3 1/8] net: dsa: motorcomm: Remove YT921X_PORT_MASK_* macros
Date: Fri, 18 Sep 2026 02:49:48 +0800
Message-ID: <20260917185010.3189199-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917185010.3189199-1-mmyangfl@gmail.com>
References: <20260917185010.3189199-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove YT921X_PORT_MASK_* macros since they are only thin wrappers
around BIT() and GENMASK() and are not used in other places (plain BIT()
and GENMASK() are used there). No functional change.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index d663af010f43..5acd7d27ff40 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -108,46 +108,41 @@ struct yt921x_info {
 	u16 external_mask;
 };
 
-#define YT921X_PORT_MASK_INTn(port)	BIT(port)
-#define YT921X_PORT_MASK_INT0_n(n)	GENMASK((n) - 1, 0)
-#define YT921X_PORT_MASK_EXT0		BIT(8)
-#define YT921X_PORT_MASK_EXT1		BIT(9)
-
 static const struct yt921x_info yt921x_infos[] = {
 	{
 		"YT9215SC", YT9215_MAJOR, 1, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9215S", YT9215_MAJOR, 2, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9215RB", YT9215_MAJOR, 3, 0,
-		YT921X_PORT_MASK_INT0_n(5),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(4, 0),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9214NB", YT9215_MAJOR, 3, 2,
-		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		BIT(1) | BIT(3),
+		BIT(8) | BIT(9),
 	},
 	{
 		"YT9213NB", YT9215_MAJOR, 3, 3,
-		YT921X_PORT_MASK_INTn(1) | YT921X_PORT_MASK_INTn(3),
-		YT921X_PORT_MASK_EXT1,
+		BIT(1) | BIT(3),
+		BIT(9),
 	},
 	{
 		"YT9218N", YT9218_MAJOR, 0, 0,
-		YT921X_PORT_MASK_INT0_n(8),
+		GENMASK(7, 0),
 		0,
 	},
 	{
 		"YT9218MB", YT9218_MAJOR, 1, 0,
-		YT921X_PORT_MASK_INT0_n(8),
-		YT921X_PORT_MASK_EXT0 | YT921X_PORT_MASK_EXT1,
+		GENMASK(7, 0),
+		BIT(8) | BIT(9),
 	},
 	{}
 };
-- 
2.53.0

