Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8419734EF07
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466957; cv=none; b=eCIuabnV67vcf+pGVZL9nQ3r7PmtaFSIQMVyPvzXSlzGWrvVJa/GWvpT0O1Q1OasAYz1Y5AP9wcLQFcO9TVqTvdwPyOdIosPBjP+D3Scn9nxAgGMm/TQdzEizJ7PRX4aYHVTvjlIYEZzkXBoRJjQTpTOUhZram4Q/lEwE+kR5Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466957; c=relaxed/simple;
	bh=tGjDR+zQ31FCowO41vWdnhNF+/J+6BC2DcHVzDdm5hg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3VQTFBFRNi+M4PeaZNf5BCozeYSdkuE1EdP2n3s+QyiPA/fhV1qYim2lG1xFegNfVMuTwA5Iu/AHyY7yN8vEdClIv3pGAidvtHOb5PL5ui2F1gDXouRgG4QZNnEoKKHDerq64s3jIyf4OVxNNCrsJ5WSXZ1/1iL4mxM0pRain8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WnfUtOHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDsuvQBq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WnfUtOHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDsuvQBq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h18f3415605
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XP1SokuVGoe4TY0wnvrhUdss
	t0yinEpiUMhs1jxHPZU=; b=WnfUtOHmqAy8wvNelI2I+7RRETqhJ4IEwDHerEK9
	jQry2pjkPo51DNxf7UEeYhZW7QmQTJv03Ucc0Qdw1svq8nQMJWKxNmHFDJqYF3Lb
	p0FsyiCCC/w8c45OCafw2Er4b6tAUnakoSqhGlsPQKgrkx43u7QM2fCQtDKVp+ER
	SPZkNsZPoUvBSbiEGA6kQHiBFhAsdp/H774l00UtFmN9fgYfdMZt2FSTSXS2TeIi
	94D5iNcWMTM1vkWjlaVW1w+MlyDxdz3pQ0mlZ9KAgS8jSCuUeKnIR/qoxGThBfxr
	xi1eJbq+hI0T1ONJ5PlvJOPjzx+/Gxe7Tx5N6KIxTiT82g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq3hc05m8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 10:09:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-939f3426a7cso762978585a.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466953; x=1790071753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XP1SokuVGoe4TY0wnvrhUdsst0yinEpiUMhs1jxHPZU=;
        b=NDsuvQBqViczinTTrX0DheNFD6HX1nJfNCTgn8KITC3CAmmGdZs28H3Qh5tPZjkjql
         aNiul9EKFaR4wtMi2NP3Y+c2oxGOJlMv/OmaZ6GxcQ93ke8KtqIlsIjTAkz8rc55waGZ
         jXXrme03Tx+XkHlW3TVH9xoCRWFHmIivDDs6XqEMVHXSYUZIbQQ3MEZN9pRfuwk3yORx
         Eu3azV7hoL7g+zvoH3bAxzb+EcfIk4ojflHUane4wQgC7TVR5DNOW+l91bicMfCPI1H3
         hPhL5del+sQmK89bI6ngD/YQOf9iUjLRJO7aMdI1GdYvLVgLY67nmvRTSu1BD96h3Nca
         I3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466953; x=1790071753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XP1SokuVGoe4TY0wnvrhUdsst0yinEpiUMhs1jxHPZU=;
        b=S/HXl6poQWvpq5q2tsYQX0eU+KGAR0vuTU76DrK45UUKYMMeepF9fbQ0BmK8jLt5Ij
         4ygZ76Dc0uX6QbPg1kqtWp6Ogw3cNDcuzM4+j5mobp5yYamJL10bhNAMnRdsfZ2qm+cX
         ACo2vGjPpNRIXRYwyLqfzq9HqbN8pFIusf+1p/VqjjTRf8jkdtMxXb6psz+0CH8qCMKG
         jlXMAN8BNHhkjZHCTVBzI586Ft/L+KJTrca7diJni7KCn2PZXD9JFn/HLmvbhcIRf5pC
         K0rfRxL07NQeko9/FDcELSAckb8+JNlIXs3sMK5zbNKkJMXH20hn/A+hvuijrmA3hjYJ
         v/NA==
X-Forwarded-Encrypted: i=1; AKwUvBylMAoZY0Gov3e/ynRuXo25k6EtQlRyVF2/ECe4VFGnIXXOm5/uekROqIWSkbXUxZmAO3mHEClPmviyBUI=@vger.kernel.org
X-Gm-Message-State: AFuF++kWT3DXrL9clwSipm3QfmrUH+42Ss3vxTP4K/WJuEKOPFLOcqQo
	1uH+RePurDwYDXp23V2qijQBinz1x8lAKKKM+45FOe+1jKTGr0L+j6VVIBawzlh5cEpbjLfKKzQ
	qhNWsyw7nkrSIfcdKtvl1xHuBZLjOIz9DhO3hEqRcOT5ChqfA3Jc8RJ8wrOgVfIfzqLk=
X-Gm-Gg: AYBFou0vT9JuIn6MiZBUnbj8Ngkv1lFFrKMJRYi6JCAeF5MU/qht/g9UkX+IL0/SmcU
	fanyE/ZPAX1tW+2gFEqHV1bDcrv3RPcUTGwPtAxsTBN9WLf3qFkC8uALaLAyLwPk8M3JidYTD27
	J3YPdTF9fGPqKGoAvXF4vZ9pdYyO8Rn/G8VMwkxq4heDz83fCoeR/Ms8zecDqe8NkQOhUHTCdKG
	LcdmjCP7b04NRV0heQLftq/k8lxl2IEL0q55X1hU8UZedvcXw+vRIuX0kVT/eox46JfzaihJ0i3
	Ct7w8UMwwEtnnNwbLTXimWBaqXSb9yDPxD7fgNaXjCTaHN5VZeuo/OczLjAmaxxxhz+nBQUcbxj
	5d7kU6ZWonDWbWQ==
X-Received: by 2002:a05:620a:468c:b0:939:a199:45b4 with SMTP id af79cd13be357-93a29a77442mr901516085a.39.1789466953410;
        Tue, 15 Sep 2026 03:09:13 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:939:a199:45b4 with SMTP id af79cd13be357-93a29a77442mr901506585a.39.1789466952493;
        Tue, 15 Sep 2026 03:09:12 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef7ecfesm54019035e9.9.2026.09.15.03.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:09:11 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:09:09 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: avalon.vargas.centeno@est.una.ac.cr
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Val Packett <val@packett.cool>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: Fix touchscreen address on Dell
 Inspiron 7441
Message-ID: <ymoielzmm2bdw7wxwpjncdlnuuuxvyv6z4t47dhfsmmn2xi6qu@55hzft2ep6c6>
References: <20260914-dell7441-touchscreen-v2-1-7f7224c0cce5@est.una.ac.cr>
 <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-dell7441-touchscreen-v3-1-062d6b93d1ea@est.una.ac.cr>
X-Proofpoint-ORIG-GUID: w6uCt482zCenf982kVdSbhp55NWKiLa0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX0pFMRwCWDmMt
 BsSFNbscjQIELuvKbF4136t6SymGGlvurAhoPTMuHWXAsWJy9nbF/ufh2RdrouQFrhirp+vi9zw
 M22Q0FKBZNw56Tot2rW7ewjpnbK7UAs=
X-Authority-Analysis: v=2.4 cv=dcUVTnXe c=1 sm=1 tr=0 ts=6aa9194a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=MW_FOeIp24l2TjhtH0UA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NiBTYWx0ZWRfX7XhxCwvmtbox
 40doFE8/nLYT8inorm1orLzjRph2PASIi/zlTKc6P8lv0tM3CrvRJzhRB8jgM/5JV8h2JD7700C
 TPk9kBLc6p6tofbkayLiLDoJSf4wMY9cGgrQADxcsMIVfIQXHBK1tq4I+miCh7zKfgI8XE9cQ3I
 21Dqq5+B5pLc9lEgUrF6RF1VlxI2Eq4bqkRVq/ddn2osNRaGlY832BIbxy5M6zyS+C7NRImePPi
 k4RJ6Epk2Hab9YWVn/0ih3UN10RRGcHBCS2N8RSDIAN9CpHVebzFKxxggvouYsiGCunbvKIMvh7
 3BXsk19Nouuyikn01UDV1HnF/+MPEY04406A6cCy1C8S98TswbM2VE34vpc6mfw2MBWxooznflF
 lBj6LhFmg85poHSDyGcimpTsda74WfgqDX9po60pa26o6kIipzq86DQOeRDVTmZ34GBKWolg4UF
 FOcCjOCeGAZkgzlv9+A==
X-Proofpoint-GUID: w6uCt482zCenf982kVdSbhp55NWKiLa0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0
 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150146

On 26-09-14 16:04:23, Avalon Vargas via B4 Relay wrote:
> From: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>
> 
> The LXST2021 touchscreen on the tested Dell Inspiron 14 Plus 7441
> responds at I2C address 0x09, while the device tree specifies 0x10.
> Probing the latter fails with -ENXIO and no touchscreen input device
> is registered.
> 
> Use address 0x09, matching the LXST2021 configuration on the related
> Dell Latitude 7455. With this address, the controller identifies as
> 29BD:1103 and binds to hid-multitouch.
> 
> Fixes: e7733b42111c ("arm64: dts: qcom: Add support for Dell Inspiron 7441 / Latitude 7455")
> Signed-off-by: Avalon Vargas <avalon.vargas.centeno@est.una.ac.cr>

Please stop sending new versions as replies to the older ones.
It becomes hard to follow when looking at the thread.
