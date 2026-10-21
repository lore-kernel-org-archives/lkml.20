Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792574774;
	b=l/DZHwhaUnYKcbuRkJQuvu8Bw3ayu94sy1fSSLEAqGhtnLelLFDDHRU8Ipj7bNwLhVUv
	 jszcsymX8wI34zTCXZwspHAKRlGfyvtqp0Bt0yqydlQ+8W3fWYU2Dy8lZdVNslqyeEpOA
	 dUNTLIVuCzuHBzMxHj71h0iYEMwaWbV7SE1CCtVvgf12jV4gWyYK+aAFd/xk01edUwHZZ
	 vXQqbyQNwENRcr2L8vrKpSBnCi7DoovkEu9cOj/AcsPQ3NlWoLv91PKS9/fOLTLttZPrP
	 QPmwnaP9Itu5NA8CPydLEPj1HtcOWvKhQatv6DJoQrXG8insRy5xNHeFnABylTByfBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792574774;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
	b=grcMbNj2bx85UPJAhAVFxLPa/dO3Zm9D3hQN3AMQ+W/k5WjUtvHVWLhuPqJ92mFdIObO
	 ax8HDGXiE+YcmLD76mQkwnhN2CXNpF6LdJQ2J7jyAqkYV3wvRJbgz4w2j5+LngFnwmyAV
	 cqCRVGsPfWXS6BB6u4OcNwSVQ0xieQLcRsOCwgAdWWE8uvTh1LbiYQ8SpHbG4zM1+EMVu
	 NdXShEZt0ARCTBIAOpq37FlsPLrjE8CGo5qVf8vdAbfhMw044StDZyrlTxaMVuEMBleHT
	 jtG4x3q91RAZJsoBJwSwo1DElIOzJqWonx7TYulfbcTZYGk7ecQ7pjzetEi3vHMnM3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZP6RJxAz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7xo162Y;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA0F60A2602
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CA0F60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZP6RJxAz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=W7xo162Y
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j19N3355622
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:26:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=; b=ZP6RJxAzcZY4H2aF
	/JLzUqi0gmvmU9LyRhTwvotGe6RgfZ/IHX4qdNcnPEvPLH4UlfQsmi/a4bUta+Jp
	6S8371gAAdiWU+V9ADN1fJT/tsLhNPQdTnAoOcYGH3QbnDHJhRNKo2qCrrYwFSlt
	C66v7dC3D7JHEbzGbmqyDdglCzBEMxMttFb38whW8HghFvbG8oa5yPh6NqcDWrK/
	K1/UiQ/GtvXh/unDC+dBoVSmCBFU8qJY9ST9b2QH9W1M3ZVq2VF4j11Y96BninVT
	S1qQzmXOR8950y0MpU7oKNJZum16YNeO8sJlYHHb6nq7MDmZaXbn2OQ/mGauXv6J
	77xVUA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heda0k7u5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:26:13 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3510d0baf63so1214603eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792574773; x=1793179573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
        b=W7xo162YWaQDoMK4iC/5/HxepVCmCLK+YMCaz0SE0Jd7lAKf/5S/KfD8HesAxFU4jF
         Qsz9+69gLRrurc0/tCq+18iHcBo3gdlVyakyw8RwzRo8dRQ9HNc0qz4or0FlfLlJmN6U
         ve706ZulwTRuRD4oerU3bSCKeAGc6C03+UIZfoCBbC7CDdmpjtKWv2TSiLHl6l6FeM/i
         gEifS1pP3lmUKaCMEuc3R1p2eBe7r28G9oR3XYYR215hTJSMUqaZExHkABU3J9ScpmEt
         iE6NdKo+zjTupiZLHMIBzIhAYpNjUeCTunOgDuuTEJZ4JhsCaKe7DDbHrKIQFXi13YBp
         uvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792574773; x=1793179573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2BvnoqZZUe+XxnM0Kp7WCyzOWqPOcb/xTa/1aSW5xJw=;
        b=gQcK5tnChYmVPejMC7eDtuuvHSZjKycG35OzsA0b/MTTf7W7+rrBYks0iUPvvlIAql
         HvAH4dJs8h8zIfYXwF6YsUviE1lvhplCfjT6VfyruzGCuodCelO4hVFvmryVwCq5e9x8
         bOT437dGanpat5Nj/EBWF89zAE9rBsGQKhmChANeIMJ0n33djYP2TisFp7kttfymUmfu
         SlfDsXa+LODYqlg/IuWnRc0TyZ5sz0hk8Qaax2hZKNTQfzaXHe6OxnVX2vVEyYj8vX/s
         yn8Up77UEY/NP70oD1J7/uzv98sta37/dcS/k2zHkpaW2CNm+xg+zX6Zb27Y8c3lks40
         6vnQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLUTPB0oOKbP6PMEnYAZLoEE6tHfxm5lqLlN1jNZTq18/Bph9UOho6UQRw5h7cxoraS5Ge1BaIs8NUXC4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4QrLg+BlVZ3RKPjJXKwVgB9NNxU6EVpVnMlIaoWVPdtjliQVp
	A1M2GsVOLBjdR/HNPHdMALKkUne8RjyH6Np2M1xHuKIVULXgHo/ar/c+penKxPngJGBHaRn2D6x
	7TiUSFy6Unv8iw41mZ03hH4BF7vi7MAuM0+o88w+tZRfUuYpVCeiE6iG0owSazKDrAp0=
X-Gm-Gg: AYBFou0bP1GGXFPTfPlDsMSZxrIUxEN+/mpRkNw6qJDqmKSTvykYpmuNC478ZJrrdUU
	MA4Wm/fHb+aLnETviTozU8fmCOcrFssWRiO6wEeajlT+YsDsHBXdkeQpIsnfmDwbd/jWkQZ23sY
	3EgNibNRHtNawjxuz1VI4T3L6tvlpY4RxCIPrgevr3fx0gDXhJqr82pLO4RnaEWDktyRWMiO2BA
	Uwkq+0YvESEg2MWbd8jlVi6uujndmLHwcYXwZMSpdWmN9yEXq/8445MbVcgzc4kraPQ0cLjt5tl
	Nw6+lOu9/TK3ArbW6vXRqlCmn+svZvxA0cEXR1GFrniosTeyTRNg6YJA6peEDBfsEHEdyoSWwnl
	CT+HaCApwnQEBLNcmMkxY5zFV+GhewfSJ
X-Received: by 2002:a05:693c:62da:b0:35f:71bf:131a with SMTP id 5a478bee46e88-3674d13ffeemr2438794eec.28.1792574772942;
        Wed, 21 Oct 2026 02:26:12 -0700 (PDT)
X-Received: by 2002:a05:693c:62da:b0:35f:71bf:131a with SMTP id 5a478bee46e88-3674d13ffeemr2438721eec.28.1792574771404;
        Wed, 21 Oct 2026 02:26:11 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8439sm6155671eec.11.2026.10.21.02.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 02:26:10 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:55:48 +0530
Subject: [PATCH v6 2/3] misc: fastrpc: move ADSP duplicate session creation
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
Message-Id: <20261021-dup-sessions-v6-2-578ab52ba66c@oss.qualcomm.com>
References: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
In-Reply-To: <20261021-dup-sessions-v6-0-578ab52ba66c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792574754; l=3363;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=hoyqKe3Xg75nwp77nhRMqSJ1qCMhXfgxFsO2RjAVi4I=;
 b=LC1PJt8KXbUZfy9ow4duAZddRfZhmxUyXouyYDY/1eKvG8XU9wQLssAvCoFt9h3kaF+wkgumf
 eoG9rZcAutiAvulGWlaNiI5ZQ+5HfGx3D9mV3LidBOK9FZ36auSqBJs
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXxEvxCG1NMTLU
 Opmq/4Cf74YU1FYe7TyNaYD9ooFnDHtfg2jZlxaKTtq646YmjDdsqbUmW65PEOD6vb9N3ZvsIuR
 TL1Vxu+0+XhdY7xbe5YQfpxVtDj+meQixolo/gzy+aJAr9cTeqSzyh4CDLBBhalSwQXtn1/Cgri
 YEoA8Q0p404BrDqXQgMZ7qD5nGRmGlS8f49lXaprGRJN/T+K04QQh1gifV6uHh0CBNdreLIN5XF
 Wp3CknfV1xFNnQ+kAEw+qp5vaHugppiL4kgaKLoEP0FGH8fCysp/pBgqqG0WPRf6cKS824C/hJL
 MhNXI/EO76pHoIJLx9tRkw6iV/N8uFI6x2ah2sGcj2y2wWIxc3d3BKHyDRbPlG/lty0N9s30igQ
 gV0qh7z/FbTywt/KgrAwfBDmcok3vjEX5ASUTC85qUYYsy4A9XfTsaPyzVpvkQOXlAKQHeE6eCm
 TLlsrct8xj11n/MwHiA==
X-Proofpoint-ORIG-GUID: 52-0ziIxBM4S0uDQJK-UASyy2kjW6LE9
X-Proofpoint-GUID: 52-0ziIxBM4S0uDQJK-UASyy2kjW6LE9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfX9LzEynupfoW0
 raKB9ZQYtbwochLLdCn5Amt9UpZntZ+qP75SjnfTAIdW84Zyh2ZFyWvyQb6GLxecDteA069Mn/e
 TsvIGyOvwDy2/f10hiCGAT6Bp/RtvGk=
X-Authority-Analysis: v=2.4 cv=HL5WhYtv c=1 sm=1 tr=0 ts=6ad88535 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210037

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
copies of the last session for the ADSP domain.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index caa479f304c1..5dd1990d3e2a 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,11 @@
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
@@ -2338,7 +2343,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2348,7 +2352,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2368,16 +2371,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
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
@@ -2656,6 +2649,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

