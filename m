Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF993BFE4A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538938; cv=none; b=sDBbKaIU/MaCMUMImMwqbrTbJZ9pvR8udG/gdDo0qDohzrLKpZKuB5hlAajwiKuUWg/EVw3Y1eIslxvdAulj3SabeIe1hJmv0/Y5UXeUi8IgFuO07VhC6dQrKFUPIjwJ8DiJvbQFnWcZbllrAL4aRKKns2evsho/fPk9RXg+GTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538938; c=relaxed/simple;
	bh=5lo/HS3IacYKNgvWsTfqyEJUxioyzHwZN+YWFUDujdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L1lsPIk08H2uY0LHOVr3LI530hmsMjBAV8i6SztaGjmjWCfX/8/hJln6PI0OeMpKZLMIYGlXbpTOSrekHduF3nffFT+k7DG88+e5o8zauXip6MNP6qggeRXasTE5SPQegxyWShNDJFKCWEbRWtsau0jRtFPNQwy+zyjVKxMMufo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=B6TEOJfh; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=a46MI/7N; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="B6TEOJfh";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="a46MI/7N"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684GA5FF2215075
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 12:22:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=/hUM
	T2eb6rgGkooNP01TzV3yzxEXfMXCcoh1N+XrBE0=; b=B6TEOJfh3hcEIJGu4YGr
	grTZ2PvSm80poZtWLmKl3xMIsOrPOkUxXKvqJKoVQylq0sDvT5kGfFs+6A156n1q
	1ZF5gq1AewdPPKoY4YxNqwikNWuMNtffsQYAbIJDKqFOsiwnBwydHZhnbSzfFWo3
	EG9XwLpEgiebky2NGPl8INKv+aXctSqK8bOFt6AeL4fo9tqRErlZWMMwZcl7ekMj
	GH15XFdvcQSy+5Hy6PyE+UWbBu1TWkTuK/ubfaa/1mYNu6PB5NJRagYe1XHdTBMM
	gDgj2IachFf7NjCItRw/3mISNCh3JgTnyKMznG2OixMueW4tNNx4RjbdgCB00M77
	Cg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gfyvks0ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 12:22:16 -0400 (EDT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-939694871aaso197297685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788538935; x=1789143735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/hUMT2eb6rgGkooNP01TzV3yzxEXfMXCcoh1N+XrBE0=;
        b=a46MI/7NnRMAcsexQENNBzkQV7qBjnQqX2ZLUZfnYSB/Hw2P6zGpei+evanrshzkX9
         /VPUUzy7+UvohcHqsQpudP/Z0i7IV8ppLzNzWlSlHDM9m1Cp1xsvFsb6DiDUuQQ0E/ME
         D3GfJg2Hy1ZHbGgpE7V/Tcl8VY6s+REEbJADmqsOT91JpoPndSVYfsGDEUKG+EVCJqOe
         Lz8WFdPBP8yFu0TlQmzt9Q0t9EdzuVcj98S73OzdrVR/Zjcqn5dvXSVDmqLv+F2eMS8R
         FvdPGaH6N4AMPbvs5N1Syfd+WHvuZTqoQOoZJkxsvtjUCTR1fUEwnsdf+xq0OlK6YqNT
         yEzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788538935; x=1789143735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/hUMT2eb6rgGkooNP01TzV3yzxEXfMXCcoh1N+XrBE0=;
        b=nb5wjvw7M2tGa06A5haRIZ35zJkoh8WgpDyXsbJyGklKC4xLLn6VF7JRwXPaTCRuu3
         1RJPsbP0xn7H25o4pEK33u3H3mCduGBW4cK8N3yXmMiX0DafBCJVBT+xq4MMZ78JGQLT
         JQeLDr+/X0Vu/gtcW4WnmDSnMgbhludCxi5kyZN4pfoD4T6v1tgu3piNIZanS9QC3DC6
         c2bGAIl5jSgaStcGPg2+GTzKP5vzAfg8eJkPtqFh+73eYxPW/Bghs4WhQS+qWZ2vS5e4
         6VzCDK9jWoBCV8jhInS4W9cIwnnwRQbVRrAXGqtoFtIKFT6cwknek8Li93PdcmIbsWpS
         sO3g==
X-Forwarded-Encrypted: i=1; AKwUvBw986ckP7fRHA+uNyUHxPqYiLQ4ASa3miarr1ryVB7v7lEcrG+zQ1aZJ+PsnTlsFDjJXEH570y3cQ98hl8=@vger.kernel.org
X-Gm-Message-State: AFuF++kKPL/Xh8xMRhwlgC0lTeCbYgXA0k7xiU31UCy3I4NA9i/iylXU
	rlNr51P5cjD7lNtEtliJkEKosM1bwQoRw26BBuCG8d0mokAfrVi22321C6kEvPDgTBHuAru4ry2
	jAt27krTILXnQQzy1pkVq9IWmjwHQsLhYtE3PXxiIHhdW/VE1jOkv7QBl4GaF4A==
X-Gm-Gg: AYBFou1o+PWh/QAqhjY88f5YwypVNIj+1be9cSgRoT0H+TJeYH8yuSf9N1+csO4Vxug
	21SHOGXK0aBpbM6Uv+xWuvami+VJ8LWApBZ2UGQE1sHlyH+HscOF6vPzILpA4XU7/dREpsc567F
	Xtbcse5x/HamVmCRt+mHzDFQUAQWrJyq/XFQS6WnCGypZukwWfsmrWnd6R8KrTBvYXv1YjP2xz3
	Y3DKqDLlZgohP+CuZR7vZa64uct/YdTmZlUULqh71ZGa+g641aiMir8ZJlLLy02xkoN8UehX2as
	fTz1HBnJcc85oApEwhSp+MwF6XgQp/OpecE2DmOrvQKZQ1DZrIjirEo1cO/4hygCPiWyzZ0a99r
	z/DIYHhHVC6utzNODwTLwkAvaUV7ujHAc/0yYNSHw9DHUTq+K0iAk
X-Received: by 2002:a05:620a:484c:b0:939:df7:6ce3 with SMTP id af79cd13be357-93980407102mr549718085a.26.1788538935068;
        Fri, 04 Sep 2026 09:22:15 -0700 (PDT)
X-Received: by 2002:a05:620a:484c:b0:939:df7:6ce3 with SMTP id af79cd13be357-93980407102mr549713885a.26.1788538934415;
        Fri, 04 Sep 2026 09:22:14 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-177-158.net.columbia.edu. [128.59.177.158])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397faf927bsm244025185a.8.2026.09.04.09.22.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 09:22:13 -0700 (PDT)
Message-ID: <befe2e23-4edb-473a-8ade-bb5c485f7186@columbia.edu>
Date: Fri, 4 Sep 2026 12:22:13 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] block: take i_rwsem for the direct I/O write
 fallback
To: Hannes Reinecke <hare@suse.de>, Jens Axboe <axboe@kernel.dk>,
        Christoph Hellwig <hch@lst.de>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
 <20260828-blkdev-fixes-v2-2-32f3f40cebed@columbia.edu>
 <e2082e5a-32d9-4a96-abd3-fd6ba7aa97d2@suse.de>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <e2082e5a-32d9-4a96-abd3-fd6ba7aa97d2@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0OCBTYWx0ZWRfX2Hd7THOpInwn
 DTJrNWmNlrWZOsFB0pvdxqtn4fyNuKhqp+uvvKKJCAesc0vyWgXb7TrpM+Jf1eKh7ckYk+vOfJQ
 2SbpuCrnKVmaqg0+wPi3SJNcos0Vs6S5RJ3c6Ln4i8HK//be51HBP+zKfkeoULKrHgA2mvLBeEz
 uQRBKL6fJL6TOe48n2YSOWL6dO4lnSl6AoLzLYnZuW2WM777Tt/IDPznkbUGX440E0zyBTozL3x
 HLOQJyQEpXDs8Atdp8zKGkuZnXbFJ4k3nuvzHisQgzBVCwLlLk1YW7i5juVx0/G4PNsyWII9Vma
 7lqXTkwvw8guNQFy+acjD6Z6XrIEgtsxH2tevtAMI+zrQBH8VoCkD5sTnEC2h0XoLUYxYyHh4Gm
 DpOw/vmgBzNjtikVVfKUmFH6z99AgmYzzlnwbGW80/ge2s3EXBAEF+44CMMUVwEQ7iX8jypkwac
 tE04fDVvjPg+nIDA3rg==
X-Proofpoint-GUID: __1AJdIqqUetjA_XItGjsgtYMQNWOZwb
X-Authority-Analysis: v=2.4 cv=T868ifKQ c=1 sm=1 tr=0 ts=6a9af038 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=tLges04aSNaZGVAfhBIy2A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=VwQbUJbxAAAA:8 a=TpyNOygFdVc2XgeM1c4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0OCBTYWx0ZWRfX6z7aFL76rIAi
 fFjl5LlndMshvI+ngv98f7wSJ3EcaQasStVvAVqNiXEODA/YBLQ8tcYERJEnUY+8IlKy8Py5k6T
 ie0tsGuTInSvct+WvCHGCYYnDFgdR6dAcMLyf7FMe8f6JKKbch42
X-Proofpoint-ORIG-GUID: __1AJdIqqUetjA_XItGjsgtYMQNWOZwb
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11895
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=10 adultscore=0 lowpriorityscore=10 suspectscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=10 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040148

On 9/2/26 3:47 PM, Hannes Reinecke wrote:
> You gotta love LLMs; no-one would have written up a testcase with
> four different threads...

It definitely wrote it much faster than I would have... :)

> Anyway. There is a reproducer, so we should be fixing it.
> 
> Reviewed-by: Hannes Reinecke <hare@kernel.org>
> 

Thanks for the reviews!

> Cheers,
> 
> Hannes
> -- 
> Dr. Hannes Reinecke                  Kernel Storage Architect
> hare@suse.de                                +49 911 74053 688
> SUSE Software Solutions GmbH, Frankenstr. 146, 90461 Nürnberg
> HRB 36809 (AG Nürnberg), GF: I. Totev, A. McDonald, W. Knoblich
> 

