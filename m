Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794841168;
	b=x37Ad+i2E8QUYdkh1h1ck4aGvpyt0Qb8gnoJQtHA0eDaW240vdWugNcl5gh1loZ/yTN0
	 X6lr7wHdoKyvjtIqwfIy27IoagEStL1CqQncXLNyH0aQsoFw/edy9C28qZqFerY2TVtFn
	 IO2SP2JZHNxiB6sNCoGYwpcu3iOp6qBFx909Y/uDB37yD4h7PGbeie16zE29dTNRO6QqK
	 Wy77ukbpkBPTQBIsUhMe6CxmcO4owWeoXMt33ra7N0XIxJfP1sKAn1qzpcClLfsgsKnjs
	 YX3Vqy32qGOg+uUeAf8JPohNWpL8CThGAVl0qTt/a1mFHZP5kfwuRcUAHmS2cfx4nXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841168;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
	b=1AP8mfQ0vdydiWzUxM8237+j198+lI38Tniiv37lKaFldg58eV2XipvAbjeJCqqeuHpb
	 DrchY7C6Fu9hfG3bkC8qi9K7LmBcOyRshOytqRvPDZguUBy9insz+H+CIcegjcx6uzpXA
	 f9NAU86EoqWPCVsEjWPwiNmZ4d9b1v83VVVIK9NnZQ6C30nMg8wU7T8DDWDzwyd2JzSVK
	 +/Q7VaAeVrYU4fumzd4hDKH4egv8vxUQXoKdq0aRV5az9aiqI9vTH6jR7wqiijp3EweWr
	 VERieHlbO8GqFBSRg60M/XIFdaQf75/V2yV/W3Bnme7kpNu/nv+faAltwvLRKQG4biQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZYLPIDX8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4288A606A885
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4288A606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bOLB7abM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZYLPIDX8
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGDrcdS782478
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=; b=bOLB7abM4jkAfiKf
	yGiF+Cx5NxsP0yPKDepANS4vsPwZqW0hSOkhqfTAlydmEeeOTeOEIHWXYj/B3NZ1
	7xT4h4Jhv2TX+aW2ZLtXc+G8Q4prBJ2v29xIv+pEXWiVOKkAa11Gy0Q2d6POvW68
	pcvWKiYCyT2wry47Pc9qetrNxT6RHvB3NIb/wvX9vSy4Qg6aIRsnlTrAcXhmqhhX
	+RZm1LEkiVlgBDRABJcHRnJQrXac/8XGrOzMfuiMl/MIdkNqS3jN25IZKcF5pJcO
	pwEtMimM2GvoZTNaInvy58ZD31B7lTDWtBa8Gp3SUMMxgXfGNdV64J8rn48YGFli
	spjZzg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgh1wx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:59:27 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-99082f450bfso1502050241.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 06:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794841166; x=1795445966; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=ZYLPIDX8EioUNa+jjzCWaM4+GqCQkWeYgNnsiIpR6GuovoeMUEgDGhc61wJWWKeRQe
         /dYRB6wE4lPSHjsFEG1CzVLFNk0DgFJnr0jM8hKrOrsULJ+G0i6JC35+TBBY6vsa9QKo
         agNoJwVDh1ZZdLaURkMjyfzw4ZF4+mjzTqioYvZl9ZsHh5tZtHNyxLAinyJ2i45MOh8F
         0TjT9lZrDrId3fFtZgTDYobUtccdCQ04cA+nKVNjSFiH86Fifil3oPZ3SoyQ/P7GJ/qD
         fEFu04T09Tz+vKissZsC31y9vd9qqfvtwV3XRe5QHy5gbWmGM2VyUN2wxG31jdutDZz8
         q9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794841166; x=1795445966;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vz4fbcxBlTI7N7eeFtB0R00JNlan+aylxX+yRC9l1j0=;
        b=m2Q/MtiFRuwuN1TZPeDndlKdQgizN6K7chELBuX3xKXIA4oR5n0bC6HN9jcNkK4Q5Z
         COW20wGte7jozedPHcr7lsmXfd1UCZ4tzjm9WE5C9FeYMBuLLahskTrt1+w37p/pSTX9
         aP97d1D7E5iKa2G5iZUKYHXHETOcVWUtkR/6H2AJa/7+HT/bYl1KGkrvdYIF/ZygNTiW
         +Hxe0Qh7FzyQYMFYX1fmssPkVqQnN8JrfijLlEGrqWYvnmvUGSEzKD7EwMgguCbz6R3w
         +NCYstUDNOHYFZh1lHLW6Db1B00uVLFCTW1fyVRIKQ8w6i23FamEIvo8oTEZVUslXPGo
         lcog==
X-Forwarded-Encrypted: i=1; AL+hErEnAyiYrVaH/H9AWRmQ2Fapgpri0xUQdpv0lBIcB7zESXoBxrsuhMh/iMydrTLucl182Dl1I+xGzjz164Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z9UBwWZMFQgsTGyQghOZIXMG0k8d2mcObK82gqMBKjPaNXjSMM7
	1uUiFNLIPsVql5g5dwLuEHCEb8S5Ln7p95oWCgnz8mgH1iUH/KEtYBe/+3XgLDA7Jj+Ony94keY
	9fSgOOPDrkxhdjQj3VMlDOPLUSkngU7R4fRmKTFwq36hvUgjeq2PlXkQ4HQnQJoQUXDE=
X-Gm-Gg: AYBFou0t6cYoErSpXOJX4qZaLa8GMENVMxsHA4JI79ZjmmlokxHvw1eAvfyj16Oy+q7
	mJHHJFcqIEtXG8T+Pyaxr7BHlu6PnP5Ey/hnt0i0PJaeEKjjEO7R1MN3NO1Av2p73g3gg7SYx79
	Nf3C2fsKImqHqse/qNhv/V4lFEUPL0hakUoSczzH6hG2x/WIlt/ZRqwNerAWUoHRQDONVmi2qKR
	TV4ot5apTSVYDyIy4S8a9Xnpr0s7GbWj0pUxeYi1580E7+7DZo6YVD0nbsVfcpfJDUrG0lZ8hRB
	AlidwN7ErxhJCriVRAmIfCAmkaFAVTgCRA+Bs5cmSwgrHhTilRc8AAl+FMIYAXuihNrKBm1iF1B
	xzW363bot9iQrRNfVJYODU+vC71IlLilpHQncEUIprO2CFqp7Mg7+gOY03fR4y/LjUSYfJZLthz
	YSX7Bh1HKm0JgOpw==
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604788137.30.1794841166490;
        Mon, 16 Nov 2026 06:59:26 -0800 (PST)
X-Received: by 2002:a05:6102:6e88:b0:7c2:7a0:ae28 with SMTP id ada2fe7eead31-7d64d874f06mr2604763137.30.1794841165909;
        Mon, 16 Nov 2026 06:59:25 -0800 (PST)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571d7e87sm203948115e9.3.2026.11.16.06.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 06:59:24 -0800 (PST)
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
Subject: Re: [PATCH net-next v6 1/4] net: qrtr: Allow the host QRTR to
 assign a unique node id
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Eric Dumazet <edumazet@kernel.org>, linux-arm-msm@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>,
        Chris Lew <christopher.lew@oss.qualcomm.com>,
        Deepak Kumar Singh <deepak.singh@oss.qualcomm.com>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>,
        Juha-Matti Tilli <juha-matti.tilli@iki.fi>,
        Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
References: <20261114-qrtr-multi-ep-v6-0-2eb9885659e2@oss.qualcomm.com>
 <20261114-qrtr-multi-ep-v6-1-2eb9885659e2@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 15:59:18 +0100
Message-Id: <179484115880.1191469.6312889000780599157.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794841164; l=2289;
 i=youssef.abdulrahman@oss.qualcomm.com; s=20261110;
 h=from:subject:message-id; bh=tfSyqr/JVICb+gJ8r7i4p9ZH7pgvqyq8dvPpEHT6sQM=;
 b=kD/xci+qoKdonWMirYRCjPRULCCHqoSo3t+/4LvbeHgPxyp3K1S2tDB5PInEh8mC6gkvdMqN/
 gYgFqDd2UsiDqfjgXDQNm4LLbrHrVFLoTUJYNFudBj58U9gOKZBgCZa
X-Developer-Key: i=youssef.abdulrahman@oss.qualcomm.com; a=ed25519;
 pk=JsDnG9UOJiLmu4WZj456fEwZASBHFVClDZ4KZkiVFAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfX5tOiLbaXgUNN
 dRJw2dAMcMDOnZyeMVW8rWtAP2gEusKtGK0e6qJwL/Sewq6Qu9XJjOJhTwPFglfifw+7DhFn39F
 aR98QJH2PexWPeJc1nP+5+Aqdw+29CU=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afb1a4f cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=-dTT1UR66QJk1rbgP68A:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: rr4WcGrM8-WI_LY1dfEZnzVUSIOMCPYP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1OSBTYWx0ZWRfXxbBnIcogykZL
 1p1rsvvJ8F2R8T5xnnUmnJCv+doxkZvAM8uzkGHfS1QiJUEFgbWAwjygzOpeTRD0UPgOKeOwhka
 yyuXFuUzXIBMkjd5eKQ6WeSCbvuFRyjw63qAJ8LTVcQX6cacQuGF8nZFiotDo2OmaM8bdFw3v9Z
 BoaGJU3Fk6huQTUKuns8ocQTDORqY8TJ/4WFMfAp4CDasapdim09hJ5GsRakbT9JaTZUJaAk3Af
 pIpmLl8I9XAAZVWDThtzouD3HKja0RYS1WNnzR/th+C53sYsfP8JWP9rf9X/3opP2vmaMduTmrM
 f9wsUjsRCIVg8D5hr3nfqxb8HNlS5Xa0yQuIbSQZ038IyRp788yBGpd6Y0u3Jc1DoC6LLbpktob
 mWvJslSyMrVR0EHTR4sqglAt/F/JE4zLgZj8bCZam0rbeOtSwLY+ZGw90K81V+5sMx3uypGmjN5
 mCi53JCuGRcCOY+Plew==
X-Proofpoint-GUID: rr4WcGrM8-WI_LY1dfEZnzVUSIOMCPYP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160059

> Currently, QRTR identifies each remote node by the value of the
> 'src_node_id' field in the received packet and uses the node id as the key
> to store the node to the internal 'qrtr_nodes' radix tree.
> 
> But this approach comes with a limitation. When more than one remote node
> share the same id, then QRTR can only add the first node to the radix tree
> and has to drop the successive nodes with the same node id as the 'key' in
> radix tree has to be unique. This prevents connecting identical Qcom PCIe
> WLAN devices to a single host at the same time.
> 
> To fix this limitation, allow the host QRTR to use the node id (nid)
> received from the endpoint driver during qrtr_endpoint_register() as the
> unique node id and use it as the 'key' for the internal radix tree. Also,
> store the received 'src_id' in a new 'qrtr_node->ep_nid' field and replace
> the 'ep_nid' with the unique 'nid' in the QRTR control packets if both
> differ i.e., an endpoint driver has passed a unique 'nid' during
> qrtr_endpoint_register(). To maintain symmetry, replace the 'nid' with the
> 'ep_nid' while sending the packet back to the remote node if both differ.
> 
> A node can also bridge other distant nodes, so the source id of an
> incoming packet is not always the id the endpoint advertises for itself.
> Keep adding such ids to the radix tree as additional keys for the same
> node, as it was done before this change. Otherwise the bridged nodes would
> lose their route and qrtr_sendmsg() would start failing with -ECONNRESET
> for them.
> 
> Currently, all QRTR endpoint drivers pass 'QRTR_EP_NID_AUTO' as the 'nid'
> during qrtr_endpoint_register(). So 'ep_nid' and 'nid' are same and the
> routing behavior is not changed.
> 
> Finally, since qrtr_node_rewrite_ctrl() dereferences the control packet for
> DEL_SERVER and DEL_CLIENT as well, extend the existing length check in
> qrtr_endpoint_post() to cover both types.
> 
> Reviewed-by: Simon Horman <horms@kernel.org>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Reviewed-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
Tested-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

-- 
Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
