Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.97.179.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642478;
	b=cpiZ2813bX1yG9UfJ3zoKEkfasIMfn4EBGz3s0BT9nCawIlUoP+yW5TDFm4c6n5mhUoM
	 kqNda3GTm1VIVGnVzIvIjHtN1VSHoU9j8J31GGLnGInJAdD789Rv7HHO129QREp9awRx5
	 S66mMa+1oN9zlUF567gJ++s/QfDhszNcGVLdUg0Z/Jl6sHuUzPs+eKGh1Sg/K5EowFHs/
	 +XcoZ5Hxkm5QjxZM6wleAFH96pnpsSvL/Y4Pw0e4M5oD3ADbQFhHdnfBkZMGiVOy+TzyR
	 XL3B2HjB9aZ+wuh6YlfKCUyrqaCkCmTn2MbT0yybtjEkkcDRa3tHn81t4UP5bMvpf1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642478;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=rsoXzBeHz6VZLGtk/wZzqQf/KgxPznedob+STUPBrcA=;
	b=Jskbj62BymN+IE1pkopLFhb1R/wG5E7PVhVCq2kUhPaj6EuyWCy38WezPYaxf7Xs7HK3
	 686eT02TQDmOUkymX5aIQFUlueZ73dHpNDi49517ZWcrZMTdd2aDifHBmmA8WmT9ZLpM2
	 M57cyPf+9tbcttMJcPEQ3fKlKsn9ZpUuE4UjJ+LOZ/JYp7sLU5X92aoERPAFpqFGRMeKQ
	 ijO14ncAXHWVn7HSKBaksDfUCS2cczIpRzDvse4pKEhwBsMFF9riJDqxCBpsiGXXuyYbV
	 MkIqtEyXv01udTC9xdThHq4pfGCM2rYmJQE//hLJTcaJJXvWaPOLGFfbtTUPWFu3H3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=igalia.com;
	spf=pass smtp.mailfrom=igalia.com;
	dkim=pass header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=i0OYkWxN;
	arc=none smtp.remote-ip=213.97.179.56
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC06606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DC06606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=i0OYkWxN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:From:Cc:To:Subject:
	MIME-Version:Date:Message-ID:From:Reply-To;
	bh=rsoXzBeHz6VZLGtk/wZzqQf/KgxPznedob+STUPBrcA=; t=1793642476; x=2109002476; 
	b=i0OYkWxNSZNRO8/tabkcJPC99+qaVLr/BZ4srXS//aSxql67RQ566ak4RrVfX1Nydc+CxZHwzYV
	QwPhQajLWn0QOgDwMI6QaO8xvgUp9G3r1NXSL07rVutSVfDvq4cGkdrUt1YJUoPSO+pNyImlEoXot
	zFxjEvx3u2XB2iLOERgLC131BAL8lw38aWPv7Tyt8dL8JzyDd7MQSMy8E8pWd44UoJ7mkaTdNX+BY
	y5emuGx4xR08O26pQtvLKRU26yd+xeFYJPxBIohppWXKcMoYw5E+knqMSx4iB/B5mjxhYFxm5ooKh
	mW9fbMy/58oOl5E8jRfwffp7ujy41RRkXcRg==;
Received: from [81.79.79.1] (helo=[192.168.0.116])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1xNwLH-000NsV-GX; Mon, 02 Nov 2026 19:01:11 +0100
Message-ID: <ab160c52-1645-4ec9-9ea2-5b8bc36d9284@igalia.com>
Date: Mon, 2 Nov 2026 18:01:10 +0000
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
Subject: Re: [PATCH v7 2/4] workqueue: Separate sysfs mutable vs immutable wq
 attribute sanitizing
To: Tejun Heo <tj@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 Bradley Morgan <include@grrlz.net>, Chia-I Wu <olv@google.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Matthew Brost <matthew.brost@intel.com>,
 Steven Price <steven.price@arm.com>, Lai Jiangshan <jiangshanlai@gmail.com>,
 Breno Leitao <leitao@debian.org>
References: <20261022093848.5727-1-tvrtko.ursulin@igalia.com>
 <20261022093848.5727-3-tvrtko.ursulin@igalia.com>
 <91711e517792f2e607258d75b633898e@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <91711e517792f2e607258d75b633898e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 23/10/2026 22:28, Tejun Heo wrote:
> Hello, Tvrtko.
> 
> On Thu, Oct 22, 2026 at 10:38:46AM +0100, Tvrtko Ursulin wrote:
>> +/* Sanitize attributes not modifiable via sysfs. */
>> +static void
>> +sanitize_immutable_workqueue_attrs(struct workqueue_struct *wq,
>> +				   struct workqueue_attrs *attrs)
>> ...
>> +/* Sanitize attributes modifiable via sysfs. */
>> +static void
>> +sanitize_mutable_workqueue_attrs(struct workqueue_struct *wq,
>> +				 struct workqueue_attrs *attrs)
>> ...
>> +static void
>> +sanitize_workqueue_attrs(struct workqueue_struct *wq,
>> +				 struct workqueue_attrs *attrs)
>> +{
>> +	sanitize_immutable_workqueue_attrs(wq, attrs);
>> +	sanitize_mutable_workqueue_attrs(wq, attrs);
>> +}
> 
> The three helpers seem a bit excessive for what they do, and the
> immutable call in sanitize_workqueue_attrs() is redundant, as
> apply_wqattrs_prepare() runs sanitize_immutable_workqueue_attrs() on
> both of its copies anyway.

Okay I dropped sanitize_workqueue_attrs() locally. I was trying to 
express the logic behind mutable and immutable, which also leads me to...

> Could the comment on sanitize_immutable_workqueue_attrs() state the
> contract? These attrs follow from the workqueue flags and are enforced
> on every apply, apply_workqueue_attrs() callers included, not only
> sysfs.

...the topic of what would be the best commentary for both.

Would these comments work:

/*
  * Sanitize attributes derived from the workqueue flags and which need 
to be
  * enforced on every attribute application.
  */
static void
sanitize_immutable_workqueue_attrs(struct workqueue_struct *wq,
				   struct workqueue_attrs *attrs)
{
	if (wq->flags & __WQ_ORDERED)
		attrs->ordered = true;
}

/*
  * Sanitize attributes derived from the workqueue flags and which need 
to be
  * enforced only on workqueue creation.
  */
static void
sanitize_mutable_workqueue_attrs(struct workqueue_struct *wq,
				 struct workqueue_attrs *attrs)
{
	if (wq->flags & WQ_HIGHPRI)
		attrs->nice = HIGHPRI_NICE_LEVEL;
}

Regards,

Tvrtko

