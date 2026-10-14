Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9831B5625FA
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 19:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792004411; cv=none; b=qfXL+dfAAzMsW+YEkT5pzvO8aOJe8i8fb/yD0wX5MdvLLt2DFcy04zBIo2IuqVhLEjGrLcpDx52w2EaPsPIUvHiM/FN13y4QIitGEt59iMznbasfS0gddhG+AWlAWZwzmXtiTVEr4JmOZ05atDHzs/DZ8mYcBOeIpqnw0enHDiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792004411; c=relaxed/simple;
	bh=Rb8XZmmvT8cxn74MXNUCeOuPGauZxlvtGCiTJh0eb40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E260am8G87EldETTvynH4vE40/Sp9/W3D9znFtIiIpyBMzws6jTRdQ8WryexClpmMxguu+HZSSoYXpO5ggU19m9mZ+zE6b+5C6wNVsPsuUHgeWI9/PMVnbPB2WMM0YXTlt/4Q6vT++3AThACCfkiT3v6zHHBblCUzaHYG/9K5KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=mWWj+UUG; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JQWqRxw9; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="mWWj+UUG";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JQWqRxw9"
Received: from pps.filterd (m0167077.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EIns1o3118811
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=SHv5
	vB/tk7sll8Kkk+NHhBijfzgb1pYQHOyGwy6N4aU=; b=mWWj+UUGvdXSLYjqGKBk
	qRjyZAFUBqKDFrBsJRjkInUs3ju9ynsaD1j6tJXOE3D0QkYUleR2qkiM6AT/S4pI
	vyObvXKzpUi43jFMC6RmvfwI/sftJiI+Hw4rC/jRdrGpIQEIu2NtmXyndK6GA255
	bd1juLQfEt+qjg448awRfj7cNjD53xF9l7L663bj54t/tGEbjs/hllrUIfkkgnbe
	BIUvzpNKtqm8z3t+iPKuTj9dC/dPMoTDtxhMJvHK7TRZqVaOLjqkSpyqJWILv2w8
	1B2EwMv2fuKSjN86b6U1uEvcoH3PsxtASiWjbYjlsZ+dOFtthToPQ0JdCQVlHupv
	rQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ha6c7cnjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:00:09 -0400 (EDT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9195c59ac8cso139960776d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 12:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1792004408; x=1792609208; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SHv5vB/tk7sll8Kkk+NHhBijfzgb1pYQHOyGwy6N4aU=;
        b=JQWqRxw9OpeyVWYn9DS++SyiroVHxbmJKiIVYGbM49TGXYDJFe0yymv+fKrK1thluN
         idRiJiunMjdPKFBxtIVPYxwrJTKRrJIGO1/8dnpNRWYowcLYsnML8+ObVskilgJZL7Es
         AYgTCNgyzcGbODg0j3h5zJlCuptaWR6Lg87rFmhFJNazvlPW7GDS4CINzuqco9IEV4aa
         1gRi/U0G2RKsfnKKbo8Bx7B8ROgbO69XAfklNk0+xBQt9RSP3XhmUig1Am52wG6hvpC9
         3QZHfre9XmFpXTo9LSOJxngGX2/2IWShuE9XobCeobQRpAW4rzlSRXGspzARHOQ391gM
         GMFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792004408; x=1792609208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SHv5vB/tk7sll8Kkk+NHhBijfzgb1pYQHOyGwy6N4aU=;
        b=j5uEllsF0GnqGFJlZZIv6vqf0svojH3mzoWaXrcEFLJ7XEKUrp7+0s8Qxac9wqv+m0
         mjBJhj+tAFkqOCE/vGZL8ymfgfPmAz1mA1W/4nLfxoh5OUpqAuZ75vqzBbOYqaieT5HI
         YAE1KCqyiy4K6G6Zq2rR0xshG6ccaOT4QT4sZTWfIHGGMVdRKkh4uO1NR/lXE9/a1NcY
         MyTLDA/ggxfzwbYSI2/Y4+oKRhIW6yb+jybqgji/ceC7A/hREQVBcPKQHbh83Ia/gVLz
         CSows5irNEBo7NCT/oEFA3YWBVo/ILn5orr5fuS2mfQ+9do4dA5tPR3sOsypXaaRvu94
         rbYQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1y1v792+X6Ce9P1NVqTLRmhCEKfzIf7LhVu89PY91/KIMtTqQ8qwWEUSc27I/EAu0jsZJUUZES0o5Qdg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJANCoJkj41RTjs1AbmTwuj+XwCnhRRiMaN9EVl+Ck9dFPnRrZL
	/9tfQBoRltU0Rv1+u4UrG3Ymb65xfA23biv7AAOKKfhC2smHFF0R/KzkvNSlDB9h5t417/hEWz1
	EZaRVRmMXd2FSvg0ks/QYB+zX35O51ge/rjAiKGmi2ZPJxkqHW7cUj4lX0CzsYw==
X-Gm-Gg: AYBFou1i7pFVr0OUyBSlkwEnnegGw4SUsEo2nTEdnyjeeW35JPL7Cc4Thy9HzQSRq0Y
	Sj8RHRA/J8L4S2xtluRR50j/E5A4KG83AbYepXav0pA0BkfKYzPuoXiXVi16O7IKwT3tfKLCD2p
	5oz+XoT6WrkhBEzG9TgGhDXLphaz/YNRwI3DdfSGBTmzyBAF9Qs6lCncjgePd7VO9pyKhgeHcbV
	s6b/6cSKxoKVmvhSY+GQWJzDvqrsdgpnFwMQQw7DXmY41jFTmBaYpPl0Zy8dAYAG7gPHxYFmEsT
	fxep5jbNW3+lNQ05BFF/kHaPKkfjx9BxOeMSw/RhRFFr52LQi+D0mbv0PfOYSKMoWzdpFJWf2ug
	LDVaNyoJ99Ui7ywWwR1wQwTwuyOVWVIJztA==
X-Received: by 2002:ad4:5c85:0:b0:91b:5d39:e12b with SMTP id 6a1803df08f44-91b5d39e8fcmr282072386d6.52.1792004408202;
        Wed, 14 Oct 2026 12:00:08 -0700 (PDT)
X-Received: by 2002:ad4:5c85:0:b0:91b:5d39:e12b with SMTP id 6a1803df08f44-91b5d39e8fcmr282065896d6.52.1792004403051;
        Wed, 14 Oct 2026 12:00:03 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-176-148.net.columbia.edu. [128.59.176.148])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm59747086d6.14.2026.10.14.12.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 12:00:02 -0700 (PDT)
Message-ID: <54a2b38f-f863-48dc-be26-b18949be337d@columbia.edu>
Date: Wed, 14 Oct 2026 15:00:01 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] block: fail a short atomic pin in
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
References: <20261009-blkdev-fixes-v6-0-307939c387df@columbia.edu>
 <20261009-blkdev-fixes-v6-5-307939c387df@columbia.edu>
 <82978d5c-3e08-48e9-bf0a-7913e1cd0507@linux.dev>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <82978d5c-3e08-48e9-bf0a-7913e1cd0507@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Yu8Xia5WwwwxCUu8kdWcI9vD9H-QrsJ0
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6acfd139 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dxtdfZqDOO0kCslK4e47hQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=QOCMdifcju39GKoXhKua:22
 a=p2SREvNk3m13K0H494MA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfXxH8Yk3uksvO1
 PuEKsfUktzAD9tiYIUB2YgVDkH4CcbKmLPZQXwiOFyexDfSaON79fqsG/Daa+8pghrtYquiioFK
 qzIgYbDI4bh8pN8cGjCn85VzA1rc2ZloszYcUyk4d5QpTybnX9ae
X-Proofpoint-GUID: Yu8Xia5WwwwxCUu8kdWcI9vD9H-QrsJ0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA3NSBTYWx0ZWRfX4myrnaLbDKJi
 nApsqsWZ4cHuf9p+lT1/+OtXiviylQlqGLN8z7a69T+mvA5Yz31TxVIbcgpjwk1JWkoTmewdwn5
 hpJ8FTsbD2+eu4Fw9vu+bOoHaqpHePlPbTz80QfivBMfkfUxVgIOm3S6reYS41ojagLXbCJ9Lm1
 o3olFm7gOpBL4/iyJ26eGhzmzknupAaIbchdN/DGvB/g286Dtkcx4Us1wOGWhmPNNKlXeeM+BhC
 h0qMHy+BYym04n3utxgRqIXTrnobMTSR3H6uWOtRIMSm+jM9bseRl0PWq96q4eZVosEeLnEW2Vj
 rGNYoQujX6J+GYPU977WoHtuNhFhSrBtPEhkZJjgudpj5OTg/7cE01mUO8/Pdy/2vNIZ55CLfsL
 7hdsd8G07POuvh0ZatxQ55Lgycib7aK1/XIFqnahaf7H2knzdKzoaecDEF95GnEPdiiQLxffimI
 ootnrD1PXpBgXfr7Z6g==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11935
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=10 adultscore=0 phishscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 bulkscore=10 lowpriorityscore=10 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140075

On 10/13/26 4:40 AM, John Garry wrote:
> I think that you can now remove the REQ_ATOMIC check after the
> iomap_dio_bio_iter_one() -> bio_iov_iter_get_pages() call also; however,
> considering the trees, it's better to wait until 7.4-rc1 is released.
> 
> Thanks,
> John
> 

Sounds good, I'll queue that up for post-merge window.

Thanks,
Tal
