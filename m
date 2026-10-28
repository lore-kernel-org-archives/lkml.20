Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194471;
	b=nNcrY7c4ewcErM03OEBbBzkM5Ttbd69+wRoCxsUj6F3bJ4nLJ5NYeYEkcHeQ64iRImYj
	 jeA9S+vY8DGAOc9ciO/KWI2VYzxLYZVAWB8ROob+/VVkWIlfxbWocUKHGCsOU69qpoKIX
	 c0YCaFo7C1NrFM2DVDyt/5qeMvKwaGsus8XQrkvi5YDV1GbQz7XrAY8jqYu8ZHGrRkWMa
	 dJvmesUOjKigFF4uxIUMfuLKDVl9nfM0UBLGocE6pgdNUu3dXOpp+Ir+oJqTVQWG46z5E
	 pk8VsakQtfj5jkhA/Lz729sTEtjhj939+BodfyXY8bOuF8DcRebd1Fa42AAKdfz5LtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
	b=PoYOrmSesKkJ50ludeUgtUNtraRk59jlFhezGGVSDtzUHrUuW5+kxb535k+NYJ0VWM1U
	 bek+ZeH+FRCGRFUk2bXoVuaysMF1ZOahKSO9Uiuf1X6ZlM8QZBAesNTyse3qRvNPPkwn0
	 kEyn6E1IApoUpvfm2HFf8KUl0f/1VZg70AfZCRJ/fOwA96hhroxhRe1UaHshBUe2BH1dd
	 h/eciqxJ6gpKUHoCYzXBn3pSSQlrWqobAQHTvq0Lvp3ow1nd0n5O+l75NCPZb99T5tBfH
	 8c+GkG/3NjvtVL+QPj7d2QfFiwcMhjBJMJ9be3CZ5J+tF6Y3JauZcN7siohbHfwA3xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB+KMeac;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlDkrIVm;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83CD606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D83CD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DB+KMeac;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OlDkrIVm
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe6TH1053363
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=; b=DB+KMeacyINPVIWQ
	kT5NZdhoct3aIrjpDIznNJexwKqKNxa6q5TIvVYdUTStLB+2vG2KzJvoUjhPaTac
	90zVOeCfKAl+TTdjVPs9BhrD0l+GksHOv6Whwh04f4JrsSH7dElj4dy0wLUCPJ/I
	CLxoWmvNFazPX3JVe6ksWPnrXzs0NwaB1vNv3uhQkz2lTiFwBMAvGPqKe/Y04YnT
	U75G92ssmXv1m75abb/p6gIpLVrunrIDxIi9P1pTzpYr8/VU+VaQeFPMRNF3HkpP
	t2McDg+SPQw3fD3EpzHpurjk0YBYnDPStWUcgSJZxfp+AC4PgobPOIttSpKWG+tn
	TJef9w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw9mdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 13:34:30 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5cc87885c6eso53536e0c.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 06:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194469; x=1793799269; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
        b=OlDkrIVm2S8cGNksjIHFd1sHDUZgsvgAwaXD3lw1KmyQMPWpE49FFZAbxmrediRnnL
         gNcnzke6dTJDFZEbnbxUVxiWDmpJytI9ya0LR8sU6H7t7UpQWxvuVRSICRQ0/Z+hED2S
         g75GZ7Ax1QBJ3+qURK5aome6HU8az9mIb7AWuDujFmOzkArFt7ALjIcUkdxmMmLGlZu2
         nvJBIFIsqvuvbf80ieSzT9cQue7SVQhnGdHnKKKWlJNYRWTGK530+wtlhWaBKHnRSyMy
         eQflYUknpZj4hGcqXFJroZGyyijKQBNob+oaXaV8d7AJP4mueCD/hRgw3W2swre++VGi
         kCSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194469; x=1793799269;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xB0rrd+t/AbDdorQ9yxXKj/XJjXFxvo52LJX5lGQGWs=;
        b=fqDIaD7NcqzE6q+ASkEEFycDxVEV6uH4Zokwu8qaEQBWEtOfVExFC1gF8KbcwQKHSn
         xuUXLc+5noUTQdLDLKkTpk1focjHn6lekmAsiO9mteLCsXN5tyaXoGD+hfUfjm/ix9xv
         +lkDCNiGZYpBT3p3wbTxRLRX0ZbLy55DsJp7yNDvCkX2KPl/pmX++PeJA3yglj9CB+KA
         Tm2PJZ3WyIhg84GjTUhJN5wgJOUiGdaW27EMI47NG85fkOEAaVOmW0jRW1Ohl348BHwA
         XhDF5ErDXESd/Gr5w2GcqdbqhKL0PlKwtij8nqsgNNMees+SN80HzOpm2vlElA3x4BKi
         4LbQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrg9H7rGyEDmxdipdsv1J3i+TqsFPq4B81ZC8X4lqHQtNIKlz8clwizn2jwoLZ7JURIYaOMNy/JQ+2WBM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQZmgRY4DI1cTdRniSiOmxU73Wr1/J5aN/t059EV6zkuNigX0O
	yHSST51EvQuJ4z88MibF6tQslFC5EPYWlq3G2cT1fvY1jBT0vsHZ/3s7G7QDA0jYzTWk1ml0jBC
	CfB/14f+IEl6GJb+d90tr2cLlSBEYvQsCOskbB30NlM+caapb5ZC6mNUF4QcCQBHU9w0=
X-Gm-Gg: AYBFou3uBcHAXFyqsYM/8TgSo8Cv2SRE1uSu9yJ+Js/XftSBJN920ocLZoC1wIGmdlD
	g4u2r4/rW7U0KaRkT0K84HjPv+OEs1mlVT8vsWtG755jym26i+VpS7s3s5T0zLIIjvEplAuCXLA
	c2/RARQV4RBOEnbjHCxtWeO4crayKLWOCXpM243M6s3yRkfTzHMjKL6BkOOfkUMvDKR295+E0on
	7o3LfkTteMsGNWYvMq4fQdIzBYtVguXuKKVvq2DChCPm+ZWogDo45tCq8tCIje8IVngGc+JFof5
	UE3CU0sxLWWYR8yXIss54rcxk3mu5RteK9DC8hkeMQe/eDny9Bo+fJ9Z+XVXBo//cx0V/NQcrrz
	4etrkpN1R7dlyomB0zR0THrlq4LwuQ7c9RDmVDlZ7UHIxbiIpJjiy9GMdXdcuZB6vjwpLX1Y=
X-Received: by 2002:a05:6122:650b:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec4cad8acdmr895016e0c.2.1793194468995;
        Wed, 28 Oct 2026 06:34:28 -0700 (PDT)
X-Received: by 2002:a05:6122:650b:b0:5ea:9c73:eddb with SMTP id 71dfb90a1353d-5ec4cad8acdmr894993e0c.2.1793194468485;
        Wed, 28 Oct 2026 06:34:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a27a03sm31692331fa.29.2026.10.28.06.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:34:27 -0700 (PDT)
Message-ID: <f6727bfe-6e56-4545-b56b-b3cfc181a722@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:34:24 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: kaanapali: Add memory-region for
 audio PD
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-knp-rh-v2-1-4e2f8e16b607@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Yz04Fygs_FjO4hRhIBblCYqtg16oi_uK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfXyou15arz4Jdl
 OUCl3cOZqfaOF68u4DlDUC4iCEAfp9qGx54SNwfBIwWB0PC5kfptAcET5ovbDRjSN+eQ8KWWCYa
 GNSnkIPw+hwBLhOvfWWs/474OQ2Bqsc=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1f9e6 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iauIxC-Z2Ob4T7-dqesA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: Yz04Fygs_FjO4hRhIBblCYqtg16oi_uK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX9qoX0eGhSMbK
 r7ukzg/ornFdikjUfkv3N28zTJFTv+uYqY2xXCyzK590nzfA+nfzsx5fQ9uklNVpc1nWZKLysI/
 Dtlu7Gr549ntYzdn9vFNSL0m17X/8ReJoOdYdoklfgNazJ3YstIaXLPSS1CsaP6+Hi21wQtVzLj
 GIKElVDJHd2kmcukwy025dYeaGk2v98mceTekMWOC6nApMMpyncPyuvlB6p2VhSrcUwQlh4EwBm
 q5Tn++nqTNdfnjL45Tlga10f7B8u25Vik0nKwnntgLgzB/TyxfKmoKCjnOQk3ePxCIw3nwyIGnV
 N7h9FaH1y730welnG3Ct+9XarMQu0faIuXm1niqjtsv9WwYui52cBeZRWFQF2PZua6ZcVIDYPmb
 aPkCL7h14Gpuv+8abufKGM4CKaHIk8Ai3JSlbHlgsPmu5mtTPXe5u3/zt9LhHbGeMSiiJAAzZ6v
 E9llVdP17AhvetIP57A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280053

On 10/21/26 6:56 AM, Ekansh Gupta wrote:
> Reserve memory region for audio PD dynamic loading and remote heap
> requirements. Add the required VMID list for memory ownership
> transfers.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
> Changes in v2:
> - Make the audio PD remote heap no-map.
> - Link to v1: https://lore.kernel.org/r/20260922-knp-rh-v1-1-35e29b104809@oss.qualcomm.com
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
