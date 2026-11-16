Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835667;
	b=dLSFLS2lKDboXxA7nRAn9FZqR4052foOp2No11Ds6PlFrcQik45+yXfxj2r1iXLB2Jc9
	 DkdbCAlMgtqXrI5KWs+HgGIAHIguU8E6Y+Dagvuzo7rA/mLPzc82McoKB9pWqEcPVDQLa
	 Hd/FdPA1OF+vfcqRnNl/BKfN7XYvF57e+NaLJsAGOimgnPeDTSNNbA2rOSr/5d6AhuOJD
	 Xff4Fi1VpnoDnkSUvis+L8/4E/OAufi7iWsR/ccUBRc2e1NXlDPDwJuA8vRfpbWJQk3+s
	 8/oqBUCP8Ri2xEoVeTqA2SLUGxqJXxQfxAmtmfXS6a/IRj547CiXXjq2G0V0fohqQ7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835667;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GP+lNZ04x6U/6g+BRd/Rsoxc8+T29rvyx0Ll9LTUk3U=;
	b=DQnSbLy0kk4NWbq8wH70HOdAIwEOJ01vwLxOSIgrFwG/FVwavlc0jZPGouUqwlxhRRbn
	 y8KuU3NNc43xiV1OjgIppiqt4eopUaAw+7n9zVLArxEs9Syd1utW8Wvs25keaDyGLcehb
	 nJwavAawTS5ReBJDD0r5sDhSl5KZn604G6qIiWmhWi0FAYej14j8qoAv9ifAJBoz2R/Jo
	 Z5ixGM+yMN+k6m+gVMLJFxLgCeV1dnrHlFnXDoEzatVMOMjFoTamNST4x9SvHhxT0VSIc
	 azPpn0/34zkvZzGd1nsMwR5BXg1dFuGcpIoRWlkhn83DX3vWWYxjFVUysWuTLJYnB4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="krIi/Ql8";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OyUQUD4W;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EB2F606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EB2F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=krIi/Ql8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OyUQUD4W
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC1Gem3117232
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GP+lNZ04x6U/6g+BRd/Rsoxc8+T29rvyx0Ll9LTUk3U=; b=krIi/Ql8sMszVbX7
	fCG6Fpa+7p+PDJ9pS6lR2Q1ua+4J70nniWw/DgYTyblXIMJfMqUfnLfT/O3Gofcf
	bXveXpfIA9BVwWz33uS+McfT77rYFGDNu8p8wwHBBPlQr5r5DAZ+CGnk/btSbqba
	uGEGmXa3fTo/E+5c8U6Nyz+l53jFVLFLoyoeQJNjkAkSMql+0cPhAjwfgcfB+ttT
	K2xNk9M4HnoZpibl37iKrPt1De1dLOreEiCDBLcwE8IxCg4L5qZ6A6xFzJbcvzgc
	h6We6rBKqoJYW0g0xZAXx1v3l0tW7cPtFM4H8ZcDkV3uENiyoZaHBZGnkOhMKpt5
	BEaOKg==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j01f80972-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:27:46 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-846863cd436so3790868a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794835665; x=1795440465; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GP+lNZ04x6U/6g+BRd/Rsoxc8+T29rvyx0Ll9LTUk3U=;
        b=OyUQUD4WZ3ZBXQwYHepFAprV29OSUOoZWsA/ZgQz5U+WF5mxiUIeFA8MqbDPY7W+54
         C/5hlAnz7EWooeNIqyZ1YKAgjGURCbGl3BdApBIibj+lD3V9l5VvlXDrkU0tLHA9Ue/G
         FxTRShLlD8BBkETca/B7rR8WGG4ePtW87RR0F45LxmcoVI/Xzp3HCpsPC4733TStqBm2
         b3nXVPKFrgaH8SAG2JFpOXUHxur2kHvH2dm5iP71Z0NyUG1Sz12/xefYKLq01FeA79ep
         jOH/UYZhcNnmmy2WlepE/lNwpv0H+7Gq7Zk8A22o3Lvdm4LCy6geu6MeNAFlFZh5timk
         x0jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835665; x=1795440465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GP+lNZ04x6U/6g+BRd/Rsoxc8+T29rvyx0Ll9LTUk3U=;
        b=JdGab+arp2vezb7xzRN8NZa1d3dIbsvcO7yZLwHuJsr/wgBAfjnSOjHUbZubUK/FHf
         VCvTNM1zq9A9frkq+dihJzsAVLYwUtlPQ+WBnfo2qUibXQIsKPedyZix4MLbBpQRO6/i
         5IlavqdLfAjeovnTCw56nlzE9ppb6xy0Xm+wIXB7RiyRbaCYHHFWl0JbbVlSl11MuKME
         5xfmeH/IUU41bLCaqYqr9GWMsbRD99dnhSEonMlhq/GukhtOSNb77RGYtZvfOP5wmFhC
         isti0WJDyqZJBB34Xrmu8uL6hFhn1RXjVwypR7Hhhp9QopX0Yjkwy8j/gX5K+tS0LB2n
         pgpA==
X-Forwarded-Encrypted: i=1; AL+hErGPnB0XmJtrFahGLmZskt8PfIPGYY9CJnbC9VPSd2J1ZyR/GzGEZWqM+ArlLtEFTDiQSVOIBZz7sdlUfE8=@vger.kernel.org
X-Gm-Message-State: APuU4Z+epmoY4/3jh27l32yTJJkqo9rr3/Y5SCDlBu7C0WzojSKEhoS/
	siwaaUBtUgjGBtcAfTl4NfhFzMprpaSMqbGr5Pf7XP8V8qD+PHk5hrxBeKbRwxKyMRa8SvP+ulK
	g64o+5zfwlpDir60uEcwtyNyQfDLlipv9SkzriJYSKugM5qFUu4mKA0dWmLT9k7MrG9Q=
X-Gm-Gg: AYBFou1vqJ1zFRNCEnurWD4NwY+4TneSF/dvV8V8ahLP23JouwODuewglDvdz+sn1Jn
	nyDbzzbfXzdrnOp2MR+FMeW6Gj8qfcUhdg8mZn3A2yftlVt7bX8XK6LHNvXmyffAvPmnMMO7tS0
	MRvmW1zqVEzqGnh5JxK6cwuidoflHAmIfd9stblvm1Bq0yRodU3ZDC47/SVI8umpH32oEIvW9gq
	CpczNuUNROcOJhdeBZdp40fxYEAFs3IS8ibpYM0naZrf4QXU+CjdqCEMXblqPNgVH0BjmI2Flwr
	I4T3rq0tBB5ehK+W0rbx4tqiJWAblZdmZGCR9+VEaiTgzpAo3MYEdRpmZpOgb/DFGKVV8TiAEG/
	VKw9E8RM0Xflde9BHn1xlMbU6xKR48GPSmkZ46iLI03iMiQVQeruSN1zfDpUHIVxdzN7D7b2WD5
	sZovuj4jE=
X-Received: by 2002:a05:6830:4122:b0:862:ca2e:918a with SMTP id 46e09a7af769-862ca2e9f54mr2358113a34.19.1794835665609;
        Mon, 16 Nov 2026 05:27:45 -0800 (PST)
X-Received: by 2002:a05:6830:4122:b0:862:ca2e:918a with SMTP id 46e09a7af769-862ca2e9f54mr2358089a34.19.1794835665172;
        Mon, 16 Nov 2026 05:27:45 -0800 (PST)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8628813346esm10012527a34.17.2026.11.16.05.27.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:27:44 -0800 (PST)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 18:57:30 +0530
Subject: [PATCH v3 1/2] misc: fastrpc: fix NULL rpdev dereference when
 session alloc fails
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
Message-Id: <20261116-fastrpc-probe-fixes-v3-1-3cd56d9d9a93@oss.qualcomm.com>
References: <20261116-fastrpc-probe-fixes-v3-0-3cd56d9d9a93@oss.qualcomm.com>
In-Reply-To: <20261116-fastrpc-probe-fixes-v3-0-3cd56d9d9a93@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>
Cc: Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>,
        stable@vger.kernel.org, Tyler Baker <tyler.baker@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794835655; l=2528;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=qyOzQilXYkBjF32YjLtPldFWtQAux35R3zlEUXH0auc=;
 b=7J0qerE1hXz8b3V5kFX1tH1Jt/6ibT2/D4UYtCOjUErGCE32WTbul+JYEwMX0JUyV4JyKlOFX
 M2h3cgjAW8lAm3VZGgRjSu8RhE7pj15Nn06HKnmejmpcV40KriI56Fr
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfX/8eexzpC8EPv
 APezHmiFOZmfAjHojFysq9rkeao4aBVhslDi0j7T6aVvm/49IU3TB4MgYR6t6La82sidEYsJdHK
 1yjwPLVzKzrzaHCt7dDg0wdD5u0kMH8n3cRirmrvF8EKCLpv6/Y0BmNioiY/aMrM1obrvGFbTp4
 Np69109apA39+amQqSPWzErgugDelGklH0v0nBuZbIPSEooLuIzIABrqHdRwKSB0Ts8nDmaSeNk
 +gndrrDztzoZd+PqMxmOufw3WpXYhd3yEPfzTpLPwuPVyn4A1vKxItrS0+oQo9JS87hrl+WBy6B
 hLjgMFJqlTcndQ1o/cX0hphOmAaQ9Mdo4SRgCGk8dZNImbj5rsE1iPUE9HyUE0Z5rED07Gi1i7C
 8qXbUmR2t3Pk/dw76Xok75MoNSdsIafgnaCokLx4YWX0VgJKMKzrHAPHKAwoz6Sy4KqiWLjoBe2
 XHWilFoU1+oIV69KI0A==
X-Proofpoint-GUID: OBajYxqBXPMz8obGS5vpHR4GHAi7yllN
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MyBTYWx0ZWRfXzzWJA5MfytEi
 Zny2t8tdpf1KeBSL2LgMXp18/pVWkdrIurYutT8OzasxGmfIdNaAiAWXrhMpaDbIgT22GnOGdgm
 lOi5iMdOWZBwI5CNYkxQGjTZ1C+yFcM=
X-Proofpoint-ORIG-GUID: OBajYxqBXPMz8obGS5vpHR4GHAi7yllN
X-Authority-Analysis: v=2.4 cv=VMpIDNPX c=1 sm=1 tr=0 ts=6afb04d2 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=HPkHAgnwbDoOiCnvmVMA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 adultscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160053

When a fastrpc client process dies abnormally without closing its file
descriptor, fastrpc_device_release() is never called and the compute-cb
session slot is never freed. The abnormal client death on the DSP side
triggers a glink channel teardown which propagates up through the rpmsg
bus and calls fastrpc_rpmsg_remove().

fastrpc_rpmsg_remove() nulls cctx->rpdev before calling
misc_deregister(). If a concurrent open() enters fastrpc_device_open()
in this window and fastrpc_session_alloc() returns NULL (sessions
exhausted by the leaked slot), the error path dereferences
cctx->rpdev->dev causing a NULL pointer dereference:

  Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
  pc : fastrpc_device_open+0x1b8/0x258 [fastrpc]
  Call trace:
   fastrpc_device_open+0x1b8/0x258 [fastrpc] (P)
   misc_open+0xd8/0x1a0

Fix by moving misc_deregister() before rpdev = NULL. misc_open() and
misc_deregister() both take misc_mtx, so misc_deregister() will either
block until fastrpc_device_open() completes or prevent new opens from
entering it entirely.

Fixes: 7c11df42d0c7 ("misc: fastrpc: Fix device_open when no session is available")
Cc: stable@vger.kernel.org
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Tested-by: Tyler Baker <tyler.baker@oss.qualcomm.com> # Eliza EVK, EL2
Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index cdc2627bdaf2..da0b2333a3ca 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2675,6 +2675,12 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 	struct fastrpc_user *user;
 	unsigned long flags;
 
+	if (cctx->fdevice)
+		misc_deregister(&cctx->fdevice->miscdev);
+
+	if (cctx->secure_fdevice)
+		misc_deregister(&cctx->secure_fdevice->miscdev);
+
 	/* No invocations past this point */
 	spin_lock_irqsave(&cctx->lock, flags);
 	cctx->rpdev = NULL;
@@ -2682,12 +2688,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
 		fastrpc_notify_users(user);
 	spin_unlock_irqrestore(&cctx->lock, flags);
 
-	if (cctx->fdevice)
-		misc_deregister(&cctx->fdevice->miscdev);
-
-	if (cctx->secure_fdevice)
-		misc_deregister(&cctx->secure_fdevice->miscdev);
-
 	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
 		list_del(&buf->node);
 

-- 
2.34.1

