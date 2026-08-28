Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA16F361666
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 15:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787931154; cv=none; b=ISpHLf0jRtayLDeGOkfMbmChKlOS5kOJBgXuRltTVbgipe8r36JGi6WJ3byAgz/9wCK5fQvYUDjj7vI/qGMx9Y0QMJ7w8p5+tt3K+lVRImf5b+NY3b9BFrb52K2lZatGiTjJ0fgdpjVNPYFh8SD1f5c8dVXg+m0U5B9v1r+XIHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787931154; c=relaxed/simple;
	bh=L7zhRxeUi/Cl9L36XO7EVgA63yI4F70i2Y9X3vhrxhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=INNiHUpEbzE7nvAbTpdDbxzLeknK3uu53Fkpqfuw4EuIEHYjJA0tK8wRrPu4gQucZG4RyNYRqTYbN2ytYFQMUQrDKBKaHFcen7J0IaZuQT3G8XlAWp98iSD9woF5MVAJ759Y7cawGCDVIEFkHBvVq+5kTzgrZd4Xwe6PvY4pz5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=h8G7i7n5; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=I+xVmtE/; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="h8G7i7n5";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="I+xVmtE/"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SFQxUL2208088
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=xVQs
	ZdfrA3r86bhZ6gnJRW0rtdXQrOUka4TbUw65Uqs=; b=h8G7i7n57ZuY49D4gbgt
	WXkxCIso9blSugvKRyFOwluhw6KmPYRiY5YpEyFEsLxVNr7o1uwpFEwVnD5Vpc+j
	1PD6iULDr2+OVnfQrBDSOeh3AlACG3LSuAU98ZvC/ku3mfgz2T99D1Qtqf58ZQHs
	66/mH6ayLdNsVJ/ob4PmYsodIlM+VcFumHpHghfLXf3yx0kIX7nDjl4YjwKXbwpD
	/OwEMBqIEQLF8AIMSeMhDKB1wR5qw77kPrceHunl2vuMAkywZnwhSm+7RCZwfN8H
	tx2IDQpNdOxZ+nloe8MVH7dO2uLbfpT7bVte0mJoJvRUBu8Xj7T9bK4Slht/KbY2
	Aw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gavj34qgp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 11:32:31 -0400 (EDT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so11477381cf.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1787931151; x=1788535951; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xVQsZdfrA3r86bhZ6gnJRW0rtdXQrOUka4TbUw65Uqs=;
        b=I+xVmtE/K7540sKSAJ97sV9Xj4h1+4YU0iiAYkNihXwJFBS4Aq+awkgHdJvvhXZ/NV
         mK9RU1/pusUov+X6VmpODNALU0n9pAiRcr7K5SKiTP9Dx+A89qPolOuiKsSodCxOH+in
         7y5jpy0J/3In++epD1tJz7gQXAux45y6Et+p1saO/thejaEydDqxdzsItnrk242KqF+g
         GO9MZrkj+6ekN5CZNmgCpQxAFr+O4mj3a1IQ4qeuvC7lipQuzwCTzMWhhXcgyjHDCmCl
         dP82sK99TookJu8jwhHD28DH1U8MsIFLlLWjBHWWuS03M2GeqGYcUqrjl3mai3jBwsdw
         YWZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787931151; x=1788535951;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVQsZdfrA3r86bhZ6gnJRW0rtdXQrOUka4TbUw65Uqs=;
        b=QpQFEJOVMsuunFFz/n5ywyBG1GqgsserTxQrf4hvT7QU3AzjDW0NR6pxdP0/hBv6M6
         MbJNUzKUfmLQBPOKXYljU5GGTbT3v6+BsZdom3ZTDDvQ+x+6jP4tDH2LwNlmhORzT/aZ
         kdRzA5yFARmuE/juOIV/1DiUlqxhYb/3HbBfeEbbtdGlJdVqGZAzKMva53EGXbyYZenQ
         BOepM1WM98rh671z7FRpY59+5YFcd9JWxp8edE6MMGttKAm4tqFMeQ616M8eMvwtF+7i
         /I1KOQq5/YLMXjNDFISilA5OhyZnfreqku9yiWS6rAKdwZuyOnYNj/CUAbkQYST+dTRG
         LubA==
X-Forwarded-Encrypted: i=1; AHgh+RoReJrdt0QOzCAR9L1KOMgc5NrwAvAfksf0868uOks4EFkJymiRsGuk1qwfwAzD80CrhrqcP45Md9TUA4o=@vger.kernel.org
X-Gm-Message-State: AFuF++mT60+PiUEBm5VInBNz2v0sgvKeR/+B8bxDx3uE2uZx7l2vsG9h
	x9fGFn2Dpgb91tx2a4D9kup4fzxWsmbO2ZX5Cv6RDeyh6KZpHKh6n80sTuyioVWKIeIGzQ5W3SD
	scmhKqjOdMAmyCtZaRM6Beike41ZifmzS+t6ToDE0ZE2JEtZlJYP+RwCUU9lEPA==
X-Gm-Gg: AR+sD10OoUZv643C8EvBnlOteC074566fIbc2nmnLG8gW90AfjEcg5Kcj4roZx4R94C
	duPjpZCpJ21+BDbKHDf5VjdpWWgIvwYiStZx+ZJG/b/GvnD14Tox0rftDSt9ohCFsGAEeF5dgcX
	Nq8N/+caDPFukK0dQ8pjhduQsSmIJ7oFbj7QpxszvlLaDtUYKitylIyYhOwZOCUi7966Q4K5PXY
	49Mhnxzv9PbxoQsKk9OlGERtOxSKWgNSFiBgZ0sJRcXnftLQ6AvO2Tz36G8LJiz31BEyMvj+rK/
	4+LmDIGPvbEAoYrV5xjzCS+bpgpoNSOK0N4f6Iy12z+l1GkPcfrD5Cfg14ZpEATqz2vI90+Jnwy
	0kEn46e+uTJvpYl/tNynPEFGYzHNvck81gBNpqcY94jPckWV5gAML2ClZdTm8rj8=
X-Received: by 2002:a05:622a:22ce:10b0:52f:ba92:1121 with SMTP id d75a77b69052e-52fba9211c9mr55925501cf.30.1787931150772;
        Fri, 28 Aug 2026 08:32:30 -0700 (PDT)
X-Received: by 2002:a05:622a:22ce:10b0:52f:ba92:1121 with SMTP id d75a77b69052e-52fba9211c9mr55924651cf.30.1787931150220;
        Fri, 28 Aug 2026 08:32:30 -0700 (PDT)
Received: from ?IPV6:2a00:a040:199:85d9:7dc6:c240:3de1:e554? ([2a00:a040:199:85d9:7dc6:c240:3de1:e554])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b926874fdsm68218245e9.4.2026.08.28.08.32.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 08:32:29 -0700 (PDT)
Message-ID: <09d28dee-e40a-4670-ae6b-30f32c2cf826@columbia.edu>
Date: Fri, 28 Aug 2026 18:32:27 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] block device fixes for large block sizes,
 IOCB_NOWAIT, and direct I/O
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEzNSBTYWx0ZWRfXwsyU6shDpxPP
 iKNjPTjbKQ9hUIUFqUMnqAZCsR4ltoErgm8lnr1hJaSJyY46XM9KGJc/v+aoX3KQjfwYVNQFJLP
 LhGyZcUqKVCMSugfGp364Iizg/5g3HQ1Tp0RfLx60ASXMC4fJjUB
X-Proofpoint-GUID: vtZChkRAvmZqUZoHcC4ZxuK6RespM5Ak
X-Proofpoint-ORIG-GUID: vtZChkRAvmZqUZoHcC4ZxuK6RespM5Ak
X-Authority-Analysis: v=2.4 cv=GegnWwXL c=1 sm=1 tr=0 ts=6a91aa0f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=c92rfblmAAAA:8 a=LL4WKY1a4g4vxyIpMUAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEzNSBTYWx0ZWRfXx7WGIunhbbhO
 cdPoTecfX3jjaUbFcU+0Pl6IILJdSh9VETdCVqDgGEVRBf2SRaAFAENBXEntl208pJ/v+YSjbSo
 NvX8c+Lb37CksEJ9vetu5lAjjToo884piUj+HrJk3SQRqTCEqOaRjgqfEjkZe6dHd2+UrgkNaEh
 opDd1fYBJMkaH2qgbyd17YUeTO7UOlsLZfyvBWX2G0qI9ouKSF/34xiPGzTZxTl4O1IOd01KJPr
 7RMNMDp+CLPcpv/AFi1s2xM+/4cU96d2wdkC+1BS8VIrYygKv9JJpcqwIp/+ki3ib95g4oOh4WU
 MLEqbP4EwBg33hrjEZBl2iIu6Y3SzB1Uh4JkKTi91dSuWWTKwKDjSkAuHDxnvEVDaL/Wep+e8Ib
 LGhgGz6ERLN683Bzmk7uNwSvdhDyM9w4TBuGhUVqJfds78QfDKNLf9rsN1r1uXmklI7Ej7PBzE6
 DiCW55RzBOVDqGrIUdQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11889
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 priorityscore=1501 lowpriorityscore=10 clxscore=1015 spamscore=0
 impostorscore=10 adultscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280135

On 8/28/26 4:49 PM, Tal Zussman wrote:
> A set of independent fixes for the block device file operations. The
> first two were found by Sashiko while reviewing the RWF_DONTCACHE series
> [1]. The fourth and fifth were found by Sashiko's review of v1 of this
> series, and the rest came from asking an LLM to find any similar or
> related issues. Each issue has been reproduced, with the fixes resolving
> the issues.
> 

A couple more pre-existing issues from Sashiko, some of which seem valid:

https://sashiko.dev/#/patchset/20260828-blkdev-fixes-v2-0-32f3f40cebed%40columbia.edu

