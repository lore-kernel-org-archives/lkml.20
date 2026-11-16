Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794848763;
	b=S6omf+eNnbsN9zW62cJAeJd0vOXGR+zWPu28F+gU9kT9WjiaMnznWp69ZrAiJyTBkXmv
	 xDQrWDFhIV3JHN1YPfvGVNewmolsSNlC3bUwAhF3DzM8WLcuwbH5dT8ZaCY9DBMQ2k1dn
	 DBLbSnjsVviubVw6fjVSKBue1/D8VseteIPCDnAdVcxs3sHLbN0hfHViOp+ErJJFFmHY5
	 iSDcZR2Jx9gjY27lckY7AA78JRsSz1kEBLn6I/+nwOr/4pZwJb+FQDO/l8ryro5tYXyqr
	 ZCJXVxxFWmUPiPRq107x4pyHfiR2NkvasVuSx5LL6CSWnTC3Y09FYoZXh4SKJOjy4ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794848763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
	b=newK9ZWFCgFvA/AmGXCufU3v/TDQ9IuXs87p46Of0dRzvLOl829pJXyja0mOChKoKOQr
	 psmFQNhSReD4uL6Jl8rKcTynjuci/qyXuGYLAr9O25P7eDfYJ8vxJxg/nFbki8hZVpyot
	 tE5hXmUtcKpcUevGOn25KIqncsZJIILkUKw3TzvciO0RqlfuRagfUdwGc1C1mfdZ6BNDp
	 jv/44T7pbqpckU1EuGwDKKi9b0zvZCcOJKK9U6AldgBKhigqhJioEdSFepm61mY156fCj
	 CEdP3LKxgRqJjSLj2CY2oQWXmfinZJiUEvKNtHP3i/3HIKt0PjblQj9i4f0hN14xfMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VtOKsDcu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1j5AvC;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE69606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CE69606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VtOKsDcu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ao1j5AvC
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGGIDmh2264138
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=; b=VtOKsDcujsErv8Qq
	quoVGzJGfN7UnZq+ETy1SdDrNjoCzDsMu0o9AGakqqfAq2/IITlr+NNczdcJtiuL
	KbIrPLDEoM2ljJGXV20HCBXAgWIftFbr8t3AA13kfgUrHND5aoMcKd7jJHA8pTB0
	rkP6gAkDkui9pqGPi0YpIA02s8JQomDfym/537QNFI0Wogr67JkAwH0e741UoPun
	TuDJoX1rzIPcfMqs93EJaeNjZTmteEnG3z3Z/uPG0SB/MRtJyCkS4kz29xhHRRZD
	6Up3pqwegD99NqV5bEP4Pux5Fm26JGb3PXXl8Z5GHBZ2zdw01E/E/XmZqmQ78UCz
	Lekdkg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyrmc37s8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 17:06:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea0fe07201so23684815ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 09:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794848761; x=1795453561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=ao1j5AvCJzN8kgsZFGlGjAuc2oDizawReYiYFSi7id3yx0H0kb2aDw7rIeZ1ghsqZp
         /306bZIzBGRi9z6+xyvWulP/vAWRyQc1Eftjtkb+vEPQs3CU2k1YyoG7KR+KwFhoPjU0
         jSCcrKy2t1DNDCC17XLpRCHJ9VtaKJkSfp3aNA+4k5kqw/879zap34eQqItZAGw8nzPf
         8BnJ3BaC0VapI+xuDK0mQbrZS7SJpXDoPuHoSUJE4lDfJfTjc5dR5SuWOtPu+oYObq6Q
         fr77K7/gHR9WT+Kc8viaDVvnWohCeGwKO5ES5D5cCJ7JMGarhLB/Z302m9/ZUrC0XlDD
         6HyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794848761; x=1795453561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2R8NTzsTnEmXMgNWtnQHMwiEBK22IZoCmFArh7qLXXM=;
        b=msJHRvU43SqmdldcRts2EHVag2N7AfNTLbpo2s07IoDia3NfvSfAxYpz8AhVkHAZQJ
         VD7XX2t7yKyzWEiZWw7bMxMP9llSlTFANUq94S9Zfg13Hq4B06J0l2Ys8jsNzWxepoW8
         cYmh4LLTNFSZ7BBZ2Mk2F+pY2luesK4I3LbpPkby7934cyXjPdw7XjaePnuxmm6zXPs+
         wureU53rcHD4uWhZ76+4VcXeBS4uYrndmWQTKpC4jEJXp86hOtFU+aBUrKjha3CyJYCe
         GjLiSW5ciH/pEqXe0jxB7sycYH24xFWARUivMt4QGoqkXn0UYf9PjlQM/5T/8BQGvnra
         3JvQ==
X-Forwarded-Encrypted: i=1; AL+hErHI99Lc/SOER4iXwtsKb5g+S6IunrlzqP6isvZsWBGF7F9PVY8LY449zcIIUj8HHRVnX+O6m9kboZuK7qI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+arkvg9c9blZn/0dx04cqsoKgQnJ5P34v6Om+cCO3zIbaCrnCE
	DdXk3Whzksina2Lbnd4c5G7zuHjUZfsOcNgXpsqjIH/97YWl6ingtzu7Izcvqd/ypa9LmzoIZkw
	mrA4lQ/pyWaMh7XaV3hYQdeodddXgQhARCGKwZsR3A3Sq+3kXT5cBConZhjVEuuCwxxQ=
X-Gm-Gg: AZFdTZcCvaAod6WZXrG9JfAbIqKiQoUEor84IK2B/wRWf3I0wuLl21Qbj6k9jtzOSRY
	Uv77FXo4D/Clcx1iHNW3Cga+O+DvKMKoiQBiNCRORLlaq6k6Fb36iwbZacr9USfvudkCY+DjVXX
	AwDgzRq3gkipm1fEW0IsuT/5+tX4e+jgUcyTBxug+hu+jng9HPDM0RMXGSvQPZpPsRN2Zwfvw7R
	vpub5xWQY8Ga+7G81oFRBeNLyII7mSEXTOhTO21ufeNIAa79Umo+K06g87Ej5I/QpXajMucxejH
	zjxDmJEs+7ilHkmh4exnADNewp/ZFBQYXgeqqXJ33/PgqREezRF+PQqsqx0/U9BqgYIeg6vp7e+
	Jlh9qsGNCSkG+tdBoeW7RsrLkFbFCWNO3Ecg9nX9KPpO6zZKZopDlpR0tcsLGIR3SrYGAp2Fwuj
	jgrf0D
X-Received: by 2002:a17:903:1b67:b0:2e9:9c65:1af7 with SMTP id d9443c01a7336-2ee0dc3438dmr113739465ad.45.1794848761519;
        Mon, 16 Nov 2026 09:06:01 -0800 (PST)
X-Received: by 2002:a17:903:1b67:b0:2e9:9c65:1af7 with SMTP id d9443c01a7336-2ee0dc3438dmr113739145ad.45.1794848761017;
        Mon, 16 Nov 2026 09:06:01 -0800 (PST)
Received: from hu-sachinku-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2efd7abfdc4sm2174605ad.75.2026.11.16.09.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:06:00 -0800 (PST)
From: Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 22:35:51 +0530
Subject: [PATCH v4 1/3] media: uapi: v4l2-controls: Add control base for
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
Message-Id: <20261116-b4-add_sc7280_mbr-v4-1-636fb6bc8772@oss.qualcomm.com>
References: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
In-Reply-To: <20261116-b4-add_sc7280_mbr-v4-0-636fb6bc8772@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sachin Kumar Garg <sachin.garg@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794848753; l=1121;
 i=sachin.garg@oss.qualcomm.com; s=20260211; h=from:subject:message-id;
 bh=yr22iLCXb30gmSFU65q7mnwky8PcLxD0pxfBcfk6+ok=;
 b=0RA+EGMxxrRtfP0XfkDhndYlF50E4imUGjeljaP3xFReHx5+p58bSCqz6GM7+GfBTb1AFM9Me
 yJSftfmOYTeB5dqQxHFFJSk30GXsDp+M2HB9FbN63u3041A++ehZJZ3
X-Developer-Key: i=sachin.garg@oss.qualcomm.com; a=ed25519;
 pk=KcRhp4CP9cR1V2tg6xSNRnB2STYaU0vVigdUF4Actu0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfX8wZX49+jYiKt
 7tewgTY/e6kYbKkEJOHcRubekV1kX9pR7ss3CjIu+lQKKsxRxNudz2rqOpdcB6Bz+FLpRuoaRHK
 /s6gwgEGbtcPPwT6IgtfyNkSqn5BDf0=
X-Authority-Analysis: v=2.4 cv=C9N8WgP+ c=1 sm=1 tr=0 ts=6afb37fa cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=inWu9NajWAUUfZ5We6AA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: bnkMgT1UGaqyghI8c1_PO33mJY1-Lmp6
X-Proofpoint-GUID: bnkMgT1UGaqyghI8c1_PO33mJY1-Lmp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA2OCBTYWx0ZWRfXx00yWOWxE4Kf
 0qY+c0hwspNH6WYKpG/BPCCCsPm4O4zNEINcKc7zioU9ax9sB1SkK1MlU84YaqegLFm09kRSTqB
 vTYyl9URfhFm1cw/9xL17DBVCeLMfQFoyNHgBLAJG5ncTCKsXRBlkSz1l0k9+RRMaJ1W1jr2/e6
 65Mqh8wUQQR9T4K36CiFrmYm7Us+fDaNWdcCYnZJi8dYH6Ws88nuv+WWU9hQJcDeVpYMeBip/mZ
 uOoKSKHlOZ7leSvmeZJb3MPKLxC5CnXhaWmeUFEy0u84+mv5d3UZ6mPFoNFaxXYbZ5bccqYNGDO
 1r6Od4izrrLX84k6RKQnpolZy59EepSpqxr7wtQrdXVRf7wepATab3TjFZpSyjAj11WmteVohCw
 /EGsvHNUDAbURjWAhNf8I9R9qWQz76kWzfrOrN45tWxpsPOv+4qYH236Nt5ylQLRHupEcaQbOWZ
 eGFI0sPrzQl4AgOhgjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160068

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

