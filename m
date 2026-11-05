Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869012;
	b=g6TGgIM6xe3r/2Jzq05vsYLnFKXus26OyVCqNygLbfVTPtDw5QjdQe0tNTadqB6U3ErF
	 VnQzoVO/Mi2RMRSsDA0Pn7drRWg7wrIU0LBamgyOd4sJWf/3LP8q94eTcSMsOL/NDlg2w
	 m/+P4EFFCxMPw7ACDCRxCzVCnr1lbhRQO6xnUc6tkZhqBfJLXKD9tKU2OE/NYHmCspIcL
	 IFnltaQDb7knP3JwARMFPqSAsgP1Xalz+DpHnyDR/NO445HO43j/QmQ1zKXsJqqlfT7bm
	 3V/cUNMSCMzNvPk+ah6hMwuPCBPi072QbZKOpqTiIBFYEu8GsfoeEwXMrZRhi6odjDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869012;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FB1C5WDv2k0g4VMhoAfgN9Y85xhLplp0at8UMrU44m4=;
	b=GB05n37SA3evxuyX2aqIGAgZaoFGTPzn9aQAr5lNHH00DineYFvyE8dER/PQDmh9v6wU
	 DeBLpghnKsDGFi+qDff74U1uiMalhXqFZ4qB/XIsROxlAc9QCNW6fg4WBE3boIVeybP9T
	 U9aa1KtoF+45NQhLTwSVsg/zL4aHG3bDmzbD2VMzdbuMNc5XIF58hKM4YG1L04+7LpNpd
	 kI6KQfjHWye56d+07QOWWxPqtXpMAJRXs3gQKefA2X6Yyp5rd29FNZvoWM3CnBKhFSZNz
	 nEeaFV+4/KJcFi0izb4l/Km6ARaLMfXYPf6ZUbpegbbnFOlfzfe6olpbk0W5s2kx8ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4jpRyU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjIkJ5Ag;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6442606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:56:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6442606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jj4jpRyU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TjIkJ5Ag
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56UAQK3819632
	for <linux-kernel@vger.kernel.org>; Thu, 5 Nov 2026 08:56:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FB1C5WDv2k0g4VMhoAfgN9Y8
	5xhLplp0at8UMrU44m4=; b=jj4jpRyUuJ2OeSTNxPibUFA/SC0e81ThCh4vngr7
	KVcr0qIwm++o/H86jrwL67Vl/VdAojkju1WbO+ucBsy2uDDMz6tITOZ2Nh+ylE77
	qY/eSZRSv3Rp/gGe5TkAJcfiZmTyINYEYKEHTkNQHQBdIBKj0XfZLbjjp9gJOf6r
	XstmM5Fu10D5b2vKO3wZUcsbwumOdyHlKHjuS/UFe1aHdCfJ8O3swxIqkUIWmzE8
	Bpow4jsCBqMNLIjwQxKK6DGffIe0JF9MMaFzOPMbfAAceQjp+qCyEukvCE9h1KST
	aWILXma1Ln1zMFZtBajr45rH3GE6FelUJnBWVXJK4lhfVg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hra5tk2dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:56:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f13c143c8so313949985a.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869010; x=1794473810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FB1C5WDv2k0g4VMhoAfgN9Y85xhLplp0at8UMrU44m4=;
        b=TjIkJ5AgEe3MW3K9GASPJKsvRdkY2SwhOswYkdpAFjgrzxXbRMsmjeiw2zPJvxJWai
         Lr5s9ggZ1USbr918AjaoRSWCTz/FWVjBOXHLwwfaeTyarZdQdt14x3FjcFEvxpYEw1Ea
         +k0HmM4LeeC5AhK2BBc9jM0PWx0vTOSl2KN/Qf0RImJyoggyzp8PvH4+8IvZF/ivOOnj
         cweAv2HMpSgdp6NepmFzXDzwa3UUqz8bkHaDjH2WLCRMtJrBlv5C6wu6+5SrE+IXeHBx
         fEoMP0WS5S5TfgoocXn6egCsc9goUpcI2i2JJRVSaWNN3NFmqP1r1RSAXoMwYUM4H3lk
         QeBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869010; x=1794473810;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FB1C5WDv2k0g4VMhoAfgN9Y85xhLplp0at8UMrU44m4=;
        b=zgXhuslvmvDQaqYmhNcAK1FvDFWckisKj7TUpnCiwzyZUMCeQyOu3uM6LYtv6JHmAo
         cwnCDy7uircFScPPJ059YMjNhb2wdyJ66Si3FGooAXdfMqW9wtNJTpLHEpRFhjw0AKgb
         iT7h9JsD4HDuv2KVH6hyKI8YHYr2MLGatH7pQ7FNro/hPj8/3yZfvJMv4kmFOYD7/SMo
         Mpwobf2II1BNpLpTNxJylstiu1yDDW6yREyk4iwR18KgzAKC45Fbguf6lHlxPv1oc81K
         cp/HpLrln3ETt3x3/gnejzXexr/jOWaqXqfbuhTtY/EUeAIgh3QrsZDPRTlO24wSFtsu
         PMSw==
X-Forwarded-Encrypted: i=1; AKwUvByFDIbp2gra+tdsTA6U/P36eD11z5PRYSAEw1NXk8i/EO+gZYJqLG4rjq9ujUBOKpPgzRtp6hwErv+iEKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+kEjnkPXIPNfkx0JF1saknUbarSmNsRWzMn55ujlJmMTT9D45j
	t6eD6npcV2v5eEa+qp+7zd9xNceX0zeLMy0JFBPgGuJP+AbWRElIusNviVL0OUVX1DtbVhf9dUH
	qF0EF/mVurdhFEyl1M1Al6PJgXZ+i2KrAjD0s2nPAj4NyW/uGAWWhwlzUasNOeOHhuFo=
X-Gm-Gg: AYBFou0eKQ5E7WqUu2ly3X3IkRVUG3f0yWVMMi6oPvEwDMDYkoU/+I57vqeokYEkCiH
	LCZNGCYjWMIm5ssJjewgA1QJp25GMv46k3z7K18B6+/989XZ+n7LbknQZlNV24g6FquFoJme6MU
	8US9ifarPjPcEHkZLwAZgcLSgaQPvIjrtMuMsQSsevPjI04S9fBAol1tAlcHxFvyEMOyey6m8CR
	wuisHIcKpX7VKM1GKEwx2Nb13DRY2G8dN1buwTZPlZUpgnFB4EyQBpjaRx3FA9uRlcbmrCqTbjp
	Cm/pR+jiKtU5qn62R7lokmCdxUZn5vr+VVFo/274nAxXUP6h2Mxb74mTKtybG/H40ioIQBsA/+k
	cCehQtiPLgE+B+aq8XhBSQYBfOeVQAnJtH12ZSu9VuWQJZZtgO1emq7VET/ohGR4=
X-Received: by 2002:a05:620a:6483:b0:93e:c12c:4408 with SMTP id af79cd13be357-944217cd92fmr2720754985a.68.1793869009974;
        Thu, 05 Nov 2026 00:56:49 -0800 (PST)
X-Received: by 2002:a05:620a:6483:b0:93e:c12c:4408 with SMTP id af79cd13be357-944217cd92fmr2720751385a.68.1793869009420;
        Thu, 05 Nov 2026 00:56:49 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56ef2e968sm58629445e9.8.2026.11.05.00.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 00:56:48 -0800 (PST)
Date: Thu, 5 Nov 2026 10:56:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Andrew Gigena <mail@andrewgigena.dev>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: sm8150: Use standalone ICE node
 for UFS
Message-ID: <dxb7s2d25ixowmfifhvetctpckj7h4y5puiai7orhkimgj7uxu@ekhwvpm536mk>
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev>
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
In-Reply-To: <20261104-sm8150-ice-rfc-v2-2-d697bbce0278@andrewgigena.dev>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX+2iCbGFikCwD
 kMLyUxI5yn5mjVTQqfXBOyuskr31ah8i300yM3sQeg5CykshvFCoVEZ7GNLAxoIu8myXRAU1gsm
 dP/HElWnhk9Bd/+LlHDtXNuffcruwdc=
X-Proofpoint-ORIG-GUID: JoVV4RH_X_7dldr4v5QMxdH4fDeEdySn
X-Authority-Analysis: v=2.4 cv=P/6vFSAu c=1 sm=1 tr=0 ts=6aec44d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Bg7KoihMCtH8JNtkfXEA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: JoVV4RH_X_7dldr4v5QMxdH4fDeEdySn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNSBTYWx0ZWRfX+tNMNDZxDfwa
 ldHOWGMJKCfzr03d/ldYcs7PiEbKXZawoxU2u3XWNj07bs4z4AUiLYcpIghYD9NYvAG5ytPPZVa
 HNxT9JaSbOMOhaiksMkt+jiZx3IDNYFKNV7L1LiwYiHDVG2FMhyO38aF16HVbgI4kUDLaFYjuJA
 Bv0LHPVrxuperaqEUH7TKjvDc54+qzEMzRTtEZxdT7EwgrPi17umlWMIIXKQsuC+XDAVJd6xbdC
 t3eEkeMjqCSc5k/CRZ8yAHvVLkEQNgRA07PGlAo1EoU5s+VaH2eOTTxJuWbQMtMNumktb5BY+BU
 adE3G2xFb9z+Jn5A0aNI1iFnwKt192xxiENZ4gxs0Zu1np2MfvCO0AuaXyxKloIp1UX+tpbVdMj
 zAFl/9Q5CPJvURkeKqzCVcdfixMhJ+W6xaGLECqQhM4xo45s1qLjBYtdNi09WpkRNECzeou3oTK
 vd7bmzhkmBjojFQrsuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050035

On 26-11-04 18:38:13, Andrew Gigena wrote:
> Convert SM8150 UFS to use a standalone ICE node.
> 
> Move the ICE register region and clock from the UFS controller node
> into a dedicated ICE node. Reference the new node from the UFS
> controller using the qcom,ice property.
> 
> This brings the SM8150 device tree in line with the standalone ICE
> representation used on newer Qualcomm platforms.
> 
> Signed-off-by: Andrew Gigena <mail@andrewgigena.dev>
> Tested-by: Andrew Gigena <mail@andrewgigena.dev>

Tested-by tag should come from someone else, other than the author.

Authors are expected to test their patches by default.
