Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CB9323BCED
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 21:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790114341; cv=none; b=lKLngFWwpnuG854C6YUDWfTfyzskMbANpWA/uvTEI+gek8P9tnPrSboB8Yfg1SPIqY2i8PAWsZnzmJ2ShBAJhsrT1h9MiNhrw7dQ84o9lo4mCuPrpcxUsLtiAI6ZvPNiBE19IcOHbNY2EH9jcj1r5aqAzhMPI2ytN/TvPkrT4Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790114341; c=relaxed/simple;
	bh=GDLSwIlcQiBPIYZW7mwXqbHREJdT2u8UXhgtTj5jkiI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IeNcGZQbBl7HyNRQO4Xi5ZdcZcNP4zzPOOHlyx0LBtKfMTiFuX3evFoh4GehRuXFGh2IvcpNCsTwtgWnrgXuyR9qibV9MAmB85HjY4H58K049c1LnJeY6JnptswRmU2k+4tPA5dye0xTRlyth/wQJ4gfdNKXcA4h+jLoz3793DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fH68fVsw; arc=none smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fH68fVsw"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a2ff176d5bso2297171fa.2
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 14:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790114333; x=1790719133; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7q1/TXtAUbCspe1fPBPxnd3YpWlWRbOHARWf7oPjbO4=;
        b=fH68fVswCVi4Umz/jVByv4pybKzLg9XGLVQPwpvvajGa29SOARqDPS6GSPSaWKKw3e
         vf6l6C71pCbMvA39C1qtddrsEgiH8RrkWceojT4QZxNMC9eMGS2QzJeFKdBPr+kWkQsY
         I439SxKSGoyG55bPbzUi30F8SCWbvtO3efeqw1Hu7afO6+vvVUVJgWXbpa0roghfcj/X
         mJAfJXvAFmDTlJgoImW4Ls1jPwBH/S0Wk3mhIua++RO0N2sBK5rE32/K+eNItuYPwwNw
         C2N2+PtNzRFb6mDshPV558OipIKqFO/33wM42oEBw+BfsV6uOTy5OC8rTyWCp33yM3pj
         Ie6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790114333; x=1790719133;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7q1/TXtAUbCspe1fPBPxnd3YpWlWRbOHARWf7oPjbO4=;
        b=By+HBMPi5lS0ZYDU8CjgTyfk1sUfgNbMLNqYZSre9HN2QFZc1KoLGIJW+r60NUmFxI
         ak+OJ0p2fG1g/1ZPMkfybjyq2o5eTf2juSlplJTLT74gUvfR4W6R6pP8b0n/CuONaFqc
         iQ+oJ922sOr/a0esmPKZbul8nW3j9AOZS09A4drV08J2U6MDSfyIek+NKYODr58hkxFH
         nUCkmz7wbfak3qTpOfSXkWjaWZagFF5SxDHE/LVqGhx11e5KvgLDBMZQOZHXDMPw2Nwj
         hZlSNFiYr8K6n9QgAlKD0wo8X4QHK2vEDygFDYwlDI2LapgkivSjEF0CBUsmUGAZt8CG
         Yhwg==
X-Forwarded-Encrypted: i=1; AKwUvBzfu9JoS8wFP2shc+6a+0oHRSZwdnOBrxpC/rlQI7JGpxw6bqy8uV4a9bdAo6W1PgTbzjEYx6bQg4fqATk=@vger.kernel.org
X-Gm-Message-State: AFuF++kLfM28QCxayVkDd5yu9SB21AloV863GGyoPtm8clVDlpg2B+s+
	HT/8tM2stU34dgqfwGFDoA1eh3QBJjYbbMDL1IuvQRV2RvPS/tIhNAhg
X-Gm-Gg: AYBFou1UU28DvMo4qU3aippsUopIB0zfULWDFunKq2Y+/RZfRDLbmhA3uhpveOoKMNE
	dWeaSINu5/1DvvnyL+u2EGwuJiccJ7TArAOjE5TvDMoIdfKjffLBkduwzKJo+GKNgRt2Jl6fWiL
	P53s5YKPRqDw/qlls+iNmBgqJGOlC4Ga8QhCA/nA1Xea5mcF3oauxU5Q7QzPAWZBstVUbcJGU1R
	q0z2bXaxyfRsp+FqwR48GzLPbEFu1JKTlaS+K/4Q8GuqX/+yxzoAj80VeStXtUw7S5idu8OcGNK
	ecNPBYOl9Jme8r+OOAs0dfkW7XCs9awh0TDic5sdAwnZscPf48Pw7+PKQy4V1xeUw8KqgypcJjh
	dyI9igCr3Q8ZQxXA/K5eu3aUoWyU45L+iVUsllhaWfZkjrmtQxVOOyk5UuOYo8Qb75JzXr1GdBJ
	RHjSfUiFv+9m8Hnaqtw4jba7an3CvVXzBUmJZ6d+m/9yn2lza4lF2Nfc3G1jk07cpFXw2+77S4G
	geoIBSMFt+2gb8=
X-Received: by 2002:a05:651c:2119:b0:3a5:df43:7628 with SMTP id 38308e7fff4ca-3a63057cf2emr1261361fa.0.1790114333042;
        Tue, 22 Sep 2026 14:58:53 -0700 (PDT)
Received: from localhost.localdomain ([109.195.90.36])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a62f53b3d5sm1974651fa.40.2026.09.22.14.58.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 14:58:52 -0700 (PDT)
From: Vladan Kalaba <vladan.kalaba@gmail.com>
To: gregkh@linuxfoundation.org
Cc: ovidiu.panait.oss@gmail.com,
	gustavopiazdasilva2102@gmail.com,
	error27@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vladan Kalaba <vladan.kalaba@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] staging: axis-fifo: fix integer underflow in tx_fifo_depth
Date: Tue, 22 Sep 2026 23:58:48 +0200
Message-ID: <20260922215849.16739-1-vladan.kalaba@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix integer underflow if tx_fifo_depth < 4 in axis-fifo.c due
to check in axis_fifo_write() subtracting 4.

Fixes: 52ff2b840bc7 ("staging: axis-fifo: fix maximum TX packet length check")
Cc: stable@vger.kernel.org
Signed-off-by: Vladan Kalaba <vladan.kalaba@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7bb35e11d1dd..066124122caa 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -413,6 +413,11 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 	if (ret)
 		return ret;
 
+	if (fifo->tx_fifo_depth < 4) {
+		dev_err(fifo->dt_device, "tx_fifo_depth must be >= 4\n");
+		return -EINVAL;
+	}
+
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
 	if (ret)
-- 
2.53.0

