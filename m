Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A3F3A1A22
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792120980; cv=none; b=szmS0D3r8DONIeBTj30KsEZAokL0Esi7Lm1f3kPDtYuWN8PJR4hzW1A5U9Mm5GvP2MTBaPyl1KvzLGFxrIUCplwkkuXSY2Ksa+epNwuHfnDeBsV5UVdZt1pnfF8r3ziPiOhd3TV+7Qp7q2hV7fLhuPy0e60bCZ/csQOlZPWM8gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792120980; c=relaxed/simple;
	bh=0rgxn5r9GoXYq8qPP3L6F2nxV6da5rGl6uSIyp2qv2s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mw7peFAyT0PfQTh9FARAd3laY/Cz155PTcndiXoERpH4uMDOF6QrGQYwl6eIXXgEYjzVEirDLs2+Zc5X6I9Krue3aFL9IMLZ2LtfveX50JYXSLsqPqwqrnqDkDiQ5Jo14QPax4IXMZY4MAnFM7o5elubPR+D+NNA2pF06aSw2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9cQwHtG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FXKXRsO1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9cQwHtG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FXKXRsO1"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G1BSw71596369
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=; b=V9cQwHtG7H4kmGlb
	MMG+3KoQmqVOJgthF2mfGHDSw/qVwyXK/RjAsNZuq6QJQLvb2XeZ/NJfYycdG3KT
	wa3h0C3z3wIIHm6KNBpnvYx5pCK0pBPmTDhW5d5d3kgdiHVPKtloyhJvsukefiMK
	RqMcS86F0burvx/9qDvI3zOU89h01PIfganbNMIci4fRj7Nk4IoEU6RQtt1xgQcD
	pVczQGkdsNEzqopEt7iD4bavGk/HE4DkE0Ft61sI7iPZK4DUbGQjuTjUTeZnoQG9
	LQMZ5FDb06LeAxBAGtBPrj/4ObfSh63CLmavXDn+YiEWr+NzUpPSEW1hKEsK70mF
	IQnlSA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2vbjqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:22:59 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-359b81ad4e8so3987132eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 20:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792120978; x=1792725778; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=FXKXRsO1NEeS/2TS9sHVdUKXS+bQW+l+QNQVKK5PFP/rYvoFSUmE56SIG2mIYfnuAv
         DASRHASidaSy7Llue2VJl+iwspGoQeNN9mxwQkkhOwES4U+ksuU9TgMr8TfFkbsWzzSi
         VSqH4jo19W2piroT9yxt6qQ3leEeYACD9+Tdx6pREEFBUxefRJAnz5E1GcduQBCTWs7p
         NmMZ8G3ellnnjo2ncWpDvNxhLQZcqvWH9mpLmBT/DYc5Xfq1/YoWzpqFXPMUuIxf3cyU
         b10cmHdvDt4om4nP+5SbUw3J/SGQkz7I8pxV1Cc+doDfkrtwAsq+RCZCWyh7pCHp2EB0
         B2lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792120978; x=1792725778;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=alOZNhc/hBycopSj6aablVmFXgtwQwPhX17D8dTQR5Y=;
        b=2oCdV38UBPmPoA/Oh0959GnhoSCHVSbXSpp6SvZ8xzLX8NlwinJINCgP63NZ94vN6m
         t1Cwh6P5JTWn0JyMoe6x/WwnqNFaKrhW6WAhdNqvPaaTThOYnDLuy+svQFWaLkBxEV1J
         T6JBSFyn0to4wJPSAalXzXWPiQw7O09Shxs8QLv0sRMYT6aMtQjwyb0FSnMOfQZqr3bb
         pqNHuFUGV2L4lziwXqiAfQZ57GOchifNzTIdM5M7qJf9VhUE4xKXIWG92howgNJVEMLr
         trFoTP1E5txF+hanVGpzcAls8F0cxRoZuZG7iG8Ulz+k/Ls6/Buf46zg88W/O1XDkiGm
         /CoA==
X-Forwarded-Encrypted: i=1; AKwUvBy1VKbht3cFMv+5b8WtcTKUT/fPYE4SrQX7YyvhpM6dTCxhi4siTMUsLUhPTZ99tVYCpl7i3aaHucvgiFg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKWpu03ukxR9SA9YV0g24063UKK4X4ebPrJX8Y9vJ9UkH4R+4xe
	V6P7UMs1Uwp22+buYfKtsb/xU2E3SS7m02FQhwkJDB+/t/4D2TcwGJ4ypBQWikxz968iGRdLy6H
	qzA073qaGesAdpVWmQxpXnX97g4BzVRgcNMJ9jNaoi7ls49YyEtQ1hTkFKhyUJMgj0LM=
X-Gm-Gg: AYBFou3vWxIG/BQD3weCB1wlldaxhGHkFRD6ReMjucWcOf1ks4OslFzcvQ4BKCrZw32
	4S6g4qQ2ASl4Ak23WEhH+ojEkOA9FSXjZovGgxxkdr17aXTnTpoKCkCGV68+S1RzJvGrh2KKy+z
	TznQzq/+X/Xh0Ec9DuKD0vAVV1NvtttyUyiFVrAhAHMF2p1MX2qtCpmWefoJ/pghxOYg8E/9Gdq
	8ouqYUQ5zIfqn4flIjPaFE8aLDuaIcheIhIxwAmKiz6Gl/BTurPOmMdl5O3zEkDcl5YqQRebBFS
	JBu/5KP9LbHP7Ey4/9jFFPW2VI6+JLaJ2esNCRA3HgnLJjN2docRGUTe+EfOlJHo2VlxcdkdQve
	Wv3mIEvmODw4EvVeed1RBesnu/sS3V46ASLUAgs8qmi9NSO1g+JjLiznk75Iz08cMiSYIG7Bnp/
	S/qkE8vcEeJh/wIHtpFELLrQ==
X-Received: by 2002:a05:693c:20d1:20b0:35c:e696:2d4a with SMTP id 5a478bee46e88-35ce69632e9mr11810154eec.24.1792120978266;
        Thu, 15 Oct 2026 20:22:58 -0700 (PDT)
X-Received: by 2002:a05:693c:20d1:20b0:35c:e696:2d4a with SMTP id 5a478bee46e88-35ce69632e9mr11810126eec.24.1792120977713;
        Thu, 15 Oct 2026 20:22:57 -0700 (PDT)
Received: from hu-aarasahu-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm2256698eec.13.2026.10.15.20.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 20:22:57 -0700 (PDT)
From: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 08:51:52 +0530
Subject: [PATCH ath-next v2 15/17] wifi: ath12k: Derive QMI service
 instance ID per protection domain
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-mpp-bringup-v2-15-f510c33bfcf5@oss.qualcomm.com>
References: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
In-Reply-To: <20261016-mpp-bringup-v2-0-f510c33bfcf5@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfX5Nu8Uj4KS7+a
 B439GNCae9HUG4l/mIcmHeed5D8h3IvXZI+cBqSI+WxgJiRb7DJVwpEcMHYwzRnifCgzXpj7Mb6
 aHAIK+BYXjjKN75D6VDDCAra3iU8wIWIHWevepN0PVHPDQPYXtWKOVA+PyvzIISbT8sR3cYy33O
 V0BU3ktDknVDTPO5WmUDjZvLxMekGsBVGhO6bIt1BBISgqbu13R/yv//6I498aSQK21baMhgJ+g
 ggLT8jF11oA6sfh9PQXd2PJxq1UlTycAjJ9RUrDNyiqUcTccISSRFL0l4tJHhzBwZE/3dwk4lRI
 mRu+nKCKsk5ZHF0PZqpW54tJXfbvkPKNPRIabjvDijzFKbSmdRGX3tQ08zIf6uYEkJYYmqk09dA
 eN9EiuCfTSLuT8palsZBPTLe0ryU9URYcuKVmDnsrZVzXifYpKeiuJZobnzknD8xHHcwhEB6RvN
 Jm1+2TBeltWGDpZiEAw==
X-Proofpoint-ORIG-GUID: VrbKGdkLsbRMfK0yXPgbES3GLtWy-8ND
X-Proofpoint-GUID: VrbKGdkLsbRMfK0yXPgbES3GLtWy-8ND
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad19893 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=1lU9L7Y0PnsvXye6yGIA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAxMiBTYWx0ZWRfXyzZzmLjxrUjJ
 l/Q6hsyUxRBf5zImtNMhUfdrNkalbTlEMv1o88sQjK5j/A4H9eRyVVAMJvjaHxJWEd5SJWYih1H
 Lpy984p8wE48rpTudwP0tuXBv+J824E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160012

From: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>

IPQ5332 platform variants are supporting multiple Protection Domains
(PDs), each PD exposes its own instance of QMI services. The current
implementation uses a fixed qmi_service_ins_id from hw_params, which
results in multiple PDs sharing the same service instance ID.

Update ath12k_ahb_init_qmi_ce_config() to derive the QMI service
instance ID based on the user PD identifier. Offset the base
qmi_service_ins_id with (userpd_id - 1) to ensure each PD gets a
unique service instance.

This avoids QMI service instance conflicts and enables correct
operation on multi-PD targets.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1
Tested-on: QCN6432 hw1.0 AHB WLAN.WBE.1.6-01322-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Signed-off-by: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/ahb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/ahb.c b/drivers/net/wireless/ath/ath12k/ahb.c
index b9ec14e86def..cecafc12e8a8 100644
--- a/drivers/net/wireless/ath/ath12k/ahb.c
+++ b/drivers/net/wireless/ath/ath12k/ahb.c
@@ -567,12 +567,14 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
 static void ath12k_ahb_init_qmi_ce_config(struct ath12k_base *ab)
 {
 	struct ath12k_qmi_ce_cfg *cfg = &ab->qmi.ce_cfg;
+	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
 
 	cfg->tgt_ce_len = ab->hw_params->target_ce_count;
 	cfg->tgt_ce = ab->hw_params->target_ce_config;
 	cfg->svc_to_ce_map_len = ab->hw_params->svc_to_ce_map_len;
 	cfg->svc_to_ce_map = ab->hw_params->svc_to_ce_map;
-	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id;
+	ab->qmi.service_ins_id = ab->hw_params->qmi_service_ins_id +
+				 (ab_ahb->userpd_id - ATH12K_AHB_USERPD_ID_0);
 }
 
 static void ath12k_ahb_ce_workqueue(struct work_struct *work)

-- 
2.34.1

