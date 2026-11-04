Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793755051;
	b=5f0bnNVMqJSNny73q7sUrMYRvJFKlMcW6iJXL8UVdR15sNc3tDAUoSG+rmSBNdxdvitM
	 occGdFnBpbgoPai/xvZzH2q40iolk8uR2eQI+sPCzJgd8pFA0sH8gQI4+c4xCNBBIDtUQ
	 Qd+XCpMM+piPYtss2ldB9TgaaTyWpltMggsz0pTSeo8yLby0QnUKY7l/oBXRygEqkWLXf
	 O38wo5MhnLixeO9911z9b0sGW5FpUWn8p7m0D5frqtvK3SPAVzIK4WMTdjaLLh7RbPt4t
	 nMFGm4eR52zWFaFMhQZVe6IBfnzGKPTDX6QjKnMj8Tk6ng6Ih/1SidLk8VyZr68H2EA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793755051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=cm1ZQLsGovKO+P8QmmyFaPVIQNh00JlvvBw/TqlEjIs=;
	b=PFr1+KJniCsuA3SLoOedIYaKltgJBcsTPBrLfIvTry9Z60Y+OBFWsiwYdG1p1yioNEY7
	 Y8y44ljkctoy/jrzlAM9CRARCqI8YG4LfqVTa0pCQENdyPcDo7GcVKt78PGlAuDGL5jlR
	 wPXIO5ACKA6FdW+35X26A5aGAV0EcZkNrclObGu+t+9sh2XAdiNetF9UtSCVU1qVwhb25
	 b2aboIU7zxuMjPz0MDISORwV8V3kO3CN4XZH8fM+h2Rh22mPwiutLPi1sVS95pWPF8T2B
	 ZeqXtX33TPvKFkVjtSZVaj9/UrFxrePjKVI1/4bDuOZjLiLBlXzZkIrKLu7DYUMO2iA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4+C74hN;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8355606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 01:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8355606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=r4+C74hN
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9d7791b00so1184395ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793755050; x=1794359850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cm1ZQLsGovKO+P8QmmyFaPVIQNh00JlvvBw/TqlEjIs=;
        b=r4+C74hNy2J107k8QWxXCv3v3lNRX1ZF7IkvLyMlO5Sw3gCYbneWz4mJmQDKQNGeYB
         216tGkq3KEO+o6nCrAW0KCFPNw9CXClLhlM/OwSGi4laDFWTkLR5G8KmagtrrAAAhu58
         1dM4r/hjrdrL0TE+sTf2XEODhKDlexutW2kYpIFp3ULoGQJzGShf87DihBIaApiRiAaX
         LgbLu8K8bxUAaIkZ7YPUmtTqn3egH+G06cvvg0O/JYUlF/vK2E5hLlXAiuZ0jIiRYEse
         j7y8SwgpMveSTsr5WIZEreyVwz2EG4V/yyZMRioc7oOFOzV2bhI6rCxcRymJp6FtQUYT
         Hq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793755050; x=1794359850;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cm1ZQLsGovKO+P8QmmyFaPVIQNh00JlvvBw/TqlEjIs=;
        b=qnaOxoGxR+LoZZmqLYTJXudmIff+sXoPTRgbjwkfrB/ZRoKnKx27jrj6SjSKXT7iZA
         YMVIuS+1pdEzfhtaNYLzW7ozNMHhyxlyXycy90aLX8OFn4Rq8xcd+XOT/K2Wb44ObJfB
         MOB5AeW95RZ0V0bHrMMNZ+EuYS1rjlJ+++wE3IHfWT/Q15SU5PgLCeG6mH1IxOIK2O0D
         /GRlSiacSj3+ZOXLVR74gFZk55GsGz84o/GuEzA6qgwcZXGpD7A28u5P6AbxL94KVb8J
         Yq6VFtwQhlBJkkPhSAeGo40R1FEIC60VIbq5p53D3qIoH6urxHq/NgL8ZE5nnWS0fIDQ
         cWGg==
X-Forwarded-Encrypted: i=1; AKwUvBwwK1slN/Ndyc/LMnCgKi/NNQpDnaMwvGXSxRJOoBrt+z1z+bEFiImjATznXc5b8u8+N5QYjxrOtf14YhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/syqt9EpsWP4M749UGfQt91rbTNC4ifk/uuuxdfj39N009eF9h
	BRXIV6M5d+5NnNqXnSBzJ5cfqPeK+eeS3W/1uHXeWWf5H6crbmnG6mrp
X-Gm-Gg: AYBFou2mLC0mukpGrqH7+7p+21hZm0ElL7WAMvnUYdnegQSPbjvsNCYe+8R1HdeHp1s
	FWdMLwSXwdKHBYC+nTm0YzMxKP6AggoEqzWZ3FFcuLvFks379GKxIoVq7chrwGJW5EWvMcvDGVg
	dd2EwfUwm7Qtz7se5bsDVAt/GhZ60YgTIAEHc0KczEbtAmxeqzOZRL70xHgvY3+48Bf9zNmAJgo
	wQF8JNd6d/hoIETVvz7DZEE1uMESfv/jdIT+KC0NCR0RO7dtU4cwpz6AOXrqqD5ZBoogugpgUdd
	AHKxtHijj2n4k8IKz+9dM5GazIKUWyeiePCouussLSWttGEdxeO1frJgZNqICXzpy7FxeJmkhG4
	+f+FZUTCKdtgyLFinTqaI/pLrYHBG/g9i9d0tB8xaoCrUWMROJuYHiQ1TjS0uqll0FLjkoKr37E
	HwaX88TTD+waojzGbfufKiuj3MuvRW6Om6ZyB0g5D+ch+f9V3LMmLEc6bdNvum3hoF8/H6OCv1O
	nxX+ukBa5E7MBXWGkOUzA6lkNOYmrOCYoKwtk+aHgskY1XcWNITwRN79Tvcf9TQCSLdpHjcjnXy
	uT2fq6o4QHApDcIi8639E+DNuCnDDvMrh+iGySCu300=
X-Received: by 2002:a17:902:ec85:b0:2e9:6788:937e with SMTP id d9443c01a7336-2eb364d1716mr124879085ad.42.1793755049997;
        Tue, 03 Nov 2026 17:17:29 -0800 (PST)
Received: from [192.168.52.49] ([2406:da14:ac0:7d00:a5cf:b1b:97dc:3084])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091ce09fsm741905ad.68.2026.11.03.17.17.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 17:17:29 -0800 (PST)
Message-ID: <9bb64032-09ce-4ddf-81cb-206bb85b9be3@gmail.com>
Date: Wed, 4 Nov 2026 09:17:24 +0800
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
Subject: Re: [PATCH] mm/damon/core: reject empty access pattern intervals on
 scheme commit
To: SJ Park <sj@kernel.org>, jm5905938@gmail.com
Cc: akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 error27@gmail.com, damon@lists.linux.dev, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 "Liam R. Howlett" <liam@infradead.org>, Michal Hocko <mhocko@suse.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Vlastimil Babka <vbabka@kernel.org>
References: <20261103145319.88120-1-sj@kernel.org>
From: Wang Xiaolei <xiaoleiwangxiaolei@gmail.com>
In-Reply-To: <20261103145319.88120-1-sj@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi SeongJae and Aveline

  Thank you both for the careful review.

I appreciate the clarification that DAMON simply executes what

  the user configured, and that this is more of an input validation

improvement than a bug fix. Perhaps I was too aggressive in framing

it as a bug.

thanks

xiaolei

在 2026/11/3 22:53, SJ Park 写道:
> On Tue,  3 Nov 2026 18:54:18 +0800 "Xiaolei Wang (Kaihong)" <xiaoleiwangxiaolei@gmail.com> wrote:
>
>> DAMOS schemes accept access pattern bounds with min > max (e.g.
>> min_sz_region > max_sz_region).  No input path validates the bounds:
>> damon_new_scheme() stores the pattern as is, and the sysfs ul_range
>> stores are plain kstrtoul().
>>
>> At runtime __damos_valid_target() evaluates "min <= x <= max" for each
>> of the three pattern dimensions.  A reversed interval is an empty set,
>> so every region fails the check and the scheme silently never matches
>> anything: nr_tried stays zero forever while the kdamond keeps running
>> normally.
>>
>> With such a reversed interval, damo starts normally (rc=0, kdamond
>> state=on), but nr_tried and nr_applied stay zero forever and the target
>> RSS does not drop.
>>
>> The same holds for the watermarks thresholds, which must be monotonic
>> (low <= mid <= high).
>>
>> Validate the access pattern and watermarks at the beginning of
>> damos_commit(), through which both new schemes (damo start) and online
>> updates (damo tune) pass.
> The documentation is not explicitly mentioning about the inputs (min > max and
> non-monotonic watermarks).  But I was thinking it is not really difficult to
> infer this behavior based on the existing document.
>
> If my understanding of the documentation is not wrong, I find no problem at
> accepting the inputs and just behave as documented.  It might look silly, but
> who knows the users have a creative reason to do that?  As long as it is not
> causing a harm, just supporting it is better for both users and code
> maintainability, in my humble opinion.
>
> Pleae let me know if I am missing something.
>
>
> Thanks,
> SJ
>
> [...]
