Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D315947F0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 14:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788964833; cv=none; b=Bv0SaxNSOtqmtikl5JDnK0bOWOrjzF45+SSXehEk1O0Vij3PFhoFOHpjuF3FYkm+scnpoSOb2QC4hXYRdyRqfVnXxp5ePl2KyCF+dgJiw4hEZanEj16Q0zacz7mptUofgByQT0whNx0PXhAVCFgpzuAANF5Hog4LoAWFDhF43mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788964833; c=relaxed/simple;
	bh=ncH773zu9pb68ueH4PuldOxRJVltvE/gmWzndPjXc+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tKuOg0JDaCTI+AnXfZfZfMyElOrHaDDYxQLZ8N34WdrghRMYAds4R+xaV+xhl4BHbpvtGC9hjqQ3yh+fRC7ZhpLH++xwy7ovZXKqZLlVirLCpJYdU6OPafadvDLK0LvMwHKFuhscsuMcQgzJtDWFmg6lKwiL+KJFaGz2NfXpe+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pv4l5QIg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F0MiVXIL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pv4l5QIg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F0MiVXIL"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689CAUHv1233139
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 14:40:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=; b=pv4l5QIg63CJ8cz6
	uxg1ZcSuMQ8RNGqQgtV0FUaFN98nG2qEGqPgoJUA1J6NRrXIMO/RPTSdLWYUjfb0
	8WqijyAFSRCaQYGWIQV9USbTPvuF8FKk+GfgAQzWGQNgRSqNzUDGsMlLS/XjPufj
	26ZYb1bAhrKT+CMez3BsgNxfZgt2mI1FenKu5RtpHPdmlxZOSUKpI70wApwkvdfT
	9RUAUN7LlnzRAw5ZDj2jpGix2sDnS0BjEjkSrNJh0T4Esn2/mmPspSBaB+cOfK7v
	oandqRb02zfa6XzOrHaeYGmSvyYwozB5PoessXG8AHW0s2D0oAvvDGmifFNwDln5
	5fmvhA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk77vgnbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 14:40:31 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39b6416441eso6703766a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 07:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788964830; x=1789569630; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=;
        b=F0MiVXILCD8YtMQOx2gz1a+4SFvFhcCkUcJ+w9MIBTF3fXf1qIXzHi8g06TWim7n5X
         6XQiXBOovsgSrBuDKehGEMxNQ6lWX/QEgBk/1vq9tntTHnK6ngH8agryCpCnTTKkE8PH
         QWT9jcx+PHoMurvDOGYXQnwDAJu5HtuvEiGfRdJ4sZ6DWpOipLFHJX8KT/mTeyfCdXUy
         eQ79f7RxJKHAlV11DbLX7YUQcY3QcwezBQBTueyllB9vYGfbMzS2OCSlMH7RuRYb3awL
         JqqNQP73s1T08f24ejvMRbcPdF4XCPwLnaavoSpoMXtC2OjC4rHaj05R9EU48zITYvDS
         20Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788964830; x=1789569630;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wYpdvRYRq+NgDR2+bAGysqVrNIbeZhE6Rp8OwLP/TiM=;
        b=FW2AdUHBb6tdDpTEza6QOzFBGlH66chWYl16SKNLmP6ECnE2Ub2/QiUCNIB6+/l4aL
         qcQIV88Ss4tdU4BvUx4c7n2XmnLzulQQGOFyRpY20buHPz8UKOeq+0Dcu4ps2Zxu/kF2
         ft+qpJgO9c12vE9jHcX+HugsaBHljtEfiFlXhskAMH+ixlwCj/UF5TOVGSWAqYmQ/9RV
         V5lVNuLw3mrIoE51lS0A5IexjYXBR2RRaWK0Vzzyff4w0AU1yJcdWpJfDHqEm6150yZY
         GVLqLU+rzYaBB/AqZu127KPNTxKfFIbWQ30Btd85AEnQt9D0a5r4FtCHYMLo7VHsHmLk
         6BdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfTIwRKuxcuMTWRiKxadNdei3+5Dk2/O8Zidr+8FCLRGEoLX+o1zbToIo3iob8FwLwCTGHhbVqMCx125M=@vger.kernel.org
X-Gm-Message-State: AFuF++lDNvJAHVdMGdKQiLIZU2ib00akVMPAMmd0/bAtzcheCq8yzSYq
	zJpTTR7s1LlP14auDYbsGIncYthMJt5iPNJmp09dlBRLxh0GeaIdNzbMlPvQdjMRf69Z+oXn3w2
	sg8EOeSPWmJD7Yl0uLFGk2D5GH3L/sqaOpkFFuYTNrbuCHW6z89+EB3WIIxmczSF/wzY=
X-Gm-Gg: AYBFou0JcVhumWA5zf7kV0EcTSWv4xzL1wl1idMZVOpXMITS0MaUn8z9biLBD0NWj9d
	sJqKUcd1h5ERr9O6JC4vCg4BFKdDGYCTddIAdhowWsrcW92L9zrHiU1WyOzmvZcY/Cz0wl0cj1T
	Wm5qPmzx2sZiEltjdWpdTxdmJaLV4/XnFXC7+eMUkd/2vLmkU1uaOHXUwv0gkL7jWFm+uIUrki2
	gVhrEznPpFvIz9j9EodWhPWYeJ/os3r3bOYgWXP95IIKTSlK9Y2csz9gLCppPGC2yzXAtxTIBaq
	bUmpldw7q4+YgVhCcrQFNbkhXoMtp2QCtt+BxnVRm5TY6N8cdgPodJ+h1/VR8R+SfrIYlcANZSs
	KnCG2WpAqy5/kvzo+aGScf7Dc+v9r3S1oQeJ5g7tIhyWhG8RQScGwSOOAT81Q7qrUC3NwtMXSMC
	07sO5AiAUG/RHHUVY=
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr1775746a91.12.1788964830421;
        Wed, 09 Sep 2026 07:40:30 -0700 (PDT)
X-Received: by 2002:a17:90b:268d:b0:398:b71e:60c1 with SMTP id 98e67ed59e1d1-39d70ae1201mr1775688a91.12.1788964829977;
        Wed, 09 Sep 2026 07:40:29 -0700 (PDT)
Received: from [10.50.42.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08c397b1sm38218933a91.8.2026.09.09.07.40.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 07:40:29 -0700 (PDT)
Message-ID: <b01a3558-9107-4271-bdf0-6c3d548cef09@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 20:10:21 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] driver: core: add subsys_platform_driver() to reduce
 boilerplate code in drivers
To: Brian Masney <bmasney@redhat.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GKk41ONK c=1 sm=1 tr=0 ts=6aa16fdf cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=20KFwNOVAAAA:8 a=EUspDBNiAAAA:8 a=_6l-rGU-S9tz05y7jW4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: KbAyY3iYG3vafpoFhjucsK50cKB1Ynie
X-Proofpoint-GUID: KbAyY3iYG3vafpoFhjucsK50cKB1Ynie
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfX5AKEQcR0KU8+
 VaVdN56Uw0SrayDHPqC9ZtvcCFrA/mYjMfkIw6nJLv0qRjPlSg5ng8rXbOQt34GCysZj15FJA0E
 YBitKuF1xxb7JG+rWkU3e3haJhOLltg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE2MyBTYWx0ZWRfXyFueT5cebxr1
 5sO+4TxFmpzvy9X4h7O7BbnaO+d52zbNFI3VQHL8fgkPeZNwVQOy6albePb310OFeVH3+PoPYi4
 lgbCWLMIcZIzffWCAFp1EbPRxv58Gt64HSWFZoxSw26t8MfyEaV/nJ8aEhcepeSFCvyK+gSfIIq
 GEO1v0+9+Ut85ikj0IBxM3piAaPZraR/Ozp/4TsWob0fVxxPHh1dNcpKrIe+XFfthSFmTGXP4Ir
 rzgg5KpGw+eKyS08ikiZXgRhegHKtETi8GHHV5tNZBKwXFufy8Ghq4Mg7DrDD7XCFbg9OjHn7Qw
 6Q6k+Swhob4lwIYMiIc3EjUU4y/0sHudcOCnaij3pD72h6tXa4rGzivWPxAiAuUTeJTknTtHyWQ
 Yr/FK+lP0OIvW7HpQXP4VMVq1BVRjUVDjU2W9lsJqLveCjqJCAEkGIlWGj3R6qK5ewDTwxHm4A4
 koUs8pfV4WtvgdlVkmQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090163

On 9/8/2026 11:17 PM, Brian Masney wrote:
> There are a fair number of clk drivers that are registered at the
> subsys_initcall level since some clk drivers need to be initialized
> early for other drivers. Let's add a new macro
> subsys_platform_driver() similar module_platform_driver() to eliminate
> some boilerplate code in the drivers.
> 
> This series converts the Qualcomm and Renesas clk drivers to show the
> code savings that can be achieved. Once this lands, I'll convert the
> remaining clk drivers this development cycle if all of this can go
> through the clk tree.
> 
> Outside of drivers/clk, there are 364 drivers that use subsys_initcall
> and I am willing to convert those as well starting the next development
> cycle once this lands in Linus's tree.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
> Brian Masney (4):
>       driver: core: add subsys_driver() macro
>       driver: core: platform: add subsys_platform_driver() macro
>       clk: qcom: convert drivers over to use subsys_platform_driver()
>       clk: renesas: convert drivers over to use subsys_platform_driver()
> 
>  drivers/clk/qcom/dispcc-x1e80100.c     | 12 +-----------
>  drivers/clk/qcom/gcc-eliza.c           | 12 +-----------
>  drivers/clk/qcom/gcc-glymur.c          | 12 +-----------

Tested on Glymur-CRD
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>

[...]
>  drivers/clk/renesas/rzg2l-cpg.c        |  7 +------
>  drivers/clk/renesas/rzv2h-cpg.c        |  7 +------
>  include/linux/device/driver.h          | 31 +++++++++++++++++++++++++++++++
>  include/linux/platform_device.h        | 30 ++++++++++++++++++++++++++++++
>  48 files changed, 107 insertions(+), 487 deletions(-)
> ---
> base-commit: 944a035ecca915ae947905dcfb03f2b9dc6d032c
> change-id: 20260908-subsys_initcall-05dfd5fb0f04
> 
> Best regards,
> --  
> Brian Masney <bmasney@redhat.com>
> 
> 

