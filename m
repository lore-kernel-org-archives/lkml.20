Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794235310;
	b=X0Ov/PbIutztPC1gzoLAOmvjIKWZ96Qp7UG+Qz7t/Z0S9qQZdkUcgglc9EGt70ufdoSy
	 LcI9DyJoHgzVppIPfgnQcqL/t8K4u/Bfy5B8gJSbZzSUPw3hC7XD2oZl7QWq6TlyHKCC4
	 t+YWfpbEga7vWbiZoreHoQ2lJm88LF0Q4LSx18dJskOQgtkJVkePtBz3nDySKUG5FJAgw
	 AFRT4Zsv4np1OdTaBwleQA3o4yf7jge1gk+s/IaN53+d9L/8Vz+lKE1TSkFOq8aDp39gG
	 uAZ0fgN10eMgcfFVNHDumjLO0h59rv1PPOdQg0e7aijI22XFYLP+4Vj/rSyHbBIjG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794235310;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=3DmiQTkcDrfvNKdokvdjGTmMgiq//nGrn6FpXJ0M9ek=;
	b=1AdtAyMBjm+XNRe2I7FDOnwU9bHrT8guu6/n91E2ME1RkIb8WRouuvT7oNW1j+IzkI7V
	 PKscT3dAa9MXcMn2xDDRE91d3+1O43E/++ua7GSosReqnmnATvAb0moD9IWlPcmMzw4Sh
	 Uj4B6fkBupeoLhRffBRFyG5wzf8IgfDYnmM6K8rEJi9ZPihIOVp8wD33mWRw3zKRxX56/
	 RqBdM9lvCuvtoyXrf/B4W06O3o0XSLG+EMMyGkeRbMp5VG9wch9bZVIvRjrWT+6h1d9Ee
	 mIX2r1dkjffnq1fbiEw02lbFXZ7Q8wXJJvtev5XGnp/Wo3rrTU6rtWNUivRnVaKbRKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OKe59Su1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6B0606A31C
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:41:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A6B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OKe59Su1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794235308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3DmiQTkcDrfvNKdokvdjGTmMgiq//nGrn6FpXJ0M9ek=;
	b=OKe59Su1Fw+z+8FPrRBR0Ph2+rC4GYspzkTCiBqfi2wG6G/YRXY9HuMD4NjaRdzZDNPXgh
	7Luoi52MTu3NVcREQXQc37rJq4+gUXetN9KV2D+9lO9Dh0/4ZnF3OAGSob/mL18mLs7ux+
	lGuBiVhyWeWa+GNMftZJ7TDm4kpphcg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-426-8PhPwMfTO4yn30hLTk4k0g-1; Mon,
 09 Nov 2026 09:41:47 -0500
X-MC-Unique: 8PhPwMfTO4yn30hLTk4k0g-1
X-Mimecast-MFC-AGG-ID: 8PhPwMfTO4yn30hLTk4k0g_1794235304
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A035B1955E89;
	Mon,  9 Nov 2026 14:41:43 +0000 (UTC)
Received: from [100.91.18.181] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8DFFB1956089;
	Mon,  9 Nov 2026 14:41:41 +0000 (UTC)
Message-ID: <e575df2d-71dd-4844-83b7-d29bed349992@redhat.com>
Date: Mon, 9 Nov 2026 09:41:40 -0500
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
Subject: Re: [PATCH v2 1/3] cgroup/cpuset: Reject updates that empty the top
 sched domain
To: Guopeng Zhang <guopeng.zhang@linux.dev>, tj@kernel.org,
 ridong.chen@linux.dev
Cc: hannes@cmpxchg.org, mkoutny@suse.com, shuah@kernel.org,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, Guopeng Zhang <zhangguopeng@kylinos.cn>
References: <20261105130344.664336-1-guopeng.zhang@linux.dev>
 <20261105130344.664336-2-guopeng.zhang@linux.dev>
 <ccdab485-e1d1-4055-bb0b-f8f712fc0a9b@redhat.com>
 <0ae6fffe-d492-4e85-b464-fafdc4c2b064@linux.dev>
Content-Language: en-US
From: Waiman Long <longman@redhat.com>
In-Reply-To: <0ae6fffe-d492-4e85-b464-fafdc4c2b064@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

On 11/8/26 11:42 PM, Guopeng Zhang wrote:
>> Could you also put this new test matrix together with the other test matrices?
>>
> I'm not quite sure what you mean here. In v2, the new matrix is between
> ISOLCPUS_TEST_MATRIX and NOHZ_FULL_TEST_MATRIX. Do you mean moving its
> definition elsewhere, or merging its test cases into an existing
> matrix?

Sorry, forget what I said here. I have misread the context of the hunk.

Cheers,
Longman

