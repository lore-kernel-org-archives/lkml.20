Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971BF414411
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 11:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790941325; cv=none; b=EwpYzyZfadqlv0o+Tz4SdxM8VC1/BpQ7wEsfWLgXiV983t4oUbcqmRfnemO8h9e3K+M+UrKUfbKeOSwFHO0RrpW0W508RoJDt79FfsdChe9ZmA2AXkvIG0XKj7cDoFr6pRqg8d7MrsuYneIE5MXjVNqZ2taT84fLPoNJUdoZnIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790941325; c=relaxed/simple;
	bh=0HME7YAue9Ez3zFgKD4fOkc86Gr+NWrz+gcBY5iv6ZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=czUnrBCuOvPnrGQAeLyVK+oEvX4GobaTR1TjBSMHeDTG4GKkXCJ0m9iMTcTOp3xlkrv7LJbPraQ7B9uRiiuNYeoYBohiSOKpt6dh5drmy2aHWCivRsej/ypzgceuduQ+wsT58qggvH9viU077buSI4VxAyFh+uHM//bOIYzq/fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vkyv5zxx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vkyv5zxx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so57185195e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 04:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790941322; x=1791546122; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lGLqvieqnE02h9EB6P28IAqIwdIX6XiTDkEFIeR6SM=;
        b=Vkyv5zxxtl1e+p+bVQm4a1MSs2YSdRLFeXQysore54jq9070l9bR2RawjAbs3XB7VL
         ppYl63+SoSif37WmOI6fHB+i1WsJylTXUKh8JQFKaTigVSFg/NYHKGvmlLkLL/+toswr
         jLhs3i2yCnSbNDN6pH8WzIzkLj3mqFResgxebzrlWvNvCv8dBQVrggSo8oWxchdvJ/7j
         BtinvUTOLj09p3BiCxHrlRpbFuFjtMyPiJUUE4K/y91nhZsYxrkb7WWSKGo6nItDXMOS
         JT6jUvIqK6/fvxZkoRJhLCtLXqU8bWYMzDLwPyKmxyg9FEdlGLPYox6/qUfnk1sxqtcz
         iLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790941322; x=1791546122;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+lGLqvieqnE02h9EB6P28IAqIwdIX6XiTDkEFIeR6SM=;
        b=FAlqEDNcIXda5LZqxI04Vb3EjorD5QOG/0N9AIEWkgLtJ0FR+O7Es8b6ipQCf1snlP
         6EHoHf/bFzWZoMy0SIkAvEagOLFjfMN1X9d1gQYFqfEXVrJoX/mo/I3+4jMSeHOl6U6+
         KBuwkjdjHsSQkdlqR6pFTU6KUuYPf4fRPkAu5AXoS947GXa4MJfuQHSVIOdGhObb0eHE
         aWxsUgtnI2vqLlDKeeHedtzsniMwF422+eTk657Wtc1oIneizVcNFSSSUXNlzXqYikmQ
         0GjEVQ2rMV3UgID6XGEvVl87GzoywgoED9cV3v/R385KFt8u6zKqRWx9CVbmX+PDlGUn
         gNuA==
X-Forwarded-Encrypted: i=1; AKwUvByHdg2GyX5XCYTbJiqnlnQ45IsMMpd6n66JeNmm7GHfgJg062PsdkvbsyAkFsHuQZbpnsT8e0GesSOpBHw=@vger.kernel.org
X-Gm-Message-State: AFuF++nktaLaBv8q6zBwfuobFgT1obKjrOGRktvYBZ8ylYOtH/Xn5kDq
	4Bhk8apKBPn+nJRXGsvsQQwcABhDz8JYVTPNOTHm1LgJxGHLAS9CMHf7
X-Gm-Gg: AYBFou1SoOyuk31KiA6bgLSKJtx7VBK2VVIum12hO1MyQyny9/Ea+HCcjEQ67udbiK7
	twMuKtChe/Mek/gk9afw2fLzVZWAD+qGQ9rSbTxM1cgafwxI2QthJ9+t9MN6YhjK2X0QKi6opkx
	MKiLCzMDnKDOKeUSId77NGBot1kT531afq850g3o6HQzgPpVljgRoa1bntEjXB8iZmcLt0d1I/u
	zvkFJYMrK4VXKsUtsmvam7RqCq7OsH5K2NJ/bDcbVEau+FIuOQ02M9XOz1ahYoW1ElO4TdZGN/t
	1FqgnpQxjCfnPdVMWt3xTpxQierCqR4c1TCxO14/dlX9FRvYi5PovTgZRmuLbNerzlPhDZxZ2EP
	tpcRcSy1e9LHMrtzcuHgu5Qu9ut30pQpaVPb8uaAvzucCoGr5tkXPc75MRxI/sYZQnkczlbKO+l
	YAj9KBS+NJj1UozH1cWbGyu/KZeJ2nMKj0D+8NisVlW4ltbWqvN00l4bonZM2CaOUWXiAy
X-Received: by 2002:a05:600c:154c:b0:49f:fe88:e7d1 with SMTP id 5b1f17b1804b1-4a02769c438mr50006385e9.15.1790941321624;
        Fri, 02 Oct 2026 04:42:01 -0700 (PDT)
Received: from localhost ([5.83.201.219])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027727cecsm77397725e9.9.2026.10.02.04.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 04:42:01 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-sound@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] ASoC: tas2781: Fix spelling mistake "config" -> "config"
Date: Fri,  2 Oct 2026 12:39:52 +0100
Message-ID: <20261002113953.1782731-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There are spelling mistakes in deb_dbg messages. Fix them.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 sound/soc/codecs/tas2781-fmwlib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/codecs/tas2781-fmwlib.c b/sound/soc/codecs/tas2781-fmwlib.c
index e8ceeb027e1b..182aa98e29c3 100644
--- a/sound/soc/codecs/tas2781-fmwlib.c
+++ b/sound/soc/codecs/tas2781-fmwlib.c
@@ -648,7 +648,7 @@ static int fw_parse_configuration_data_kernel(
 		 */
 		if (strnstr(config->name, "calib", 64)) {
 			tas_fmw->calibration_config_id = i;
-			dev_dbg(tas_priv->dev, "%s: calib cofig = %d\n",
+			dev_dbg(tas_priv->dev, "%s: calib config = %d\n",
 				__func__, tas_fmw->calibration_config_id);
 		}
 		/*skip extra 16 bytes*/
@@ -1438,7 +1438,7 @@ static int fw_parse_configuration_data(
 		 */
 		if (strnstr(config->name, "calib", 64)) {
 			tas_fmw->calibration_config_id = i;
-			dev_dbg(tas_priv->dev, "%s: calib cofig id = %d\n",
+			dev_dbg(tas_priv->dev, "%s: calib config id = %d\n",
 				__func__, tas_fmw->calibration_config_id);
 		}
 
-- 
2.55.0

