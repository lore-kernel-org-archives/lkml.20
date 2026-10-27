Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793115418;
	b=jGg6wcU3OUCqysfj8j1LTfzwVURESlCS6v0VaMqVzxZ7GJ430dZYQbCHzuGH5WFibfH4
	 tig1T03uD6QuuWId9q7EIMZAr5U0NcS0RRur4EqQXoT9j4kI3maikYAqZv+JE0n3UNp45
	 dEbKuEuggVuQYKE0xFv0mXzJKm4U2vg9Hz4C9ZwZFYDOwLimHAbanb1WKs81byo5GLb46
	 RAL9yPzuoDMxg0r52EZtKWO0058MEVX3OZy+mZQB3ZGrCUApNC/aFdjA+aQaGrJzYtGjF
	 7SuK8bsxJXQkr1eDa+ctml2DceOYLQG6eG/AGNajaynVnPhAF6OQQL2ONIWRdFsrJbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793115418;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
	b=YwOlIYVp9TsFtb04/cabmaM+1Zap/fYU2gwB1244AuIkzqnwgIUVdvSw3KIkrtVIvNp7
	 QByGqU8DcFbk6lvJtH/SZ18J2fP/p9DfRgbrHuJ+/VFlK4la69ncuwiVgiAbphjpLp+r5
	 DbnHFpyisLJhMraQsARUMZFhbXWSLYovzLKB5Wr+RRqYeh0goePboJCcu3kO/CHkjCRuV
	 oAqNuKxclYStBQmEDwspjV11QNWaRrk6gVQSQEohxupq7v364fu+aiVaJdLKHvfbeMLH4
	 jzNIqSTS+4/pCAllKpE5N4uLI5zet8C1+lyfOBt1FFo3hb4QnRVy07G3AX8Ze1HJHvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0MuHBy0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKC3JbDW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F66606A31A
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01F66606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c0MuHBy0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eKC3JbDW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKvSq2548914
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iOtOrmbXs4tZg1IaJhGs/3w8
	x1kRlFAdZAd0OV7YngI=; b=c0MuHBy0hpXe5W8PfLtmGmefH0M5DFXzxb0IGTRL
	Y5xNnlPri6OpN0wIpPmzqFVo5+zm3TyrgSVDqb98RnzD41ruqb4ydf+S5BObqqqT
	TKn3a7paA9lVJ7lN54zPvd8L0zdR+rbLj8KaO4Ku41TQLRZWZt86NJSRWmAtjrtE
	BpYra0wNN7oMBjsxKKC4So3Jq0DqtuCAu8C1qI4MpFAD++MCuLwWCvDJRCSAcSco
	uYrlIKNt5i19KJ9Sq0/oYBdyI6Hp/zRUp98/zYoCcdHehDYf072nJBsCnS19smRm
	mjFi0WI9KToK9GKz5hh5A8lqkEHLI/ScJANbRgMOeRpUMA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjrq69nqx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:36:57 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf7856ffso1018349785a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793115416; x=1793720216; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
        b=eKC3JbDWaMlexrbT47mXDWiJs8G8h7onzbVxhUzUxLekIBPIuJJ8OAEswfdg8+9yC9
         Tx0jF13QF1hj8OZjCsoFypI5pk+2/me8qr4L7ZwF/NjqoolY0hcGvSv0j2a4leT0Cy3J
         4gm6X6pPYdZXMI3FhWo4xEYrr7auRBerUkjir8tmGtI/EgsDrJ22apW+eqKtiMTfZqpZ
         9XVL2NfSDT8DylhOLzfpJBFajdXmPAnYXb/f4Nj/+Pq5GKWNdNWF7Ne/juX0ycBxMFHT
         2fJGpAvyKXoW0AKBZzy1i3seVsI1sDkTN2RMWonLJtIwGG/E24D+LN/wEV2/Bf5E7Npu
         e+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793115416; x=1793720216;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iOtOrmbXs4tZg1IaJhGs/3w8x1kRlFAdZAd0OV7YngI=;
        b=JQSbiwXCuGbF8iQqvrzJyntdXRSE8QTpVT6WfzSQuvwoZ1tfKmDhFczShpRzhE/jqz
         4ndJFa7Ur3KcmQa0ATIFNzXDaFNQa28gDq5aFrwVFPG09+2Ds0fKCU4i574zFKBm4Jfd
         i6XR8KU86NvSMMhnws8c/tG3WzQI1/869nePxvKhW+Xl4AzNrS5tUhRced5vyHDuBLaw
         bWMSMNLx67pMx+4c8GLG8naxuWcwgYf4gjRsKgzUW/hRgCdM3pFExAKryl0JmEMg9p1Y
         WmcT5NFNfWhomNO6FGJcauMIgHLuN1hsRj9xePEiJtBNmlGCQl8iToR2PP/aOn/ZkdFZ
         WHpQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4Q6gcVlUOfZBnvA7OZfaMLDUdY1NBlMQgg+sdQQXd5Foz18L8z/jTgx1J61AI9HDVyRIYRH2XIaJTYfY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKF3D1CEzvtsxavEoO5+lbRquBP4H3BO8XMLLuXVx3MjsFIvrql
	bBgb2yYMox0xtVZF4vZA2yQL1QrHBeSeEQ7SSwyTNZ9zS9jdO9fqD96hDM0a25X81+0ybhSX7lH
	iRljrktYSSOQh8laXXZ6lTnDy/RThICSiBeci6aleyz5PiLdcCgy4CvkHI10gMg85b5lG6jcOZK
	M=
X-Gm-Gg: AYBFou3VeBbC9Ru4VVnzLEMxkzjpcOsxcV3XaQv+Br5eo01BXSJmTGkF28kPMiRYu5H
	QSwm235j50QIW1kCnZ8WzQQ4SPJ4Q3NRpDBfckyTaM0b4Qc/FlI9STE2kdwaoBM4B95tna2+ldi
	Uc2EtqCvVXhV+2i5SnXOJsVtKH3LSroZoyoT37XQ37cJpop0feGxHFpmX2EHfK0sxhzjRHAqccZ
	EeMzGqedriRlS2V5o3HiyzSD0axXA3gTb8Lp3YlgIMg0EaG7Py98im3XVEC695Pj40fWhiStqnK
	muUZ0KjALPi0DpgPCN2jeUfYb10iCJKWGj1P7rfW5xTQsdq4CzuzbmOuJrFrrtzjbyNiL09I5iR
	zdEAororL7JNeBQE4
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1636863285a.23.1793115416317;
        Tue, 27 Oct 2026 08:36:56 -0700 (PDT)
X-Received: by 2002:a05:620a:4621:b0:93b:e5e9:23d9 with SMTP id af79cd13be357-940ef8bbf77mr1636856985a.23.1793115415707;
        Tue, 27 Oct 2026 08:36:55 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a04ad39sm710704095e9.1.2026.10.27.08.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 08:36:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 17:36:53 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, abelvesa@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Commonize glymur-qcb.dts to
 glymur-qcb.dtsi
Message-ID: <rnpi6fidshkbol62qbvaofx6sg2w2w6bakt556gzxfjhjl56ej@cibls2wr7tzd>
References: <20261027114955.1266499-1-sivansh.gupta@oss.qualcomm.com>
 <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261027114955.1266499-4-sivansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYwFmFtv c=1 sm=1 tr=0 ts=6ae0c519 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SizAbxo_vVgsq06u93wA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TDc9Vs9ZN_q4my8BV4EF3n8pNhaYAZ0Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX2IKXdaeaBL1I
 Qw36AI9qut1oskioh4FcsLoT8hWJzzfDHC2bbmw8uH04eJlpGtTJ2i2y9JXOGA2M4D2eXENJ18Y
 fUWWou/4RFOsmoN7ehj7YVYatSAJDuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2MiBTYWx0ZWRfX4rbzWpTGHi7K
 BaWA4mwRl/tq+uUy1xuSG6H25QdtHPo76kljlZI2rAD3N2CoikcaG9pxzJIcea+1RRCETIkkknO
 KkH/DPgWaxS7nuIBAgpsTPJ48FvrmCpPCjZWtflmKN1sgn1nOImzqVRet95WDsgxw1n4J/WyNnI
 wONIbzinV2HS+meHjHncnxv/Busn69oA5bQNoPH6CgJoND3bAiDpXoOSoRqZuos0qdbQITx1SVs
 svQdjD94gpg5Qrl9OPkD3VAf08RbYIy76zDB4dfeeON9buHSpFTUT4EwQyoc0LgD7Z1yDptY62/
 jOfhdM5exO1Qf/ker5ZKQAq719m9lt+uX4ABBxdt1q6zs6qwG245inhU4Y88gabECxER1H2kmnn
 /zjkPTq0qOoWDKqdWRfDjRo2xrwyjGq0wRddjjbH1e+4liLJkkb38dHIP099HE0BgespftWNSmp
 HFQSFtt5UZigGa/AS9A==
X-Proofpoint-ORIG-GUID: TDc9Vs9ZN_q4my8BV4EF3n8pNhaYAZ0Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270062

On 26-10-27 17:19:54, Sivansh Gupta wrote:
> Glymur QCB and Mahua QCB both share common nodes as they use the same
> underlying board.
> Move all common nodes to glymur-qcb.dtsi file to allow for reuse.
> 
> Signed-off-by: Sivansh Gupta <sivansh.gupta@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
