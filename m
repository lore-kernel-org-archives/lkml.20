Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793987161;
	b=MDvpndrO7P+J0trAEsVoLyDr97VEpupMq97Xb30K/93egVZeEWWCHiKkBA2KTfu9ML/V
	 Iilncp0ZCfp6/vDnooKgFuC3NtysUc89tS2o3QxmqKJ6Dn66XerHf4b2nJfxLx1B+ixux
	 GoVHuemT9noIeTv912huDxSX6/xEXqMUeCT4iPZrsMc25MxFawhmPyflgmosfXglLPnk3
	 N8wZ+MANJAOekw8Qi3YBeq4wFGiWapnUy/eqqEDmOyq8cBQtfRU61jxTXuQ8ho4zOxHIl
	 Ss3YjXwR1If5z4CaFrrBCScAell1W2I5RXPfFUoB2Q/KmxtkeaO51su5mG9UFkM3oFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793987161;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
	b=K9wghMc538f4/V6jGdsMr3+gjR1VOENGAp+w7pFfG3xLpxURzRm4xkoz0Grl9+4mhfit
	 pk1U0astYj/bb+GrMaMWI9eAqQXEaggl9ErY9ixIsIFMJarTMkDMUB7jhsVobt/XqJbxJ
	 jhyY5cRdSz/RYX5DSRIS2DZpBCPWq0EcsmWtItpvQebUpDmmiT0vBZaG3M00DYdUlI0bE
	 /c6MUNu9+oFtgaMeTGXAiQ4kxSt46T8YCbU3/F4SjpH5tYJIYjlUTdKha3p6+tAN2pk15
	 Vd67KBf/W7u/ClcpwsAkypaU3KQLlkJNBzJkm5C0Bl12fU+qSbwzFBGZcu4HCuX1i9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk7Qvy5M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpOtDS4z;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6765C606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 17:46:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6765C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pk7Qvy5M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpOtDS4z
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6Exrd33324778
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 17:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TrodIbEn58SSppDzbgs2/3
	QWhe/yl/+v+9G/XWM6Yaw=; b=pk7Qvy5M+txPoslyzKS2N23D1S0A/gBi3AU28k
	4DjsT+EwtGTPJ3xqk00yrz++ny5iEP+PbWcBEJn/SDKfXSKJCoUHrCkyWURc1PP3
	zQYd6cRxFeTuah1XDu26jP0kQtl2p0+f/cdO1QX/yeQr+a4fbVtQYG1dRc2PN06l
	gDUGXhJTNgBl+IHU2OBBw0JQYAF3E9HLwghqCFUG7pXcRlYi15OzEKyf9vqBeTun
	3dKXD9hKtGW1AYd1veuoUNQjCq375O9GvobP/LbRIniovYabeeMgcBNsQLLKGnUD
	qBrK6KxuNequ2Py9KqivcS4ka2zW6b+9zYNGvetNdCFy9wZg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9c0xv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 17:46:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ea0fe07201so6810805ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 09:46:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793987160; x=1794591960; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
        b=DpOtDS4zxS2cL+j00ayxDGwhIVWmDD2mV7xyqobDK89Lg59KuIhf/urmgTTvbW3JCk
         YCo9MRRXnT2/zhSeKUWpMhZuwDe4miYMMQFdgCYqcg49CkhKeMaa+sWA9ahQBrrc8K0F
         2tYwr/KTeZDTzxwj+5crJgsOdnuxb673c4Rc6rGE2BzZvtLIHzm0H1mhZhMeuLW22N8g
         v5nsgtY/zu6OKBat0X/MwqOjApg3lLkFs1ZTI/zPRJSas1sC8DJv7OzZOe8phmDyMnM8
         ClDP50LQ2jVhEJG7TJqJ6iXmAEIZgLAyZ8XG6MS1Z7OcVF+sjPGIiY5CYrH+ishzsUkz
         kRIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793987160; x=1794591960;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=TrodIbEn58SSppDzbgs2/3QWhe/yl/+v+9G/XWM6Yaw=;
        b=cXmCImHgQVt7pys8cBx26xK2UHsLAfOguuMRyrltKQlNSGkUjvCZGGDINEtle2ymRE
         zfc2vcAK1uWGLXduY4jQJQG7MWrIQ0brZf7DU98ay3UN9WlVqdBQbT/n3DR/aT9ozaxu
         diQLAN25ZnJUq4fLhd/W4z/06PH7MXDoXNv2S7J+Ab8AoJeWUD0aoJog6y2rzkVaNI5f
         as8sc/9DSU3kiugxZEL3sQDJl64urL6+GgSLESR6NZVzlWqsYlxIKfMop0jrHNuNXin/
         4f94ya/QATOvhAbddJNn7569a+f0OHx8gXzEOpAe/WL6al6anXyMGuZi6kCOY8T9cq1C
         jw4g==
X-Forwarded-Encrypted: i=1; AL+hErH2h1+CtQgmIa7+gy344Fm1gWSyUN+sEpC68BB1mfvNvHyJdTpA2Z49mYOcpQ3N0HZ7f+APeHfxAOrIPvs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8XCsj91cK6Qobe4fD/K4dqe5YRtnMU/KFkiVp19SSHte38HiBC
	5MObyumx634zlD+irGNuWmx9A7lZYYdlcMzUDYG63giGRk/2iG9+BW3Y2DFESYaE8vFdJUzdbYA
	hxqQnSLWxRZavnABMFqs/9lg5QtcmY30AQzhcFc6stwMpzUVdx8mQqLZ7Vz/qSwRSE/E=
X-Gm-Gg: AYBFou3BGwRMl9ReZfe7QOSKGXVrjUW1QscQTgVnW3CFSaC3aT03MziUds1f7vyfANK
	RvvcKWQaEIdLvrgffU52JyJngok802av/A5J7HmFEQc0bippmX00Tkzbvhf52I7HeHrFKF0d9Jl
	R8wByo8Uy0QDQu3I6VOO2FKU6dEZa5YagtZkaWvlM+nG4pUxcgodAei5N3i9QDso9KQup5x9y8H
	RSYaqD1IQug4KHaEb7gk6cMqFuJS7sWxvadS8SiZ7XuKQnB6602H+b5SY9e/DVe/QlvmgUSFicU
	s50iRfXN+oPAGlC7uZidSRPpeOkIJDKusTAL5VMJmQkhkIbr+lAq1AwuFdISZhYs2mO4IoyHaJs
	dABlHSxHFaArFjAtfyxfdtvQzz8z9Fc8KbtC5Rc6kzuy8WlGCpfBdOlMQlgMZyMU5dhFkvogdFR
	21ScLJkn1KcSM=
X-Received: by 2002:a17:902:f64d:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2ed40e8e3ffmr36074165ad.62.1793987159800;
        Fri, 06 Nov 2026 09:45:59 -0800 (PST)
X-Received: by 2002:a17:902:f64d:b0:2ed:2e3a:1fa4 with SMTP id d9443c01a7336-2ed40e8e3ffmr36073845ad.62.1793987159266;
        Fri, 06 Nov 2026 09:45:59 -0800 (PST)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed47d40d19sm7745575ad.32.2026.11.06.09.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:45:58 -0800 (PST)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 23:15:50 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Release OF node references in
 init_mem
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-b4-q6v5_mss_of_refs-v1-1-58402c8fafec@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE0S7moC/yXMWwqDMBCF4a3IPBtIRIPtVooELyftCN4yVgri3
 o328Ttw/p0EgSH0THYK2Fh4GiNMmlD7qcc3FHfRlOnMGqOtanK12K1wg4ibvAvwotD58qFhSuQ
 1xeccV/7d1Vf1t3ybHu16peg4Tjgcwf93AAAA
X-Change-ID: 20261106-b4-q6v5_mss_of_refs-edf890e18e4a
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793987155; l=1666;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=4tVJv4tMHBDkmKDzpNsyFItbWpkgDiyGlM44OHU4nOU=;
 b=MexmNNiGC0gPRwcx1+1QNBevNDqkf1XsI/zBTSXwUVwa4rkR/kkHO+dpwK8IosV/0quiR6Er6
 WUsk3VRaZoZCCy6UaGmCbx76syN2fLk83YB2fNb6rFbb4Xlb5BS5/xF
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: 3qGZSRgwSHLOmEE-uEoLZZFSsEiI5qE0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXxAtaJZtsA4mr
 KvmnUBB7FjefhcpEbJcozQwRSLVcg7kdbBLJVdqhQYsw19RdgIrs8sRCymPLBp9YfIwqEwnebq1
 ie5x8WN+lfT71t/yReOgMLVqPricusi9RObJifhZ/uQD6lDafQAz3o9mrstBEHzMkR0ESP5c7DY
 D3ptumSfxoPJMbOCyqNxQtkE+awUywgyt5LvtJxK6WjAb470ZJPnTPJD5KSb2ZY+C7HjzsGxCrL
 o7zishzVK1Ix/BzNfOcx0OV3Kwsrpq3Lq1VGiQBCCQ4yjF3MwYDpPnlZdGUiQEiOUKw2+rwVTHT
 NNfsFxC0GeHQr6oiTbcqFNwCIV+3ZsZinO0ow+uNvKcH4JbVP1UrUmdRsnoOrbeo8tKKdCyOtEg
 DUWk7WTEd1v7ebwijLhsFYzlZZWnrfhnkncNIpauZDL2rWPoGR3WnSepBYIezxZyb7S9MJAQJlP
 yFTLasnuFt4DqBKgZ6A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA3MCBTYWx0ZWRfXz5Z+APc6owl2
 ZepQNNFK9+dqZ8cwW3CQfl2+UyDe+7LGoseBs0kjrDIM+pQTiAOZXjN2v4B34y+cLDpDn8yaHk5
 uZn3xnkdcI3fCZRgEnPqBX9q/cEmXXo=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aee1258 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=vl1InCOBUffSk_vTzvMA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: 3qGZSRgwSHLOmEE-uEoLZZFSsEiI5qE0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060070

q6v5_init_mem() parses the qcom,qaccept-regs and qcom,ext-regs
(index 1) properties with of_parse_phandle_with_fixed_args(), which
takes a reference on the returned device-tree node. The two blocks
copy the integer arguments and never release the node, unlike the
other parse blocks in the function, which call of_node_put() once the
node is no longer needed.

Release the node once the arguments have been copied. The leak
affects SC7280 boards whose device tree sets these properties.

Fixes: c842379d00f1 ("remoteproc: mss: q6v5-mss: Add modem support on SC7280")
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..e7ea5e838602 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1846,6 +1846,7 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 		qproc->qaccept_mdm = args.args[0];
 		qproc->qaccept_cx = args.args[1];
 		qproc->qaccept_axi = args.args[2];
+		of_node_put(args.np);
 	}
 
 	if (qproc->has_ext_bhs_reg) {
@@ -1892,6 +1893,7 @@ static int q6v5_init_mem(struct q6v5 *qproc, struct platform_device *pdev)
 
 		qproc->axim1_clk_off = args.args[0];
 		qproc->crypto_clk_off = args.args[1];
+		of_node_put(args.np);
 	}
 
 	if (qproc->has_spare_reg) {

---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
change-id: 20261106-b4-q6v5_mss_of_refs-edf890e18e4a

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

