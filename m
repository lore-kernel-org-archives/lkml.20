Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105991;
	b=RkNU1iuKWvTeEvlcptMs0q9z2MEYI5x2tbgbqOk81CIhNW9uLZ93XKBM53M9UW8EyHDL
	 7DBW7m9rCGZlFKq8Efa7ITEbYaxk573IbyjJGotdTzF93loT5dAK3BA1Y29B+lPtDGgEi
	 Y3SA7jPvAjaH+mcBaUZQx+A8cfXG27svvtP3lY+U/38343UmJLPOH51peKKKXaKk+lCQq
	 vSnIii316ihctfNmUmd1jmjY+9bzkpw8vl/i1jCuE5a2V08O/SonBtyDIVhq5HbWD0w6o
	 fpUIeLmvw3pykhKJWPMZ4aZi1gVv01IpCGMwTu/jucboSuTd1gLuxOQMvXklPRu4/lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105991;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
	b=pHPRWGAfzA7P5g0sMfrcqhkYi0rSpdWtK11hrJ5rFMCcjT75mb/H1RFFQOxVw5pFrUrD
	 zp/diwPl6l53oMLimw4Z1BskNC/m2ZBdVQ2IDIXukkT+ITpiXovBHhphl56pCcxxpQZOL
	 ZTGEvr+M5yKey+QjSj5gwI8OV9bTZkruPce/DTekYIonnnPw4LP4JLvGy6hIIFLrvoxc2
	 nSZN2SJV06jGX0NuyrYt9epXjoBY38nkUpISSBZn/ADO2g09osJ3L73SaDma5aNUtNg6/
	 5zLksNPa2jAmlIYMSdaUnigeIUzx5h8UJzzu1toMmPvOqhORlBs96A1sjOSjMDZLtvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971D5606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 971D5606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ui885gUj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KA02GGmJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe8Sh3026348
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=; b=Ui885gUj+bWI4Obz
	FzAbcwkFkUI6t9drRFkPFpZhgb3h2gcH5tCHP5wAncNb/E55O1IIueNEfnU+RqY5
	K/czRHq3hsydzTPh8LI6KCwWPNYhQAwOWjWOFue3hltVc8UN6110CMEcfAsm1vxJ
	hY8LF/kMUp+2V8MY3yXEJNidNEAsO683FzEg2G2hrYNVsen/xMUDD6SDNI11Keaa
	63IAqGQ67MvOmi3fllOI6fmkR5OsLGPnOygZIVkQxerI+k34gyS7Qau1FwSbvPPf
	+CTXjErNZ3fUWI9fUEh7IFMdeh+yMT3UcVqdFVVDbEGkXPDKEAqp/TNmjotZWhpV
	eagBrw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91aj3m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 12:59:50 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-844195cc415so5345249a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793105989; x=1793710789; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=KA02GGmJFiToXYtilHil9yyy9MCX6g3bEB8kUhtF98SJ+41Z9kwJFdFSmrRbB7cn5c
         0I2O2mFu8Aat7iTiGa05Xke/iVzyVXEr8yCzyWNM9oJZeKf/gSiNGYcc+N67UIT7p1mh
         kmfeHf/KqCtJO9rup2jktjra5JHjJac4AGbVCpTQ4AcfTeAreL3KOJ8xZCLFa5S7y+Qv
         +p59c/bppCV+p2vt95Vb9uAAfGnCppJWzoDUwyRpsiMCyd2q/ImLOOjrDqSeuKKpCieK
         ZHX1MH9pSXkNX8/RdaNLvIoBB74Kmhf+7RIPjtAOqFaw1tw1UpqPx8S7zTPOLaaHQg2W
         ZQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793105989; x=1793710789;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNVNz3OBbK+duGqriAAIawFlLoB+G+Oeet6IJhveSPE=;
        b=L5IHpZqCb8J8w2LkF3o+mSd41d8uxoe75aUstUJ+pzRz54Ypj0gtIhxxTAvVVebPME
         8dQAhDVuPVjwxC2WxM1zE+5yrfPyLimFFAWQx2AfQvPTMIlhcf25V+XCl6Bbt97k4gZP
         iyjDDuOyWnGXQl+7H1s/V17g31SJ1tfXiAOmAV6X9ep0o3hYtuG/PC+e5l/MlN3SxxlH
         iEzifz5b9d7fo73ARa2tn3ze9svyas0iJ8EoIZSrfg7cw0MraeXiHPNaus9BDANLJLsn
         EIJ/REeky4STuSEFsuIICpVasAnRD569UI+neRRpxQAnDnNeoT/oYtGfU/HDi/crCNOG
         fE1g==
X-Forwarded-Encrypted: i=1; AKwUvBzOPYc3gDTOk41lYfKBtCgEuQLRi+HN+kkIZ8BbvGGXVTmVGlSjSBWCQQrQpYS3VXIkNvOuGP7/ZIebyrc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJwcLCcXstHKQvDeMu64bZb6LNx124kRMtDnUqTrk7V8OaBgEoq
	xUDNMufbsnOyA7HVLNDtk3fCYCKXNqPF0rM5sxKtuWMHO21r+l61piOKaOQ+TKW+Wra/lSIDu50
	o9nDq9WWGuGylNA1hGxu/+uPivB66XloDdpO+CUWajTNX1nK2nsncvk74zTdODsTnf88=
X-Gm-Gg: AYBFou0SfRiypbMIAb6Zq4QtpY8/ILAyVcPgXOfSCnPt3r7jWrwzeTANysvZlUk6myP
	LfXi5n1n5IDWE7DuZUpw70DAD1NPvIp0ti2lF75SB46hScYKkyHdkIw3KCmPbpW3EuC8ObegcIy
	anoUK5YZ0F/CHKLVSCvFzzOsfE8FCMeKd6m00xHlNfnENT3RcUytey9MwUPrNEf2FwnaJAlAJcK
	uRmWwMW6/Hna+e6ERomUbWgrmQCxpu32z0fKAYmCzzAJKlo7taB3A4tLta7PYLClft2iapG8Z6x
	Bi//LPF+rv5fNj33nMT+yP4sT0W+k3MgWpNXA/E3eSLhm4MWzlMhOch9WjqughZrjBs73lNkcd6
	xXHgEt922wmXjMY3znP4Wsw==
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480128a34.18.1793105989195;
        Tue, 27 Oct 2026 05:59:49 -0700 (PDT)
X-Received: by 2002:a05:6830:2b23:b0:844:5d0e:5152 with SMTP id 46e09a7af769-850feeb8707mr8480109a34.18.1793105988781;
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Received: from [10.219.3.4] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fc005bd7sm11174684a34.24.2026.10.27.05.59.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:59:48 -0700 (PDT)
Message-ID: <7d9112d2-c588-4c37-b6f8-dfa1afa21ed6@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:29:41 +0530
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
Subject: Re: [PATCH v1 4/5] ASoC: qcom: sc8280xp: Conditionally set S16_LE
 format in hw_params fixup
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-5-karthik.s@oss.qualcomm.com>
 <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Language: en-US
From: Karthik S <karthik.s@oss.qualcomm.com>
In-Reply-To: <7dc5131f-4cc5-4c97-8da4-28910a312239@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FOQU9SRNQ22EVmLtw_CIauLgwv-TFk1k
X-Proofpoint-GUID: FOQU9SRNQ22EVmLtw_CIauLgwv-TFk1k
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae0a046 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EIM5vv4Rke_6-YXqskwA:9 a=lqcHg5cX4UMA:10
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=z2U-W3hJrleVIN9YIjzO:22
 a=EXS-LbY8YePsIyqnH6vw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXx7TxGf+TOduC
 EwuJIoOJkSnVeUbPFkpsvWMbzcbYc0Rq0vWx9XNuR32Iu/SSZHAk3aNHqc1eudm88vTvlRwmulu
 wN5WDS0iwbT3cfHYhOUGFcOvlSezHY0f0oRO5PAl2HZhKn5nPEueSYGHiFYNNwTQH2vfki+X2wd
 tDf7FNjPj2dw6V9i0Q4jw7yJmrseS80138TnKrHfLZexUecjdDlCjm5fLkekFZInX1hjMHsk2nU
 XGBoheIoB3/z7dgatn1kCjvkiTGMyoW6T7hTJ0kngTTgW72c5BrgNiYonRdgkH8/HQvmF+Mq7zm
 EX5ij77xVjCq072cwOFp0Mh4GYR/lor12+7J28pTnRGSiGbZDDVexwXbXLo7FyRpiWOBElb9bEv
 OkbXc4GzBucnFPvHovVH8Pad3lbp7EikI2NxgFLClwuJUWCwl0jn5Jrm3Gf3zLhHVB0BQtFQ+Zi
 6ee2c1vWhMUZaAEmlzg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MSBTYWx0ZWRfXx+bn7MvBlA3j
 BbiBfIn6Z5Aqf/3NsugKUbm3LNbcQmKlOxfYm5+5XO3SAmz8uGQg92J1xMRsMqVzRqz98XKJErE
 entbi2+KesQt+xhB1QnnaAs5K+U33SA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270051



On 10/27/2026 1:59 PM, Prasad Kumpatla wrote:
> S16_LE was originally added here for compressed playback ( https:// 
> lore.kernel.org/r/20250911154340.2798304-1-alexey.klimov@linaro.org ).
> Could you confirm that compressed playback is unaffected by skipping 
> this constraint for the MI2S and DisplayPort backends ?

yes, this change is made after suggestion and discussion with 
srini@kernel.org
