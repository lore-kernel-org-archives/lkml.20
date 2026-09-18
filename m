Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C9942983C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725027; cv=none; b=g2Ndrq0bH8Ld001mMxChCS0VQH1s8aQa6GLbHVN0ONazPFqKfvBFZ0lQHtWOabpYq45/XXoePntxfpIdUhJiGJYpJsXQv1igJqjsL2faCqyA3niUGBCTYkkfB8hpmAj0aBYm2ReKPfRIbmKCkXgHitFbj0AaChlSQimjZrj6hSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725027; c=relaxed/simple;
	bh=G1HMwfljY4tDGdeins5kPBg3mM7ZJ/xqQQwjAIb5wh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qQsph55ffXsu3QC5BrOebgQsW5jcMBHQstZzrR+syjqkSgn8QL1jZDJ/EVLi1vFvz2tyBaMBI/sP0nKoyTotojyeBz1NSQ0XP8zDcEt6K4chRlOZwE6p1Nc/8A6CCrCksudHc/jtstwjxeJ5YgV4/ijMkUWijlaOPEgWevuc9I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1QeVg6E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JOpUZYtD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1QeVg6E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JOpUZYtD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dbqq1404326
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:50:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ts2ohB7kaU7wSXWdRJOkbNTM3yTrx79Rg8Aw727zObA=; b=k1QeVg6EJTJx+Vq6
	7NgS+LiufPMN2PcdRpV/LTgZw2vpxy4Ex8AbkoYrXIk96h+EJxR/IQENX1S+N8zl
	A0pjZu7CPXg0B6PT0r7HRetreNVuW9IuehDdDTYZ5myuEs4V9rATmxfo7BtfIzac
	YmPmkzOaWo6zq6xqtdq94fK5SKDeHxSIK7I04NHF20I7L0TvGwCXejj7Q2UAo8en
	YJESoBOjxQx2wWl8YKMx9X2Wo/4iVbeykYlMtwkWQx5c+OTwtsv0xlZYGQUFnqCn
	X7nLHNdFNckjbvrRnsuhGgipMtQXY/CFB8e+3Lj9z7/aAUEdnLD8gUKayu+G7Z7O
	OzoFAA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grtdpt2b0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:50:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9375d92d0caso12617585a.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789725018; x=1790329818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ts2ohB7kaU7wSXWdRJOkbNTM3yTrx79Rg8Aw727zObA=;
        b=JOpUZYtDzh1CVYIBUrM1IsswXEfW2HNJOJJyre1IPCrNCXx/JjczDy/0E1niy0t7xL
         +CBXb5NLZC7RRwbL7xtzsrcNHJu98KudeQn5hYq8hD4hhq29qMrA7Xw9VYgXdE5SUn5H
         TTWhVFQt/k740FlbJXm8rj/VbKgfCoCQQl/WlRNaEFWLuJA11OevzaDeUHuF6qDJxT4A
         DcOWjkfPe8TtUvGNT/UZ2uW2qlNa4wSxJmShvtfM6EANesKfHxjzHn8ysix32NoAuAbz
         i3CHFGysfC6JU6YDnb90nt7GfcR08uUIaY4Xr/h/E2bLBV75Ee8F+Y13ZzojQNV5UOAw
         vPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725018; x=1790329818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ts2ohB7kaU7wSXWdRJOkbNTM3yTrx79Rg8Aw727zObA=;
        b=TRSD3Er4PDWjplsTLSWPQqqZYP0mQWBpRxHpYPu/y4QCxJ+JE28H7z8PlQKKbyI1ke
         ady6h6WFhjBm12bN0i2+c3ISvNSUvayg7nslwJMVl1/jhJzFN5sPm3mxrAoCoOVZLVM/
         QBI0sALE+iZD7iz+fWjPgXarsENVoq0lvWgRClNpUhlj2QFfLuws3a4pYsnKuoHu1lqI
         XF2cIE1BFCLMo69ZKh7h6lpJneM+Nluy3pYm94PF5kVcE0+it/TSvm7Lgoirgfkgre6p
         uRxTy/g0mQxfvNACnsDSV5EuWXS9TDcY3u6q1ZbqP/jHmBqAoMULhWStxvCEvBXVfc7E
         vkdQ==
X-Forwarded-Encrypted: i=1; AKwUvByoFPCCjHySXPHU/cA80x+2IbnSZrFwINJrELQN7hWHu2FR5+lh6cdJyqa2njLhIWLiffvKNAVouyIrp34=@vger.kernel.org
X-Gm-Message-State: AFuF++nEx/nrv06YSqHHzjSDkYxSDxlZEE89tyNjK5/7rV1b4k8tkbbN
	mGJZ0L3dbOo8r6LioGMcR1ULe5r+jrNCfROWP/Z5OmeMN+BkdQ8onCVRivWkii+R+RdfFkE5CVN
	xgDJN4TdlI7/muV6GTB6F5iPJg33DfGw+LYLXNya4FEc9CyH7Ajynf1iDbC+s5YIciUs=
X-Gm-Gg: AYBFou3k3ymQET9lFXB3Xyn/WA7FkuiVFqWzQj+vUKH0NaQWClAq33DHxz91v6UZ2Gg
	zp2yrRavckQ4vC0KtZyTvdzkJReX+LiLsk1JdN+1OMDK6hzMLTMWPqd2GrchPQD9F8hMtASTxOf
	9O4HPJF/4W9S7UqooNzl8R+dwQn0AJClAdQX3FRYzRh700/J2c7tTgAwyjjRoQDDsVn8y0N6tiK
	9PYrIlYfQuQeY4l8SnTYvSGVrx8qDy3pl3DCA5DgHsqw9uymUxZoIJ1pDNWYzoIFPQI7NOItJP4
	PQ+1i4oJmNuzb14Ot+EY+KfQdToHpTkNdNMW5MDS9K5hJw+Ypreklz2InDWbAhNV+gYOp1QAAGv
	rtgYOFGCZpwoUIZ8xiECn6w==
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr179072385a.3.1789725018034;
        Fri, 18 Sep 2026 02:50:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:934:95d9:85fe with SMTP id af79cd13be357-93be055f2fbmr179069585a.3.1789725017588;
        Fri, 18 Sep 2026 02:50:17 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa5975d070sm644748a12.23.2026.09.18.02.50.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:50:16 -0700 (PDT)
Message-ID: <c9b318f9-b8d9-46c7-8e0c-d5d74a171efe@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 11:50:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/2] clk: qcom: Add LPASS VA CSR heartbeat pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com, andersson@kernel.org,
        abelvesa@kernel.org, sboyd@kernel.org, bmasney+clk@redhat.com,
        jbrunet+clk@baylibre.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srinivas.kandagatla@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260917-master-v8-0-823d2c5d090a@oss.qualcomm.com>
 <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-master-v8-2-823d2c5d090a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfX/6LYNMTE35Na
 24ARaHbGM9BUTKGfEM4XpsGxpVa8bWV7xdKXorMIk3HlI5BmT1/MM0l5wgMqhKhZiw1WWH92Xvm
 SitQVGOwlo0G2M5MA5hGk5Tei4sCCZtcCFDX4kNxdR3583ZSRQvdiwk8cRmY9wwbkZkmrdwDGdK
 +l4k9aQb12eKEoiKve1jHmvWfse5/Feu0hAKR/moPcNVz1tqcA55Ln7e5otseA/WxAw3qz74tT7
 yhz34TH4en9/NAdb0KTqsCJSDg9FJJFOiB0m0NOjbB6cuY2kUEwvfmKRbOUjtNpn6ZaxUnAvAck
 MBe+irTuBiRWEx812lnOR502rDkCed/OYvNQ1EtRysdvrVXHfBiQ5c1aH7uQcNEMp8Imucj9HAh
 3n5ZDP/nPVNWc1bonfzrOh5fmn8A3Vhmm8QPulnp/apMvNvqhHLTTTOwEAMo2Gw8o8Ac8ay+O9N
 ANT3HAyEvEgO4VgU4ng==
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6aad0960 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Y4doX2lIe-IihnvZzhwA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEzNiBTYWx0ZWRfXy8CRcN+OQ8oy
 MqF1ilbHVfFtVQAjsplH1HujUeJee5EO8ia9pbPP7/EeqnWeccmActzYJwdR9WuWPrLiNrJIedg
 BtR26HlDx61JqKTskijtNGnyC0voWEc=
X-Proofpoint-ORIG-GUID: JzsgyvfcFy0FojKZEyVgmJm4AOrdU-sz
X-Proofpoint-GUID: JzsgyvfcFy0FojKZEyVgmJm4AOrdU-sz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609180136

On 9/17/26 3:57 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> The HeartBeat Pulse, also known as RateGen Pulse, synchronizes the
> start of DMAs and Codec Interfaces for the audio usecases and can
> serve as a periodic wakeup source for the DSP.
> 
> Add the LPASS VA CSR driver that models the rate generator as a clock
> provider so it is enabled and disabled automatically alongside the
> other clocks during runtime PM resume and suspend.

[...]

> +	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, &csr->hb.hw);
> +	if (ret)
> +		goto err_pm_runtime_put;
> +
> +	pm_runtime_put(dev);
> +
> +	return 0;
> +
> +err_pm_runtime_put:
> +	pm_runtime_put(dev);
> +
> +	return ret;

You could do return ret above to remove the separate error path
Or better yet, you can use the cleanup macros from
linux/pm_runtime.h, like PM_RUNTIME_ACQUIRE_IF_ENABLED() to get
rid of the gotos altogether

Konrad
