Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411626;
	b=0+/KnN37vG+ee8E5fK8pZ/QbLgOQCIxpbk+FBRQCEHyoZoU3EoPdsPpYey8Zb4l8Sshq
	 ur1Y118AQO+mk7UyalMa6CjVv8GDweW9IvfaJQ897/Hgk042wQsTz8j8EwYgc/01RmrIB
	 ixn+IBTbwq+Kn+BZwuuixXZVBNKumTuIbGIVP18WX5uDMvGv74O35rWjfeUmqBgrBj/m3
	 Ec7QHEuJUrd4tPKgPKULEvX+JfnIqD69rz2P01OdCeor8nfANYxmv/MtKSzmazgAmTy2r
	 tnK79tKmSVob06cWwbd9YlG957I4bxoBLe8O28lhl4LAFKBpY+isirFOeRgMLKXWYWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411626;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
	b=4mO2kAqQue5zRJD/QXL6xfYm9aQlGsaSuoTJATouqFoTbefaEFxfPWZ7H8AUauGxz4o4
	 CCMe/Tu/4NQoP4E1NH0YKfiyA/RRIXJfiDLV6i6Dq50kzkbOkObXUKcUJacCkQwGD8Cfp
	 Ifi4MvFoa1P/oKodEAauBrO333zSg4lbiZZ7oAr2wIEpXCVWaVq4fh8dxLmNSzWtBPmsb
	 viKuNIq/WmBPTgAQd7B+1zMRuBsWf2dMqpQ+8HC8Oc+uhBlfNsHVjVRUDSmetRonD+Rqv
	 9Q1zdCix29sW4KJkmWcJkodI+lwckYkL6mUz/dPHZOyoyZbquqIi54TfX5Ir+qh4wIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1wb0lQ6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5350E60A2620
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5350E60A2620
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cxaw0+0n;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1wb0lQ6
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0HYS2651046
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IGCAfUgjVkl
	diKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=; b=cxaw0+0nJPb8xv1OcNihqrICR19
	cOUC/HQjzbHBOYXUQp8NZBtSs09TJ7g726jbczD421vHcwuFl5MM6BQca8bxpTX1
	RNz3JACOR/vBdO9XcTR2RSKWAuBMmHGWHFmi/zk1q44W6z/nWoTtIWdEoDFMFbKx
	yrr/e6iWlm+T5OZpstJVnmfbuF1cKujcnH8TVVXBG0OjfSNkP0/TXgmzmzLGmWuA
	G+0uoUWHYow3JIXCTJMMo8TYAO4Y5OxlDvJcfqPsaqpcxEZuFNd/UIgaUAT0L6+Z
	1dDfQKV9aEu+oVlGH4c83K1DkURBxKfBdXnnueftAyAKPuZPOzOjn9OdW8w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmberv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:40:25 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d2eba20719so615742137.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:40:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411624; x=1795016424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=B1wb0lQ6kbm0/VYXqYyiLYQAv/h22dVx0igTbOy4IRvr81dGXQbxdtE80QF/gyx/F3
         gmMycscsjQvIFn24LUHWLiTr/jDQTG4vbDFo4VOtWzu7YKIOpGXiNauPY5jMAgxrdMCQ
         fmB/II50yO8knq2OGENhgoYMOwUgy/Q5lykD6GgkwxSLzq5H3BuRCpOSpiEnbGasHddz
         YHYTJ7XxNNH7uKBVNT2NexW3rnHjgeRZtmfEtcCUm2Az1cVsTNZH06O87QkgpwiBAF6N
         uqIbLkbQqULZDqcUqU+4tHgzLcKfKdQLEJwHiCdwb8E5hYOP8UL/NKqn5cZD3bkQ4Nvj
         InOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411624; x=1795016424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IGCAfUgjVkldiKZ9QURD1C+ycoP8zoNmSmBmO8H8/TQ=;
        b=PWNSP+A1sgyjgow62stun++9bM6yqN1U4ZVuMTnQg6c0CwxapD8l+/6EA1yjH6Av+d
         HxfdnP0F9LhKpm3IOqkdx/DlaiQpKxe6Lu7k5JPNYJC8oLstDIrg+lbTe+suUn8WqaNG
         z1JknsEUrbpIB0++ObMFZJNvg41+vISSrshkcvJG3GHRbysJGPVUGNkXUTEwM3nr5Dps
         OR7ZqNJR/1O4wXtbj5hFKt4hx9DTtEQzgrEjsz6i4NyP5I4LOCYbVS1ry2uU7kldRrcc
         CRXvdLmdYakkScowQ5lVoo1I+brHa9HtFtJHSkZgGuq3l9noGauZiT3dhYQmtuXSKTfX
         SUsQ==
X-Forwarded-Encrypted: i=1; AL+hErHVRiLUgiyqsmLYWm5s8noIsQwlNPV4mLs6M2YUVMRvhB8s9oEGMa3muBpR5f5Zjp05lrbtmVmC7HYiuNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kiYfhbWnp6wz9Oi1ffVe+QOq3CGAj3h0TeiRe2/furTwhJBPQ
	iO58lVZ15Hljq4bi/+aSCxuQTf2oAgoBvOfUCbx0Kx2FzrPGe2LYJi1DUoP2RpbpujX/sTTxM/Q
	lm/8K4WqLljrNqlkgjVo6OiCVOwXmmGog2ZfhObzlhPu7p5ExRQvyDIY+crfDcV1jxbM=
X-Gm-Gg: AYBFou3RL2ZDmLIEaKYO6rbfCFCeUAUwXLx3QlOkkJZ1HZlHm1YO2SvCKDX9F64uKxz
	yfwOLArBHwCg4a5dEAA1k4i4LpIVg4QryqdpaSpazkrgw1rr/qHowAPORnZO28218firJ2/9CMN
	l6BU2k0g4e9s8p0UOXbRHWz4MimW77okGJmBsjgVu2QW/xt9B65KHeY5AsZJPefvkW9livocngV
	U1Hza1TtHC8kXKoDyHbJVk9MQ+Qvm5ELSRdBuozNlKbLIGvKhAzxzV5BizKv4puWIvQrXAnDOR3
	AWbr1rE+anh7eB0oVOIopk6fqIteeRlMgWFdn4VcsPGT57eO6pE0ZI8afkhSrAVxN0OeayOI8+S
	+H9O/+9kAAPaVEVRzrXQoFUTrUAKT8E+ehO+3n+d4ZSdyP/cQTnRKjkMBBxlgFQgtkAQPP0fNgA
	==
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923944137.4.1794411624569;
        Wed, 11 Nov 2026 07:40:24 -0800 (PST)
X-Received: by 2002:a05:6102:1608:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d4edd181d2mr923924137.4.1794411623943;
        Wed, 11 Nov 2026 07:40:23 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3528265e9.13.2026.11.11.07.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:22 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 7/8] arm64: dts: qcom: kodiak: Add JPEG encoder node
Date: Wed, 11 Nov 2026 17:40:21 +0200
Message-Id: <20261111154021.654708-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-8-atanas.filipov@oss.qualcomm.com> <dvahgos7b47kdbv4wxec46lxvrfny5wounhxgnzdo3uxqlwkds@22fjhubli4tc>
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
X-Proofpoint-ORIG-GUID: fNrmcIeXK8rVO_wD-9TkbpP6X88-5ooD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX+x6RhrjsdcP8
 s66Pup+iYROGQgYLdEIt9++noI4xw12QNtmghCC0WRtqbuFJpTmW0LfTIUaIomx4nrqdK4Q1Xqe
 ub+1NgIeQXb63RKoNHYq9N5WMck/h8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX+LdMwTfe6QRJ
 thYmoq0vDWVk+7NlMy6N0kpoMFudj+6UD3WjgPUp4IP/eZM1J73ZUZg/QZsuTviDSdCfW37YwBi
 dfCVSiGo2mtmfl4rMU9XkfT5b62zDxgCCdhEmh9yFjqnDEoeUdfJOodNJej5rWT04VbKh9+GIok
 sf7Ghkv+wtc8lPRbH2HJ3XWF5ebl0jv5m5gMi2v/lT51wOGOjqHiUEr2NH5orrOKvQi3RQp4pEx
 klM1Lx38Hh2rKz6TB+mom8w5ejcxoJbK2fVFepGFRIKRggQdtOUmRCm2XUwWRoieuzJCcUNKsI1
 /sGXfWSLjq36KcbxhJajI//XBunxuI3ilkFCzK0UtUwYASVhpLIbvdFLUmlOThEEy5wKunz5nlW
 jywW4ouWFMtsYzODyu8kniInuXOH+wx1QZ9AJFWI8GsWxP7NcygcSJ7uKMrjjPUXJJzsWHK5lON
 3Hvgk+a8dDspcpfYlkg==
X-Proofpoint-GUID: fNrmcIeXK8rVO_wD-9TkbpP6X88-5ooD
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af48c69 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=dxASnj8t3s5ti5x4tK4A:9
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:17:53PM +0200, Dmitry Baryshkov wrote:
> > +			status = "disabled";
>
> Same comment. Enable it by default.

Ok, the same as for SM8250.

> > +			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
> > +					<&rpmhpd SC7280_CX>;
> > +			power-domain-names = "titan_top", "cx";
>
> The same, drop cx. Also the PLLs on Kodiak are clocked by MX domain, so
> MX should be listed here (and used to cast required votes on the MX
> rail).

On SC7280 this is different from SM8250. The camcc node has no
power-domains property, and the sc7280-camcc binding does not allow
one. In camcc-sc7280.c, cam_cc_titan_top_gdsc has no parent. So
TITAN_TOP_GDSC is not a child of CX, and a vote on TITAN_TOP_GDSC does
not reach the CX rail.

I see two options:
1. Keep cx in the JPEG node.
2. Add CX as the power domain of camcc (binding and DT change), and
   then drop cx from the JPEG node.

Which one do you prefer?

About MX: Ok, I will add it.

--
Best regards,
Atanas
