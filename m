Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8962C3AD515
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790250435; cv=none; b=cNpenkkNmVmcA+Kx+ZI1of244MWNinHgBoMSJWtndsT2z0lsfF91/J9E5LslNiTM0QCVTDV+ylGId5FW1l7aKtWc2Dx0XPXCWgYQOz+TmOcPv+HV4vQasN/h7DSD/1YDP2CQdQtHNDkXjeME4Mv4kX2thjZZtZFRxSxExtZAjZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790250435; c=relaxed/simple;
	bh=+ZZoCETzWv0YK42XFmBQielvqyc3AJGlcA0l9tIyK1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mRFHh55cDOmzO3287WN7aSvWotCBBlPyePFmcuhCVEq096SutWIC6aTOteoZwGsxlXfyy6Nd39BPgkigxhsW850E/SS5zKH0mG9wyZW8BmJuoEvsBuenyF6EyZ9lre3H8+nNPczPyUZsP8QA/h+ZjHd81LagoOiReVj/inMjtdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0dG4pHf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JQ2ijA6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0dG4pHf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JQ2ijA6L"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PgiI1270209
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=tAdxoFtPLUwbYw62OuSece
	gmm7KVlJ1mhus1j1hQCP0=; b=R0dG4pHfLXCl//cq/dVEfYem1jgbKcJW7dOqEL
	7OAoeD9TLqCVGepd9o+4HK4MgOU5e2eZb1umyBPDJOWrg48r1bMG4PKgnWDyje//
	KTTWcxFfXwMpTUUKhaU9tmLbSReJPVXmDViwBL0PEd0NIfNtvFbNf3FCA7xj1XKE
	zcBkDobd8ygN5U5wj/x3sBK43xzeH8jb7KONRY55e0WLhNKpjdZkf+ggDawtk0uY
	+lXqLlueItDZ1V37uguJ/elNKLMmzV4HWx1mlv1TeLhKB9Vs4sJANMOE4RsmyN5B
	5P3hBcDY3bo0yfIEmix8u2AvxQh7JEMRz2Qb3UA1ntx78Atw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90aubq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 11:47:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0c7126e7so320317285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 04:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790250431; x=1790855231; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tAdxoFtPLUwbYw62OuSecegmm7KVlJ1mhus1j1hQCP0=;
        b=JQ2ijA6LZPqDJAv+glngLa36zBqzbTdmRhMMfmSBo5YNa69MH1uhj+A7WArOGctvng
         e5oXlELCcpb8Qx/JXkyBvc0SamzCVw+irdu9IizDsb7dvkQ6J6s/LfQy0GlCaggi0JV2
         8lx7XXoCHzW/JtRc6H0WIJ8traD9tJBWtBXzOQfp7S0eQgE132mKBQQGD1X26V+Ja3lg
         CDKF5SCPlgyX7t2l41Y+xMTPczG2FIyFobz4jTFthX9yq6isnl/TdqRrOZf+5yT5GXMT
         VmC0i2ahfPQ+N47/6dJy1t/+nG87u174JKm3PjF9s6DN+Dkrymd9ARdsj6lKqUaJp12L
         a7MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790250431; x=1790855231;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tAdxoFtPLUwbYw62OuSecegmm7KVlJ1mhus1j1hQCP0=;
        b=qwCDEhev96b88l0KrI5vlP4rqZRizjK1xYEp/7pV602lkVya2tLZvzffsQluIyByx9
         Z3gmvufH6ataY7kULlpCZi0vuf8BnfeplB+/R7rfaWJK8I/M3fmHnbic2Z4I8u7G/nSe
         nQ0r+5ODSCMjpJ9cHOHFbjhdcfgTc3yPRBzGYUcizGOJz2Y/3sBOyANwy96UN5X8j9KF
         ilPU2ORAyvd8lr1nZQvQTJrXb0NMri5O4CVHibkxmC99GIyMBnBJjGj86x2uYdP8anUm
         C4dkrl2o8+0uiAC9PzCmxGKmbWwMTfCFM5ETwFimE43i2ttTrw+Lb3Mp+nneZCKovHXQ
         np1w==
X-Forwarded-Encrypted: i=1; AKwUvBzXUiqdCaYPkI7VF2Pe8mChVuJbLa4hpvJHQK3oXD21oXSdvBZ/XpcSROfSGIobsk7fe+TK+aKhoy1Onn4=@vger.kernel.org
X-Gm-Message-State: AFuF++lGhNX82r4SdQ3pa4b2iEcZBuIZ68S0xJYj8ALv+RJYBwu7+q7U
	nR51MYGRaJ7yPz/UbTeKbmmaaFIi5joZLF30CpPk2xEK7/w7n8WCEq2Wfwy22snvoDMa1G42FJ7
	5bEzLvAAZEI0TAzwy42GyC31WzJQvv4Gs8J2t+0dEpFguLJOiPHZ8AoGsOQ+rQM0lRlY=
X-Gm-Gg: AYBFou3OzfFU+kV0WyHkfuP5pkfhbMzqfcKP71Iku16SSQHsQImA4hs92u/Ie46+2Ig
	JnD9tFg4ascZSTqtCdptM8Byr4LGhmiHgxnZJZ3vC1AG7gDEtAr8oV62nyX/gaI5Xx8Vx2QMJAK
	aNNg3Ngu73FsZFe4YiHTam34zq7uptuiyMqENSIvF17hALsnadLT7Z7/qgKbEjUSuAwhcc1udyA
	GGeV0NcfBDSmNruFjaN1gNjM6HOLmAlQNFda5j4BT9VG/TZhUtn2f3wHPhssu5WyKS9QFm2V4x5
	ljtnsvTEGGdHABynkx/jLBHtmkesdl3oc2Su1KvlS7m8aaWcTgFh7MdzSc++nG3fJYWA1paxKf+
	pkeGjO+bz
X-Received: by 2002:a05:620a:394b:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c3638bdf7mr228846885a.42.1790250431194;
        Thu, 24 Sep 2026 04:47:11 -0700 (PDT)
X-Received: by 2002:a05:620a:394b:b0:93c:2110:14e1 with SMTP id af79cd13be357-93c3638bdf7mr228842185a.42.1790250430539;
        Thu, 24 Sep 2026 04:47:10 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5cd4d12sm58500895e9.4.2026.09.24.04.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 04:47:09 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 14:47:01 +0300
Subject: [PATCH v2] clk: qcom: gcc-qcs615: Fix GCC_CPUSS_GNOC_CBCR offset
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v2-1-67275f94aaec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIALQNtWoC/52OQQ6DMAwEv4JyrhGxIJSe+o+KA5gE0gIBDKgV4
 u8N9Ae9WB5p7dlNsJ6sZnELNjHp1bJ1vQe8BIKaoq812MqzwAhVlEkF1L5gJNdBTeQXVjIBY99
 Aw8IMde8InDGsZ8AUVSyLOEMZC/9vmLQPnq5H/mNeyqem+RAcicby7KbPWWaVR+4f7ypBQhKVp
 U7xarDCu2MOx6Vo/XkX+iHyfd+/7kKOs/sAAAA=
X-Change-ID: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1623;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=+ZZoCETzWv0YK42XFmBQielvqyc3AJGlcA0l9tIyK1E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtQ26X/dqRnBkkFCiHD5Oa+8Ih0/O9h9tK13Ym
 zN6QAhZhb6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUNugAKCRAbX0TJAJUV
 VkiUD/4uj1sBVbAhgwdZuxZJD8jMTsv0l9vf935v4+GVb/Rf26d5NbW4Z/H3wdBPnRTx5PLocHY
 bH1arAJROojA8FZD5/BA1Oj3sUcVkaYSi9nSVpKFTrXIoqZiS7/ya9y68sdNE96QebvPLTUidrP
 H5RQoq6V9HxlRSjUeoz41pUiMGazesa29PP8tCVxWzAGwi5CG+u5qBn21gidcJjx6+/lexKMO73
 2gCPdUG8O740azgmEM8sZSnJzMarEZ4gbXNHbdVju+nqUIrdTH8+vbkIt6BpqtxdMGsnfowwsSg
 B1cVKPZ+dI9m4l7H77tVAo+MKBNDGAwm9awZQOoxMhwOqyJeGrmMz95yxmhW4vuwjM38eXULtzn
 /Z2gb8TzR5QghVljWBUeffxxpu8a+Oa14DjJmCClEtyB56FBIviovGdAmbOP/nbvtPAbrP5MhcN
 dvUf5/x5oUF60ODv2ktWFpbDnmvEqYf3d2y7NCmcAfHaKVqD248CWqK48B+8aE22ur5NaWL7hX6
 jPieTtxxwk+ikz2PXbm5zHq9ohDhd0LPxrA429QZYEwUti/Lv8DGNVMGNV1SdVttsSGJjxY8uqZ
 ctzCHjpaJwy43NXHc7XiWeo7LeebeSiDLDIy8bzERJuwRML0bERUB+KnsKPAjJJb6W21wOJLf6R
 8SfzxWBZmKPsXOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX7S82o2oX9rU9
 v2abB+5Uw9nCApXM6f9EH7wUNecx59Ze8DyWKa1vy3nr3RJQjW1hXwOnZeu8jugVek98XsUn7FP
 I9ULxETtjDNe94qJiDZwT4vS2xwgOk4=
X-Proofpoint-GUID: Hc_pb6321GqlydHmzU9LsCgQbnoVvmdw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0OCBTYWx0ZWRfX69j+VTmaRANG
 AbFUJ24y+l0QzgSFUFnOSgZCw7YZuVT4p646M0sRUW1quFSXNOjKY5DvDC1Y1NRnLbnLb21BaMn
 sXu60iDno30SfKlSWfjSUXrP37XK3H84eV26fnWAn8OIefWKKGb8mxPrMh5rjjSPRc0S5aEx5v6
 E78CzzhB9QBki4Xx5hQzLLFEODMYYieij0LY54VkkKIBTPZJFmoXduv2T2kk+MJ6UQ3LRrGYEpB
 g8m5WlQeNjqfUHvy69/+RT7hLQXsp6rAdmgd8NJX7gOcvcqEOJOBhG3zqodMsIfyGJ37A0zCnc2
 qiaLMGaDu9uh+mJg1ma+E/PVoZr0VZaMCvYksp2lQg0LS/g8+3P4yCClx8VV5M8xjdbFMrzh+RM
 9rhvU1lLMUxXzE5oMDSNZHTr7Hi+452lOf3otdhG9g9YT7mdWNPCWp0VyX2goc6pGBqUrJApjoC
 E/jwScf0vtFTeG9kBhw==
X-Proofpoint-ORIG-GUID: Hc_pb6321GqlydHmzU9LsCgQbnoVvmdw
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab50dc0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=uLPiVhPF6TeGUxki5eMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240048

According to the documentation, the offset GCC_CPUSS_GNOC_CBCR is 0x48004.
Drop the extra zero, otherwise we land outside of regmap range.

Fixes: 39d6dcf67fe9 ("clk: qcom: gcc: Add support for QCS615 GCC clocks")
Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260923.
- Picked up Konrad's and Imran's R-b tags.
- Link to v1: https://patch.msgid.link/20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-v1-1-50bbe728f2d2@oss.qualcomm.com
---
 drivers/clk/qcom/gcc-qcs615.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gcc-qcs615.c b/drivers/clk/qcom/gcc-qcs615.c
index d19792027cd9..8910a8badc27 100644
--- a/drivers/clk/qcom/gcc-qcs615.c
+++ b/drivers/clk/qcom/gcc-qcs615.c
@@ -2999,7 +2999,7 @@ static int gcc_qcs615_probe(struct platform_device *pdev)
 	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb004); /* GCC_VIDEO_AHB_CLK */
 	qcom_branch_set_clk_en(regmap, 0xb040); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x480040); /* GCC_CPUSS_GNOC_CLK */
+	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
 
 	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
 				       ARRAY_SIZE(gcc_dfs_clocks));

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260916-clk-qcom-gcc-qcs615-fix-cpuss-gnoc-offset-272641a49214

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

