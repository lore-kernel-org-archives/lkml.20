Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBAC37BE71
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790686878; cv=none; b=J1Jmur6G7NSGIFuUknCw84bg6OAgv3dFPGxz50d2iBqV1TWpP1OPLnOQJyiTXaoJLQ2fBvwRknwBShnBYn/qCO6JU5bEfS0XiOHwUa8cgW8iAuTDvyg026t4JeUruzvKFemvkXRw9UDF0nMGefV6icHI7RM2jbUAkv2zX8QOyt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790686878; c=relaxed/simple;
	bh=bc41fhPq1AbUDyoEQ0R//kmi81si+zDzpXWyjPOGmXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TU1XNBwsWGYDwc80b3rhMGFWMa2k77/tAWdemTSUoO1dmPCja7oz5AeF9GAR9j5WBo+xmnEmuHc/niXi6Ds5fdGpAm07LdZn+gwfy4SQyAMo5BytPnLlBpCGBlrxEn94eskNvfHwEhS1L+1y3HXlDCk/o/IEOXif7KXC+QQPaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A3YQDfBk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gher5/UL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A3YQDfBk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gher5/UL"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqiVe1577540
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SHTaJ91zIZJtCVD1ysUK05e9
	DvOS2NaF0UZdJm1rljQ=; b=A3YQDfBkPQdwXYBg7n4fWd87UVcMtpmwtfP64YpZ
	QhKTpKx9Jw1SdM31N2x3yaZk9uigW8tUaMAjdPzb4Izzw8+uaPDEBZ/jG5tbW9Xi
	1jm2FVsg95wKSWew1jPZwg0a85eqmWnTfU1Ljv3MjshJt01dxwG6wNt6smHVc2MD
	oWq735BicAqWtEZKZIB3xKz1Z5/nx9kfQfSyHaY8mI23sylDbTye438xXlUL6Gd8
	GV2lDTDt7yGTieKNEmfsD/xbYAzJdjQFrBe4YsCPS/f9bf0WUT7Fge8s4mebZOQQ
	lOka3icnVX9omN4LoFmzLLRY2slsLh1IMJHpLNpfaBvnYw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h09x4s2pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 13:01:16 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988c7363ee1so189124241.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790686875; x=1791291675; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SHTaJ91zIZJtCVD1ysUK05e9DvOS2NaF0UZdJm1rljQ=;
        b=Gher5/ULiKfm6Cm0N5hni+//ZcRmlmRoPcj+4mU0oC/fjZD2bq/DuXI+L/F2AE+dQ3
         czr0br9SpgoaEEkwxQ7/RsfNrWqigXqgcL0Uy1JIuv/Trb+LrauKJ0u51Fw+COzhagCA
         DqjG+c81bp5R9yG+7F9iH0R1oEByJKau83qNXUxHoJapnZzw55FVf0WJwg/qkhsITPxH
         oOVScZ4xVnbPwswiB5iLHv5JBA2KR01CZGI245yN0m7cD+Vv406PclMamw/T0BXNo0Z4
         UC0QAfK9cteG2PsN3ZZX6KE+Sx30++rhWUFKfoigiBKR9Fubm1JMdodym2gCPPFBpsgQ
         VhiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790686875; x=1791291675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHTaJ91zIZJtCVD1ysUK05e9DvOS2NaF0UZdJm1rljQ=;
        b=NvK0sfaF165IdI4ZijqBYtFFkgdv2hQVTrPmBLQxSMszTGCWVIZuuGn1VnwAJqgJHs
         yZwjhgrQMDb1M+edHXwGR2yzqdeoH7YJQ3PQ8LUcCKozaVon9StJfeGrYJPrtULehxix
         dlfThUe0hn/eHO7EZR7ncmpo5ymcTQHC+pHER589yzSJbbPPGlwihq3EMThUG/V1OxMz
         fHox1AwYAfAuC/5UI4Jzi+RqK3dO2BGB/Ge4kQm67v9dF1P2MtGfMlTLg95oeOddjZ8X
         LSz0BI8+X1/eeFy3vfBCYzXSpvuojymkWNsO9ags+0il82dZ++RWARztV4xsvv0EZltB
         H0GA==
X-Forwarded-Encrypted: i=1; AKwUvBzAHN65KQzabpQUTaFLXOYxWsekqBZaVKP3Po3leyxrXXZoZXCkg8bSVtnyVAOrg5vzidz2VJuea0zY+jg=@vger.kernel.org
X-Gm-Message-State: AFq9FYL2EH8B62uHQV/yxC5Z93vM6H/+g3rAIMq6FSQvknBF3EoirCHe
	427yL5rIXbNYaGM4a+rSj/OwKR5Dag0XBT/DKnTkQu76ZzJF5Py1iqvouae0t7S7c3h6gMJ/PSk
	L0Q+8K+/uTgiV5dOLqkR0qNapAngDbtydDW3z8Y7EAqPk5LfSQ9oWdZ4/q78awwU0PdE=
X-Gm-Gg: AYBFou3tuC25Tx4y/YJwJgvIpVQn40KIDjaE8K/ldwhumLsT9sKhJOQ5uHBLi4p5hlL
	gHQeJHud5b9kKsc5BFMwYRGtLoa2SKyW/ymdKW+HahDHMcVICQdOuaHRm3CmSmlNXlw+snuuSHp
	RVpyWdeN/DiKHB0x88lqQakml+d3FOGTFL6gWSMWx39/RxutIcNcBL0fnWMhd9m1usQRWCkzlqb
	Fb7FSynfaSe/INQ88EmlAIg4aIcBvYU+PAYGCwr34xI7EhIE9IaczCd7sctNq7JI6tWfOSefS+R
	5WaLGSRiTVuCeJFkPNoaNxlahYkFocjRpCdd1vXW1XRi8qKRJ6kSSeFJ5lZjXcmCpLF2Gl+DgIi
	B6YrFjRY5opkzb7E=
X-Received: by 2002:a05:6102:32c3:b0:7b5:b51:63ae with SMTP id ada2fe7eead31-7b50b51701fmr2323492137.26.1790686874814;
        Tue, 29 Sep 2026 06:01:14 -0700 (PDT)
X-Received: by 2002:a05:6102:32c3:b0:7b5:b51:63ae with SMTP id ada2fe7eead31-7b50b51701fmr2323457137.26.1790686874122;
        Tue, 29 Sep 2026 06:01:14 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af4f88352sm4244682f8f.4.2026.09.29.06.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:01:13 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:01:11 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: Introduce Maili SoC
Message-ID: <m5g274qs3zyukhzbdx2izd4kigohajcr7btart7fb32uox6h5u@ropvegiaobbw>
References: <20260922-maili-dts-v1-0-ac2b1b76bfd9@oss.qualcomm.com>
 <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922-maili-dts-v1-3-ac2b1b76bfd9@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfX4dwq7ETmwI4V
 NhvPijoqmjdpC0lvmWRVvFqX7VC1wHwfADELOOta1wcDdMFakAfBXKQ7SxjpojCULpJAf/WC6S0
 zLuOGRbonamR6aZNZXZknyR63EZ5+0U=
X-Proofpoint-GUID: qs0jwiJMj1fwfP5fbKKcW5Stn_JYOKqr
X-Authority-Analysis: v=2.4 cv=I5Hw19gg c=1 sm=1 tr=0 ts=6abbb69c cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8uDdfusW4S966u9v8EQA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: qs0jwiJMj1fwfP5fbKKcW5Stn_JYOKqr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MSBTYWx0ZWRfXyNe9hmZom4ak
 4pgrkEvjKXP55CEUxMteEE3TvPt1c1H9EmEwbitEKw5sSyispPItBJiVrrEfJC8E6PgyM/b18Xh
 YB/U0XlBPq1Q6miyfMGfY4bo32PmMalo2ploO0n1YaYUWX+a9/7LxkpCK5UIxuCYVHCUfR0tOCr
 gtoX/aIhfCEjiOdQv/DiQA80o8v0PBn3o8hkJM27RVJP/Z2mzfiI10HH3Kv9c14dW2+TGDkSxrN
 JeYxrnhOI+nsIcXhOD9PpfpVU40rUTWw5w392ST8v/dzxl4kVANdc8FdECRFQufyW2obcS1RNcB
 P/eP03D8VeG7262RBUbn71dEzWCHOCeRJwPYkdg4Ub3Su0AsFmWyoBvRNAzxekpaXqtudbll9vj
 BIoVfL2Hf8ikYCJ4bf+DXf2j2uVaTp1AMzXMHx4+vWNgV3ajnYZiEfCqAc44OW81nNpVjrGUB1B
 M9cFi8Tv0X7slIVTTKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290051

On 26-09-22 16:20:00, Jingyi Wang wrote:
> Maili is Snapdragon SoC from Qualcomm.
> 
> Features added in this patch:
> - CPUs with PSCI idle states and cpufreq
> - Interrupt-controller with PDC wakeup support
> - Timers, TCSR Clock Controllers
> - Reserved Shared memory
> - GCC and RPMHCC
> - TLMM
> - Interconnect
> - QuP with UART
> - SMMU
> - RPMHPD
> - UFS with Inline Crypto Engine
> - Watchdog
> - remoteprocs with smp2p and fastrpc
> - QUPv3 serial engine protocols
> - IPCC
> - PCIe
> - SPMI PMIC
> - USB
> - SD Card
> - videocc and gpucc
> - Adreno SMMU
> - BWMONs
> - LLCC
> - Temperature Sensor (TSENS)
> 
> Written with help from Raviteja Laggyshetty (added interconnect nodes),
> Taniya Das (added Clock Controllers and cpufreq), Fenglin Wu (added RPMhPD
> and PMICs), Nitin Rawat (added UFS and SD Card), Kyle Deng (added IPCC
> and smp2p), Kumari Pallavi (added fastrpc), Vivek Pernamitta (added PCIe),
> Jyothi Kumar Seerapu(added QUPv3), Krishna Kurapati PSSNV(added USB) and
> Haritha S K (added TSENS).
> 
> Co-developed-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
