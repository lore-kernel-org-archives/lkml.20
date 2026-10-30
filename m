Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793341984;
	b=3MRuTCXhZNi9QnWpDPte8kf8QQpmq+JZnoD3RnPmBDqu0tuvXr+GuAAq5V0UesmffHx8
	 QrPhtXOvuMS8dfxSAMUk0/xXdEEJ/Z8N7IhO08qbJynFqP8+urjlTNdpGFyPOIn6ImL15
	 AvKNALvk+xTiOrfwTJFgHW59NlQcM804mN2InbyLDkiNpJEPE2eplT5EoEq4HxeDkfhTE
	 ZrWsjoPqST4drxNf7QoIWMvvKB95clV+kuualucwbJvxnOlouq8w27wCm3F7mB6KzT21y
	 k86v5WOpH/MxqGYMVPwiRkB6x6QbmgFW1SLzuAMVKbdgG9DRajF+dUiZcnFqgnug3iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341984;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
	b=Rhf0NuueayfsmbtpWgCukhff/j1Uc0V3mDIq5H2IbI7kuXK9Nd7fSNawJu3H38YTkYrU
	 F2FsksS+CKCLbXDfEqi2qpZLWRK4A0ljopBuEVDxbiHxqyCim/dN8B8OJj8DdzGGrlfsk
	 PASXBNxAG3lGRdMPvQSgTOqgSc2MfblbNb+KOvuf6puugbpCK4mM3pOGLjrrhtjQE8dzo
	 6xcKK6IytIL50KYYiUKORJ0DecsoShLwkd5A/U8unMlIjf/l8BUMsqG14ILvIjbNT5WeX
	 1/mXG5r/DhU/nqm+rpszmBJNj95TSkDfVoFLdLxdwIdCY3j1D+vbatkwVcu1Wj5alMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1RSRK4F;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LJxcEwIl;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A954606A333
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A954606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X1RSRK4F;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LJxcEwIl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U5F9JH2913277
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=; b=X1RSRK4FwC44esVO
	cI1sZomGs9qQNMZKll3WgSNzBz76KhKiPOTNX8Cd92JSF5Owy7yQcCoCE9xFitMg
	lYK784RruJd41RvhruFL+CWPmJz9ETLflH20iyd5NqhJZRWtAvts6t8MgSKccvx+
	RdlN13cqPuUod8sz84xaCWSQyC+5z33l6uJmAzXy+U/fsjtQY484DPw1Ua3KJyGO
	MMqMsiZ3Eir+MFgJWZDH10yl42lFPdaFD61cXqXIUM04uxm/pyq31qr+oQLcuWq+
	REd+9RJ5DMAF37sM5AaaewgTz0CWaUttXXK5kpoqPJBodUnGlZXM31kd/N7tDAWF
	G9A5qQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qsj47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:33:02 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3552883bd19so1895803eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793341981; x=1793946781; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=LJxcEwIl9hNEzwx2sSHp1VmZWtNgC1rkPk0nfoVXAbpOjKHXL11hHFvIFnAhCUTa6V
         h4RZzmiA64lQEfqg99bsV2Jc/bJTh6lGtvqBRUjD2z7zYelEgmlBfXGdp4FcJOY1YS8P
         rhfc+3UGhdvbkVmezGRWn++DOoT9Dns2QHbfGm0pPv8RYP5A3KHJfvW6agmGM2qVPQjA
         kCiHR1IzNwbyJILopNE5giwsYt3m7tOBwaX5JViItbPMsPvxP2SMzZNmx8DqMDNzs0zP
         QVZ4JusMhlb7LTtousmzeUt72Q6CCuN1RttdOHBZpgCFZkfl/i7GcVvXlamWXg7RPyU8
         ST9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341981; x=1793946781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=08F1GqUFwGIBOOBo/9Z4tQQ8HgmY+1sS+9lXssEH9kmYXdxovCBTkgAq96HRMQjq54
         3VKo6Ms/YcbxEZB1PnTHM1xox7k/01GHavk5gJeNJtBEOxpOkY1A3Kl0lM6CxYotB8Kg
         qVV6kZ7vqXmQ18WQnDdguZidFKOHuEmldJx4a8xmssP3p14dLdP3dXNSqT1JEQIPKooG
         lWago3ZVfz/FEX+VmJ2a9G6JZvoXXn5S7DyhsNA7qmjvbVRewBZfvHr1a2YtVTjf4vdn
         xY/ZBRDett5V+nR8gyjghVjSXzZ3Em+VVnTlUnoG2X3UoqK+uWcIfU2F5btJ+qCarKTs
         kU/A==
X-Forwarded-Encrypted: i=1; AKwUvBymke3Hn44/HnVKCegbwidwlwfCkHCB5s9dKlDrQQI++4d/LSL9vqyK9tueAGUHv5BYHdBdSL6RVU84dPE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIF4CzK31FzPLSYtSigoFv/Yg6yAafbY3NNINLWjCsyro4g4UCb
	TRi9V30AZBgs3kvjMtPHz6X21aZhtP9W5A8fdHsWm+C5D2p2nTmVkRtOkFVdKVkBEQ0SyKFa53s
	+aJ77IrzZWf845Fag9O/Tg+Px//MOWzmwQraO7vdIvwG8dMwCNSvfNvUZUI06mghG8+k=
X-Gm-Gg: AYBFou0NgPYTSBUp8l2EVo37DfIoiNDvAW9G1Z94Ansik/acgtzt/KJHZNJhC40XSWT
	fudmEY+i0P8Gklc3yyqHrnWnkpX1vojKGm6VZiO+VNdZlbWFtKS1p+hY9Qrn4HE4gJuiDeoLQCs
	9w8MjHuBnRX3gv9qt3EcoMBPcrNS1yY9FfmcUGMi3MWUVrLNQ/oNEd3DqIXE/5QyzJTZkUTYBn/
	aD2H7K06qojJn0Lnrz173UK7NQBdzdfFkUvuUJwaRLk+gScpvIoKB4kHBSYbOHdcjzeBG+OuCGW
	RlDBTJBhkrmLIiibrgBTTdiy3qgyBO4ntZ2kjzPqbeVi/QHRJwqkMLu3ds/QHE66YYwtV+/Kjn3
	95jzxwZdqWgSDoKgi1nAOioBHBHfL8PIKNt9BTWsibfqF/hPhQSFDpHy9gLVkiw9CNEK+15D9rl
	rW8gmd
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr2427653eec.28.1793341981373;
        Thu, 29 Oct 2026 23:33:01 -0700 (PDT)
X-Received: by 2002:a05:693c:895c:10b0:369:f05d:6c5c with SMTP id 5a478bee46e88-36a4240f66emr2427618eec.28.1793341980697;
        Thu, 29 Oct 2026 23:33:00 -0700 (PDT)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm4903419eec.15.2026.10.29.23.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 23:33:00 -0700 (PDT)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 12:02:38 +0530
Subject: [PATCH v3 1/2] media: uapi: v4l2-controls: Add control base for
 Qualcomm iris driver
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
Message-Id: <20261030-b4-add_sc7280_mbr-v3-1-8fadcc873953@oss.qualcomm.com>
References: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
In-Reply-To: <20261030-b4-add_sc7280_mbr-v3-0-8fadcc873953@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793341973; l=1121;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=yr22iLCXb30gmSFU65q7mnwky8PcLxD0pxfBcfk6+ok=;
 b=3Cq5D7cJ90leSeixqEjiCRDW3dXpjf8O/0NYHoXUdDai8UnyvfQVDa+WqTCERAtY2C3v0qq9n
 wh29bYYuZgNBlCq082oEhKARfhuZsf5WDbX5tr93BT0dNQJt+GAjSph
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-GUID: YktaBnKyXOjczGht1kztDgN7PX3_pRUY
X-Proofpoint-ORIG-GUID: YktaBnKyXOjczGht1kztDgN7PX3_pRUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX/NcqSHTIGUy+
 PWMjPGcAET8iSwQU4AsQo7u10DOKhSCbYf6dMielz7AbZZoUqne5F+y1pSz/9ZCZsC8NjovfMkS
 3z/Krai9zXrPEUJARg/zYhTeKkME28aqamVUEkfm2igOdrZ948EZVJhG0L2HksT9qk0gntItPkL
 sNCHZlzd0lJ5OmL8AetxanegDb1tT/aa875fPB16gXKFVpPG++xN44qIOHPjxXFVLnapb1hJG2X
 4QTFX3Y1tGGPEsnX6pjXf3eqN7y0bXP1iHME+Wo4dymQuKHu9XhWLTifElqPXurHrlf/jONdpI5
 kTk6x/TL1AXRg3mYwW/IoAow9kc9+8iRNNjF4bRiMR9mrUH1xkuCi2XZhFizOiH0a9SBghRJ8aG
 Kmh8Hfir3KWilgCQ1XnoK2Ok3fWz9RkJTClhDctDWRheUnLlZH9fIeXVt17PNpOuRYbwGrYUIkW
 3pm9Ms/xU181M3ZGn1w==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae43a1e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=inWu9NajWAUUfZ5We6AA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAyNSBTYWx0ZWRfX75ENh6V8ezad
 MRylz3bfgai7pW88xtI6+kB/yF+xkK1nWIZtzaIay5T2DEcisMWssxdx3Z7OWMqYiU+TlV1Q1CB
 GtmuYwYO6OKXS/HEr4PeVDg1v/HtIL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300025

Add a control base for Qualcomm iris driver-specific controls and
reserve 64 controls for it.

This range will be used for encoder features exposed by the iris
firmware that have no equivalent in the generic V4L2 control set,
starting with the MBR (Maximum Bit Rate) rate-control mode.

Signed-off-by: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
---
 include/uapi/linux/v4l2-controls.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index d17e41d51d2e..ed2e2ef42829 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -255,6 +255,12 @@ enum v4l2_colorfx {
  */
 #define V4L2_CID_USER_IT6625_BASE		(V4L2_CID_USER_BASE + 0x1250)
 
+/*
+ * The base for the Qualcomm iris driver controls.
+ * We reserve 64 controls for this driver.
+ */
+#define V4L2_CID_USER_QCOM_IRIS_BASE		(V4L2_CID_USER_BASE + 0x1260)
+
 /* MPEG-class control IDs */
 /* The MPEG controls are applicable to all codec controls
  * and the 'MPEG' part of the define is historical */

-- 
2.34.1

