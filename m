Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794395318;
	b=2VEarDaN2PhYztwYLTmNX2/eofe/Y5jUZYw+woagr6PjW/ZxfrgHuFIqQrX6+zRIj5Ik
	 D6BO8uWwsnE2gb9b5s7vEQiffWYsBhmsxHuT75441pWGbglokjr7M4IXVg+Wokaibyzoz
	 FA1l0JmPWjbvviRBVEN/zOH8outuMZjRxScGQzeLqbZA3ddkuZ5wHupdotCsXlYxxtoCL
	 qxxkksMOhpm+WeQQZ2XKo8YujaWd1FQSekLyIXwQdUwJUCWFZGgify63qOKsFW9unWjqL
	 I5iDBfMYR3RMX02e9bpdDJfJIDufDz9hHLRjnNy2gCvJIQm1BFo4tLGglS/+MpJt1cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794395318;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=OLROL74EjD3VCzTehjYWc0UOgzqqrJScXRl1sSLBazM=;
	b=szDmxQD/nwtOW338RZHSIdCyy3qyvlXuhYoZJ8yFhPU3gCN8/dPBx3uJUnh2CWJv1vgh
	 84XHOsUY0q5tC9M7PD8KiPsUst6I+QB4/5upVuqpLwZSHyAmQPuGZoZukJSTqT3JwmElU
	 w3z9GgXQePoB68rQ7tK/6h76pZ6L9W2la/lF3sAezipJT1XmeYw4gqWyhcLnrEA8LytBK
	 hVN5aAg8A+AjQBqK2hDq9wdPOIQ75MPDMYREQu/T23VIXIxyUZfRmwUPmUXUYQg5r6jd4
	 CRuc3hshkidZ7il2ve/q4LPsxw1Yi1DdI4OHQsiIgD4/idjZJTS1SdjaU3mTFRY2Hfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JXst8CBb;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0F1606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 11:08:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE0F1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JXst8CBb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794395316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OLROL74EjD3VCzTehjYWc0UOgzqqrJScXRl1sSLBazM=;
	b=JXst8CBb+UXfolv23rkvlKeYwkP16RqN8Uy4CCeJ+cNLFwR7HL9+WvlixveOghllZnfgE4
	CVTvgcmuBFCGjCM6WKKKtPfwT/aJAFOUeHICSBeTiUELUZJxRM/VfC6aKDmZC6VfMFtYi/
	vp84Ei/8FP1thS2QTz95wMTW8JdQkdE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-339-DcmA5LXfNU2vKTsEArGAHA-1; Wed,
 11 Nov 2026 06:08:33 -0500
X-MC-Unique: DcmA5LXfNU2vKTsEArGAHA-1
X-Mimecast-MFC-AGG-ID: DcmA5LXfNU2vKTsEArGAHA_1794395311
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A4B351800265;
	Wed, 11 Nov 2026 11:08:31 +0000 (UTC)
Received: from [100.91.101.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D736730000E8;
	Wed, 11 Nov 2026 11:08:28 +0000 (UTC)
Message-ID: <0a3f1a17-73df-4453-bc6b-8b22eaaf9215@redhat.com>
Date: Wed, 11 Nov 2026 12:08:27 +0100
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
Subject: Re: [PATCH net 2/2] dpll: report dumps interrupted by topology
 changes
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Milena Olech <milena.olech@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 "David S. Miller" <davem@davemloft.net>,
 Michal Michalik <michal.michalik@intel.com>, linux-kernel@vger.kernel.org
References: <20261105131145.1010406-1-ivecera@redhat.com>
 <20261105131145.1010406-3-ivecera@redhat.com>
 <20261110140241.422a981a@kernel.org>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <20261110140241.422a981a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

On 11/10/26 23:02, Jakub Kicinski wrote:
> On Thu,  5 Nov 2026 14:11:45 +0100 Ivan Vecera wrote:
>> Pin and device dumps release dpll_lock between parts and resume from the
>> id saved by the previous part. An object registered in between is missed
>> if its id is below that one, as is the case for an object allocated
>> before the dump started. User space gets an incomplete dump and has no
>> way to tell.
> 
> This is not really a problem, just something AI loves to complain about.
> IMO dumps must be correct only wrt unmodified objects. If we have
> objects A B C, and A and C either get registered or removed during the
> dump - whether they appear in the dump does not matter. Only B must
> appear. If the IDs are from Xarray they are usually stable, the problems
> with dump consistency mostly come when dumping a list or a hash table.
> 
> Please repost with a better commit msg if there's some list / hash table
> here that I'm not spotting. I'll take patch 1 as is.

There is none, both dumps walk an xarray, and the objects they can miss
are the ones registered or unregistered during the dump. I'll drop it.

Thanks for taking patch 1.

Ivan

