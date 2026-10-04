Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A86C414438
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 10:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791108481; cv=none; b=ZhocKHkM7jlXFtU4RHnFcJ5D4Txpgy3SwWXB6046oXB3O0MeHpL+ibOBRZN1qVwBXkKxxXYQ257qvqWHgRZpK7po4FoU1qC102BZNZ8Q3ZXw1KO3qu28ctE5fHr7Kjg67xABF6YG2XOeyHNaodKalcqgm2INrqQxefsZWmJOOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791108481; c=relaxed/simple;
	bh=w/aktebwl1Y3XGcI23NvEGJ5CAnVHvAXb/qbZPYpZaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PaLlpXGDlwZWDIz4xFRyS4vv5quQsQjapLBiG+bYKhyhwuGyqdiiA2WnyDKH8VXBUSTla5Av4b5lJNLVNxHamz20/0Fb9PeiSfXfMHDqc37t7HYrjSsr2aeuZXcuL5Dm7sI6BuE1HtRON6GyJH092HRxxPgW5ZVtC0qzWowl3cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVC1sdbo; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVC1sdbo"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a1706a2b24so1070405e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 03:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791108475; x=1791713275; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=PVC1sdboPFGV77NYPF9giKf4qyQbA8sW+Hw9bF1JXpyZs0Nh92WyiqbIeFqlozDbDz
         nyl/X4zxdJjYlqrwTleG1b68/PSm1FIlV5ghW2WZJWCCnzMc1on4YG9EfuW8orZ6BOmh
         WllJVyG9NrzbLMy4oBkNMNpO7VMiQRk1mlT1HSg0fhI19xRGT4tlDR8TJ3TfZOx7wXeH
         d7domTPhFKTzHLFlwKMQ6N0j87x0Z0wfEejXjOG/jSCJVNY3eoDraVX0dr3ph3YHcvWX
         sgYycpbfpX36z+EXFk0zRzMocLkIilsREFbmDatYGbya2jQNRo/g076s0ZFNYIFWuZUs
         cLvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791108475; x=1791713275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43QVrNsixc1/5D2acx7HxxSlwhomqIkjYst8NKgVyIQ=;
        b=VzGLb/T0ZdpSrP0zRrvPrXXGhSoBcrlll54ZXucyix1jBAbG/S6oSw8myXDYpf3R9u
         KWS+8Tc88J30QlnvBv6m/yFB1yFEEjlgOTHUQ4WskbId7dkuHP0Gko+ose5AO/HBWdSo
         ggowb0Wj2/IEI7VlhTM6es8Y5WDezU4rHFZh7r2F12hT6TNTmrsVDnaKiRE0G68908Md
         jrRSFk1sMWHbZRhW/bhuvyapIf42rRzgJlgh79ZAoptV3FVvMQrH4PXsW9WyFaNRL54j
         BrayucxXDeHX4E8FX8Y38sQ8rT9yRI8f7x7y2LrbGEdfJQsWG66bX/fQ8smQl/jspS/n
         sN+Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrTSxWu6wTpHEmywsJv67jo800+KkZwZGAMY0ReGlL0K5VLBKyh+05/NTDFiHNhkS99HVC/JXp/78rS30=@vger.kernel.org
X-Gm-Message-State: AFuF++k7BDk+abURP3h6Tugz+R54s/jCsGFfMgJXwKrvyrK7Sb69vl22
	9my/2tYvHd7xIJqWcSiJa5bOAyD5OUPhEsyPTUf4A2Blcab5SkbvHxue
X-Gm-Gg: AYBFou1upPnR/+CE1gVu78jLgnJE5cC1dWfFRk8LSGjvnOmCmw9ddSSTLfeVzTObd1P
	FqqyPvtmmIBOz4uKleKkUUlYy52T7QxdWPnRTR3Yed/PfE1GUTiEoyYP57zTnFD3waWj3xflZmp
	Y9cITGIIf/XM5ShW4obEBNFW1cqC5t6qYqhMZR7DIaZaa9DZf7dlgYezJoDHvH0Nkc0gCjkKJAz
	/Ee/8/V0/E/Yx86vV5bqi7vwNPo/dClJ+fsnUN3nPKvHYHdskh71fyClG6aSvwMz9zsMu/qMMC8
	uY5D/06Hd168T3rcbi2IvIzwKDrMSbAa44nrgsM9/kUpEvRxoE3yTEuJeif1mO/C6sp+oqTmP+e
	DP+PK0vLYSbyGbqT/QiiKO6lmah0hRi+gCaG+kj7Xt61PwU54hRtTNIE05ziQnGOaYAj/2YxoWd
	H01sEtGFFEj8w3PiUUe31IcM9Ngj0dkrmhArHoU3kxib++d0JNhX+Od5IPa/pYVJNz6o4V4UA3A
	udU7Teg5yKC7vIJHJbcyahOnvQwwrn21h5FIXbaaEDPdByGlTILHDl6aGUhMJDSOBxOu6wCT6sm
	+1RR+mI0imAF/WZkqA2XuCuNYI7uA08irkX4aOaauZjkSkLSUJB7fydYD/t4E62cRVA78AWyxXJ
	QwgPblRWME8IrlzYoRx1tPTpb+hSMenQ=
X-Received: by 2002:a05:600c:3510:b0:499:9240:9a1c with SMTP id 5b1f17b1804b1-4a027559c6fmr132249245e9.15.1791108474647;
        Sun, 04 Oct 2026 03:07:54 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-c000-0ddf-b17d-de75-1ac4-0a1a.ipv6.o2.cz. [2a00:1028:c000:ddf:b17d:de75:1ac4:a1a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b38104602sm18136032f8f.26.2026.10.04.03.07.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 04 Oct 2026 03:07:54 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hyunwoo Kim <imv4bel@gmail.com>,
	Hans Verkuil <hverkuil@kernel.org>
Subject: [PATCH v2 4/6] media: drxk: stop accessing a disconnected device
Date: Sun,  4 Oct 2026 12:07:39 +0200
Message-ID: <20261004100741.71711-5-pepe.schlehofer@gmail.com>
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

drxk continues frontend status polling after its USB device disappears.
read_status() keeps issuing I2C accesses, and drxk_get_stats() ignores
the error from get_lock_status(), so callers see "no signal".

Enter DRXK_NO_DEV when an I2C transfer returns -ENODEV and reject
further hardware accesses in that state. Propagate -ENODEV from
drxk_get_stats() so read_status() reports the disconnect.

Also check the state after the tuner's gate control in
drxk_set_parameters() before continuing demodulator setup.

Signed-off-by: Josef Schlehofer <pepe.schlehofer@gmail.com>
---
 drivers/media/dvb-frontends/drxk_hard.c | 29 ++++++++++++++++++++++---
 drivers/media/dvb-frontends/drxk_hard.h |  2 +-
 2 files changed, 27 insertions(+), 4 deletions(-)

diff --git a/drivers/media/dvb-frontends/drxk_hard.c b/drivers/media/dvb-frontends/drxk_hard.c
index 0815083e54eb..df5f5ea959ce 100644
--- a/drivers/media/dvb-frontends/drxk_hard.c
+++ b/drivers/media/dvb-frontends/drxk_hard.c
@@ -208,10 +208,27 @@ static void drxk_i2c_unlock(struct drxk_state *state)
 static int drxk_i2c_transfer(struct drxk_state *state, struct i2c_msg *msgs,
 			     unsigned len)
 {
+	int status;
+
+	/* Don't touch the bus once the device is known to be gone */
+	if (state->m_drxk_state == DRXK_NO_DEV)
+		return -ENODEV;
+
 	if (state->drxk_i2c_exclusive_lock)
-		return __i2c_transfer(state->i2c, msgs, len);
+		status = __i2c_transfer(state->i2c, msgs, len);
 	else
-		return i2c_transfer(state->i2c, msgs, len);
+		status = i2c_transfer(state->i2c, msgs, len);
+
+	/*
+	 * -ENODEV from the I2C adapter means that the device is gone for
+	 * good, e.g. an unplugged USB bridge. Stop accessing it from now on.
+	 */
+	if (status == -ENODEV) {
+		state->m_drxk_state = DRXK_NO_DEV;
+		pr_warn("device is gone, stopping all I2C access\n");
+	}
+
+	return status;
 }
 
 static int i2c_read1(struct drxk_state *state, u8 adr, u8 *val)
@@ -6319,6 +6336,10 @@ static int drxk_set_parameters(struct dvb_frontend *fe)
 	if (fe->ops.i2c_gate_ctrl)
 		fe->ops.i2c_gate_ctrl(fe, 0);
 
+	/* The device may have disappeared while the tuner was programmed */
+	if (state->m_drxk_state == DRXK_NO_DEV)
+		return -ENODEV;
+
 	old_delsys = state->props.delivery_system;
 	state->props = *p;
 
@@ -6487,7 +6508,9 @@ static int drxk_get_stats(struct dvb_frontend *fe)
 
 	/* get status */
 	state->fe_status = 0;
-	get_lock_status(state, &stat);
+	status = get_lock_status(state, &stat);
+	if (status == -ENODEV)
+		return status;
 	if (stat == MPEG_LOCK)
 		state->fe_status |= 0x1f;
 	if (stat == FEC_LOCK)
diff --git a/drivers/media/dvb-frontends/drxk_hard.h b/drivers/media/dvb-frontends/drxk_hard.h
index a850a876deee..dc6ee0bb6854 100644
--- a/drivers/media/dvb-frontends/drxk_hard.h
+++ b/drivers/media/dvb-frontends/drxk_hard.h
@@ -106,7 +106,7 @@ enum e_drxk_state {
 	DRXK_DTV_STARTED,
 	DRXK_ATV_STARTED,
 	DRXK_POWERED_DOWN,
-	DRXK_NO_DEV			/* If drxk init failed */
+	DRXK_NO_DEV			/* drxk init failed or device gone */
 };
 
 enum e_drxk_coef_array_index {
-- 
2.54.0 (Apple Git-157)

