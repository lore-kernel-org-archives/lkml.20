Received: from mx0a-00364e01.pphosted.com (mx0a-00364e01.pphosted.com [148.163.135.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA74253E30F
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 19:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791919229; cv=none; b=gQ5NbcvbeZmDoekEK+zEJ7dVXX7zMoeUBveedQiPkCu9Jp+SGqKxfCQ7UanyAAcwFcw5jcdAOfPHRvTNKFMMf4mZrZWegTE7YXVfe8drGtUufRxDRyamLrB+M0V6CKJJWgDOs3QENva3U8mXUtL8fLk2Mp9TsNU0GGHYggkfk8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791919229; c=relaxed/simple;
	bh=AUDK8Y3S5b9VCZ22Lr+29ZFcW7M8NjLkTLsKMDrju+k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=npQfry5DiuYCgHfS+hgEdDZywAofRpVa1qPXEBI6xQwt0SIz2V7HVoQczxQ6cNPlLb2sxEgjys6LVt2mEOctkxLo/gwtTi7GArhEZE2VSzlhs6+UoWGiuWjkzoIdZg8edlLS+lS+y+IGkuw7SYyy1B8kEzPNXI82pcZbLSy5AWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu; spf=pass smtp.mailfrom=columbia.edu; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=dapDPWWa; dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b=D6gFEngf; arc=none smtp.client-ip=148.163.135.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=columbia.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=columbia.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="dapDPWWa";
	dkim=pass (2048-bit key) header.d=columbia.edu header.i=@columbia.edu header.b="D6gFEngf"
Received: from pps.filterd (m0499199.ppops.net [127.0.0.1])
	by mx0a-00364e01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DIYlrq3776641
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=columbia.edu; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pps01; bh=Oal4
	PEpE1X4d2ote/KPkfgier4z3jZGSc5iK+zXC/VQ=; b=dapDPWWaADp4agqu9Bor
	uRVHOnSJlz9kUFbCNCjPM6ZIjGZuHtHBHcXyhxz23oNsQI5BvTrMAg46m1khIuif
	Il0a3ZgF6RkEVAbrCgztsVHK05dCkAkY/nlNqbAAHaVZQh1WW027fpGB6Dd9arOb
	AKstDJlECWJunHYi9UzgJGKn1qrEUWTsv3InKc6pvbDzB1GVVLzB04Td48jMH103
	3Hi95kz17S+zOJnjIak9cXm886tvTRko4Gk12XhcIFETAoGqErblo10dGdjOecrE
	dNX1BkGf10Eg/advHqRwZCcRhBysTgcM2l8ksb7DVa8jQhB5DRB/cnsuw4aonDv/
	zg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-00364e01.pphosted.com (PPS) with ESMTPS id 4h9pq12yfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:20:26 -0400 (EDT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5347732a495so5583321cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 12:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=columbia.edu; s=lionmail; t=1791919226; x=1792524026; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oal4PEpE1X4d2ote/KPkfgier4z3jZGSc5iK+zXC/VQ=;
        b=D6gFEngfmGhootcfuVuuU1UKmQ3EwWd8HDvI0zcpoAA+KqJcJPQ/YcpJIWyDRMfV8/
         xMKkkCJphGQ/GP1Hk2i2YsHm8TjSVR6IGMmLx2A8lprjZpLhW4WBjm0hX/FkrZvxWle7
         oIks48erSVzEtUK4zMHJhl0byfhUTVVJoIw4VdRWjhZ+fhjMeal4dZfusHAW5UVDyrej
         2fdHz6IIHh5Lwuc8Pvfwx9T/UxVtFTzYoR0m5lXqWVGM6yyFtC1+RaptTetXX2RXugde
         4ZBIvNY6tkXEOnrbHz8ra64mqf9P0P1S+oU3422L+5M+w2CBZ9IhZY2CaLi7tWnC8lLT
         BqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791919226; x=1792524026;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Oal4PEpE1X4d2ote/KPkfgier4z3jZGSc5iK+zXC/VQ=;
        b=zRdDfkSQTf+YgoU8loaRgg+yh3F6T/gTdHtp3Tn5n0buNiqM2nxfo7N2z6xfspQrRW
         1qm3JujGhbL3eA5kgcHEWSpMQoaULGwd0dGo3XzMT1aUVFd1/sMDhPPQNWE7yfTF2Nqu
         mSW1VIBk80a6mqrQoYQAJdKS5eqvBNSqO44afa+sKKK7Ez4GEFmBhnas9UDPiN7TgQxp
         7dIRb9E7mO3pDLpGcxigFCYGjwFliJ++GHnu0vWY5iybgZov2iMT5kcm82DtPRr5uYmB
         2PC/yejoxjtZAE7Utdhh00OgDNMWpTF+D4CZAryJQSD6jSLnModuWVJHOsyqdSMBVPLt
         vbxA==
X-Forwarded-Encrypted: i=1; AKwUvBw7Eb8Gb4tCIPCvXh6LDekgOHDJeIV+Mbzxn8UpoV0TXGyknzcJpUhZDgEcZMnwBNOqew/QB+azdvSOPcc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJXUEmC++pyQe3ENDs2x+xWn5ODGwV/l3Rni1HC261jYg2/aZXr
	WIiqPpaQ76KS5srZKkXAMOseM8m7ru9Kf2qkPpoqOSpnDaKnvxEzpJlSWh9I/cPHzx9ZESj0rW7
	cfBot4AQOYQ10WHO9d1qNS/GQ4g+GiUy45nYyPLgL48imh+t9+CjSFL9d1nkSZbfj0dccAg==
X-Gm-Gg: AYBFou0Li8cc4SCTt/9yt+lqdXV88S5aXcpQ517AEigU3pSxUHAE5QXxhnkWXhZA1Di
	x7Duq7hWi1oxngYtJmVYEYbAGhxgmgxjA1Qo8W09qSUQK7//1olKfSH9O0D+4klTgKc2OeJM5By
	QIVQtlh90sp6786OAdk/+xtd+Zls1p0KVAtMpmS8wzzSU1577Qf9xsF2amT6YIXdyd6aQKMGSUe
	w3VQPNiXfkHU9VbBu5X6weh4vo338xAd+LrqT2jMQbOkg7TTr7L6J9gJldMYXQB/4WjI3ZNoGIm
	+zLeEVxEomtQkWuKeUMf367fOsOErf3BP9bSLTdhUdbFxf9+3dBT+2plHPrjS2XZga2/5NIqg4I
	kDXLpF9q+bwbZ3xfUjc5n+fom5bEY0p3xI7B1+GEwI2eu5g==
X-Received: by 2002:a05:622a:a0b:b0:535:f8b3:a84a with SMTP id d75a77b69052e-535f8b3f361mr26044201cf.1.1791919225779;
        Tue, 13 Oct 2026 12:20:25 -0700 (PDT)
X-Received: by 2002:a05:622a:a0b:b0:535:f8b3:a84a with SMTP id d75a77b69052e-535f8b3f361mr26043721cf.1.1791919225113;
        Tue, 13 Oct 2026 12:20:25 -0700 (PDT)
Received: from [10.207.9.0] (nat-128-59-177-43.net.columbia.edu. [128.59.177.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ba684f404sm10027916d6.31.2026.10.13.12.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 12:20:24 -0700 (PDT)
Message-ID: <81e07de2-ec8d-4ffb-bffd-44391ce9a2e3@columbia.edu>
Date: Tue, 13 Oct 2026 15:20:23 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] fuse: convert the readdir cache to use folios
To: Bernd Schubert <bernd@bsbernd.com>, Miklos Szeredi <miklos@szeredi.hu>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
        fuse-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
        Joanne Koong <joannelkoong@gmail.com>
References: <20260924-fuse-readdir-folio-v1-0-8dd97e71c1cc@columbia.edu>
 <3dfb90b9-e1d6-4a0d-899f-5db3160cb31b@columbia.edu>
 <c298c696-d10e-494b-b048-186cdd3f360d@bsbernd.com>
 <5ff63ccc-3aba-4c4a-a289-48620f1ceffa@columbia.edu>
 <3b7a2fea-3fb9-42b6-aef2-d9770e3562d9@bsbernd.com>
Content-Language: en-US
From: Tal Zussman <tz2294@columbia.edu>
In-Reply-To: <3b7a2fea-3fb9-42b6-aef2-d9770e3562d9@bsbernd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BuwIUoX5 c=1 sm=1 tr=0 ts=6ace847a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=lXeS3XHMKYhu4Q0xF1pUDQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=x7bEGLp0ZPQA:10 a=A0y_DWxS2BwA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Da8U98TiO7q1upZEImrf:22 a=G--0XuH5328wxK7v7Suf:22
 a=uWY_cRABlmrOhBJZ42EA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfXwOj3HrGIPFPd
 m9wEZzP+yCXV2ielamJLUzabg0MqwJWLCfXvLCKN8MlUoWCpiZErkO4EFott3+PJAgas7WwCHjq
 EymzRK11ip2qy4rrD8udwTlA+XsT1EwPDrC14IpNtFRaC86P10hj
X-Proofpoint-ORIG-GUID: _pVq1S03ii1rsslQpXlIjK7i7y3xEnpt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3NyBTYWx0ZWRfX6+VVBoRUkw/B
 0o526HD77ITVsR3jny0ruz/EDVtOH6pV3sS6lqRez+VMiN0cV3K22bFm5IM9NQO7LeRdxALBiZW
 jVY4dhiF03FqNSHBkTve1lZowVwDX+frSdxCcGqYMPssJDONF1vOCaeTmY8OxEI3HHX8iKRwx5/
 mkcj2MYcgNAcDcB2hOMr9tTUgV653AOZQnXf3ZPjfA1OntwWBLOk3P5I3NWVDgDeNNhtOGVhnND
 jAiRugvZhHRsXB8hdRXdECCWFl0NFRFe3vUCT678jDTKsvXuCzJ7aq1fJs696k/bCxqhcwkIkdZ
 /pxuXN0PLi7LpP5CGT+TXtuKrLrDWgJx5ZmnJ988BOPiL+7+n0CvrduC2L5L282fJInXsQngZIL
 bB6mdm3C2p7aW6xqbBj3W3U6GUBwJ/2DEPBVqDJ3knKB4g6QfJTkeE+63THimbAmNyr/XQY30C3
 KoWGC8nnteiO6+ngXWw==
X-Proofpoint-GUID: _pVq1S03ii1rsslQpXlIjK7i7y3xEnpt
X-Proofpoint-Virus-Version: vendor=nai engine=6900 definitions=11934
 signatures=596817
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=10 adultscore=0 malwarescore=0 bulkscore=10 lowpriorityscore=10
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130077

On 10/13/26 2:13 PM, Bernd Schubert wrote:
> On 10/13/26 19:49, Tal Zussman wrote:
>> On 10/13/26 1:38 PM, Bernd Schubert wrote:
>>> On 10/13/26 18:48, Tal Zussman wrote:
>>>> On 9/24/26 7:42 PM, Tal Zussman wrote:
>>>>> Convert the readdir cache lookups in fs/fuse/readdir.c to folios. This
>>>>> removes the last caller of find_get_page_flags() and one of the last
>>>>> callers of find_lock_page().
>>>>>
>>>>> Based on fuse/for-next.
>>>>>
>>>>
>>>> Hi,
>>>>
>>>> Following up on this. It'd be great to get this in as it would allow us
>>>> to remove find_get_page_flags() and find_lock_page() next cycle.
>>>
>>>
>>> fuse has large folios enabled now - the patches need to handle that.
>>> Even if it would not be enabled yet, Joanne had spend quite some effort
>>> to enable large folios, any change that tried to rely on behavior would
>>> have just increased her burden...
>>>
>> Hi Bernd,
>> 
>> As far as I can see, Joanne's patches enable large folios for regular files.
>> Here we operate on directories, which are initialized through fuse_init_dir()
>> and so do not use large folios. In any case, these patches switch to using
>> the relevant folio helpers, which would get us closer to using large folios
>> in the readdir cache if that's eventually desired.
> 
> Hi Tal,
> 
> oops, sorry, I was bailing out when I read it as "this introduces
> another stop gap for large folios". I quickly scanned over it, but don't
> have much time right now - will review tomorrow morning.
> 
> 
> Sorry again,
> Bernd
> 

No problem, thanks!


