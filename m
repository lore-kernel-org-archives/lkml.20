Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794405792;
	b=gnFZ5s26FzBDQ/d1BUJf0elzctwqd2Da5EudI0FWFLkDxWcdW2/ngEZNZp8oRUp4dRaL
	 IMzFz7FHVRDU3LnbbdI1pH9io/MyaQIA2cp1LGscnqtwev2EhK70pPyUYhS0Cnq5L5cxr
	 d43ZEricuF4l3u/9thwYFs4kwBEBwkpiYrZWVLG2sJsuE2lSLg9Thq7noGq8OnnMgJNt9
	 r0Hn+wYAGOuLVSet+H9GR+7gR+XR/pvacDDQ4OFRiQRRHxtAFFIg4mHx/neoE3Nsgt50O
	 IQGdeeRnWT7YMpqlnQHYsj7WdGU1o8e2Ktwttlg0Lq934FHHC7exFK/rGEDceDa9M4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794405792;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ib+B96G7+gmq0/izhy8Z5ZthzY6w8s611Ial48mm0F8=;
	b=nAj5XWXEFhlkFCQb8Ter5KvM56WqsAwYE+quuxu/qpIFEcm+r99f9UEwJa/QAxlWQj+/
	 MiP2f/IfHMniUacZsG2XII+eOgxbWX1ze3xZ24Cq9UVwBJB9dg0okx/fu34SzaJuqfVUD
	 scFp+o4JwYLAGhCVj78SlqMCY3/uk8KP3kpTqwzDE4mOp3ryHbpgLrSEHgIdXfUR9KEhL
	 Yu8cszEFS2IWXubEOK4N1k3MI2TLvB96FuPTbZJrcs6CsEDouIirrYSgZpNyuiwbKGf7V
	 povdbuHYgHPma6slOOPTMyWhMFlY0gKn5OSWDF9QfGORJoSaeWjlGIB2JqFCNyQqWxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="x/mTHq+R";
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F778606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 14:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F778606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x/mTHq+R
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so39084915e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794405791; x=1795010591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ib+B96G7+gmq0/izhy8Z5ZthzY6w8s611Ial48mm0F8=;
        b=x/mTHq+RkdWSTT01DvKGgaenVoWNtEjmumDLdRb4peR9Lp7Dk9JNnzNDVoiBCITwUp
         WLNDwuPumOuAwK/Jp3Yhd/ODZh1IVuMLBzEJY300fsygNCaxclDNM91jbeYZH2N+TPXf
         aMFFjaZwTEPdo17BzcL//lBDMtTzuPr/4Xhghlh6T93L4SLjHKhczpumHuHVh+VdyvPg
         4/VctMkwL5nKcv6NR/UtueX3iMc7YmWCvSIfyBJEVRSzsBkmp0NKNtUe7DLmNeYXHlT0
         nJN3LwzwCwecVS462Ph6tuUax9aIEaCpvkyqzTuVsKx66dYyKUoavu/kikooMfQDZJZc
         9n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794405791; x=1795010591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ib+B96G7+gmq0/izhy8Z5ZthzY6w8s611Ial48mm0F8=;
        b=FNGW07ZeUJ1DdUZo8+QpT8vD9yu3OvsCobePjQIsnF50pwOiZEaGURJ3v1VO5jfdVk
         mIZTDDuWb3uOM8pM0QDLAJsXCqnBX4jpiYq0ubVi3CHOFmOWeQMZCFNFMpLbpSxythPa
         4lM3JtWmYgLhUx0VnMBVcIUlug4supFnfxttNHmUTX38QpHLx2yGTgvYUemOqfodHVFm
         e3c1LP1umSvP7iHquqLqxVd+CzdEX0QWRaiAepuP0boDwAxUxBXij8fG2qjVB3ksJjyX
         4h3PeDqYE+r9iuyVosqY5WfRYIgAKlzEiZ40ZtZFtnTZXgZnsFIaOws1FBnpSO4ouTHD
         ZNJQ==
X-Forwarded-Encrypted: i=1; AL+hErFFHrxbvg1LNlfC4pDhLhrkGp0M6N7lhlNXdW31UHDlme1GkksMgggVZvdrVVMYfnsvLaQ34vFlPLD3Ywk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8eo6PB1nwzlL8kCf/QSKqfc0uwA3lVDFsx+PT89GTnE0T3DvLH
	RXuOvHAZimwXPAUKQU+N9hxJysgkCR2D/sPgq7t2nNnnrTq+mSRBbOODVlEEucxILE4=
X-Gm-Gg: AYBFou0bwkU/4F+reaiRL+u9MfWOM2ZnTDB/77oADJ8Rjy7vlzM7MaayMJhHGuVh6Pc
	lW7cPS60gVEHBrV43Lw1HlG3fgMdOJGVL+cLdpvtDuIqaAz6C/xfgFk2GdExU04wDsb1HIzVJW0
	mYSUg4Jis+A3e+2PHYN497jZSZ+a02NI3OA8sXYfYANRB/70+uIv0GMteeopi/JbaWl6Mw0/a9j
	WtjyuvkueoLfkNGpEELaLiNf+VwGOKOIlszkrxJHkqSQ/tMpGdKTNBQUneq1C1lj0pPe+T57WN2
	tgPeupp1V5HXHjq5Ewpy9WVvpvyetlnwR2XxsnAm2uWiXD4JMBtZNBST2xH+U0cFXRggRzN2xXq
	AHEQSiCyyDudUAOdhdizohU23cTRK/2tF9u7rBiCAWOpKQhfqUDVGiRITicR4U44PACwnTZRS0h
	0GYoqvRBs01ih+htAuMN/3Q7VFrFZuV2QFGYmIwzcnBqQmgFltKICKwgzKdHWbfgMg0NvATJ/T9
	CotiywfBUT+mHOiosAwSimR9KBrWPqODQLVEYpZ4iaPWxBCEFKn7AHfvCIaKMeE50kz8kDcsA7z
	4z8jCiN40p1UjY6KeRLufiIDGQEKOrZ0Uj5cokdw6LIO9lRdDtFUSNw=
X-Received: by 2002:a05:600c:1549:b0:4a2:cbe:bebc with SMTP id 5b1f17b1804b1-4ba0938ba0amr45260745e9.23.1794405790819;
        Wed, 11 Nov 2026 06:03:10 -0800 (PST)
Received: from [192.168.1.3] ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba01fba476sm172702635e9.2.2026.11.11.06.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 06:03:10 -0800 (PST)
Message-ID: <1e5907fc-40c6-4025-8d27-a92b3cb2845a@linaro.org>
Date: Wed, 11 Nov 2026 14:03:09 +0000
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
Subject: Re: [PATCH] perf vendor events arm64 AmpereOneX: Fix misspelled
 PublicDescription keys
To: TAKANO Mitsuhiro <takano32@gmail.com>
Cc: linux-perf-users@vger.kernel.org,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>,
 John Garry <john.garry@linux.dev>,
 Ilkka Koskinen <ilkka@os.amperecomputing.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261108183846.3804875-1-takano32@gmail.com>
 <bf6925f6-613f-4e20-8491-2a99183f34fb@linaro.org>
 <39ac224f-2903-496e-9a08-b4c5a33dc87f@linaro.org>
 <179440414898.2353714.11591904089911934138@gmail.com>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <179440414898.2353714.11591904089911934138@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/11/2026 13:35, TAKANO Mitsuhiro wrote:
> On 2026-11-11 10:16, James Clark wrote:
> 
>> IMO I would rather have something that's incredibly strict and simple,
>> or nothing at all. Having to work around edge cases and report near
>> misses doesn't sound great.
> 
> Agreed, and the near-miss report is gone.  The series is posted again:
> 
> https://lore.kernel.org/linux-perf-users/20261111132622.2349165-1-takano32@gmail.com/
> 
> The check is now a fixed list of the 51 keys a json object under arch/ may
> carry: 47 of them jevents.py reads, one more metric.py reads, and three are
> read by nothing although the tables hold them (Counter, CountersNumFixed,
> CountersNumGeneric).  A key outside that list is reported with the object
> that carries it.  There is no cut-off, no similarity and nothing that
> depends on what a run of the generator happened to read, so there is no
> edge case left to work around.
> 

The linked patches seem like a bigger change than what I'd expect. I'm 
not sure that's necessary for something conceptually as simple as 
"validate the json files".

I'm also a bit lost about the relationship between "[PATCH 0/3] perf 
jevents: Report the JSON keys that jevents.py never reads" and "[PATCH] 
perf jevents: Check the JSON keys that jevents.py never reads".


> It still runs as "make check-jevents" and as a perf test rather than as part
> of the build, and on the tree today it reports exactly the two misspellings
> we have, the 16 in this file and 3 in the AMD tables, so it wants those
> fixes in front of it or together with it.
> 
> The one thing I did not do is put the list in a json schema file, because
> perf's build would then require jsonschema, which it does not use today and
> which is not in every builder's python.  The list holds the same names that

It could run if it exists and skip if not. Or we could make it a 
requirement, but that would require some agreement. The docs builder 
already has a pip requirements.txt file.

Even without jsonschema I can't see why a validator can't be written in 
less than 10 lines.

> a schema with "additionalProperties": false would say.  If you would rather
> have the schema file and take the dependency, it is a small change from
> here.
> 

