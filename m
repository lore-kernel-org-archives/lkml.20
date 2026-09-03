Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B165C33AD8C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 07:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788422089; cv=none; b=lZhhXtlcBqeX1BqWWDld25xEVWpkCnnz3AR4i+kkKKhPDi3j8p+lPEhAsT3BPeLSvvZ8TBglB0VwLAS7r0Ms3mhXno34eZ5ycQlbSVqWCLRQld2aetCv9b5GO54W0TFouq+t4MykEDshnzJe0VJaTjTnIl76cmkwv9d3Ashewtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788422089; c=relaxed/simple;
	bh=iB18IptzooZUR/n3KqRc65pMlvfNH60ITGcEGbAT4So=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ghNfqOPdjA1h/I3wf5/1zSKY/ZLFKPPtzbUzDh1qyraigRj75TztTWscha7trW9oy6DrKOq4I993uFzCwGbTWnW8mlyPGKQPFdKqvuUgUc+/TrT9cdWRBzU0nawNTbvjAg89ayydFJ8k1dEhGvQK0IUMiyThEmhnQpWwuC5nkbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RAskscrQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CIjxJsJN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RAskscrQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CIjxJsJN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835lccv3641941
	for <linux-kernel@vger.kernel.org>; Thu, 3 Sep 2026 07:54:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=; b=RAskscrQsCQcVvY4
	dm9EQJRTocP2QJ1QuFuAVLvf35m2BJoNnRJJ4ntBNCxWxMMrfbJ2pLxeZnKO1pk3
	v8BIH8PoUh6QyAnHlusBCCSRxQhNoSoSkdtxcRSv+Q+uQf2ZmRRhqms15LYn19eO
	B8lH+jpaAnXSEjsy1EO2aSI1MJ1x0YdzMC/n70OFjiEj+Yi+PVNZilQU+PhA/9UZ
	EkKxXIfsqtVZTLTbrpMa+FgzgElM05Q7S17GBKMapUPm79fZ3uMhh6QQ+eT3B3Sr
	H9b3LHmj1nZT37fADALhLB2Gx6QgfNIDtGkZaIVIXYUtsYLdg3xlQW5Y9V0BlUfX
	0O3zlQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4genrdut4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 07:54:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso50490085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 00:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788422086; x=1789026886; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=CIjxJsJNZUI0I5WX3Qt6bBq85jGd1h9i/AAjPQzYMhIPl79YbsC9OuyDefKwXJ0Ln9
         IT9JEtWmLv3fXZAXU9B77czM2Q4mJYrxZJKLQhvf5QEzEe4904x+VwFSQBue0ooSSWUx
         N55nDIQG4Xnf1ltZpwtiwOFecq1vavyW1mqapoAzqa4d0FOCNMudWjECRXJzoopV3Loq
         Opzay19BYsIvXV6VYiiFRsR9+69kFJDs61VvDGty32T7rHeU6x0GneSXHKvuIlh2ckt9
         1aaNp0MAIdFXAFuVOTqvT4iBqyEupmr87cLslAn9U7zntYgD3OWPYkVyOsPymIoTS3yY
         aT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788422086; x=1789026886;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2fcDfowcmb0Fy77GnQQJjE8UHWSmrNgm2oaE6E2N+Y=;
        b=lQ/mo3j31kevyxaX7vcgbNEZ1obqQ7JRcT1+e/2BRoQViQ+mQxsRprUtzQqzMW+IJp
         42ZNXgVXZ95fg5fbafArJiVy2TJgsTWLjPQY8h4kWjbhf6MkYqa5cwrC3ESx2V0lrQNA
         Pwz3xApcG7WoePIDkpKXaVao1i4ePfXTBrK+tt+m7YgKoDIpTQ0RVnBHTzlL7oGHPPWQ
         eqAv3N68/R1QuNYlAzsw06lEMM6qRAOdRUrCm2C4b2wBWyNAdSTMsp1fjAHxza5jKGIa
         S5/jXV2usIQxBFwhaR/HG30m18yqJG2sBy3EL8VDFiHtp24lmCCtvR8V/gsy2DI0vTN9
         OP6w==
X-Forwarded-Encrypted: i=1; AKwUvBwNLZl+3GIqrjoUoNisYHKLMw0z7eMhI/FkpknvLa/SI82UoKeyBCrMNaI8jyIzxLJdSGxO10jOdN6LugY=@vger.kernel.org
X-Gm-Message-State: AFuF++k6MPxzBRFf/Y1KhKy2kqSWd8vQKydrGUpqmgbJwV1c7sXmbvOy
	XjIwO2HhKVO6Zr8PddP6pB+s+Dctvw73B43W2mc3P/nMH2VlkuefabLDyjQx8r5v+Kg0onwkF/X
	a8aNxsY/VARB+2ebB8tTU/FuIIpWy7KPrVahGYumXur9B1NaYlitc9iyxgVXBxUm1o6Q=
X-Gm-Gg: AYBFou1DZziPHIgSccbeXf0ya0PECn+cI4dfkhZn9FzvS7+CwxX8pqYCwUrWx+j+OOB
	sQBsUPKWhEn5Blt+HZj2pbbbGXaOSouje6eBphsUbDd7bX3uq9kvQVohK7bpE4/czI+8iKXufWh
	kAhG0vMyWOkyhPUcFsYFJ2Pl5SBrfw0E5T1dw1wAV4GMjFyhJ0UNYZlILpgqMFjgjGHS+Uzgyga
	ND2sSUcTY2n0MPe93wZ0IOQjgoBJADf9QPit8ltVRDjbvcSW6YyJd3770XeJqc3YpS3GcgT3RiQ
	S6EWRL83LUlPAfYP12RB5JmA31a4gm6ZJko/RMyWkhVuDievMaZFlo9FL5+Er4+ggPTBms2NT8n
	XXN3VgP+1iU3pRB1XAto5ow==
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723258485a.6.1788422080672;
        Thu, 03 Sep 2026 00:54:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2704:b0:939:288a:8a0c with SMTP id af79cd13be357-939610b5598mr723257285a.6.1788422080144;
        Thu, 03 Sep 2026 00:54:40 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f41733b2sm60942866b.17.2026.09.03.00.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 00:54:39 -0700 (PDT)
Message-ID: <fe6dfaf1-521b-4818-890c-1bb1c413ee44@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 09:54:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/12] Enable USB3 for Qualcomm IPQ5018
To: george.moussalem@outlook.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Praveenkumar I <praveenkumar.i@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Nitheesh Sekar <quic_nsekar@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260825-ipq5018-usb3-v3-0-39be0955a6aa@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H4/rBeYi c=1 sm=1 tr=0 ts=6a9927c6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=cwIZyh-EchK-Zb-g6cYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: AMP-aiYaUEAAc1kaFBKKsqNlU5lzWgT1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX66q79UMZMiRJ
 J1dkOKYJEL5sWRcqhHPYmHjqIPP7QSvGeL08DXhq80wC4Zej9praa3kNacObbKgSSzExDXvgjMn
 xqnt5Nocv2fz9Tl8PKrcSRBs0JJrkD8UN7yZGsUXnGH+f7fc/q4dQYYZPlqw7iD1oBetf+XloSa
 ooB5MKx6SRakUnplQ2yEarqlRWTe373Jsi32WbxXfmOlYc86lNLm8Uh8XOEWGfOKpwUy+D33LMX
 9lE3hDI09+BMdVxQEWpjFrpcejKybKHC1aMmuuMNVBRc1zIogm7gl6Q+ozbPKco+FSnZbvC8L0+
 nq4KV6STovWqYDaXK1+UTaWW8LRkeMDhN+JF0n90dnRY5z1WojKDH+vCiRkoPlRnU+RiD0bkK7x
 xunQkH2TyHQ+fzIgi7XjGHwCxp47HaqHBrNunnDT+TeQPzAHaasf60XsVkjkl9jk+tWumJonSu3
 14buzy3OGxl20z/tXqQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA2OSBTYWx0ZWRfX8oW7rEio/30j
 UySlU+kwB0AlPFkHaSAd01nkNrvYSn9GrVyZPL1rdF0APxLDBeAJx2AVaiJ9RSh5Z9Bfsy2K+U7
 re9TvxMvVPNi4nAsJYgh6eNOztMKXs4=
X-Proofpoint-ORIG-GUID: AMP-aiYaUEAAc1kaFBKKsqNlU5lzWgT1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030069

On 8/25/26 2:37 PM, George Moussalem via B4 Relay wrote:
> Patch series adds Qualcomm 22ull Super-Speed USB UNIPHY driver support
> present in Qualcomm IPQ5018 and IPQ5332 SoC which is required to enable
> USB3. This PHY is interfaced with SNPS DWC3 USB and SNPS DWC PCIe.
> Either one of the interface can use it via the mux selection present in
> the TCSR register. Current patch series adds the support for UNIPHY with
> DWC3 USB.

I tried to get to the bottom of it:

0x5d_000 -> usb3+pcie (muxable?)
0x7e_000 -> usb3+pcie (not muxable?) / for PCIe1
0x86_000 -> pciex2 / for PCIe0

_however_ there are only 2 PCIe hosts and 1 USB host.. 

Unfortunately the router SoC docs are very limited for me.. maybe
+Kathiravan can help.. 

Konrad
