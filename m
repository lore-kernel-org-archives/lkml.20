Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793210340;
	b=ntUR6V0SzKPvWtTIhMIUgf6M9cuh87V29vQxcUtoglpQ1vCxsw+DQ6vxYR5WFgJ7n/DD
	 qrgQU4ahzmmoWcPdFsvyzv3Li3ZQDv8uwEuTC2kjZTHdQpwW8tgAV6AOmjMx6SlBQO2+Z
	 wpDhx5qopmJCRZoj6jBnXOe7Qt6vEOG8C8tBjMv+9vhfNgvLoCFac/kU3UR4iu8o8jOxJ
	 NMdXxIEGjGImRNm1QVNnIyidrY/UlJVLWgausYe0Awopj/U3mBCz9ITi9iwK8kSzwjHI9
	 Bg43e1VEkrZWP4v0JMm96ua6ywx1uOTnYihxeglk/Dx4P3gcIrFjK8z86jaxbPlGNeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210340;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:From:To:References:Content-Language:Autocrypt:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Scanned-By;
	bh=PJq+RO0TcAxGHMFuov6NKzPHsKO2P8O7brpxg/hbVfU=;
	b=shNlt6rqQkQEncgqDwGSwOX6AN6XsdRbv6LzMqM+Xp3kudhzimlroE0Aji3TipMKL5/h
	 5ItdHkl+fWbUN+cSYfzkPq9nbqQ/b5ua2rteXPh2bWt3t+gUsrukgEkQTSFUJiFDKkoGk
	 dVqSVhbBPSOPb1P45zJAF4YLzCpmt4Ui/s3jQFeWOOA01qZHUYJyZQEmFR70duXsna7PX
	 SMKhOCPO9WGQzBvduqoMQ3TRkvAs2a3vtwvdu7MDkItUmqqWXyCqtfzjP0NjTTuLEMim7
	 6fCMtGV0KtHWKv1dCz9ZHnxiHffrECneKhnQu58nldP/niqz851ByqBEWmzSwvVVzGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IKoUgsfP;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0200606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:58:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0200606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IKoUgsfP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793210338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PJq+RO0TcAxGHMFuov6NKzPHsKO2P8O7brpxg/hbVfU=;
	b=IKoUgsfPZeyErxCVvt+p3Cn3uNPsjQMPPgfBXtZaWMO75zsYZNsFKio+1Nwjntecw+TIZn
	qL0FV9/Bc/ilc0wRm2PoZ8W4G89qoi2mrioH0UNcfTkem92RiFYgv9lAikg8jSM64w/QJ3
	stq3RKXb9X54OEeUROCObwNR81RuE7k=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-h1TZECVYODmeCpiQcd3YFA-1; Wed,
 28 Oct 2026 13:58:49 -0400
X-MC-Unique: h1TZECVYODmeCpiQcd3YFA-1
X-Mimecast-MFC-AGG-ID: h1TZECVYODmeCpiQcd3YFA_1793210327
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A12A81955BCD;
	Wed, 28 Oct 2026 17:58:47 +0000 (UTC)
Received: from [100.90.222.41] (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id AD5BE1800495;
	Wed, 28 Oct 2026 17:58:45 +0000 (UTC)
Message-ID: <69437bf0-45fc-4701-9144-a208c12423e6@redhat.com>
Date: Wed, 28 Oct 2026 18:58:44 +0100
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
Subject: Re: [REGRESSION] KVM: x86: OVMF boot hang with SMM enabled after
 commit b3e6212dea2e ("KVM: x86: Use active memslots for the per-vCPU MMIO
 cache")
From: Paolo Bonzini <pbonzini@redhat.com>
To: Sean Christopherson <seanjc@google.com>,
 Sami Farin <lkml20261027@mifar.in>, linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@kernel.org>, kvm@vger.kernel.org,
 kimjw04271234@gmail.com, stable@vger.kernel.org
References: <2026102314-CVE-2026-99082-e5b1@gregkh>
 <20261027124140.upuow4a3kv6kssvn@m.mifar.in> <auIy4UZMGxLhBCAn@google.com>
 <d4214249-5ec0-4600-91be-13632b180425@redhat.com>
Content-Language: en-US
Autocrypt: addr=pbonzini@redhat.com; keydata=
 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
In-Reply-To: <d4214249-5ec0-4600-91be-13632b180425@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

On 10/28/26 18:48, Paolo Bonzini wrote:
> On 10/28/26 18:37, Sean Christopherson wrote:
>>> However, address space 0 and address space 1 maintain separate 
> generation counters
>>> starting from 0.
> 
> This is also incorrect:
> 
>          for (i = 0; i < kvm_arch_nr_memslot_as_ids(kvm); i++) {
>                  for (j = 0; j < 2; j++) {
>                          slots = &kvm->__memslots[i][j];
> 
>                          atomic_long_set(&slots->last_used_slot, 
> (unsigned long)NULL);
>                          slots->hva_tree = RB_ROOT_CACHED;
>                          slots->gfn_tree = RB_ROOT;
>                          hash_init(slots->id_hash);
>                          slots->node_idx = j;
> 
>                          /* Generations must be different for each 
> address space. */
>                          slots->generation = i;
>                  }
> 
> 
>>>          An MMIO access cached in SMM (e.g., GFN 0xFED40000 with gen 
>>> = 4) matches in normal mode where gen is also 4.
>> Hmm, this isn't adding up for me.  It should be impossible for the 
>> generation to
>> be '4' for SMM, because SMM is supposed to use odd-numbered 
>> generations.  From
>> kvm_swap_active_memslots():
> 
> vcpu_cache_mmio_info() does not use the address space id:
> 
>          u64 gen = kvm_memslots(vcpu->kvm)->generation;
> 
> Will send a patch soon.
Nevermind, wrong tree - I was reinventing the (apparently buggy) commit 
because it's past 7.3.0-rc7... still looking.

Paolo

