Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497746;
	b=m6vAxnTQSrhw9i5PPssSdrh2NWEak3JXn8jNoRz/yOgWLv5i3Yqr/sEeZoVpp2uL/S5v
	 EWFMGX6GgZGm+Dc5TmXVcrsHP5qaTaRpuKY8yhzeka1K2MPxadvBzZoNAUyjvZ5jUIlG7
	 s5pad7T2/FeYmxdX7o1FSPsDl6L1hSxvKCRizmgypX4cKe2Hu6pt3/iSeQoro4fWiIzXt
	 kyv0yBgM4AxA3jwhUXGvkT9axlEkOyUn+WSgG2vUCIcOHxew/spcKcJn9tDjweYXfyY07
	 UC/hwYVbj3gbieyGhAc9hD4w8LS2nF5G1JwREMivboWQ66fNFEAa4uLV/aMvh7RFQBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497746;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
	b=24KTiGYM+HNGDzyvxMekh9brh9MGQdoqDIL1F+z0Ua/VlvuUr44s9GWIfZdLAG0/sgBC
	 bsTLbCS82twDIY7WoSw7Yk7hd3Y+kblKP7CYejjblhSarl4UudyoSqcTjRweFmD39LPrX
	 LnwpdGe0QIZZ025l/Trhma67sfqEfoF++IqrGO2Y28azByWELaNEY1e+nMkuSfwfrqHuD
	 0cVrpuIPB2h05W/CJj8toy+RYPp3Km0k1xXWVicyDWyfn5PMq0niKB1PJQe3d0YuRiLH1
	 lqjcZ/Msb5NuzWRtjF323nr2cN73S2VEeVuLLJmauoqLrHV/KiPmMAvbTjfAraohL0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hn+OfHiv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbxjFeT;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721EF606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 721EF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hn+OfHiv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=drbxjFeT
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxZLx927001
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:02:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=; b=hn+OfHivo5jDnFft
	FUqBSTX1uatQPnjCOrPgg8MmNrF2SZMquCrWFt4idF1IV4ZdLOVUl6r/UeTnFySz
	mJYmlbjsgevWo5wrb49ql4nWjRFSiUxTBs6fdIwSKMsfyFpR08B6S+7rcWepJffG
	TB4uM4MYJzTJiZYWGWLwXB62mk4u+KunqVWBgxNd+0HzB+rVzahjuvUxXjDPa7vR
	O15RwqEQWVVB8wvcMAXAzqMtXcxh2Z64VKlrGM4w23qHvTf6f2QFaZnHzGlmZ2Pz
	jc9oIGIgyqDZ9VVCNIWwMkpfsDyuNhv5r4RjiFZao04alAWX/zFvyXmOAQLyTsph
	lRdH3A==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5pac21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:02:25 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso71385e0c.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497745; x=1793102545; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
        b=drbxjFeTO6qX2AySQ3kPGYsp6znUPrxHjFyEcibxvB9cy/a90pvo7sePE5J8v4cYTc
         1bEE1lpartphPahpv/gSQ6TQrA1a4aKEDq1dDIGWLZV4OHK0R3Aks25U+5GUUEcELNuU
         hv78iPkJGJM+4piftJ2uYC0V3aC4tcuS5IkZ+a4m73KBtSa5VLUjTpeHVlh8OH1AaI31
         VCiHv+n44v9IQ77csaS1uKgPLAt5txdKeufaOwhxUl/Vj6TncE9PjM1gN9q9BPEaneX5
         k+Dd1zgCPnC4VKF4Z7H7/Y49UvobvT3IMVAkdsZ5x7o2II/iphFCid/7DSEjr/T42gVZ
         j+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497745; x=1793102545;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mBPvOIph+Y2ejrL12rSsmbSwXyGX0t0FlWsynXnRvDA=;
        b=HB1ikyi1eDlmX+ck3qabRE+vwoHaJ0TfRf45VWl7u2ZWa/ywGI06ZJ65iT4pq2oeOa
         FoHaW+PjRUepV5dk2u9eVHY9oUn4T67shQwBG+k0tUNJThIXzg6OXUZAVYrAmbQkwoj2
         J6fX3QnrWeImJEhg1ZNmBiZmnMl97awfnZH5pvkpxUiWlbjBXqEEkD/v5oihlOaNFQHF
         ebVZyehxzHqSOCaVMm92XuR1vPZk64v1PsTeljlErg7ELLQDyGHqHFNC2oO/QtTewB5w
         +XRtkKQ3UmMNPfaJY9XNW2fBvScMMeWBgbFGB1F985YxIWbyIkFWQypeLLa83PvQV4OF
         StIw==
X-Forwarded-Encrypted: i=1; AKwUvByasZlhtE4FA2Df4AH7AmC7DehHWXMwlLx5Y4ovMjfIMXkirrpdu2RYuGB6p+jvigMlANtkm4LBX1O4i4Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYZIpiAl5OMXoMLyh5dU+UXf1TS065xZhjRSTS/lNe2Wvp7JPl
	0W2xA7+9FqauBos+mJzaO4dxBEQ1E9mPyQWPeEK+4bSHFZ8Zf1xmPTXmHNCnpbK+2MNAMSkJhPp
	u2u56qi+IRs3tOCXXP9yvKMSla+8pODsXNBp/iL/hiPC1E3y40UA9tfcFlBiGQaoz7ZA=
X-Gm-Gg: AYBFou110IyHY3yQkCrvBjLAdIuDL51WHETr7ei89zxwOrlW4wbTQI4HyVEJtrkJHKl
	59f3yOX110qk4Ekdg+I784W0NU2zYgIonNfRnOLVDTZ1B7Rn65VYdZx23wGavhY244GBttWV0Uk
	8+NcTZ9l8kaLnXlUfVX48PI3FgEu+nEiDwfU5bfGQyGmsFFMis1GVCpm60dKQ5p28HErnp3REqD
	Vr5+IKa79vSvq+kwS7JwrnZhBmaNrKGjdUMAeknsIQO2k5h+fXhU3+o8bMrwuR8xPrtStbsr1fv
	+D6Psp9TvgrX0r7L/PbV1yRiHNr1QcXjZrFRXGUKSkktg68ENSglYhKhOvrWQEdW5Q2xS/O8oiu
	g1ywTxZZQeaJ46rF422mQbg==
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1904237137.3.1792497744843;
        Tue, 20 Oct 2026 05:02:24 -0700 (PDT)
X-Received: by 2002:a05:6102:dd1:b0:7cb:fef7:3763 with SMTP id ada2fe7eead31-7cc36973b47mr1904196137.3.1792497744278;
        Tue, 20 Oct 2026 05:02:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c80desm5009277a12.20.2026.10.20.05.02.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 05:02:23 -0700 (PDT)
Message-ID: <2c58e865-27bd-48a6-903c-a4fa5c0d92b5@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 14:02:21 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] arm64: dts: qcom: lemans: Move pinctrl states into
 lemans-embedded.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015023711.721837-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _9PAvbX_jiW29WaOGrIPDKayyGvgByUU
X-Authority-Analysis: v=2.4 cv=fb84WEQF c=1 sm=1 tr=0 ts=6ad75851 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1Mba6klkf1WT3IQPbzUA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX3ytXpZcXoxcQ
 4vNlVTK5TyymZ5XiSezxh/AB+bPYanqT3xiquduIJRLiMabOT9EJiQWf9CcZo0Agd3v//ClRBQo
 3YhqJQI+nRrIfhGUYPuoz9Ipd+bcuadF25Bg1CYn96HorM+SzD945jDzdP5GRP5AT0b207HQ3n0
 gGaxalrg/1c7EyyRjj4errojqZkgkY1bkdMXGpRRLEC/5QvlEbBDN7sH82hipV5PzBwrtYz2lMD
 VWVAjg0/pQ9ITecTO0b1+fCRB3XWFPqPK/jZm61j3BI+hJ/bKcSVt0Ww7dYfb9IwUpXbJAemPhZ
 MzJdU4i1mqSWOaV/zfmCJWvyGQfQ6viAx3scqG2efy1Im04Z+32ZtHT0AJ84C0rHP0a7Z7Ma09/
 LAdNw8R0jZsQHyOI+aQKqpndNg56vddnqhyv9rL0PNnZeYqnvlgaCRFy4kneW0QCeE23/pExaxe
 6QV343Taoow9g87gZiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX3pa/3UoKc9mV
 Lq9rhqfRUTKMFYfpzwPCyYQdBXYv5KppbpgGs4uZMbIU1UvTKPGk3U0bh6oFPjKUBFpySJWtdzp
 msSiZv7B9ijwl/ynZligLsICLhrxcrE=
X-Proofpoint-ORIG-GUID: _9PAvbX_jiW29WaOGrIPDKayyGvgByUU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 10/15/26 4:37 AM, Shawn Guo wrote:
> The lemans.dtsi will become a base devicetree shared by all Lemans
> series SoCs. Move those pinctrl states into lemans-embedded.dtsi as
> they are used by Embedded variant (IQ9/SA8775P) only.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
