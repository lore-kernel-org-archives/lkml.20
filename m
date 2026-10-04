Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E16BA3ED13E
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108476; cv=none; b=pCt+KZWZmzlQF6FKbm3KWSBCk+fRLytZOCMvaWMLbwY0UXfMQmiEl20cNZ1jC/c9NsAkMYu4IvrarNnUaTmzFekgpIdF6gH5tvzuiWjFt6HL8BoHuynCaeTFqmlpawKsMaz2m3mairUrjtM5euGG2IPiSBe/zwQE2IaGQCPXy08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108476; c=relaxed/simple;
	bh=7GlmDoyW4bfU/UvvrDoTiuGj6klREMUqUByskEivwuc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mbR/hAcO8G4YhyDZGTkkU+QfD23iOy0N8qoOGd24J6HtdNuyuBMiTcWVlHgtWJasJgF/fJf1DKVvY1CghWXLF3ZhkXydW0sdSJlr1m73YkBgr5fA5R6zWTWA9moNauDDAoRP9YYeXq5JTJGw2Id+16hd7KgltqzRXRW+YcpkkYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0hWqDRe; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0hWqDRe"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af5ae31d8so622543f8f.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108473; x=1791713273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=L0hWqDReFy5sz6MdzVJmVFHswZC+TVOB2Ra6qnGgWWPAdKiSpJEd5BBdXi/95TwBsS
         vsC59XPyUWaeMECX0O6Ty//kikgOaPqlQ46Cb2hggC900t5TmCriwcG03eTy3gwi3m90
         6RPNNuIX+k7hQ6xzc+lHcbDGmS1iYPwm5H7gRib+A8uxloEGYwaA95hiM3CydhnzW0dy
         /3k0UaHDb4yIngVn2Xbdd7i3wMDwcIvp68lmn7yp4vdsYfhF7Hx2pA4MNMQOp0VtA+Go
         5glCSQOn57Htbi2nggyPGPqTKtyc1AYLF/7FnD0iA49nYUvEWR2WJszdSesktLVt/gW0
         jvmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108473; x=1791713273;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7MGuNB3b/Yy22a1g9JOUlAf9mYM1EW7M9T3gG75yYmM=;
        b=1yEBZDhZiNx1VAJ/PMWWlrK0a8sLxinS0ViYX6uktkccb5EOUCOZlqkuh/X/Fl5j92
         lAzpmC9E+ckHnmOownhdQbSGFFFy0t6P0y0q7hZ733RAE+V/BkDCH8quBi8TjrhDw5Fo
         pVaDE8PgZ1PEQAcLYBtuI/wiK05A5Fg0OmxD9AxUMppp2jri1Qnr30aFCovRereIHFrL
         PN+DH1W+HVd4+snPRaa29+kjRhc/ZzmhCqKjr+zRpN0QsXxjtOwhBV8ARMYJIqKkdanN
         TumPLeM2QAUYdHCfvSh1N9YUlpn7Ku27lBvDjXLL07tCP8Fdx2pR7FU+G/sqPrKdWDkk
         egOA==
X-Forwarded-Encrypted: i=1; AKwUvBwc7Xz1czGBqj59EUgG9c1K5LEel6kk8/w3IFd+zjVi0dOg1pC/ruRmQKz4TiiAzQzD36B8aQuJ7o7rNWg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCGgry/ezXYn5hGtIDDBBJZchCYW/ywqFBfQ/+ai/RJaFLGJTW
	6jq4Sxev3uFt//5jWF59DH2zNrItxjFtmte2IFW52uNuRjPVIvD8D5X+
X-Gm-Gg: AYBFou2qykoU5Vb2JELAuzyy+2szCuN6JDLEUR95/A3n/l8ci4msMLl9W0olHKyJR25
	x5+9sVK20Eq9Wnt7wNO2Qo+XvLCNG+KoerCd2Ryc5G1a6r4sM0DKwF1ZsuVFhI7MFvZYs2h4HEJ
	f2LRf//RTkyJy8Vk2NjYdkqG63E5ZPLt0sMyx9s9rkOu7vLE8zE2Ptv04Or0mkaPxd8/ywsHPCR
	QnOEGf4jx00cc48an6K9GIcDOYNYj1y33UdYSqduh+4ooE2v1I8/8mukpSxzwzgXTjXDcMd707k
	xuZqZV5NqVMsaz0pT0YRz9b4F0I2LLmz1nzZ8Po815Rr1oH+bpvuzkHDIVTx5532mVdPnfPkN7f
	BSfoje+ztLOrmmqdtHEilKamvwxurWmdhdc0bnX5PAj/l3v4Kur1OciDieHG2yUw4M2GbeCeatJ
	NFCj/nEdM38QQPPWcskyc3QDBpPG4+Bj1QolWghEaY0qpKqT6YsNAaIGEblsqSWbVx5gA4EJ1fu
	iWOvf3AD00ct0nHlox9YBBx568uanPPzSWYA9KW60MeFbGPgbE0Gm/EBEdKhWKbUNHTHzewDdsc
	sIr56yOCtY94bzC7VB+rOOFOV+k0rbC5TZTvVv3fuDvSKegjMjdk15mHlFiPsfhGE1HGQ8EquvC
	pQSweMx7l8fzTxxHsFKpb
X-Received: by 2002:a05:6000:402c:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48b12726a91mr14815824f8f.53.1791108473037;
        Sun, 04 Oct 2026 03:07:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:52 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 3/6] media: drxk: stop retrying after disconnect
Date: Sun,  4 Oct 2026 12:07:38 +0200
Message-ID: <20261004100741.71711-4-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
References: <20261004100741.71711-1-pepe.schlehofer@gmail.com>
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

