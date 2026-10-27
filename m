Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793112067;
	b=CXGaQ4BNrnVAStkonJOZaj1DRlWCh7p5iVr91ZPz2soKMuDndQJ5+VPq7x/4wm35N1R+
	 EAZy1nPMw3oK/qbmS/tHS9iN4LUJT4rT1/RBNyd8oefPMQqkkYwX7niPfE0dcrnOc8XZJ
	 mk4oR1A2ltStqVpNW7SN0NOM2yWiwCtWvpicHFa5YpBcWfkSSW9dvNs0BPSj5PufaP95I
	 cwE/DrbvD6Ial+LJXbA8W4J9y+nE4A17Izq8vFBLjjg+9y3pqFA0KG+Rfwr1payfLcTvC
	 8+lpZPC+YCXiYyvtrZRq36LfR9OE2Ru+n9WjAy6R6ZAGb4nK/j/TqVwA9ZGjcyWRRYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793112067;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tJ+CL/5XQ31zB1tm/a6298VKrPjYPjRATx64g2n2nTk=;
	b=fXA2+o+GcWds1n1uUdZl0XHBJKKsVY0FvssAs+oBaOW5UxBAQFdRiaK3/x4U2JDLC8bH
	 m/shr442MhN0nn9/3cVZckdkwdgQ9yQHOnVy0pNpjBinsLmHgMgUzdJqUNIRXy4ywBHHv
	 o8MntMfhIb1LwVPKBrnqABGmZamT8gNUMNKOHAvgySnSd0qMgUAILDJLCkvkMVjG1TpGv
	 2J4R+uvAcCf68oCm75ZodSWYlL4cf1zS71HW/OmuoRLLloiCyAcp3xF9r8nrYViK59ycR
	 j3orXGEMimiOPyioV9mhHANSSIsrCx67BCG78WBaxNSsR519rVMPAATqvXTNjTlbD2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ0U9vEk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AS3+P9LS;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FDC560A260C
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FDC560A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZQ0U9vEk;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AS3+P9LS
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RDoRLg2397420
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tJ+CL/5XQ31
	zB1tm/a6298VKrPjYPjRATx64g2n2nTk=; b=ZQ0U9vEk14c7EmZYSr11cqlADsK
	D+wsHP1D7lrAejlMV4UVVHVXN1Oyenpv13BN6aan5MHS0v+4DdZJ0tUtfcwyFzaJ
	9KZgozSntZqiORHdogvHQn+cJX6ef0zD8Z3KBgY9MCosBJrX1Jebzs0Aurq89JV0
	nYYyQKf8w/yghXAZ9V6LQ0RgdhnKXAnIkZQN9vt0u+o+J6COHMwGFDVLnVcYQVKa
	qyI/o8OXIA2R+6AoEj6I9BONZTvkChPugBdVQGGRb4W+o3pEqyZMjEOse805Qs6Q
	knW/81J6lrqdNX5vdG14939kXEkRs4GdVbPvwybxa8PdnRumZd7AC9XElOg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjst1h3qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 14:41:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f32050e72so999703185a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 07:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793112065; x=1793716865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tJ+CL/5XQ31zB1tm/a6298VKrPjYPjRATx64g2n2nTk=;
        b=AS3+P9LSI5sC3BxITxLic6pg+tWnh94nMtnrppXd4aALuQyXPFL7kw4zgpQKy/jO2p
         s3EUnhX+Vgj+vgGmW5rbEAQtYNI5qj2h+ncgk+64Xniqzz3RBFxsVFKm/Tr0T/N2n3hF
         wooDVX5DMyAyv2a88IsEHmvRaG0Ozle3wBRgPILxrvZH71HhKL42Vt8bGpBx9zLumM2W
         NLR5XJ1kmYBqRiDKHpQK3S/ZKhSjr1JN27ekmygm+kmtgwqx4RGTyOTuBq9kaZA/X36Q
         kL3CAqLATR/41U0fl7oLkFrCme6tMYtfTOo7Tagfe2Jnttx4f/G9f+LI1f/+3aLtMlOJ
         yMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793112065; x=1793716865;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tJ+CL/5XQ31zB1tm/a6298VKrPjYPjRATx64g2n2nTk=;
        b=T6LnaGM3qprn03MgMLlvwQkzRnFgXCnAnKggtBcqCgFeNkvACWYqoal2U1eHsSJ4Z+
         KgK04E+lPZkJkTdC7kizS94p/zI7QpYg4vTCu9BwYyqJySwkYSCTA4Q4DKe+7JdQMOjC
         9uGOkuuNuU59h+89nG+9HG/yiOx5s4AXeda6YhwEGpSOimKc902w1lK9Vt5E777ORJdl
         cyZLJvVmwdi7W8Qp1FEWQhfPIterTa1xykUCLxsCfxhy+gxYHaNb4TcBDU84uYaNmKwx
         a4zGdhzuDLmSlSUdGFizLbmDvQ86VmwHIHAIddxOY4+ZpleRIoNEBgcCvPLfAetZVo3p
         zfFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXz4MERD8rXwIpW5hhU1JJfwT7tZEd+fWYBQJ3Xz6QoLQAYlU9z3HJCktB/J1xnhTcd/Cs/cbXOjmEIyk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKccUCt5YDa4IaofLB93OJ/MDGyU/YuMQTNI3grxk4UVD53/+fi
	04DxGEZCB8U0zibHP5nKlnl81hRR8U/VPllCRSU12mtCWHa4O/hO5RPruE+uODIiFHpKZm2gT0k
	JrvOC3OBEqeRyDHUvx8rsNHdG8yf9OZesY0DHpgdhxleVqjnroLhPxB+vEB+KCVhe8os=
X-Gm-Gg: AYBFou2Cd6hsYocPmGQtx05+FsTSXWH7+dr6CWhr2PCRH6PDwTgq2ayMIHLMiMnK3mn
	Mf7woXaOguwcFr41Ng0BXAuuEpw+3r3SosLDafDMtTCFj6FVsQiSOKentTbtk1EbF7yYyHmESrn
	2PvEc/UGod86DPOSO4g8g6zBjxAYXudi/8LXYgExoDM5DYlhKKevhNs7/Z+YcWpkGWxJPq3QHQH
	P3fVk5CKMC0pDz+C01kklTrzUFNKwmX3PzG2P9WYu5fEhb3UbsySgjbvRwddNyp631RYn7YhbJC
	SL5cmW3SnC9a+3A1kE+1fUguhjGiVrv6mK3jvqEIZ2MAPjLAq7VP01ddA4Cni+AgPSk7fOvk6l3
	jdCCCZzoHslq6P8wr+e0kJrIk8foKThs28HYxnqgxTtEJwyY0r0r1ROehug==
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1725354785a.33.1793112065139;
        Tue, 27 Oct 2026 07:41:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4592:b0:93e:bcbf:4ad with SMTP id af79cd13be357-940ef8d9147mr1725349285a.33.1793112064681;
        Tue, 27 Oct 2026 07:41:04 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66bd3asm468527766b.56.2026.10.27.07.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 07:41:03 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
To: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>
Cc: Adrian Hunter <adrian.hunter@intel.com>,
        Kamal Dasu <kamal.dasu@broadcom.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/6] dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
Date: Tue, 27 Oct 2026 15:40:39 +0100
Message-ID: <20261027144051.249211-2-ulf.hansson@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HJ1WhYtv c=1 sm=1 tr=0 ts=6ae0b802 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=h7aNHqOhPKB91FvYUefsSA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=Q-fNiiVtAAAA:8
 a=EUspDBNiAAAA:8 a=Bwok4HuJcqyDF73gS4AA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 1JqcgIsSHnbr8MTX_DQeUFsL3VniZCfd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfX8YA/L+vMXZ/8
 aKtw0zPNDyDLp0DDtWB8eYfy6MvzkTcJ20faqtW0EVEhM6x+RP4dRqZ1LsWFOxMRkdKj+cygDGA
 qSTsIM0+N7OfrR8ywabbkxT3zZlQg70=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1OCBTYWx0ZWRfXy8lKgMKMw5/M
 WkMj9XnvQxAMj9J6WEfmDCRpIAGKKL/fHBaAcvmjD4mu7BnzDiTFZAxhAzNDwbu+LBzVsq2KEdz
 o7mgIRD7UuwIN4CQ8inrkv5DYyLxlk2kEwS8UlMVOQ+qrnjVH16xyoj1EVizwOBoIa289HPeUPd
 4UJC8STW1mLAKlYEDdkOlcyrYBFpPLaiYxhfZTwWMIW241ObRfebl5N6VRjDTwPVQEZbOxhhiYC
 JDc89zagywrfKt6q8S6LZ2/EKYyiVXdXFLYTr0+QQBN0eMudRsOKbhWIvb7PyZ2QZnyn4TTTluo
 SyJGFS5RS5UAkLWI/oxBS2BbqU+CtqE9eiNhq06FLlgobxQqyFCrhubja5QvGPYABCqHFucdEn1
 DGrvZ8KWDBc8O1DWPEyS6xVG3ZeV8kI/wdcZxUUzvTmZQGVzVKjnxKsyZzlebbbtUapTKcj5phK
 Wg0471cjjx5uN55sCJw==
X-Proofpoint-GUID: 1JqcgIsSHnbr8MTX_DQeUFsL3VniZCfd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270058

From: Kamal Dasu <kamal.dasu@broadcom.com>

keep-power-in-suspend is currently documented as SDIO-only, but the
requirement it describes -- preserving card power across a
suspend/resume cycle -- applies just as well to any card type. Drop
the SDIO-only restriction so eMMC and SD platforms can use it too.

Signed-off-by: Kamal Dasu <kamal.dasu@broadcom.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/mmc/mmc-controller-common.yaml          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
index 8b9b3b036129..2fc8e06d5ec9 100644
--- a/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
+++ b/Documentation/devicetree/bindings/mmc/mmc-controller-common.yaml
@@ -301,7 +301,7 @@ properties:
   keep-power-in-suspend:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
-      SDIO only. Preserves card power during a suspend/resume cycle.
+      Preserves card power during a suspend/resume cycle.
 
   wakeup-source:
     $ref: /schemas/types.yaml#/definitions/flag
-- 
2.43.0

