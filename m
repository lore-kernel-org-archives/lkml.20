Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739C943DEC2
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789450872; cv=none; b=lX3Q3PXcKcFGvJwtQ8phNdHEhHnZmxD5WXtimy75Jd4fHU6JR5FUvRYiRdmOYv28uaMhITG1JflaIMTx8vYvOvP9D3Yr+jaM5Hks/tythNNdLKghBola7rBJQp24kMdecv4k8XyUygDJWn4mU9yD8JsE1P8vchaz6syOEPMypQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789450872; c=relaxed/simple;
	bh=Hd3h8KPjaxfbpke901lpJ+9XzRU8B7Mv4K1p6Nk11uQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqJlZn4fy4/9XmL5VhFORgi66gQv0cMsNxm6aCuVSbbC1jGSJQD/gt4Eyu5vWo/2KYPMiu9dBIyaL2d9FQqoA0BziY7nGRPQ4M8ocZwLIO2qiiqU7LVRsFJJtEYLBdRtSYGoGPjqoXSzh2dU7dMJGCUdsehgHzj6ukezkDp1BME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OXcFcsVj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HK3c4lTw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OXcFcsVj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HK3c4lTw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F2nWHW1170366
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sHGp4VACy/9bz2acd/gwrvXj8b44/OpCnLoTqNtuD0U=; b=OXcFcsVjq9hpKEAg
	lm+Y5zg/MRW0XA2sI4RiAGQV2jrQtErfpBEVW563AD6P17g+xKaddbAkt6pqd5Dy
	/JMg/rLQhJMThAgbShtGJUDFiFcZyxBquLhXtcYd1a0AP095G7Ry5DKG/g9q4U/R
	BKK7TpWuMRb6BwWryBz6PMawSsqB43LjeUxykcm8j3PmP539SgkczD+sSxAqgEJa
	Cc+qAE+m0ij1lIR2ev5N6B/hnL0ojfA9OYiklUMn0xFs6O/b9S92ufFu4OIi4OYJ
	CKMYTqnaI7OiZZ5FEGaj7jvx3PJ+SsiTbqRBxAN96m7lOtC4e3AiIWSeWfD1HHeO
	h/WpAQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpergc3q2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 05:41:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39af306c795so996264a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 22:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789450870; x=1790055670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sHGp4VACy/9bz2acd/gwrvXj8b44/OpCnLoTqNtuD0U=;
        b=HK3c4lTwHkqVDy37ucfOFLCqKqUSLEVuAnq0aJQM1fpiU+tFIfImhpQDqOYmFl/aNv
         +ozS51wAgxtma/shdcvw9ayAEkNHpWQMkkT4hM8WjhzHrlkD2PjWsTvgs47Z6kJDAnHU
         EMArRbc0UE3DRC2S1v6riufi3+BkmfKQ1THijtQNzyV9A+6qWzrkgJNcEpNnrkxD3d79
         tQZwdOn2piy0oAyazSsND3r1geDYHBNP1OX5JHL41Zc7ktstOg1F+3GspSNQhrRU9RlK
         0+KGuUIWST6+WkakfOtEZfsq7sgnTYDi8dDA7iiClenm1UEXzdoHx/GdIGO8KDcHtqvQ
         jhAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789450870; x=1790055670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sHGp4VACy/9bz2acd/gwrvXj8b44/OpCnLoTqNtuD0U=;
        b=dMMEyGxmuQPNfqcjrZt4ccOOkGbTxSJUA3x2/j5sXUPpUH8kxSuZDjzpPXcpQj2PaA
         u+Bx2EPlzDM3kguq8K4lYoh6eH3Nmm6x4/gutGOXgzMDoiu1XnBSDyDlZ+ZWRTtvjLd8
         m9i/MygvK0s7ESC6sDL+JwTbu84n+oG9cG4/gQcQorKQZJeKcHgy7eAvbcqt1g8v0iyK
         vMxBBilTw2m9HV3OYSfIKfKOkMPyw1/Y93ihLuf1aZWnh4o37jZSQaV0wo8/dqwn1rzY
         jpQq5ohmMgE1cbvMPJfcT/vkr3ZwakvzSaRHx/mhliPu/ERNpGkGwqrC9T7F9oWp0ui3
         4NaQ==
X-Forwarded-Encrypted: i=1; AKwUvByKX8Ah4+4l0TRuqeHJPsj21rhRxYqg8Dge/I83QPtOMRxC9IwmtYS9Iyyvu/LcAPpIq1Kaa47aXfpe3nE=@vger.kernel.org
X-Gm-Message-State: AFuF++kxhoMHSMVAMlVTkpi+QwjSs2XXxAv/D6S3pgvkD7Y09EVVolOV
	I4Jq7LfhFdlogpxQGoRzVuQ/nM8Dzd4WbKf45W0Qk16hqZ0y0eb0ivvyDKOkvAWzpn1ePiWfTla
	6PpuO3sZ4uaNfPv2XXrLvezya5h5+tLnL0QOl2Ydfd0+cZMiCq6iRhiGrupyC+FAzzVncO/bNpX
	N6V0XS
X-Gm-Gg: AYBFou3wgUZYH2k7BJ26+ZWasiITFpsrbfyrDnVO+JRnHHE5Lh5wjikEw/6SQnZdUnu
	ynxCeT8U2H9Bghc7jOTMh8DGFd4LJE9dHT9vyL/7vPFTeWutZHBSTpEClPb1e8kH3yv2kj1q0qA
	jjO2Zs0o3bDa0eZTDoy5tcrgJ55ACtixm9w0s9xcvHaqR6Rd/QgWVJI+HnoeJpiz86L1NC7gDZy
	5laRkvuFgNERFqal3/HC+J3RODaSSIjtHmNHDhDgJSIAdqvRwNa14yB50+JGXW4qOXEgQ03C5mE
	CASguI6T5VZ9Ve1Ty0o+SfHBGC3HtUxhRBBol+3gA49OxtUGpP/4DjWv8N/Eq0bnFKTTNkDfNVy
	hcpVodQYYI0gAclpxGpfe1Xra4Vo8NDIEdyStJhufKx1dHFU=
X-Received: by 2002:a17:90a:1690:b0:39d:f137:db60 with SMTP id 98e67ed59e1d1-39df137dd30mr4614818a91.0.1789450869793;
        Mon, 14 Sep 2026 22:41:09 -0700 (PDT)
X-Received: by 2002:a17:90a:1690:b0:39d:f137:db60 with SMTP id 98e67ed59e1d1-39df137dd30mr4614784a91.0.1789450869337;
        Mon, 14 Sep 2026 22:41:09 -0700 (PDT)
Received: from hu-zijuhu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14390c0be29sm1589960c88.9.2026.09.14.22.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 22:41:08 -0700 (PDT)
From: Zijun Hu <zijun.hu@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 22:40:52 -0700
Subject: [PATCH v2 2/2] Bluetooth: btnxpuart: Fix skb leak in
 nxp_process_fw_dump()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-misc_fix-v2-2-6178d838c946@oss.qualcomm.com>
References: <20260914-misc_fix-v2-0-6178d838c946@oss.qualcomm.com>
In-Reply-To: <20260914-misc_fix-v2-0-6178d838c946@oss.qualcomm.com>
To: Amitkumar Karwar <amitkumar.karwar@nxp.com>,
        Neeraj Kale <neeraj.sanjaykale@nxp.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-bluetooth@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=QK/91QLL c=1 sm=1 tr=0 ts=6aa8da76 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ts5nViFRsRHbD-iAU4sA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: AdhDagsCkT0uH-pL1jYuxKM3sIizEHpw
X-Proofpoint-ORIG-GUID: AdhDagsCkT0uH-pL1jYuxKM3sIizEHpw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDA3OSBTYWx0ZWRfX88R8Ds+ruQZf
 GvDZmjvdYboYS0q5nGsHyZ9qoFDRvz/vVAdi2Y0oNpmWludDgRNUoIo0oJabPDop0kHiTbuWEeu
 HJh8vMllnSQuQbk8DeR0uPBEnv1X5grsoXUgbGJgtflvoirpXeIuyM0O4P5kgEfGbRVf20Qos2h
 cm7Vz5WauyyRDQYlPbRULdo1H/W7Orp473ICAq0gjf7QMlRoxv9gqMfl3fFNh4dIL9H8YuIVpsN
 pahnz7MYR9DM5e2foLB+eQiZ1HIgBtlBcP0CuP4QCatM3g1w8tBJ3y8xqFo68bVz3ASo/N9YWiQ
 7oRNpAkC4NXnVOePzP2SEJX0uVnvcBe4HSGiQBm08EGqbbUU/tT7WD2gonDjQprPZXTTx716N6d
 l4QSBlsNcTYJmMoKZbjcxWxbMoeodhSR58CDWSA4r8aSGcb8RKoGtiB1BAsFgChcdr0HuG0Al7U
 d2JBOMbAs+GmX4CVJPg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDA3OSBTYWx0ZWRfX5yHyYCPBAgsw
 gz4qjGf6caNnX0vrohQEBEdXbDdtG61Pb3czV5oG8jsiDgnJMewghry4qFfE6vtt+jt9fNyEtZ+
 Gu0hVx3FvBzP2i19O+vnLNBuDdurH7Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_01,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150079

When CONFIG_DEV_COREDUMP=n, hci_devcd_append() returns -EOPNOTSUPP
without freeing its skb argument. This leaks the cloned skb and also
prevents nxp_set_ind_reset() from being called to perform recovery.

Fix by guarding hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC)) with
CONFIG_DEV_COREDUMP.

Fixes: 998e447f443f ("Bluetooth: btnxpuart: Add support for HCI coredump feature")
Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/bluetooth/btnxpuart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
index 69e897444112..a0b64fdcbcc1 100644
--- a/drivers/bluetooth/btnxpuart.c
+++ b/drivers/bluetooth/btnxpuart.c
@@ -1383,19 +1383,21 @@ static int nxp_process_fw_dump(struct hci_dev *hdev, struct sk_buff *skb)
 		err = hci_devcd_init(hdev, NXP_FW_DUMP_SIZE);
 		if (err < 0)
 			goto free_skb;
 
 		schedule_delayed_work(&hdev->dump.dump_timeout,
 				      msecs_to_jiffies(20000));
 	}
 
+#ifdef CONFIG_DEV_COREDUMP
 	err = hci_devcd_append(hdev, skb_clone(skb, GFP_ATOMIC));
 	if (err < 0)
 		goto free_skb;
+#endif
 
 	if (buf_len == 0) {
 		bt_dev_warn(hdev, "==== FW dump complete ===");
 		hci_devcd_complete(hdev);
 		nxp_set_ind_reset(hdev, NULL);
 	}
 
 free_skb:

-- 
2.34.1

