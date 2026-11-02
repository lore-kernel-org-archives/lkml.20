Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793590522;
	b=wz0AeS5jhI3zLb9xfjWToSwFtBYL48enwz6mqnNqFXYPzJZKBaMvXfrBMcSGu7XolPLG
	 ibryx6v58IH60lKrUj2hO2ikr28MK/AxpnBPDIqbZ25/wI6QhcP0FnkAiNJkYTILtIO8g
	 USc/DPq6vwEUfMRqTr18TXF/qb2v7SPq2O34qBQrEZJlurtvyeH0Pbwvo4VGGk+aV9D6O
	 8jY5CqIUmJShqSAdIPvV/qyoe/bmN5t2Vr80UNmr3TXcHC/dNNOmvjzHsAYEtMMA5eyzC
	 AlVbw2pByX9bYxMRWzyZTfIHdTcuN8vhFHu/F+XKz32dJegf8aXIRo7HA7LfihXppdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793590522;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=s3hI9BgmMRPRT1boyeOjqhVUTHNSNjJIFs8Zzs06pn0=;
	b=1O36mNwnC9vec7ajYQgx6WoNPkO4RJ5RBrkZZKPy+H4E/Dd4A8bwsJi4B4ignwA97Fw7
	 AuOoaN8M+b88TS6ONnDOL+WyNZY3ottZ1zGCRphoZgr6GYYuyJ50rGn3UCSOlD1ZZWKPI
	 qyTLLM8N/X4inkW6v1qyJWgQNjZfJrWKl73aEoouiisNaGKlvpYLl4FJdwLCYK9rvlBjP
	 8w+vN2JZay5s4gLEzsy6RtjpKd5n/GY/pw48HLZNJGggGXcOW15C96PseCfp2PcL9ftmM
	 cFW3ugfMUgy16RoaG8F7lN/IexZrDOmtwibHN+v0e2X4jmOj593ddgzLI7RMBS6/ZNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="c/m2qyn5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScbVIZMS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48174606A335
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48174606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c/m2qyn5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScbVIZMS
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A20KCIB3310327
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 03:35:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s3hI9BgmMRPRT1boyeOjqh
	VUTHNSNjJIFs8Zzs06pn0=; b=c/m2qyn5vMQezhjmTm77x7IJhbrc9Cm0TGZNpS
	PoHFf51Q3AFeifq02peLVuFl+F9PS0Qz11H9IeHzHGPoCv/FHwH/rclsmXfLg31q
	QIpVc6ksqBWADSiSvRnn7+99nGECDfPcxQC05zcWgQruhaxza6qIDTg/qrdhLlnW
	lAIL/eF8KTfE7qi5fOMIr6vg3iAv2eUItTHIUrJbEumIBnsiTjS646gk8KK2ObdA
	QCGS70nK2EdC0JUOCgMWOWb8jxxNtSxSGKQymHQ9et0KtXO4uBg9d++TKBXtzluq
	FEaT0lgNWFbnCzzKik1YrC7E1Vy9JOhwBeG9IVZD4E/s/hlQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn79rw44g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:35:20 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so29269275ad.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 19:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793590520; x=1794195320; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s3hI9BgmMRPRT1boyeOjqhVUTHNSNjJIFs8Zzs06pn0=;
        b=ScbVIZMS6GOuMwzP1tPrD3rKNCk1z00RbrrorEAcTJwdBexnT3fJL7ZEmE/kRGksTN
         +HpAMvszQoh7Ml7i3vMYmU2BDplCD532wuSmtu2rYFYgx99AEybu0BlL/DtxA5lVxRlf
         XjjrX9H9LOGGRs3VuvzTp8LrB31bFp/V8D0tc9MazgW18LAzXPMmeEQ+kGFmHo5v2Ikl
         BKaE0+Bu8JJ8UvxvBMsA9bb7pwh+9gcQuy5zwPikl3eUEogJ4lcpnzr01sI8Kh07qisx
         c5zXy90oiBN6/rc9revZp/OHOlC4u4W1ROCYwB7vpTCTE2H621tn3voEwqFq5RXEvqjh
         txqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793590520; x=1794195320;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s3hI9BgmMRPRT1boyeOjqhVUTHNSNjJIFs8Zzs06pn0=;
        b=j0Nk0cKikwrirnhj5HEUqxXJD6q0DT2w7XYPe6T99eOH0PhOIij0Yn8jB/BG2ZGqYo
         GLwD7CcBFzttvyNCuBZNUUECAZS/MhJAnQNDcIxDENeXZeXpRkuaS/JUn8CCPKqg9TkA
         BzrZOAVkEcoPTJ5yqKTUZNvxIe3MqOzljbf+9ji9JXqwIDnrBhBjvkpne0gF+Q4D6V9g
         8ZiaoKy4uBaNn52osTHneZlbyQvXK0K1Na8Xi4iYtzwYlyqSiJTplCNFCnuWpSEEM7dW
         HO2940wldBGeGud0NxWPo22uqADfqFWpih5gLWimloFgmlEQqsx/7FoY/cMAs8jRvBig
         sY5w==
X-Forwarded-Encrypted: i=1; AKwUvBy0/Qn5L6vMsntO5MdGQBCfD//QquMxI7vjhNJuvVBYA1TAdTgjAz+r34SqauMZ/1MSRvhhNyo/eX8o3Jw=@vger.kernel.org
X-Gm-Message-State: APuU4Z8k6/3sP/7mxtYN36ceD8dXQ5h7SOnpvpXo0AZ9mh1vrT2Sv6CR
	e2dHqSD3EPFy084mOwFhjpYMYK2Z5WKqmwdEtxaIP0r3ym9Hxgi5f5zWbiRFoZJLMwRFlTK9jTQ
	HRNwpTmmij4go4Q8SpkrR0MjlN+dfigv1BhEfcWvWaooyHKhhOX5n+QtT1noWLTg68h4=
X-Gm-Gg: AYBFou2lO9WOM3rl3JKtKJp2dJSnvY8OUtEHXyRsO2cezbAQMhKsvGYUAe1VBVNhbWO
	KwHeS84nO39lny05c0D+GXu2nS6DuZFPQ9VrnBeh8UxJe5ATHswdkoULjnqP8hiQFy8DsphVfjx
	mILBp4A7zw7ZbAJnNs/V4oHyLxFnA0YIlGwGvPYtAr7VAJl3Kyobsf84uVpvm4XKRbfjIg4b5dF
	XYphEmxr5HIv9gGPSfcvLfoki68trz7Bspx1idiYRyNZyXBKWTBDQrJgdeda5ZSyE70tpvG8ILg
	h5FcYFvX8mWXnvJBhh8LcqzjbnL4pDkKNy76HUoR8puopTNlIgbIsdLMeovur0R6pa7MTkVPZNY
	NOGCSrm1y7Z8MXhyo9/XatR8qduF3IjZnFbMIXL2l5UmeTxewsbkWgDd1jFaU4eO7EZCBizaQqh
	3qR2Cp0Y+NAg==
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ae89750f64mr5670490a91.28.1793590519582;
        Sun, 01 Nov 2026 19:35:19 -0800 (PST)
X-Received: by 2002:a17:90b:3944:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3ae89750f64mr5670480a91.28.1793590519104;
        Sun, 01 Nov 2026 19:35:19 -0800 (PST)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e949077sm16518459a91.9.2026.11.01.19.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 19:35:18 -0800 (PST)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 09:05:12 +0530
Subject: [PATCH v2] soc: qcom: qcom_stats: Add support for NSP subsystem
 stats
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
Message-Id: <20261102-nord_stats-v2-1-0f690148e7c9@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO8E6GoC/02N0QqCMBiFX0X+6ybbbGZd9R4hMd1fLnKr/VMK8
 d2bRtDNgQ/O+c4EhMEiwSGbIOBoyXqXQG4yaDvtrsisSQySy5Lv+Y45H8yZoo7EUIuyMFwqsy0
 gDR4BL/a1yk71l2lobtjGxbA0OkvRh/f6Noql9xNX/+JRMMG0Uto0vCpMqY6eKH8O+t76vs9TQ
 D3P8wdej7t/vQAAAA==
X-Change-ID: 20260907-nord_stats-ea163d025d43
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793590516; l=1565;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=EP4kQLlv2vwvwZdXnPvyaRHo10aAXL2YYWFP0/VZTHs=;
 b=qBl2BmGMwmTcJJacNIt+6fdKNvf7HAVaP5hEqInnrCiDLiFflYbS5uNwEvHtlrDRszO6cJ02p
 14t+8OdfGwPCglZmAul3ol2aH5zMsBQQKy454nTLIBINkoWramLoJ8Z
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-ORIG-GUID: F8jlpiLYJx17OOUAE9aL-mQLcsuE2Kp0
X-Authority-Analysis: v=2.4 cv=Wtq+otfv c=1 sm=1 tr=0 ts=6ae804f8 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=JoL_3e-GhyZJABErYZ4A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAxNCBTYWx0ZWRfXy4Y6GXkdEfXe
 or8SmrkqAUpMf/Ytejesh8aksCZ0PfxhRCFWoDiaK3MRMvEUuUuhPdH6O6Z4bNnAzTekU392a7A
 YepJE6P6r7uW+6/2K31669qHoTfE2KM=
X-Proofpoint-GUID: F8jlpiLYJx17OOUAE9aL-mQLcsuE2Kp0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAxNCBTYWx0ZWRfX8VdMS1OPb/mh
 xosvZRZE9JGDfXtUgVQUmNWixjdD4ui4mFQ7Rk3SBzQOuCUu9+LDxxf9Le4LOy/oyYEO+j8PeQs
 tGsOu/OW8mgezD98m7KTOCvYEUXz6+sXeEHQhWPpaCTheF+0go9qfUkCZ+J+L+zIgLSgL2pF+8v
 ziR/PkE4T1owen+lTiHR49Acwo0ds8+lyACXNpyXoZdTEJBvdgiwWYKUi8NFfILPP6z6WXtQck8
 NaykRArXWgkRXzsBE0UNaB2/AU6iI4zMlayXK/2Ywl/+k18uZ4qzx5KTgCdIS8mNL0Nc1Kzi86t
 I4MA+7uX7iF74d3vTQRKFsDnNmgCLckmuMCkDcs8EjgiY12D6lDuA7IXK3dtQYi7kn/tuTPgkQH
 1Ilu4TXxa32RgBqKhCFj+Mr2TNJ6b4PFvUcpN1edVXkTJ8/OuRKCjjHgishV26+0dxcGyt9cnNy
 7crXCh/OEFBxOuVOyVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020014

Add SMEM items for four NSP subsystems stats which are present in Nord
SoC. Rename CDSP stats as CDSP_NSP as both use same PID and SMEM item
id. Add new entries for NSP1/2/3.

Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
Changes in v2:
- Add comments for the cdsp/cdsp_nsp instances with further details.
- These comments explain on the naming of those instances.
- Link to v1: https://patch.msgid.link/20260908-nord_stats-v1-1-a55adb083d65@oss.qualcomm.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/soc/qcom/qcom_stats.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_stats.c b/drivers/soc/qcom/qcom_stats.c
index 06923408bfce..2ff0123a7804 100644
--- a/drivers/soc/qcom/qcom_stats.c
+++ b/drivers/soc/qcom/qcom_stats.c
@@ -43,8 +43,11 @@ static const struct subsystem_data subsystems[] = {
 	{ "modem", 605, 1 },
 	{ "wpss", 605, 13 },
 	{ "adsp", 606, 2 },
-	{ "cdsp", 607, 5 },
+	{ "cdsp_nsp", 607, 5 },
 	{ "cdsp1", 607, 12 },
+	{ "cdsp_nsp_1", 607, 69 },  /* newer SoCs (Nord) use a different PID for cdsp1 */
+	{ "cdsp_nsp_2", 607, 133 },
+	{ "cdsp_nsp_3", 607, 197 },
 	{ "gpdsp0", 607, 17 },
 	{ "gpdsp1", 607, 18 },
 	{ "soccp", 607, 19 },

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-nord_stats-ea163d025d43

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>

