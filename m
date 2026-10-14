Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA25D511E76
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976091; cv=none; b=jPWZY/qYt/lnjmWZHI793cefOAZ9XOpDllGxQm/W+Gott4A/SlgeHVXg9Y6xgnzjBtwqYS8m34r4FI5pT2WpEJpX+XE/i02btuZqjBw7oqgqbq9arusRVHiv2WlDsPdtomKwvhDQRXDm3qRx3/yBQp1Dr022PCMOy3LkpjC1eVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976091; c=relaxed/simple;
	bh=PGiY5w0Bw+ZJiJah8I5bNou1KJJLLOdYPIjQF6qLmRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=levxeVc95Hiwy3mpePOIEJE+QBYJFO3tTYNRKuw+B4hUtur82rN2BHVsH/66+QlPBIju5RvlCV79yOTXkAmtEv/2sc77+QoSg9LPIX7etHvYhwA9rcLwUf9HgQpFkc1B3N4rO7gdvZvmD7LUvhdHn8RoxJjPrru9Q2WnVYrvH2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QTCKT+P1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b5+Q09gw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QTCKT+P1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b5+Q09gw"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EACGKK806684
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:08:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t7/ELP5QzUV9MtdJIhtE22tO
	y5vpjDEBoIy32gvwohY=; b=QTCKT+P1G+AASpDALulMAYptwpSNSKzHeTLmp6xR
	1Jhftn7PeI951vdOmzt36/Tz+3H4HRanAk6vPQcjZhOBFDQBoaGm6aEKiSL/8tLc
	px+4Fy/EX5i5LGgOr3OHKrvwEK9eMLayUtUL1XgqKhcj/B+o5nTtQQuJ3fZA85rN
	jpfYw/DARozQJNqVfUk0ZoMmExoAEwqBwcSDmaDrIlU4BktVXLd6nWRhuOPnD95x
	bfO11ODDZAWBj+x2GJcAmZJzmewUzrtK8O5ZPRRN4elTa+RhoWqdKCxEMfanIajk
	v5tDv5N9Tpbi/Q75gW+85jlNEd0SKuNPy/d9jSUXXstepA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6b4e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:08:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93caf6c528aso695501385a.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791976088; x=1792580888; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7/ELP5QzUV9MtdJIhtE22tOy5vpjDEBoIy32gvwohY=;
        b=b5+Q09gwLZ9zwe1Qd1BGMs4Ygq+6WDmSiwDum6ZO+3tqkoH8oLxQnHnuI8V+BcUgrw
         bSb7TDZiXCemowMfGDm749o66YsxJ33KFa2Rb21zCR5aYziyaHUlHTFvFSpWVdskXVYi
         UtfQjPPTVuu3nVFctWn8Em5/QQbDuvKS7fcsujjaYkp1MP+YS62G6S+42vXlnHeRDhAd
         mIllUvl54TqB4QMtypvuQMi9AVqZzSLVcyjs7uoKzG3bOm8ROCvTP80SPaLPEDV6RmD8
         TFcEt3f0LJRmFgFcsHWj3tzqCp2rwmUToQhDWlZPyXp01Y2bHu8yYitER2QP55muR/2i
         aCZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976088; x=1792580888;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7/ELP5QzUV9MtdJIhtE22tOy5vpjDEBoIy32gvwohY=;
        b=oG4hyKRW6/hiy59fOs16InswMWLOVvOQBbyvVNN3ypEosB1f/cqdfJ1KFgu0hExwm+
         tgQo6mfXM/uH2nWk1dHAimQukETnMVkgvuKuEdvkz0egnMcftnDRWE3jIEV4wF4q3q2s
         VWmXwyuo5/xt8NcNJpyj6gn3KLLQrr4W1J6/pv+770sq6kpV54R7pdmhPULl2YfFkAPF
         WlrazBxqKs2DrSqmFuHoe2f0DwaJkE2SpWXbbwirlGqrKeXRr+2eIWk4GgyxW1J/FvCi
         IkBSYQuPX9lsz50nzwm2F7gt5eZs/jpOC5F79Q8kn9tI+WlhsocTyJRmGWbTnKVtXXcs
         UPfQ==
X-Gm-Message-State: AFq9FYJ7A+w1XDLb6WahfawnPdypISObjOlEpvHgGC/wURUWZ4pAnyoi
	dQkUvCTrDk/F+tgQQkCa9M8BGHR281O9VXQz4i7qQUvI9tpABjV+trraCdAex/6RR0gYxQ7jWxG
	WPHodFFKNie+VFME1dIijZnovCsUuR/pREeK1QgSus380VFFDzCEW6gkSrH+0kpfXZ/4=
X-Gm-Gg: AYBFou2WaM+1pC77pD0ye7pVBMmKAvzkZ0RjW491226oEs2cJPAKum/tMWXbLeH2dng
	HwnIuaQcJCz7en5EWr3OXLlBaOFfT74iGpILnBa0q3yYa3wJ8luj9ualrPU6EfgSGdILSchu6Pe
	N7Ka8R/Eja8PnSB6nujw12IJpHt0h/yyZ1OnP3yJ9V/iUWzzwv4QJh7DeU4hb6aPfeW9gRLZdfS
	V93MKuyEZV0x8cXwCsXnmJUfNfSyZrpIn+JAJ9hjxSTEuwJY5NsRwtDU/qBIj7WGigDj4exmCsJ
	9sSnx0jDCIdBJw3acmcCUqDDHQ2obnpwAZhAxIKu9PyvJwoO2vKA54o9qF9EJ5oLwozW4qXZcsP
	DxLZ0p2Arz7scfdR2
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr2477178185a.17.1791976088018;
        Wed, 14 Oct 2026 04:08:08 -0700 (PDT)
X-Received: by 2002:a05:620a:6601:b0:93e:7192:191c with SMTP id af79cd13be357-93ebd1e0044mr2477173385a.17.1791976087488;
        Wed, 14 Oct 2026 04:08:07 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf31b83sm454585915e9.12.2026.10.14.04.08.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:08:06 -0700 (PDT)
Date: Wed, 14 Oct 2026 14:08:05 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        Brian Masney <bmasney+clk@redhat.com>
Cc: linux-kernel@vger.kernel.org, michael@amarulasolutions.com,
        linux-amarula@amarulasolutions.com, Peng Fan <peng.fan@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v14 4/4] clk: imx: pll14xx: support spread spectrum clock
 generation
Message-ID: <fqdoyldpejrzju4w4kex652ioi4txzbp7i2cf6zyqgu7h7ymx7@yepdo34huhw4>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
 <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904101243.412006-5-dario.binacchi@amarulasolutions.com>
X-Proofpoint-ORIG-GUID: hvftZV65Z0K-fnPD2znNnHHbNe7odxHA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfXxftUTsl7A4Wn
 XNE2pGqVmT7UbOe7IP5GIKhNctRPkM3wXAFy812Ts1qPWQXEK+L6O5MEhrDoKhGSQmrHzaHcepb
 Vhtyzs3u6QYz66j2mPWbuRDJmneAyeo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA0NCBTYWx0ZWRfX/6FOjhsMFjs1
 v+nswzLO1DP/n72IgF/SfE+suDV9M0I2JuDnFuHT63leg1HUN2fz2vB3QWr/qlZInuuf4jagKKN
 mbRI0vUG9/JsrAKq52gMq4pHQnph2FnNz0fPVciUfCVOpyARhtZzRuwkZRt/fA4wYE+i+hm7WRD
 siciZL5jEToK575nKUpGncq9bk8GiKVb2OCry5eSsm8tUTusa47O1h1VNriZppIv/Wim9GU9g5F
 T+9GN87YfWGeHAzSzfvUpB+Q1RkUm1Ut97zXc39DZoj8aIXpjbEms6gc2jVDcUxHNbqIxrRUZzd
 asH1riznA4qQmg+6zlwjcvTRp9+iUjGfDA71b/Vymp+GqymlF91/WDkvU/3EfcAAzlv30ABSMgO
 2XQklmk/bIZEtiPcg78i0EevdX7FFfDdiDhMz9j+FnLYZ0VfR1kpv2umhIHVnZAKCX4dzoYZlJG
 1wMsR58NzAKDu2GpImw==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf6299 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=8AirrxEcAAAA:8 a=iP-xVBlJAAAA:8 a=EUspDBNiAAAA:8 a=HkkWczMphfeU9HmRj9wA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
 a=lHLH-nfn2y1bM_0xSXwp:22
X-Proofpoint-GUID: hvftZV65Z0K-fnPD2znNnHHbNe7odxHA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140044

On 26-09-04 12:06:33, Dario Binacchi wrote:
> Add support for spread spectrum clock (SSC) generation to the pll14xx
> driver.
> 
> Tested on the video PLL of i.MX8MN and i.MX8MP based boards.
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Brian, you can take this through your tree.

Acked-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
