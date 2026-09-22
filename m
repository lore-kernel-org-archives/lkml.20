Received: from mail-pz2-f26.google.com (mail-pz2-f26.google.com [74.125.228.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB274FC344
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071535; cv=none; b=UGqAEhdycRNYBd9UDRckplrfRjrl9AXxLiT2quf9ck0APEwXXV6zeaNVryExFQiy+DIjh9JmXlEYDDmz3V7524i7uIWXXYlpzwQGqm+MCHW7CAbXKo6t0YIT03c5f7Bo7LRTGE0WT+u+ZsRy7t06IX7TOTmxCVonQ4Px69cELGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071535; c=relaxed/simple;
	bh=fqHvaVMw98RqNbbk6DFpzLeB0+5LZLOfSl8VXANUVxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXfdD8qwPJdIuKnBXuQdhqlL1mBuoATZr6xa5MeJSAf3wBWOpvt6BsplgOJbdxfke010B0wTYixEePOGGFEdTVfP8J7MKGgt08JsCV3y70J8Bfzp8Xr8jrmx7Qqbb/+lClq1QJaLuV8+igfSLcg215LSMj3kH8bdnMOopDyWOB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pROgmE7C; arc=none smtp.client-ip=74.125.228.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pROgmE7C"
Received: by mail-pz2-f26.google.com with SMTP id 41be03b00d2f7-cc1e1b51234so290185a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 03:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790071533; x=1790676333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/sUZ12V39o1oXjQLxG+gWXie4gDzpNz/INejxmAwsYE=;
        b=pROgmE7C84v6WnqMFXeqP5Qd1NPAIqaHS/cTeVsDP3UZLyrhfROl2YFfcP2yjw7CWl
         UFe62j5+AVBkf+f+Z7xTSu1JWCKPc/ads5lpxNlXhyj1JLLYp0GaXhf4LC6T06JNe3wp
         F2t8UXw7CqwzzPvCij2v+8OiJlCuMUj9t0cTvFDoUMo/gi2DDIwbfOpl031aeICWE9zs
         m/h6yX1e8sWAXD2mlmSy4N91IULF+KRdRJWwdr576n6hur+NE2dPHy4t+eaG22FMl3U1
         XY7aVqD2wJsJ1euBHdaagj44ooCyLGN9X2kvCBiux/uHWP4RRkaWJqS7+z1Dxb3nQjOq
         CdDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790071533; x=1790676333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/sUZ12V39o1oXjQLxG+gWXie4gDzpNz/INejxmAwsYE=;
        b=zCfblojYF3SqF1h/oJj7k5cSplHgFM/8ln7BawLMRlveETvXjMzltIspEhNzMaxAXp
         GrcDxQ3SnA9VpxXOI15TV4XEbPLIQU0qDqn21RijuVm+tR2CKCZtNHb+Os7XUMsfyryk
         I2pG97PfOflvLKU2oSNA+6dekZbEhstQyzXqLKwU+qfv8NvQVlOu9jTzMxK9UeBP4ZkG
         uiPh5tmvXBdViQ8wx8YsL5lGB93UQHPZWlYbHbwUrhqKGwhY7QW+yoq7JwgIdaOaWhmq
         tu3N5gzjrO6Aa8ac5y+MHZkl8TDcM2+9ZU7LSMj7DDaa0I+PzG5tJkTgrpdi1XkKtqDj
         s/Lw==
X-Forwarded-Encrypted: i=1; AKwUvBxKkymrGOuJjSLUyyY1Babq/OM59ZauA/hopd3RJdMTFxY3DJjuNl1/aXiWbnoHxc9cjT15gz4lOCi6cCs=@vger.kernel.org
X-Gm-Message-State: AFuF++nqA0vu9FI3oMGdbcKQPiHUrBDiVfLC71i0TERw4nXnM7UcnSmd
	AOjEuhVzDxGkbZku1DzQlt3uYjiW+fxaEvsJo2n3acIw3vyMoMje12RoJU4KOg==
X-Gm-Gg: AYBFou0bC47GsdcFiRYxzk0m9gELm9Mr5eugCtnoSgrkmYgB28OE7rF8wtbVaR5h2Cm
	mz5aJD7laxB2CUkVo/iwZry/qejhpAOClk6uUnpNf1Ve+vNjKLr8BZqbKQ3tN/hx5yNEA1zpd1s
	p9y8eG+BbePTsVaS6p4e0LrFAMScsSfPeD7yxktPACCWp9Vcx1o0C5MhJHysEWB8qD3Ll8i/YW9
	+5uBFIGgMnUAdYlX8Gw3ahtdbF1fj16Psz9cf0vETZsPzhfbMEtDecXJ43yllSMurayaF0vnr0j
	OI5harrenU7toCOORX54Snj8h5XUjDLpdV8bYCAzbJAcs7KXKLY6Ux8Pv5FDxhAe+ixpgKLu430
	r+QyzBvu0nhi6MZIB+bK9SfXm7bWotQ3CdlSTljH5IQGq71VFsYn0ir7TGacMWA5mkzjpd/BGmy
	jg/5r0Dd7aEa3cuvfkvUcm8JpCmn8WaDq37jnhseBbW+7Y7d2tMs6x5/eDknRbNj6jUv1xeeh+H
	FqQJ5p5+TaGiWkMx2NVB+Xu
X-Received: by 2002:a17:90b:4fce:b0:39e:55ce:af15 with SMTP id 98e67ed59e1d1-3a0733177b8mr1056748a91.5.1790071533212;
        Tue, 22 Sep 2026 03:05:33 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067021ca6sm3984718a91.2.2026.09.22.03.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:05:32 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11
Date: Tue, 22 Sep 2026 18:04:37 +0800
Message-ID: <20260922100501.8888-4-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260922100501.8888-1-liujianfeng1994@gmail.com>
References: <20260922100501.8888-1-liujianfeng1994@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Hamoa-based Acer Swift SFA14-11 provides the same UEFI variable
access through uefisecapp as other Hamoa devices, add it to the
allowlist.

Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
---

 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index df20773dd7541..e83814fa7766e 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2215,6 +2215,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
  + any potential issues with this, only allow validated machines for now.
  */
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
+	{ .compatible = "acer,sfa14-11" },
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "asus,vivobook-s15-x1p4" },
 	{ .compatible = "asus,zenbook-a14-ux3407na" },
-- 
2.47.3

