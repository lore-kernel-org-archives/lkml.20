Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9F0366806
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787908519; cv=none; b=gUbAlHxQ9aObeZfXayxaDYJ0oGf9tAHCzRir/gYBhIAwoMF6Vym67y12jY3zS8e8ihUYZHFdIv2ys/v+qs1YbPeX1plk2POATAGYgo3FPHLzsCQ9YJkdUPRwBFvf/w1EuYaf0Zi+iGuU/QL4lWIAsMDJsPW7wOTZ7J320E/LsSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787908519; c=relaxed/simple;
	bh=vkx2guBaMzaA5PGQ2NLjd4JukbsB134nwJuWbFJQBY4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IT+Xti/0MNTEVpZp418VCrN9WILHig2Z4kCy3MyVoh0PIHzV6d2qSOf+cSG23GDd31X/dfqsIrWI8/rZIqBn9AYP9PIfXOkOrbrsVhvj9ZgDr1naR/fvmiOnUZQxp0l6Bji6Y0lZmPhuRwId5VyyNXqiu3ioDMr5+1Ooh2IIc1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ckshq5me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BczzbjHe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ckshq5me";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BczzbjHe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S85MAQ1894863
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mTq9qZkiHNAUCuhtPBLQ9No7
	1OhjJ39In02KZH8YzSY=; b=Ckshq5meY0rWOIvb9Roe7WYDfSaKDUungroIaNay
	PLjhl5bBc31Vl8JnoplOW5oxYtHDKyvGUuMeDOgvtb0Sl78ae7CA/dA/k2JeCgE5
	jv1wGU99pA/IsOrknecCkcwOb2THulUi8I5St76XmG+oW6cFKkzXyjpuCXVF6+FC
	GC7DHowpnmgGPpgTyrrxpvK8uAQBcK+UDMznH/GSwv5oEZXmgmJ+17OPD9/dHwXI
	8aBIpzKZDxYCUmyjw5fIrvo384rQc9SGILuI9svJGJlGt3vzCueuBcjJd69EXldK
	oNVrVxXu05wbtLLH/pYACw36c931+Wu6+I3uCO4zq137/g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h008rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:15:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfe3fa93bso7865251cf.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787908516; x=1788513316; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mTq9qZkiHNAUCuhtPBLQ9No71OhjJ39In02KZH8YzSY=;
        b=BczzbjHejRI+f3oDDcU46mNWOKek1xB97FzxmOCKKmOf1OQTqLnjET5t+7Xea7dNXu
         g8uxt/4c0BE+G6PghWdGTK5T8slpeWWrB5PEUJPu8DvueIgEVj4L2h5Dxmo2nDNIcHyz
         l1NpRN1WsMu69tXreUN0cn8H04ynvGiRMrh4mPWa8+nSkaHlBQbTo/VEJU+1UwaWVACw
         inQvF6tZUIaKUylvdhBVWlEWWPaVEtXHWdZkS5svOuxN8VEy3HPIeo/kg5n8rrXKZ/kz
         yLkjTpabrvEQDRay2HIMF/0Q31FCvW52H0PjTh0hlFEYjF5hAdzR9sG99zXrYPsjvrdg
         RtBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787908516; x=1788513316;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mTq9qZkiHNAUCuhtPBLQ9No71OhjJ39In02KZH8YzSY=;
        b=fOP044PTWBhZ/WYOvHH9vzZau56x0DqDLxOXtnKoetS2OUM8ul7jaV4HJeEp43nud7
         sTits16AY/zlQo8v9b0WoCvMlD3ZPFUVSnaCnNTck0kY7a3rxYt9lELl4hKzsHm8Nogj
         9y1yRTZTKpa19ut4Z/wqxQtu+aFxiO/UvBT0ps8RRlrFN/jfW28pvhYnf49mEINWvJva
         QbB1UvGo8QW7llnL4hmVaNOglDTipe/vR+ca9L94njAgd7UUj7H+pG8nBO1KIeHkzSKu
         u0kyOVOuNV3LgABCTuTGVuMBlfOV5FBAYYmbv/yFQYN/rfgasxCrYmW47GodxVebjW3T
         H1UQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr0uk5jcZStnm6ifkNC+25d5uhjfT8m5cUzCsazTqE+7hQM4uM8jjVQFnnrga/BpYy4kCt3B4JcqLMQQQs=@vger.kernel.org
X-Gm-Message-State: AFuF++nTw6nvxhF6z504CLkm9SQZ9Ls2KkVMXKEmWOvL/y7drpggL7bI
	dPijNKJFjaOtkgMVjLNPrene0JrUywUPa1BhExHdaKylei3UO89ScXGiw+86gOYSuIl8btlYy5m
	k+Aoy0tNqCSSYI3LeEVgTJUzTwB0yxEPxtek8NR/3JfZDcb29rTnx6ZuKmFEQMJabwV4=
X-Gm-Gg: AR+sD13VsNn2ym2jZ4YBs5B1W7u3OSVKFTSaWJA65QthmlIGnyLyJYvg9lGx97OV0c0
	hANtp8pmijgvRsleDmrC3ctEVk4mhOC/goynic2emkGs9Cy4DokGDeaTu6gRArCSIamee5njAmK
	Q45iJ03qGgN9jb9Io0I8i3K08qcMiOd5DIsCYRWn2i0WI66Tu00nbBKE2CyEqwQVeIkW9a0qyrS
	dv6Gn0HyB+AK5HKkwDhVeEYiDccb/7rMyQnrWJYOwgHjzoGs+DYEXQzOuvElTUyi2PDTYkAnSU1
	lTFXcpD2nAbbADQKXRmGTBtN9hcsEEzc6c0nANV+cRPngSJK6FZONCnVOia5jJCEYjw2uSt7L/w
	oYLuoXVQ4EW1Xeg==
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr60260151cf.16.1787908515971;
        Fri, 28 Aug 2026 02:15:15 -0700 (PDT)
X-Received: by 2002:ac8:7f11:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52fb940f275mr60259141cf.16.1787908515321;
        Fri, 28 Aug 2026 02:15:15 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b90f78244sm71091685e9.10.2026.08.28.02.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:15:13 -0700 (PDT)
Date: Fri, 28 Aug 2026 12:15:12 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: hamoa: Drop unused #reset-cells
 from TCSR node
Message-ID: <oae6lszsj4ommijvol77a6vcfkbs6b5bhd63bhl4psqbuaze7u@ewetkfwppfoa>
References: <20260827-hamoa_tcsr_qref_0826-v4-0-663c9d30468d@oss.qualcomm.com>
 <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-hamoa_tcsr_qref_0826-v4-3-663c9d30468d@oss.qualcomm.com>
X-Proofpoint-GUID: OSGxzLwseoDboLB2Y6SMuwWRu7Zpt7vu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX/Jadp3xoPk/2
 sJ8X82MxMUtaMZoREB0XIo0Mi5QaTsSXgqkodTta0Q5FQMz8grUd6sVL7bpZL1wbZ/4V0xTVA3R
 u+UacRAc6+ZX/ngczo9SmK3Nxqo6eOw=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a9151a5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=oAhxQwU1FG-qALgQiYoA:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: OSGxzLwseoDboLB2Y6SMuwWRu7Zpt7vu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA3NyBTYWx0ZWRfX9ePHdiWcfYF+
 R4gQH1RGH7mViq+eGmfUPoro64Zk62icNX3a4DIK/ZxiC/rVyqz8GhTOCkbxMJS4yVKzVxoJF7d
 xDZ1elmtQxEb8BfKIIE2xwHAmnDYVEPRU222KrUHLJIDDnAz8IhQ/Bakn0gO4MeVX6dClW9sE5Z
 bQyUYsWcvzVoCY5RGqKIP2wOIFNtjwHfqQJPsgE5k9VITU/qwyojC3fjOAx9PSTRZNQx0Lk9NXZ
 FpzVocP9ur3WqWF1di0/PkWAIiQMFQWSjU0xsA/UW/tmC0LNNbYAxVJgQpwDpUfRfjN7O3hF0UG
 AJaH3jZNrJCM0ew5Hk+XPVmxbXR8cyB4TIbeuUgMJ1BCviRf8hshKYJYdNQQqPqKH+cupEHXRAl
 GdYfGQi9UXJphRr/TnMaM3sh1AwB86ojOzZkKYCr1l3nfIoe2DxDdQBugg22U934SP4JM3ymJGL
 uoZBx7jvZ8i6G9oVMqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280077

On 26-08-27 23:00:35, Qiang Yu wrote:
> TCSR does not act as a reset provider on x1e80100: the driver never
> registered a reset controller for it, and no consumer references
> &tcsr as a reset. Drop the stale #reset-cells property to match the
> qcom,x1e80100-tcsr binding, which no longer declares it either.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>

Assuming this doesn't break ABI ...

LGTM, otherwise:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
