Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058394C2268
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 16:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789577031; cv=none; b=JAh5oL2LqWDxMf8kmKIqfOZskvBoA7dRNRpDEn9LfdxSA27TRjNJ4EVawSPcZplZ9VroNyQOzgpv6Ay1B3W8t6PkVCQcZIHvVGQnB6FJZMz4XUUplzLldDCEawQTkKqWD+WWiTYyCFsyX7pQuC20+luNndNrDHJIqTfeGYJMVjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789577031; c=relaxed/simple;
	bh=5Mk+lnirw4Bjs33nbqDwv1cmjLuAW+fXe7zM5oJKLh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZY8Elyfl9K6kWeNUvbvC6EtcXwcbQoawGPQoK/nyXcxuTLgPk9CPYEK2973bk/xWORIOI89lPHdcqdEUZeeykRIBVSAMkLApuCoRblKE+kcCoGZtyXZ0tI1A3hV+AENlw/wKp/ml9S0D1ekD3FBga8hQXqY5McF0FyB5L8IQbT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gydTWYCE; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gydTWYCE"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so1324436b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789577022; x=1790181822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I+mpDMSv68K/PAHcJ/BXtEa2Gbm5+igpNMLOW8SgDp0=;
        b=gydTWYCEbbztBVQirfI49wWyNmmj8Vt7Iva/nOuc31KAIUVltsAUN4Q84thnjbXGkW
         IaT/wsYDvjM6HKchjd1z3xeEr7DegLX4EqOgIUCzEliWfF/I6mytjUdPkpEhJRojI7az
         R7ijQjcZrBQKzQP/YkrjCVrbYWfZxeXFTUjSPyGdHfFzwDNhDJrFbTlkGaTDCBbcmr5T
         FsIztsvnqtiWH+9533Sj7kSTMTVdq1t0nucnpFO/tc7QWgwuTLM1o2vXC4+ok94mn6fg
         ua5IRRJXPd4M7BAMnmXob4tAsQxbn6Zsfq6zx9Nl4HEUD680UoybtPa/S1jr0jxrB4O4
         y/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789577022; x=1790181822;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=I+mpDMSv68K/PAHcJ/BXtEa2Gbm5+igpNMLOW8SgDp0=;
        b=XN+n/0VeY13KAzj2LLVa/2NERAIEK15WUa0TuUTA788Aez4L3AK98CkXbERnTY/6gZ
         huJhkTtkEZRn7NAFKHzIcGLNNGq9uyrGiB/ZRpH9HCXTHO15EjNEl5mMVp1n1dnCkKda
         Tsns9QMAOE1jgvmxUmp4s3KCvu/XfpqasYMVLZ1vABfhnBLj1gNkaVgdLKG5MuurN4F6
         R81iT9c82+QhPiwH+GcFJ43achK1ySV8OeEDgmGi/IXTp+n0JDZkWkZczg3AsGpTpz98
         oMkwf0q6tWF5UfZn5K4IBUt9GHHfkYKoOIXiyCOwBgoet8gtwU9kt+vHTcfcz1IKnCCI
         DuqQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5DGomYLLZm07Sx7ky59oScHvdul0DrZO1FlgnzOCYpzSlhkp0DlryUsFrFzERNLegXlBSt9ZKyGNAecA=@vger.kernel.org
X-Gm-Message-State: AFuF++kSocaf+M4uY5es12nHpDnOR2FAcIKykUMsXFqQxVW1vS2scowC
	1D95/eXvOH9L2owVtwzAlVGFoJU+ScYZ44yjEdqbSKwkkDTSffJRy0wC
X-Gm-Gg: AYBFou0LnshJf2JxFDSExwVMlkrJWTa8ojE197zjR/sNPpUuKWY6UGYHbibc6PlUMpp
	/WA2JpZMpexjo5Au7fxKixQY0sT56VaQ9PekxupJhtfAThfW8Qrfty1oOIN6vtkmFxDPc1yvlBx
	3GpazUem0AyyWmTOGbdmECoQmDBRL68JVxoCJY0wHGnW99ti7UoauoZ+XDx5lZlHPt0zAZEsATw
	lUW6AOmAKAyJ/B9QdjX9k+eeI4MalfsccrvbMQeDqaX9YqjtWTt6beN1dgWru9isbYVpBFXA4T2
	QD2kVDVh0MJ5P4kkMJN2+FPJQRGkyirvg6NBEFWEwFdtPH6KeJVp9Ax3uhZBtv6+2IYojVxI7kr
	p07ZFkFpCyjwHj3/KMLK92BOqMSzoTaRg7ECpQeUxfH+JyrQ1Zcqjjkz8sGJ0O8ne9PkmVAB2DO
	hJFFt1vKtLX/XMBm3S5vnnhAJJmQNISZ7852F/Y/e4gEahuP7ww33NRa1fcUoGLc1Nn53c9veRE
	DDL32jH2403BDcqyzEqew3jog==
X-Received: by 2002:a05:6a21:3986:b0:3c3:8d86:9855 with SMTP id adf61e73a8af0-3dd5f454cc0mr8300273637.7.1789577021541;
        Wed, 16 Sep 2026 09:43:41 -0700 (PDT)
Received: from d.home.yangfl.dn42 ([2a09:bac5:661a:1232::1d0:c5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc50acc757csm1902278a12.32.2026.09.16.09.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 09:43:41 -0700 (PDT)
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
Subject: [PATCH net-next v2 4/8] net: dsa: motorcomm: Fix register bit field names
Date: Thu, 17 Sep 2026 00:43:04 +0800
Message-ID: <20260916164310.3168269-5-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260916164310.3168269-1-mmyangfl@gmail.com>
References: <20260916164310.3168269-1-mmyangfl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Review and fix the incorrectness in the bit field names. No functional
change.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/chip.c | 3 ++-
 drivers/net/dsa/motorcomm/chip.h | 9 +++++----
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/net/dsa/motorcomm/chip.c b/drivers/net/dsa/motorcomm/chip.c
index 45c19d962458..3a8efffb3f97 100644
--- a/drivers/net/dsa/motorcomm/chip.c
+++ b/drivers/net/dsa/motorcomm/chip.c
@@ -3742,7 +3742,8 @@ static int yt921x_port_down(struct yt921x_priv *priv, int port)
 	u32 mask;
 	int res;
 
-	mask = YT921X_PORT_LINK | YT921X_PORT_RX_MAC_EN | YT921X_PORT_TX_MAC_EN;
+	mask = YT921X_PORT_CTRL_LINK_AN | YT921X_PORT_RX_MAC_EN |
+	       YT921X_PORT_TX_MAC_EN;
 	res = yt921x_reg_clear_bits(priv, YT921X_PORTn_CTRL(port), mask);
 	if (res)
 		return res;
diff --git a/drivers/net/dsa/motorcomm/chip.h b/drivers/net/dsa/motorcomm/chip.h
index fd552f7dced4..3fb0c6a69dd8 100644
--- a/drivers/net/dsa/motorcomm/chip.h
+++ b/drivers/net/dsa/motorcomm/chip.h
@@ -42,7 +42,7 @@
 #define YT921X_PVID_SEL			0x80014
 #define  YT921X_PVID_SEL_SVID_PORTn(port)	BIT(port)
 #define YT921X_SERDES_CTRL		0x80028
-#define  YT921X_SERDES_CTRL_PORTn_TEST(port)	BIT((port) - 3)
+#define  YT921X_SERDES_CTRL_TEST		BIT(6)
 #define  YT921X_SERDES_CTRL_PORTn(port)		BIT((port) - 8)
 #define YT921X_IO_LEVEL			0x80030
 #define  YT9215_IO_LEVEL_NORMAL_M		GENMASK(5, 4)
@@ -94,11 +94,12 @@
 #define   YT921X_SERDES_SPEED_1000			YT921X_SERDES_SPEED(2)
 #define   YT921X_SERDES_SPEED_10000			YT921X_SERDES_SPEED(3)
 #define   YT921X_SERDES_SPEED_2500			YT921X_SERDES_SPEED(4)
-#define YT921X_PORTn_CTRL(port)		(0x80100 + 4 * (port))
+#define YT921X_PORTn_CTRL(port)		(0x80100 + 4 * (port))  /* Bit 7-0 shared with PORT_STATUS */
 #define  YT921X_PORT_CTRL_PAUSE_AN		BIT(10)
+#define  YT921X_PORT_CTRL_LINK_AN		BIT(9)
+#define  YT921X_PORT_CTRL_HALF_PAUSE		BIT(8)  /* Half-duplex back pressure mode */
 #define YT921X_PORTn_STATUS(port)	(0x80200 + 4 * (port))
-#define  YT921X_PORT_LINK			BIT(9)  /* CTRL: auto negotiation */
-#define  YT921X_PORT_HALF_PAUSE			BIT(8)  /* Half-duplex back pressure mode */
+#define  YT921X_PORT_LINK			BIT(8)
 #define  YT921X_PORT_DUPLEX_FULL		BIT(7)
 #define  YT921X_PORT_RX_PAUSE			BIT(6)
 #define  YT921X_PORT_TX_PAUSE			BIT(5)
-- 
2.53.0

