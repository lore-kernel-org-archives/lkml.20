Received: from smtpbguseast2.qq.com (smtpbguseast2.qq.com [54.204.34.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED5638D3F2;
	Fri,  9 Oct 2026 03:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.204.34.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791516012; cv=none; b=AAHwlnINFAWUr/6hy92T2T36/uiiPXIfT586uVKa/CxZ70FJAzUQ/fNpyT7LJbCPAaI01HTzmCIuA6ZpbYrGa2aANSwo6bZx/xMcJhS1g0uC8t/F3muaaJOM8PRFqbS5tDEmnoMydNpDoxt2RhjVC/0xmVIiLoZLf8J4zq8vGgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791516012; c=relaxed/simple;
	bh=jV+NKP5wd7+th5uGz3VcadTxsByLPMZY731XOUUipHg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OcCFrtSXuT5Vm7TAJaF0okccezfgRQAX19ai6NZe8hoMiSE+9RHt4o3ron9XRdcC6raG4v01ArmvuCOdLJEM9puhKBqup0RLbOfjXiVV/uR3rbDKuFcD2jv6PoLC5ZQ1hliOtwqOpMagYxpdO9VMrfXi2O7KzkUDXutWxaGnscY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.204.34.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip2t1791515878t01bec5eb
X-QQ-Originating-IP: W901LGDAxK9FnKMrdb8jn/PLHEBs5fLGm4GCmdLNebs=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 09 Oct 2026 11:17:55 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 851849396968121917
EX-QQ-RecipientCnt: 29
From: Xilin Wu <sophon@radxa.com>
Date: Fri, 09 Oct 2026 11:16:06 +0800
Subject: [PATCH v2 14/20] drm/msm/dp: Clear stale MSA colorimetry bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-msm-dp-hdr10-v2-14-1835d4966da3@radxa.com>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
In-Reply-To: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 dragon@radxa.com, Xilin Wu <sophon@radxa.com>, 
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=sophon@radxa.com;
 h=from:subject:message-id; bh=jV+NKP5wd7+th5uGz3VcadTxsByLPMZY731XOUUipHg=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFknYlbpHZU9IvZcT795xa3Kji/MLyYxMl7neyeTkrZ3L
 79b09vZHaUsDGJcDLJiiiwK8Qxz2Stzrz0VK9WDmcPKBDKEgYtTACay/hMjw45PuU5zvq2qe/Uy
 79bKKwVlradCpi3j2NL0V0V6usbydZGMDEd95NKXPMoySZn3YPKKhcWTQlqvh3LdWTvffudd62c
 Xc1gA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MhHYuF7Otq+o/2QhaoGILUwwqASitdCe2B45+QG4zC1fXrwEhKXmmnW/
	d7qckvOvg3H3XhqhFRVLqor9tixY2lE+5kbnCka5dNPHHdUUIIvW9HB9wp6otP0FFEJIDJi
	njISww943PyIZiGUCpgUQ6FGhPFDdDxJGpf+1IoLFyfsbowj74hq6yzyA7yJvQnp/ESr6Fx
	tZCTWBth2b1/jP7LqHvQ/KTxx/fRukGjM/nN1ykuIPdZ0uMCEfgCFvBej7fiuB/s0HiKDcV
	92DEcnapLRUGbj+8bH/6nr5S4dZILSqpqac8B0hvC9Uhu9043C/X4paHnFVTcMqsGSQKKaP
	XFiJE+B7MDtZgRBsnGKZP+A7XwWJ+8tfyOoI/A5AhsnaKhjwEhsXFthJD7fuIQmVgbGYiqk
	AsxGhsHVDeATQZ8l86QcKXCQtSjkeLLslIt4Jb+Or0tUvK+c/iZKtMec7TpJEPg9aEoa2Py
	yHx0r//k9h/cp5io22OOUew9sNLdo+WxVBHBfGQa3pLL2pHWIPfIqfCzZOHzyKWxU+ZMYuJ
	zmDCwTY/y18CJwe+G41a4VxNJIg7uct5bo314tcdSLhIYWgXsGoAA+F+zfnv7sW197KmQ1c
	OTdiEyhdt0SL8busd1kp+MtdhuQRqC06JOtiZ90UhMeyZTPS2yoivCVFE+nN/mIceNZoaNz
	BljMj6+Rup5Scj+2XUl8D1kzH28VQoxy9UnTi/2H2Oykpr0WxWEiIOCurQpMtZ8zJRU9lQO
	VJLO4EldN+irpk2/HvE0lzsWV4YQjc0tvHuRGzqnTWpx+oRyN0ZJsQuQwCEwsmi9eQRisBh
	oTK7R0REYAQqh0U6gB2Tx7tuZsXGje0Y/I6fVINANeiFasoXOvw5SGnbgwtnW1z5FkGDhtp
	ZnRg52uFc8XvGFcnbAeC3nRy73QD3sF/3DRDQVXrb/QWlZ+rJ/Zm9i6OULfndXPlMkDAFRn
	FBlBQJK8nl68FIDeGJUAjtQt/yPH88ms6bryc2LN845gmg1+0zbC9UiBItHuuLamsxwWRBb
	s3+ZAZ7RSu0D9laarR0lG7CedruTQgFIXoGSzsTw==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

The MISC0 update clears the bit-depth field but only ORs in the new
colorimetry value. Bits from the previous stream can therefore survive
when the new value clears them.

Clear the colorimetry field together with the bit-depth field before
programming the new stream.

Assisted-by: LLM
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 drivers/gpu/drm/msm/dp/dp_ctrl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index 791bb3af2cad..783cafb22374 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -476,7 +476,8 @@ static void msm_dp_ctrl_config_misc1_misc0(struct msm_dp_ctrl_private *ctrl,
 	misc_val = msm_dp_read_link(ctrl, REG_DP_MISC1_MISC0);
 
 	/* clear bpp bits */
-	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
+	misc_val &= ~((0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT) |
+		      GENMASK(4, 1));
 	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
 	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
 	/* Configure clock to synchronous mode */

-- 
2.56.0

