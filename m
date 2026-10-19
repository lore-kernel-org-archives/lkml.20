Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421621;
	b=Dp4oiiJOtFSe6Au/XXKSrI1QMyg6zX6b3yjzehYqRtoQZ5pnGxr1V9kBMtFOolCtaxW2
	 CleDbf7r8h9jSg2ENkCCfDRlZ1kuzMUNsVrxn4hqeiDSH6e4gdTjL38RCeK1axbkver9i
	 3yauN/0IwkLxMr7Nm0Rym4la+bJLQ2yqO+kCXfjf46feuzjLPTVF2wnaGtPtd86mkEUJT
	 /eD+9Bbct+ARmJ9pKag3CMDCFUJPLgEchPbHWulrYCj177wt7o7yOzWCsA2whvvLD86vS
	 kRgesFjfddiZNQV/Zrl2/dkDdCf5KSOHNPVRpi0O/wx84EMyoj+5I9Olr5i492xAXUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421621;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=3JSEuDjZvzikfsoqqO72h26acEW28TGgJTXmAUOQr5Kb18KK0jEbxs3GUyMGACYS71a5
	 J3gBJdedccb2HTQ4sswEP8gu2d2ivyv4OPaWajnRFuf+V1nYMJdArW0ritncmkNG8SRW4
	 bAMMIEOf/TN2R6NBKWfag0NbituLVsfNiC2PeTJUY6anDl74qqiE3mXeHQ1GtNV1zQPvr
	 RU/25HSrf6th1pKXXcOfRL2FDiLGX5sP99qdpY+UCWfNeigF6ZyWbIeS9OXD58OITp0AX
	 p0xUlQtcstXnJFBtZpkn8r0vme9bHgNpbrVD/mGFpyoYkE9KNajVTQPXwE2eQXASW3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF7A1606C15A
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nSi9cEKv;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X+EWXAWA
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262DC4C8481
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421620; cv=none; b=CO5qsHGLGh3eIibAYticjx8l3gMEtQ/AXwha1Wrrx3HvmHlqXHlPPiWrG191POYRpIS0smQ3aMk8i41YseiB2/JJPziVYzhhTnjqYCd35pSPL+nY7PArvqtkKqVx5e6PIPvGu/DfVso3F0opmSTMb93OMXSU5Sxpd7jqPG5i49I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421620; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kgYTn9gWAcr1p73HgyVoJYXd8lQOW/3yXGPq4hVubcqSgEVEFw+kbcOTayFJCyd3t/QrUrYkZoIzl2Vhb/lspBrJ4qcsd+ojPnN8C8lj9uWYyNkpX6HFQRDFDQZwP8WPzcS0P5rLE1tDEoggifzgIfdPsCky5aOX4G3AjFSVwlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nSi9cEKv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+EWXAWA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE05hJ2626610
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=nSi9cEKvrnTAy8UA
	8L4nm0gcCkj7I635NL+UWzlhSkbS824yj50HkV1/ze7J4ovs/mSSkd8mexPnwtuy
	SpmxhvjIX+FOVfxcxdhOyfRgXJvy2V9WvgfNLnNiOUnDXqPiBXg1o0wZh1N19ydI
	cnwXAC68b0LzqGsC9ts81tKYdGOnt+DgHKSeROaBEMMFyA7s4llFFTLdh5KBw/XE
	M4r44Dd77on0iWUgk5O8sWBekt6aFIDYpK/JmPC8+E7nhOIFeTMQLRCQ8C+PInd4
	JfdPdltqtlDKuWv01JIh9FWFDE7fBswnRIVU94elAaoS/0mDzgOnPqH3EOInH89y
	R2W1xg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfgjhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1f1f2ecfso75461685a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421617; x=1793026417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=X+EWXAWAt2WhZMCFyaLKwZz/mHIRka4RNahGCqwCzOnbr2qxsEQ2V+25E54KmYor4T
         wUXFpDNMqXUeG4SYLI+MAk6PhmV2aJddoKVpD+D0nCQBOigLIDMPokshkldwblE8DeXH
         o+ExFvBvn8I5VZurDandZemjPOlyo+c+cVpsNqpe0g5SjF640YBwLbG+5huAIBgZHvq0
         0fuMV+5uqULgNfI54SXHOLg3ZOtmflINuL1TX3ghB9RWTXTdprfYFml0hY0bcR2VBcgV
         k1jMqi9lLg56rdgrtUMdsfttLOpEr1jNGMqzG06Lp1ynA6eFnOMMnd07jaDJwvmV95/5
         Cv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421617; x=1793026417;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=woxCFmSF3BNfhsK89lETVt2BCRjT0FpQoa5GXicw6vt4NQ9Xns9NKxYWg3u8AtJmfW
         5q86NF9h2rimHCkm7ciLO/srYlOisGVCh5AeCnTgcKhdsXDCXpzm0mJzqlgsqOV/bhUs
         3DVR9+D05bf9c3JH5fbghpgyOargG1x/pC9ltgvDgSpD4qIDUxFa4+uIf/hOdkGc4JcS
         4d9vbSW9sD2ypk5Jq+Q3jVn7JUAynJR3LPed8Kyn3kDVyXlS3SnzgOuGtnAfukbJ5Wmw
         XvsEEvuQn1WPBK+CDiNcqzIWL+KY2r2JXNuA8S6vc0H+LqZlv3Yk4P9JXl6sayAXwMhX
         z3eg==
X-Forwarded-Encrypted: i=1; AKwUvBwm4GC7IvenWBw//PPyH2INEDOUuVDVEXdxuof8ZxJAT0JdHCBMUhWOSK8XgQBLVcumq+a3t7LLuumBrbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI9m+C9/TIOv12Dknx71hhYlLITHeE3KBDm0XBGK67wuoFOu/SW
	ViqeaUX63APlMQnktIoj4kCJeQBGzJoPVWaPHAps1Rw+dBWeo1PdqZCF7KiKhDqodZ+2Vxgc874
	nIqNcQB+aACB/Ly4jvgfq+Q7mS/fr3Uh7SeEVblChA57pacQHsyX43OrRAkL9auhdnfk=
X-Gm-Gg: AYBFou0KJcTB4u3QRx1c/a+B14hOq5nqX6xPxXoNMzQP1Y6ccfWJ+H3Lz7YNoDAOUdy
	h45vWst6gSH71TNl9cmCNRVlGO8CL1CuE3X5S0M6ggcfQMQVT7phj/PiwoRuXw3raTpobdpylGR
	jTAXqd2rMPUIM2ffw2QLFDkmmEhaXKC6CtyeOGSgItesQImc3OmX9lgOgZy2Nq1J1xI4UVRynST
	/zBRHhEvpySPsVRpgtHUCZ93k/P6AsZAyrEp4cOcNboFx8QEkwSSklNh5ABmqx54T0dZqhbVcy6
	r0jVFyPqNuBkxTk6S1Ft0yKdiYmHRkrnT2ThKlNCS/YeKXk/m2zIK0sao0Pd+vJaovjmx0N4acm
	W+dunT2T7jFVZ1BhyCpAHew==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547816885a.5.1792421616996;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547809985a.5.1792421616351;
        Mon, 19 Oct 2026 07:53:36 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:35 -0700 (PDT)
Message-ID: <af21a2c1-f101-45af-8895-daad2ec3a9fd@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:32 +0200
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
Subject: Re: [PATCH v4 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
 node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-11-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: J3wv8A1f3MzdQj4DAQP9-6RHJPtxjk4Y
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad62ef1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX8hsF4Da9NAGs
 +SfM0XGaG/c0Qxg8xptgkYaQUz5xe3LJJ9uuOxaBGeDAvaBzpp5MUcvukmw6K9yquP1OGZfBgY/
 Zit4v28NNdZQmevcjRxouNJsv6s8zB6JpNmiOpwjy95auNF7qO2euKbj1vX53b1CBb6auVxjz/d
 1ZKAvzaag9SuxV6mjPRjyHNqZzwpqDbJddU2QWkbY1LNGwk7IzFuQQTs4rUzSDicE5A4qzWPH5P
 kh/35JWYM5MJyb0/oY4YCzAGsPinguXC3y6hkpI883XT9UCdi1haHYJCNmzBj13J1qH333dgS4P
 SzdVo9eDL6eVEDEu4KdOaibhzE/N4bEcPoyYzsoa1a2To1rnAtU/ldzwrm1KMfaGrAejYkZV1dB
 GTshzy3PidfsTklRvYglU9GVc8padwnJ4imunM0nNxwNjJSsAI3IuzET7U1zx76R6HlCcnmaPaQ
 a/YZcgiuc5kuW+/giiA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX4T5qvpXDzVRV
 lMYBrebvONfYpMgwdiz+XRAVk9kkoQV8oHx3ADMlwBWmVKLL/dzN6AwPPMPd5WnYb8t4yQEt5d0
 jNwGkasN2UIV+Veb0/NcR2wPNqlsAa0=
X-Proofpoint-ORIG-GUID: J3wv8A1f3MzdQj4DAQP9-6RHJPtxjk4Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
