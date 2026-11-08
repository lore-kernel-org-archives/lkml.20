Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794174312;
	b=rYTp+b3PBEBltxeqmLhI21SVegWDm04C0oGNy8nJQHluxcypIwXMSndh3559VAptZzLq
	 9u8V2y1BVBpuJ1qMyxJb96bSFXI2CB09qqu3lblSwECLWpbUJQMRiLPsCRwnDVROBhzG3
	 dGArFqJEtrEzG2+3bzegjqc08P6/BCBDcw7g3iKBJhOodQwZo7btuiEh0iE1iY33ChZnO
	 Pz8qGCjXwpAOisQ1YZeNxCCKuQFSddswJL5wEUbjPd8BUzaNcTz2asZEvfn8bHHF8v8eI
	 QqRKwm2iXyUs8EgnU8b2ZQyVbSkElMq9XghWU9LDpuCOXdBYw09UGpO5IK2Obg3vlEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794174312;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KIQZbQKy130fuucWbkcIp9PHo39UBfLSN5H+7TgfSpg=;
	b=vEn0ft5iuWecTRcEMrM/JW2g1OaNM7hwdvO3gUjZ9kSXchjWSs/AYjjoss48+5vrvi1O
	 /MJtfnnRsWdOWGoiKQLSJlVhap7dlooEAgKlzYqV+8sID0Lb5NZjxzQzML24yhPTLkwqq
	 o3Y5Ud6dPGxoa2mldJOT2ZuiyCkKSyvpbtZ8EOkEUnQp0frPgMz524MnPmjOe/Np9PF2U
	 M3y7rLbnWn7fvsOSY2nxeJjWVUvHaHEutZWtdJydWsUrCylJj3LlfLvlp4kTvJbvGWcV3
	 fKBxwVJ9LoeEYcyMSb9o5ohR41shCRqhW6tmmGQbrWT1lRWHMU4LPdAzG9i28HDgItQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FjE0158q;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1323606A325
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 21:45:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1323606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FjE0158q
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0d09df973so203636a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 13:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794174311; x=1794779111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIQZbQKy130fuucWbkcIp9PHo39UBfLSN5H+7TgfSpg=;
        b=FjE0158qwAenQ7Dbefzf7Ht3gJ7yYSw0c1CN7yh1wXZkrjRhoTxVbV0HnPkOOsS2ui
         K865EkqlpMYVc1arxn86vwDSry29GRkrGZd3HnZ+ZFJLpDYVG+q9swlQKEq9brcVVa4/
         vdXOf9jCWfORm8/kOuizjGYW2O1Sa+tnQtPKZoFxQIJOXBcSLwkCxbiXyxNjFASIAmQq
         IO9teBO0dKt5DrIdhljDxYwrLJOF5Y3p6akXfyi0L/nIyiLVKgIm4b9X89sxvd8ulApr
         57gEryyTc5HBC/dk5vdbFxg4mcEQ9rGMC+M1tNarGfF6jFqZ7y0j9Hnqo+207/Je92iV
         dmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794174311; x=1794779111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIQZbQKy130fuucWbkcIp9PHo39UBfLSN5H+7TgfSpg=;
        b=QBtOXNzxohLFWZrg97X2BxaBo3AiYTmnNaBhluy3y9o1KEKQ1vSRaFDR9MOQfn3Rih
         m0bqjn/yyQEz8GBevMrfYK2n17u7H6g0CnbGGOz6i7CJfGWlavrznci+N7/wr/XnDwZ2
         JMOZ1SeuJztrchq6PcpH82Z4eMTkhRIPD5ZDCg6MXGS8GyKo+JmgItdp2X0QFLR7umDu
         pTnpX3dgeAEgA746mFPizrXlHpSWLL6JAZ16YU1VC8I6Diu7Dq2u6lin0gubsVlRjaWP
         WwjzJNZljw+26idfUAWQpNJl7jUpqDljw3VxHVdT9AHBHwDAvYUJRVS+GmgQtO+d0PTj
         aShw==
X-Forwarded-Encrypted: i=1; AL+hErF4BbbIM2Nqw4cU8HKcAqp6m/C23Bor4ZM4trraI4cPbH9D5HXRd29vBu33On/gVJrolt55kvNJ/zQNCkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u7MRb32s1UbJBpLIJnB92PMQCTv0aHvDjEekoPunn7r9YRQh7
	inMsHbfU3/ojzUgZqy5hAGx657ZFacs7/twR/vDungf9PpZ2MsxjF6SNr93zhA==
X-Gm-Gg: AYBFou10J2sTGfrfaLVN1zLnWCKu1TKOeDR3jetT1vJAxFFUGue2mSbVXt7hSWIYeak
	k7NRZ/7vSSaJNTQ+VMFUx37/qplK+WEB4eKqDJnjtLCpjw5Q+UajemhWRM3Pg6tuI+FEMkSrOi7
	G/Pf8mH3zCS1IyEfJ7nt6ietKcW5StIgTMGZdxi3VKzC2749DbqKSKN/JazKaGyMt8oaZk9Dmsf
	qkBnTjh6l3ctxYoQFZCBMyKF48q6u06Wi3XM66y4/T/PINzPWYZlcfQYft4zxaMpNzts3LfidIr
	ZbXgy1VVmN3jXlfheYPzsRVp1dTIYAKnTYAKr/nzhqPlHHRmNXJCUb05XtGiG6hOnq46WVGwLhN
	ILWgVnzidvTMycZvq4cPYA/Y3IaFYi6xpuiWxUfFfh2QSqhxYHXvqKZaOOb6nltNQYSlz+0GT4A
	SydldnRKUWUeucrzflkO6frh3imqcbyRGVFVBpSG4nIDhA0oCU3bQqpeYXfwfElCV9eTu6hCROt
	IzUNkgx+Dn078G8Ov57t8jc6uIJcEJ72vGyqzA6uH4w/aITpKeEyKstxXMQURo4KAhhnowSkzxe
	uT9wiigduQOTdxDfzAPUgw+9ywInR5Ggoh2qelLeFBuFyp24kVHCJA==
X-Received: by 2002:a17:90b:3a10:b0:3ab:b39f:41b9 with SMTP id 98e67ed59e1d1-3b12d502ed6mr2080177a91.61.1794174311287;
        Sun, 08 Nov 2026 13:45:11 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1034718f8sm4619463a91.4.2026.11.08.13.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 13:45:10 -0800 (PST)
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
Subject: [PATCH net-next v5 1/7] net: dsa: motorcomm: Fix VLAN SVL and learn limit definitions
Date: Mon,  9 Nov 2026 05:44:41 +0800
Message-ID: <20261108214450.1662362-2-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261108214450.1662362-1-mmyangfl@gmail.com>
References: <20261108214450.1662362-1-mmyangfl@gmail.com>
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

