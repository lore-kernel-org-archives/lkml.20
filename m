Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD121AA797
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789794838; cv=none; b=HFd6aecLdluGl2v5z/6yN2zlz/YVpZNUzn3tbwie9bItcWBbgV5AxQl5+STvfqMlmQxXOgACQCEy/NME9xj1nSr1gX7LDA0fFz8UtNRCbfQeDr3Yx/KdBjkkDX7rMLAAIYdo4s8q6mU3XynkudmdZdHCSOLK9KUICW9fLDSwpIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789794838; c=relaxed/simple;
	bh=lHMtQlPa3byL8jNAGsmF9r4ihqPLoroI7pVk3f2IUP8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QP0u7LOIPn0zZV9OEfINzeCjGPTIpMdHoK9rLmO6wwWFxNDiVN3p7z+oGulrSfDjP9zDQUt2rWNAkeh0B5OwxFLtQZJzIO+u5Zqa4OhNf8BVLoHu87j/HbtzcKm94c1zj5ifmy0AN1u519O/6aGuvGgjX+ZfuQntdntyMM0duIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=irCZIzt7; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=QQOq7q2f; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="irCZIzt7";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="QQOq7q2f"
Received: from pps.filterd (m0167068.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68J4rodw997125
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Z4Q4
	0DsBVvRwmAo7kP6nqyDzh2DHzkNABJPrQkBYyR0=; b=irCZIzt7QN2OGKSHeBqJ
	IBAc5wsheklaKYWUf9ZRRqSrMikIoqLwyqRpFdvRt6zDh7Glmk6sUygNHOisQDqu
	MEPlyKrEiWzDUv+ZeBQrWfP/oGA/6dWpboLDEuuPvMoZ+B7jiRFhimRCrKrWosv0
	kD3L7j47n5sX8JoaOvmOfSH6iZO8hD202h9vGmX1NDH6UKc0L2pqI9puGLNJqkg9
	IwB7/F/YWmDTZmLRyuKo/Lz6EwRzMOKGw2otj18J7N9Nn/CA5F4DyWCYqqHrpxnQ
	YP0LUM4MnU6pJfOmgUQks8nKgYcJuVfsfuhX+aTGNcOtdriuBOuGWzKI9o8X+8D1
	rw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4gsbyha64w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 01:13:49 -0400 (EDT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90e8472ee1eso29686706d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1789794829; x=1790399629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z4Q40DsBVvRwmAo7kP6nqyDzh2DHzkNABJPrQkBYyR0=;
        b=QQOq7q2flh6g7HYf1GbjYxpu7SHJqFCZj25RyEGd45yRpLwylD0WORT/jsPqLm8a3m
         7v7dQ+EyY2pOgQQDa4M/BgNyYjavp4BevTiKyIE4X/kFXpD+iUDdOjmpHxW1Zw8PidnI
         jFYdqoAsjDoK3pB6nl3Cm5cXhrthpyNPZliGJQSlS8JusMV0TZBbl3tzIMytLzY496LG
         VXjZ4bLztXD0ZfpvGPdH9JRfz99dQpr1OFWdu3dH5ChDsdz718Oxyrhkb4QU+yALR5bj
         OW6snlKGesXDcEta0/vOrfeaV6oFngqiLTBFvFgyA/jGk4/7MzIJmbtkbOlsROIKvgpY
         JosA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789794829; x=1790399629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z4Q40DsBVvRwmAo7kP6nqyDzh2DHzkNABJPrQkBYyR0=;
        b=azOoCgIH17oVtbh5WVdiFaFp3mu36QUC4TXXz9G+mprrMjcEctEMMo1PP+AZiJ6f7b
         MG25luYywr8VOewdi12oyB/E+93ZWQUElwecJcfe9hYUy7PxKkdQbwPQr6vHGV3obuHA
         l3CDPiF1kAMYWSZefSNyQJrUmsy3dl5D93mJBIUE4WLTvahxkDwsRp6umT0iWE4Ng2nJ
         Qn+Ak5S7X+eJ1Hl/dHU2xUxv2WEi7ZPfYBN8gDYaY9Gl/LKvLBTxYAQ8HkwMLZ0DNRXP
         JDdc7Y9b2kQSPVdiwaIc5y7+KeUMI+RfAytpoBpdxy+c6ErY16Q23MzLg9rsQWQvvH7f
         PEkQ==
X-Forwarded-Encrypted: i=1; AKwUvBwGrPMSoINus+nPKzSnzmkwkG/wdZkN4IlueHeNEV6AzSW+C3EPYU1T+fzkgNNRWQDisTLFsaxvssj4zaI=@vger.kernel.org
X-Gm-Message-State: AFuF++npC0YEsHWYX7VOoyKPMgBRKqnHgnMvzw5DIpJRLsCmj2A4S8Z+
	Zt4Ao/6l7pxF635OlXI8YPybuRBNvbspYsswTCEzX9RDYP37h9pfxxkw5SwDnLYWT3FNFof565o
	j5IFsc9j4IikYHL5hZ26HohUCPvam/tgGPChZIZC9dwYIipCWB2JGB+/IGCGBTQ==
X-Gm-Gg: AYBFou1IsTmpCvD5ODFnb/VIU1Hh6nkLVMbjHdLA/heOf9ik8ox54eSR/g6Cn8Jb+g9
	PqaLv4tlo192757nv332NMih11xKa68U/eNvtR8OF91A/gWMqPk2OrBC09PSFplfDw2rr6FFxRh
	lIDlOVMtNAj+LA8oQQ0DWk6ALktq6AB/x6nFne2qk6zl5xsg44axSuYM5GOlxm+MZ8ssZoh7QWF
	jwTqQeHDeGo2pnintzaAAY7srmOZz0a2PX3E8v69Y3f63boDAvbV4FNcXCUbfj6e4UUwo+q6sec
	aAWAJPjuWK0cqLv3AxsPjY5FTF0Ow5h7W24rW0W706LgIeVT+dtJB3fzqqhRyOwsQohXssZbKT1
	7lG9nYl5yZpIDToqoPSvJF4Yts2qLCrgxCfcQOPxVT98UTnQT
X-Received: by 2002:ad4:5762:0:b0:912:3dbe:9ca9 with SMTP id 6a1803df08f44-912a8065566mr1513756d6.26.1789794828574;
        Fri, 18 Sep 2026 22:13:48 -0700 (PDT)
X-Received: by 2002:ad4:5762:0:b0:912:3dbe:9ca9 with SMTP id 6a1803df08f44-912a8065566mr1513456d6.26.1789794828108;
        Fri, 18 Sep 2026 22:13:48 -0700 (PDT)
Received: from [192.168.1.62] (dyn-160-39-33-242.dyn.columbia.edu. [160.39.33.242])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91260a309bdsm13061686d6.12.2026.09.18.22.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 22:13:47 -0700 (PDT)
Message-ID: <30714db4-6c6a-4189-8872-e7866ad53de4@columbia.edu>
Date: Sat, 19 Sep 2026 01:13:46 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/7] block: unpin all pages of a bvec in
 bio_iov_iter_align_down()
To: Christoph Hellwig <hch@lst.de>
Cc: Jens Axboe <axboe@kernel.dk>,
        Johannes Thumshirn <johannes.thumshirn@wdc.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Hannes Reinecke <hare@kernel.org>,
        "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        John Garry <john.g.garry@oracle.com>,
        Christian Brauner
 <brauner@kernel.org>,
        "Darrick J. Wong" <djwong@kernel.org>, Keith Busch <kbusch@kernel.org>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
References: <20260909-blkdev-fixes-v3-0-1a5222c6e8ad@columbia.edu>
 <20260909-blkdev-fixes-v3-6-1a5222c6e8ad@columbia.edu>
 <20260918084315.GA12283@lst.de>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <20260918084315.GA12283@lst.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DMrNMd2tZWZgj7lGynIvNRySaYKi-0Y4
X-Authority-Analysis: v=2.4 cv=WJPqzXsR c=1 sm=1 tr=0 ts=6aae1a0d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=GaPK54s0Se3oFqK5NkZy0g==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=usPcmh10W0ubT8QP8_c3:22
 a=QINKK4dj0_nbEauUZSwA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE5MDA3MSBTYWx0ZWRfX8MeBpEqsZzXW
 EZHK0wOya6+oACtNp54IV5P7ayigeAWNae7RjTLXZge8nHZaI8UlE5ViJwBOLcaQje7eXGNjc7+
 /2IPFf5iAGaD5zWJ4LcwO5t/EXymCIg/UMsrXMSQQcx+rmTo0KoK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE5MDA3MSBTYWx0ZWRfXyx/ijNbTsuPS
 70aCSpodqR9CfrNUxoWDbRWhc6ElLcWMKTLx05DoeEZZj3moLnVHRAsep5uJXDKy2MLl32CjvUg
 27J6SuVG1wD3c/XyuLo0HmhlxwC7DZDBRvCxaPlgkJq4GoLC9I1t/Dmhr5OnQgeEIxmJw9No20b
 1xOxX2eI2IZYScyLFxcRQgZYczmEd3zT9ZocDCVis/V5XT3zCivERfJDnj9Momis9EtOmbbYpBb
 T6gAakYuycKGJ1MJs3fi7wYEU6RpjKz0Elnr27RK0N8WPtJCdqY+D3q0LAJ/1LuJeC64NavXw8g
 87JCa1hxqg9Qkl8DYdUsN+QIwRLa/Cx8CswSogTAwUr1DqgytUcH2+RzPzsE6YCz1cVjnqH3DSS
 VAFxAL5REW+zKAPL/djFYQCUH5zt8vhhh6707YAYcfMj3OmLeka+EXgiN7wZeDcBcxqxtAkNGDW
 gsE+EilQ4Ve8FyYkSQA==
X-Proofpoint-GUID: DMrNMd2tZWZgj7lGynIvNRySaYKi-0Y4
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11909
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=10 adultscore=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=10 lowpriorityscore=10 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609190071

On 9/18/26 4:43 AM, Christoph Hellwig wrote:
>> +
>> +	/*
>> +	 * __bio_release_pages() only unpins the pages still covered by
>> +	 * bv_len, so drop the pins for the pages trimmed off here.
>> +	 */
>> +	npages = bvec_nr_pages(bv);
>>  	bv->bv_len -= nbytes;
>> +	npages -= bvec_nr_pages(bv);
> 
> Wouldn't it make more sense to calculate npages once after the
> decrement here, or am I missing something?
> 

The first bvec_nr_pages() computes the number of pages originally in the
bvec. Then we subtract the number of bytes trimmed off, and subtract
the number of pages still left in the bvec from the original page count,
giving us the number of pages trimmed off, which is then how many pins
we need to drop.

If we just calculate after the decrement we would only know how many pages
are currently in the bvec, and wouldn't know how many were dropped.
We could open-code this calculation as:

	size_t old_end = bv->bv_offset + bv->bv_len;

	bv->bv_len -= nbytes;
	npages = (old_end - 1) / PAGE_SIZE -
		(bv->bv_offset + bv->bv_len - 1) / PAGE_SIZE;

but both expressions end up compiling to the same thing in my testing.

But maybe I'm missing something... Perhaps this needs a bit of a
longer comment?
