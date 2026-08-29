Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC66A25A2A2
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787997393; cv=none; b=sD2CK4qHUDt9Kvi8+ktT8sw9nLDeAxas8YZeIWXxfNCDHmnC8b/IJaIbmRA/uW5rIEQOnop8v3/ciK+ZAKjqSfeUZU3+8j38WEiF+dAnmC8+wyFHY8YE+OtiV8+M5ipWEgCXKs7DMJ5xe3Y2o6eRizF/0B571DAhoTe08iIFDCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787997393; c=relaxed/simple;
	bh=0WmC7NobsOauCrIbqv3KL2l7l4BaPEQF473/kYGDurY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iJ7IBQRqOreg3eiyNSd3yCm2h2oO63i8euTpyj58k99B2w+QMn8hzFP7e9o/g2JcYKB5dP6Cw6Je6kL0kf4N5IU3KYJPb8hYnc52NVnDTA40NJ9Rb6Dey++nsJk9w2SbtKC5mjSVg9VrICjTQ7VXYxbS7G2XI2BnOpcX2oV5inU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnuS6kgJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmiqCxnd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnuS6kgJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmiqCxnd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67T8083s2353073
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sMP0XaepjPlmJbxsbEQ8szt6
	2Q73GNx5xhfDiowpknI=; b=MnuS6kgJNx/2HsQlolerc4EDXhHZG3qcndfYEFII
	PQHhc3GkXA5PQxOhbczI+Wv2Fxyfc+XdNds3e/qkdTgDjRtZe1OS0XqCX4CRfbEq
	A4gLEz38bnlI5JWJkbpOvtrfqBkf7k+JKUmC6NGaM0Kkat18lXwZB39U3SAFCIal
	50n0q9h7v1hukZs9SihAHSpej31ojGlUde0gHgiW7D8BUtnLVEKHQWF4uZ6f6cpp
	0DNpyAfa6aGgYFMJDgfBHaNTTujY0N95Ga/F7KM0rz6L9XY+gLoBxXLKFv8TeWGa
	u4Oztfr96Kb6yi01KRPsABAnN0m6svTM4Uge9u43TwvwlQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqhmrp05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 09:56:31 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc1b8088202so1978487a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 02:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787997391; x=1788602191; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMP0XaepjPlmJbxsbEQ8szt62Q73GNx5xhfDiowpknI=;
        b=HmiqCxnd+Cox8R7Xla6R80jnY8t0MkPm0q1UxB+eQJRlaELPxvlbrs+ze1Nx4Exeqr
         c+br2GxNPGmf6eG4VXAGZAwJOW3G1AGMQYXjtKPClwwDhpPpuYoLPWvh734lpTOpw4CH
         h6LKqVzGGcl7jU9YXp5aEooiySp0Q7JLcWiXAwiOqfc6OBdV5MLpi3WIHpf0W24UJRXl
         H7hSK5qe7cGlsRKavvNjKQSU7n12xbbHkaWdbRyo2XpVWTmPdJVQa2X/V78xG/xkDG0H
         dOGG+Xjd2/pRSd0hkVUZ19CnuLC8+DNZ5CZuh18gZz5jqRYMl5WJXg3CUkwAQvimZeBu
         S4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787997391; x=1788602191;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMP0XaepjPlmJbxsbEQ8szt62Q73GNx5xhfDiowpknI=;
        b=PGM3HJollBFayF7r6SkNmhIgzu/Mq+b7pQgYPnJkhlS+099QoCHtcZm0N1BUQpBNzG
         fmxWUHqLSr6SGDXOoRAOwixpmzeUoaL9OkMdHpVZkHwQnY2NOjqCPVgErysSRTLkzW7/
         O5Tet1/MA3gvV9UchittCZPlcFcI51eYoNB30m9rPehpBnTo9mM832NfjbroZirAfOZi
         yfg868AIz6yzYWQhGnb0nWRepT0MTEM51SpKhcOMYI0c6wEbJrwLktEtdg2I0ZM8YzUu
         DB8BtxP3lceQQkp1hMlnyJq34BHVbeoawwiLcXDBTPpaStBPMD4mqv40xRCi9WzvZSVX
         zkPQ==
X-Forwarded-Encrypted: i=1; AHgh+RplvVsDLwovzRr34NQOdhU2L2JYRAfp45oSE3NZDnongyw+lpayRXqojNELr37TGr8y8CIABJ8UAqNitTo=@vger.kernel.org
X-Gm-Message-State: AFuF++mTd0OXP2DJTssGT7L5gmxoQuU7rzDCAj+Wlmz+EkLTVHgR1bCd
	FRabAwoSX49m1bTANHbYYt032mt1mpy+j/KGnsElk8ZQT00DJ70v0fE3kLOGRMVcV9AzVQsXlDN
	tZXw6xe+D9o5zbFIJAHXLkT/nadojXiGifOiAANIG5ck8iiqggdgOzlrcqyWXfJjQvKo=
X-Gm-Gg: AR+sD104XAE1lC0yLgR/oDV7StRik1bpMxVDaZZVpHAk4e50YN6Pi+4nKD2iQoQ66QX
	/r+rBNZv/2257ut+DOyp39eh4XKed/7o2yOSBrLZtUx9x3y74j3Ze38nnxsPor+sxDk6OpvziXo
	c/mijhd31XRwOqHLOWdzt0i/EpFQPjY66lZYjgFtjpup1vEi4562qbt8kdY8WzaKy3A8oKx6/lP
	N/KCRjZKYXbatduEDsCKJnBnDuPQDS333Qq/e2yUQ3b3OlQiJqwmFDP9uZC0R+ZpHVckrT4wXqm
	0+g1Llqk2H8xRWMdnV5znr5FUjmUJwD1vfnyYfi9okYNFV98XImeBNzWlHjmGI1QBUyHa6YnAO6
	Y/KZWsC0PtbSvHiqRW/Ynd3AJP11PIGYMXk4ZBw6RwoM=
X-Received: by 2002:a05:6a21:4014:b0:3d3:af44:ee11 with SMTP id adf61e73a8af0-3d3af44f155mr8533800637.26.1787997391342;
        Sat, 29 Aug 2026 02:56:31 -0700 (PDT)
X-Received: by 2002:a05:6a21:4014:b0:3d3:af44:ee11 with SMTP id adf61e73a8af0-3d3af44f155mr8533764637.26.1787997390926;
        Sat, 29 Aug 2026 02:56:30 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0d4b336sm13992370c88.8.2026.08.29.02.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 02:56:30 -0700 (PDT)
Date: Sat, 29 Aug 2026 17:56:24 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Guenter Roeck <linux@roeck-us.net>, Vinod Koul <vkoul@kernel.org>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] thermal/drivers/qcom/spmi-mbg-tm: Import IIO_CONSUMER
 namespace
Message-ID: <apKsyKdePJ3HKT2N@QCOM-aGQu4IUr3Y>
References: <20260827103555.883018-1-shengchao.guo@oss.qualcomm.com>
 <apAzGkXpnMYHcnqJ@ashevche-desk.local>
 <apBLL4x0h2kUaz-n@QCOM-aGQu4IUr3Y>
 <20260828234249.0c729e5e@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828234249.0c729e5e@jic23-huawei>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI5MDA4NCBTYWx0ZWRfXzqW701S1zRnG
 MaxZ8lR5qm63pb+FZkmNOKfIh1A+DiXW8s3LjvaInS2LEC4ez2Rim1p1Ps1B82XvUTFKWb+5ybO
 x+P/0o3iLGMksEVmV6r3E2rAKY6Om4ybuSOn4g+NQOPQbPopKvCtavRACua6jXh0tztRlZSwDiB
 tNr3lDSXhjDbFj69n6zxPDEc4iYe30KQQeWIM20HXfx0Os1m3svsMVErFeVWSTCgbg8/+z5Lhtr
 AU/4auWnzJXJT8TPkJWRwfGrcO3K1dMP/38hQD4sixWBxAiLfLtWIYxYMGdBVrhFR4Dwx5Nixkr
 BEHNYG9zILA03s4MOsOS8ANIbC1a1h7aUN1oot52dQJUFn0rksGIdqC9f8rJinTR5DAu4mT7qJZ
 nI8IX9EgjG4LtsQGStR6vCsp9ysearRHX/bjx7lkGLcLwudhSriEdeNNbI4IBCtutIj3PdsragQ
 nUx4apOT5TmrjZillqA==
X-Proofpoint-ORIG-GUID: tzEGSoXUOLA70zkaWLoIsENh2GR9lm8N
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI5MDA4NCBTYWx0ZWRfXzgjsmbxh8AKk
 PNmVC0uG+F/La20VnXzjuNfZFP0laXXsB2UDSVAEZz0ywLdRI+WVRuTlA/3xlmvoGXD5GwNCJiA
 2XVAwujkVqV9v4Gh27e2nQKJ0HTKlOM=
X-Proofpoint-GUID: tzEGSoXUOLA70zkaWLoIsENh2GR9lm8N
X-Authority-Analysis: v=2.4 cv=bpl8wkai c=1 sm=1 tr=0 ts=6a92accf cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=YDW5RsgNVoE-659JHf8A:9 a=CjuIK1q_8ugA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-29_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608290084

On Fri, Aug 28, 2026 at 11:42:49PM +0100, Jonathan Cameron wrote:
> On Thu, 27 Aug 2026 22:35:27 +0800
> Shawn Guo <shengchao.guo@oss.qualcomm.com> wrote:
> 
> > On Thu, Aug 27, 2026 at 03:52:42PM +0300, Andy Shevchenko wrote:
> > > On Thu, Aug 27, 2026 at 06:35:55PM +0800, Shawn Guo wrote:  
> > > > The IIO consumer interface symbols moved into the IIO_CONSUMER namespace,
> > > > so consumers must import it explicitly.  Without it modpost fails on  
> > >   
> > > > 'iio_read_channel_processed' and 'devm_iio_channel_get':  
> > > 
> > > iio_read_channel_processed()
> > > devm_iio_channel_get()  
> > 
> > Sure, will update.
> > 
> > >   
> > > >   ERROR: modpost: drivers/thermal/qcom/qcom-spmi-mbg-tm.ko: module uses
> > > >   symbol 'iio_read_channel_processed' from namespace 'IIO_CONSUMER', but
> > > >   does not import it.  
> > >   
> > > > Fixes: ebf1d03dab96 ("iio: inkern: Use namespaced exports")  
> > > 
> > > Shouldn't this be backported to stable kernels?  
> > 
> > The offending commit just landed on mainline during this merge window.
> > So there is no stable kernels concerned by this.
> 
> There is a fix on the thermal tree. I though that was enough. Maybe this
> races with that fix going upstream?

Ah, I see! That's a fix from Nathan Chancellor. Ignore mine then.

Thanks Jonathan!

Shawn
