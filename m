Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B0D28726E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 20:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789330376; cv=none; b=G3Z2otiIiXzPrRIyWOFj8DLQB2f3C6dwJudEIEct5Hk7ZkEb1upRRXUbFr9sQf19L501TEYvFe6nwqUtbv41zEDohJAXdNykOrmzS+yaqGpIpIaZEk3pjmt0EHAT92MvrF92piS/QSZepfTQJe/Sh663hIAOZHzfsIt96/Lt9ds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789330376; c=relaxed/simple;
	bh=k0GTGV5zZqW8e9OqkW6QVLzZ/2iogaea3tj5Guot4+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GH6UMSZw54DCebkAD+im0FpD11HYPsdcrkDdMi4zk6YfAZ4WY7o12DVoBwTwcsT6TNAWGWFXW6kZsSHLrTguKwPmhIHn5f8Y+acGk4zOZIyvbqQlXfXhzp0kwpjuKbJI1l92XUvCJECHA3iaihXbhJElAv3TWk+8OFmhh5uYz9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=gQoy7Xrn; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=VuwJdDoe; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="gQoy7Xrn";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="VuwJdDoe"
Received: from pps.filterd (m0167075.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DIYgF2312006
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:12:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=bDqM
	F7VA0MJ0fYRBYzcGOJXnsLMvTFFlZbyP/iQRyvU=; b=gQoy7XrnrRKCEEGq9c7Z
	jd8jSDobtRDd/bEy8dimQWvHSaJMnvEiKRO1u+riGDJoaW0H+yBjyHfqcBzmT41u
	Yjhd+kLsKL04Ip9Ny6gN3zdz1+7yd+JDyRBGXvWJ7yQZACzLJ8xPPOrBnCvbjACZ
	hen0JjAtM6PbslsAHNBxnlPBjBlNVt6GAi6rqPBWf8MjPLMx24eDcRl4NYqPblH2
	yeGl0rpo/e/cY2XR4Cv9NFuhB0DmpvYPkPw+4XzvF/E5lD01jLd8as0viLJiIJ2G
	Vnlm8vCrl6cMqjqq/jSTo/ycUA0Oi82kL+4eagyF+ofbdAxHkdR5q4sQHTk2z32R
	Iw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4gn2qjpysq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 16:12:53 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934956beec8so480589285a.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 13:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789330372; x=1789935172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bDqMF7VA0MJ0fYRBYzcGOJXnsLMvTFFlZbyP/iQRyvU=;
        b=VuwJdDoeM8b/k1uDMRzOOpcg4oaCzLaCZSbn/3aDPtSIAFniFee+NnnsaWUgDmBWcX
         biNEWvRASr05JanoC0xWGcOXDZpkJEQgleEHSpVffx5tzWW8OD2QxGLJwRLd2s5tvszs
         F29xfcyF2o7+bRkXmgZOXoCvOLmcN8ScC/uTp9NLe+HiBYfs9WTxNxR/ai0gzBNLXkPt
         Lxos1cNBCvLpAHFpCkz2Qx/Syk8z4ZD0whwZZktIVr3A0myDPOtpGhi02VVDPT5Rz8Bk
         l5AVmobuZZTTUoBYWEBmjV+sOtaho43Qq1b0gZoj37/OzquRQga8PkBJxqIsduAWeil3
         OygA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330372; x=1789935172;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bDqMF7VA0MJ0fYRBYzcGOJXnsLMvTFFlZbyP/iQRyvU=;
        b=YRJNMqKxdMTqukErh+oHqYEFyaFHODxqQiZ968r1OJ1GOcgCm22X4kWidibOKOTuln
         tuz1xUwrLuzQSzRB0HRC3f0m1sLdjj7nYYmbrCIfjrk6UUp9zsZ3R2YizEwqhQ8Beq0j
         2lQDrnhBzeHgjw+op+E4fkUb3OakkNss1riP5wH0kYWiWbFugTTUkYj+IpfTdxd6UF9o
         jiwKYFNKHdi/29euYv9lrN1Lax+UgVWUTxx+DA6BJx8bGFkB9d+557sjt9SDt2sVRQt5
         i38M2WsVq5HDpc/AG81jwZZyutIKsrApJNt6CoDe8XYGWtgdj8g5CARXjZYUE34hhiTm
         59JA==
X-Forwarded-Encrypted: i=1; AKwUvBwhpbx6eZYSzdVlLeh3cMBv/6V4l/nLekWGh0IrtiAlaeKvYbKgoRqTk+uPhheY8jCYhU0/bHyY7tSrgMY=@vger.kernel.org
X-Gm-Message-State: AFuF++mxTYLTOCOt/czzei3G0jBvcSHjgKBew7WoGnbBDfyxvOTbL9vl
	YwWwMqWmP0bfsWOo1Ls64KtsTc8lSn8ssoD7cdk0kaHflZfMcrq4pRKNDmWRGa5+BheVPedVTOC
	S8HHMk241qLRbvImVOhZ26ktcHD1p5wKkywgFKVMJ9c8LVHkNToirxZYWcksBDA==
X-Gm-Gg: AYBFou16qNXqik0jLW8h2oOk6317KfxC4Pn9WgmKm8tu7NtDj9FP9TRilBkBiep+gMk
	pZgQ0kNmRzKVsMnmeQoPKP9gJ/BHy7FQntIekTJMysTAt6TsFwRnlqGOwL4hXV4M6+7e2f+eWo3
	jAs0dY/RMSsvc5YYZgPT3oAWliVJMMriDjs0Lv+JGf7To1Z34wZ3Alzk0hV1BUw4WotWrDvmYFA
	7Mbf9rfI77Lxx0UHXTawwIP+iJ5VNCjOo0FYSZtitRELuPqu0PtPXjW0qK3tozekIbvaL6g5iya
	kPyOBAxpcf8ToIGcoYtJU0zxdFvnsRR0lIDwtu15jWa1bbMRNYE697lMccCOVbIQ2lqRqtdFfMA
	/RLkgpnGArGNmQPnlyDfuK4pXD4wsjCXrKCmJUjeUOoVX3EPEkGmf
X-Received: by 2002:a05:620a:40c2:b0:937:6832:1f04 with SMTP id af79cd13be357-939ea22aa00mr2003300785a.34.1789330367729;
        Sun, 13 Sep 2026 13:12:47 -0700 (PDT)
X-Received: by 2002:a05:620a:40c2:b0:937:6832:1f04 with SMTP id af79cd13be357-939ea22aa00mr2003296885a.34.1789330367325;
        Sun, 13 Sep 2026 13:12:47 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-179-215.net.columbia.edu. [128.59.179.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d89f9sm79149266d6.47.2026.09.13.13.12.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 13:12:46 -0700 (PDT)
Message-ID: <64febc67-75ae-43e7-8b12-6f9de894e66a@columbia.edu>
Date: Sun, 13 Sep 2026 16:12:46 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] block: remove dead metadata handling from the
 async direct I/O path
To: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
 <20260909-blkdev-fixes-v3-7-1a5222c6e8ad@columbia.edu>
 <b6eb9cd8-9597-4023-a2d1-7bc0f07f68b2@suse.de>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <b6eb9cd8-9597-4023-a2d1-7bc0f07f68b2@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Si36Swi2AerNBn1sofTvNzSvY_kh8Pld
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX7YN5Xvuds/g5
 pw271UyjkaejRdNgRhI/dZWSbmTmGdwud8B1z4xe/l6q3nvXOOl2Z4Ka9vQpGdhhcQxOj3kXdjK
 5wMjg75eEXAnhHifXIiIQyxhgo5c09wTduNI4Rt+YNqyrQiMkag3oRKm75xpo5FvBf0etFfBC03
 lTuZXx3N+/RucvR2Ewqp5EwUTC7OFpoePFn3DGoc8XRfmx36CJmuOEu6hC7n8MY+GopaajZ3VxF
 Qfj7+iLlq0emQZSxa/t40OeTZ49Ipwmbm9To736NmOJQ817jjhBh523wFxIiyZWkij44Pb07Uhh
 vrYxXwalTQJZYVWdMvokAluyHq++riofKSvM8xh+Jc6liQPP/hqPzfUrIZ6hFdexVQb5++uxqf2
 Xw8EGe9NH9aDkFywJyGN65wTtelt6bgQdrPLds6Qy1AAo5nXnDjfxheD4e98QYEZoSXWA+8gc4V
 69BXVL95BUFAiEnt8XA==
X-Proofpoint-GUID: Si36Swi2AerNBn1sofTvNzSvY_kh8Pld
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI4OCBTYWx0ZWRfX9q+w+OZHadCN
 63/sIWWHpCbgz/EQdKGfvaeeXjEJeTndyiSgaVNQ+rA3BxlWRT+lrZ3l4CQ6zqkfeXjQd4Yb0af
 pduABW9wcpVfZv5iQZluBGlZsHYcE3phMufZVEGB0EzUTlfVQAGA
X-Authority-Analysis: v=2.4 cv=Bp0IUoX5 c=1 sm=1 tr=0 ts=6aa703c5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=2jelXx5xVcRIF5zNctN5Qg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=HpS3TJQ9O3Ob1ozEcmik:22
 a=VwQbUJbxAAAA:8 a=wwJz1-KtMk0lVk0rRkEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11904
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=10 clxscore=1015
 phishscore=0 bulkscore=10 suspectscore=0 impostorscore=10 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130288

On 9/10/26 6:40 AM, Hannes Reinecke wrote:
> On 9/10/26 12:05 AM, Tal Zussman wrote:
>> Since commit 2729a60bbfb9 ("block: don't silently ignore metadata for
>> sync read/write"), blkdev_direct_IO() sends every IOCB_HAS_METADATA
>> request to __blkdev_direct_IO(). Remove the now unreachable metadata
>> mapping in __blkdev_direct_IO_async() and the unmap in its completion
>> handler.
>> 
>> No functional change.
>> 
>> Assisted-by: Claude:claude-fable-5
>> Reviewed-by: Christoph Hellwig <hch@lst.de>
>> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
>> ---
>>   block/fops.c | 10 ----------
>>   1 file changed, 10 deletions(-)
>> 
> Maybe a 'Fixes' tag, since you already referenced the commit?
> 

No need, I think, since it doesn't actually fix a bug.

> Reviewed-by: Hannes Reinecke <hare@kernel.org>
> 

Thanks!

> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
> 

