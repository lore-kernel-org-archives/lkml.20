Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29781497B71
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260266; cv=none; b=fUtV9ewHn785IabvtMf9dZicMJifjmc4FdwG0esa6tlvBJU0dLNMn6FxKM5UXmP0TBBztXcpqoXi1HMTJuNenr2xnDaM7qBHzAOhzeGTw4eQ1Z3P8J5c8OJ6pVbk7ZrQOsNvoLVAcN3RfQmL1pzYVCo/D0ywYxEEJPUJxtdzZaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260266; c=relaxed/simple;
	bh=WvJzVZ93u/jnZMmTJFoA1CXtfvTl0ya7PkrEGzPonGA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mEwDioKxPhrUPig4xrUP5BUN2aPgpUQ8dbsiR71t2z2SQCvxzglTI0AW18HkPxH4PHnmZpkEUfB/O43o5vsRXbRUMr0vLgAvRnbjsdS4sbUZ1Yz1wWrKT7hHjOW7hMheJwgyW4aLjzNTG9ztoZ70k7ptHOULh6tJ7pcplvQVLPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N8ksqOCR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H3jMpEzZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N8ksqOCR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H3jMpEzZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4tCe803924
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:31:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ldpVhahcAZ5SyKKj/a7T0l
	AqAoDK8x+z9W+veZE/Ybg=; b=N8ksqOCRAcbu1+ZgQpRSUb3UIXuGOzoTPH4pZS
	xLCydb/IwGzn57lRC+x9mDL8nAnXEsrOgzd8MlgKcNOpzHaygJdXAJoD7NfE9DAV
	0ffvKtdVrTPpplVWz/KFzZsS78ZhpT7K/po3o7ZtnDoqbgtALiJesQhOSLwbY2il
	V+XDheNPuo3wMiJe4PBZhNHLfc75QXvVVTa3OLb3HVJ32hgevOQG0k/gZdEZQR6g
	wsd5PsAbEzTtd8MnnLUMUFqKRnQik4rB3vUKvdtiVNYVUIS8S9cDO/KH5fSEI5dp
	vkajSlHpaVc46vNUp8sZVSgpEwCH5Ut67xE6LbBSxBZkAN5w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc921k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:31:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94a158dc8so28279755ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 07:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790260262; x=1790865062; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ldpVhahcAZ5SyKKj/a7T0lAqAoDK8x+z9W+veZE/Ybg=;
        b=H3jMpEzZiQoK/uaCoNPhdi0Dy+5cCU5Uh7eeKOa1jRTpdElV1r0EuqPqXT0oTYqxan
         1hj7EefxjtCyw1x3hw0MgvTpNcrCQOyRANYVQJMhsBw8dINJVrzHKHxZbc9ipTv/UgwF
         MlO0lFfrRd9pwmC2dpPTuRXrPlpznk9EAXojH/8tiKnuhsFvir34J7N8roJLfwDCEI6q
         qlGvie6mGK9Uq/eiwWC23X4n3jFXAqAshhRoBR5E0lsWxBIZnUQXqPZr1TjPNyUafVFa
         8vd3CqAl2gRKy/XWpzV0la4+SfYUYQ+EEJnIzsr+NQzKDkfe3SLogE1gGXVePdG68mXF
         7/+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260262; x=1790865062;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ldpVhahcAZ5SyKKj/a7T0lAqAoDK8x+z9W+veZE/Ybg=;
        b=y2AgJDBG3Yt27cHRzUANiRbEUQlmXt5hreTKY35RgJatcYG8PGoI0Y4Q8pHn4qgdfT
         vzoT3b26Rs5rLIR0uBNMRqaWaspCofKnuEn/WBm2Q1oKhh49ZB4c2yQoKvr1ht+bKO9E
         YGcIaAiuKhpnXHoF7juTu9dCGrxx2x4hbyfcNP1Fj53S6vWYImdYnOl2bVUACgZNUu6J
         3bTd6NtEMU+4KsI0LxdN0X4IzbPQ6TAUclc2qkUl4nwbTlu8rUDTRPndenuxRPEqRkSi
         wUc3Azags8HG31RXy2F8PGefetu7vSHOFBshB8AiP61ON2+sYgm+so+Za3yVYCdXDOwi
         L70g==
X-Forwarded-Encrypted: i=1; AKwUvBzs3QGzZJQ9fjtZaJyX89nlS6R7yCDjIuOIZlXUTlZDrAK5YiYyMrhzUS9p5Vg0wD911SX7DX/i+WJa5tk=@vger.kernel.org
X-Gm-Message-State: AFuF++k2S/rfUNIMhTZsVZTU/07oF0BW0IYQPZfPPOwddCADYeoDLMR4
	MBRzWPEYZErxCcJv+qmChgtRgpYdjod1+/chLQ5yBgxko7WCkWjmenjwppaoH2tgDCM3spXXxFa
	gvPVgCMro7nO1VFs8Fh2899TRXOe1p7SYmUvX0QiKpSfZ8i3MTWAXrCJVB7QxAEvTuZs=
X-Gm-Gg: AYBFou25hpnPfUqSpQ7prKbVpDX/KP665B3Reu/Ime1+lqTv6vflwg1c0baIPLGPWPX
	KShIDF+UFNeR7SJdmSr3SdLZyyNmpKsqPDaUOpOLjpj5MZqhYZg2lBvwIMDMx/pt3HV0emQPsi8
	b1jYVaj2Js839kjbTE4KckuEKiY3WFRRBFcUrsqMfmFFyeX0C7hIw2hav2N7OWUzWG1+MRKOahk
	wLSrp8HXZ46HSiR52E8bfIER9vCoLtVJg55600cWguwkCin65odWXgfvKCSbs4nIyjPvH9JbHGX
	Ygx7n4VySWpBEgSrifMio3Vn+v5kFlBzyVcWbo2XUPekp0c1yWY48tZpr0X6bPDsOcohxjTwbYv
	BfE+BndDGM/xoZnJdXFOkP2nTrxjT+TAfOSlSgJn7h3aN
X-Received: by 2002:a17:903:2ac7:b0:2dd:ad74:ac7d with SMTP id d9443c01a7336-2df7e27c485mr25943685ad.24.1790260261342;
        Thu, 24 Sep 2026 07:31:01 -0700 (PDT)
X-Received: by 2002:a17:903:2ac7:b0:2dd:ad74:ac7d with SMTP id d9443c01a7336-2df7e27c485mr25943235ad.24.1790260260770;
        Thu, 24 Sep 2026 07:31:00 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3160sm28994415ad.40.2026.09.24.07.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 07:31:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 20:00:54 +0530
Subject: [PATCH] media: iris: reset AHB bridge before enabling HW mode
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAB00tWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSyMT3bKC0viM8tz8lNT4tMwK3VSTlETD5GQTE/MUAyWgpoKiVKAw2MD
 o2NpaAM/taCVgAAAA
X-Change-ID: 20260924-vpu_hwmode_fix-e4da1cc447d0
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Birk Skyum <birk.skyum@pm.me>,
        stable@vger.kernel.org, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790260256; l=2029;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=WvJzVZ93u/jnZMmTJFoA1CXtfvTl0ya7PkrEGzPonGA=;
 b=Fsx6oom71cJ122h37d6jT2FTuZCNGrBl4UQN7681bQwbDGKwbchyDpt7q2uEacGxdn2OuJ4mg
 v4qtkGa+tvNBQo1BAKCz5xaxwu39eRbgpreg9nP6oUcHU8AGu//lyfN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: nRIF49B45BBZDsNhMG9Q0GolYbGKq20N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfX046m3hEDSV9T
 nAoEc6676A+rbCt+nmXiZDFbBHRL6x9S4+VibZjR4+jnpdVaamxMgqtxZVoYpukC0SVU/DB6cYe
 Aus9BsUixH6XRQjpnu7x1PmV4nLbzg05fljWRJLnlTbA+OR0YYNHmrcCW4tG2qeUcwhVWIYsVLs
 TIhEnjwH+RBKPN4YXKHOogtOebgauqPdmxO0d6eIiMcl5VXW1RlH/V0/UDbtt6VevtnihweolP3
 pgj2HbGcf/akd7wUfwkrqay//UTL8xdO2S3HwUeHeCt0DuaESOW634uE76KWTlSPRgBkm4qeAWr
 PPi6inbYMNz4UFdF39rkqWKs69Govrp6NCyJoudtOcg6nXmdAE4Qw0Q8u/fcLVpiuIuF8iEk/5H
 ydRx7Coq7ybJCfP7UERpJrIz3jA89dRiJB7zOPrNsP2sTxlBmoClEZrdynLYRFXB6jDxBRmTC0u
 ZYpIiRsLcml2XxyL7IQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1OSBTYWx0ZWRfXx4JuOtoEnx60
 Tm2xsW4c4f4z+0Lu7tUJjv/hykasphZdDI45BdmlDQZ3TIyMfroJFMnCJvk9nw7cu8JMm5qxBnr
 D84mJpTMgMFp9jgB9rmbXB3at5O6WiQ=
X-Proofpoint-ORIG-GUID: nRIF49B45BBZDsNhMG9Q0GolYbGKq20N
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab53426 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=XKV6TwXv6a9nc5w5uhUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240059

When video power domain is switched from software-controlled mode to
hardware-controlled mode, the core may be powered down without the AHB
bridge going through the required reset sequence. This may leave the
bridge FIFO in a stale state.
Reset the CPU-to-VPU AHB bridge before switching the power domain to
hardware-controlled mode. This ensures that the bridge FIFO are in
reset state before going for mode switch.

Reported-by: Birk Skyum <birk.skyum@pm.me>
Link: https://lore.kernel.org/all/20260913194707.91885-1-birk.skyum@pm.me
Fixes: 95a337f92f0a ("media: iris: switch to hardware mode after firmware boot")
Cc: stable@vger.kernel.org
Co-developed-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Renjiang Han <renjiang.han@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
This is tested on X1E80100, and is applicable to all VPUs.
---
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c1077097160cfc8324e807b4aabd9747812..2ef8004e976e34ac3e5ad1971894253fee77648d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -311,6 +311,11 @@ int iris_vpu_power_on_hw(struct iris_core *core)
 
 int iris_vpu_set_hwmode(struct iris_core *core)
 {
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE,
+	       core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+
 	return dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], true);
 }
 

---
base-commit: 3d7783543c2646af69ad65825e810060494bea21
change-id: 20260924-vpu_hwmode_fix-e4da1cc447d0

Best regards,
-- 
Vikash Garodia <vikash.garodia@oss.qualcomm.com>

