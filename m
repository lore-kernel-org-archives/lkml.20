Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779433;
	b=uycO7pHlSvZn82gEzyzoOL6hm0jlaDLoDo2WUv2eA4QSwDlXNZag8S9YVIi1Fv8qEFH0
	 4tlp9Lo1BxALhCGYEcIMC8jw6zK2o+GjDB+y4bREAIBAyJNYz0Hro40HojL3FYFU4/9Lg
	 +qizi8Mx1Sb7u8dtWChR0mqip0MxkJIKG4JGiXctiIvCisfRCuiTPsBt4iytn5/ZTtgbn
	 uQMrtOhVqg1wpQQFVI6ra9rAKRVWSBf+7JEPoWoQNwYLXuB3fkcUed1t9UT+urCtcjcu4
	 kKjz9eqpORcpVch+yZll252AE8RzRKTWpnfospuapp4Ap59sLfL4fSsTKf0i8FXRibg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779433;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
	b=oFiYxzwziv+SQ2wRROqLv4k/Czg0TvCweweOqjJAnJo3Qy0o812eY3OceTaBI8+sSq6v
	 SzZ7ht2jCYBIaypqHVJBpEwXqhDfHwXGzoh8Qez63WbV4pwVPshGNgHw/p9pN8cQ9pmwD
	 Lr4GRq3iL9a6f2vRoPsFHuhWIWpsnSKUWXZRloGpkbxw4Xi3RHBu8mFhBEbWMs1tl0N4z
	 JF2+uYzaosrCxyjZw+4l6MU2ohzRFd6pLW0dpFUExifCSBBITeHX6hVIVnrhuEMCzn6BP
	 pxdTp9PB472QrhQy4lZDk+fBvStguwMMlnotCynIg8hl9REdN70qtKYPQQ9b5xHzEeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189D8606A329
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 08:03:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 189D8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NgIQJR2k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FPrMQ0GJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A47GnoE1247825
	for <linux-kernel@vger.kernel.org>; Wed, 4 Nov 2026 08:03:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=; b=NgIQJR2kMDg6KvMh
	1FVNp5L0EWvVnU5Bq8CVSln3ewpyUsV7Pj/bEHayRAUXLEjpYCDnujxPz1a4fX9U
	X+93cPcL7xDRyiEMLs54jHIv4eMLvw71YfDGWTELeV84byvpUhV4jpe7aDH2RSR1
	KE4oVh/hycHS5OiS1VcKXMCNJwHWQmtnTVXl/w+nNsB4e1pv9iw7AujOawB46pwx
	C9qApE20iw9BDj/GMQM1pfY4Tm+q/8sFJ0Z0Q4yGBuDRO5eUJQznPaae6s6ZS0bl
	z7tTwtEgQwuAN4sogmRxFNw7JF7MQ/RCq5j0K28CmSTcybK5uoNLCUZ2Yvy5j96q
	TJhk1w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqpuva9qr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:03:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1440e081so14494685a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 00:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779426; x=1794384226; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=FPrMQ0GJuyaSguLfQ1ZBvEJG+Q43p/9mECrmpdDd1D+HdvVyWZ9ksugmiVgQbXrMxJ
         JrjXcRp8yycicvRuWXpdUfvJ+t4fRVBXlPAdi5GQEdjMSALumxAKS+kdCjNSSSxeywWe
         myri/xG9B+32pA/fvKCIv2bOLbXvuCynWhbEfYQnw2/6PysvbvwdxcjHOuDFPnwDQHQw
         dXcJ0Lvm0QSNiov78I4/GG5lvqN8eLpkjfy+kSR0CQtHmVytQXUpbqseuxjLy+uTLXp8
         irjgsmDVnNtlIgohwK78M+cqisuvSxonP1WkYuTndR1mhJeiDX8KQlALTWFsRPW9FrLx
         Jfig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779426; x=1794384226;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ub3W8bOSut/jTHhCRWfRg/xfkegEtxU0Vyo56Bxv8PU=;
        b=hvSGjvipUICxEzvgBgT+RzYGKysib9/lVdppAkjv64Om8Bv6dJ1Cts4StealGrJHD+
         KrmyW5yIyr/H0fa53vkFe5+5Ebgdf8Qb4gl9m8a5YdLiO/ZZEcaSM1zQp+6XtToMyKiB
         Vjgo8QJK8Pd+MIb63LnL4iVL6ozgmV6+7v51o//z5tsNkn1z0dSbOxqZz/u0t7TeIx6i
         ac7zT7HpNZCE7oKXENSt3w3r9FP137boHArHFssnMzdk2C33Ge40Gf4CmlqzmXRo11dX
         SQMvRvkFkvM9leSlw1ucZHXMK7FKcHee/kviGOP6RdKU2/H8MJ7ms+bAew3gSdpqCL7W
         dqWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxYSMbCr1g4ZV5TBWj2c2VycEAkypCJmS4KbJEpq8eN3JHS1JsWZA5nzu07dhnnbvTg0nt8YVWLh6Lyl48=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3UJV9tcjfrud93phAKX/oiJbRHhinb7ryc+CCCA99idZpraON
	M6MYQTXg9zqkr5YWNLvA2QO5Apu9qbfussiJAUWLHqNk1+DscmJv03wxXQjxdAQX2caulFQ1T9t
	9jmQBdA2chva7KHE3YrPccnCXXMno1H6M2cReadDm1HWeFk9Tfk8vKtj/DFvs5HPlh8w=
X-Gm-Gg: AYBFou3zWSnrlMMZEmFsmNf5vHUsdAO8z1XEVup/9NgrXRyGiCBGjtLwLmA1IsFaV2m
	1vA8iCOXpyomR6dMvHB0+2pEsXKijv+sb1moTFVp4Gsjl6QCZmOdX5Gki+5HEXIhilj0+sD3Juc
	WhdwJYXUNcxOwxofZ4HHWeVDfHW0GbwNpLDWRpOEq8hPmYU3y5UcgES+2NY/rlpX6C/I4uPjqUC
	r5UsMjG9WF0MUyTqwxwbZ9A1S5SdjId9juiEatrdcP0uVUlvVH4Wt6JRhBIqdJ12TKBE+1sTE/R
	bcHTY7fhiHWCMayXieEU36z3KI656jxm85KoJQTltyI2Ks32ATiq8di7HB+mNsKOoipiVNNGsBS
	LrZiHw9K0gOEU0yWCR7Be/66I9kdzNuw2oxSFgaq6fVJHX06DkgxJK5J8jb3mm+V9cNU5
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773130785a.6.1793779426297;
        Wed, 04 Nov 2026 00:03:46 -0800 (PST)
X-Received: by 2002:a05:620a:346:b0:939:9ef4:79eb with SMTP id af79cd13be357-94421872589mr2773125885a.6.1793779425768;
        Wed, 04 Nov 2026 00:03:45 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b55abd3da7sm520250a12.1.2026.11.04.00.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:03:44 -0800 (PST)
Message-ID: <1f57f491-56a5-42ad-91c0-9c55e1c6ef4b@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:03:42 +0100
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
Subject: Re: [PATCH v2 2/2] remoteproc: qcom: pas: Add SC8180X SLPI compatible
To: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20261104080200.135431-1-val@packett.cool>
 <20261104080200.135431-2-val@packett.cool>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261104080200.135431-2-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=O6SsLx9W c=1 sm=1 tr=0 ts=6aeae6e3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=Uz0uFBkuobC0VEtxzbMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: d5k0OrnbI02BrrEQheWYuC-rBcxzbFu5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX+0NrkY4EZn69
 KUcYXmyJZoSPrnsbnL808njRC7o+bbujtrHgp38vsez0yVlkW8wVJb3JSuwn3uH8fV6Qf4vwiPH
 H8PmnGS385OrJpxqy+eQ8X7vwNfRm1M=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX9giy327366B5
 ohf0sBTPV17BIczKQimriz4AKyy4I+H1T7ryGfbdUPaCZhz97MdX03HlF61X9FiqlcUmUtHwztF
 u7Sz6WW2raFUwx1Jy/LyPccnwx5cCJBUTY9JZ03I3YjNC4oPGHjAvVIZ5xlv+5PfoW+9hCJAvmS
 OkaQNIclpe1TaF2q4TFIP51xK0kZjcuVjMTwziKHtbtLU3HXYjYdHNR2FKrRQb1WCIfyTLlbCb+
 q81M5UrGjMGxzVx4eh1FbqeNfP6sIG9C9GriUVNoSqCJYdGsVJq5Iu/igNBQJU7z9fy5DKMjusm
 TTVKej6i5sHQ+/7ta8/EBJ7ystydKgbe7bIKCL1FSsKIRBdWAGR6Ewkmja4BKvkB+sZgiNv4cmX
 Qz9EwxKdhDGAboEvT5R4RUcsgDtbMDh7/y45GWJ5dMcgrCWyGlmYqc1DE8wq6hFIOZEtHtkrOEd
 fACFQSdEtsKQNstzTYw==
X-Proofpoint-GUID: d5k0OrnbI02BrrEQheWYuC-rBcxzbFu5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 spamscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On 11/4/26 9:01 AM, Val Packett wrote:
> The SLPI on the SC8180X is identical to the one on SM8150, reuse the
> same data SM8150 (and SDM845) uses.

fallback to 8150?

Konrad
