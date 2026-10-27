Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102495;
	b=ytqLsD7OemUUTg31DHpCp8rCihDpM+aMYtP7o6oXfwFl0AnWU3EE5xfAoM/jCradX3Ym
	 82+5+YWlwopCiCfg74KHSdAcOts20FYR7NCHaYkbJr202sZmtffvVf4azMEUJIbC6WaM8
	 crv5KDHfk7ZFVcG7FpU2HqeG929s2FMheyUUb2n9IuRG8/UH1R4g2VShOPrrTWj6AiU0L
	 mm/3ybHE5Tr/zA10CuOeKwnFvmGm/obW4z3g8w0277n6YDfWEI3IR03G64oaoQMagp6b5
	 48lUaF8Kv2NKWNgM247dLhtBgwEdsNfpAKF13Z8iUuyAm7tuS42gEjDdOohBNyCQtpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102495;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
	b=SDl6onXTdOk6TP8q3KX3F55tyFaMU1KCVoCoZlDKPv0UV9Rg7mMm43AZPFOMKtDCkp30
	 h8Dn5NOA7ME4awDrY/FT+HrM9S53VJcq0DanQQhTbDZQ5cd2eaOWD1u0NPAXwxA74ySaz
	 F1obmZrgcS8wBDLlqigGB7434UUhxl+GDoOs5Cj/QxJR1RS1YHPqIhOu+iwAsL0PiGgcW
	 Gn6qP4rm9WTCggrIb5I9l738Z3/bpOCVtwneBkHbtus6sZhLeDuzJ9JYW/S8XFxSadibC
	 yb7UPCPI2Gddnfe8v7Uc0f0nR7Qc4KYH0n8rr50u3ZkxwmncA/0v4WwT9Ipd4kNvI9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3jL96oI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VAJtsum/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76053606A331
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76053606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=a3jL96oI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAJtsum/
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeAvb2524940
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KNE237mj1MNRlMgpVoOvUA
	DUwZrvTfIRUQM33z2ltSI=; b=a3jL96oIYi1MaDo2m07xgWy3ARXVIdcyH/IIHt
	xQX0JYNGBw0v6ChJnqI+0gMJcR3IfDzt6VlfelqZDY7meh6fcSfC2946WrDoaMlC
	foAOhZrevvo446fAl0owCfsTfQ4FhDDS/R5HYRmFeGLn/vn1O3R0pZ1WG1MSN+Gf
	Ul1NQX+0Mu14mu2VZ1mxAbzvk1hrTmkv1EjXC1qoZWMxbCBOZKFzMy1SQFN4TZM/
	S2PcIzu7k62KtqA9gKV33WzAalXxV+sIUI91vi9ds+qyLKUZ4kBL5HOMNF3/dkji
	OoCkbxWZrqadoauKWSkCcdX03LoN42RO8bnvr+zxw2/asd+A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20xr9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:01:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ac8f449d1bso3768366a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102492; x=1793707292; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
        b=VAJtsum/4WR1627U5fC/m+fcZBathrsL5yjUllNFwlvuU1mAyItiuDP2l8KauoDhfK
         6mHkeJp1EA9XwqyMCb4LtnlEjsgK1Bnq5ucIgFU6LXCn+mFgc0GaJ7hmKJJRoghsAgY/
         swJv8FMZpOM9L/EJ73+jIPdhqTP8ZELBUDRRioNvRtxlEAYBuqCltpDkEfecsfw42N4e
         hFxm+QMInzW7fUVA+xZqy6mPNJEAOstFGuuU7QroCcI2C/q0weOl6zJi4zJbex4hYux2
         pdXtx82EhTSVaqGITgVdKC1ckWjaPNuh0SQG3uQxN0v/jbB2nBQ+2uLQxM/Ug/dvbeq9
         NaFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102492; x=1793707292;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=KNE237mj1MNRlMgpVoOvUADUwZrvTfIRUQM33z2ltSI=;
        b=Eu6bYvX+sFk9mv51XusmJHSC+dQ6S6QjCY5Un0IyMgmNQJpRtaVQiYESxaeXvUeEBU
         784vq+quYxSl9yJMCoi0CB55yPUMnGdV0nfnwh5MNPQllmP4D+xCvhgq3K8JWNtCXeLw
         bDGsttMLm4k7gOk55z0iqMgkFMVG/wxnhZRWV9MgQLsRK0WuG3ObRpe+dzAzgXMsB1dv
         2QRSdLQON4rs9m6+sPxLxQZP73Y3dAS8/mpCqHLYiB6JAE128bfeVEcgX2/TpNVO0xre
         HDBDuD+YWu7gUX7lc70FC/xvD9gtZdJ0PRVo4vEJNPHwkdj1alIEtCPwVop8GSrL6Vrt
         TPQA==
X-Forwarded-Encrypted: i=1; AKwUvBx+48C5Rt8LdqYSIB5kP0PFx5oyiKRb48zpxQvOojU93GXqwNIfFk3HHwcrcRXkDt0pMH5WPl9RcvUWwkU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4mCRAPPKqs2TEVq/ut8409w14l7t8ilnfwpnkWUdzRVbhycnC
	OZLo8t+9Dh7yTycnrwn4a/c1UZVq6asbbEXL8sIS1aCLgdeoA30cYcKJCVh1h/XXzHat/kGwUXW
	kInm48EVumczwVaNGdVa4rh6+0Mr4zr3cNb2u1cEDWEx+vAy4whlP8T+wqWvdRD+EzmQ=
X-Gm-Gg: AYBFou1QVXPCiPlpGBqhTR7te+Tna4EFY2Cp1QOEdIOhDYLUH4aviTbCmrOzN3nSimY
	noTv3fUA2G6WUv7xp6BxJEC8JW/kb8z5qyGEFgSeGCfhj/SIq025G/Ei6DS80GdlLuB6jbJHmUb
	2TI7gM3bgxPQHyb2M0CZuP4448M1THdxiOSBL4erUFB+m/iPRzs2KdGPJgfp1bps8qPU3/EG2/2
	0cC69JCrDg0ghtxWGSGLErvfb2apiUUw7K3JIYA/Bc8CHKmT23sROLGiEodCxF+lwCp4UzT8aMb
	F847XWle4RLVBfyvICgtZLkotlmJ7rXFHOVxFP53rFAu3dDdaJCQDp/TWTsG4/5WanFE0JIN4Wh
	YoCeOfVHRI7jJ2chTHGtuB6IE6B14vK/nBsbfPrUW+Pl7Cc/BIUkv3EKpQfsizxdPfmEibDBJ/2
	JrFE5i6Z35pw==
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7390144a91.18.1793102492447;
        Tue, 27 Oct 2026 05:01:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4cd1:b0:3a8:1943:cb7a with SMTP id 98e67ed59e1d1-3adead44808mr7390113a91.18.1793102491931;
        Tue, 27 Oct 2026 05:01:31 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40651560sm3672037a91.13.2026.10.27.05.01.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:01:28 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:31:22 +0530
Subject: [PATCH] remoteproc: qcom_q6v5_mss: Fix proxy regulator array
 overflow
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
Message-Id: <20261027-b4-q6v5_mss_proxy_regs-v1-1-6c5557e42462@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJGS4GoC/yXMQQqDMBBA0avIrBsYQ422VyklaBx1ClU7U8Ui3
 r1Rl2/x/wpKwqRwT1YQmll56CPSSwKhK/uWDNfRYNG6FG1uqqv5uDnzb1U/yrD8vFCrxtZ5gQH
 xlgUHMR6FGl6O8eN5WqfqReG732Db/rMFwYp6AAAA
X-Change-ID: 20261027-b4-q6v5_mss_proxy_regs-2d780c0095c6
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Luca Weiss <luca@lucaweiss.eu>,
        =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793102485; l=1400;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=TJzPJNVsxPFGtMeNzrXT5vOZP2+aBDhH2ctGaurMUUQ=;
 b=jWhUUIWporDqHDdpejnELQLUFf//pLhMvR5mqllgDSbaBgGClVK1s9ny5BdYA/5+aFfwP3LRm
 Xa0GRyOmqItDfaSCSQir1BbZzqlMbnA1+IB1FOZXkP3Db40jTkQdbTY
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX+WgOyQGIocBo
 uGTWx8TGrXECJVRR5KpigABxIEMd78JcXENJMQ98ASDdBZrjb8vkGJhRxod9ThRxycIaSXBmJ1R
 GNGTKjtHW2SQ3/rCTOjwTOPYQJKERuA1lUnxlK1NFLr1/qwN9j4/kb6y4fyvjNKVVABB81F5kat
 YaTOXJqdC6VNDRc3llwigKOS/3Ec+0BLue59OtDrBGewmp8pj6z20na08kbZkoX43AAdFg7980J
 yfp4eDvkC8I8DoAK2IWzX2Cpu9Gr5E7i9/5btHiGfL+7KruP2DrHiO64IXyd3fTRvWlj6zSjRDk
 ckqZsygkO2jG3MzbQHcPEadNFhQvn2nhFnGtj9DOoU7Y9PvipXFcxD1y5LTFaqQDjrWYIKnLXlE
 urp2Lvt1E/zfisQKp29iAnROU++6cLVb9KL/j5gYDoxgT+qadNz650rdqYgRuYfyyZ8RfxWkH9l
 WiJO0PEho1aqxdM4ukA==
X-Proofpoint-GUID: BUXmAgFUPKFLap2UDxdYg5PPiMXWi2KZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX9aUpSataJBR1
 +/HdjLFmqtX97s6yK/YGAUQzqPIyCnI/GFOvQvD2g+Ij/UZ7R9u+7EJampRHw6J2a4EUG58MZtk
 iPLkRxJ/Jlx0sbsczM01RXmVmYID3wU=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae0929d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=isYqYfF-chSf2xzEknkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: BUXmAgFUPKFLap2UDxdYg5PPiMXWi2KZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

The proxy supply tables of msm8974, msm8226 and msm8926 list two
regulators (pll and mx), but proxy_regs[] has room for one. The second
entry written by q6v5_regulator_init() lands in fallback_proxy_regs[0].

On msm8974 with a device tree that has no cx power domain, the
fallback table then overwrites that entry with cx, so mx is never
enabled and cx is enabled twice.

Make proxy_regs[] large enough for the largest proxy supply table.

Fixes: 4641840341f3 ("remoteproc: qcom_q6v5_mss: Handle platforms with one power domain")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 2f71ed2feff6..7dea3bad9f5d 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -216,7 +216,7 @@ struct q6v5 {
 	int proxy_pd_count;
 
 	struct reg_info active_regs[1];
-	struct reg_info proxy_regs[1];
+	struct reg_info proxy_regs[2];
 	struct reg_info fallback_proxy_regs[2];
 	int active_reg_count;
 	int proxy_reg_count;

---
base-commit: 20a33c6b6cbe7e4805dfb6cd68816937443aa148
change-id: 20261027-b4-q6v5_mss_proxy_regs-2d780c0095c6

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

