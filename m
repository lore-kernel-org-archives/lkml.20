Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685993;
	b=zL2bNWfSlOWB9YuOie/fzinxAvSwZsLv8CuKwSQuES3fHNnKzyk00ZsLjKELR63WWvzl
	 yWCjr0c0CqdY8rw/bG65wPyA3o65+ds/w4McjAMCI05HsqtFoKf598rMhwtlDQ6TxvwoE
	 xbSQwKggX1JfyEIWjcTitNzroY9QS7j/HDywf84phD9qkL//+zAMdyM6QeRQDP3hRsLxD
	 xpmYjUFb2o/OUkuNayrljBEOjwQMBNdIeQzOPLm0IJG/9MQDHT436AukOQL3pR65MHVei
	 nHPBY9UQeGMjVO1jBiyqIU7LbMFieFtM5kUGmRgoj18hMTA7fEXmaqR1vaaCdFweg1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685993;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=+OIAQk3Za1k/OmM22e/vZ/85baJ7TqcBx/dUHxwFUHk=;
	b=P6AU3t+quFqWY2FymiudKtpBVlwAp7p5beUtmA9TkhbquJ1S6oKzpC1g1OeJaOgrpcx1
	 kLGDEweEAxLPHJncJ9bFDZLQA42x4BAgP0geVcHAtHEqSfYRGNvPIji1DKygw3KDP/CDV
	 9r6USW9/lbKr8KCASQI09wyH0HXK72MI7slvmuElIas1hc08lASjdjZprTYgotgb0eDbI
	 1BNZrH7zzz9oS5xs4XNoMKHdHJm+mrVfDLrNQoc6ZfTsqT2bBYdFtKyZpXNWpu2J6LpGz
	 xQzDhQHq63sdRmMOyUUY1cu6VEqn2YJ+X0EvSbtVNPgE+0RedL5TWwBkYoUMD7g8bhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XUStjWpM;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93738606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 16:19:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93738606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XUStjWpM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792685991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+OIAQk3Za1k/OmM22e/vZ/85baJ7TqcBx/dUHxwFUHk=;
	b=XUStjWpM7OeYctDvQD7qiiPJJ3OJWkMyj8UlYT9RB/3NgOSCFeYmEzvQAMtw3sZaVHzBnT
	O7IAmqBCQh7q4JuRLTsYUg2P2YapORJjO23vxZc0DdWoap4UCVETwKR8m72Qeq73Fwndin
	00uAtHPTtm4WgKkYyRdhW/fJJh95KAk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-374-J7ACjSg2O-Oc2aoX5WKI9g-1; Thu,
 22 Oct 2026 12:19:43 -0400
X-MC-Unique: J7ACjSg2O-Oc2aoX5WKI9g-1
X-Mimecast-MFC-AGG-ID: J7ACjSg2O-Oc2aoX5WKI9g_1792685982
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A28351955F3C;
	Thu, 22 Oct 2026 16:19:41 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E9E6C180057F;
	Thu, 22 Oct 2026 16:19:39 +0000 (UTC)
Message-ID: <ac570c76-5677-4058-94c0-2eb9540526eb@redhat.com>
Date: Thu, 22 Oct 2026 12:19:38 -0400
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
Subject: Re: [PATCH-next 1/6] cgroup/cpuset: Find furthest isolated ancestor
 for invalidated isolated partition
To: Guopeng Zhang <guopeng.zhang@linux.dev>,
 Ridong Chen <ridong.chen@linux.dev>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20261022031643.1351877-1-longman@redhat.com>
 <20261022031643.1351877-2-longman@redhat.com>
 <f22f4cdf-eebe-437a-8b3a-5f98aa0df5a8@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <f22f4cdf-eebe-437a-8b3a-5f98aa0df5a8@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

On 10/22/26 9:25 AM, Guopeng Zhang wrote:
>
> 在 2026/10/22 11:16, Waiman Long 写道:
>> Commit 46b885416c27 ("cgroup/cpuset: Fix a missing isolated_cpus
>> update in update_cpumasks_hier()") searches for the closet partition
>> root ancestor to determine if the isolated CPUs in a to be invalidated
>> isolation partition should be removed from isolated_cpus or not.
>>
>> As reported by sashiko, this method may not work when there is a deeply
>> nested isolated partition hierarchy. For instance, Consider a nested
>> hierarchy A0 -> A1 -> A2 -> A3 where all four are PRS_ISOLATED:
>>
>>    A0: effective_xcpus = 0-4
>>    A1: effective_xcpus = 1-4
>>    A2: effective_xcpus = 2-4
>>    A3: effective_xcpus = 3-4
>>
>> When A1 shrinks its exclusive_cpus from 1-4 to 1-2, A2 will update it
>> effective_xcpus to 2. A3 will find its closet partition root ancestor
>> A2 and decides that its effective_xcpus 3-4 should be removed from
>> isolated_cpus which is incorrect.
>>
>> Address this corner case by searching for the furthest isolated partition
>> root ancestor instead to decide if its isolated CPUs should be returned
>> to isolated_cpus.
>>
> This looks good to me. Would it be worth adding a test case for the
> scenario described above, something like:
>
>      # A middle isolated parent shrunk below coverage: the released
>      # CPUs of the invalidated child stay isolated as a higher
>      # ancestor still covers them.
>      " CX0-4:P2 CX2-4:P2 CX3-4:P2 .      .      X2     .      .     0 A1:0-1,3-4|A2:2|A3:2 A1:P2|A2:P2|A3:P-2 0-4"
>
> Reviewed-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
> Tested-by: Guopeng Zhang <zhangguopeng@kylinos.cn>
>
> Thanks,
> Guopeng

Thanks for the review. This patch fixes a specific problem reported by 
sashiko. However, there are other pre-existing problem that will still 
fail test case that you have proposed above. Patches 2 & 3 of this 
series are there to address the other existing problems so that test 
cases like what you have proposed above will work. The first test case 
added in patch 2 was to test this though it is somewhat different from 
yours. I don't add any test case to patch 1 because I don't want to 
break bisection. I can add your test case in patch 2 though.

Cheers,
Longman

