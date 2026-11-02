Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793640013;
	b=qgVNpp2HLducRlvTUh3wmH7utUNFNfFv4I+Cx2HqaIEd1unbwdVvId6YRSDxYBqOz2+L
	 gbd5rrEPA4OMlFnU0ZFpAWgSy8S7oO7BO6NlPYk62IkSfLp9+o+P/6KeTo4ACwOjE0lJD
	 CuHAP28GL8MncTWjFwQpRq8BXv99jowI9CP3WZkI9DoovPgW6zUj5s19dJuOYnUJRgixr
	 BPySwaoSBhcu6s5UYkkLZfFAnLdJacPyzvRBDggXx04z3zrNCGcResa0+PXELY613rLuP
	 XuBbCRkelGnvixpT7fFUdb2uKfQDMIj4ey4svL0JfdEaZu/mn5nTPGOCCfflOEg+gqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793640013;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
	b=hH75VJN6dCz7pdkqV909hhuxTbN4jyiP7z2fSidXCEaiwfZfFJcWqeevKHu7GDThebPg
	 H3sysbEMVjA4h/dpr/ADtmgB3VLFy8VdaZtLSvEw5TCpZMl+ASNqg25o8+5WbRWqdyD20
	 MQ1BOWUX68PeXAAhAzRZc2ZgiEZI080Xkr4e6SRxTgufFDdXivbbQm5Gr8eWVZoW0fETR
	 /h5uCv2e1rAXovkKdzv2mEQ8astsPJu55DejV8Mg+0YRGugo4DDMYStSq/WYB1AJ44Fnf
	 Qr4beyyg1sJJfb6e2wwvqYWOGmtlJX2c8zFpufMjHRB6qN4f+W8VHgK6xOIfvVycCOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oAjqQaar;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="D+AQoe8/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E007560A0FED
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 17:20:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E007560A0FED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oAjqQaar;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D+AQoe8/
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2GZJj31223701
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 17:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=e1U31KgLCeK
	QL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=; b=oAjqQaarCSj1P2bwGT8MJwy2/QI
	BYvKPJgBj+YEkBF17vxaEzendMtTc9uzVPCUr2R1fFawFOYpjjyqyDTu/wgRbZdW
	Gkr9EwrdpRx7WPXLUdyM+L/tewGzqkUX8I/A7663fijePlmYToWgXCQPpeinExtU
	KS6D6CMV/oSu9QX6OoLrXiVIElj8iB8wwB+0mg49BfrfvVmNNAojhsC77EoOyTle
	QbXDqcgXKHTX1C5GRPrNyu9aJch5qcj/hW2oyz2hbdfYJdliSZ3O+z8ln4fQZ9BB
	vDN+X6HKGAPX87T1E1nhtOVoQFT06JkcvtlMD3+wgVglv73yDc6sizpxJxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpmf1tvya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 17:20:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ab27eb38d6so2560322a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793640010; x=1794244810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=D+AQoe8/rMyfL3Yl26j47eA8VZWoLtJY7h0ORkNxJBho6SwymT0pFVg4o9Nc7ZsDDD
         I/TWYcOTlxnzlxKMR47auQZHGCG0DSDdGMPxfRkW7fz3ZNHmUf7M0OauuM3ac0bbvkBT
         wTzgItJLy/iANB6isRPUpF2rAHIvreHdDXhudG8+lcTkAfJadB52jeK+xF/jeGZ0Mn1l
         moTBq6aVrlWqlGrLE8C8qi9QpovsLkpulB80Wr95PPWSghoEhRMtkSlei6LCwMT4QNea
         i+fx9Co2Em2NOeAEaVsORRRJebqzcbD6xZfJ+tC5ov+XypVMNb0g/nSYuBIWFz6NKhz8
         577A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793640010; x=1794244810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=e1U31KgLCeKQL4tU+C92d9j1+SLTNWPkWcPEyfo81Hk=;
        b=XGEue0+K5gMXbrIAn4wv+u5mp2LxHkOju4JgfE73S5abnnM/8MeFzUb8XPBEIhRZBG
         8IGFi2Ocxb7rscJ/focsRTmpusL+ETm91KgaSEDCpxeim1u9iqXO3NeF8n9FJPdiOn6G
         18xDB4iFSASXSuoLzdM0DN2q50bBalJiTjCsZUCWPq430nqbxC4s0wOTPcgPrKJkj/+/
         +m6bDx6VNah33dgm8qvTaq5l5x5bF5z3qKnj5227wD8LwF1YMK8z1A99XNEvq5Tsb4iO
         WOsqaxeetNW7IKn3FW55EW/3NBRmQ697CXKcNsT4AeuCs+VBYdOV1P3XhA/4sb6qJFeW
         puLA==
X-Forwarded-Encrypted: i=1; AKwUvBxxpAt66uyiKe+tLD1rsXOPKPAQ+Y4HFbLKTHvygPlKQ/tNR5GhfbXkQBRes81nep9Cp/2LpFsZup81yeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sInv300xjoQ/NfA680mam/UX1AhQihC7puiu8wKVT289nVAb4
	AeBzJQrUHk5xGCES6qaFZQtb3QKOD1FWO38gn6mK+5zuBGqGSHMjVJmnxeAECp354ILIcptgRyS
	dLcDEz9a+qRHgay3kz1ftTe59Q1j57EooNehL6S7hCzqgOq4Of+1v70VMR8ZYydIe5kM=
X-Gm-Gg: AYBFou3ipT5kI/BDgDaPytJig3gTFoamkoYwuKIAsirqSwK7xV6ELOsmGYQRWgQbY94
	/eTCmyUIPVR+iijUq5wWW3L+8FGGoooxK3Qrl5NUOLl4b9iqnXkBx5tH+W/s2Nc5GZvX1OXbGP2
	6xG4xikP9QVFAU24dXQdDg1688mQV5+63c4SXgPBMrafqY74y0gdlBvRzEXytI2U9hV4Hml5RNz
	SCfKSXqW0KWpFIFIVd/rUpLOwv8im8R2gujnxWfDvQAJ9Y5Cwl7UfcurzbHCJzaX8xSmz3qGbIv
	Lx5d3DE7Ff06kHPt52ulha08lhN5dXPBq6qxKV7YkA31JK8DewXnuJiYBxMiBjCeE7790DivH6+
	HjWHy+SMXhGcg5N1BUu+7ccy3MSJZrO6SUu04hwHQxgT3Kgn2bNK/doPAfy9OWnXDD/nKYInoVX
	9MCqy/IP8+Ae3wi/29dF1a4g==
X-Received: by 2002:a17:90b:55ce:b0:3ac:9a5e:9cde with SMTP id 98e67ed59e1d1-3ae897f390emr8325405a91.30.1793640009377;
        Mon, 02 Nov 2026 09:20:09 -0800 (PST)
X-Received: by 2002:a17:90b:55ce:b0:3ac:9a5e:9cde with SMTP id 98e67ed59e1d1-3ae897f390emr8325371a91.30.1793640008558;
        Mon, 02 Nov 2026 09:20:08 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb363a4c2fsm159495a12.1.2026.11.02.09.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 09:20:08 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 2/4] drm/msm/gem: Disallow nr_bos for VM_BIND contexts
Date: Mon,  2 Nov 2026 09:19:58 -0800
Message-ID: <20261102172001.508440-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: vDlEVxXcIpkPfOAmlAvmuIzjEJ-YgbE0
X-Authority-Analysis: v=2.4 cv=bNaDs/+Z c=1 sm=1 tr=0 ts=6ae8c64a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5-JVGYL1QLZbPSRHqMAA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfX9w/U8MzNmA7q
 RcWZGWDnyYghFYwzogB6IK4F7llTiY8q7ychYh1RF2amXCXJiHJmRkIuaKI5Lek4N5yFafzNvTf
 /Ah5DeTcZCroYiE05xi6+NIZ+tsLDk1KDhHuCb6fz4iNFyH84kjFWVkpPlJdSrwVxDbII1//mHZ
 qcCl7qOyxzbFQFwpNwiF5KSUw3Xu+shvmtS/Lv+FU27MpKFLhRvuKBDgJoNoHLrf7ZomT9vWLhR
 wo2DsjUpPZ8mKXdTxYmQvb7sLYgPep+EdNJSppWsMfGxGXnB9RZqhUqBkpQbhfZzS0pxOyT+kye
 ng90zfI6DO9y7FyYQiuSaOkd8Heisp1735/XtvtPtE76/CPH7Ug6vYWT9pbZsQCNwQb9o2h4qyE
 Ipu3c/Xwbk1thcVsTEHMGny238M0rp2gAJ33EnENAawuBdV/OvpFY0X3G/R+yTD+thO1S7d4O7S
 ih0NcL/CRsvVMxQrg6Q==
X-Proofpoint-GUID: vDlEVxXcIpkPfOAmlAvmuIzjEJ-YgbE0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA2OSBTYWx0ZWRfXykARH4Rms5D8
 L/y55lALShQbFJ5+Wfl80WBsO/j+usg4bbWFFRl59SKIBZbPEd5nxqwI3R+JkDGh2f2wJ/SiSj2
 L0HMQl9DNApPbZ5EDF1LAtydPyj/L6c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020069

If using VM_BIND, it is invalid to attach BOs to a GEM_SUBMIT ioctl.
Only the VM_BIND ioctl should be used for binding objects.

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index ff6cf39587c9..b558d07ed2b6 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -272,7 +272,7 @@ static int submit_lock_objects_vmbind(struct msm_gem_submit *submit)
 	struct drm_exec *exec = &submit->exec;
 	int ret = 0;
 
-	drm_exec_init(&submit->exec, flags, submit->nr_bos);
+	drm_exec_init(&submit->exec, flags, 0);
 	submit->has_exec = true;
 
 	drm_exec_until_all_locked (&submit->exec) {
@@ -589,6 +589,9 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 			return -EINVAL;
 	}
 
+	if (msm_context_is_vmbind(ctx) && args->nr_bos)
+		return UERR(EINVAL, dev, "invalid nr_bos, must be zero for VM_BIND contexts");
+
 	queue = msm_submitqueue_get(ctx, args->queueid);
 	if (!queue)
 		return -ENOENT;
-- 
2.56.0

