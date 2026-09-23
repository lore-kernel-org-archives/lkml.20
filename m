Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB1E47043A
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790152827; cv=none; b=npX6MX+iLjhO42jKY9OAZjTKXfY3LqdKUcr9h0vt8K6LMK2hU+QyvW6TX6xC7s0KjlLZ6cImv0XKZf9ZW6qVImOdjNX2peaRBTKicB8krmsKl8hlUKLXnIHXv25hZ5iX1P9Pf/UR0RoIx/bHnRA2mPKDsQVzy2GwVZZbT0xLDiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790152827; c=relaxed/simple;
	bh=TpBJy16S8qnRUC5bjeqAKGF99NjM6kdKLzu6h6H5AgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iVOiKCNJHIhTh8s2vrqMERyq7pcEFVXiFTWOPxx11jo2PEU2Z99h52N2Aq8PZpArnInYx7KpkWj6mjkqKTh5Bbh7bydlcGoygJFa5OIyhMKHvwKxoK88t0cJBceON931YhAGfvSdQyraf+r7fhDK0OuF6zlzHgQzlpHuTLtoGsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F7wMsSmd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFswQ/KZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F7wMsSmd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFswQ/KZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N8JZ3P2028398
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=; b=F7wMsSmdgQjLZvU5
	2CCvGGk7UpLvzXxhElnevwvA0wsK9FI3rJEYg/KZD7hXBDDr3zX2kwhd30kFL4yX
	pL7CHa7xVSl4YTWqhv6e/ENys4ZL0j4eF9hb6xCVWB6IpjM7HNMOnaKtC+zpLTwI
	uuGAj1aCD1L1LEQ1GVnLHE97WPS6ojYWH3Wyz9LAt63jbITK+nxqWk0YT44jaRh7
	RAh7s2beQmihwxrKf3SRvryJAcDrG4liVjFCvE+tD7thHOP+JrjdB/hJRb8UV33S
	8BGtfwWAfCawmZ7YvQjfIRxV5gLZQpzPwPfdW3hCDcDfHF/aBuGxjYEeJK/nKcze
	FH/9ZA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c32w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:40:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-32850005b6bso831219eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 01:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790152808; x=1790757608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=;
        b=PFswQ/KZCxnZgDZFuCcQKqcuDAY9rhZ64vMyom8EUdrpg9wfG9Dx/UUEmocKdUTJUS
         gF120xekdgn+VqTS1QGruM+BpDvZhrnNjNkBPg4fgef63rdT0C/BPuwrWXlNrqJ5GTtW
         ZWsydAkhyXNRJ5tkJGfU62DWULCFJ2LMc2HBFwRgYNYGki3Cn5IBzxWkRoMOW8dXJtgu
         tZvrifjcdJuib5zCEdIx1NpUAFAwhoTroL7/E7WmJX9wbBCOjN55SvyPoUDpcawrKN+M
         OVOf3nPscgqI+yU4jvkwLcwoHEua6BajNTrlimbLCc7eS7Uz7bbvBseAJfVy0Nf8SpuD
         Gn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790152808; x=1790757608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ottca0EiKIyP7vWmuQi/4WvWfdgC56k4HVx18P6/hbY=;
        b=I1ukO/t16t+oR9QiVDSpYs0bxUrCYjY9vO79dIhpmO9iGGyPUZCdhMor3gW3AGvXBT
         eDYYefaPc90iSwNFH9kMr0zQ+qQuiZ+QiIRdFkjYa4evWMuUkx4Bn/ypl2MzoqL8zZJe
         NKI0cmty/QhxXdsMaAfYm4wJjcLkyqz9SGkJcOK2ksL/Ycx6dGdqO71DkeO4E0rSbzGJ
         G10nzs7W3Vs8tzR57STZ7mfO0Lsa7PgRUmu/vpOVDgCIEfr4sAL5X0QSaSRhdm4ZAXbJ
         dQtPQj9+dqDVzV9J+QRTANu8hvZZJD9b4DKWUKk0gh5Z8Ga6iIaY6UE4IYzynewaEixD
         a0ig==
X-Forwarded-Encrypted: i=1; AKwUvBze8d1o/Py6PUjVS07uC3t0B72oo4H7jwgh0aA6CypGpQnY2CkmBhzxm9Xdg25azU6ZBdmAPj6rTR1TAMs=@vger.kernel.org
X-Gm-Message-State: AFuF++lVqrDuWaIL+wwt+hAg6c2WQrltIjylYKAIf65JUHIhME0mk44H
	m86pDZvszdPPOz4b6oGgCViX5qpw65fTqk/CSi126E7zuD9iwoaLGNwbJFuzHPfP1r9P2Muo6Ja
	nm1mlilaQyx7D9aImZHjKrxQYQhGstu2s7QO6vE0ylGOTFIg8oAAbyq9z6JeOXg+SOMx4iZ1Dem
	w=
X-Gm-Gg: AYBFou0cp8+dYaNYCLIyV4F/qxgzqAmIqwaVncoYKTK99SAmVTk3HGb4zWaGRoHeDFf
	ODVfVsdGh6PNSCf5os6c6wi1tPkh7Y0XEQMwquX+D6wULSq4xxlkJNG4WUsIzh7NXpPUmCfnQT5
	8gJrlGk3m1mgEdEE9UmUY9HW4YvZ40vWOZqx3tkpIX9TvV+tiReYUocTFZ//8Mf55OvwHZ3XX1E
	41RVrA9twRKgD7GKPHRRu1xlxchtXWjRc/dN4JtAEjL9a01CE0Ka/bCd6Bn7AlvEaZnDkr29VJ3
	X+4WgUZmKVdwqiso9HyrgBPkY5LUIEUKtGgEMCmw6bGGUNIzJLJJzIVFkYy4zazkwKze3nG4HLL
	5BbxRrub5VLu0Oep8a333Z4yv8KNG9xRH
X-Received: by 2002:a05:693c:65d1:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-33e8c24a5f3mr1854802eec.10.1790152807790;
        Wed, 23 Sep 2026 01:40:07 -0700 (PDT)
X-Received: by 2002:a05:693c:65d1:b0:33c:b64a:3b82 with SMTP id 5a478bee46e88-33e8c24a5f3mr1854783eec.10.1790152807221;
        Wed, 23 Sep 2026 01:40:07 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e96d497e1sm4701275eec.25.2026.09.23.01.40.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 01:40:06 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 14:09:34 +0530
Subject: [PATCH v5 2/3] misc: fastrpc: move ADSP duplicate session creation
 to the driver
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-dup-sessions-v5-2-e953133a1827@oss.qualcomm.com>
References: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
In-Reply-To: <20260923-dup-sessions-v5-0-e953133a1827@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790152791; l=3250;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=TpBJy16S8qnRUC5bjeqAKGF99NjM6kdKLzu6h6H5AgY=;
 b=N/29XZZ2KO5pgju+btB8IieQgG4KOSTd0lXWxo5oi7fE1R/tYC2WmQBPt/3FoOvHUW/mlk4Ma
 ooHExQpQNfyAlOMaLjv+Yvsy7qeMrbEYL09rXJTHOnkEbEpyCXUiIZ3
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-GUID: 2Zgn3BxACiImZIEfaRacfBsyoWRqzYID
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfXyV/D5Cqq/3FI
 P0DIZIPFKXCY3tyUgCCtu1WRk9vR3bFCBChSRCgkvzUwoMwkrft6KArlk+VNcQst7sC2g+iD8HQ
 Eijr8XITl7X4UzdNtOvDP0wo292o3xo=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab39068 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_Cnv2d4ds2Bg63dH_xgA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: 2Zgn3BxACiImZIEfaRacfBsyoWRqzYID
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAzNCBTYWx0ZWRfX8mKEj+GUhU/n
 jP8jGRYFjDxlJUUGnVO+EE4YRzt2PXfnGQpiTCuu6Kdw22zcKvbjt8+0AlVSWPaTjseXEoP1iTZ
 DmZo5yLolzQ029+9MytQOGwcS3RabjovaIYGSgUUQCXPQliYjha+K2PpQPr7fEvOssyISJiyCd9
 wr63lOhhPW1eCfp/wM5ElENfj8n1ubc6MvbASSEzWhx1C2jIO1EJkjI3mwf3QUrp2lsWqw2oi6u
 yWOiw/fnK9IbDHb43C/Qq3fOh5fPXwxt+MCP0/mJTYhXMZVjD9U2rX3Kv3ofeFMoAlnlG49AXo1
 DFA3qPbUS6cXIF1Z1j++v5NUhp4BpGCtdAC/eFZY4QMP601ai7jPN3bKx0hlsqz+DYuTAPyYbDp
 zwCBvtoWDM3npi5dRNh+ktwzWVkH1IWz/OEuzF0fIroP3L/diTq/cyVXmpOeXCO+XZqaDJbwYaT
 WPEBgAKo4Vh4dJsfthw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230034

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
 drivers/misc/fastrpc.c | 29 +++++++++++++++++------------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index f20d3e5ecc81..b29c1fd00de2 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -34,6 +34,7 @@
 #define CDSP_DOMAIN_ID (3)
 #define GDSP_DOMAIN_ID (4)
 #define FASTRPC_MAX_SESSIONS	14
+#define FASTRPC_DUP_SESSIONS	4
 #define FASTRPC_MAX_VMIDS	16
 #define FASTRPC_ALIGN		128
 #define FASTRPC_MAX_FDLIST	16
@@ -2338,7 +2339,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	struct fastrpc_channel_ctx *cctx;
 	struct fastrpc_session_ctx *sess;
 	struct device *dev = &pdev->dev;
-	int i, sessions = 0;
 	unsigned long flags;
 	u32 dma_bits;
 	u32 sid = 0;
@@ -2348,7 +2348,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
 	if (!cctx)
 		return -EINVAL;
 
-	of_property_read_u32(dev->of_node, "qcom,nsessions", &sessions);
 	if (of_property_read_u32(dev->of_node, "reg", &sid))
 		dev_info(dev, "FastRPC Session ID not specified in DT\n");
 
@@ -2369,16 +2368,6 @@ static int fastrpc_cb_init(struct platform_device *pdev)
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
@@ -2669,6 +2658,22 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
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

