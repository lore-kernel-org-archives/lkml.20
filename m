Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B606A392C2C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791537077; cv=none; b=NZyC7Cx1RkpTSGe3Nvj0ZMigyWtfSXnweIr3PqxxT89o65LA1mBtJdSQgtMZ1cKTlh/5yBK151yqYaabQE7VRdd6jKQgtTEyeIE5pCYTjOTZx+mlxS5sg3qsB46d+8fAvPOZieylmya7q+D1DD4rPiEnWwTX/85xsvw32/yEsIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791537077; c=relaxed/simple;
	bh=tBfBkIWljJahaYTO0anHftOa/Mal7hPXpw/F/dtZxT0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VJK91n/auHnEU+6MxJxLqPkf148vUjyefkJzRUuKkaFHqPfulp64FKaEZyHpFkqFpZMlpcxaxz/MhB3HsvFw0S615JMUE0innd4N7g3Inx0DnqKACcePnzXooy76m3LO/KPcF7urZ8EP5xj2m5wEXkSVz5WAwQrGAqDwVeiy7m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpdYpg7U; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpdYpg7U"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-141395927feso6532574c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791537076; x=1792141876; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oaT+zyiVDF+oO1apwHrrvZj9B+eawsITqiWBF5tkJHQ=;
        b=UpdYpg7UN+h24CathvVYDNLHYtq6tD+DtqREEiZTiQ4f4Snubry8dizzNgUQ/hv0NL
         Tlsya7wcE6IHsEKiKF5MszOpiPZEroMvDVZV3vDMDA/iEGqKL0x6+tQarvuJsnyUcvP7
         SmwRdgKtK73AiofHRGj3Da1PPusi8XJmNMxJzvZe/wnJMhtT0P6DLZRIOZMAMYmzCJkm
         RnyGJjP6keH4vMCd8SUZXufGCBo+yNgM0Y8DIuD9DHw05IjvvvMEBW9u0qhQEKs4YrJS
         zhwUMEs6VeJc97YQ8VcLR0DN+TGmUDAOqTKAn6uiCsvIiD5FBmrzx3wi0asts8faz2JH
         0cmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791537076; x=1792141876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oaT+zyiVDF+oO1apwHrrvZj9B+eawsITqiWBF5tkJHQ=;
        b=OZgquthJXhJ2078fd0NARSd8huD6ZM3NviaziqM5M4ci8cV+t0c68V7KEuOX8NF45S
         d49HISSggRBad+t35/dcae3uYaQX+CMgIkzul5BuCKIa3KoWB8Za30Jie7m5xYy4ps5D
         2Wjzu2BoZlCsbOiNNhWKt1dB71B0t8K1EX4pe7sEmH88PVtKo7ejP13ywu6geQrL8vFL
         bjsc9FeJnqhUQSwpSClQW7CI7VN29mepY5Dml7u/lWbR91HFAevknorKv4kCGjH2i2Sf
         rC7ooJuXZnUYlqof3FeIa/UlHP9+Wre4C5EC2o7Ponb7MOshzx4K1W+yTW9RLsUXAYQB
         GOSw==
X-Forwarded-Encrypted: i=1; AKwUvBwaINJ6OloK3zy8V1Vo6xLxDt6kjojkXYR+jvmCRgIkjE8w57OXxm3aGOXWn7cMJ7mR3vZ3EekFwDOlZTk=@vger.kernel.org
X-Gm-Message-State: AFuF++m8S/QuL7cvgFxJJzxfSzanxZuv6Ir628cvXyW2yXyF9/IjJDtd
	ZZjYSsRM0kx0vbZMFRjaQq+utJHNNBigR2N0NCBq2j8IwnJIRy2fzFJbvodaPw==
X-Gm-Gg: AYBFou13fRWbqw2KErb3p5NrxcPskIi9m6Djk6dvHbcZrK5UyShW/6dkIBnC+CsjCrX
	0BJk8Ln6AlfSm0oDjWXZZmIP83OmfoR3W7cu+ggrG6XxlpGAZXAjSEK6C+lK+YSZYgtmekW1+RR
	YnPWuXSulkkbRpyBxiKkzlSPTrGRrRL0we2f1Dz8QvY2RkTsunLWcU75iZIddJ0kPuPCZ6wzUGm
	YIJVBRGpiniuWeuxSvFGxW26jxbzTIZUK7nFNljIm7Uj/P4IpOYa8Hj9oT4TejfvHYJqTWleL2R
	HTw2KXTtg5DcxBd6pnaV5c6l/+710Fj4IY2lfvj/riouJu1dgOxXmUQCKW36tBDIEwjlsAA5CVH
	1eW+T1C/Qj1XWmoyk9IXxsgl81bqZLUU0m22v1ZswdYq/fp0dQLn4KgeHJBNP5ekIgFO38WlHeC
	5XbNFhJzfXw9+BM9pRwSXMOoVwCpvy2h2CQS8EmChxbgvLf8aOdqhpFPxreJMDT++ZptMyyh/1x
	qqtKQPxq6q9BvcAO1mLTtk63Q0r+HEOoCih97r8o+uTs29kOPf8Y5VRjAWQq8bmH06J0nE3nQL9
	D5kAFAGYqMGRBlE3J++ajN1E
X-Received: by 2002:a05:7022:ea4d:b0:144:e38d:8e52 with SMTP id a92af1059eb24-16a60ce7512mr1263776c88.37.1791537075733;
        Fri, 09 Oct 2026 02:11:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becefdsm5125444c88.7.2026.10.09.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:11:15 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Dan Murphy <dmurphy@ti.com>,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 2/2] leds: lm3532: Avoid duplicate error messages
Date: Fri,  9 Oct 2026 16:10:59 +0700
Message-ID: <20261009091059.25729-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009091059.25729-1-phucduc.bui@gmail.com>
References: <20261009091059.25729-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Most error paths in lm3532_parse_node() already log errors. Add an
error message for the devm_add_action() failure and remove the
redundant error message from lm3532_probe() to avoid duplicate logs.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/leds/leds-lm3532.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index a3bc9680dc4c..05856c053fac 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -566,7 +566,8 @@ static int lm3532_parse_node(struct lm3532_data *priv)
 	if (priv->enable_gpio) {
 		ret = devm_add_action(&priv->client->dev, gpio_set_low_action, priv);
 		if (ret)
-			return ret;
+			return dev_err_probe(&priv->client->dev, ret,
+					     "failed to add GPIO action\n");
 	}
 
 	priv->regulator = devm_regulator_get(&priv->client->dev, "vin");
@@ -708,10 +709,8 @@ static int lm3532_probe(struct i2c_client *client)
 	i2c_set_clientdata(client, drvdata);
 
 	ret = lm3532_parse_node(drvdata);
-	if (ret) {
-		dev_err(&client->dev, "Failed to parse node\n");
+	if (ret)
 		return ret;
-	}
 
 	return ret;
 }
-- 
2.43.0

