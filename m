Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4775D48FF92
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992189; cv=none; b=SeX2tOR7RizB0s0UpkLlSfzuDwdHttb9MZvY2n97AEZlmxeDU+w7zzc9DhAAAO9Wrfncdsuxi7NmN37VmnVUSpbdFTuGwp2Aqun28NBzJAVKRVAELRgImnkdPz2dcys2HP+qC9v2PYDUZdgg8EkVEDPZHtudhIXTeGT/zR8yyqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992189; c=relaxed/simple;
	bh=KrMmaOz3/B6mLprGBDFofBWhY9m+yMGMGlz7ua+NZBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HBtwxnhA+Nu63sNRO8JQ3fIj5uksLriPSB5wCM2gBClcJxnZUigMZilCxMmdedYp9FuRN5MCyeHuxJ7UYqvPRV1ogUotpuMrePgC4oVksGa3kZKDSGiBSDfQEi8TGaPGBCR2+eiwQBCB20pD0ArL0dTT09ccYsmIY+jXvnUNvak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W1kyHEfm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J/VhdcEC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W1kyHEfm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J/VhdcEC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LB4HCM1128769
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dtVe7N4NXxJzsEz81o96S7Bz
	tivjUwZ+xFnS9CSgSEs=; b=W1kyHEfm1p8TTyAdLil5o7Zw5BTPRuxB59XGDSY0
	QIcJvksg3DGKEmoFs16i5gowBRIE49RujsEeVGRLoGqOMIU01VTTYeKmVfPux7n3
	+9IsvQBZd//GTpdNanmMrSbJW++kFQOlwZstLAi1YoSWhS56wa3WoRl3Jnj1iFlA
	gosL1u32lu+5KnrgdNaraHTmGL2MCTg9AA7TMzTU1O97s4I0XtUi2o6jAbBOE/PF
	boqHAiFbBmpS1/8IqLSTVjuWlss7Oe09HJ60oKTp+HxVW7DTpsIDUR1ttUtK7wpo
	nxNFPHtykvl7Vfl/nVRjMSfjGIx0yP4AHiWH35P+6+E8dA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu3csg72h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:03:06 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c7c0d2b0aaso1398691e0c.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992185; x=1790596985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dtVe7N4NXxJzsEz81o96S7BztivjUwZ+xFnS9CSgSEs=;
        b=J/VhdcECtPeLhKuWi6dLEbey6MW0+3Vxcm4DN+shmlfLkb88D+4SaYjGRA0ySguN76
         ncRUC1LoVVTwjWSfoKzEN9G3sUvu2bXRkxxZfJhwiHEP9Arrlp6WPXGIxnRDHjWZr8LK
         GezKUMolSZBOKbqUF7UTqI1G3pbbgtjkxjZx6OoJbu4cdRTZ5PZoG5C+IIZr7goveJhp
         GF0mUe37H1159VUWCvW/1N3yFTE8gc6M5brmuCTUlNHJtKRYa6orhJtheRwIHhg69vc6
         xk8INpSp5vA5544iGrcaQQ8XEdFoYyUziGHyOnZ1Naka6NnSmE7/AqTD0EE58+kS1t/g
         001w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992185; x=1790596985;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dtVe7N4NXxJzsEz81o96S7BztivjUwZ+xFnS9CSgSEs=;
        b=Gb5DTNOOWZNLbg/LdlKoM1e4GBIzF414tIzfJu+09Js2yssfUNKMMT4gYzov3tHa8S
         B5LTvgkOtzE+4DTJD6dGCMp5ob/BEuYfHPVH6RbA40HV/EpwXxnnGGgPk/zN3fKglawZ
         Nz5BmMcHykwy7sddDFUfzWSwtVqr3MFdr0sLPHkhy0RV0PCO/IT3xlEnymEsNQv/Ke2W
         lD1G9OYEr5EBi5MmQZQ99gFGumlhPozPE8n0YPT50IPvr8Li6YRmR+KSQmsan8J6/IJ5
         151yntChTldAtrZgYa79dub7lUjhUqd6SNy3IJdWktRs0kP0z1ft5obMhwZ2TZQc3T3M
         ql6g==
X-Forwarded-Encrypted: i=1; AKwUvBzJR3jBDP7f9p47TE0x3YlAjPYKsL4nFj5SSu23CboXWZkhHAzu4mfBxMy8+CO1vT8K6pn/Sk8ZCJPCL84=@vger.kernel.org
X-Gm-Message-State: AFuF++kN42HnHhlOZVWDyjwlnJuIRUCw5BptXoPrqeWknxsd5vsMgaVf
	4oByI31ycVVYnhhBRdtfj4b6fBweQWSnu+rJchFNpZaKOUb1EPkhiDH8VZWAjnvPQotD1agO0Hx
	gVi3Aj6KEorWhOzVXymutc8p5K/MbdoW2hPj6w8RPAR0r03PNsKTSr/XW5X9cu2hJuBY=
X-Gm-Gg: AYBFou3l9NEav14IaHi2t8gqFx9I73+hSRCWPSKItfZLHwKyKG5yF53N8a2IJ6CliOF
	OoTTNkD8i6dOONiReg7uCH19eSLRqDHnoxJJVNyCjgP11JgVQcMbVeORs8PUiW3PVhSCQpj1Aar
	auE157hp2yOUvb3xC5wi/IqPUOkddcAT4M1sWx8UMbw9uNBFYky4mBFdVH6rtTZulfxgDPrF7Ha
	2ogUKWo3pFauALnfX/udlWQQ/7OTNDLqlA69jL6F7LQAmRP7vGwoe5j0nmzObYxXE3jyGJasGF+
	ZhQboTs39tuOfOlJjNtBGr6Nr/PafYyTj3LFXk55m4P12vDSHuWHz/T07L4Ijue/VcxTN9CkA8r
	eNcsGxTFf795yaw==
X-Received: by 2002:a05:6122:6b8a:10b0:5c9:c60a:e9b0 with SMTP id 71dfb90a1353d-5c9c60af4e3mr1306949e0c.22.1789992185253;
        Mon, 21 Sep 2026 05:03:05 -0700 (PDT)
X-Received: by 2002:a05:6122:6b8a:10b0:5c9:c60a:e9b0 with SMTP id 71dfb90a1353d-5c9c60af4e3mr1306917e0c.22.1789992184755;
        Mon, 21 Sep 2026 05:03:04 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456ee4esm21504766f8f.21.2026.09.21.05.03.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:03:03 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:03:01 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 01/11] clk: qcom: ipq5018: add 24MHz rate for USB UTMI
 clock
Message-ID: <rcmwsup6di3nmi2qwnayspzmxxqaidsplx5hlezpyxuu45ykbq@arnpm3epmu6d>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-1-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-1-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfXyaVTdvhnJUX1
 Ri0QEPfDbPnHBDnjOikyZbAVp5vO4KJr8JDRROn7d3e/QHWG4N0NAzN070bPXQtxFq0frk9tWYd
 LPT2LS+meO7/0diVMtEbnl62aK6CZCs=
X-Proofpoint-GUID: H_IRS-9Zj319EDsmQMl9mhNYasJobp0i
X-Authority-Analysis: v=2.4 cv=QovLTlyd c=1 sm=1 tr=0 ts=6ab11cfa cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=JaUoqYncsU2g2DIqJJIA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NCBTYWx0ZWRfX8TmmmY71cykc
 9hc1Zw9lRQ+WKyhKjYE4dnRpF+d5Go4LT95cIh3VMJ69e/W8Bydv/RX3GHYRvQRODeQn+Q9rHIR
 FKUVQCtUKKHhjq9/+WHBtdrvLAss+uPPJPj8tFvEx0cyiqHflssgCcjxxxz0RVWABAQQBNR1hfl
 oTCDkcn00Sxyz8RmnXUKWnxK2h0YpmsB/KX1ZnUOcGjiiCq+Qr4yLz6Se0Ntdwsdbj2PK6m16GZ
 ppsU8H6TZKlYEEHD97vyS6akzavi47falyGQI6dEIvDEhPRjnWvsbSO/ogrKWQ6eYG8D9A4xH7a
 v8TzS7UskJ7SVzUEbXViJ0AW5zHl2mwi76k5hgj2aRFiXBJ3OxtB2SgymJGE6XOIxPVK2N3nSs/
 dUUq/yYDEldky+NzG7yOVLHj9C4/23V+Ap+nU0QWHf2BJ3k08lDKVjznQYjeGduFzW007i3J8Vp
 2LAPDcP+fh8GEgkqWJA==
X-Proofpoint-ORIG-GUID: H_IRS-9Zj319EDsmQMl9mhNYasJobp0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210174

On 26-09-21 11:49:34, Kathiravan Thirumoorthy wrote:
> The USB UTMI reference clock must operate at 24 MHz, as recommended
> by the hardware team, for reliable USB operation.
> 
> Validation showed that USB 3.2 hub enumeration with USB 2.0 devices
> fails when the UTMI reference clock is not configured to the required
> 24 MHz rate. Configuring the UTMI reference clock to 24 MHz to resolve
> the enumeration failure and ensure successful device detection.
> 
> Cc: stable@vger.kernel.org
> Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
