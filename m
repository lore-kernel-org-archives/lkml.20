Received: from mx0b-00364e01.pphosted.com (mx0b-00364e01.pphosted.com [148.163.139.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AC10F2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 00:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.139.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788826188; cv=none; b=dXobKrIxRI/+E9FxdQxKg8ruGjMvu1+f27fjG++3tADTIhQOOPlQllfWmuYp7UnADys3H6FbqCPsAm2ebahFTtXFY2ZjyarbcdRaKcmOP9hfVrM5XY0XmiBYmwLOyOZJl/xK7YpnzEgpjGLsNybS5qUHQjvh/Cg9GgUpeMjGSYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788826188; c=relaxed/simple;
	bh=ktaRgO8n331ZGXDo1yfMqYUgvwCnFoQw1Q263EpUcjs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Lk9cJvxuxWD0eEnpchtzTDuXfdNik4GL74eDaTdldeTRNB9yWXNXrwKMLH2Cy6O//Poee9y+WvAXYHnWmSFpTqA0VIxHnx+KWBxkv2coCJbKgDn7pX/1UendPHDYU1f7bGDN1hWyOuSiEAcm1lv7NUVX3G1Z97zlVbd7BFM50V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=JMOxRXjM; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=NZclfHQJ; arc=none smtp.client-ip=148.163.139.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="JMOxRXjM";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="NZclfHQJ"
Received: from pps.filterd (m0499198.ppops.net [127.0.0.1])
	by mx0b-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687MXkKp4003354
	for <linux-kernel@vger.kernel.org>; Mon, 7 Sep 2026 20:09:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=NApM
	Mm5PQUWhUVgHzcWxZ/ang/AkF4VwG4La+zibEII=; b=JMOxRXjMS9mRfWfHZ9W+
	FqajNcj7FSX0ZswFOjzNf7ASdl8Y2hznx2a1cVEAmqvIv91W8NUQR0hNc+Scj3UM
	aGK0/LJ6gbQX7/0WRJ1G8uLJyNLtSvNwwcDFJyUpnTZVLRxWtcATD1KR5NGEeJWK
	ee1hjIMutZYqBlV4ZUlTf5cfdFuTbbxvjMZZrIDJgNksFutUQtO2LHiGyp5aFbFY
	hY2+uhje9RKKWBVbU7lwFMDka6j8PD5a4PdtrCOP5vWavD78avm8eDWzm5kKBFen
	hrmbMqwXV82IESRftCoX6vYjKzZM2iqFRDVQ0F70OclK7GB2XBKn7Wv8x/FKuXpR
	7Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0b-00364e01.pphosted.com (PPS) with ESMTPS id 4ghxx22x56-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 20:09:39 -0400 (EDT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53062ec5b9bso52700061cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 17:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1788826179; x=1789430979; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NApMMm5PQUWhUVgHzcWxZ/ang/AkF4VwG4La+zibEII=;
        b=NZclfHQJs/Xtmd7B3THUtRtA3dM79tLHiuG5d4FDb2RKanehxcGR6zpk12z53rhX+s
         C7QWJyIEaEyNNDmLxNFvu3gh5IPdaYGlQpCZHxiKQBY1w79jjI9sFKHgrVoJQFfo4DE5
         v4kT0PrtD9R3vmrEHJItntuTv1565giw55Z/wPxQxofRwfpoayrWscWRKf/C5Igeqij6
         /C0Okd39oAN2JYWdPgz/HGEfYj3cBI+eelaNdca8Ov/JqsdY1AFvCToEPgjdfy1nj5pn
         T415REZuYtQksDMa1hoSbg1xUFeCcdmwlVZhqWvPpg4Bz8iMRe2iVIi2b76yXeprr+gL
         GAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788826179; x=1789430979;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NApMMm5PQUWhUVgHzcWxZ/ang/AkF4VwG4La+zibEII=;
        b=jrGLFNxWUAzgR2JCpIsX0xZtxhnfqSoWiUysMH3Mo5B6qiAZE9Zxoc4q6lKtOVqbRi
         9jrepR85fn0/pfGAIudkNhU6IAykxcCZYRFxBFVJPIEb9g5ID94KqNHCZXHp3Xo3pSMQ
         5iPXB+wm6O9Rv2PgYYBtf3AaRyBFDfYw6Z4/imtS0lC9BUirM4yzGiQibY32EoA90EG2
         q2/Di63jFG/tfvki7B0eepy4PO1OZyiwjLgXiaby1/bE+aE+wHcllSAyd85sKZQN5gKC
         PBp0My7qk8ZKH7+HWdmpP4tl2/S1HETK0xCq5WwSYVasB2tn+e6ggSdsKP3IlenIw57u
         2x2Q==
X-Forwarded-Encrypted: i=1; AKwUvBws/PrevJ/J2JVHtAKO8mwq1UPvZ1nTOOgmQc0793+8d0nHWaflfF+nwPGpmK2Qt4vy72mdzlZAOeJPu7U=@vger.kernel.org
X-Gm-Message-State: AFuF++ly6fci+uH3/HMbEjq9m1NVJxcYlboVVKVcwtKmczRTrjvOw/wJ
	U4UY8em8IfM2s3l9/qb/xR2CQoJhe4XTNFeEjcQgPkhu1XPcBXUTaW6aGCYi7R0BrWiee/SD58n
	1MAagZH2MDFng0Az/+ilW9xRXqgZQMRkj37e8bzuWBGyWi3EjeC6aTu8G0rKf4g==
X-Gm-Gg: AYBFou3hAAF2QJ6OXclWh8BXCMXwluETxtL2GMk+q+hXiAbKsM8QRQWDndg95+JeLpD
	U3UFyUPYNtJeC4vZmUc+AQIpJTBmUqiEDmXbSmjvCCwZ+5vYS5Cmff9ET4AjGl6cdiDLo/dIbD0
	mN/kkoHiXbM4wHm0hQOUmw/BXTbVWDDKPFQaB7uIa6V3LdZYkDtIGrJ9kyMM2W+u403p7WVf4wW
	VKak+daWZtaZJ4OqXeqrIt/+cMTvfQK6UWUAdt9KZpDcO3pF0ZkmqltvpBkMQI5oxXKUNUz8uFz
	M4rwT3OSC0SPN85Jjg6sy+MPXR/iDneigazkQZQdv0LK0d48IVs5ASoPzSe9jw6kB/+qBkfGYol
	yq8LJRgdMulYgwsrhAqUCioAonBb9CcJWbqvKR2WXSUYzfLE=
X-Received: by 2002:a05:622a:130c:b0:52f:e60e:70c3 with SMTP id d75a77b69052e-53054961fddmr291664491cf.24.1788826178694;
        Mon, 07 Sep 2026 17:09:38 -0700 (PDT)
X-Received: by 2002:a05:622a:130c:b0:52f:e60e:70c3 with SMTP id d75a77b69052e-53054961fddmr291662811cf.24.1788826176813;
        Mon, 07 Sep 2026 17:09:36 -0700 (PDT)
Received: from [10.207.49.22] (nat-128-59-176-3.net.columbia.edu. [128.59.176.3])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305418950fsm98215411cf.20.2026.09.07.17.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 17:09:36 -0700 (PDT)
Message-ID: <c0165cc5-1763-42dc-95a2-516b47c53035@columbia.edu>
Date: Mon, 7 Sep 2026 20:09:35 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/7] block: honor IOCB_NOWAIT in the block device
 buffered read path
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>, Hannes Reinecke <hare@suse.de>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260828-blkdev-fixes-v2-0-32f3f40cebed@columbia.edu>
 <20260828-blkdev-fixes-v2-4-32f3f40cebed@columbia.edu>
 <20260907071120.GC934@lst.de>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260907071120.GC934@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YcyNIQRf c=1 sm=1 tr=0 ts=6a9f5243 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=92j1mJcILCjWExuphHMrQw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=BpGzv1V74M3SfeTrGa8v:22
 a=Ip84Y9BoNSkx-ca77UQA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: bgMv_3TSenUGNHIjb6FfOAJVjxPS_4Ii
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDI2NiBTYWx0ZWRfX22kSNGSxf4L3
 uhmuNcD37r1kh89/1Gmf2sQ89wQwtuzFkwmpmKGiGOz2J8qlNRKKb8Y+tVBGwwJ7D8n/fZd00B4
 EN+HrBA2+o4k6eS4tmJbn3rSTeX7Gr3uG1o9kWQkAMSHqH+OSdvr
X-Proofpoint-GUID: bgMv_3TSenUGNHIjb6FfOAJVjxPS_4Ii
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDI2NiBTYWx0ZWRfX/Da3QXK7zj7b
 TtkgS+/TpiBPAClxfFK/rmOF2r5twzJXphGIPBJlqP/6zPZm5blzj5xebQOF2qVxyvl9iJvM/sw
 OOrRkzVVRGDKye5RaTBW0u3bUCypUOAGaT054dp84rUSGxUCSLhij4TmbkrKRzBPwk/MpcdLjbz
 CZWVdt9G5BY/9jslAoko+Ntxc3sNlApULSue/vt92quASqIBQr3belPjrHXkoDrt+YasWNbJ9M/
 4VJclMhzA7Ne/pp+iyDPynyAmuaADeRKcr5Y6u/eh6AVtrO36EyaFbdZTnSau0bqd11cxVJhxkE
 QBKmYDfYOk3Hg2v6qat37DgdGiUai2qKiQw1+Eoif0S2fZgxWdQ6utmJoNg47HPzcg2iaGpVlDG
 poZYu3A/K7Gx+52sKWF970HP05cd2p9TgjHNADh9wNnzDt4fSfSOnqZqMila/KiD7mRZ1kNDv0j
 VC44f9kpm8QWUd9hEuQ==
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11899
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=10 bulkscore=10
 malwarescore=0 impostorscore=10 suspectscore=0 spamscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070266

On 9/7/26 10:11 AM, Christoph Hellwig wrote:
>> +	if (iocb->ki_flags & IOCB_NOWAIT) {
>> +		if (!inode_trylock_shared(bd_inode)) {
>> +			if (!ret)
>> +				ret = -EAGAIN;
>> +			goto reexpand;
>> +		}
>> +	} else {
>> +		inode_lock_shared(bd_inode);
>> +	}
> 
> Looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 
> Do we want something like kiocb_inode_lock/kiocb_inode_lock_shared helper
> to better encapsulate this pattern?
> 

Seems like it's fairly common (~16 instances). I can do that eventually as
a follow-up.

Thanks,
Tal
