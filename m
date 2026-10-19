Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421589;
	b=FuV1k4GlemHXbpqXTRGvvxemd/yfsBtmsRUMmf9w1l6+YnNQFkv3pmJ0BJaSr30a5NUT
	 x4426Y+Pzc/N641Lme1yYp1VDVqCyD3F63j0CjhKV3kER+IDVAdtYzyW7Pdw1ZUWIF895
	 Hxf09PtvlEIWCMkuoD5muJeVB0VPjIcegrZ2Mr432eqMKTEgPBVkWjynUI1vvJpyc3p59
	 tp5la2OhQXcX/N9bvH5z/3jbU8w/h4QglQlLINW5Ep6ScrP5Mg8eaREFX4RBR/JlDIXQe
	 n/QGRigbHds10DgkEYR254KumsHruUpiXuswTGVtkuTLFFpijOJx2lMqJhntW/TNQQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421589;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
	b=lSIQP6rN83TbY922uxdIXwtmBYwBlzU6iX5OccsrmgNQV05Qu6TxRkgyL1xyBdwnb6KV
	 hpl/YB40UWP9QQEdXHHBlQ8eQkWWWZxgUEyZOpqFI/nkGnIvrexUUogJVHl3z6APMqBUv
	 LN6cbPQTKpC/84hWO+XkEq0fQovERz+ZkP51W53LFf5+bOtK4k8mlK5Z8bLb7fR6Cx3nj
	 7hdAaYeO+dr6d5x8ddpu0dMqs6JZobeAwl8lpUwsvk7FzjEIIujlCkY+96SSYZ4hwPGF/
	 /7Sh7SFxDtBBD189s7CgIE/+Y8VByNT/hWV8ssXxK+LvJgswuP4MsM1S2y4pWrAbtOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD5yxaCX;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27621606AAD9
	for <linux-kernel.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=psM6uTXD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QD5yxaCX
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B269533D6
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421589; cv=none; b=OsIJirna5pBEPholVyS8WwOHaK2LReo1MzWfYvBDouIPZBDXMYZRG9mxSH5y7wFwCytBJPkAP5DmhVg7ZWYI+NL5mhKvj7s3xfiPBSmNvVkhZirhuG1Mwr1LKbsIkBgSyhKIAIvUvmY6mewE7Shz8DG59acBNNOMxm6QrnRtjlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421589; c=relaxed/simple;
	bh=hQxPdpCxBDIx+pPny6Aea4SoTc4k93a/FzzUSZ3WShE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tu+drW5j0+1eVoXhXah/Jbfju+/nM2ULM1lWiUuHvv1KtpQVbGWI+BsNzuwmV+f7ZX/3akwjg2UlLnJz/xqYNEic3Zgdi2x6YsmdWBK78lYB8M03gKZpIJsp3rq1nkGuFTRX4Fg7ovHnTHYw3m/Fd6CRGduD/1m0ST9j+gdkmSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=psM6uTXD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QD5yxaCX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0kbK1904166
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=; b=psM6uTXDiOcUQQSw
	38e20UwanrY0K1ltAHo8MCrCV4Yl/CwRpA7KZpClrR4IsQz7MmZg0hp6BYQLSieo
	sazVRX5eJ/6TR0RJZdUbv+dbhwBRV6VXbSEK3VwbxZqz6CkQdI4J2DK4Uff/4JZU
	GQipnG+/JbP5N01RvuhPceAsl5+3JmjhWACD9HSeTWPPEYFKjT/RHaXUiD+4SQEh
	ciR5uTbP14DltWM/gSHDzG0G2lpWTT0u1x2m9avgQQQaODuvSwg0CmmdD8z6Jw2g
	fQZnEOclohYRFDRVqnkNt5xUSm5xYDPznjEmjZg//9OxuKmy48eoFoL6dtOvPuRX
	W3G/5A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9qh6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 14:53:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f1f2ecfso75434585a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421585; x=1793026385; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=QD5yxaCXEfhjEw3uZmOoFcMuh58hpKkt+4emq3kmI5J0CknBjsFdMp2GvAlf0Sx/2V
         z0c9aSOOn+nfzTIak6wyxhr6/0yRoaqL+XJnUo4ev5Lqub9ntjpeMyPAL50ADE5LFm4J
         t9rwlJVW3+i5B9W5VchA3aUyr9J+bDusnXBjtrYVaP29XPQPAm0XHYHHAMxukJhrF1mz
         JeKviAPjSJ+oTfrlsqVGP6lArg/3Gf6bk31qiATt16/ewUb4ovmr882EgMxMlH+8QwWH
         VQVsg9QJgvGoWMnKR46+qmZ4GPT98kPhDyUis+2s67RIUHZWp/gsX2yl4AdvMh3U1Au+
         iRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421585; x=1793026385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=38Tj1yv1XXuPKoMmKTPWateTUhjdplIVcRpEPbVkhuU=;
        b=T3oFld73/wi8n4OoAZegJQ7JuQJ2Y3YkvSF80BU0ZK6fXKDwsnGllfGC8PsTlYrCE2
         6QnGHKxIzYz9z0yz4AVz6Jv+6OhW3BkGV6Aqasy4iN1r9xrS9WBbTwZ2WWirshmB2n8R
         r1jzeiBF/DE9+Ka57+IcytmADJVW4Xm7luDBACMAC2/RNp5fjye3b565kUqU+6u9xENS
         l+3rH0VrZ/42l/eP1cf15bm/YMn4jMpOM3kuh/+QGiMVQJ5GfZ0ovGbgnElY/kdRQHMJ
         xVf3z3L1OoahUYUPz2GZ8Z4n/h+PTeqjwRCg7zZzwt5gtFT7ZHh6fjnfDmz/Oi3+iuGf
         RURQ==
X-Forwarded-Encrypted: i=1; AKwUvBwiww/RawHR5y5z7IEBaxE7i+J27icjkX75uWRvtF/ItjkpSYGvZdmVd3QwEbseQhOiJypk8UCyUPSafDE=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6WM6mRpLnX69Gd9wo/LttIdgWyx7egG3J8sDHcW7VdaJ4DkEx
	xNxNjALeIFFeB+0HOO9DxHCCMvdthnn1pQagihlmJuDLaOqeo9V38sn883LA0LjFqIYUqa0oASO
	24cmkQYdgIiXGMibnF5Z8zZnvqgSB4STo8A2Ja/49oHYgFy7v4RiJAErpQ6MEfAVj3EE=
X-Gm-Gg: AYBFou0eucyhaqsDXerQxsBFQXqDzLhOPSWe4wRTBsT7A7lOUmhceYqfJJfpBBdY/LA
	voR1rFQk9JvhU7UHI0cuTFTbS2uZ0NKyIVrHaS9EL0UVBJ7hmyjKUcWbPzEKKyi9891dTJOcajI
	ky8XpXZvEOuqCZrwDDWEShb4cBT1fsORjU47PFyGDUiVpFFMKeAPyaeAd58QFMYTBNuDWqMWMIS
	TuAjD1/iIYHpEnWMspIOImtk81m8Iv9rXD1+/TXQZpEgOt/r8vUzDgGwWI8Lsl14UUE41Vucb6k
	g5q3GIZeAmek+Q/LkbwcVlCr5Dop+CItRfSD1Dt8+Xh2LIOgti09xcA4ZhEw5snhgkpimmKhgem
	C0kxGmZ+nzleJu76LangpTA==
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547533085a.5.1792421585181;
        Mon, 19 Oct 2026 07:53:05 -0700 (PDT)
X-Received: by 2002:a05:620a:4041:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f29d7ea21mr1547525285a.5.1792421584507;
        Mon, 19 Oct 2026 07:53:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32c075sm380967066b.11.2026.10.19.07.53.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:03 -0700 (PDT)
Message-ID: <c142bbde-a556-4ffa-b005-d12779fbcef2@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:01 +0200
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
Subject: Re: [PATCH v4 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor
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
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-7-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfXzcDc4DPYexKl
 LeTHAAnle6jc5OpVUTciJebIwbLIJoa2kJMxasPq7goGwqAXUzt01iUFYBflYn52J+21+Z3d3aK
 aLQlExrsH+6qMqNjV4oBCIQgY8kmXiw=
X-Proofpoint-ORIG-GUID: Vx7SIjw1BPWy3sVVIxAYgySwP2p6ir5B
X-Proofpoint-GUID: Vx7SIjw1BPWy3sVVIxAYgySwP2p6ir5B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX2qSJWS8ZRzUR
 /udKNSHHc7dKctxhhrJNAef1jnepgEe/x9LzXj2OJM60BTShH65aNVzwMvr7n8bW1gucQL62WRJ
 OOmZO/T1XXLChY3HZ1B/a0Vr4yPNeTSOGuEtBu9dfT34cGMtiFT/XCg6DRM1Dm3rTVnuoy2qOPA
 1w/GGRED25x2CIQPhQJaVPZIEDgPuc575RJQ8XY1s2iQ5I8KgsmJevOK6z/SBNd1h3p5prPtGFm
 0mXCx0qCHpvzVTRBeHiMMOsmWkI9ivzfFlRruLDqh9Vj7eV7TeO8TPFuXVHYz/AtB7Z+/WtV3fI
 2eAFEy2VSQLm+x/kScce2KLlpY+8wqTKvCxzwd4EgGwjuGoHaVKIeUCAp5UA57FOJuVASfe3JeJ
 e+kK9SlEtW/O+7L9swpyZkaopFFHv6kiFSoOS+R08WekGnVh7BdtflIBi+1eDFKfhdIa4eYBiNO
 H8pIwsHbIjpf8iTAoDg==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62ed1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JQL8vk9cGjK8yxBYMiEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
