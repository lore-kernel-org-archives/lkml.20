Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C08D44F56F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122605; cv=none; b=KThMIKR9+OpKNsgUcCQDmeaxuJv1KTEUDmYlisga5p/Ynudh6x8GYko4ssCbZWmvJRPu2PH1WOac2oGMd3hpypP8xp07iPNkg5b1RzjHssH8hrDqjugaMQ1JHrw5gcReAqNLUr2AxkIbpPBfghtBWjAs3j1CPW9lENQQ1IIPlN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122605; c=relaxed/simple;
	bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cT8Nrvu1bTO5b38jKF6Wmn2jEIFprByV3PWXJ/hj5KG1E97vNp/ihzQnhT9JNdhNhosoV4Pctlv90RmsjAjkcWni4Q0gn8ZnYYxVl/J14R6AF0uCb7911Nyu+MLipM6ZkTktr+3Mvq5HrR2meUjGSBTr98qL2BxUMrjp2DpewHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpcMViXt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=embtBQIm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpcMViXt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="embtBQIm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68B7kvok2832840
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=; b=QpcMViXtCHLe9wrc
	kDrACOjs2+E0IpvU20o4U4GUtWh9ZQv4PMkD3P1LO0sG1MW/n+FZhat0dqNFNw+G
	gFlE2g2zyPvb1deu/k4a6MG6GKnDkopWlfedJrKOvO2AWNmsnFZ54+Uiv4wH5/bl
	8fGXfMKhWxJKQEiItMfa8xZojy1/3Rb4AoFrRujmvW2Jmqow06K5ZYldVWJ4HLZo
	FfeBbD95EPVDlBQUw7vqX3wSaUes+A6bQvTcKXP6oWvairkRVEBMN/IyAduD/8++
	GIgQi9kYcwDfpa0vvG4lA4AfwN7eAves4zyRaU22IzN0gdVVHmmDc0WtFIP01kpZ
	yJegSA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfgwt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:30:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53088a3939aso18585691cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789122602; x=1789727402; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=embtBQIm43PC2Jlp7gTO7xN3biMjDAUC9FAdoWbUjRduqn6MqZsjWnSO4JOsRclF6n
         JTJuHdqWWeOU8kpSbAyosrKM8RfCntrdRg3dBKcen7k6CH2pVRjG7KHfKCVEK3VQ+/PF
         zqVb7VqVDsDX3KfjIRlWd7EGcpxGOhgxujLzR/JxoQxpqrqQhD6+SnJ2zXAEEIGcJ5w6
         0NuDoJpx23OrI917GY2JU40iF9Ox2UjOCxXQYgE/DB455v9K6B9B7OKw6VpJWIWLaLAZ
         FiJ4cnVXXAJC4jETBTAjUoRIIxHjv19YstVg2FZhB6tlNKDNHzj3qj9ZMoX3vqTBhPsX
         xmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789122602; x=1789727402;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vizWdKJGFAB1HJu6hwMtO5oQyxT7j0M+cp6kkFJFsqU=;
        b=VZycO9YfCO9SUgKX6bjBh8ptiCMXwBdcUmIlDg40CgZm+6R0jA36eC0CfQyvhg5IxM
         omUp8OtewaMLp3Ldsm5ouX1G3pa8DzVUiR8sedJnrL4phU+2MhqB4/O6SKdiKpShJ0f7
         E5Jx5+WOAlNKaEs4a98o3gVnRBKSmDhrB92ySxsr606QTsN1Hg4dh7rGdzjo93+ecpCG
         5TThDRF45DRPOpL0JjyW3gscoAdl9bfboyEEF76w+k5nyWG6QBzXepXuGKz9djPbD2HC
         JT1hJh/90gGDwfr+vlC9PNhvyZBtb8GvTkkQY5ntCA7dbylmJmL/c4NaQV8sKs5iewpp
         Pt+Q==
X-Forwarded-Encrypted: i=1; AKwUvByXpWcb0tbo6/0qwyEzeoHZgYAQGLE99sF9qNEv08S/Wq7KtzP7XubsKh3moIYwdzbNsIAAV0LAUIv4gwo=@vger.kernel.org
X-Gm-Message-State: AFuF++lV/Ptky+nVvTAeVpyxfk59ZcUF40Mz/qyxbe91QQ/ozSVeOkqb
	7OjymBZlmg8/uWdXNseVwgxhHh+T3mtcwxZJj5WtsO8tFNEnpIEzIzvLAsC51tBNlgskZrZXac6
	OXP+7gXLYGBWIIwsbtX/roXpRJjCpsDL8amMecNSAXMq6EhtSHa28Wb2gMMt4fTrGh4U=
X-Gm-Gg: AYBFou0XN+oxxKOXsVvuQg3kAz/6oWq2L93swZTOoJrWl7BV6H7s2PG8EzJ5paPrfD4
	eW9W8yvZKJUJ7RP66dNHnwIq9jh04kvSmsytp4d1kwNSSgS8URRlN/yLe00SY7cB2O0Wj0DPjnU
	TtP6PIuxGrNNGbNkb5gmHzgi4FQ/pKLDenDsaGgveHU+88Pyvu3deg79E8uOGrGx+1cjh0kdXVo
	vS7CFrGJoexOMCVVMUjDcLcygPWgcozkZcmp8op9Zk6Nrfc/94iwzKiUaAnjC2Oc6TZgEnghJmh
	prp/33IG25HBG7sDwEH0vRM+pTmKdcl6xCqTvJ7FjCeN1bbdDCuCmtXfN6CTWl2tv7Ehgu6b9Ti
	5hXfSqedZpRAHxsg26ylv970=
X-Received: by 2002:a05:622a:4184:b0:530:b2e1:2f3f with SMTP id d75a77b69052e-530c8775a20mr54660941cf.54.1789122602578;
        Fri, 11 Sep 2026 03:30:02 -0700 (PDT)
X-Received: by 2002:a05:622a:4184:b0:530:b2e1:2f3f with SMTP id d75a77b69052e-530c8775a20mr54660751cf.54.1789122602244;
        Fri, 11 Sep 2026 03:30:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a81943sm38651965e9.1.2026.09.11.03.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 03:30:01 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 12:29:39 +0200
Subject: [PATCH v4 6/7] drm/msm/dsi: Fix indentation of if block in
 dsi_mgr_bridge_mode_valid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-6-87bdb9f1987f@oss.qualcomm.com>
References: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
In-Reply-To: <20260911-drm-msm-hdmi-fixes-before-eliza-v4-0-87bdb9f1987f@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/YVh+L5neHC3SlylyZSkY52kedS/7Okrqq86t4o1xdw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqo9gUEvxbxfeqW8YDt9/GLaS5x5T5jcZJa3s+8
 kkxvK6JiJWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqPYFAAKCRDBN2bmhouD
 12WpEACOzE9Xk7yADRzq2MiKw2PpOehQm/+4vq79EC+vwMlvAPXnG1cHwOpJjW4JG/MW7wcka9U
 ZIWaWV/x2hlkOWfBoSfGck+VdKhdu9ZHotftqhFQhA4TbtXAF+FAF51H/EXSOrXGJqncVGozcqI
 a0d2yls1JYtHMLKtrHyjkm4wfWUBEHOfTd1umg9NknYdN4AJdce5Wh1ZXEt6QE8ZCr+FSgY/yJc
 G+1LwWO86s4vHH79ekMlHSHoPh73u/826IVeoL66rnYXSaWCmE1/Kid7HX7yYofPACoXzdWsxMB
 E44pnSCuE7u04vdOkLLWlB5lA/yu70vHKoIGgr7sQ4CleVkk5ShUmTLOBm66kSOKGJZbpd4JRED
 D2VswGZIbyGDtDG42Ucz6pj7E0+r6b+FTwSw8840tqy/dTcMqGN9BqQ0oTxL86XT/GlfXFmGgnw
 Q5n5AnVZ7ZLVaCT33OS5A6ttBx89BC0KL+NrZDzOIdzaS5lAet+ZMg1B0MeBggIBB7Vk5xTfi7h
 pjs99o+Uh4q95rm2e/NC0dJ0RiyJYqv1oTY4SjbfOAuTspTR8Bgmf6m75jvgrd+TEmEchHNMTew
 +spZLfv36eHkYxcJbMibKGE09WVIHoeA6NN3FYmj+akkkeoAYbSynF6fd31mkuQ9PAzpjxcPS26
 E+Qt1a/qixu5ETA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfX2pO96V+ISGjB
 eJpbF9DEkoqyA763NAfvNrVpSouCNkC6Rin39V75IsKJ3RZ5Uld92GhogYom99iWXc68M2InpAZ
 1h2LDk8aMM2BeoZdCvmen9RUSZ8dDKe9YqryGYZ0nf1sws/+vEzB3JzkymoM/aJm6paSo8yJN5A
 0F1Jc00TO3XkVs8/sj7PAttaDdPKB5y6HfszV1+R/57xnUFrPLy8ef8tpDnAZwZWovLWf49Q8Gy
 vP3im0wpgJUF3f7qWL+8t+a5f9zqtvP+9rYhuDfyVH/nyA1P3XYAxWzBaIxhPFpuZHsdHQUvUyd
 N8dXXcw3fLoeg0ckByQn1x1pmvtHHfCA6GQUYAIeXA2oHdCLhq4GGoQm5P+P9Ip7IW9DHcwNKCn
 DXthOEiQ0Sg1HsPjUf/aip8JP3HolMCwONMpFgxSjZY2c3DOV1Z+X3IxAmfKZTdgjNk1TXFyqJI
 vIf9NaDoxcpVtO+Z7Mg==
X-Proofpoint-GUID: MnYkOi6i-Gurt9YGT7kmPJdAG5VbpJL-
X-Proofpoint-ORIG-GUID: MnYkOi6i-Gurt9YGT7kmPJdAG5VbpJL-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDE0NiBTYWx0ZWRfXwlO04CfZcmFi
 Xzp+I8aORpaqtnxNg6PWi+cAT0gysjrCrpPIYB3UtQyzVzsHQorLHGwZWKa8vGAh0ZRhHCN0R+p
 XrpZhZApimg0n5ZFbzmAWF78deWG8jE=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa3d82b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=mamL7KDpJlut8y4y1IgA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110146

Correct confusing indentation within else {} block in
dsi_mgr_bridge_mode_valid().

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..531d4ff78f56 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -429,7 +429,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
 		if (dev_pm_opp_get_opp_count(&pdev->dev) != 0)
 			return MODE_CLOCK_RANGE;
 	} else {
-			return MODE_ERROR;
+		return MODE_ERROR;
 	}
 
 	return msm_dsi_host_check_dsc(host, mode);

-- 
2.53.0

