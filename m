Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792516406;
	b=god5pgdErQx05vHWCG8mtw7j6nB1+5eAZMX7ibUpY7NbKw67o62vMyznPARpy5393tZN
	 I40/Tg8CmOFtVqiu7oPXd2V4SmCA/1yBmM3InfbRO0MRRW4Q39fwWBgvW5bxOWcmC0cCK
	 zxCCHIJVq20gq9DwcoSjZ6trPandKONLRJmWwuZxKscaGZcbleg8Gq/jqfklZPpnuWuCM
	 Ni5FJEGWMcD34WhttjPZCGFa3IHnF8BQHFJjXUgRVAmYSW2ZS9xLDY++e/Eq394mVqFH2
	 cjNkBpCitpkrMqzT3XMw3ff8eOZL1mu3XUaeovUHkCJMF7eaN3GBf7pOF5eTfDur/Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792516406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=e4OwnBidoAfAdMjRbpbOO+nJHA8rafIGJBLITYtbTdA=;
	b=uHsTRzeOcqtihKsqSVebF3Zo5w1SuqFZu6EipRafq7mE9ZnD09hzeZdk3El2XFZRgwSN
	 XMQWr68r+nWGHTWIV3DYR5LcuPtI4bV3UHlq0S3zNmJ0ypTlftJXv0vOg0vO/ajJUc6Uj
	 qMCb5fdP+Wze21s4KEK1MpKjg9Ua+7NwI1KcnBbRUAbcRr4pb+ZSOxFeJmua65jmxzhWx
	 rh/XO43oUhjk3Wk2JYeH/xDF8SFXsHhqbCT0XX52kUyS0HzH2s3MXoyZWyFfdF8QDU5z+
	 PCqx90pV0vun5DKVwKDc0q606eq03VBmiAdR7RFvzJlsWK7wZ1zQ62P31qbxjE2kqxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rnowydY4;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A816606AA33
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 17:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A816606AA33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel-dk.20251104.gappssmtp.com header.i=@kernel-dk.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=rnowydY4
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36661f953e4so1357410eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 10:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20251104.gappssmtp.com; s=20251104; t=1792516405; x=1793121205; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e4OwnBidoAfAdMjRbpbOO+nJHA8rafIGJBLITYtbTdA=;
        b=rnowydY4LK2PVPe3cFHeHwMC4sA2LE2zUvuRLfnIO4u694UiyX7HJZ7ND++Kgr+yXT
         npBlaJRY3dd6vAn7WahZfV2KZKH3AlVH7Uax8Es9cRBb4Hc10nmXcujwR/VVDnMOzsZi
         Kchfv+VrKzu5bk42KbHfcI8TZRnxja97MVLmsTgvNONBAHIIM+x/yF+c5f7JTPdXu7Dr
         ODCwwqCikI4c/gbwrn7/GKDOF6lANS7hyCj4beMYydWx7//tUkdAwRL0RUq4UnLw01tQ
         Azw0Ctcdk+2ZIsTkRX/7aTm8V9lRUp2nfNkywv5Hvwivk+Y3tPlUHwHxZYPuDSdP7dze
         hTzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792516405; x=1793121205;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e4OwnBidoAfAdMjRbpbOO+nJHA8rafIGJBLITYtbTdA=;
        b=eLZtvAusoHHEgggRB2pozjQHylWgwBEIqqtVvNB9es3lnAzV741Hit8+4mk4PzrZBr
         omSErD48i+htKmgUg2CjnqCpMp7POjH5ZgNzTGTfQuUOQlz2rvll89NnHMdkxlVfXvcb
         EulW9i36R4CgZ4WaUeUSLUeV8TYZKZLkKF1+/NcgUVC6MUlDGqFzyryY1pNSuVtrQ0ep
         FNQmaXV/OvzGytLcs4RvV5Km4Ex4iYK8bEHHhr/TJvoBMyVD4RlQCLsEI4jIwWMcqJUH
         gb9tNIcObKCvvmHQ1WjoR3SwsIbyFMznxwOZG3pCgLDgN8umfV7anCcBfCKrEFUmch7S
         oTlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSllNNRMmu/YE81Xv2jE8Ci3uV22G453j/7mfejXDsFAqtfnvAv4p9H7VUkMS+35jy87s41qwqzJMYDVA=@vger.kernel.org
X-Gm-Message-State: AFq9FYIukA6akaaVSRXeYrUwXYLM3aLrML0ThSsOxwv9h6s6g1OTHda2
	ooZKgoKxJtwU6q8lUUFtAJBgR/ZuqnluG/7mD+VZnloZ7shO8vaX6e4iASQjAdAA2fE=
X-Gm-Gg: AYBFou22khiahi7nfa8/O16gTlK227xlr9Sy5GrxxIWY9Wa6Aeb4u9v8GWmRSWanKig
	K56HugpuGHeUyVLk/ELfRWlFt5IuPs74l0w5bOch/rRdo5HoubM9MjWDMFZcca8FhURG9tSis/u
	SQS9Tu8GDKuC+ZIzDcD2l/5lAU8sHd59OUHuW1W7hLNGJzfXDUDEyq1UFjs8LUxTxEDO6E/pVCn
	SCIXz//itK38wM9xgbD8UI/ZVxfQLqyxQiD6PUUboBiDEe8n9xJydgkinmxm2tcmF4PG/UktzWB
	BlxT+ZqtCNimATH4v9sUEVAMbje+3puTuhZmmuCOHGAlNNEZu1pdC7HTA82CCIuqaGS/CyCaaC/
	4gCeyHclimUJDRX9SjsXiFYZnnFzDeRZtbvZ64zgHR++vS/rlwONGOY8fOqb153CUOwxwydjFOj
	W5gtJ3vabej4RQSX6B9IQbtKzx9TdpAfhsW07P/5rwcp4mngolYmroOqXreFVojjMIPtidHRbrg
	dbr2oy2QI3viEdMcLFdOulBBiFXIu8buAUcrPEEkjtXCVD1BEzKL5uMafYK7866SP+gN32VbaHM
X-Received: by 2002:a05:7301:6195:10b0:361:6884:78b1 with SMTP id 5a478bee46e88-361a253f345mr15767601eec.28.1792516405245;
        Tue, 20 Oct 2026 10:13:25 -0700 (PDT)
Received: from [10.61.8.29] ([155.98.132.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367405ec6c3sm35919eec.7.2026.10.20.10.13.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 10:13:24 -0700 (PDT)
Message-ID: <af63d378-d6d2-4fe4-bc2d-15f894b60624@kernel.dk>
Date: Tue, 20 Oct 2026 11:13:23 -0600
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
Subject: Re: linux-next: manual merge of the block tree with the mm tree
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Mark Brown <broonie@kernel.org>, David Hildenbrand <david@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Tal Zussman <tz2294@columbia.edu>,
 Vlastimil Babka <vbabka@kernel.org>
References: <atdeJ-91RQrqLke6@sirena.co.uk>
 <553dc087-b5d4-4aa0-8e84-4de6eaa45847@kernel.dk>
 <20261020100055.3e388e03fcd804f0cbde04f5@linux-foundation.org>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261020100055.3e388e03fcd804f0cbde04f5@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/20/26 11:00 AM, Andrew Morton wrote:
> On Tue, 20 Oct 2026 06:45:16 -0600 Jens Axboe <axboe@kernel.dk> wrote:
> 
>> On 10/20/26 6:27 AM, Mark Brown wrote:
>>> Hi all,
>>>
>>> Today's linux-next merge of the block tree got a conflict in:
>>>
>>>   block/bio.c
>>>
>>> between commit:
>>>
>>>   d4ee6948bcabb ("block: restore the iterator when rejecting a misaligned bio")
>>>
>>> from the mm tree and commit:
>>>
>>>   73a0ff6030afc ("block: fail a short atomic pin in bio_iov_iter_get_pages()")
>>>
>>> from the block tree.
>>
>> I suspected as much when I saw Andrew pick it up. Andrew, perhaps
>> let's queue it where it belongs?
> 
> I was hoping to get some review feedback before sending it over
> formally.
> 
> I'll send it now.

Applied - can you double check? Flow is a bit different in there
compared to the one you patched against, entirely hand applied.

https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git/commit/?h=for-7.4/block&id=40d070cbb1906896d6fd65c39722d2411830ed9f

-- 
Jens Axboe

