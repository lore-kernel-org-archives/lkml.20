Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977354;
	b=At0eO88btF+ivY+PLDFeKxQRPWx/SHlJGsapmsEQoFI+34r+nvnWHqtWlTlX7nVuIik7
	 8ZB+VfVypd+67uAwJyxEeFPiH1WmTzsSdXS2Hq+/tiWaKihbnKFC+9tHJ9KJycSmEPmAa
	 vn/FA89cdXiJLB2UaP8q2/9oBGW9HbWAWWeb22VhtPBP27foubo3yWxkrg5FRwf7xWv2P
	 nuhj90UzkTiH4mWZOHnJgfJVznB9UadHcaY/d47oLUsBT19qYCmw0bwbgAJQ4wbRBNMN8
	 SmvztDAOdwgDyeo1F3KY8VUtUCgP3ZA0mZkW5K2beNWyhJmux9Q7iHtM3L4Ab4Huy2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=lcDTBznm6PCxmTI9iFN9G2u8m4G/v9BYzzES5VWgkB8=;
	b=nwyezGcfCyV/zH9gYJ+CU+kMi0EFgtGkvxAf44ae3WdIlxVpCBkwQWI01bAZMMs77vi6
	 MPC++lq11BK0dMU4hfD5kZ5QSEOMH6qJF/YBueW/l026li7n6C3FDccg5DqnJxMi17P99
	 YYRE16kkmpU3AuZziQ22LqR96yazLfuFYecSvy8rCKCpxIextmdBSDXkgl/Pm2/lOtXoa
	 xtR5hnS2aiTRunW7avpP+QyhhbjrE7Yins1SFE1r8mnQSMg+JlB16Bne4HTMIN9UEJg5x
	 qoZKRu8HGe+fSjFp05ONymhoSi/X0LAAOa6OIoQMttN7nh/gVkg5UKB9zJ61FzKv9SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBHRC6uQ;
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871C5606D82C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 15:02:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 871C5606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=KBHRC6uQ
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4697404c2bso93204066b.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 07:02:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793977352; x=1794582152; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lcDTBznm6PCxmTI9iFN9G2u8m4G/v9BYzzES5VWgkB8=;
        b=KBHRC6uQCoIJICbVcFKCA9umbJX5UqAa5jWy9K8GLNS7UHzAPrrJyPydZbj2O4TCgy
         P62RNhlkPHn11KUz6GGRoMNrUm/bWXWNMpkFuhBTr+mM7QSJEX8JOHU4fRIHFCIKGzAi
         d9xyclvtJ+Ht7ok95Z/bp5ULXtd3YcWf3pgChkUPMdRcW8X/MusUHzBdWOlFxq3xD4S+
         fMtoJHx6oHIvc5wO22XBXU5FKM9Ux5J2qdQ3gTkPjH4/HN+au7mHQICJblv3UAn4fBlf
         oDOmGbU9QN2czTBxBEtQCV2aGHmP2x4qgY1/pibcoCiz/iDBksYt0x8rR69a0xrmMfdy
         hpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977352; x=1794582152;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcDTBznm6PCxmTI9iFN9G2u8m4G/v9BYzzES5VWgkB8=;
        b=MnvldHBykXVBT34YaaDLwVJjJ11fWZprO2rtrUMES2++wW1ccRzj4mViiolQydUy11
         V5mpb0VlnG8+RxT1V/mhGpzfqV2EoBlDGOIVH/Y2bkFuGNlmHl+L8dPWWNzsHbAfE4i6
         9DnAQeQS5y+UzdHRcHe/ALaStpHAVRI6vrvoU+ikhzSSoEKJuny+Af1VO9gPDsA0xKca
         sQB8Fle2xUxX9mjtayzQEibHxFZYVWX4dB30wg2dT974TRDxIf1DmlI3/hA3P/+dueo+
         mSKeC5FA0ja5P70Zz+4tBTmh5pDZMWeH3ieq5kL4+bYHT+hZ7F2qAsSYOHVjzjvpBNBl
         5p8A==
X-Forwarded-Encrypted: i=1; AKwUvBz6myQN7O6lwbn2Hxo7YQEizmvo6yL+y/MX5cFunTvw+CtXknTmyR/tCnB6XYpS70ch+IegvSRc0yRnaOo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9mKPRpN+w8n71tjWhi1Y5FGvKUKFaR/ZG8xco8VTu6VrAZU+Hp
	yvxInH/KsnAbKBwilXKY/mlA0R/NFeXN7ViqFy3bVQdoiF9fFH1ZceEh
X-Gm-Gg: AYBFou2i7PFP8Ig6SkzpCsHR4CtYimE6j03mZnc7Rmf2eSmkqN7Rq0TxR2inYCWyYCN
	9Y+z/AFUb8stnV2LOud6cMKgFQgmmvzqpIsONOrbGJ3K6z7Ruza5UEHx3kGDM0pnqJvVcm4LFF2
	uAAfp3jqHO3l4fbpb0JZsPZ5TEehgYw4NyP1ILtvflY1fp882TvwUv8vUrH585cjhCuM60/3GkJ
	blOzsv6mWUG7xM1UYBJyEV6+JLGJCSkmBLeutNbWMszWa/6MIDUrX50jeai0vzI1blIXzwjj7nD
	+l+vn/eF7s5SYKvGpVYIHZT5poISa9Xdzvcbpg3+/Ig8avDZcU6pFzEa3QZ8NnIjGTvGIyNvQyv
	VJiw46i0DzXb9T9KWLunbDfK3mF7HmMRtn3vP/ZH2WTZsql90X2ctrg8p6H7oaY4QfqqBdmmxrV
	eEs2hNdJZ6fa2064bxPaY+9IsEdXhWn9cd2O1nu+woiD48hArzEMYSax1Wc+u6KKWoE6Ou5+BsN
	8P7uE13+oNPQaebvHcJFT+XcCUWdQFo7do0yNcdMDFO6YVWxGFOuhr/G+V2ke7B9jWXvN3Gl+yr
	Jac/NjLRIMfdDk1UdBkjh/nvv0lkAh/AGCc6BNc/0OGGUHaflt4taA62lo9fr4DwRvDZHg4nHEe
	gL/0A33eWVrJHD6hkgBJQjHIuh7pL6lfkQ48qZt7PLuHXemaWIwMCAIaGzhZhMiVvN6B1NP1k4s
	oj
X-Received: by 2002:a17:907:9805:b0:c2a:cf73:63fe with SMTP id a640c23a62f3a-c4d3449c402mr242731966b.6.1793977351894;
        Fri, 06 Nov 2026 07:02:31 -0800 (PST)
Received: from desktop.home.arpa (2a02-1810-1e16-ac80-898e-1938-27eb-b890.ip6.access.telenet.be. [2a02:1810:1e16:ac80:898e:1938:27eb:b890])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356a2ee4sm84905766b.60.2026.11.06.07.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:31 -0800 (PST)
From: Stijn Cleynhens <stijncleynhens@gmail.com>
To: netdev@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	=?UTF-8?q?Alvin=20=C5=A0ipraga?= <alvin.sipraga@analog.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net v2 1/2] net: dsa: realtek: rtl8365mb: use IVL in VLAN 0
Date: Fri,  6 Nov 2026 16:02:24 +0100
Message-ID: <20261106150225.3700205-2-stijncleynhens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106150225.3700205-1-stijncleynhens@gmail.com>
References: <20261106150225.3700205-1-stijncleynhens@gmail.com>
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

DSA installs the FDB and MDB entries of standalone ports and of
VLAN-unaware bridges with VID 0, and the driver writes them with
Independent VLAN Learning. No bridge VLAN sets up the VLAN4k entry of
VID 0 though, and it defaults to Shared VLAN Learning, so the switch
looks up and learns frames classified to VID 0 by FID. Lookups never hit
the IVL-keyed static entries, and a learned entry for the same MAC sits
alongside the static one.

Set up VID 0 with IVL, like every other VLAN the driver programs.

On its own this has no visible effect: standalone ports do not learn and
the driver does not control host flooding, so the unused static entries
only meant that traffic was flooded to the CPU. The next patch, which
moves VLAN-unaware bridges onto VID 0, depends on it.

Fixes: 336e3e4a1ab3 ("net: dsa: realtek: rtl8365mb: add FDB support")
Reviewed-by: Alvin Šipraga <alvin.sipraga@analog.com>
Signed-off-by: Stijn Cleynhens <stijncleynhens@gmail.com>
---
 drivers/net/dsa/realtek/rtl8365mb_main.c |  8 ++++++
 drivers/net/dsa/realtek/rtl8365mb_vlan.c | 31 ++++++++++++++++++++++++
 drivers/net/dsa/realtek/rtl8365mb_vlan.h |  1 +
 3 files changed, 40 insertions(+)

diff --git a/drivers/net/dsa/realtek/rtl8365mb_main.c b/drivers/net/dsa/realtek/rtl8365mb_main.c
index da06f952a..b90e46c16 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_main.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_main.c
@@ -2232,6 +2232,14 @@ static int rtl8365mb_vlan_setup(struct dsa_switch *ds)
 		}
 	}
 
+	mutex_lock(&priv->vlan_lock);
+	ret = rtl8365mb_vlan_4k_setup_neutral(priv);
+	mutex_unlock(&priv->vlan_lock);
+	if (ret) {
+		dev_err(priv->dev, "Failed to set up VLAN 0\n");
+		return ret;
+	}
+
 	/* VLAN is always enabled. */
 	ret = regmap_update_bits(priv->map, RTL8365MB_VLAN_CTRL_REG,
 				 RTL8365MB_VLAN_CTRL_EN_MASK,
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.c b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
index 8d49ffadc..58948e76f 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.c
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.c
@@ -322,6 +322,37 @@ rtl8365mb_vlan_4k_port_set(struct dsa_switch *ds, int port,
 	return 0;
 }
 
+/*
+ * rtl8365mb_vlan_4k_setup_neutral() - Use IVL in the neutral VLAN
+ * @priv: realtek_priv pointer
+ *
+ * Untagged frames of standalone ports and of ports in a VLAN-unaware bridge
+ * are classified to VID 0, the VID of the neutral PVID. No bridge VLAN sets
+ * up its VLAN4k entry, which by default uses Shared VLAN Learning, so the
+ * switch would learn these frames by FID while the driver installs its FDB
+ * and MDB entries for VID 0 with Independent VLAN Learning. Use IVL in VID 0
+ * as in every other VLAN.
+ *
+ * Context: Can sleep. Must be called with &priv->vlan_lock held.
+ * Takes and releases &priv->map_lock.
+ * Return: 0 on success, or a negative error code on failure.
+ */
+int rtl8365mb_vlan_4k_setup_neutral(struct realtek_priv *priv)
+{
+	struct rtl8365mb_vlan4k vlan4k = {0};
+	int ret;
+
+	lockdep_assert_held(&priv->vlan_lock);
+
+	ret = rtl8365mb_vlan_4k_read(priv, 0, &vlan4k);
+	if (ret)
+		return ret;
+
+	vlan4k.ivl_en = true;
+
+	return rtl8365mb_vlan_4k_write(priv, &vlan4k);
+}
+
 /*
  * rtl8365mb_vlan_4k_port_add() - Add a port to a VLAN 4K table entry
  * @ds: dsa switch instance
diff --git a/drivers/net/dsa/realtek/rtl8365mb_vlan.h b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
index 27a526b61..809034009 100644
--- a/drivers/net/dsa/realtek/rtl8365mb_vlan.h
+++ b/drivers/net/dsa/realtek/rtl8365mb_vlan.h
@@ -28,6 +28,7 @@ int
 rtl8365mb_vlan_port_set_framefilter(struct realtek_priv *priv,
 				    int port,
 				    enum rtl8365mb_frame_ingress frame_type);
+int rtl8365mb_vlan_4k_setup_neutral(struct realtek_priv *priv);
 int rtl8365mb_vlan_4k_port_add(struct dsa_switch *ds, int port,
 			       const struct switchdev_obj_port_vlan *vlan,
 			       struct netlink_ext_ack *extack);
-- 
2.56.0

