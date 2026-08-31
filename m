Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2CA3F39E8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788171170; cv=none; b=mUUFRLJBW+QCg2W9u3FieY+3m9uFReJkgkaJskD18qCsUzmoCQTTWZ2g9txXLgB0DDZ7oGVRtfjjbtEDhxS+C6TT2pDbOv/6PTSzi8uolPt2SYvp6bXIwORegnE300CLGi/WUjsEuhwtrNKKv3nzR5stbF4b7Urr1c0isoEnqpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788171170; c=relaxed/simple;
	bh=G3jFUMyRvelI7U27y8NuiWQYOoBvFEcpd9r0zOf5wMw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OGqrio7BC166LfeysprBojljwpzUCgw6Je1OrBJDujyerAKevBBufPt7rs5wYejx8snzsbhkZBImxw2ic++cIvZarjC7iIycfyY057YF06VdQLyIg/ZbvdBdVYHCw87qpUrTHsxSdVCaZqMvob7fPhncVVxQiHzDySTVtbPcRzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DLZCajgn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQpHOVfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DLZCajgn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQpHOVfi"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V7xHsl4081387
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2U4fnm7oXvcCD0MyXH2SzwKW
	KI7UNf8U5Oy63FZiIQ8=; b=DLZCajgneOvZE8bk7b53oYZSzFoY2FgFHFx4sEJS
	MqUwM2EeD75xuyeA6ss9O2CFkKSOtO4+yMaFhpu5cZALKpFwG4NtshPS1zeeugS7
	7rn6M+KbZxLioyqqrjgPq9DOz5efwMjr1pYC8DpvsTnerf/izCFSiavPiOs1Aaz+
	WAT79G7kwicnYyYxhsBtWl3SHqJOyuX2lLvovgrrffQ3KUhefmJy5a0W68QQQq4d
	aOTc4wsNj1l6ZRRwIocS9UGg0MOjKUrebepjLKsZNUxYE5SQTxWPnJCGr0fDoYwZ
	naTEKLNXcSYtdyHFfY04TJ49ZqNUR9gCZgGL9jfmd+iL1g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h24ws-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:12:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-53000c06184so46954911cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788171167; x=1788775967; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2U4fnm7oXvcCD0MyXH2SzwKWKI7UNf8U5Oy63FZiIQ8=;
        b=MQpHOVfijlchLewgm6bXqT3w0yCqgIBbMBZpUzLmBC5Vn4jCBJiBXRWOnLkZ+U/iva
         aWJzY4fPNjKXy8tLJqz/HfptZ2IhcScfX73JEPDVOCeMooGQn6fs7UR8ckir0nHr+5J/
         8P2MrH1mlOWYhLD5qthrBdfr+ebtmLujJIe+FlLGT2kFQ4rGDnTkvxIgPGgmcvGpM7Tz
         hFscPi5ktoDJN/b3fcqY0J7yTZs0kPvcGzjdBSWDZTusuJFAFA7vkESnd9mqpVM8LAY7
         zgYIfq2xIRdABpWh56W2JyBBBPUSBK3pJNocuI1jrRy3ahEx6A76rzLrcWnbKQbWbieW
         w+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788171167; x=1788775967;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2U4fnm7oXvcCD0MyXH2SzwKWKI7UNf8U5Oy63FZiIQ8=;
        b=fDZqDTO+dThzy/y3AfcR80Dbzk5lwBwGJa4m9T0ScICz2iKLNGYK8cRi8Egthqq8e6
         m0umfgTUdPk0SelIOOXYCJiHF4WMkh3agzxcQWYjej8inQiBid7Fb19XuEWKetV0oOMb
         SKM3vIVnXke7q4wwUipdXNYedqCNovxIyUutriTbflFu7e2uIj3hn+Mwv9LmUPd3gMya
         5mqHYWmFdig0g+KvD2En64LzqJt+UB3zOp8jZU0XvwXPRfmHOCIjtC14RI3c9kPZAUFv
         ifOLMkcguH+F9btpi/u9czfdBMdoddoyJ5U9jbMXzItvAmhvYXqbzKEYMt8awL/HeHoM
         Qz/g==
X-Forwarded-Encrypted: i=1; AHgh+RpYszk34sV5b8Qkkf5AVpiXd2983rxN72VbNrXNZrFV5oFcoQcko8Gn5r00haxeIMhJ2gNv1M/PxvKcYaw=@vger.kernel.org
X-Gm-Message-State: AFuF++nuHu86GiG6T5xO0NtYgpJIZvA6YNLFjEi8sG97ZPZnEFwGhTdj
	5oldPkH04q0P9N2OFuzdXkTU9u1We6IBmSbEt5sZBr/JlwMSmw4fEqsTjZmkZrv2g1g5KQE6Ixz
	7p69cQLVGz8dOdqPSDyPEEjXnpMoiwu6srtlQWjOnJy9deiUqlBf5YwHu/qlO5trMa5c=
X-Gm-Gg: AR+sD11GB2D01AwQKhjdM8JliqCb8buVnQLyxUqMs3c4BRxgW+Jurfp8NPQa5mUc6qx
	QbjZzMjKGh2fVlNb69nIIqXz0kOkbU3u1qpDkZF6fScgqRE4I18mfINKbyDgGZwcALqVTsqjBbD
	3BU2GBQ2L7gGFOdiRYm4XxUhRL84gGZ0ZDCXskkFcraYVuicPlogfBAGpwq/UO0BQ0rDqJeko42
	wbGqniCvzP/Ayyc+M1jVB2e+QvCp52ZY885DOfuoqHZlPwKwqNR6bf3QYUz1SIAz0MJ9Q4LgJ2c
	2qvMu0oa0k2lli3sTfl0pbzIb8n1Tv5mWEhD3f1WvCCuHStYsL1ADj+5tDojjq+uvrzx9rnNEWE
	9wsX8V/kJ9A+Cng==
X-Received: by 2002:a05:620a:2311:20b0:936:d2a2:5fe with SMTP id af79cd13be357-939137b8d08mr2148107485a.6.1788171167283;
        Mon, 31 Aug 2026 03:12:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2311:20b0:936:d2a2:5fe with SMTP id af79cd13be357-939137b8d08mr2148067885a.6.1788171162062;
        Mon, 31 Aug 2026 03:12:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd775dae8sm113298145e9.9.2026.08.31.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 03:12:40 -0700 (PDT)
Date: Mon, 31 Aug 2026 13:12:38 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Ettore Chimenti <ettore.chimenti@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH 0/9] arm64: dts: qcom: hamoa: Mark the EC reset gpio as
 reserved on all boards
Message-ID: <izyaid2v5jpp3m4ope5lpk7j77bq2jlzneusfztawhnrc3ydub@mww3imhbgv7r>
References: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831-dts-qcom-hamoa-reserve-ec-reset-gpio-v1-0-5b202de8c74f@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a9553a0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=65GQ0PBntxe8_1ckD10A:9 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA4OCBTYWx0ZWRfX57kRyO7658Ss
 U4jIDwhgiXOMAyXETNKj37UkRl4HSmxCuwxP9YjEvcrqpVGI2fJycv8B/pN6QaLZ5Pq5wucQewh
 aa9AQtmsduV92+HieRw502MZPNE1hKZDswCiyMQFg9GSNTm/ztli2MMp7g9IpaXSOSubMFbJD/I
 W6gjAfousrK8YzjqGWdWJGVQkhtSBSNJqC2zC3EmtaPDJHp476Lav5sv166B8Mods8on3WS5kwW
 Bbl1giUntlrRzMDfHS+F3lalofNrsgU8eXKzGCNVAVGqOTQcGAZjsuKDi5NVIk9rPES0Fgjv+Pl
 XaDtsCIe55z0zQQJ4UNzr6ybunUwMjTwKdR0HEO3EjCczlEUVX1654kCMRrWIbHUdZ9CYkmqohy
 Psq4aJHmwv1BUq14j8lK+9wTdzRLEdsUHx2Em34F5Ec6dCpZX4U150JqAZzEse32HmX9QI8u+fW
 QzYswu7CpUbm1KD3Ddg==
X-Proofpoint-ORIG-GUID: ElzyYgD9kRjyLftewRkDJup6CiSO51Uu
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA4OCBTYWx0ZWRfX5BP/SqVo/YgR
 5onYBb+LcKarn5h2iv1FAmcmm0Nwi9s5K2Eo5Zxd+ZQZ2OxXVjd3Ip5SG7Z+GDrvQxEQ3gH2HIu
 MpYqsvTeWdLQBj1qYzkCTbmwBWmM7J4=
X-Proofpoint-GUID: ElzyYgD9kRjyLftewRkDJup6CiSO51Uu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310088

On 26-08-31 12:54:40, Abel Vesa wrote:
> GPIO 65 from TLMM is used by the embedded controller as its reset line on
> these boards. Reserve it to prevent Linux from requesting or reconfiguring it.
> 
> I was only able to confirm that this GPIO is actually connected to the
> EC reset on the CRD, QCP, xps13 and t14s. But it seems like it is
> recurring them shared between all Hamoa based devices, so I reserved it
> on all.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Abel Vesa (9):
>       arm64: dts: qcom: x1-crd: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e001de-devkit: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e78100-t14s: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-dell-xps13-9345: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: honor-magicbook-art-14: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-yoga-slim7x: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: medion-sprchrgd-14-s1: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: microsoft-romulus: Mark the EC reset gpio as reserved
>       arm64: dts: qcom: x1e80100-qcp: Mark the EC reset gpio as reserved
> 
>  arch/arm64/boot/dts/qcom/x1-crd.dtsi                         | 1 +
>  arch/arm64/boot/dts/qcom/x1e001de-devkit.dts                 | 3 ++-
>  arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi  | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts        | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-honor-magicbook-art-14.dts | 3 ++-
>  arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts     | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-medion-sprchrgd-14-s1.dts  | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi     | 1 +
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts                    | 1 +
>  9 files changed, 11 insertions(+), 2 deletions(-)

Urgh, just realized that there way more that need to be addressed.

Will do that in v2, after I get some reviews.
