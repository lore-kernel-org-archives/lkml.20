Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108A735C1B2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 23:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790206746; cv=none; b=aRuewrunbaM/kQplFGxfe09NKC9JWl2diMsMFEfTS7EA+oSrh3wmzwlX5DyuK15OgtGf6Muspc6aLpXSYGP02jmHnlaGKhW48+1qnqOZOPMdHfpsGFnik/eJ8Ovr6wJ2SxQCgG4EnTx8nN0Eb8min+dIjg7JdGgRm71Bsj8veao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790206746; c=relaxed/simple;
	bh=K3YyBaWo543pXNN5qq+I3FP7iBd5+S3J6soaWlcoDfA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lh88i16Gw2sWvxeh8/hSERk/TNsm3/Ly7d2O9s9HdKFPcC4zBWYkIO7Ja3i4K3OpEm8Jxx8HbZG6+PYhlndp9oTZ37j/dGtvwcz+O3+E1vR0QdUvdc8KifP+XE/wHKeL5hHS6AwgGVQrgLFkMqhWnls+8mV5GO/UE6TtbueR8Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=hLztHIDR; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=LCHy3tMh; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="hLztHIDR";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="LCHy3tMh"
Received: from pps.filterd (m0167069.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NNEDpK047002
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=vK7o
	meZPmtdnE0KTnf60DcGTqHv0vNuINGT1nP6QP54=; b=hLztHIDRpVz/vKYKc0rl
	QKrD16ths0N5dqHrCem5e+EQL9IuSt0fqM22d65lCGvuXtM7Hvzl67AWqHVab/nB
	hAeepXwjTm8qUGuB5vIoAgW/T8gAzjF+Tt66hugUCVo045JJiG2yoeenlnS8XrMD
	Ayb6u+ENX1sV3bsOWsfVGL89eY6OrvjUirMLrwam62QWNmlhrOPBkudiTYj3+9rD
	sqWDAhNeQYKewpPcNcC30KQrdIackUvGt0/4TptOiJuO3SFzpsy37QnTCEzQWtpP
	p6cfRZhJ84rWESFb5KjgyXA4WKnRxFswOoMPE2HjsFGqTlXDef0P/FSR8UCe85Hu
	RQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gvhrem35s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 19:39:04 -0400 (EDT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e54b6556aso1390915a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790206743; x=1790811543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK7omeZPmtdnE0KTnf60DcGTqHv0vNuINGT1nP6QP54=;
        b=LCHy3tMhf4MYPrjFXKqKuIkYoNPNkfGDZiTy2NPgDkVt89j3j+MuKZqD5eq+GqiYEO
         swCB3DXmFp4HR5E5PpoBbuukdnDMxNXQQ86J4J9GYJ7g4ZjnMWQu2QbCRXcn6RBa0lVD
         r1rRTjHUPOLNtXd9vlrMyblRp69fhPPv+qQdVYwYg8XqqJ1IY6MhaihDOeHS2NjEzVrn
         GwibLeML5DZz9h4+Wt2WYELN7ZsbG7K795O/mUMLEzBFvziJYQv3hLHZje2YPPR1ax1R
         2ytZSssu7G1I4pnTVa1NIPfOzuq4kYjdbPvfaQ4gWyrKZroMdGVUaSlWFaHvXJSx+egM
         aENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206743; x=1790811543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vK7omeZPmtdnE0KTnf60DcGTqHv0vNuINGT1nP6QP54=;
        b=nNBrsOdJO6p66hnwkJ5dPXQspc0xnlNspvmm/IYM2H9hRbTv+6aLezHC7/M2SfIha+
         rZMjvzT4hVOX0mEDfBWIjBfdBXP61y/SU6kw+aKfjpwlufOZex8Sa7CFDqsxutNl8Fr1
         Dni3bVI6Uf3oE2BHOF7WdreuHim9EPzhRQ2zYSXYsMqJqyy2zPZcxo1c9/eUi3Cv4rVd
         QrnlyZam+jZjLupNwEGpz3LjYzuEAgy8wC6LorO5M3tnM38OJwo4Pp1/0VVj+k99tRok
         pzF3iMTRMXOFcQp5EpPbHS82xGqSiKZvyR4D75mvYwKl6IPekPDd6IDJ2jHjN3fYUJhj
         Vojg==
X-Forwarded-Encrypted: i=1; AKwUvBx62ZIE+ShWtXne4lL1cKD0lZKG131cq9u18Fy+wQ2AoXssb36RfKHy32S2SsoRp8Nt1mdmNQrt56H2VUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kvaZxiLa2A+uaD3kFAaVDKtHmLkP84VOqOzn28y00eyPlAfd71
	ele9Q1E//SjQzc5ZlShmLa7dxHLRejyrzV5pnE3SZiGd3jK/CMBcWRoU44J+g1Ff56Q7jIPCxD1
	4WutLeHFRBAvm7uWgzRVHrf0jwT2W8XZG0NgoDuLrIAwbcTPbNkSMLLQdyeC4HA==
X-Gm-Gg: AYBFou34ZgRGoBSGNN6d4esJTsekm++bSw5bbhCBg3A/oxDoqN1Kqc3ApCVsYwMYvsI
	5YuzNYy8nbvtA/3B91G3Z89yapCMvFtodf/gmTT8YtOACqXahzMd7v1oTHgcb9hf3PbaC6TEzVq
	uedvYIpyMtgL6Du+DAYUV0DC5l7US119DAQcdzcM9dJ6NNIXLHKlzmBSgRCM52EKBqhviqJsklg
	Yi1ILX2rjuzJvmDMzAKvZsC6xI+g+5QYkrDJOMypH0q/RlYBffOIamPbhDvaU3mL2lPHTTF0s3M
	PMbxi/XASedRk9KD4vjNOKZSdZt5Q9iEwLJPm2ZavugGTuvjLTYaQ1iVH0BYuVF9JQPF4SdTSH1
	zBT02J+eXIzZSifoueVEfndgNZCKQmr2C6hkdHcnAnaQI1yZAsA==
X-Received: by 2002:a17:90b:270d:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a098e006d2mr535113a91.53.1790206743526;
        Wed, 23 Sep 2026 16:39:03 -0700 (PDT)
X-Received: by 2002:a17:90b:270d:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a098e006d2mr535099a91.53.1790206743134;
        Wed, 23 Sep 2026 16:39:03 -0700 (PDT)
Received: from [172.16.0.184] (RED-LION-HO.car2.Seattle1.Level3.net. [4.53.155.98])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec711sm1248285a91.6.2026.09.23.16.39.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 16:39:02 -0700 (PDT)
Message-ID: <4e25b2c3-7030-4084-8202-beeea9f9e026@columbia.edu>
Date: Wed, 23 Sep 2026 16:39:01 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 6/8] block: don't fall back to buffered I/O for atomic
 writes
To: John Garry <john.garry@linux.dev>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        Christian Brauner <brauner@kernel.org>,
        "Darrick J. Wong"
 <djwong@kernel.org>,
        Keith Busch <kbusch@kernel.org>, "Martin K. Petersen" <mkp@kernel.org>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260921-blkdev-fixes-v4-0-e2801f71ede9@columbia.edu>
 <20260921-blkdev-fixes-v4-6-e2801f71ede9@columbia.edu>
 <c0613627-9801-473e-8120-4d4a83133391@linux.dev>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <c0613627-9801-473e-8120-4d4a83133391@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: l8kjk3voN_vtWLRxMCLipmN5-pWCaKFm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA5NyBTYWx0ZWRfX56rh0J7X78Er
 BU7HWQF2qoFxhIKfl9Eknh7hOYqaLaETXxiQNz2v1R9GTZEgdvlPQPlZMTPcV39o+o3G6xI2Uhg
 wvqc04Dm5m4lDbkT1EXqb65xgicFUMPh1muekI7TGxgh7IlsxlhRRGbR5RvoIBq6VXzAhvuKVpJ
 PDMYVAJppWBw9CVvlVNqwwyhy7sW8fKCkyClYm417Tw1VBNzl/CZdHG6fr0RiP0RiVqkgn7rfZS
 WgHN1CebnE7mHL2gkPVkycDPUSZdtj1A494DKhD/clvPJBIbT2rN2Z/rnTGOcjt6gVM6fFpfRf6
 ME2DFnpU4xyftNPypIF7dgSWygT1KDSgEg3AbjVaOwPqkdpGCdg4ZqgL2pzMrsCY8lLOaqVpQb5
 nKNPn/+9nqHXw9DKfRWu0I/RhNIoudQi8HpuUHvoK3dsJN5W0KID30EkTs2h7ujgfvn2Ub1UqDV
 +Fz9WhpKWQEvEdmU5jw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA5NyBTYWx0ZWRfX95UTKJRoGYxU
 RvDeTNAjQ9LanghF8A6FemTInmycCMkZ02uGhJC0wSW6pzGUt1Ff+F9DYwTiCJeFQYfKb3hfMLB
 ZqVisiP/DtnyTZuRwrUsQtKK3F+9HO9CqYGQa0NNAq1zXWfPXOQn
X-Authority-Analysis: v=2.4 cv=J/A/fwnS c=1 sm=1 tr=0 ts=6ab46318 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=6aZ3Ysb2zzbY2sELL/OBJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=JR4YdQiviy7OQf72WyZ1:22
 a=HS0_KwlRLz3-zwHAltEA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: l8kjk3voN_vtWLRxMCLipmN5-pWCaKFm
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11914
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=10 malwarescore=0 phishscore=0
 suspectscore=0 lowpriorityscore=10 bulkscore=10 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230097

On 9/22/26 6:05 AM, John Garry wrote:
> On 9/22/26 03:54, Tal Zussman wrote:
> 
> Note that I still think that you can add an IOCB_ATOMIC check in
> iomap_file_buffered_write() (until it does handle IOCB_ATOMIC).
> 

Will do!

> Reviewed-by: John Garry <john.garry@linux.dev>
> 

Thanks!

>> ---
>>   block/fops.c | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>> 
>> diff --git a/block/fops.c b/block/fops.c
>> index 90777e8a9a6c..7f23778f6b81 100644
>> --- a/block/fops.c
>> +++ b/block/fops.c
>> @@ -766,10 +766,11 @@ static ssize_t blkdev_write_iter(struct kiocb *iocb, struct iov_iter *from)
>>   	if (iocb->ki_flags & IOCB_DIRECT) {
>>   		ret = blkdev_direct_write(iocb, from);
>>   		if (ret >= 0 && iov_iter_count(from)) {
>> -			if (iocb->ki_flags & IOCB_NOWAIT) {
>> +			if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_ATOMIC)) {
>>   				/*
>>   				 * The buffered fallback blocks on i_rwsem and
>> -				 * on writeback of the data it copied: return
>> +				 * on writeback of the data it copied, and
>> +				 * can't provide torn-write protection: return
>>   				 * the short direct write instead and let the
>>   				 * caller retry.
>>   				 */
>> 
> 

