Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7DF2459EA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 00:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790122484; cv=none; b=esmpqGvLJq1GgrCDCdf+9T5u1cB9t8s3K9JxZUs3mCX/JhX4AyPLX+6I3YebYCAMnoAMe8Y08lrvszPUJ46hMoV8lxGD8QUxX/L+r+9Aq2aGmU4x+ZTBhEX4N+w9z9mMkXqRbUZr2yOb3/2cBuF+sgcSJ8zpYRVm4p1Dc9Sskxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790122484; c=relaxed/simple;
	bh=7GlmDoyW4bfU/UvvrDoTiuGj6klREMUqUByskEivwuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qRlHmwXa1pntol1HgDU+SbBw64WpI+CHNtoFduXD29yXeP448Quuh5johAWPxavW9b8F4FBRsOGgFd9QHNfT+2aBYDsVZ/aL+dxcKGO6nEYsZA1MwnOsmINmTO1ohWJfqzVvKEg0yrIBMA5EuecCh+GYxz5Pk3JgEs5rwdukhgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EmmxGNIt; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EmmxGNIt"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso2022475e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 17:14:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790122478; x=1790727278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=EmmxGNItM0/oONoD3PEE5ChQ8lru54k99Fs6ABQTS7Pk74/sl9BJyadNYcxJthzyYU
         HCURTxvMD1cUW06O3MRVwAxcswZ0EOzjSWG/GRC0XoDrvRM2waKD8OB7qk+sYyNk6whJ
         lMempJ/7WPeZGqePqszC9knHFHCu2MCPEYmV3/mbD7NhLh6ahkBKU0g2EFWqBDYlAgwU
         3FKnuooKvqKPito7BfMGGjCjrHLEt7iK6XlHs+I5sebw2Sqjfxe1KFprzjXX1ZQr0be4
         uv6+Uv+XOw081tAuIAQtrygk+nua9Q5+Au2iYA4IuT51HlU65/KNWpEzY427p8SIaJx2
         FNDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790122478; x=1790727278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=y8O9ksJOqp9+jtP5XpH3iEGTo0rkcgPVnwBoT/uLCwp9oMxfLfu15tRvb2OjWqxfoM
         Z1u+GAfWIelzwObzK6320vw69IT0+DQs4yl6CSUjAHKi+1oGjwuf1ApJnERB188VDnih
         QWt2RhgvaHaAPlqe0NoW6NFYt3YGfUx2ij2scQqaPpaVo+7ozr9UClZ0zCjif6zPlwa7
         eEqSjtj01mZQrvS4DHyi2K/Wd13/BNkkBTKf6wRUYiS9YcbFzZ7ZZ5hGEVs3Xjoeouyw
         hAfuzXxBU9DAP020+UO8FJp24rvr8xsWJk1JO1jZ0RdpYL+4BbXlgGFk7cUtu1GUFS8S
         g29w==
X-Forwarded-Encrypted: i=1; AKwUvBwIlvxaMAJ/4qlRrJOJEwawqr08BW9o7GGw5DkKSqlnMMoo7U1DRvJBQXx6cuy/R+KdGMs/FHe+Q4bOCzE=@vger.kernel.org
X-Gm-Message-State: AFuF++mks7u6I3PvEelrM++vtUW33WnMDUYRw2rDqzHhTTggRiVlUEjW
	Vz0jWbTQJuq/vxTwbTK4+qOTFvUZIp1aqmZaiq6p1WNrZJwnmutdmC8j
X-Gm-Gg: AYBFou0zavPoI6QZS17OeDtR8NjBH/PnOKGtkuAVBJi1DtCLCACG3JK6k3T7gCocn8F
	zrr7ZYWEuk7u6W5AvPHUEl8SbgL0JOZ8jK/BJPSt6VHo6Q4IkIT3n9s2YS4O8NGfwN79gXtCipa
	5zA5FjWBHIHCz/yEPk0pHDsKvB8mkI8fB3YIJJc8WltfPuYycWX1fHF5vmQQm8Z4qTJorapf0s3
	fQRUItS4TZmt+g/MNK5j+G8/baOxxWeCmu3sNZwDEVEB4lGeiTqxILpP3eqP1Bl7rUvl9kllHcW
	huUL6bFSSNGM/0o1kQAGlFncvMfujJ3kBfF+cSIK0/4vCHMWxKDjEOYU4f6tNbJRO0MT6WaDcHP
	TKt7Nzx4CXJ1gE3N6RIhAOdyU+7mDkpPBEszRcezVTaRxKyaVaE2wbJPDa0tAkX2DMvgft5BbWs
	1T5DuaWZbtUNAQCf8KaoHeaO3BsrwE8BFARsgewpYVbWgdo6oeESzS3H0f1PW4+AzGOhdbLS+N1
	fyy1BU30OKvuYwuBxMI9VKSK1V6TXklgmCWx2+sZPlBe4jZ9/YJ2QRGSoAeZD+blgVoT8RKyj2p
	v4nOkawOXRPzAG7dcHrKKMsdG/w1OxmwChs8zw98P6axEZFPkF2XpYXKd44hDcXHHWY3mg0MVwu
	9TJ53lqCkA6lVwRXyj6zZlwGOuxBaUARP
X-Received: by 2002:a05:600c:1f90:b0:49d:17d4:aff2 with SMTP id 5b1f17b1804b1-49fdeffc657mr8698955e9.1.1790122478142;
        Tue, 22 Sep 2026 17:14:38 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-8c68-4a09-6ad6-6324.ipv6.o2.cz. [2a00:1028:c000:ddf:8c68:4a09:6ad6:6324])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde180a39sm34612165e9.1.2026.09.22.17.14.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 17:14:36 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <v4bel@theori.io>,
	Josef Schlehofer <pepe.schlehofer@gmail.com>
Subject: [PATCH 3/6] media: drxk: stop retrying after disconnect
Date: Wed, 23 Sep 2026 02:14:07 +0200
Message-ID: <20260923001410.30297-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
References: <20260923001410.30297-1-pepe.schlehofer@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

drxk's wait loops retry I2C transfers on every error. In
dvbt_sc_command(), read16() can leave cur_cmd unchanged when the read
fails, so the loop can either exit early or retry until the maximum when
the device has disappeared.

Stop retrying on -ENODEV and return the error instead of continuing with
the command. In power_up_device(), check the final transfer status after
the shortened loop.

-ENODEV is only returned here after a USB device has been disconnected,
so this does not change behaviour while the device is present.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-frontends/drxk_hard.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 47786d0610f0..0815083e54eb 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -467,9 +467,9 @@ static int power_up_device(struct drxk_state *state)
 				continue;
 			status = i2c_read1(state, state->demod_address,
 					   &data);
-		} while (status < 0 &&
+		} while (status < 0 && status != -ENODEV &&
 			 (retry_count < DRXK_MAX_RETRIES_POWERUP));
-		if (status < 0 && retry_count >= DRXK_MAX_RETRIES_POWERUP)
+		if (status < 0)
 			goto error;
 	}
 
@@ -992,7 +992,8 @@ static int hi_command(struct drxk_state *state, u16 cmd, u16 *p_result)
 			retry_count += 1;
 			status = read16(state, SIO_HI_RA_RAM_CMD__A,
 					  &wait_cmd);
-		} while ((status < 0 || wait_cmd) && (retry_count < DRXK_MAX_RETRIES));
+		} while ((status < 0 || wait_cmd) && status != -ENODEV &&
+			 (retry_count < DRXK_MAX_RETRIES));
 		if (status < 0)
 			goto error;
 		status = read16(state, SIO_HI_RA_RAM_RES__A, p_result);
@@ -3199,8 +3200,10 @@ static int dvbt_sc_command(struct drxk_state *state,
 		usleep_range(1000, 2000);
 		status = read16(state, OFDM_SC_RA_RAM_CMD__A, &cur_cmd);
 		retry_cnt++;
-	} while ((cur_cmd != 0) && (retry_cnt < DRXK_MAX_RETRIES));
-	if (retry_cnt >= DRXK_MAX_RETRIES && (status < 0))
+	} while ((cur_cmd != 0) && status != -ENODEV &&
+		 (retry_cnt < DRXK_MAX_RETRIES));
+	if (status == -ENODEV ||
+	    (retry_cnt >= DRXK_MAX_RETRIES && status < 0))
 		goto error;
 
 	/* Write sub-command */
@@ -3252,8 +3255,10 @@ static int dvbt_sc_command(struct drxk_state *state,
 		usleep_range(1000, 2000);
 		status = read16(state, OFDM_SC_RA_RAM_CMD__A, &cur_cmd);
 		retry_cnt++;
-	} while ((cur_cmd != 0) && (retry_cnt < DRXK_MAX_RETRIES));
-	if (retry_cnt >= DRXK_MAX_RETRIES && (status < 0))
+	} while ((cur_cmd != 0) && status != -ENODEV &&
+		 (retry_cnt < DRXK_MAX_RETRIES));
+	if (status == -ENODEV ||
+	    (retry_cnt >= DRXK_MAX_RETRIES && status < 0))
 		goto error;
 
 	/* Check for illegal cmd */
-- 
2.54.0 (Apple Git-157)

