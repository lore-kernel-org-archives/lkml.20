Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220464;
	b=pBmZIF3Ygf56jxE0FAhaiKQdnEaAP0+Ym55ykVzEmeFrTJcSPfJoTr3Tg1vpC+5KtdAh
	 Jrst0149CE/wpBDdUw6KpHpbi3Er6cfh9om3gknWBwG/eJMR/CfrfeR9ru0vgS3GTLgOU
	 SrKXj+8bXjqnVPTqWo1ALIzUJUBgEk2qDwxH/ApyvSTKvQUOkyCU4dRQe8ZP+PNMJjp4k
	 FQXmWDeRrghPze3CXuPkub3ib//YH3HbAstYLTXc/MYWEwnulekzjyhLrPSuB64WeQGww
	 4jcMfhc/LrNIx8nRYJ4p6aQTOob16uIgOff6JI/c1n+3aHE2j1SjGp9c7ItfRctHoIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220464;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=FGfYDpuV3icdfKs35Y88PCFmQpt8If2+8yLawkeKFOk=;
	b=CdrI0ESw23BoCu+cq5lMEgUKQwREkd77pyreiSPWszm0kF90/F/jsvzvS2TZ66r0gL1E
	 Hqe/7M4KnLwJKE1bdw+fRediT3ma7jyFKxAFVH+vd07HE4FuYbUq8ybgYau6VNIqbvxDP
	 +t1zPvWsUJH2C1hKah4Fsxy6uzXGricbz+ahZAOdhUzVH6dyF+u2LkpCXS8z+HVbS3BKb
	 97apUAW2CrQpcC8R42lbdw070OTklDon5aOvSOur+YzOowAngIcU5c/xU2XF/vfH328QA
	 nIPv7rlLPa4o5BHnvgnwJ1TH8F62T49ezJKuFQ5+U92RNz2FjmV8Y5wljrs5VCFIWIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tsz2Iuj3;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C74606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 10:34:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86C74606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Tsz2Iuj3
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48e09aa5264so403219f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 02:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794220462; x=1794825262; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGfYDpuV3icdfKs35Y88PCFmQpt8If2+8yLawkeKFOk=;
        b=Tsz2Iuj3foPiyKhOpMtIhNlS4SgI43uG7s+/uPfAJqrNxdM+9GzCoyk/RuzFK3c41S
         dZPZaAYHmXsDEsBnfvcE+JbT129wp7E/4TpxfwgLPal4uqoZAJzW08O4R0Ude7Hxxux3
         V6f6pVQKF9EM0jT0XBs4meC0AxTfQPk9IzguNV4b8BoYj19dgKUvwMoq4IivLKzMKkT8
         KPFXjdfZ/qip+oU5WW7BbUcesnukh8qonXeexFoUgf4W2Pep0xqd+3XJFtMcLz51zlQx
         dd0dY9+ukyImnnZYh7IKWfxkFbvlf0Ysp6NomZSen4gcXOhhRv7IjcqEJ953HhDWGlgv
         p0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794220462; x=1794825262;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGfYDpuV3icdfKs35Y88PCFmQpt8If2+8yLawkeKFOk=;
        b=0YHFqaqNJzRP5pjjdpL5TmK1ezUVboFfzrXIREc3NaLaGC3I0nHinCAaKl8ep0CUL/
         3X2ULFEHx7b+8bvQp9ws2ITJAurcG2nznMi84imQXVSdLkpu/rWzObpy4dEHpe7QSV6s
         z1j1vqDLZ6HN+0xREDVCvQMGOgbdIUEtisSK4qo+6iHthBoMR+KnxxBB078x6Fm1SxzU
         SbXUYgpiYKbMOFry+PkeyoeG9IXXCBsRQovxWUey2jPU6Z6HHjbJ7HzhpM9EKAp0vgdm
         +7FT38TAiwbwJrGd9cIFsZyRU5sQVrVuTHVVxbGLmHRKMvFVU70EHKtpGUSBZpdB2nGa
         l72A==
X-Forwarded-Encrypted: i=1; AL+hErHSf592Xolu30D/KqvQxJNJPnARLnmjQQvH9ad4/Pox0z/gOb+xbGDYJ7z9aiDaQc2idrHDu/UO3/xxDPQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Qpdj0XkRTDunxQ/p5WpahLvlHihgi8/BkeH2cT9O5f3pmW4pF
	MiVW91r2xIF7iB1QdICy0z2VryXDovLi2FnEy2JXy6cLIxoUxGpWnsHcsjr6v2h4VXc=
X-Gm-Gg: AYBFou06dl9iPZ6yFyJzdV7xPx1+WSH5ibDjR7E7E3QFwIVKI5fbuVw3vYW86vqL8MY
	CoVBGcErylA7sp1SaugEuPe4WX5qs3ai5u9Xuw1aA9eVasx96DUDO/3TX3dzpCf8snXt/dieR8A
	+wd964nWlOi81/yn9PMOU02KXWdVTmXvm4pTsakE9gkDuvKdMxljtDv6iXDx9WgViI1HM7cJbaJ
	HYfwGOYxwZbBMpkxunxD1lAQV5tXBxOE5Wurg6I6VIx8lo1J0LGheMdQRLHjtcYGWhpzoXpL22C
	UfSvQB/npvZDcDeDAEbpq5ZrzEW4IoQcv0KY9bcHHH9JqbC/W2aLRTCgTlQvMBaXEd8i4LbznkR
	xqbRk0m3NRSpyDk11CMI7TT0B8J3IHGeWbPKADygWDJTQNsIEM6yKVE3Su82QW3YqKiHM2x17Y9
	GJnlvs8dx6R0OJGrjjkeIZYibIsmJoKK7lhb77tl9/Dt1O0Hcw/ftBWUpbpP4bukEcP8zCfyOfx
	7uCOhZDXhY2xmNfnz1DAM/gXe1BC0dvOb9iISs1dL4/Xs76FgLi3kjP3qdnxsxnBJL74q8eLCdY
	ON1pp1Az7MGjz1KDPK0mB1yVqOGm+lMpSd1ISx6YyRDWkxRkuqRF0w==
X-Received: by 2002:a05:6000:4305:b0:48e:e9e:129 with SMTP id ffacd0b85a97d-4958363c1a9mr8033944f8f.29.1794220461897;
        Mon, 09 Nov 2026 02:34:21 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959774736bsm10021500f8f.43.2026.11.09.02.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 02:34:21 -0800 (PST)
Message-ID: <6f6f69b2-6005-4574-972d-efe80b8a8b5a@linaro.org>
Date: Mon, 9 Nov 2026 10:34:20 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: fix resource leaks on path build failure
To: Jie Gan <jie.gan@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Mike Leach <mike.leach@arm.com>,
 Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260513-fix-memory-leak-issue-v1-1-49822d7bc7d4@oss.qualcomm.com>
 <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <51a86fe7-95b8-4f49-96bc-2245c334b7f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 09/11/2026 01:24, Jie Gan wrote:
> 
> 
> On 5/13/2026 9:32 AM, Jie Gan wrote:
>> Two related leaks when _coresight_build_path() encounters an error after
>> coresight_grab_device() has already incremented the pm_runtime, module,
>> and device references for a node:
>>
>> 1. In _coresight_build_path(), if kzalloc_obj() for the path node fails
>>     after coresight_grab_device() succeeds, coresight_drop_device() was
>>     never called, permanently leaking all three references.
>>
>> 2. In coresight_build_path(), on failure the partial path was freed with
>>     kfree(path) instead of coresight_release_path(path).  kfree() only
>>     frees the coresight_path struct itself; it does not iterate path_list
>>     to call coresight_drop_device() and kfree() for each coresight_node
>>     already added by deeper recursive calls, leaking both the pm_runtime,
>>     module, and device references and the node memory for every element
>>     on the partial path.
>>
>> Fix both by adding coresight_drop_device() in the OOM unwind of
>> _coresight_build_path(), and replacing kfree(path) with
>> coresight_release_path(path) in coresight_build_path().
>>
>> Fixes: 32b0707a4182 ("coresight: Add try_get_module() in 
>> coresight_grab_device()")
>> Fixes: b3e94405941e ("coresight: associating path with session rather 
>> than tracer")
>> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> 
> Gentle ping.
> 
>> ---
>>   drivers/hwtracing/coresight/coresight-core.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>> hwtracing/coresight/coresight-core.c
>> index 46f247f73cf6..c1354ea8e11d 100644
>> --- a/drivers/hwtracing/coresight/coresight-core.c
>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>> @@ -825,8 +825,10 @@ static int _coresight_build_path(struct 
>> coresight_device *csdev,
>>           return ret;
>>       node = kzalloc_obj(struct coresight_node);
>> -    if (!node)
>> +    if (!node) {
>> +        coresight_drop_device(csdev);
>>           return -ENOMEM;
>> +    }
>>       node->csdev = csdev;
>>       list_add(&node->link, &path->path_list);
>> @@ -851,7 +853,7 @@ struct coresight_path *coresight_build_path(struct 
>> coresight_device *source,
>>       rc = _coresight_build_path(source, source, sink, path);
>>       if (rc) {
>> -        kfree(path);
>> +        coresight_release_path(path);

@Suzuki, there's a conflict here. This will need to be 
coresight_release_path_locked() if we also take "coresight: etm-perf: 
Serialize AUX topology access" from my Sashiko fixes.

>>           return ERR_PTR(rc);
>>       }
>>
>> ---
>> base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
>> change-id: 20260513-fix-memory-leak-issue-034b4a45265e
>>
>> Best regards,
> 

