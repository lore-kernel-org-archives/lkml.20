Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101809;
	b=yopxHSDs9+Av8WjWVvBzYn035N54t3xnPDprqS5HljxC/7wuzNy6V7UvuQ3cDt8mW/bK
	 LVWTEoD7eeAikuEfAw/SrecZnktKbKIdDMSu620pdOY8LMpeM1lEsFthbTkP9nBAXtmlF
	 sh/JKBaFZe+pH/U+U2aH3g4QrkJSA2D4WyQ+NwgJNJ3u+7uFcyPzZeYRbALZdJ4+yTC4K
	 RwzEVtJn1MnNgjoDFVatquYAcy9yFVm9WTLHOFR6exeEahfEx+6+SYLSopz/AQ8voOq4C
	 /hsGsnf1nEi/pZyyMO4sFUXOLxIeDgZhXibwL1u1cwkRjuL74HygV5YW3JacTH1axag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101809;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
	b=vZnSz88QGYPqUMPy0OaXk0udZTJkBP5LEasNG5pEXhxWY/IQWxnL6ugYJtdpqhgDomgF
	 IC3xLw91KDauqzvYJTDhRZqG2LblMxWvzpXJDB9sYVUTfQWvAD7/eQJF0mVfCfbAwXNVa
	 qFjzLFYlO2o+JzDyfOQqMY44A74a5e5A9GZNVulz434N4RsNqWaauyTly2iK5hVA7Z3C5
	 DVaODh6axFcPgKY1TeSbxv2oQIrwSvbaFCIJLKBQjcO5bZJBHy323/vtFLZzB3/csDBAx
	 5CJanT3u0F4TSbVPMY3bg54YM+kWcnsd/VgbVkGXUvyCznXwK2Ek+yUic4atHwINyZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOn8RZOL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FVTWW6HH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7372606A331
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7372606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mOn8RZOL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FVTWW6HH
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3dO432322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PkFYMQA9efe
	d66cH/akGO8FsOX46tW0maNvLeqNarWM=; b=mOn8RZOL2DSGU0iRzZHIFNYMhuT
	sxk6zhcQAMrx4SDF80xmvnG4SFPp/RB6e6L+kJWptP1YsxNvFsBMSc49pm4NFaym
	pM2HVMXcLD0psbT6ynTIybcqYWtkkS1sDcc5ixgflCbVnvCuMQjYX3PmqrepQSrG
	pSdsCKgB9PsfcIgoYsGnbLnfC8FYG6oqoSBNZDOQQcintMF6a1csSU0y3McYsoUp
	Mr03yCzOePoKodMabZoOqqHU/K0/mLf+bBr0bSf9rddHbi2vPILApd5i6FbxpLm2
	5WFW7U+rPP5kYmc1ogDGigG6ltPSB2p2THILlwXsd8+OLg7NZa2udBPuBog==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54km71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:50:07 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30bcb065bfdso7196774eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101807; x=1793706607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
        b=FVTWW6HH+gXB0r5GLy0A2FbpkAXLlYPK/UlAAFO6T8wS23hiN4u+LQLbPV+3cots/k
         aNZJyhQuJyldgBodeKL3tjdM38x78JDBYfqI5G1FjMEsTxQoaX8WofG+SVA2cxK89uDz
         MIUmkGaL6xxbRxtWxNuYcnXFfNB+2sTlHBaMlSbU6wxdBychp5+C1ztbqrOTaXIcOwdH
         fQXqi5Tc5xT6aFbu4aZfNi0+bQRjGQ713zAHYFBZzdJfJqSJHoj/6I56Xqjrl+9UydRB
         laYQsZIEoMubqI5uR22e+SYKly4et9TYWHKDUOs5GmiFedxPj9E0OQRdTlMjMDFQGi61
         XE+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101807; x=1793706607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PkFYMQA9efed66cH/akGO8FsOX46tW0maNvLeqNarWM=;
        b=MI2RAPNblk5upmhP/h384jKKfYaNkUqmFSbXbIhjTJLVOVzK/5jddJDi6WXsLO9e63
         1EdAacMlSyYxJJat6O7HTvLJ2pOaNxeWbSGpJm0CpHs6v8H3Czx9DgL+Wn7A3S/DBbrc
         oFWU5wlfV+Ov8p2CmGlnqAETHQjrs/5goqiZIvvFw7STx0m5cfV8rHQYVKU4X0EzkMn8
         R4XHtgdd0gC1LS9+W3X7e4eZOrHAJ6WEMvsqoNgonTGp3luAXT6Ea4ybvM52pnU2QJkJ
         dxWxz16KY4Zm0XjqM8kX21nVEcfV5bg/cq6f/0iDizCP2mMQQvQsIdCTkl4Orf4wy9sp
         UTrg==
X-Forwarded-Encrypted: i=1; AKwUvBxNtlBLEfBd8TXi4aMDA5SHRJSSorybDUACjDdfUH5LoMDi7Qgd+qVqbFpJtpjZTxrynIql42rM8EAYQEc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0HQg0p0wOQp3r2Pvh/8Z8C7jISigNYNJsCvrYweSoIxvoHdeP
	f5L2+DJTv1b8vEjsfkOMIwblDJSA4ngXrIZdkz5GF6BCRa66qnuV7B877yy7wFgZSe75hgFExoB
	5vyJ2jVc5A/Lnu7SUVGCncCHZlP9/ybGRNYIc4gjvsVT5WaTShVzANmHgZZ4G/W+Dwak=
X-Gm-Gg: AYBFou3fC2XdPiLnm8FydsI5zI5Q8g0KpnXEwMq0tPclTds6E8+3XDzrKwXayaZlCpq
	+NwsNPskpunphgVHZWcVf5zgFlhG+i9D7SdFhu2JbvF2+5SpJgq+LNaq6fBqmxEpNAVT7d4Nr4Z
	Lk1n8SnkKiRkPnRdS5jlPW02CpqnqLWoIXU5+IxxR2iMhn4tKjdpX43Zszh4a3NknjNHR1qfGyy
	vGrIcbMpV20XS+yXoI773nHSNkKUxvJmvWd9P6/wxFPQRIk6TqYgOlokvuhk6BODa5ycDdALi4h
	jK4+Emyij5TSfh4hwsJxqa5sDu43aNJjwugd5w6FC5M6qNbrVLtuamMnDn3L5sLHp6UDN14L+x6
	QVF+L/9n6eBOgj6iiGU8uK9WidVe//KwVdx/ouhx/NrTphs0HbCRH9IhBgRVTt7oFjqsRZqNihe
	EIG6ggPojFeWrqcp1NpA7eIA==
X-Received: by 2002:a05:693c:820b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-369e861c214mr15193451eec.28.1793101807131;
        Tue, 27 Oct 2026 04:50:07 -0700 (PDT)
X-Received: by 2002:a05:693c:820b:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-369e861c214mr15193410eec.28.1793101806511;
        Tue, 27 Oct 2026 04:50:06 -0700 (PDT)
Received: from hu-sivagupt-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm61918825eec.23.2026.10.27.04.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:50:06 -0700 (PDT)
From: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>,
        Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Subject: [PATCH 1/4] dt-bindings: arm: qcom: Add Mahua QCB
Date: Tue, 27 Oct 2026 17:19:52 +0530
Message-ID: <20261027114955.1266499-2-sivansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX1iMOiW9rMVqh
 V0B2kcK2sn/1nC3zqwRCY6hkRiwiXoJuc4JHcwO7haMf/wkPqZhcF6Y3KsvKySF19dOILU1dbdE
 Jcaq4AzoNEsG44bVWzAsGMmmpLyN1pk=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae08ff0 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=WmEwIusUxj_G99g7Fb4A:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: LNI0g4LuTSJR0jIqCLxocrrbIwgEfylZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX5ZOonnOPu8HB
 vGbYRXT4rgSJtUnybMuebm/1f/xhcqOBTgOVTKECPiPyPpkyF6XS6mEFHD24iN9VdlPyAWBn4Hx
 L3XObfY8QdbvB3FWXj5Bt7RMdA8qFZIjvg/1ZbvmRHiWfa9Jb+P+/igPiZSly27i9d81LMhDG9P
 3k5mqzCUCTAHkA9LOSKiVnzVklGq/znfRgKYNDwXRLlTpdOZxe5YGUo4HTZ2LcmDyxwtHcA//IV
 H86A+MiHQwZPcLIS/qG6SHon8NcgOlLwo5Fzof1+lmFHnPfeMNJVPXKmwJWKSGWaqLRk/iy61OF
 VUrQP8rBfS2wpeFK6vQQxCvz9p3GDLQdl8IITmlBam536OvUeAOflVMrjXyx675R8wmNIcRIjWS
 1krmf6RBcKbeL8PhdiMRgM/xog8mRXpX+Iuld1aqJFJHGLdcdN2O669Nse4IYzXRYc8MVSXRAhs
 ds0YhGv2LCLVLmJ6orQ==
X-Proofpoint-GUID: LNI0g4LuTSJR0jIqCLxocrrbIwgEfylZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270047

From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Document the Mahua QCB (Qualcomm Compute Board) board id, an open
form-factor Mahua board intended for compute bring-up and power/signal
measurement.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..933a2361b5d7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -192,6 +192,7 @@ properties:
       - items:
           - enum:
               - qcom,mahua-crd
+              - qcom,mahua-qcb
           - const: qcom,mahua
 
       - items:
-- 
2.43.0

