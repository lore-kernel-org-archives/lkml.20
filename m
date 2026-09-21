Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B65E493644
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992407; cv=none; b=m1L3wF/JXlTzNZG+hMy1fKFWdt/z3SeB6noRW9qz1tiRkp0YnH2Ov48y+kqDgEn+fuOkQRvAD4WSAMcHxZYbERtoY0bNlWfOypDZjhHzsZyVf+Oxb9mc5UJqvmnEarLIBOTS0pwK6IatH2Lvigq+Lc7mSfKnw4jvSyt5noaE+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992407; c=relaxed/simple;
	bh=8y7/zMoAU5J83AFr8Wyv1UTO4I735JbfICWLuS7AJ38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIapmUwBf8oPak+lgK7PRnZL0i59EPHev7i9KSMjpnMsfX3O13rXycyXolApKYJ00LAyyfOxlKTWA+j/vywCDDmdHtq5Gh6ZODYzn8pJfCmgy9861GwFPP6dgOa6SJiFf0wmy6dF+kbEvH8B2HWcUxgMv07sjoE3G8yCkDejef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY7FEHMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awXAjIJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY7FEHMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awXAjIJg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxUt1563458
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXBRdDppBAPCJg9q01FQoe64
	56Ok5dkROCyGIu6mvo8=; b=jY7FEHMHa4U5+m/pn8RZKDGeIRm2gvbq9RvFWkrQ
	0tL3oM2j7JoLkqLp4VCfGn5TTOo7ZYBMqF0sZw6t23msrINtSQo0MC2asvJZ2WBi
	1pJEThWv7Q+xq/083llZ8gDAIYLVpUHufo5mtmjOa6NRdHMttuIHymKtIFAsprG0
	0P9A6y8VStBGGu2aRXrfr2IQ1dH7QRA+I/xAdFwoV/43ADSUGORUTAZRXtavpZpT
	ljabt8l7RHduw/5X2iYa1QIUyn7R5WcvT7rOAx3x9Bh3eyDZrTrOhZAZ3/VRGAvp
	l4Bypa2IyS+u1pevZHakPIlvam913mON8T36LmI37QMhTQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtysw16aw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 12:06:44 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78f2fe53829so2603959137.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992403; x=1790597203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXBRdDppBAPCJg9q01FQoe6456Ok5dkROCyGIu6mvo8=;
        b=awXAjIJg8HkMsHPROe95CkeKtXoh23ce3G50kcQJXTu2Ai9x9gX3Kr1Yzoe/cbZhb8
         sodXa9LBcrL2pHEVR3P8A7Tk7PzMv3GNQlQBMHNBqjabnSbuXMfxKunuhVPv8bq8hDE5
         qNVVTeoLyapwtaWepycAQjHjIau/3EATj4VxWu5u6KFNGwzq9SG6zl+i8wTJmadv82w2
         ALY8qEpctPNDsSAhBHJiNcDEGzm6kk5OqWlhIVQuKs3DKDSSxPkBe32H705lfrUVIisR
         RcIc4zbavGSOEo1kLDAX8pjyNn0nIAyk+MFBCh+QeZ6vUfPB2hz9R7VHXgDB/5SOKJNS
         0VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992403; x=1790597203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXBRdDppBAPCJg9q01FQoe6456Ok5dkROCyGIu6mvo8=;
        b=vpIVkEqVrB+hBSfxwj3bkYYPGiZIxtFOBS4seF3UuXxZpEhxxneGRP7i4lh+jtoFo0
         ltYyROqr+AcTFB4pDYk/79QmxJ0EaIET6Pv4MqGpdv6Uy6+43vEc4Hj/x7RfsnbaOIG3
         WLZ08c7oCkEpm9Ev3+WRoqII7/t1vvYuJs1Npn54GyCxCVn0jp/eDjkEkFmnoTZQT22J
         4iMm+rNz8GxMGSnlIgVJkHjTVYicGFmjbexxuFTPaxQSKIckhSAc7MS+9b8A6PUtN4op
         fm5EdgxPh3Xh9IwYS/0k1j4bprkkHOGU7qe5zkphFiRTlCAQXc8ijEn+D3JUEmQ6P7rr
         HOsg==
X-Forwarded-Encrypted: i=1; AKwUvBzhajQBnA6gEFrCkaIQBos2tnLJzZ9qHUx3dJYkqC56E0Wn01p9nYqgn/MAtfQZuJZmMzQAg9jbvegf7jY=@vger.kernel.org
X-Gm-Message-State: AFuF++kXeV9bCbwzFAOcyONzFlo3IMplSea32KI1fX9SKG0kJoHfyy6g
	Nb1LAXjPes6jYWFpr711zpj8Sck35MfpQd1HSZi2Cx4I40o7ED3qAHXzKKoMPzRCAIcVIHhmS35
	RhihgM4SHJ+89VRd1gpuKjCTHN1pHwRR01PYtmH6dXDMR6S4DRx0CpJ9PrNQq/Niv0XE=
X-Gm-Gg: AYBFou3TUUQRRRYdd61gyWTESjl1LmVvFSlDmoB9T837wsC3iNhJ+3NBERilURWwubh
	hKD0biQHx4qDLeHGVVrSME+jIKWeevgxMuMBlfFvuWo5IxRmAMbdrNFu+kFQruJ7OaZuGkK+R+g
	OuMvgVeGOhiLkWH/BloeNHdyUA7mHmcHJoJjzugwNb8QT7uWPXbIjgAjekkh1ekZ1mY4jK04dSk
	oUD+YZaxLXQ96oXjuG57DstObcBi6SGtg0eKrtYUtP/yuETwfM/rYRak1ycWJdRGykzVCVIbb18
	dDcv8WCLec8c1FiMa/XHAgwME9ICxWePZT+GNqkyMzO9Vp7C1mU/L/Q4nRk6zmiRCp6mRsWWDhi
	nKFe21zbzs+3GlSs=
X-Received: by 2002:a05:6102:578f:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7a6a25dcbf7mr2563256137.7.1789992403359;
        Mon, 21 Sep 2026 05:06:43 -0700 (PDT)
X-Received: by 2002:a05:6102:578f:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7a6a25dcbf7mr2563185137.7.1789992402738;
        Mon, 21 Sep 2026 05:06:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd115d78sm218942615e9.14.2026.09.21.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:06:41 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:06:39 +0300
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
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset
 entries
Message-ID: <itryi53qwodsqngkeck2ev7hrzg5udg4phmxraicmwngwhpndg@4nqxbftjy75b>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX/lF8NNcjnWV8
 CeKNMGxPkbyuWjMcMyormbTSi8BMcQpnxfGbFmUaRv4JB6Inuvu4rQ9ucfkTvqWteAduLSLXfGa
 EBYiNQ6v+jXqwFJwUxdY1yzMjWzsPpVUsrYRS2owz/WtGzkGGc5W/2iDCnIulHfNjE+hZBfLllX
 DKkpKgGNxWK4bnQGWr0Ria5k9I5pnbuChscxJlGhfcVbhrfUJInOaLMAuoOeDDxqxn7Vs/UkXUf
 uPO8Eb949mckIHOPcT6XRgEw2+83Afo97NCd9Qs9okaYtaDZNQcSLM005VoeUZp9LH1sB/JR4X2
 8LviItRlJT+VxB/FIKTV3NM76w9bphA8f7e9jhvNkKycivJ9RXEUSp5b0gjh50qQdWt16+Jgpuf
 26FlTq5F1WSbvxZ65aOP9zzFrhHMIbkd14uZ5slC7q8p8H41q32A18Fmzj9sLKfUYqGK99P2uY5
 3ImAyYQKryq5vshATZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX4rpeRu26S66i
 a2qUHjULRyAABVCnQ/MoF334YZZA7d+5MUkG2841Dw5WKDT6vyrjdCee+6mpspZMn1X01A676RQ
 I6i+20SN+W0RcLgB6KZGI87IdvFKINw=
X-Proofpoint-ORIG-GUID: nIky3TwpvOQ8HkgF5ua3PXWgiP5SCdDz
X-Proofpoint-GUID: nIky3TwpvOQ8HkgF5ua3PXWgiP5SCdDz
X-Authority-Analysis: v=2.4 cv=W7etxhWk c=1 sm=1 tr=0 ts=6ab11dd4 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=22JUz5MsYadeaJqTxQMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:43, Kathiravan Thirumoorthy wrote:
> Add reset entries for the UNIPHY0, UNIPHY1, and UNIPHY2 XPCS blocks.
> These resets are required by the NSS block for proper operation.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
