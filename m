Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60CE854855B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 11:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788954278; cv=none; b=hD1ycVzop2/o31w09lV+yzaa00AydZPC5DcPxjRzSef4AFeDKPho1oxlqDY0aEROfwjqpWt7J8p2iBCqHlvgKptB8uHgMsZOfTEyQ3B2ARWTqpZmQVgq610tQJixRbNspQCViusCxHbUshodNa9/rgx8Veh2IBN5ZSX7nXUeZfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788954278; c=relaxed/simple;
	bh=Q5ojKNKo6HChrWiC/HJMJ65Lk0CfqxwiOcXmEevOK60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O4AZGCd4K7UepBYHTyVkR7TZxOkUTOFK9l1XkN7KpTgCh/Vzx/t0vJWZyWN3BJI+s09wsFEovEtHfNar4I3rN8T51mozsffWkzL48cszYXArA8kaNxzn5TCSEv2REocixG5Kcm3Rf8PSWipkTYvKyI0EKMwe4/8/QqEajWfkTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouq0vNez; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kAK5a99x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouq0vNez";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kAK5a99x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BUINT1144593
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 11:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Z3vxjDucbkBUn20X6eQMjxa
	kCQuQENAXW25c7p6duI=; b=ouq0vNezVu/DefF5uxtof0cFcCI/P9C4ofAaFR+A
	k7QhiVC9Wx+sm1bRd2yHVPp7Lwz0TFC48ulCHzLte53JEOlC5zyTzJaD6SRz4DOj
	fqLqNJATKIMTFJAKg3nLkHikMFm1q/VS+nMRDsyn01oAjUDmmw9lE8Dc0Ianodle
	ctsvzS6U8mvm6WXdEtCW0W09RBSQO4DmRI77eJWasgvaXEIg1xCCQjXZNfh6SjLb
	c0EBY747Q8VBfB+bWD15oBk7j8DJXF7MQrGwX3NwAspYv+sIlgipkSJ1FFNJlMZq
	oKch90bDYNGhh0NcYsDMM8kRE3weuhz1TI15YDulUlzkmw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjppp41wr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:44:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939a00c45easo534408885a.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 04:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788954276; x=1789559076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=kAK5a99x5t8DAEdyoFociCrb9pXxFZyHuv4kI7M6wUXykbm8yRopKk0rv5W+y3VTf+
         LlYwrDtKNCiuYZSxULZrV64F3fPC+6+3taOcrXWc+AwrKlZm3AJVPf7Za4mCZuZIuJn8
         7SeOSex/ZyuU4ug6/tv9kkC/540q2RUpsGljqhl1cW6SlXONxejuFQjYfAa+0oeXR5CM
         zKgnW2R391MgCucSfVMxy+HJWxFK7LQtV59sq8EwuE+CW6Ci0r2sZYPVDEBGpePmbjG5
         CTvT9TJomsZJ7SOuy2BeGhdGhw5vrNJU5JeGseahfeTvZeag/wk90jqOGSNjrkR67boC
         eu2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788954276; x=1789559076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Z3vxjDucbkBUn20X6eQMjxakCQuQENAXW25c7p6duI=;
        b=W7bAjygRWsSLC2JY/NyQUBA9o1JE9MnFnjpRN3nBM5a0V+RDl6O2/WqUMCQIzsOFVW
         KqGZlCuLGpopz3sjRRGbGZ72OSXfORNnaFkNWCdDnkEv3K3KqFKtG9r0QRxCgX+uDTHk
         KJzF7fswYA62lE0aDfN/ebozlUsoCVK8yTstkiDwGQIolw/GpZpXqPs6k1Ef3paoo0h3
         0MjEbKLJTXwCFOzqois2PDlaU9Gx09w/R8kUqOhRKjN17LwdGwASvT8ZshLWQwI2/0jX
         9DHN8Ker0Wxi63g/JUsO6a7yuUsqKWzVie8ykm87BTt3FhmBpjXH3q0YuyS4TbOl4ae4
         qujQ==
X-Forwarded-Encrypted: i=1; AKwUvBwT7I0nFfxyJpRl3Me9o/REYt4HiZztcLfcCAWHgO80RJP+FWX0vIFgOWV4JY666DuvN5c0jqvvbDLC70U=@vger.kernel.org
X-Gm-Message-State: AFuF++l8ByhKWe5t4XDjR2uylzEJgj5pnDbFBJ49vsibv8Zqq/bdmyeX
	ZFxbEwdpMjbiBYkXhjEtNaEaaxkfcB/vi40z8Di7jAoCAP1l4yM1+f1Ib3nsA1U36nzr3gG5tPi
	YLhMMOzg7gZhzxGAbpBA6J0udEKCGbcjbuV8XiiJtsAtZ5UyssSKl/eLJ+A+GeA3RtJA=
X-Gm-Gg: AYBFou2lWYLhWHUuPzw4GpMrfD2/25/S2072E58plcLQYx+7Bl7HU5jWHOpurg/dTqf
	+6QWm6+QznWD4jsSiErrIlaZiUKQUGW7QeID3ayLSu0MKTwJLdjoe31gBba+7S3Q+cibo2k+16P
	l4NuAOHs9ao4SysrRl9vCo2t9FICmcm+HPCW8E/9otZAKInKnA2QspJTFU894HCSDRhK/LUPwCC
	onE/Y8o5ksK5yoLsojAHb6nzKpS99UW1dp4IUicmsASaj2QFTIMhJ6MHAmycvRDPbfCaudXA6JF
	N+XNjFwfI3q7SQ1xIl4OUTpbHjsFpoaz5ylEcx1KQBcX/kVQrhgfFI9bH26njDobhXIDnviT2zG
	ZtN+rA519/3Yr
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614855485a.6.1788954270662;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
X-Received: by 2002:a05:620a:aa01:b0:939:35e5:94ba with SMTP id af79cd13be357-9398031e112mr3614849985a.6.1788954270227;
        Wed, 09 Sep 2026 04:44:30 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d03543064sm374791805e9.13.2026.09.09.04.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 04:44:29 -0700 (PDT)
Date: Wed, 9 Sep 2026 14:44:27 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/4] driver: core: add subsys_driver() macro
Message-ID: <jer2cwmxbsvbcyyfjk5vv773alhivskfhx3yah2biemulszknz@6ievb2y3f6ot>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
 <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908-subsys_initcall-v1-1-cbccf4cd4288@redhat.com>
X-Proofpoint-GUID: FsANNb40j_kVmM79X6pKds9dAoYEq7R5
X-Proofpoint-ORIG-GUID: FsANNb40j_kVmM79X6pKds9dAoYEq7R5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfX44hK5kGHIdqx
 qhf25sTo7TNC+++2PybCrCSI03GQ0/g238mVr90hyjVWWzXcCw1RS9X1vUYGVLSkhh3rIZp1E3l
 Z66lyzsHB5wMcbHmVUUAgvxAGCZI9zNcp60oZ6o2Pp8TqKkG89+IrfsWSZBiziTgdpMjDtnbg6N
 gz0IBmaQVHtcBddXc1e8wZ5g2ZIFtLGXH4+4ZFL8J7NEoQvY69WF4tKgXn9JAL6atkodfuVKW7K
 1ZokD8ydVw7eTPsQtQ0jQJog2pzAJ+L5QQzbEw4/VEI/Th470eR71sy3f/OeSMLjIlf3mXm8PsC
 KPCPOMMB9eXqLVeq71lTRLLZdyAxt9gHrVIkcV/qMatQcfmGa1d6/eGKQgt4WpIxpd8SS6OPDTX
 gxAbWHoTdTiPL2eAkeMW0AsemG8QLHTNxxCoMQCLr0F/QTBFN0hlbXWULesQEESVfXYFnFSmloG
 ZSZh/zSOjhsN10e39JQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzMSBTYWx0ZWRfXyGP4CGXLHUKC
 qVYXhOrqwWON0hBDZXo6xzzILbVqkGs6bObRReyiGFuWYduTTGyaUpDNlqEgR1LYDXsTFqr8b7z
 cmskVaRIUSEx683mW0uvBWwxql7KIDc=
X-Authority-Analysis: v=2.4 cv=DcInbPtW c=1 sm=1 tr=0 ts=6aa146a4 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dePp4Gl7O00gmbwhyVsZwA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=efGZWcCWKF3PpBPhZoIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090131

On 26-09-08 13:47:18, Brian Masney wrote:
> Add a new macro subsys_driver() to eliminate some boilerplate code in
> drivers that need to register earlier in the boot at the subsys_initcall
> level.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> Assisted-by: Claude:claude-opus-4-8

I like this.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
