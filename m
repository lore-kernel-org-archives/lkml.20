Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794846156;
	b=QTfnRQiDlf5rKZkH0k6YFsokM5kB5RpbQKAtg6jNDkZaRxUjlT+okUsnkiaT7LIzTplq
	 NDMN0FYsvLHidcoDFskjkJ9l++jR+niwcizh7vuSB0EuuIWo4sq2/1kWsRsJrPnhCMGqy
	 xTf6YliWPI3Y4jsUzcTzuHcFqoDk4aZxWjIIUFR8dm/9TYzYIlIOcLfS/yL41Cob/W/WO
	 hkUAomokRObAAebDOtusUqOZJ8QZy8AtqonK0aEyBKu6bCcNblb3IR28BRRppBNcaqS0x
	 w5NrKspW+wZwQEHPLXMYC3EPxO3OwieJdnIqhd3ArgFDu/tA8A8A8zjijbl3VOd/VsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794846156;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
	b=1SnYOq+LiS/tULn0nNeYMLYrY+949ds7yb77do2thlbfq/VCsWUjCublGL9nP/5huDoT
	 wRplmWb5GqsbPzMwvVSJTUZA0TpW/ApgGE34GLN9Lofosu9bFvc5xU63vpaG8AbhqRhJu
	 SR2Ogv7MWpEYP1uUX6rGWM49kaWbxqhAtkiyM+EUvxWtO0tmTO02lKSNo8FSFpGViF6cd
	 /5boBHn5f/NkMDA/S98mL+WDC1C7OC9RPBklguXPSzijse8evOpF/tohO6ceBOzyyoat+
	 tGgYgQ6+aD7rzm2BW/yq5MAx36VOJu/ZjHFWO9/TbTDoUlPooNYzjYDJdpQXQHwrPAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="KKVB/IqJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="aXW/QU7w";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7471606A330
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7471606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KKVB/IqJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aXW/QU7w
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIU5g153355
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZiJ2cGdx8A1
	D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=; b=KKVB/IqJmIHW43Y5iX/SbkcNv6M
	4wqpIJ0CiEte9tqfaDQrZ9zzJqnYBCXMghfBaExOruMjXJ8ySaPDeUAOikyeXHjA
	IDIh23CX+6N9Hv+dhZ9XUPvO9G+2D63QvC76GObIDhBkOXCjyJ7NW1Il6rL0i1gK
	et8Hi2v5ywKSBGtMzY/ChlxUx3+cmrJHZlDrf1LZubrqw1mnJ7X31N5/Lrr7zIUE
	YSTuEFj5Zes9LFQH/0eCVzIvvr+A/Lqhx4SlG8pg2z3t4ZKjG68W26dfQfbW8Eit
	IHcgJZ0bUc2vLc731T4bAv1gXUjt3SzEzSYm/1aVm+lW9kc+w4K+Nh4UR5w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ghjf6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 16:22:34 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so1942139eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 08:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794846154; x=1795450954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=aXW/QU7wwo0KFJoURXoHe2aKBWEOXzCDZXZFqQ/dPY34of0n9KFFSmIgZ+eT5+EF7O
         h0qXD2JsIH9ZSUSH64HYjkrPt1MXGDPYffxyQy7jNdTQkd7wLlM/por0N41ydhxE/dit
         r7M2/0yhpP2HgRwQfFSuziYhwTIxUNBLa40lJRQgE/Uz/mDDX9tAD+E+QM9jaKA8HwPF
         nltSUXEEX7x4h8LRz9NegWLjGR6kkmE0hLVjRGcVA5zIB41DxGv8kwYOEF1zeyXbJ1B2
         cgrw3kNMtr/ZqgnJZG3HlEc78ZDydaZg5nqQddOdvvDFVN1tYobLPb1VeZK66U43veuB
         qbOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794846154; x=1795450954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZiJ2cGdx8A1D88FHZg9zdVy/kI37kSxx0OtiuBRrPMQ=;
        b=TeEnYx01eM9sAb7P6Ci4NzeSSjVFgGVbqgwPG+vzrlbsXPyGdcG4zGMzmPuCcDSfIf
         8yzkgK/U0M09KLtXEDtnbT2fSb+NhFpu8nICexATd/6ij1pdHfJOp/pv/uaEtWty0LCb
         LC9GqfUetXp3h5c18ovp6aDfPNxFz7bz3aiBdLPMAxof/7C00e1XjmrPC+L3kh4IiGV8
         GUqn/N+YUmJdGOsFwc8k9+neuS3J4Kem+ZcUB1kqwoe/CMfK/yT1u/grrlyQzCsK8f4K
         mUKc8TLemHNFgZcb8cFWc7n1paPIYivnAj6ecYCw5i5xtXAeqxsBWMxjU8rcDW0Bv6hL
         ofFQ==
X-Forwarded-Encrypted: i=1; AL+hErHObKGKeaIuD3C14wIxe14C8OoD9Zi8dFEB9LCH3B5sJgW6yGIpXTtSoKI05AfqvtFbpucIsBNxgusbCUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uk7k7YhjKsyeoDquxLNwrrEXiVIoxBBSbS8U12Un5NRl8hlis
	7venPTLc8MjjQMbrOo/uClnD0g5xTfOOWwwKbKfPu5u4FpfNevR1L5ERkkWE1qgUAYjUPeRN+vs
	ZFW3ehWzoqwT/N9paJiZyBIqODC5WhSaZVmfa2BhnS5RH592D7X22QelyU5mRboBMloU=
X-Gm-Gg: AYBFou1xXZMvjhQTnMGgn2TiihjiEjnzU3iCsqh7atOMmtCyclY54RUWbXEsW38vmND
	8l1LgI0kcm0ndU6uiEb9t4JkcLyIMyDZZwnVy5JTOY+hy+LMfgerSZQ2pKK42B88wKyke45maXv
	+nWRdqWTgGwSjRMcrR7XFzjJs2KNrbVPWXltzaFfjbJAJjvdvtwiXw4g45HTfqLF1rZHB5lyMhG
	OlDMojD9vH9sRwjfZe27fXTYQFrTcFQhwsFUjFiYfLcyrQXOQj5Cd7RDnmTKXphX0N+LEnOV8zb
	Pwrkt8sxmLlgUKmQlLTRV3jvZKhMEPcLDvCErE4rkLY/b/2HCN6GhTzAZjyrCeF8C/Bkgc4R1kS
	d9puZi3HKdlG+/GsylQhh73Df8sNKzhKtYp/YFtAc+mbQt0SDXR1jW/69jEYlr00OdzYUG+81EC
	rn
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533712c88.27.1794846153685;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
X-Received: by 2002:a05:701b:450d:20b0:149:49c:233 with SMTP id a92af1059eb24-1b5030bb598mr10533694c88.27.1794846153043;
        Mon, 16 Nov 2026 08:22:33 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm38623826c88.5.2026.11.16.08.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:22:32 -0800 (PST)
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
Subject: [PATCH v3 3/9] drm/msm/adreno: migrate zap shader loading to qcom_mdt_pas_load() and qcom_pas_prepare_and_auth_reset()
Date: Mon, 16 Nov 2026 21:51:42 +0530
Message-ID: <20261116162148.2864501-4-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
References: <20261116162148.2864501-1-mukesh.ojha@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfXwQCjL6/9A49Z
 yjOl+wQqxKmAp950xJw3V+bTg/UqFNWOneIa8G1Mo84L67AAW1VUmofzE2lilZM5TflEK7O2IBH
 QBNjOh2Iz6s/ZA/yAe63AaCwnKPJ2U7XM3Ey7iz5Ox8jKJT23TqCvt2vAYZu+q7Q3mfj1MGsaRP
 j516ssgf0LN1Sg+jkGxwkMRfslm2+xO9r5fxrFj8ab/IGGMPTwpeoMmcPeLrL3ubvucXYdYtn3A
 gCBTrFU33XdHifduivTLh0N9kf4VNEzo/t1tSP1sWPZO2VLD8MbLu8lTQvzup6QFWsiLF+vSnOg
 HiJlFOdjBaobpyxa+hfh/pM32ge/xBT2ei+3hIvc/pEwvuEC5gsFQN02FxYhznoG6s3HMb8Ddvv
 hrF2uNg38mSQN+OS80u457NdIBT9nQyMRE69rYMPcmF93u1qRkCOyzbTKsmPBvpWDrFMoHgO2r1
 Ji4QYqnECLCDHa8YIxA==
X-Proofpoint-GUID: 2h0SdWnL7vzjJyAmhom8IM28TaCm7B3j
X-Proofpoint-ORIG-GUID: 2h0SdWnL7vzjJyAmhom8IM28TaCm7B3j
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afb2dca cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=zg618T-2U28-L6wfSYIA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2NCBTYWx0ZWRfX3SGSGMPrvv9k
 RyAbe1rKYuLYuSRTXM23E9QQgTFJKwArBwKyrBbkRQI9ykHolapV4rVz9FCGflXSZjZK37F8i45
 FYTYew0Vlf1PJNJfgeZd1+c+bswRgko=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160064

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

