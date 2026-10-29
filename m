Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264059;
	b=hzlJjOrYBeAoRH1YBiuy/q61BBcfj2yJs5jkFyU7O0xBY788Q0d5ljdCY5mI/6mJwZ6n
	 D/jXH+0om9NP2jL65IUdIw8MpgYxB1fO5CK9pY5l1iPSizmmpSI6s4UZUh+y0meTOOGEu
	 HIy7Kmd7HdyzG5IyKgTiTykPuk6UC334hMPcw4Q1r/cBj0F8Kx3a/1EpCpUe67WbKwGtz
	 QLq2KJrJwVJejekCw1uKs4ox9hkwH2yrfxV3OOTZHx8AMeI4Iaedo2AktOcDphSKhdeGP
	 ZGyNOUbPTTpqfParOZycuqWArzQ+Za+bolhTyytFaWKA17BMPAAHVbmhcdYl3QxRo3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264059;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
	b=4kH0bw6sG2af4izO1ip2zjrR7yNug0Bb43+rX/LRnGfPHfgPH9M5FFkdIQtKYkczabi6
	 eQQvk510pzOU5IfSjbDf3PWWtl8131hICnbkB1IkiJ+IZknm1HbJyspeiOEM1nhdZoyK2
	 PenkQpvsM4Isq41zDGQw3ZXO+B957yHTV2U4l+QtZslCW08dg2Zw+5ESQ6cYDodxdOZOp
	 TeSKl39s3QwCW0HfW+jk1jBAZShJhzuNbHkpYQdGIqhDWJ1v+7VVv53GdljRI4F39S5fT
	 vo+DcA3kcnZVsBrlyTHVh5T15SFgnqtKxnXWP2tKmchtprKEQYOeC5KciFs2ZgeP8Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b038sWn7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYRhpLGV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F17606A31C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:54:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0F17606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=b038sWn7;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jYRhpLGV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8r44B2263547
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dwweBRTS+7n3OyBIU4sWtsH/
	4bvxJRwE5yb773mGS0s=; b=b038sWn7NaK4r2tjnxS/2y8coqng+3waNaWPSOrD
	03euLFwcwxU+s4Kf/nNa7CbAWbOUzZyyfdfoIoxl56BXuoQzx/vyAwCUkx+KDxrP
	+3JESV7nkJ8ls58Q7f+/P+ZPT7bk4EL7bheUlbb8iV6GfYEpOHFJbvMwzbFvqwev
	MelzTBnGsOOZl9LVD78AK7LlvK2QT9n6SwJRQHkBZl8gqjap6ZWWEDJSDJeX43uC
	T1LWOztfd/QX8S3X3uMtZVl8DD9tFnT7OGD4pGiOb1N0mw9H0HuZjGvORkq/Kjd0
	4JUfzC2D5m/Nf4THf0EIvrIm3Rr+BLPw2wYu/jH398hYcw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm31b0060-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 08:54:17 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5337b591609so27547341cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 01:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793264057; x=1793868857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
        b=jYRhpLGV5TGm4babvH/oUfoLowBkifKBKpndMoHhg5Ax0vs+yAC0fcPaefFLbJZTxj
         W+Xl/k6z881LMuuW+TAzqy9UkISIziHwUsY2mH6KdaEcCQ8UVV9HDVlZNHQqJmLi8kPL
         A7NaRh09JpPVvdudYmCeqdlb+9dGMACfpHJdtrMCtjSw9/qO3mt7YNg3XgA4ZGFUY3GT
         FIwv13iXdZ2qNH3rOVWWjzlQ/yyuONYM3kRXc7EuIKqyNnLy6+kGz/1n7fC4oa3Uwv05
         M26xRaMwMbjmfouJ2Q8pmco0AuPh98AkkHqCfra6rU/ddKdFzHdj+FWWfBu2PFTwqLIE
         zjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793264057; x=1793868857;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dwweBRTS+7n3OyBIU4sWtsH/4bvxJRwE5yb773mGS0s=;
        b=gIaeUa3/yTa+4ZhGYEMFTdURAgcFS1P3K8Gvd+IMrNh5l1eY9iTEvF6I+PBsjutwUl
         4GpzWWRKWsOYHb9k5mujwNxM3tpbfe7Ro+5eGpXh4/HATlcK0qwj352lRGSk4A7xdQV1
         8e3TxO32OMfblc8N55ExfVSI51CUuEdWvQ3Jfb2rsr9THqheVBRMXGkulAZJvXdg6/qf
         tvmGc/xrw0htNppHFgLUMK6PjOGgAWJ/NoR8D6XGgCg+bTWP8SMwikym727jJXrVvQfF
         PY702oAuED6Nu46aN2j+BeknSeUI4zI3kDYDdVOcaavMyXyzxbPe0NUsLQgTlLadE0fY
         bxGQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmoyE7wJYaiMyAPhyd8U/hqXvIbaeEfBkgiPamOT7ekOHwEjPYetHyzwCJQhu1A3FwLZ/rRC6qpSsi7Oo=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNuhjNU8b2uh4kOfNVDsiDdS8Z50nM4KRdBx4mMLtaFG9amU/Z
	1GrQmmISs/0nWuwrnEohdymveU8Xcwtg3uBODJpe1s+F9rM1fg0812mARHzFEKYgMICY3agKChp
	x/aiax2KuxZthhIS8x1Sdr1y0kZptONNW7IFEWshgV/abxTV6R25L480cFv61/dY1rfU=
X-Gm-Gg: AYBFou0XSuIEUEEvuJj4f9dNvxvMDQKuMq7JEmsXSITLcUKryrrgVYbZ5nLx+8hkr0l
	hsUc8Tm0+Uj5Z1hIo8KjL0+eZu1xve28K5j/T3QOxkLgrjVDBmpSbiTyKXnfcptmpopXnVCm+DW
	PZlbIF7j4UpCgCM5Vs8UZe96WqWjbxyZh7Qf45hWhLmSvsLAgzpGvH8DJRT5h6jTCJaNVfi2XtS
	BgG+6Kq0LVimDD8Ys+xwBHjjC+My9zDaKM1aEJ28iQQRyFWSPoBjX04IaUSCxjjt8wRdLVUwCDw
	2mK6gYSGFTqhy6A+y6PLEpueOqAO5WyiWMl4EiZ33yZS6nVaDRctzsJOkqtYlTntekcDv8uvDxI
	Aj5HM30gqgRX7cuQhC2yZA3aR3xnrxkz3BOtWvB3hZQPMI07d2K/Grvcmf5kihh+h
X-Received: by 2002:ac8:5cc1:0:b0:536:91b8:ab42 with SMTP id d75a77b69052e-53fccab8cd1mr79481621cf.70.1793264056749;
        Thu, 29 Oct 2026 01:54:16 -0700 (PDT)
X-Received: by 2002:ac8:5cc1:0:b0:536:91b8:ab42 with SMTP id d75a77b69052e-53fccab8cd1mr79481381cf.70.1793264056176;
        Thu, 29 Oct 2026 01:54:16 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa7f7f52e2sm59555365e9.9.2026.10.29.01.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 01:54:15 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:54:14 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: Re: [PATCH v1] arm64: dts: qcom: eliza-evk: Fix M.2 W_DISABLE2# GPIO
 polarity
Message-ID: <dnw3tdpyfi2phqm5xjswygte35rabraz2jgprapcjlgjrwgf3p@fhfaw6pvpzc2>
References: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
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
In-Reply-To: <20261029084203.2674083-1-zhiyuan.sheng@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfX9NGzbHagRTO7
 AkR3+qI0oqOdQ2z5ib6runBsM2G11bAW1c2xDCzzj6FeSmKjfdf1ZPUgGH1ibtoLiag9ZI908GC
 Oq0m2KCLg4oX+zzdxgRqZTqwXqHo1qw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNCBTYWx0ZWRfXyrDrdnh/nUs+
 wDsPlWxesNYOEngU8jmpVs2uwPhaXx/F0yfwaEOnLrs6NhkSIzAKKXi0S6+Ir96YMEIsuHS1qH1
 xI8U4x3CjinIApH0yhksS9Apz4E9AmJF+n4BZCcmkQfndaxlunHP3T5xjN8+zqF79KIe8oJU387
 Ei/BCtVDQr8R1WDSo2mFzyY5zV8B535QZ7JdTMRvGG1s0UqB6t1jBxYoZNmF1MWDk5x/poHYZCJ
 6nLNQfYqLm7vdMDr5KI+udcOu48YRV7j8+LV52EpKbDrnXjUis404GsY7ScWjkd6RIt7cmpUqj3
 6tWgvWmCXN18nOaI3PYeSXmO7KAl36akuYVZlO0+epWx4iOOi09nKRmI2XwXsUz6Jv6yoRyQdoa
 p/7XM5nBr84YvwTyupWm3Y4Dq3OxWlZD2tyg5agIQYMFYs8XAD5DoO8SHa2N8aO0yjKs4YDZwMh
 g/kKrXK9vMs8vHsl9vQ==
X-Authority-Analysis: v=2.4 cv=A8T5rKWG c=1 sm=1 tr=0 ts=6ae309b9 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=TbxCw6FMqn7yvM8lpfEA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: ahVF-xYbNp3hSdLyG_U_8nKVOlepN7I5
X-Proofpoint-ORIG-GUID: ahVF-xYbNp3hSdLyG_U_8nKVOlepN7I5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290034

On 26-10-29 16:42:03, Zhiyuan Sheng wrote:
> The W_DISABLE2# signal of the M.2 E key connector is active-low as
> defined in the PCI Express M.2 Specification. Fix the w-disable2-gpios
> polarity by using GPIO_ACTIVE_LOW instead of GPIO_ACTIVE_HIGH.
> 
> Signed-off-by: Zhiyuan Sheng <zhiyuan.sheng@oss.qualcomm.com>

With fixes tag, this looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
