Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACFF4F3927
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 17:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791568524; cv=none; b=lX3nElKFDxXc5CLJ8D3ofx3/8ROAVIzacW4Ok8g+MemtE5e4QlPw559rC9aU4buDyMvrcPBdejxE0d2u7nlnYqlbYKhCRnGNLkQOxNLyXiesMK0vK9/bnkUnr1XfpKh3eP4FP9EXcx86DiC0YufBuKoT67luBuTUbcFXS+32/Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791568524; c=relaxed/simple;
	bh=iEOHEFQwaCBVSsgwFlHdaofOAFLIBr7wK2sbSF616g8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqk943lZ3WwlyYqx7DxvKtfCiTeHVgHlUZEmDIySX3Si5KN5XDvvEgZG/0zdMPf5E7z5Z9oaznO375F770+AGDXA3MXWiOhMFSJqh/DzBcKrFKmNCdIxJ7biqZATSEE0ZuUlmbrDQJO+7nXoyNhkAa4SKXigza5yO8POfJogen0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VofSxOzl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW1JhgsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VofSxOzl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW1JhgsD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699HZS2R2143973
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 17:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fET6JJlgQgegeTec0LONYZT4
	3AzcA9aszdgk7MPJrKE=; b=VofSxOzl8nOTYLTNkXiYEgilg0PT9TcnNV//cgdE
	HHyzxV2Yy11Bk62/hteji6zo7VhE8qIEGTFtFZ1nMcisN0F+IdhJC5xAgHjcuXgm
	oqLmhfv7Fd2YOlbcGl5ASJR5BQeSPm44VoJ7l7Znoa5vsgyDhxeZi+ggzp5TYrFQ
	5qr1F1/dm2TwILPMay/sSAvoFuYmq/MQKjFiK2gaCHJCoEZIQNgXzrZdB6aUeCC3
	kjLcvQC1JqvE426mngo3/kh3qqQjbTbsXemUUxWXMXbxJS6raTFWCuW19BYa2dPs
	/WGRJ6Fn6HhtEOyG1hv413/46jWjQVEicetgJxYpcgaAJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7r2a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 17:55:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939c30aa9a0so769526585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 10:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791568514; x=1792173314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fET6JJlgQgegeTec0LONYZT43AzcA9aszdgk7MPJrKE=;
        b=AW1JhgsDatre0NfhzNdIVqp4/f7jmSzL8wb8xRaqxQn5egA8weXO77ZnxJ9pDZevlh
         29OgcdxxzCTS61DhYMIOvEib5XzuL4aj4jipR7QFb7mOeTV9BJZ2NsZ/cOuxXOYiAveR
         iaZDIBoB86FWRee856f7YFDkIjQFwy+5ibnUfXUUakgQpqyuC2gAr8o6VKv28BOnbJrk
         O4QJlkVUTpJEOMlSh29sLqWPShf1Q7FJ4lxjkjCtbz04lCehAOiSiqKnoTpt/zXTuiyD
         25rSrTTZ3hm+X/QKEEC+nNHPulCCWXGx85rQ7Q1xYNs4A6sztd//immMVhYuogI8puDi
         6/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791568514; x=1792173314;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fET6JJlgQgegeTec0LONYZT43AzcA9aszdgk7MPJrKE=;
        b=PtaimIZOVjAK+lcNLGSiZXGlVFaMh9l63rHovhrwm+x1Sgq+R/7jKRrZ0jHeUZJiPW
         ej5nvF/IqcHoxSq0p4vMQjyPJfjD+aalz2Dew/kqmLrOhYIHMiaKgDE3FvAVr3v2XYJK
         ELrkWiR525g2hlU8UzuMnqNM6bttxoENSJVEGBFCKlOJZZ+OsbA8oA/OADALqb5fyptN
         8GC9R7PPayc9RlsFVqq3bC1mCG95QeJutWSt43qrXg5o4AeBDMkwDQy/vJu45zOFsv6u
         o9gRKAnxQrXVzawyjRh0uUM25isCN4TLtryWm2AY7R9BDjCLTCeSIbvXbYgywsmXZ4LY
         k2FQ==
X-Forwarded-Encrypted: i=1; AKwUvBy+SbT8MP8Tmv4fKVCcRKb0wQem2BjddQMIFW13M6450x6igSUnk/hd5WLi4/DaBW/RjG0PH7wQpckh1Ag=@vger.kernel.org
X-Gm-Message-State: AFq9FYLLqNY3Px5EeKvrkZO/F041enBmvGqyXMCk4SJfQSwSP+UMMZjL
	dhs/EfPnu95SXB0F4yMXAtujF+rr72mIJUiG4HSO1mEo4Nz6HwMRcxxT+hHNrMlhIETwFt/8Wh4
	jRQw/rfMJf5FY016PP+oODfa+VBPukljX+7ISKg+k6+J86RVqRfOavPS/NufJxmKXYWQ=
X-Gm-Gg: AYBFou2tDv/M8R9q747OCbA77aJoNOfGFklwKEBrLJXL3rAl33s6hfVxRjupCtTmygg
	2ySwX2nYnRDWVx2k5kI7JSf97mFrakz2p551Hjignh9qU3av/TPyckYed2vlyOyWVqnHjRI8PA5
	QuYnmPXrQPQW7pSD+dbSCHpooMxyOkPWl82aU9KLpb9TssVuHsh53NBSqOBWFBEDGydcUOl+R7x
	Y853J67FbT9wutiDfCBb+Us4aMgFSWBNmNYrOeM/f7HHZ4UU/dfP5NYAe8Ejv3yQ5MSZSubhfCt
	au0NWdpIkA5QeiDWx+sqVNiqSRXrSE/PPFmK4XiGlDRQZeOeol5POfhkZrTlMC1q27yNePGJe28
	akhmDxLdoEasLdzc=
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr226088885a.82.1791568513676;
        Fri, 09 Oct 2026 10:55:13 -0700 (PDT)
X-Received: by 2002:a05:620a:a405:20b0:93e:c12c:fbd6 with SMTP id af79cd13be357-93ec12d07c6mr226083685a.82.1791568512885;
        Fri, 09 Oct 2026 10:55:12 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db98c2800sm5036154f8f.26.2026.10.09.10.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 10:55:12 -0700 (PDT)
Date: Fri, 9 Oct 2026 20:55:10 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: nord: Wire UFS PHY symbol clocks to
 NEGCC
Message-ID: <wdu3imzn3uyuyf4bx63taw3bsdkqfj33bwvspv6qksqqzeywri@m4m73yzq7vzu>
References: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008085640.3512895-1-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfX6WH+gs2JHmXh
 q61v6Gwd3ATjGmJQnhKLVOSOjbWOAzFJ68XR+k30jhwJ1pSJOkjbDZt+uLxRQT43kM7MpIC3cFA
 1uKKH1jYWE4i6TZiPR6VEWBkYRKKIEp6jOQ2dvgTyxWj8GY1GEvBhJJad0eiwpT/saQDO733KfK
 c/oTZ7lvIwvf1JpzElJRHC1EAuQuu1vX+pyAB64/rTwSwpDigAt4uNakWqFRkxZ8I03htqka2VF
 2uxVf4eXpGTQ4m5TvwjooqpY6f9tLVrcamDaAeB/iWxR5PZQ+xYx9lggTSwZTKSnVrMYxr4UuoK
 /ZnnwK2ToklKEmWKnUvPD5RvVyMbiGW0VmtYYSZCEvopdxBTQbSIp6XMUJDREJ4N1789dXgXpc0
 CLykLdkuZkNfaAeav/SWo+uuCBNpzqJz2visyIESXYb6dfd7Xe+n2oLdQm0r/rzadq9u6fVKNNL
 9qcPk5b69VdYpv6NKkw==
X-Proofpoint-ORIG-GUID: Svkqc1CpMIHtKGK4r3hV1nnVwxCL5iNX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA3MSBTYWx0ZWRfX/c4FFolD0s9K
 LkLVKfa1BU1SYpA4rmye9BRkoi3d55nFruKrn5TjTftZNnCU2AJj7Ulsz3QUv/ZTyBiH5xokfBF
 IVmrGgp9meM3hf5FQe0dDRxdavG6CJQ=
X-Authority-Analysis: v=2.4 cv=PaFqFShd c=1 sm=1 tr=0 ts=6ac92a82 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=EiYrS7xXfcF7w+nkr41hpQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=CT77jpgJOzp5x1a-ItwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Svkqc1CpMIHtKGK4r3hV1nnVwxCL5iNX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_05,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 phishscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090071

On 26-10-08 16:56:40, Shawn Guo wrote:
> Pass UFS PHY symbol clocks to NEGCC rather than leaving the NEGCC UFS
> symbol muxes orphaned.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
