Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608293;
	b=uVlx+bmKc+dZUfA9a6dTdXx25ketEc1vMuw7NLih56Gr/Z/Mf2cEKm4sgr/6+O+VbiU8
	 bucm7gwscKgLmxse5Jcbq0Zsygr4IdI2prTJtj2+MrCKcyi/9a5P3a3KfJxfo5PaWM7+g
	 PWybme6qjNSQL/4xs4CYNyzlsRhZwb0tn/Q6EduQ2pOyHS8F5PuUOOrzUAchkDJYrl5Ee
	 PrjBYU/c2f+DGVVTJAbVCy2tkgDeYvOCuYKfmRl/o6GUxO2snW544Zcv3vnYu87igiLKh
	 DZ9Cv3WmZe21H9n8x2q5rbAnDP8nI4e6nbk15vOh7rsC2Btx0NFK5qQlgosdUujSrCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608293;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=;
	b=bSqhSxuquz1MIoqpyU97FGSYe1QuGxQLm+aJYtVVQ7qKxuiAi9fIHS8kekTe3qaYswPn
	 bjzK9m0OwchlA7rq3i9QV5YR5gFHzRuo94/AyQVJ3iAq5VfMFwmJuCWqRd4tLBTtytSYd
	 yZbPYOEySnA+TUvPqLVcPPd2lWQ2UIRK5y0FpJBaAA57CItsY0NRUEFGPEvTVOy3Nv4Kd
	 MmHy8oSdZiQiavEKdhdvRiNt0hMxp1G+aE/slYBVUmXn6zNgqycvZlR+a9avyQeVuMqcT
	 c5RiJyn/PdCsbLpg8/qKbj/1SHzC84PRWR9Y307+ZGacxxhLNMROUoteh0RVsxmHirg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kKMtXU4Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=haXUhwS0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D3606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:31:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D9D3606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kKMtXU4Q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=haXUhwS0
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A26pgcZ3121054
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 08:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=; b=kKMtXU4QPRmZmwTs
	8yi9pLSXsl4/YLmX1A6kg2U6IKKBVqC+B9bNiJ2G3N3Y/+aexXEXSgjTO1cJNBqT
	gkEG8SdOhLKWmhEuK2mz5k05SrtSTbCvdODmN/2Le3oWWEgJIq88iCMlmyD403I5
	xm2RPm68r9Hs29soP0GQgM2Xgk9I7qJcSfXaqOZesfo32VxGgRAt8e2LQIIlJshf
	D/3xRT1KKGdUaCv9JCuYcrLHAvHDRxV5dj/G123eKmp0SGOTnzRwsLM1Kc8NWYtj
	1FdXcgyqYMqsUxlDblBW3Antk1IpA4lIedUQP9xwQoUZa+jX3aNyk1VgCsWslwSH
	BROLug==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpnmerbuf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:31:31 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a08903566dso2724418b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793608290; x=1794213090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=;
        b=haXUhwS0BdPJmZ0kE6ygB2NDAUDzbDqmhPZSJZUjIsG59fTSI5/dQB5qD3czhiliyX
         ABTd7VCE8NzBCKdIxKtjFkudJ+Nq3mk+P53EbSlPGOnl+D9t3wYBPZoKq9tLvEGNTuip
         YWK2Ve+sQQaEo85g2pvemxPPOy+asuZE/R6kc4t9lpmZfVFawez6UHpxrEopWIVCmnUM
         idGeTJxgA1e4+NPBgRmjEThXAgQqxU4I0vhKZ5VDvC1btTFX4lqTa3FCNoozDRqlRSu6
         /7C6p+aj2BrS59Lcq1ADliwLJNLfnRYProT+qbFN9HZs36yrNeT4fcODR6PKUVUFGFJ7
         Q6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608290; x=1794213090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sl/C0ue7XKBR5JLbZ/3q4Bcos5iFaHn+Kv1/3l6xjqY=;
        b=cAax+kcyI/Luo8w8QO05ydeNvzgpiVabyaNBrmkAV8T4tkJ3YpQKahgrnnJTzLd1LH
         IU8yeCHhqKmB4Zr4tTzOQJAt1JvIa6VdI0m+x3NYP4TKKrvo5pbI1KvriekwIforv4uI
         fSKriRauf7bQL+7+h7tegW2nu4HVTygHu+bFr9lV92cdortnOon/shX+VPr2dN0wfbXl
         k1xQvQ5j0mtHZVj+CUwOOBrY7Fu99I4pkrI0UKTKd1mVADEtlTjvuLjq9LXYXn+ZXwRI
         kXBmxwNTJ9PHP4/R3yAZMZgXnT5Ga6CY5aQWFgrxxKrRMInQEhRC5AHGbCRsiVEhFlyZ
         o2Zg==
X-Forwarded-Encrypted: i=1; AKwUvBwbDNeOKcfDJeJSC4lzVL6+stBX4OWVW95GBP5AE9g+I+kP0JweSMxQiynnratZBLbq9uD2tbxtJBiF+hc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iGc5lkzz7zZkC+4B5zuEi70U3JNWt9xkOkDHujb+G+tmxj7J7
	zHPyal+NdDO+1pTuxMHWKoewR7mJ824QcUKcOr/19PsqgXylutwGqbVEkCl2hGyy5Y2QCEpDc0q
	dINWtqRqMZdThiHitOtL6X0dn0M7hEAWiD1tFfiXwnZ4s+MfD3gV6dadPAPRCSW5AYBo=
X-Gm-Gg: AYBFou17p47XOZusQ/jyVXHuUvhoR6QFCqzWuSH7Ndh9mOXkeZ/mTILmr/A75EYtJH5
	ulQ81pB0FiCZW/PDpaUekOHqGO4MhTy0nuCGX2qfyhCj+AAMV+gM0ZC3+1U4vpNaacbuyr9z1EG
	J9VINBbDVC8QAI1bbSngR+HWpWvEGHyid9k2gcZvlnbyugY4MnOWdPXcCLBwQfvLJ9vx+L5krTe
	n6iEcOe8oMoIh6thXw8FoWDIjV2/njO3mgq63M72hmdjNpGGgiHR7XLwjjt+Yt8wHbofJBcWKbA
	aBDokOfPN4cbiGvj5Ypcyjw/LaW01eatvDq9XhY7a9SwhuS2xl9kuQzweX1ljPLTj8bkhYb71EZ
	PaCUyJ/EwtPblSxYnTUSSy8QozzQAR8CabQ9LDTNcSnhLwioiyNb0roukw5xP8NdoQ0uPh0MR/w
	9gYY9p3g==
X-Received: by 2002:a05:6a00:2e24:b0:8a0:3d98:6901 with SMTP id d2e1a72fcca58-8a8317dd9b0mr7526915b3a.16.1793608290173;
        Mon, 02 Nov 2026 00:31:30 -0800 (PST)
X-Received: by 2002:a05:6a00:2e24:b0:8a0:3d98:6901 with SMTP id d2e1a72fcca58-8a8317dd9b0mr7526892b3a.16.1793608289571;
        Mon, 02 Nov 2026 00:31:29 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aad9d03be0sm1674680b3a.27.2026.11.02.00.31.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:31:29 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 14:01:03 +0530
Subject: [PATCH v7 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
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
Message-Id: <20261102-dup-sessions-v7-2-03f06c014e78@oss.qualcomm.com>
References: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
In-Reply-To: <20261102-dup-sessions-v7-0-03f06c014e78@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        devicetree@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793608273; l=3389;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=GzcRHbNO2LaB8PuGTjCYn9dNPlPk5e9cggwn9DNEpK0=;
 b=yg1+cd5W5+ps5gLLwfz1IOCzeKnefgGcJpN8uae6dE3CkNoxSlHbgaZ8tfUKjoBUh/R5+Xpyw
 zITO6NzG3Y6CDPt2wrqK+XTiILEQ5FQ3hr3OU8hYTcSYkoz5mA4pkcp
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Authority-Analysis: v=2.4 cv=KZ1HIgYD c=1 sm=1 tr=0 ts=6ae84a63 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfX8EULEJm7fOnE
 78h2sRFHLGfn5DfvHNLTECt+Xb0iui5uMpHQHiWFCNr1MdSB/HhbI6ZK4Mg+No91eT33FkkpN0k
 AVVAjp6Uoe5J8RWaUD1UEAIwoyNbYpZfSUvDmtuStSIr3JIVhMqpNqQ1YnhI33kNuBaCGzUSj8g
 EvTppoMhtXGe493D69ie7J48Bq/M8u41iW4miX1Haq2Xxh2BWuail5xWCBe8KuV/VR4o5SwiGEu
 woJcYivcP6WltQVZxiohZeC0PKMIUNTwfEkriWVjo5G1UDTvGQRKv3OvAIcO/hWBOC1s6YJVDxU
 3nQjf8+gESatIdHPT6wT7f/FmzR82osHofT73YtnEqRzfPAp+TRCwKeQWzw0PmnAHmNR3jc9Zzm
 BUpY6G4Oj6ONW8ufSf8tF07CjwDiOXZ94llRNSMVd/pCwazeGtC2LPBwjmawin78AWocKU59XKx
 VLGROLyj6E9jzVIsvcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMyBTYWx0ZWRfXw4nbvG3uvQ+r
 8zDJp/SB6VkJ+SJPe43ff/5qN4E4RrwezOhh9++z47Gyg5sfyb+3k65hgUnNoJIEFz2NUgzY17x
 fVUAPfQs9k9cyfBfZ4K31hIEiI3vcfA=
X-Proofpoint-ORIG-GUID: LS8huuTdfKWwV631lds9Tw2fzuGiI6dj
X-Proofpoint-GUID: LS8huuTdfKWwV631lds9Tw2fzuGiI6dj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020033

For ADSP, only a limited number of FastRPC context banks (CBs) are
available. Each CB supports a single session, which means only a few
processes can run on ADSP simultaneously. If all sessions are consumed
by fastrpc daemons, no session remains available when a user application
starts, causing the application to fail.

To work around this, qcom,nsessions = <5> was set in DT to duplicate
sessions inline during fastrpc_cb_init(). This policy does not belong
in DT and should be handled at the driver level instead.

Remove the qcom,nsessions DT property read and the per-CB duplication
logic from fastrpc_cb_init(). After all context banks have been
initialised in fastrpc_rpmsg_probe(), append FASTRPC_DUP_SESSIONS (4)
copies of the last successfully initialised session for the ADSP
domain.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 7441e9b8940d..b4be0ee2bc18 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -35,6 +35,11 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+/*
+ * Extra ADSP sessions duplicated from the last CB, as each CB supports
+ * only one session.
+ */
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2339,7 +2344,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2349,7 +2353,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2369,16 +2372,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (cctx->domain_id == CDSP_DOMAIN_ID)
 		dma_bits = cctx->soc_data->dma_addr_bits_cdsp;
 
-	if (sessions > 0) {
-		struct fastrpc_session_ctx *dup_sess;
-
-		for (i = 1; i < sessions; i++) {
-			if (cctx->sesscount >= FASTRPC_MAX_SESSIONS)
-				break;
-			dup_sess = &cctx->session[cctx->sesscount++];
-			memcpy(dup_sess, sess, sizeof(*dup_sess));
-		}
-	}
 	spin_unlock_irqrestore(&cctx->lock, flags);
 	rc = dma_set_mask(dev, DMA_BIT_MASK(dma_bits));
 	if (rc) {
@@ -2681,6 +2674,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
 	if (err)
 		goto err_deregister_fdev;
 
+	if (data->domain_id == ADSP_DOMAIN_ID && data->sesscount > 0) {
+		struct fastrpc_session_ctx *last_sess;
+		struct fastrpc_session_ctx *dup_sess;
+		unsigned long flags;
+
+		spin_lock_irqsave(&data->lock, flags);
+		last_sess = &data->session[data->sesscount - 1];
+		for (i = 0; i < FASTRPC_DUP_SESSIONS; i++) {
+			if (data->sesscount >= FASTRPC_MAX_SESSIONS)
+				break;
+			dup_sess = &data->session[data->sesscount++];
+			memcpy(dup_sess, last_sess, sizeof(*dup_sess));
+		}
+		spin_unlock_irqrestore(&data->lock, flags);
+	}
+
 	return 0;
 
 err_deregister_fdev:

-- 
2.34.1

