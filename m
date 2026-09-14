Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4E480320
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390160; cv=none; b=B7rhSEzB30lCmy4gcES37BtColRKBdrVUEc96VzpuP6yqCKKPxg26BBkZ3rNr3GgNqS4b0+52UztvTHDLC4WehhvojiCTfqzEszA8xxCYQ5Fg5r1wCm1JmU0apImr6v510onvwLqlmNRZKunnn8muE9y1o4/uBtv2LOPbxLkiIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390160; c=relaxed/simple;
	bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NnKO5XIYbSk76SUY7EE5035bJLPqHOAmMm9qVeQawihx1dYrqKTkiT6NvF6gPUUhfDWRXcohEXRhWSBMgcJEui3OAK7XSWdjB3E5ir46QQKDMYr6dYNDl9HaUn4c/tCa8S5jHe3u8n8AfICBZxjcJiEMdcTHvLIhyiPoicfNKRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMWn31hC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aQY738eI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMWn31hC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aQY738eI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm088727567
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=; b=fMWn31hCpSUnsH5i
	bxHwCz+YV6bscRjrv2nvP44q1AQtrPgTJP3QW4Y1zsx/DCX7YgFzBlAbZk78j2mC
	2tfWYWpxgUxBEMatzm6Dsbgx3NR1VYMWEC/5UcUDMHIiFsj5YF0MCEQWZWNLqYPN
	RdLsUQh25ZWpZLzc8bxgs3lZ43m9muWLjewiEGs1E9ZR730qFpV7/am/lb5SDFEY
	TEIs3GoasnQvHbd0M5q6NZrHtfeQDlxBcq/Uj/hwd76KLVpDRYVKhtAemrF6ACEB
	2HSNVnRVYk0gDAACs/n6UIivSgIn+xqsOA/y8ZihjZOYxF1uVEFIOL6BXo35D6VR
	R+CfOQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5ry3r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:49:17 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e8d95121cso337911241.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390157; x=1789994957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=aQY738eIE0WCbtArsyfOi7moCEOE6VZSdfbMwJm4Fb7lV9ihOSRpANLWMto9k5AX8P
         hOVyDJchdu8ltI+hMUx2mesd/5VmPpkY8tZNV6mnMq6fpMd3pOxP/xy+POCrT2meGmkk
         GqQiPqb5hC6MA6kfWBdyVZ817Hu3K4rxpjHfsuITt2Uw5ojJ+nyzv9LF+WGXM0FU5C0n
         loOSt5qKV2uA0e0byzP4a1vdIohOIVdWzbwk2wEimiVVbmQcCNcBg39zPDHGvkPh329C
         /sp+sQ6VLlhyczWdww1aZerKFlSSaeQCLdMilR3hHFxHTwBGfBwSJlZ1cl60vXLKXsDH
         4ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390157; x=1789994957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5+TTogpgfLS0vvo4ab9m3yKNhSx1os/kunE/CWuc5PQ=;
        b=R/66yu+e3XT19uljBZTlumvZK2MfMZpmbPmBC6wANLTAxmqXqb6pgvZAZINqJ50qAF
         61wzhGlcXmNRbQt2RSDOwiCiQHuGVYyQyenX/O8GNCYJDWrF7ZTIB5KwM2fiXSjcj24s
         rSZyu/Oo37n0r3xV3/qLR1OZ83hIpYOsc7cIKnbVgheeW4B8k7ClHCtbYropcE38/Tpr
         xOZpXe1oyLS6QDYCuSlYYbnCFsDSLqSY5Xz8dzyxDdHBFye9Ff/dUHQjsdPhb0X8fJ5O
         x6ydIKNnvzvi4SBZNy+xL3xow4M/klxb4THO8LMMnbdVNANMFSa3qNSGn1Bu4LSn/yfw
         FNHQ==
X-Forwarded-Encrypted: i=1; AKwUvBznvTXfSxJLRmKyYUUNhG813xBdggxyWXLRWbNhFy2ngz7fbPn5XiIL0JP6lnpE02yWhgwKLIBTwIkY37w=@vger.kernel.org
X-Gm-Message-State: AFuF++lwdZtvEChgpl7Fc89DMMpZ0yeLJwFNhumzgN5DuW47yradjne4
	vpOAI4phe3aT/H82UhRYOqn+NLM8sUeVZUmedA9U041737xUY0i8yu7Ig1+7MiWTXy9wRc6FNN2
	dYK7i7nhhHOMDuFUvhy8jZCquhIze1ZXXeMEVA2TV58MDPAAl1jrEMLffH5y58Je9GLk=
X-Gm-Gg: AYBFou35n7guGrrHVx7Pnv6TAWCABkIALYGmylEpnUs/2PObSeAhFIegbkguVYVMqq2
	OAMjoXjfv6sroeufmP7ZiT2HrordPe0CkTYjIDuO9/7NNEus0VaGkI59flJYj0EM45Ssr/RJHGb
	IgxGHCu79zuIb3EqDrrMpUG7lMyVfsh082lNgURzrm3mokILEp257JXG4OA+c5wUk2jQfWJHLNK
	9T2PkvfmVxFxjJoWnpxDJa18TLyWIuXqmjxX7RLNLj1EiTmy/7S1sE6OzAk+jRs8+Fp4VZGwSRV
	22rqnVqGfOpTw0xi41ypDHEwb7O/VJd37eTtnaVZjvYyp+gyZxKjTANM19jIKkav153HXkhIkki
	K4fX6Zwfq
X-Received: by 2002:a05:6102:dc6:b0:779:5049:87b2 with SMTP id ada2fe7eead31-79b517aca36mr1218351137.0.1789390157092;
        Mon, 14 Sep 2026 05:49:17 -0700 (PDT)
X-Received: by 2002:a05:6102:dc6:b0:779:5049:87b2 with SMTP id ada2fe7eead31-79b517aca36mr1218322137.0.1789390156642;
        Mon, 14 Sep 2026 05:49:16 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:49:15 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:27 +0300
Subject: [PATCH v4 28/52] clk: qcom: gcc-sm6350: Tie the CX power domain to
 controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-28-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=765;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=fkm1cu3iCQR87lufDwmiJdhLLsSFmGL7gsxEJ13zNHk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+zmdoOi51O8okuIYyqfMOQiCfHiJU6iU1Ivi
 dwCG78PAuaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs5gAKCRAbX0TJAJUV
 Vh8RD/kBIhVFpnHiU6Tfj5QoN0vxuI6QouwqxL8huQOYIJbNIOYWNLTiAq6gV549erFRGOK+6od
 xMVBzlBiuTM4qA0wXyMjazIHUIn+dJ+F2DWva8AfKaivPiiVEWv2xeM9zVI2HAjEa4rpB7ygruo
 21X/qT+UOpKekbwnZdF4RQOVsF16C9cVaYQH9txZkeu+dD8svW5nUNqZf932pdFs9PzRQf34Txa
 eoaGWvvvbxLJt/OnKQyH/r0EBAwWf6vwnQ+od/eyC5GWw/mKo6GRY9LdtOleERMuCu9twQ5mIKs
 q9w8REMEmesF7RFutCAofhLjzTpCGWihSEcvu1+ALX0jweA8LEe84t8jG4GHJBAJztHd3T6Mwgr
 rGQWAEfirFgBMB/9wRq3vup5JuqRfaFbQTVYQdTa2/fYcdtDCPTRANqaU6klGWPwpGHDuzMM+AC
 +Zmhit+HDf7C087DMN0fyqdJBOGKPG2Pg3DPAyZXioykKPkGW3/lJHc8YRLIjBCRpjw704sl7X0
 kGug1UdGDg0rZBnhg8SlMM66OgqgElYyC0bhcBRkERkad71WE2UpNngYEHU+h7R1U34cmCfYE9i
 iH255WG22QgCvtdeJQcQ3n1n6k2qBsJKZ7/hKoAVlthlKzBsi+4/LNvNw+gtrQ1vUoxygEyguJj
 FTJx7INlMmAVAeg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfXxG7MQTtZ+/mK
 5B/w6ksLXlEz0UM0B37kpzG51IISSAocjNAxipXIgXFg0f9dBPfnpNFDHzE1KRp5YV41uA8B7Ms
 U2WGrAxP8BAV99rYOAliUUVx8VogfJ4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX2d/8zHAYWtUS
 Yqr7+E4SmTemww1x7QcNdnaWrQ6YQ7rVnYDWpSWe7UMvwrRfJRP4MooR8Tqa/UivdzVV5GwB8uE
 oZTWGU6X931eKE9rmNFRHdCtVmU7plA7n33yoCPuYVinhoX4ne0PxDtbhe+lN0OcU0lcAtBUWsK
 7f8RbiI2jJaJ+FuBjSoSkgHIbbtAoBz6LqvyfkpUdAf+1vtGWH2CnQJJab+cInnbZj9c4+BDA+G
 JDUV5N5fzZskEVk/B0O3mm+mja5/pfe5zIrxAjFOXMYEhz5HLv4cb1dwLn3Nz7NcffiyJfhB+kx
 JVXTYXr+m/FGrKlzgrG2wSTpIS1VIXqPt/ZktyUGGtSa4Y/gIpKrqqFsaRKt75rgi3r8WqXOcm0
 Uaow6viZfqg2k7kek9Pp1RRF5DD5Lce83Qqwlw0dG72RUXYewduZ8eOt3skhUGLKkvYgWE/VKJQ
 9pM5SO5nnak/+h1E7cQ==
X-Proofpoint-GUID: Qluh2q6suCsoPOtalJzca2katAPSSIQ0
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7ed4d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=j9QDv7RGPiaZsbg0A-cA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-ORIG-GUID: Qluh2q6suCsoPOtalJzca2katAPSSIQ0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140183

Enable runtime PM for the controller, allowing CX to be powered down
once all GCC consumers have released their clocks and GDSCs.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6350.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
index a4d6dff9d0f7..b99a5bc53048 100644
--- a/drivers/clk/qcom/gcc-sm6350.c
+++ b/drivers/clk/qcom/gcc-sm6350.c
@@ -2545,6 +2545,7 @@ static const struct qcom_cc_desc gcc_sm6350_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm6350_resets),
 	.gdscs = gcc_sm6350_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm6350_gdscs),
+	.use_rpm = true,
 };
 
 static const struct of_device_id gcc_sm6350_match_table[] = {

-- 
2.54.0

