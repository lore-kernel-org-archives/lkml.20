Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793868138;
	b=3Rtl19Qx7h2MCDVn9+0nrKI7rcEQcw6kA5CQG+gb2FpHwzttRk3JaTCMzs6Z+yUoPY2h
	 DNlPr67P070FuER1vpSXlU7+azGra7tGSwR3DlSFYqUG2mvjhgLxI8vWlrMKptpaQnu/F
	 MP1koxCc/keku4teTtZndqglMAox1zL8qSNMXgr1OasUkQmSpLocQ9gFXpz5O6R/Nebht
	 FAbs0JGy8ViWQRmI9gPWJ5N6gZuV43gQdbpOrW+YUuJCo/OMSBkkMucZzzd2PyFj9dEFm
	 pXb7SaaKgdzwiTYb+6/6q/ujTRIKxDWjNLh8fTQSFJ+ugEhjV/0RORHLQz442AbQuZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868138;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=w8QMF44xZAI/w7QQkxFJCs4NzF+nECfSjG7lcXAyyG8=;
	b=cyc8R8LMhSmw2CKW/3XZBN/U9pi7BcP2MsmlvN6Z33uaOSgAQE+Xrl1Uky5vhtwVJ+4D
	 X/ej9kBmAv5MGH2ga86HgiRYAsrbcq9ksD+XFPLVC4l4qIt3VcREK1CzfL2uPtEtb4cVZ
	 UGmnHutt8viMuqXkU67EMc9u8GCqTVPrdVNgQu7QULeHeI+0qsS3pu0RvNj4yRsEpjMOT
	 RKq4Gl3M9/HCiYkpVwcRMcTPA2JzC24JxtzLl5CMNQD9DtC30NKIQ5+C4eBdeg8uqPq4D
	 AtMuQcsfH04gNByYtrppeG5nqaoOJBHU5XsfWAVrNiM/Ck+sM8zcCLJQk4X36XyHgJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=korea.io;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49B3606A331
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:42:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E49B3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=korea.io
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4c02ddd62so1051488a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 00:42:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793868137; x=1794472937;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w8QMF44xZAI/w7QQkxFJCs4NzF+nECfSjG7lcXAyyG8=;
        b=sGw5LS7NXY+OoYVfMgQ8r5jgo5a6T6oGnGPx1kzCWW3YCblriZ0IOzL7Kpo63zlOtl
         0uNdbUtG4kAnac5g0VLQBiOQOnxsevIDjOCVNsxgfpZhT1EA/m++1vVhhqD4ybZArFyv
         suyEWeuDOCMuqenk4ztiPk1EqqIpOK98A8HBLij1pbxZtmwEkK1Sm6H6TENg4P+P19iv
         NLffs58hXQWTM4QFoJsEfe5vc1q7AApp1gf1dqXD5eDSTsCmNu9D1pagLEEE6fyGCCJY
         iEwq1zBSeYp/XmVGeOutGPcJ35xh4TddCILwRPjrR7Aa+kvVEZq8e+BN2hVm1ER1wHN8
         Dy8w==
X-Forwarded-Encrypted: i=1; AKwUvBzvvCrRXghhbHqgMARczLqYOg+PF/Ad8R+/R3ZDD5XmTINJgkq0DX4wK1fK+dHYm6Sv0Jd2/PgXoP7qoBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/WEmLX/lKfx+87WCe6nMbVMNi7uTl5wD3NTlPAS/RVswSZkaq
	kuxAkzs7U+H8H1FFS/IRrgr2WAdgTF0q/LI1XSAfTFRIJY9JBQwlZM3NrGnn09/b9y67
X-Gm-Gg: AYBFou1H06NV0unLyTTN4UN65qokQzeZG3k9ri+GxYa5HRqvKklHkVp8M5pcu6VveEM
	CekX66vDUq8P5/MkG02H0UOPtj8lsxT0akgEsb7CuFv8/qDnXDtWOwUawcNZ5g522JhjST8MQ/9
	fuotaZOdcfEmpc9TDYSOwztZAOyIajE7NJInWjVKqm8F2KlWsU1UbrmXWG66t2vAlJsXqznr4GW
	UeMLWiUwlzn+oUzXqd0gM4nCILW8cTpnHMhWm8/nAvA8CIGbaRSfbsgE5W2/hhls/jdFRIAMlym
	30PtPmxbn4S3AUXDx/RqKmMhifBDbkAe3clocPmRMOOJ3CuaMR7fIIgONtwFNZkwYRf1XoCj/Ze
	7aG0ypkQFhe++IM3jlpIVMSlVSb46jnWlksDfpxikp/XZAJ335waSJOukmkSctelT3z+wTLF2E2
	zCIv6pvAuAixeIk+bgbOlpzoYAdyh326HEg54BNdV/IRxdgz9lp7wnZz9NY2tPzSch/T2uF07Yy
	ymXYdJQKHeSqkOI4ZJYIyGM9t2dc9w3ovMV5rh5dC/gz2W+rk2UF4SfL3o60R9g95KqCI/9+diY
	S4bbXTEnHuyBhgciRaMr7g9g4+5npB7qbyOB/BLQQXvK9a3WaL+DN6v+4bKAfk1gMfOoP9b0HFu
	PvY+9EZyjZ5xaqcB1mlDOuPeVYDKQh5LAxp0QYowvswvqTa/RCMjRJJtcGmZ9
X-Received: by 2002:a17:90b:270d:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3ae898142dfmr14972954a91.33.1793868137061;
        Thu, 05 Nov 2026 00:42:17 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([118.217.70.161])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32812a6sm2720088a91.11.2026.11.05.00.42.14
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Nov 2026 00:42:16 -0800 (PST)
From: Jongwon Lee <ai@linux.com>
To: Li Ming <ming.li@zohomail.com>
Cc: Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jic23@kernel.org>,
 Dave Jiang <dave.jiang@intel.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Dan Williams <djbw@kernel.org>,
 Ira Weiny <iweiny@kernel.org>, Richard Cheng <icheng@nvidia.com>,
 linux-cxl@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] cxl/edac: Read cached DRAM event records under the
 xarray lock
Date: Thu, 05 Nov 2026 17:42:12 +0900
Message-ID: <20261105084212.55292-lm1-ai@linux.com>
In-Reply-To: <417b4379-4f6a-4a31-b2a4-f6f84b13d362@zohomail.com>
References: <20261102123233.74598-1-ai@linux.com>
 <20261102123233.74598-2-ai@linux.com>
 <417b4379-4f6a-4a31-b2a4-f6f84b13d362@zohomail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ming,

Thanks for the review.

On 11/5/26 15:42, Li Ming wrote:
>> +	xa_lock(&array_rec->rec_dram);
>> +	rec = __cxl_find_rec_dram(&array_rec->rec_dram, attrbs);
>> +	found = rec;
>> +	if (rec && out)
>> +		*out = *rec;
>> +	xa_unlock(&array_rec->rec_dram);
>> +
>> +	return found;
> I think this "found" is not needed, "return rec;" or "return (rec !=
> NULL);" is enough?

Right, the pointer is only compared after the unlock and never
dereferenced, so found is not needed. I'll return rec != NULL in v5 and
keep your and Richard's Reviewed-by.

Thanks,
Jongwon
