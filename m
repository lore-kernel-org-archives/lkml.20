Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341979;
	b=uIp4AyGntIySoXMI1jDuy2f14LJT3XHD/VFJcq9MoOl0wGRMzNJsroGD0jWkVY/Mgq6X
	 TbMzVohdhmRYGUHgnWA9mX5eq5qZN354NPeV98Ngyw2UqoBrYlEPeheyIDJaNBuswATff
	 q7h75CKdkO78+td7yOuyLa2XWOoZ7iCVoUCSAFHcnbOhWDNcnF0KxijxZs4T6BYwMTv7I
	 DuhvrPcWdhvvdnHJwchlTWxOfbbhcROFPvs5FtbuV0lUEDEEQaf+9nfYVVWX9x0pjifmj
	 N5Cn6zi93KGE4irwf5mecG5B65PjLrNQydk880KWU5tVwiaAMLqJhgCV3BXEZmpchFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341979;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=beTUv6ZC0r4hmBh8uJ0k1FYHfA/4l5fpP/vwiQFYCVU=;
	b=f2TZBDhRoTHsHATWFxEPE5num0W768BfKJtiL++IPNCKuFS9/PpDtzcp9sWRJtpy7BCO
	 qNVSmmvBTBP2chq9e6ID3vFkFzS31u82xUClsidEyGE3OrTxuD3XrYpjiRDLJLEOVWr/d
	 mvQuiNOUJHX35wpKXI9m+3k5mvmvlyqJRhEgJ945+sS2sVcZq7ZAp8YJSQOuwjaHxSezh
	 wXXBbjt0TgJuXfELN6I/dN4vfAHz7D9ExMei6bEkMIJvuqHPuHNMSIyWt7bjzZNEz9Cg7
	 jU3irG5Ms1bgh50DrHByS//5p/LjdWvq5cYcMq651xPXo3NkJNLsmuSfWbTT0uWmnAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pUwx2Q1g;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SyBetCcG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C2F606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:32:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46C2F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pUwx2Q1g;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SyBetCcG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F2OR1738730
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=beTUv6ZC0r4hmBh8uJ0k1F
	YHfA/4l5fpP/vwiQFYCVU=; b=pUwx2Q1gKlOJNLIbDstDUHE4Dr5wqQYakiw+Ub
	f6g707vM0ePbXU88XAFcJhZz1NKAUtf3hAU9kadAJzAgaMzX6T5ykusQTJrrVIO7
	xbii1nyHNPX6jZANFStM4jNPhV1TiPMC0Xfurbp9BoJa6ymTQgdSP5KjPqGeZI7m
	uMmtyNjXGo6ZzU6nMQrJiZugxRATpINwD05yc6XwJgUBkTH7P4/KpA1KmbKz7fKg
	zh+rdAMj1/EA+895ZMDWd8UYFCB2ZyuOFkDiHWjZtHBEb2XIwjeJ6LDCHnPITq2n
	5QJuGkFYLB88qL5vZW27ccEzi8RshIf9aObZi72DrOI6AvNQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhhyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:32:58 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a223755e4so1915445eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341978; x=1793946778; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=beTUv6ZC0r4hmBh8uJ0k1FYHfA/4l5fpP/vwiQFYCVU=;
        b=SyBetCcG3zDR5Nsb3bNev4SWxdOn/JAbSrNKfVMo6KO5YNwbAVADnpyJ/6Kusi5QWt
         YdcQ+WoHh07qcPQc87UYXgncliRxDcOUml20ciIMzzdx58XYsKGDfJnwwvx4I5GEi79A
         I2hkA0Co8JYG2KTtzCkvM0X/3P1XsFE42doWSojNZA8N2n99wkPyD1Q+j2h1SABIE/MH
         2d6kn0XvvJtbiH2A2GiaqQ1MJTAlQEMs0zHpsmWcgG1AsZZ8gUsR8SEjgXJDEtPYUUJJ
         RnD+wMIOuvX/S5yRiYKxxS3dXrnOwkwfmkndvTvvp3HBUYU72heAWC1dEQZsUxjhF0dO
         +G7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341978; x=1793946778;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=beTUv6ZC0r4hmBh8uJ0k1FYHfA/4l5fpP/vwiQFYCVU=;
        b=e/lhxW1qeMVq3xxdJqv/RjftUiaNd8aCJhjX+idsXBhnK0xKsP5iQ921U3lMHCOdTI
         /wolsSHJURrhLehs2wtmBqxWSk6yYO+8vtrTGvzXSeqL6bx0uE25vP3+TWl9EblJv6PE
         g4BuDrt0I3pJYQAWhFyhOinlGEhlDRq2OxtaNaS65fPJxMf2OIaImcrfRIVkZOOySiA5
         cRxtCjPy74V0dtbh+RCdJWgglTw1tGa1VO11yrvhS0BZGeeiAIGNCKQQkV/kiNSOdKLo
         dv+mdIw1tIFy1FF/wy0R59pDRf/YvYulBdZ88PzQoMVAbCO7IEdLZZrE6lO3IlI3awqZ
         FS6Q==
X-Forwarded-Encrypted: i=1; AKwUvByacijvBBuUkjOcoQM/XtmHtarpOg0LdIbLPqlCY+TfA31SVVtc0yjBKHRNlLoDx8WkPv+jK59Giu5+3Qw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLjsGGvEw1tOptGe6gpGDkRnmVggHniyOCRWGFeAnYJLjfS755
	7WmP3Ea0phEgZ30+m6QmXwRZYRBgVU4xb1Fpg+P0Us0WQJrbTHtlvb3F6GNxn6jyTMuK+VetJvS
	UmfpEpdF2ZwkUhpuO454SRk0JBjKeeKGmzNvaOG9Cak8Kw1PgclA3lyP0MCMb9HckSAU=
X-Gm-Gg: AYBFou0xMeO70/+NS3naMWkD/+Kwzium1NAJLkROafRKW0b0giz326M2+PKJXD5x8Zf
	WsysItcAH12LSa0odvClmfg0Do90FoJd3ZKpdpIngmAFUbOgTOADhAmo5nDEcp0I0AbFDQ3gIl8
	gIexP/LC94L6UuCoIQlLY4p7jURa1fLUlYOOuHvbJ8ShVfOYAjYkgVNhXJfCgGUJJJH7kY57mWQ
	K7JUw1yDX5YDGTkeoMlQid9cfOK6ne2376HTzPNCbTZV6QTj15vHkAZ7d9ofbYSRYw453QmEd/o
	6iCLeME8K2y6Ma6VEqaEyN/ruMl+63sD+TDZXuueVOepgtY6X0TOX6LDNCjJcGbrzpi6pZ0UDAX
	TAidqoM8fpAi8IaW/xvJvIoMo9uTbh8oaAzBAghx4iA5PZaNd1Man8f2FduX55U+75P6tEmooJL
	sLSANz
X-Received: by 2002:a05:693c:65cb:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-36a423b3f59mr2005624eec.25.1793341977436;
        Thu, 29 Oct 2026 23:32:57 -0700 (PDT)
X-Received: by 2002:a05:693c:65cb:b0:35c:8abb:b4ae with SMTP id 5a478bee46e88-36a423b3f59mr2005588eec.25.1793341976843;
        Thu, 29 Oct 2026 23:32:56 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm4903419eec.15.2026.10.29.23.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:32:56 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Subject: [PATCH v3 0/2] add MBR type rate control for encoder
Date: Fri, 30 Oct 2026 12:02:37 +0530
Message-Id: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAAY65GoC/22NQQ6CMBREr0L+2pL2Iy2w8h6GkFKKNBGq/Uo0p
 He34tbNJG+SebMB2eAsQZNtEOzqyPklQXHIwEx6uVjmhsSAHCVHgaw/Mj0MHRmFFe/mPrCyVtp
 IUfZ1ISDtbsGO7rU7z23iydHDh/d+seK3/dkU8j+2FZlgGnUlR1nwsVQnT5Tfn/pq/DznKaCNM
 X4A/Ki5d7kAAAA=
X-Change-ID: 20260212-b4-add_sc7280_mbr-597ac615b931
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341973; l=2218;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=tnGE1jsNNcOs2BMpFfCevOPApRPSWJ8iWdCJqnyxXsQ=;
 b=g9d5DaR31byDvnJQ/a3n2/zYmHdc/K891oMJgv4bl51jmiTtQ/mAzfUjnulQYBmhusdLvUc5u
 pVKYzDRgSWkAM+Q5aXbRzD9kKm6sPYTU3l8b01dfze2ZzngGgzmYfhw
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX1cMZZ8Gxet5e
 60WAkgIx6l4rVkAvpap824kScfIRdXWRsHe1QJBEpd7LQ63KCaFAoRBnpBx+d4b98rC5G1bQvR0
 hX0RAHdqD98zYu6b3uaBbX/wKxWDR/xByZCqfimqmSrUJsZbvVKwH7QBRaZyq+zglX+i4y3v3fz
 nnLt6NycfNNrIEe0AgcTg6ukHaSAnDfuRzLprcydUdzU6V4peLnfIFIQ5BX5HB9minKPsKoHPJ9
 r8Ti2TQXq4pZC5Lu5FQQdAdSjHfK/pP6kcXpGjFPhkkemM6v6zAGMbBqJwLc10lJdj8sDT8e+FW
 GxIeTyTaGIZ96tQ83ikxU10qBYLEQyfXfawz248ZX0jtQ7ADX26JOoi3kqx824TXH7rAtUBATjT
 wRwYk9n78csYzZcQcjikA6MXQlO/ct2OEeoVi/EYCW4hr8dtPfymh6SYUuQlAJRHhMxXLdEGIKv
 mkPuQYv1kl/id7UIg5w==
X-Proofpoint-GUID: yQw3nxGl-moF5nsfmFqwdw_L4J3fNHwU
X-Proofpoint-ORIG-GUID: yQw3nxGl-moF5nsfmFqwdw_L4J3fNHwU
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae43a1a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ptQNJT_TkX00A5QJh-kA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX9kGvhLBa7G7S
 ge+Qz9gJTbCUiPgggXJxW5OezwmOyVIWBrsbXiHrGUGvlcW4IeDwIFzwnyOrzKWASwdFZv7ZTEA
 u95f+oeVkIUTz+TIAxMTfbV4eusTNIQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

This patch adds support for the MBR rate-control mode in the Iris driver.

Changes in v3:
- Split into two patches: add V4L2_CID_USER_QCOM_IRIS_BASE to
  v4l2-controls.h (patch 1), and base V4L2_CID_QCOM_MBR_RATE_CONTROL
  on it (patch 2).
- Reserve 64 controls for the iris control base instead of 16, to
  leave room for future iris encoder controls.
- Link to v2: https://lore.kernel.org/r/20260720-b4-add_sc7280_mbr-v2-1-a2a86f630f57@oss.qualcomm.com

Changes in v2:
- Per upstream review feedback, convert MBR enablement from the
  generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR menu value to a new
  Qualcomm IRIS vendor-specific boolean control,
  V4L2_CID_QCOM_MBR_RATE_CONTROL.
- Drop the now-unneeded generic V4L2_MPEG_VIDEO_BITRATE_MODE_MBR
  enum, its "Maximum Bitrate" menu string, and its documentation
  (previously sent as a separate patch 1/2).
- Drop the separate inst_fw_cap_sc7280_enc[] table (a near-complete
  duplicate of inst_fw_cap_sm8250_enc[]); sc7280 now reuses the
  shared encoder cap table and layers in only the MBR-specific cap
  entry via the new mbr_rc_supported flag.
- Link to v1: https://lore.kernel.org/linux-media/20260213-b4-add_sc7280_mbr-v1-0-e8d95b4e4809@oss.qualcomm.com/

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
Sachin Kumar Garg (2):
      media: uapi: v4l2-controls: Add control base for Qualcomm iris driver
      media: iris: add new rate control type MBR for encoder

 drivers/media/platform/qcom/iris/iris_ctrls.c      | 101 +++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_ctrls.h      |   4 +
 .../platform/qcom/iris/iris_hfi_gen1_command.c     |   1 +
 .../platform/qcom/iris/iris_hfi_gen1_defines.h     |   1 +
 .../platform/qcom/iris/iris_hfi_gen2_defines.h     |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  |   1 +
 include/uapi/linux/v4l2-controls.h                 |   6 ++
 8 files changed, 100 insertions(+), 17 deletions(-)
---
base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
change-id: 20260212-b4-add_sc7280_mbr-597ac615b931

Best regards,
-- 
Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>

