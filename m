Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792434123;
	b=vmzTpyM5QvEHbWZkmFgxlKDwhGQPm37rrb/MJ+P8r/LzY2Wc9WzsmajP4gBL38vlz6JM
	 cOYcZWmRbDbdMr3Lh35YT2zO7Va0Dyr8YHQ5yai13P5MOzRe2rM1c9BXzXhnmDhe2fMpK
	 tEAVjxscsFSbq4w8n+2vhg5YSxsOl+2D/AYeX8jJhiagsmB2u6YBlWTRYaxBny/i3nteo
	 hxr7nT5dHEdZhXxH0Cl2M3UkpH69SbeN1DZEdUo+oIjvdM9Xu3elTwqrPlAwmTaWuuSNy
	 gXzwYKoiMvl9iVUF4qtUd08cbmoAgepLbjyBYGw318LbYqVVXR9jZfx+x/rvUkZEKRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792434123;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=;
	b=HlR88AzYFoa70XVxD9WNdgJJesTjwOjQJZDdHy69gwL27N44rssvGBYZhrjk2n5ih9TK
	 CdLInNhchaQeLr+xDdA48mf4VU+sgOgzvUa+Vw+JG3KEPKPtuOppJQspfXtynCda7P0kW
	 G5AI9hjBiVzkB5z0TzszR6prK5SDNeEzzvqjvYI/83M5mD63E0z5cg99H7rjba39vwzpj
	 Kvq/76ZByqqLG+zO0bfR9P86V2PMerzw7B/SmnnpKvCHK8155R8fror0TVMaJEyDX/vn5
	 0bXeAV4TeNxwADAEVQatKVYMaabvIGtuvGVZZVRact/NO3vkShDgXeovbBLuTHnOf5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtpHEkUE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXPYoUh4;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C793F606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C793F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FtpHEkUE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXPYoUh4
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOsm14180393
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=; b=FtpHEkUEYbIV7Ov6
	yArCnhlsnLn8n/AoCj/bcuc+gbW9OavkkIylfb5r95I9LYzxoq3gpRM6XEVWW5Xw
	nAX2V9OxZ9GzlHN3vsfFop0nJwOe/jEXxVSYr9pYMVUa4tSDIUBW2chu2F/kt594
	xxYMnfntZ+bEwLFktpp7WIz79wPVjPh87tRpwzgwc4HHwgCxHuit3s5n8GzmExqC
	gg//XU8uE+hTDxC9tk/BoMZ7LugfOPSC86+vr8gg2cMmLaBUMlrfSYrB6qAEZrU5
	vhdE0IIGdd5pQ2lLkB5Cx2wig0X2k5wFsP0yO8moXWkAzLWXD880fvxzBsmbcyFs
	ZME7iA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3fap6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:22:02 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c3c370b17so4809528eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 11:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792434121; x=1793038921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=;
        b=LXPYoUh4qnQAhZd7PvpJnmfoLnTWLaOSjsDKSI9IlTdq7UlhPCzC1TcXvqFQwA6epy
         lm+hWq3wL9dknAn0L/sFJf8nj1HkB3RUnNfqbMH0DI8wEjDDefnMLaxmIZIFzaN6x3wv
         y5CyHT+AusqJ7Kn668m6acdVYYeB0ZGTrUjQpC42L8+Pj62dBs8IzA56qO9l3UphEL4O
         FXjEoN2B6v44WR4pOHNw1ovjIxGuZtdj4aWPHFrL8UoQeh1/8ho4xEJcaHvzrA/T48H7
         ubmss3c26MSZ4OiKTNzqoDGsfPbx410LB9f1JhFp1J1Fd3A3t0doKV9ewSVKdA75wZkn
         kLUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792434121; x=1793038921;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OzM/EG87vKHwQb3clxhLpAhZOOi6NHbejQuRTq00yik=;
        b=BcGu1IvxBFZQm1ri4uObR6iEkFnlPU2JZuW28n5Q5E5B/gjtD2hl0qEEyqJKi27/bP
         OcPMWoxPwA4jROFR4+BM4Q7XXrxxDOH1TwufakYuikaDH9HC+Ih+/9GwqWBpSQCJ06Wh
         HYsYdgxBWbFzE3ACLXxdZTmO+HsDn21CbBkZMHfPl32lLvlwmdTu20YuS57lkMtRN79m
         0EC+fqVXH4ohDbIGXEULtanw9BX/ApGh5MBgnRWNUhQfplH3VoB2/DXd2HoKRwcMyKOu
         qdNkuzmrf3orS8AOY+xt+RFZsdlwGlpdpUdN3lDu2B5JhRnq7nG8naGtsQ3VNZuT1vfr
         kZrw==
X-Gm-Message-State: AFq9FYIF9bbpL22pKtZFDjO4T9kGcxox9OJFp92q4rZjMF3IgQW/AtFh
	FvPTsFvlpgDmWqh2j0q2Y6VHe4kyfYFlGE770fatOUoK/mHgjalVexjeUw5a9l4W9w0fZMItcli
	rSunYO7p3O3bDNm7cELbsT41nlpVE9OTzQeyUSc4Ri/ej4SBmcE/FHnjDvL5j7CBd1fc=
X-Gm-Gg: AYBFou19yqKKKDe3zF0TPvLWlAe500jmGmEx9+ialwutPIgRwgYMQPg2csLg/TpMeM3
	btRI4GWUJN15AxYRXqKzEw4EqL38/n2Tc2w8ToKka1TGVd4HyXP9ZXwvoCl/kUS92Zd4q+wJrnZ
	rsApIcTKM4GLRkSXtzueVzGqJJB17QhMqeCCIT3RQeDRTQm4UX7de0V0MklXrk9BlkwpgHO1XAk
	lD3gapoGy0vXspsEuskTb3BngFEr4FkpKobB32v6GYMdZGzzX8DAZUF1oAekYNuV2uH/mBTT0Bt
	z+5DO5jMbsrpQ+l9YXNXeTBDbojf+XYpOzeYRac2XJs8NI0WUA0mHlrgaN+Ug9GLfsCsdQDOYME
	rRVYm+4dBom8fy4rLj81Wkr4KBfrHtG7o8+Nnt+siUg==
X-Received: by 2002:a05:701a:c907:b0:169:3706:d61b with SMTP id a92af1059eb24-18511eb6a06mr12491470c88.16.1792434121233;
        Mon, 19 Oct 2026 11:22:01 -0700 (PDT)
X-Received: by 2002:a05:701a:c907:b0:169:3706:d61b with SMTP id a92af1059eb24-18511eb6a06mr12491430c88.16.1792434120643;
        Mon, 19 Oct 2026 11:22:00 -0700 (PDT)
Received: from localhost (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b1722asm31987710c88.1.2026.10.19.11.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 11:22:00 -0700 (PDT)
Date: Mon, 19 Oct 2026 11:21:55 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>,
        Mark
 Brown <broonie@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len
 Brown <lenb@kernel.org>,
        Tony Luck <tony.luck@intel.com>, Borislav Petkov
 <bp@alien8.de>,
        Hanjun Guo <guohanjun@huawei.com>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Shuai Xue <xueshuai@linux.alibaba.com>,
        Maciej
 Wieczor-Retman <maciej.wieczor-retman@intel.com>,
        Pawel Chmielewski
 <pawel.chmielewski@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        "Fabio M.
 De Francesco" <fabio.m.de.francesco@linux.intel.com>,
        Breno Leitao
 <leitao@debian.org>, Dan Williams <djbw@kernel.org>,
        Terry Bowman
 <terry.bowman@amd.com>, Ard Biesheuvel <ardb@kernel.org>,
        Morduan Zang
 <zhangdandan@uniontech.com>, linux-acpi@vger.kernel.org,
        linux-edac@vger.kernel.org, acpica-devel@lists.linux.dev
Subject: Re: [PATCH 3/6] cper: use BIT_ULL() for processor and memory
 validation bits
Message-ID: <20261019112155.00006fb6@oss.qualcomm.com>
In-Reply-To: <20261019145643.1877246-4-pierre.gondois@arm.com>
References: <20261019145643.1877246-1-pierre.gondois@arm.com>
	<20261019145643.1877246-4-pierre.gondois@arm.com>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U-tMlhvVs0P3YwrAohjWSc00CEogSFEp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA3MyBTYWx0ZWRfX3n3IMJPMPv2L
 Y4unIvIkKIFSvhmSV6SXEtD9k9eu6d5ncGIvwcnby24uwcGEo62LUM0Y4dbATviAJJGVgq7xYcP
 4y2TILIyEuCxx9AlQzW0Wutasrge7sVe/bE3YLF3Brze0D8Yc2zOiLTtYMGTqVeeotew1/bG/i4
 LXf64jXosS5Kt3kRWpp6NUz9DhuUZ4hoEgapL7PtG3l3IFuWFfYuP2STLy7HT6VM05T1DZKi32O
 b/o4p1LqOeHxcdGz749ZbjcjhCvSb6EDl5Wa97X5ZEruZMtCrNWDOAf733/tZdrM4XCXz+9cnbs
 kjFgMeERXQquO7t0eEMYOGI9qyXWHSpedbIqI53iJutbJhlgCUyI2z2WHU4Ylc6/+zDCzyCaVE3
 MN3ucuXZYHDxUv9IxnpH2cYYl5Bumpw7268J6WqZ86FIsa0BQahMZl66fkcuJdZoTbkTYRwi65v
 jkRYBj24QvPkHXoCkbw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA3MyBTYWx0ZWRfX95yGs8z67cjH
 2ghl/Q1lpG5Wrpjln1XltPuXWOoK2RV+QnzLVvndk+4L+vm+VG9rOmjTSrAQ8o0GT+eZw5ALhtF
 V2WaG71MtLgeH4AanQcg2TWZiMIRd3Q=
X-Proofpoint-GUID: U-tMlhvVs0P3YwrAohjWSc00CEogSFEp
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad65fca cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=wDomEPKxsuTd5H5FNvYA:9 a=CjuIK1q_8ugA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190073

On Mon, 19 Oct 2026 16:56:10 +0200
Pierre Gondois <pierre.gondois@arm.com> wrote:

> Use the BIT_ULL() macro to describe flag bits instead of
> hexadecimal values which are harder to read.
> 
> Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Nice.
I'd do this before the previous patch, but not particularly important.

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
