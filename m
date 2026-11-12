Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794465296;
	b=doP8eG/s2PWSY+tEly7oOFKGc/jAEKid9D0AfYq1UC4ynSln+0v0Lrn7cY+SFJ2o2I9k
	 tI0Iai+3xRVcmGH6bUIx2jgL+TKpxba0k6eZ5ZAD/36RLRoWVC9bQne8Chrf+7FowHFAu
	 RCkVZPyHtbcZ9+FWXNeuBexwf+ghXcAdNFMThihZyQlSm2//oFBjUSsfuqdcmMjW4SrSW
	 vLpQCS3OeJFR0lkVSPjsQjlRqxzGYQkveKAKBaEqSz2jYKXpOwxEBViNDg5wmN8B0NuJL
	 5dqA5tDC2jxDXdJtT1yQf3pOt7ctdFBf+x/VDDjvAEnAaQ6Etz8CrPWk+X0jpdacHCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794465296;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=XzN+ftZH8nOljyMprPWsB+uz3H4ojG5d3KlA9M9z9jE=;
	b=n/bO8Rn9O/w4U/ld7acy/UlMCUkUmdYGlpPRwOwikavybZS5FRLQS7sEV6BtX0I2+mDw
	 lsEroDcNjMhfzvRBbaqvgpAsAYIUFR9692K5g517GFJIbLCtA7pWVxapOtY0l4crciZZU
	 JdJf4gl8CRDrDmYBhPucVZzW+beuMram0DY32ARCdo1+/GYpbdiQYboZDt5nhcI2WYrXP
	 h2JVa9SC6q4vxTxRxf0fZu5KbphAPHBrQYlkgKJTjnmZqDBnc5SG6k6eD4YMMhChlFO2Q
	 nb3WmCQEzfgUeG9Y7BCDBby7zQ7cUwGlNelrA1gYwnud4whK+Jo36Qu/lH3rpYE2PHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f24zqfC2;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E5A1606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 06:34:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E5A1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=f24zqfC2
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso38127015e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 22:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1794465295; x=1795070095; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzN+ftZH8nOljyMprPWsB+uz3H4ojG5d3KlA9M9z9jE=;
        b=f24zqfC2sGIBsI0kWpFkCCkygINwUTYVlHQDYSfiHVWQuqnAzYSUFr9LugKke/eiJ6
         tbZbVWjzCj1v6zO8JPipjGRc4mAGUg/3pUBsVG9fpR7qdQEyRjYh3zH4QHiB2rYFNoLW
         DC7IjCohdHpkzeUM73jSCYcY8ACK/NNMvXhoZMey9+ocS7Nn8Ar2EvoU1mtcVXY9+GPu
         h9WYYKLoxcNw5/ue/rIB67dFH43SKyl2IvFbxc1QlD304HW65aHW+CBa8sJPEP6rVWop
         plV6211Y97rUz8XcJDmelyEkqg7uTXE4xNjhs1EPdls+Qopspn4rH5MvsK2apotCM00O
         zNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794465295; x=1795070095;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzN+ftZH8nOljyMprPWsB+uz3H4ojG5d3KlA9M9z9jE=;
        b=O+4Jt46Y6HVQF/ilHHx5REFGgjCw/XivbX23OhXgX7gZylTsHRbmiZZNFA8svMkmnu
         ilVrz7f3TDcK9BkfEKKtsVSq99ExbtzD2lLaUSPiHgoGI02cAlVH5y5B7zVsmkrQZRoa
         fIbJ+EqhUQMUZG1YUoeV1MwXsKCdH8S3L/HSkHWM0VDiE3gomeFuLJCGOnFmiO10AUvo
         NIG/BPzXt+GP8A7tnIbdI4ifExqFb/w1GH7CvZRdx4qLCJKuhfDyT6lcz+RPTr3tah2U
         A2IWQ+YNBagoYn/VpRfT/Q5KEh9SLJ+I15sRJVJWZyGuheCRC1CWqYMUV38al3XonXez
         mgGQ==
X-Forwarded-Encrypted: i=1; AL+hErGyEL+pqi0UgbNL09Aq9o2VbBeNSXo1VwSAeA9dC2GELjlb6mFtnMlxoit5IjWWnVPoEZaZ91w0UjzrdHY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8LfOYXwKDN+c7eNSy61cDNsRQnLzk68A85SUgKzAyCyglefqNu
	I4MIVcKBSA9MCzgaR9MEP10qdfnj3L2vGvke4HFiwuJ+mTm0V9p12By2Zg+vNTv2EQ==
X-Gm-Gg: AYBFou2h1oKyBu5sMM6aTk3VK2WTXI364CmbQhZBI4A4u/9r6yccR6Lg/XXTFyQ1lSv
	BKX6TdUl/wXJPGswxirj5FCza0HHjRXsLwEQc0tPMNQZikkJAhaSwoM6kttrAm+32Mf+V5FBkva
	TE0AnFs4I3gAEyCid6i/VZH1F5dDCRXTp1alF4KmL9qBZPzqmV8EMaH+yPCUl20b4PGYGC7iU5I
	azIJJlhKzJq2F7ZlqHA68XQF1budPpeYSSzz6nJGR4nv74O8iR2rgAQUksdUqGq1Y87Hg3+jZNx
	hA+vsF6k90zCcuJqZcKDZgR2s0UwvjiVRPB4ebWDIeJ4ihBsKR6u4mPrCN3RMOHqAomrDNMWaCl
	8iZHy+m4OSL7SkvFw3UFWlM+cYCP0U+GbZZL4q0OeIhiMG2yo5tSirIVdu22+kg8YCDE+ttvqnd
	YgaxrsAJ+0bNzsZJAZcSWgdcpbEupd505kyb+6T64sbxB93E7wNNH7TaXXtXIjHRWeibnfrwGo1
	LITdSfaheQegPQXUONPGVll73bHb/MJnweGOiyFzDh/+xk8oMp99q8Z749bVvv1Qpmxw0N1/fNn
	cLt5v6cPiMzGhF5iXbZwozrKx/tkv4ETeD6CF3tSzQZnfEeP0AXekIY0WOhgDjUcyJZa+lcXqUL
	UoAFq0TXli8H4WiGJX81I3xc79ESs/+Az13WCoMxpK/+r2VGuu7TdxD0dWL0pxBgHpI7APtJZcU
	KPpLQXxPQ=
X-Received: by 2002:a05:600c:3151:b0:4a5:cfc:1e95 with SMTP id 5b1f17b1804b1-4ba093ac1f6mr79613765e9.33.1794465294776;
        Wed, 11 Nov 2026 22:34:54 -0800 (PST)
Received: from ?IPV6:2003:ca:b726:28fe:61da:a0a6:3f98:b9fb? (p200300cab72628fe61daa0a63f98b9fb.dip0.t-ipconnect.de. [2003:ca:b726:28fe:61da:a0a6:3f98:b9fb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm52598445e9.13.2026.11.11.22.34.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 22:34:54 -0800 (PST)
Message-ID: <7af69a18-fcd7-48f9-a9e4-c2ddc060755e@suse.com>
Date: Thu, 12 Nov 2026 07:34:54 +0100
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
Subject: Re: [PATCH 0/3] xen-blkback: do some I/O statistics rework
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger@xenproject.org>,
 Jens Axboe <axboe@kernel.dk>, xen-devel@lists.xenproject.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20261111162058.804033-1-jgross@suse.com>
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <20261111162058.804033-1-jgross@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11.11.2026 17:20, Juergen Gross wrote:
> Some rework of the blkback statics data handling.
> 
> Juergen Gross (3):
>   xen-blkback: Remove statistics logging on console
>   xen-blkback: move statistics data into sub-structure
>   xen-blkback: make statistics data persistent across disconnect/connect
Reviewed-by: Jan Beulich <jbeulich@suse.com>

In the last patch a brief comment on the global stats instance may be
worth, to indicate it's guarded by the rings lock.

Also, do I maybe get a Reported-by: on the last patch?

Jan
