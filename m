Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E1E4279F9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 07:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247558; cv=none; b=CP/9W9Qfgu3bSgCfo0xfvmNPTk9Wk78c5i+d8KrHjgkdZRYfbF4O4zA4pfIu75jWBGFr3zaGbtCSA4d7peQftH6istMAou+z5JeBTUrYKiVtkxjVzT3KdyUlL52qNc6NoONsJ2cLNTtSGLgg5ZB0BEj4wKMuJqUikURO3xeawB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247558; c=relaxed/simple;
	bh=4OwOiIrJDcYsWCkt3XIjRszAscUvuUdWuYKTTsyHR98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eP9cZUubotPe7U5OrmXFHXzJ1MSRCheKgv6ZsS1d02oycBVPbzIz/zXUaAOFYlGhBhZMjV6cR7kqwCKKTnyW2H1yXkCLzquC4L1Tr3uBF3Izw9dW3J693RS6cdQrlBDsWcJhDdvrA4Q82h7Mc7UjHbkDX/CgECpoluJDcUJlUEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n1AIJymt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HKUogekL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n1AIJymt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HKUogekL"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179Hl91975447
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 07:25:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9MAr8jwH2iSd1NdkalK9l6RZ
	f6Kgf0q0JukSxYX8TjQ=; b=n1AIJymtr7SmsKVdj2h+99vJbHnv2Xa40h9L61Eu
	Nw41Uu4vxYKHtOIZxWXbrX8RzKPidP8wRcg4XIeFVGBa1uZJY39/ZT41ZEGHWZ2g
	redXPk5Ax1prs/el/inFMXeEB42z0AhL+vRLAXNRbUzoBTqqSPdFrmxAPMChpkJe
	hSzGdoQlXJ0XjqlIPrtsnRFODVi4Aqd0UcJeKMdfNfvUF7UKDHs1igYbEoZtFVpe
	xKHSIsT3WGvHPasb8aPQK0Hp6ZPW99FbFWVwsIiTOfFtoWnNiB64xw6gIPEHfAT7
	+7Dfmwub+QMQYjCdly8UIulx2O4uE1BT2VtGUwcc0lyhUA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp7r116d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:25:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so69188185a.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 00:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247555; x=1788852355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9MAr8jwH2iSd1NdkalK9l6RZf6Kgf0q0JukSxYX8TjQ=;
        b=HKUogekLetSIV6598xBnLLX5LUG06gKPpJ3xT4HgZs1fDXaEcjkjSDGnL4s4YXitcz
         wESVaA0cTazsq1R6/DknQTSXQuQ9sLLFbkO8jor6hrq7mh4r+4UwQi6GLLaAhJkdURzg
         aILZa92V7aZfrada4QeIVDue8NYemBXZO7EkjnDGAw2apDX+UtAYgDofZYgwCIsQnpPr
         ogEM1T0Jas+3jbsZIoQF9FCdObye5SrihBhV/SZ0pqtta19oDdGA5HPGabo1nXw/Frxd
         gN5PzcLziqlpwpqa0hAqLFZEEaBjDeS/pghBc9cX7noBnH8D8idxUOg3Nn/BNhCU7urN
         7MEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247555; x=1788852355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9MAr8jwH2iSd1NdkalK9l6RZf6Kgf0q0JukSxYX8TjQ=;
        b=TCjqEtwEjoupQxRFKtMTqdzJeVOi5CaJzU4nJb4J1xgeoH4x7GDnPRunTtaIoGHHL3
         ZXxBIbe2nWbOLjygkq12q/IIajV0F7EPaWMP1dPuO9vJqlZq/uC8x3jCuuzLN7ZFTmQv
         /YAF/N1b4qyrfYNLBS/HlF9lvld0kP121scozh5k2j2G41opm7VykBjAG/GQKb/E0eGE
         6i3Aqu3OVKGba0z5heL0TlnKci69N75LVwWfxb5HS/JxDJVEEgt/aUsbL2jWJoTUaNTk
         lcbWyNJdn54mpD0kzqu0A2rYzF4maA9aKQk0CDXGdJrvMEdGt9tztZpBiZR7fEhHP/Tf
         uzBw==
X-Forwarded-Encrypted: i=1; AHgh+RrgkHRmV3c7RD+q5rUdMAyr4qrhX6J5bQa13r+kE4Fc5FWacGIohE1CHNYGZlobxqfi1JeR2/4mfPcp7ic=@vger.kernel.org
X-Gm-Message-State: AFuF++lRgHEiEJkdfUa0bsJotuZfWCnhjPnWOSx3uBFhpJ+z86i1L3dC
	UZsVXx08oKwG0gggBLJZKACwk5zEl01DHr4pTqTEaMlJqv/W6gpRUtZUuKmgHak9v8EcMcl5/JL
	4TOzuEeC8GKKUMrQnehM9YrQZxDTvMI80dRmUVrPF6sfo4o/mXEWYxFCOjWmVhWCxnu0=
X-Gm-Gg: AR+sD13ByCvT2A/ayl/QiUFsyq67qAb0u+xtzwulZnncVcwSVK40zar6mcZScLXQpEZ
	9gpX0g+CQlDZrBPfvATD0SSYUT1R2TsbirQgE02EKVlABNYsJ4dRMzClpCfcWtO7Wr8I8HXgKR+
	qhAsd+mXd4eW2pkVBr0knYPuwsA9OQhlox+qOAAHeQJMqFqnwITln17lRqF3WaqCTcYQEGI3MZT
	c7Zn/kphNQYmSakdLNhDLQ128yrWVSLlA89To0XK+1D4Pj3kLUUMvXv3IDbZNTFzj3PBIl6Wa3U
	PDQhFYPBd4u38ek31E7UOahsrn1KlZ+tT4CQUxFCE8kQxrkMxP/2WP/3x9yfenb4B2166A91xBN
	cwIjofgWnGl2YpA==
X-Received: by 2002:a05:620a:4445:b0:939:3695:14e6 with SMTP id af79cd13be357-93936951560mr1248683085a.2.1788247554737;
        Tue, 01 Sep 2026 00:25:54 -0700 (PDT)
X-Received: by 2002:a05:620a:4445:b0:939:3695:14e6 with SMTP id af79cd13be357-93936951560mr1248676985a.2.1788247554050;
        Tue, 01 Sep 2026 00:25:54 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1025asm45856625e9.6.2026.09.01.00.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:25:53 -0700 (PDT)
Date: Tue, 1 Sep 2026 10:25:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Alex Elder <elder@riscstar.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, mani@kernel.org,
        krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        sushrut.trivedi@oss.qualcomm.com, umang.chheda@oss.qualcomm.com,
        rosh@debian.org, jsandom@axon.com, daniel@riscstar.com,
        mohd.anwar@oss.qualcomm.com, lorenzo.bianconi@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/6] arm64: dts: qcom: qcs6490-rb3gen2: clean up PCI
 function nodes
Message-ID: <6qeyzstwts6r5ceby4zcvfduzceyaeyapkpebxbonslkn3tqbu@bivzq336i5n3>
References: <20260901013654.1343537-1-elder@riscstar.com>
 <20260901013654.1343537-2-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260901013654.1343537-2-elder@riscstar.com>
X-Authority-Analysis: v=2.4 cv=beZbluPB c=1 sm=1 tr=0 ts=6a967e03 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=nVmHkuB6gqZa7asdRe8A:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NSBTYWx0ZWRfX11So7AYQYhMi
 0IbT39THImv9CIAfe1LVzz24XSK6ak2v7eYkFctMc8hR6GGlaEWFDjCz+qR0vMluRgb+s8wBmfc
 s874izlbazOaQMYPwwhqDyDI6k9iu2lSkmuzBWiFKKDGM5bmExAAsqvVLYTRupd/jps9qA+fy+e
 x/Lq68p/wx5IRn6PKBH6j0eetDVuPKNd6p1EyodzhGWyulFhFiVtrLH2Cq39XByY/9crMw6oJ55
 kRLrdfQatxz5wxpbypzF9046cFsE7uR4lmrWxnkq4RIF/fc//e8OI0N9SocfC0T5gBHHa35kOdI
 u0PCEAOZ43GG54FCXXpjGXHOqH7nisftcXVnJXfm16szW79LxCN9jxRuk2nrqMv6kY/69AB0hfw
 odQwfTkGT53CQiE0eNNPVBHp2H8ivW64FiImP2qYAivTmdVrShrff0fDqDd8yBxHt7aYMm1EXN/
 DPuSvbdAmf7IIX2ZSHQ==
X-Proofpoint-GUID: 6N3bxJWUXl771ZAzhDWoU5RppZtmzOLL
X-Proofpoint-ORIG-GUID: 6N3bxJWUXl771ZAzhDWoU5RppZtmzOLL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NSBTYWx0ZWRfXw03DH8iMnUqU
 Twc0vsal/GBxDAZeHz1Py+nSoQ25gis3gnqngjPwdHlBVvZTe8x9TcR3kgqAeL4kENy/P/pEQP4
 +76I/b9W2+fkJrApGaJdMaiaoJfRjhc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010065

On 26-08-31 20:36:48, Alex Elder wrote:
> The TC9564 SoC contains a PCIe switch with three downstream ports.
> The third downstream port connects to an embedded PCI endpoint,
> and that endpoint implements two PCI functions.
> 
> The devicetree node describing those functions incorrectly includes
> this property:
> 
>     device_type = "pci";
> 
> That property should only be used for a PCI device "that implements
> a PCI bus", but not a PCIe function.  So remove the device_type
> property from the nodes representing the two embedded PCI functions.
> 
> Additionally, those properties contain #address-cells, #size-cells,
> and ranges properties.  And although these properties *will* be
> appropriate for these functions on an RB3gen2, they are not normally
> used for PCI functions.  So remove these properties as well; we'll
> include them in the commit that actually adds the pci-ep-bus sub-node
> to each of these PCI function nodes.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Fixes: aa7b4bbcb3a1d ("arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe switch node")
> Signed-off-by: Alex Elder <elder@riscstar.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
