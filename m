Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 540DD3A2E0A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 16:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105767; cv=none; b=MlKcV1PNLmk6KZouMwkUyxjWSC3/JcnnLoPq0wDA7GkpsbvFWpE/lGmmCrq1wDQQBoqfs/2BLJC+Wis0FgC2NT/fml+hJmtN00T/SqDUDeBDO3MzhO5PGybRrbRKYqNCxblo1DcWiyT98uFqbBmOd84GNDK0kQWwjKNo4w2BPYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105767; c=relaxed/simple;
	bh=izFkUJVrZGWtWRP+0Tn/5mmA4bhWogEsegWu0OodXqM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fqnj1nO/3R8fka6r7mHuiXmiPWQ/BS+YrKicwvxSJwbWJ3FZwlTvFFix9IPHCNfrTe4PtHbdK8ZYLJ3p18Hk7CDYH7+D9lh3BCjM9UO4oZ59swCUlCpvid5jlmWiVf1BIZ7Nvcq/4htwagMhsJZLm5PFBkyfgUK2JRdMq8bWBU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U34CmqsL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U34CmqsL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so1857294b3a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 09:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788105765; x=1788710565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=U34CmqsLxyMtCcvAj69YvARsucH9vsfcFfQ+QtHYgO5dncuyv9kbFO40P0J+FefEsg
         qEMCQb8PQKAL/mfCyAbKZHCfr0j06yMZKMRiXsTXyQOXt2oa9uGeluMAHTVxmXVpHcGH
         06k73OO6XsQuzyIngkhsGDUAYXJq7dPKDqPTwQB/n6OqBkV6OibmNFDjya+YfGjDqhEM
         rDxXb50wSoLtGMWQzJMcObSMP0sHGArok9Ni7V2yS1W0EuBO4mHESCJgFOKQF3wtsKzr
         UAchMdL0mq9Xi+94SEGfMZjQsoqGDcBuMPONwwT6A+olhn9NhU8Pu3XxZdUla5QBkJV+
         8NUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788105765; x=1788710565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q4Gd3Zu6V237u3MJ1sYGZ7SxZwjOc/OROhTL4anxICY=;
        b=MKGAEZZ9lUOvD3IW7veVXXVLX9S6adjkyK96jdU4DiLKeTLA9yxV4VN/c7VG3L+ohA
         Zmb0+BLTdMR+1D+X3igBjhZpcSekxmhXUFObL3HcMnKqjXcppSRKehrs7KPP9aqAXnNf
         yQxk1lf16ys1qivfYAe3dn0Vrr/kZwLD3pJhrXQNWixBxyzLVOmeFpq8GV2A+UyVKXul
         GofN9PIm7mnZDnuizOhV7pQ0PahxWo4DiI7EsBHfmsLvzGrN7czCkB2dMxddGKb+/5Az
         +r+ebP2W/3HDnzLvPimfd9sUx3ujFgZ2Mk4tOzYQzVBRk8jAkYwtdvhl8yD/ecC634Ll
         h9Gw==
X-Forwarded-Encrypted: i=1; AHgh+RqkOr28jJpnkjYn06bDfayBrOKumxpbHsZCYvUVehbNqBBMRux0J3nNdubjMAwakz/8zRui4S1kw67Me70=@vger.kernel.org
X-Gm-Message-State: AFuF++kkMtoiKLtLsYog24i1ku3jvZ47NLkZCzG7A5lz+Ksr/ge5IKET
	tm3g5zR+/PeDmvp79ej1/O/Y4W4GrNCTiUQEU1tSngWglJGxl43b1DGR/8E8FsaO
X-Gm-Gg: AR+sD11hP93I6iqpnnYzYGDCepC1NBzntm1YUgW8cpIlURWbhmxE8uu4w10ZkY+m6lp
	VzBPfmNuhGkrbN2jYA63tCzO6re9BjxSXoI3J+xnrBbGJWursUt47eKRnWNb6cbyVvdpS81dfaQ
	Tg4fZwqgrAqRUhdyRJ91P2FJxoYwq5cmjRV0uIpGqC8h49GbZy4p1FbpwEkjlE/kxMpzkjorh/b
	mw6cAvr6/2IlJjc4LwIm5ScDXEUaFX55qrRmPjY9/4HJnMrmrbgTVQ74s15PbOxIDAH8/41neKw
	sIW85bzxNZJPAzQwafi9kMxIHE3D9x1qi0DaaXXjWXbVP2kGj/Wc5p001MyPNP6UPcF49pf9PVa
	cBJiHtdndiESrfHwkpfgQcD2HTPqKlqBpcoF8MAqgP/UKzHLDSbFxeNo7e3aCLLtizUqBPA1Ni0
	7GsJ1KCyU/w8ES7fgZGnCqXWidT2l2bMfC5BV7RjnO6Go6Fsdyze9c89tKb/zuvuBC/1c6FAZYt
	Jtlr0WgoZhVZLQO90ElDBHGMeYdSxJgvJPLKFTRnndaJWEZR2RZ
X-Received: by 2002:a05:6a20:4322:b0:3d3:af85:eb98 with SMTP id adf61e73a8af0-3d3af85fc5bmr16153694637.26.1788105764564;
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
Received: from nuvole (2.248.212.35.bc.googleusercontent.com. [35.212.248.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f3312270sm2839584a12.11.2026.08.30.09.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 09:02:44 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v6 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Mon, 31 Aug 2026 00:00:21 +0800
Message-ID: <20260830160025.211384-2-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830160025.211384-1-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.55.0

