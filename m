Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D18D64D489C
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 16:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791562433; cv=none; b=Cy7E1+ffm88qv+4jbDQhRZIlRUeZYg7lNlShJvM8DyF55AMT7tqxP2TytyM3wKEArP1MgbbLNinpwttfrpfhVt//SI5iSgBr+nb9kOihRU1cuvbXOJ4bT1FyBUqVDKEjhVlAkLmnhSNjNfldf+WA6i3qvbL3n1RwOQnmpBaSOSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791562433; c=relaxed/simple;
	bh=DbRmeFKz9c5VWdWVaobKih64pVB21jZZPInaJVc30JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOin+Ij/cFsGJgggNO+LaQjD2am9uHQVnzNGwQ82HPTyQR8K9IRMhyhdJ6c9e9e4XT0+JLWcgdUT8B2eN9wXo+Bj63y911KEww4DMeZQrevMCKbCG1o5beWS73PUIMWdnPwnMEM0pl7qzxnnqRB7eMK+ZjavuJmR4mfK5jnqYDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=rEFR7Fpk; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Wh3AC7vf; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="rEFR7Fpk";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Wh3AC7vf"
Received: from pps.filterd (m0167074.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699EuhMS449380
	for <linux-kernel@vger.kernel.org>; Fri, 9 Oct 2026 12:13:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=wZe9
	a2En9o6BKVSoAfcVpFv08ixIGHqSssDdI/MA20s=; b=rEFR7FpkiI2zKlQkTGRv
	l8vaftdG6plJ6RIgfVd7tUGmSCNVI0yHL2nav1LLG/4/Tp96oP1HO6hBw77krAfV
	9DqRhdUIhNDvD1z/qofcFqXckmr+tx6RcME32VmKWs1SNElnfypOn9+7U4QOcUns
	TexzZt+UnyEoLfTaN6uDiyFo8LqHgFXd0x3Wi/+SnbSDDh5iUJT7ymk/xa/sdfEy
	5UiQfohU3fbl6c9Dqw20vsiuAMKQadsuyNDKWoFGqR6t1DkbKCbbXHD8NhlNFxAo
	qAlW6QKdi9aP0+tiuoXwUnj2abu4UzdUkxyPnXbo2E73uJzYUlLX+yU3+yszUfou
	Eg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4h6wpyuec1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 12:13:44 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso1350056385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 09:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791562424; x=1792167224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wZe9a2En9o6BKVSoAfcVpFv08ixIGHqSssDdI/MA20s=;
        b=Wh3AC7vfNz4ZoqbGbukZDwiKnCjMSD5r7Ml9z0mQfYyhftvfQTIm57nNe4tkaJMZEf
         YJvT2e+xNUoXtFn2MBf2ObElMoRaAXJhIWv2Lbi7lvPRIwaqGxjyhtSe9Ntkf2oAqMwi
         iW9ja65YIui61u7Yg+mkqfrLdjlFYcbC6eSxNIvJVYo5M/I+qTD1H2ikx/nlnCbA7+Nz
         pRz3FYrpAWIOm+gnTvKq5juZ+gyEzKuZmCWBhyiamVaIRwm24uHnDcQZqSo5ojGu/YKE
         6vwl5inSAWpUGJb5sI7anJxXEcPXkb5qS8pyFzHi+Dw4T0eYqmyQer9/l8LX9UFoC9Fa
         T6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791562424; x=1792167224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wZe9a2En9o6BKVSoAfcVpFv08ixIGHqSssDdI/MA20s=;
        b=N1EPd0vN/sQVwMviHxUMILE/viEAt/U4UVh44scI5fMJUlUQCPD1fmJjyMMzkbpZli
         JXfcGXK//gpJefxsmoACmWsaPQtYqhY9SkwvYsl7CSXGqLj1a7BU2M/HppFmAjHytrEw
         BhiStmI1/PQXUwbuNh0TRJjC5yqtjI4TCMyzuGV+nS5olo2nF2ukqBy3uGrPdFmUtHzu
         ErvIlQMaT3Tpkpqfe0FXTe9NWCszSxF/rWk2tu07siUcZnMNNtlmgB8cQEARJP9oVYVZ
         nL70Zs/arBlsGt5Nctqg6OqspbYGA9QteblNLwu4/Wcwu92r5+LAu346E7zMvkmx3Oxh
         MtJA==
X-Forwarded-Encrypted: i=1; AKwUvBzTcMr3AtRACbei8JMJ3cZjCMOvDuUUhTwQ4jffNfkRpNH9/IZ5BFj53B3r2I8CfMMlTxQEJwsuGlyUwJU=@vger.kernel.org
X-Gm-Message-State: AFuF++nSfs4i3JsyQ/VAVvpn3xtw5OJac7FnwWOh6xo5s5etPFs9AI3y
	wXwQjbhSAW75HPD0z+F3FKvgQfDjg8rr+TeDDqUr6IEgT5lY5dfLCMj7ie/3q175zcTCfUrzSpL
	mq6rijeHCQOGkvmld8KssKH+AAo2gVFJsoywZ1OSWPSYivLwoI61ku88j566J4A==
X-Gm-Gg: AYBFou3dgAGCZUNHjWvOXveOoD3i+BgQoAOkvreyqOJ18Z9aiKBC9vuVg//N6IH5bzz
	jeydtY7F5EyIohnGf68MX5YjX73kOTWnSRngwGkyac8vpQ5tyaDBJ8McNQJ26cIl+39FFG6zGHT
	Cyj9Zq4cHrzZhEHt7SE+aXkswsDAoyglLFaR56L1GTA6Z3S57TLKR1TeWFJcZ7JH67hByK+5XMr
	A2oRp82juRmmOZlLQlS+H04mjTzOHKLym7sp013/Sp3P9MsrcftHF5nufnVJxLf+UBnfazT2coA
	ABXmcLV0RRqiyThBEZ9S4kRJ7bGzrbjznpmzJpGnQNuMvShE2082hCrMBzQkIW3JBttbLn+HqBM
	xZZ6QhaCn2D8mBy3fdRjN5PI7u5a4rsDpbx89u/rT17alTJRf
X-Received: by 2002:a05:620a:a416:20b0:93e:c12c:9b76 with SMTP id af79cd13be357-93ec12c9f3cmr196781185a.81.1791562423669;
        Fri, 09 Oct 2026 09:13:43 -0700 (PDT)
X-Received: by 2002:a05:620a:a416:20b0:93e:c12c:9b76 with SMTP id af79cd13be357-93ec12c9f3cmr196774685a.81.1791562422959;
        Fri, 09 Oct 2026 09:13:42 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-178-194.net.columbia.edu. [128.59.178.194])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93eb9720f24sm221712985a.3.2026.10.09.09.13.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Oct 2026 09:13:38 -0700 (PDT)
Message-ID: <69a325f6-5641-4f12-b088-5e108b48ea97@columbia.edu>
Date: Fri, 9 Oct 2026 12:13:37 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/9] block device fixes for large block sizes,
 IOCB_NOWAIT, and direct I/O
To: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.garry@linux.dev>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260923-blkdev-fixes-v5-0-89e60d66eb38@columbia.edu>
 <960b1305-c5a6-4554-8bab-1cf4244fa11b@kernel.dk>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <960b1305-c5a6-4554-8bab-1cf4244fa11b@kernel.dk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA2NCBTYWx0ZWRfX3CPe7rCPOESR
 mjzbwSP6k8KyAapR5cl3Ul/SC4AQXmQ5tdoUHe4BDepZAiaYow8ptpDWvVOzOECC5iz8Zg8evCN
 /Y/HCM3+miKS60Mv/7WJK7qaxA5OVFvdmt73lYeSD630jkqasUE2
X-Authority-Analysis: v=2.4 cv=a42lZkSF c=1 sm=1 tr=0 ts=6ac912b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=u0MKzLA9JmpizDwXU9Rxjg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=azVShVRs0zEubeQ0wG0L:22
 a=kmbzLJUYW2F90v5fXl4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: Y2f-pZusxtN2MDS89zndz9YjHAVA4uCT
X-Proofpoint-GUID: Y2f-pZusxtN2MDS89zndz9YjHAVA4uCT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA2NCBTYWx0ZWRfX58deH6NF9A1+
 L9Zul2rfoqijkcPDMcwyznZX7l7Z2/irWD9dPkmKeQHGWwEgsD241JCwthpMaF7r8FuYcOV8tOW
 MgyCJTsb6eBvyaIGyASjPB2TaEPfoEIps5d1JzR7/lmq00Ino66qCVo0A+Ped2V00Kv/MufEboi
 bber0ZlV0t41iKQH8Fe7TdK6q/lRZkBwAM9dk+KXmLCdnj/x2vwRX7l10CM//UFdiSro+9voM/1
 3iWY93nhfZTOfLrxWuQRf+1Ji9saL5+GggLa4ebg+9ogLr+gV201ATf4o4FS/xhBWvdKfzU7UpR
 txTMnEIFST5Ov3L/6a95sP18AD0ejC9ZQRCtbCZX6m7wecGBN1cvNh7GrKRUxevegpSvzLxopJs
 WyFJ3y8ASjUItVjbnN0jTTtHkrkYAkaqmCihYqtb+ADyB77KZRlEPFYUm6//fpfFTku7bIqZ+mN
 96AD+y1HjkqZ260I2GA==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11930
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=10 impostorscore=10 suspectscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090064

On 10/7/26 10:05 AM, Jens Axboe wrote:
> On 9/23/26 5:56 PM, Tal Zussman wrote:
>> A set of independent fixes for the block device file operations. The
>> first two were found by Sashiko while reviewing the RWF_DONTCACHE series
>> [1]. The fourth and fifth were found by Sashiko's review of v1 of this
>> series, and the rest came from asking an LLM to find any similar or
>> related issues. Each issue has been reproduced, with the fixes resolving
>> the issues.
>> 
>> Patch 1 fixes silently lost mmap writes with CONFIG_BUFFER_HEAD=n.
>> 
>> Patches 2 and 3 take i_rwsem around the direct I/O write fallback and
>> the splice read path, which race set_blocksize() changing the mapping's
>> minimum folio order.
>> 
>> Patch 4 makes the buffered read path honor IOCB_NOWAIT instead of
>> blocking on i_rwsem.
>> 
>> Patch 5 makes IOCB_ATOMIC writes fail instead of tearing, and patch 6
>> stops the buffered fallback from retrying an atomic write. Block
>> devices can reject both paths into the fallback before submitting any
>> I/O, so we fail rather than issue a WARN() like ext4 does. Patch 7
>> makes iomap_file_buffered_write() reject IOCB_ATOMIC, so no other
>> buffered fallback can complete an atomic write either.
>> 
>> Patch 8 fixes leaked page pins in bio_iov_iter_align_down(), and patch
>> 9 removes dead metadata handling in the async direct I/O path.
>> 
>> These issues are currently unlikely to be hit in practice due to the
>> specific configurations required to trigger them.
>> 
>> The reproducer for patch 1 is in blktests as block/048, and tests for
>> patches 2, 3 and 8 are posted at [2].
> 
> This is based against the 7.3 series for some reason, can you please
> resend against the 7.4 based branch, for-7.4/block.
> 

Will do that shortly. I had assumed initially this would go in as fixes
for 7.3, hence basing it on the 7.3 branch.
