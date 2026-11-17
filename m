Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794931550;
	b=NwH18kaLD6j++94iIDgMI0UTClKPb1h03Ug0hWT0BbFryaVxqJShsZ28RdQ8EF45WgNw
	 QuY34dRGEt/hoFbD2YLUtyzXCsiGrLx/Tx1pLDOJZZL8eEHs0/6nE3KFn3InxWRxVLA7l
	 qFYULtRGYr43G6vnok/mictr+EOYNwSQRZDX8ft9ZpJTXRjpaLzCVavxCS2dMBk42691x
	 hGRvmAfHYtufWiCzNbglDHWr4c0vqMvh4FDkQDV85HieABMAiROnvLiQZeUKELWsyEQNC
	 8gr07LSEnixEHH4CO6v/aB00N8DWDycHKwVC0QoclFtLfyti4UP6oqwvJpqWNPN/aoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794931550;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
	b=Kr/0X3kpD7u2HaQQBeRy1sp0BcmLd8YOZLwghjAqD/xVFTvLbLNmntAsFdNw4aitcs7Q
	 K/voetntIEf7RDIeXcEsNf3dkxslA03ryzvCIpt0f07aTt17OXAcX5sDMHn4GKESJHz+P
	 vDcVCBirq+cVhqAT8SRQagXEa8rMi9jTn1BWxH6b+aXOrrwceN+w10Tx9ygUqJsDOmU8M
	 4n8YSwt3X02MODJWjVGhMQ1/Nn0YB1P4EkpBibkYXjeZGwoWUkPv3aHqpei6HMCBWiNwi
	 enn51psNIyIqSVcJIPtYmXdoUEYrdLsgtqcIrwF+dTW/vgfzkXEgqqmZStciLxFV/dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YKKSBogf;
	arc=none smtp.remote-ip=209.85.217.54
Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B89A606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 16:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B89A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=YKKSBogf
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-7cc0e865dd1so1504583137.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1794931549; x=1795536349; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
        b=YKKSBogfpsOaEw7hrTWHZ+eSaB0FBHjKyn8IasdKAsTgDWDfjvGtFh+QKyhd9eN7ub
         exPwrhrKuT6LjORsHH82lqZ4CZUeXZGvFIOfzRvZV6IZds4/kHD8fD5yxbUvk4ljrWdp
         7O+qlXhxQpfXDWZycwzanxMqdFm1ezkM6IVwJaDDSCbJntYJJ2XJPh8xO3hLu8l8Lu9s
         XyWR6w1ij7RjVsBIdgza6nQt2FoeSRf00BMtZOyQ20SJIq9uF8PJQELrUmTxhi8t0l3h
         LoE9nmNF4DPCG4+DhyWlB0ipvZso6GLnNXIbrSBJxkfgvKtQNK0qkKKdAv1bwXUNmcMU
         jDEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931549; x=1795536349;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IG2RtveLbr6LLHiOkKFy7cZt2dAAYGYqRZMKbSVVxF4=;
        b=L2TUANQZRnivZHKQaWtm+5GF4XxYFL1i9BmFZzaavCMfy50iHU4l2A+6lJeGz00qPO
         V6UZT5tIq+KAbTqQjEPQ31I3HNc5diSc9t2bZ96VACW2OftRI+syPt+tCgsDCTM49Eza
         IRaV68pMUid7DGZPtw5S3yOQBp7H9ZB5mSIgRELLYAek5EYrvnPiFCiLSokrzCU2rT/X
         jLHIAL1NPhhPJVQbjAE9XMV1EaO6Kx4kR7P+ZaZQA6bOjYRnRojoFpf5csC+ifFy2CyH
         MOEHD9W8tlrLsnpeb9K2nYhmjOWq8609TLhBCq3CKBzls61uVYsZtMjd5LcxurSsb4bi
         nXLA==
X-Forwarded-Encrypted: i=1; AL+hErFeYZTTCF9ZiFZCtIllNCKPIZcPwE0yCY1ilbgIvAWq/bmYfh5iLmVxiyLvmPf2kXd8aXvqEHMhQe1KZec=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CEmKjpoTvwAkoVpHZmBdxczS92HFVliitfe5ajx9oGeFrDJeI
	joKUeYu4r2KY1gnjZMYrKDHwx9stahNnmBPEGL3gHxRjdGJ4n9vpge4ob1AHZOpplaY=
X-Gm-Gg: AYBFou2NQxkgr4XwMaq3SAqjxMT6UAiTTX7FfaMGwTFwXRm+HrdLUw9VYX1J1y+A5xv
	V9muZNLLjAm8xV+4hzdBCR6/87dcBrrDew4eeZCGz4OLPNKqaY2pDAau9O8NYH5fQnr4aoH+Mcf
	etDHHMs3TmxBD590ilbBWRInfXjFZl2yKHflIz/vbitd8pZQ51dXnPLUhXaKzKYhPh24ZJ79oKO
	bTam4kyZNjUPJMmhVH9Tr2tj8xlMnF/NrVvhHFQ2bOFhKv+xJvwAiI6bRuTigdpKv7P3CIdx8Xx
	+CCjMsrzHVwFbJsVhCUCV4uh2X4wq8vxwQdthe/thKZhL6dVHOdBlngLlCHzLFQRml8NWRtbDo5
	7XUvUblbsXUtHtINbk8LegL4K2JkYsl+wG3rWeKvBrqj9qSk71PwkpAMl6AcVgcMD5XhMTxetwG
	50yimfnCtrtMSCeHWo5WuuG4IkhQUyJYCAmL8oWEz6kRWEYdBij67kHKPR9uKjk7ZFeZoevDGq4
	1+33Ip76Esh6e4je1u7a2qm0Hu7eFrgQX1DeQM/UgbVAs/Wqxo5shnF0pyRd/hjXFRae6DO29gf
	nCpb5azKKinMSBlARufFnM3OpJ11tLtdBOxVUgGufwg8Kgr69i2XIHVOOQYcT0/ChfzVxorVVpp
	oUMkBzDRNUYza6xEpQxCEHMJZU3kNrh8=
X-Received: by 2002:a05:6102:4457:b0:7c1:8aa5:36d6 with SMTP id ada2fe7eead31-7d64d6d4a85mr3228252137.11.1794931548510;
        Tue, 17 Nov 2026 08:05:48 -0800 (PST)
Received: from localhost (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d69e023608sm2832234137.7.2026.11.17.08.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 08:05:47 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 11:05:46 -0500
Message-Id: <DMXM4P4NQ6DH.15QJ2AU95YJRT@soleen.com>
From: "Pasha Tatashin" <pasha.tatashin@soleen.com>
To: "Pratyush Yadav" <pratyush@kernel.org>
Cc: "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Alexander Graf" <graf@amazon.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 "Tarun Sahu" <tarunsahu@google.com>, "David Matlack" <dmatlack@google.com>,
 "Samiullah Khawaja" <skhawaja@google.com>, <kexec@lists.infradead.org>,
 <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: Re: [RFC PATCH 0/5] KHO map
X-Mailer: aerc 0.22.0-39-g5d7784875be2
References: <20261116134013.1636689-1-pratyush@kernel.org>
 <179486913878.127049.11178890384802388709.b4-review@b4>
 <2vxzwlqbfxtf.fsf@kernel.org> <2vxzpkw3fp2y.fsf@kernel.org>
In-Reply-To: <2vxzpkw3fp2y.fsf@kernel.org>

On Tue Nov 17, 2026 at 10:35 AM EST, Pratyush Yadav wrote:
> On Tue, Nov 17 2026, Pratyush Yadav wrote:
>
>> On Mon, Nov 16 2026, Pasha Tatashin wrote:
> [...]
>>> Instead of caller-chosen depth, the tree should grow (and shrink?)
>>> dynamically bottom-up based on the widest key.
>>>
>>> Plus, with bit 0 tagging leaf values, 2M entries can be stored directly=
=20
>>> at L1 and 1G at L2 (on 4K pages). Even for huge memfds, the pgoff space=
=20
>>> is much smaller than 64 bits, so in practice the tree stays tiny in=20
>>> depth.
>>
>> I think it is a good idea to allow dynamic depth in the ABI, but I am
>> not sure if we should deal with the automatic resizing just yet. How
>> about we start with making callers specify the depth (max index/pgoff)
>> up-front for now? The ABI stays the same, so we can add support for
>> dynamic resizing later if needed.
>>
>> The reason for this is to keep things simpler to begin with. That said,
>> I don't have a _strong_ opinion about this, so if you insist, I can add
>> dynamic resizing from the get go.
>
> I take this back. I went and looked at how xarray does it, and it is
> pretty elegant. I thought some sort of rebalancing would be needed, but
> all that is needed is to add a level above the root tree, and demote it
> to a subtree. Similarly, for pruning, the subtree at index 0 can be
> promoted if all other slots of the root are free.
>
> So I'll add dynamic sizing and reparenting logic in v2.

I agree; let's implement this properly from the start. Growing from the=20
bottom up is the right approach. I am not sure whether support for=20
shrinking is needed, so that can be added later.

--=20
Pasha

