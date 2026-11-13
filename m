Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794596022;
	b=3XtroEF/vq0GCpPVlDvwBgMnr/NY/o/Nif6hcY0Ola3Q0Ol4cJg4TwwObD6Ayl04IjSF
	 Y+rRSZ2CGp28sjbqAyckogEnPP7gZ5Pgo+iuDfU1S2ToHXp5rgmK7eREnL9kWoHoS1D5l
	 4H0pxeDRnwkRyazIYhThz6pKC4orc8ymBQYJ3268OYtlMeHBB+Ac5xgEjVO2KHyEUYrMe
	 mPm4+c9Rqi1mLUwXoYGmSLXBQSZ8KSQDDRrvGioWN+CLM1XYABmxGEnQn8W2EZNIfHKLY
	 2I4sbDq5qvvXmQEPoh0EpEr2QrnoBAtGe8i9yFRwBi52mzDF6eI107sizULClYqUZWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794596022;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
	b=JYjXWK6nfDSkg4G8kfMCC6vhZy5zp4wS3MnsDYaP5CI6OJlSeybEqurMQiCZnHtjLaQq
	 7e3TWnxX9j4w1FG0N2cJynybGk8XD8jc7F/tsbR/z1PvoLa8eeDME5XjNrg2UuaeCZ1UI
	 /NX2DjIdc3rJ6dinUblT/SB7rkQThHhpzKPcrTG/pOIG9BhfjCh6pumJBgeQnbqCekWaw
	 Doj2+U+tqNadJ4/W0f3e9R2wYie1IOsng2wMkWHkhbe6rudE5AGBpdF9GQD/LAh1rI4Eb
	 YjCnqcXhbdmhd3yrF2e7SSK3AOHoKcVSVL+kP/LTjb5BT3xRrY5LEdBbQoxpEcfItxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FlQglaKa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRfFGhZz;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85630606A8AD
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85630606A8AD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FlQglaKa;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dRfFGhZz
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR3wp2022977
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=FlQglaKagUpZEUdwHsKRxWfwJTd
	uDYB+0aAyNZzPFH175mwxz3BJqPwv5s2jMDIFqyuCzk3yachMUCiXbgEJ8jtK8en
	njaYIweUasFR54cbpGpZQBUFocRLz5s8kh9dpZYuugDu/kcjgbAi+oQVJXzVSX10
	m3ep0d3TrgIe2Ztc+DhhBlZYS7NN/Eoxj5PGFiBZULVvCKa61/dejSnLQoxSXft0
	GG3q/5uQUXai64IwiZHQl+me8mZPlbGXgWhwqw6OT81Hbq+YIncYXXQrvet+58p2
	c2+dE+wG4tVng2F+RpmLExIqlyKqq/nP1sCVOfettrpnJ++qfwdiICCWSgA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx0g21vpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 18:53:40 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so443746c88.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596020; x=1795200820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=dRfFGhZzsFuA8d78CyJngAIpudligNoAZItTJImMyA0TuROlFHWhCdKDeoPSNn0Mhg
         aaPKLMDrmPgtykgBDqHxoiFp1sIZHSHzsh34f0pBOGv4ycnn9WxYxDUmm4MBeNJ7feLY
         vPxGvDePuK7AtI3WS2QwIay54HrUvCBa9hYAwFTYKw3yo0YS90GfkcoaUttKLfCdJiGJ
         6unUVF+lhL5IXsiAMAcoNjJj24VdH0R6UTQ2/SAupjKi7d+7Di3frDLeHCLwjJtK3rti
         UzB9Hwlhd672Qa8L7pTCnLDmgQVNq9TLRtbwlLLq7QbvzS8wy7IESTOQLN/uP0KXuJYa
         1d+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596020; x=1795200820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=n3lPHYXwjFLf2ZTuMDlGsIGotXxGTQVhM/M7DAxCDwmD9Rh5fakH1AVX5Y6g4R3PjQ
         waf5MgmSneq2KwzJmiSII+Q0DAL2avyujcmnS+84qkJZpveMYHHvoo0oTmzaWTRoBU5/
         Huh25mIsAJIjdcN7y2DE1/ZHZF57ivosLIIvSspKkAwu6ALpBTwbr4EmBQbnR33xaLBE
         /nqChQvELNtSgPELGyMx+OcEGFD7m1ucJLjwuWUJW02zHZSAcfP1I3+WyCP0U/mLpEqb
         4IHf6PdT/O8r2aCaMwMlmJkA8TutawKgbg2EH2NU1FCU9CP+aT+2wZ84REcYDT4tJ35X
         df9w==
X-Forwarded-Encrypted: i=1; AL+hErH0cMxvFq/G9Ld4/4ziBU9scEUdCyWf1OKMuJE9EDHugVhOIZ7lAc9fuyyrl7hgCVga70slsjEA5XW/7gA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4VA1Lcu6smt5tg22b2HpCM4cxrk4muyW+GNsHsbD4PUcZ/jnW
	JGZrrYFtUv7oN7/ZEMeF/wItjmHunyKjg5U3qCkm8RAgcibZckt9aIWralQAnyPTQ39Q+yYsOOe
	WMsLwyB8AcGke4KJbqCGCAGaYgP9BPIVHf6L5V3u4D305Vl153PN3gltBiwcFw9B9xnE=
X-Gm-Gg: AYBFou2UK0VoSOrSSbrD/JSAH7Qq7Wn0hIamQRjZBLiGRnrGKtKa0rsTA6iccX55+Vf
	yPQQ5wOBB8lzF85tw56Tx5PnEw9QmcpUB2X6Grx6QwKQmuuYLj/zIuxe0+HXoRleYDddk6S1M5B
	YA8eTprAu/g/1+qumKEpe3HVlhf9FIOKroM+52+CsT0ZE39WkXVzIHY4/sDOLyMwR2vgiQzoX7U
	kieeeCZsUzPOAJNiqQEWo6xIhvJRsdXOTmhFou4MuCV0pqPSLuejIlmnjtYtVoUY6j+Bg0yXED3
	Wq09hy7BDF7eFSkvWbKW6FbIBGinX9zPfZ1gZcIyY2JRUGW4p0kZ8AMo8sJ2bQ4BDJ9u/sPQ8m6
	w5OZ0RrMBuGyRe5bJARCP7dlyPBxEpJ4DOO2uTq7RNFhf7buzfCyueBZ0mCG8fupclIdYKtc64/
	Q=
X-Received: by 2002:a05:7022:b054:20b0:1b3:b6d3:b91c with SMTP id a92af1059eb24-1b50314c8b1mr3584812c88.7.1794596019961;
        Fri, 13 Nov 2026 10:53:39 -0800 (PST)
X-Received: by 2002:a05:7022:b054:20b0:1b3:b6d3:b91c with SMTP id a92af1059eb24-1b50314c8b1mr3584783c88.7.1794596019294;
        Fri, 13 Nov 2026 10:53:39 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm15547667eec.21.2026.11.13.10.53.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:53:38 -0800 (PST)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Jeff Johnson <jjohnson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Sean Paul <sean@poorly.run>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Sat, 14 Nov 2026 00:20:03 +0530
Message-ID: <20261113185009.157893-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
References: <20261113185009.157893-1-mukesh.ojha@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX7vG4b/ZXo7tp
 yPh0vsjC4XFtz1W8FaZP680fwwpB+SOGRo2anEqlUJqs/wlMAzsydDZ6UhWRlMcKhpsbdFm3xRi
 kwAuY+30RzX8Ob7Nad1Q/suCoTQ9KzEYnRMSSzlzspyKvNRnqEBoQdQ0BiKVLkzDtiaApblCXJH
 LIkvQu+MXLSM3HUBGHGY5sP/3Gymw0siQjSzAT4WwA/HSJm316e6Olw5+OSKPqcqAQVzKrOYz0h
 tr/SP2I2KcXlzoOollFsk284R4nJfMLHXp8OPh/4N6CBVT0wWDyI8ctDN3jDz/Dpph7a39fYZgZ
 JdlOzwgHNUp5A5cYiYXN4qMOGH0DLWFdcrYlHBHgm6I+rc6eYrm4P0NQcqgzn3dCUuZN9YESHkn
 k2MF/w1E/aAZTBzZ9oCuC8q/xde7Yng05ODrQqMVnaQ83ms02YZC6LW0LBM/K0rqW44EoU+tIJS
 IR7vC8eat1RWw6IiAqA==
X-Proofpoint-ORIG-GUID: zI2xO0VTMi-gj0Jh7_HYTWIyHYMLpFNQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX6elbra+xmoOu
 iFjOMLIXLMXMXF5zTNacr21JOp7tzLT1olYSlqCOboTfbomdPEDBUcssC/22+4N8qtLtXF6kWPx
 bMF1BnpweXVmJhb7Q/k/I3gNXA+YYN8=
X-Proofpoint-GUID: zI2xO0VTMi-gj0Jh7_HYTWIyHYMLpFNQ
X-Authority-Analysis: v=2.4 cv=SpIFe/O0 c=1 sm=1 tr=0 ts=6af75cb4 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130075

zap_shader_load_mdt() calls qcom_mdt_load(), which bundles metadata
initialization, memory setup, and segment loading into a single API that
does not expose a PAS context.  zap_shader_load_mdt() also calls
qcom_pas_auth_and_reset() for TrustZone authentication, which is the
intended behaviour.  However, a new qcom_mdt_pas_load() has recently been
introduced that works with a PAS context and can handle everything
qcom_mdt_load() provides, along with additional functionality such as
shmbridge creation and retrieving memory from the shmbridge buffer when the
same remote processor needs to run while Linux runs at EL2.

Replace both with qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
using a stack-allocated struct qcom_pas_context initialized by
qcom_pas_context_init().  zap_shader_load_mdt() is guarded by a
'static bool loaded' flag so it only runs once; the stack allocation is
sufficient and avoids any heap overhead.  The manual memremap/memunmap
pair is removed because qcom_mdt_pas_load() handles memory mapping
internally.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 22 ++++++----------------
 1 file changed, 6 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 54f337475231..8e4aa8e22108 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -34,11 +34,11 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 	struct device *dev = &gpu->pdev->dev;
 	const struct firmware *fw;
 	const char *signed_fwname = NULL;
+	struct qcom_pas_context ctx;
 	struct device_node *np;
 	struct resource r;
 	phys_addr_t mem_phys;
 	ssize_t mem_size;
-	void *mem_region = NULL;
 	int ret;
 
 	if (!IS_ENABLED(CONFIG_ARCH_QCOM)) {
@@ -121,39 +121,32 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		goto out;
 	}
 
-	/* Allocate memory for the firmware image */
-	mem_region = memremap(mem_phys, mem_size,  MEMREMAP_WC);
-	if (!mem_region) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	qcom_pas_context_init(&ctx, dev, pasid, mem_phys, mem_size);
 
 	/*
 	 * Load the rest of the MDT
 	 *
 	 * Note that we could be dealing with two different paths, since
 	 * with upstream linux-firmware it would be in a qcom/ subdir..
-	 * adreno_request_fw() handles this, but qcom_mdt_load() does
+	 * adreno_request_fw() handles this, but qcom_mdt_pas_load() does
 	 * not.  But since we've already gotten through adreno_request_fw()
 	 * we know which of the two cases it is:
 	 */
 	if (signed_fwname || (to_adreno_gpu(gpu)->fwloc == FW_LOCATION_LEGACY)) {
-		ret = qcom_mdt_load(dev, fw, fwname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, fwname, NULL);
 	} else {
 		char *newname;
 
 		newname = kasprintf(GFP_KERNEL, "qcom/%s", fwname);
 
-		ret = qcom_mdt_load(dev, fw, newname, pasid,
-				mem_region, mem_phys, mem_size, NULL);
+		ret = qcom_mdt_pas_load(&ctx, fw, newname, NULL);
 		kfree(newname);
 	}
 	if (ret)
 		goto out;
 
 	/* Send the image to the secure world */
-	ret = qcom_pas_auth_and_reset(pasid);
+	ret = qcom_pas_prepare_and_auth_reset(&ctx);
 
 	/*
 	 * If the pas call returns -EOPNOTSUPP we assume that this target
@@ -165,9 +158,6 @@ static int zap_shader_load_mdt(struct msm_gpu *gpu, const char *fwname,
 		DRM_DEV_ERROR(dev, "Unable to authorize the image\n");
 
 out:
-	if (mem_region)
-		memunmap(mem_region);
-
 	release_firmware(fw);
 
 	return ret;
-- 
2.55.0

