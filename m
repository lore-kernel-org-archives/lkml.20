Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D783B3CF021
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790672627; cv=none; b=ukNGXbVRX6ZwEfoy1aG88WpuE8+mzzZXRoYjkJ6IwFvWadzt04V87yvuEiuMO1nheTTItQXEf0R4++/wrGjQE9/Z1Id8T3bKUh6kZ8uzxJ/bTcUKxF0BEJUGFf1Bc//otuSM61NLk30SkdwWUWEga/CQX1CC+A7VtMaSA3PNnzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790672627; c=relaxed/simple;
	bh=qIkpliZGABu/1DsQ9lqxJf6xulmYU8xgQLf18jeRo/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I816bj85orVF+sBJT5wC9drBRfbXrrMlMsdy9FFbIYwelnN3ND9VXLbTqMLuzmpKscZ+oUG+Ai6xUFDwHDJuxRlhOWXeqmEVhnBIOsYtI+CJv6uzjS9f0FVT06Y2q1oUmpzZuiKIyk7dsw9F5zG5GpKXU/DD3/qWGKVvDRnrZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=Cvw+v+7g; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=CncbDnl6; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="Cvw+v+7g";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="CncbDnl6"
Received: from pps.filterd (m0167072.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68T8XfGR1316411
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:47:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Nhw8
	v53Ku7yoHr9osqQh1xifI8ymi7aYlLItUVuMPgU=; b=Cvw+v+7gR9f6uZsw52F0
	MXPD0qPAq9Q+gdETTR50hu6HwIZyql1BqQ3hngAWoZ7hl1s8zJNa7ENhtX8qRMO1
	d6KwAcEU5x4qHip70NKL1Lezj+cZokgT4qnL1JdgCQ8xpGy83Ui3/sofCsgfB9oG
	dUvHuciNrM+Py803HDSfzYIvJepGceM7aogzK11x7D8ZJDUaVMOYnx7Z7/Ft8vcA
	8Pe0WcyhxnBwiMfSmRXhVk/cDdJeh9z4MMgMyjQqU0IiHBDTp3fEI5yoje1PBuQZ
	tR5V09oftFknpJBxo2xlBxs60tiJnAJ/mOoXMLygEXtEJNmkhg4KndL1MLVdhFZF
	+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gyytd2s5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 04:47:45 -0400 (EDT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1e564fd5so751585285a.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1790671664; x=1791276464; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nhw8v53Ku7yoHr9osqQh1xifI8ymi7aYlLItUVuMPgU=;
        b=CncbDnl68wrk+LwE/fGS2yfT9w5F+q5j4wX5pEJqePFRYUHqnQrC7w3oflSW9pwJP4
         lT/S2RN6v6C+rEKkSff+ZhkfhlvX6Nz2L1eN16lrLxXtU9kJWAwNEbli+3s+XknpfgnB
         kEHn+RB8pKQsQvNi6G7ybN19eh/y1n04xQKcX2zqr2nm6lNGwN7O98oL44lodjd7i4ft
         4t2T0Ts0oN9dyt5N1Y/8FEuEZRh7bn7GLzX5liXZhxxsjYt+Ryx52sbClqFaql0s9kJ3
         YAHEPUsy2IMYgD2Jivzza1L20BJzV9zdGgX+Et/l+AFJ5B5yStTSKK6OAngCYXdUCJQH
         wjQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671664; x=1791276464;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nhw8v53Ku7yoHr9osqQh1xifI8ymi7aYlLItUVuMPgU=;
        b=nOCs0lbE4XUTD8XWS61JqZGv9KowjFQrGYB202D9MKFDINoXnQtFqRGiT4KeOOozwI
         TQLVKRDH2c50gh1V4NSYzQDJjn6YkyzzYdpntp0OSSbO98nBro1kWWcB6Q+mj0BFw37R
         QI/Wvp8KAXdDnT+ywYh7XKucC7/oWhraxj6dQF15ulIL6Ta3rxw53Pd8tKQk3xc7sj4t
         vnoes5wEBuf2wz3SowFh50mHQmsicF0ZdFaSk4wWXOnYjc7w4u3HEtvNWrvu/TXGJKve
         dxrka3XgSDYVrejOtv3uRqYhMqm9Kxmcizp4IC6eI/6QrJZZGfzsRSTxuQz07HAzD1vi
         KthQ==
X-Forwarded-Encrypted: i=1; AKwUvByddOf1JoiVSMEfv9AuDebVQ/8zyUu28myUeg9i4Y47YZW7MsvUGlL5kmSUk4DkjHRUeQ4x4vRLwXvbpgw=@vger.kernel.org
X-Gm-Message-State: AFuF++klPmjnfM+N++TN2t+spiRJTmyV5oWUY/MVr0J+VSSdhmO2N0cH
	Av0Dgq4hZG+rNHN1QL69eHkPizbdPeXxPdZbs9El3uS7i+zr8gbcyZGEhQp4u2V5BlvG/5ccYhx
	TYejg7SrCO/GGngkzhf0nYZeA2yjj04k41rCkngvXauHoExLS4qwi9ASEQz7T1w==
X-Gm-Gg: AYBFou2N2ghjE4mYCOcmqhPqTOD8Ik4C4feH/NwMCGeKvOCcG/g0YtG2jRABxnqqDs7
	NcC+2LbJR0rF6/lsZpQBe8mJG9oMsYMKz8xB9/Zs0TXdRUQ6rcjddnFzcSF+kDb33QjXFMCMsDO
	tAyMxk4ya8VmNvS8iBYPf1VUPdvCz7ZrdS21r3PKgg5EJbyocZcs8GeUvXcVqarNbzqdQCBlgNT
	Xd5UC85b6xRuuPRK9VQFBEJAQpIAvhhYuajqapJNZN54u/GYqtdU2ghZJn/hcPtickCBrBQWn47
	P5OQg7c8G6mmyfbsmtKRwkuHJ5ROZ7Zn44sSSKs8DeFO2CRgWB4T8hWBJpLSdGWe8RTB8wwwY5X
	ciJvwUljXsJOD
X-Received: by 2002:a05:620a:4446:b0:93b:6113:218 with SMTP id af79cd13be357-93c43b80eb8mr2546610085a.12.1790671664161;
        Tue, 29 Sep 2026 01:47:44 -0700 (PDT)
X-Received: by 2002:a05:620a:4446:b0:93b:6113:218 with SMTP id af79cd13be357-93c43b80eb8mr2546608385a.12.1790671663703;
        Tue, 29 Sep 2026 01:47:43 -0700 (PDT)
Received: from [10.192.23.156] ([82.142.85.169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48af508cedfsm2418391f8f.30.2026.09.29.01.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 01:47:42 -0700 (PDT)
Message-ID: <bb13358b-24f2-4462-92ef-0e538ab314a2@columbia.edu>
Date: Tue, 29 Sep 2026 10:47:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/9] block: fail a short atomic pin in
 bio_iov_iter_get_pages()
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
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260923-blkdev-fixes-v5-0-89e60d66eb38@columbia.edu>
 <20260923-blkdev-fixes-v5-5-89e60d66eb38@columbia.edu>
 <69579dae-285d-472c-ba69-4279e5170502@linux.dev>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <69579dae-285d-472c-ba69-4279e5170502@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfX9hL8uG/O3vo+
 PTwM4BZpzTTp23dqteJGFuI1myLPhalE+ujc/8yVPvCGDmDERe/AR1XE/3Qpp33zIcuBQ1KeC1H
 iNrr44+YeXCxDa9HhI4waJ+ybA0N4hUZqEW+pKb1wFVE42oNpqK5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDAzMyBTYWx0ZWRfXxe57d5lIlmsn
 +yBdrtUsVTgfUd0PW7rlGoNqfTPqe2aA2RNOBJAnNHUiUZ8oCiuhd8FC04RhOOYgY4+s1P6bYSN
 ex6M+9D8OMURU9QY5k3T3AeLzPDEptgiZ4U/bcTgN8O/G/c/t3mjzFkJfEF+xLVLXJKiU0WXQXB
 fk2gQDeudko19fitW1FJz+L8fuTgwuXzzGoh6DL1TByolzxBz3v8JaGGhqbLG/gF56zsO+QGHqr
 IAyujPdtds62ltcETV5fpwBEzNHzCozxesvCXXdvobsbXaHm/EpC+T9zSuc2RAqUT5lXrKXJmW2
 kK8CsnAp8tZbyAoYGmfapr55Olv7hY7eI43TtN6QgH+l/i8p/Sr0zR60+sBPet2ZsTtCmQxeeMu
 zteCqpIaRW6tIFIFd0z3jO3roSGbbs7UqVRh4mxVkELLY/WcYwhr8TgbR1itAsAYn6RXV1q2hme
 5FbFXMEkFFX9v1t4gTQ==
X-Authority-Analysis: v=2.4 cv=G/GJgNk5 c=1 sm=1 tr=0 ts=6abb7b31 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xSnE1pX28jTrkUJPvDlzhA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=SsB-OO3BMngHh3ZO9fOt:22
 a=5vhaLU_8k3ht0VnDKtMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: LU3eZuPrRY6QUgSLjUs-LzKkleDDEkSj
X-Proofpoint-ORIG-GUID: LU3eZuPrRY6QUgSLjUs-LzKkleDDEkSj
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11919
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=10 impostorscore=10 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=10 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290033

On 9/25/26 9:37 AM, John Garry wrote:
> On 9/24/26 00:56, Tal Zussman wrote:
>> On a partial page pin, __blkdev_direct_IO_simple() and
>> __blkdev_direct_IO_async() submit what was pinned with REQ_ATOMIC set
>> and leave the rest to the buffered fallback, tearing an IOCB_ATOMIC
>> write.
>> 
>> This can be triggered deterministically. A 16K pwritev2(RWF_ATOMIC)
>> whose last page is PROT_NONE, on a scsi_debug device with atomic_wr=1,
>> completes short with only three of the four pages written, violating
>> RWF_ATOMIC semantics.
> 
> I don't mean to load more work, but a blktests case for this would be
> great. I am consider doing it if you are too busy.
> 
> Thanks!
> 

No problem, I already have a reproducer so it's easy enough. I'll send
it in the next couple of days.

