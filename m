Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6025F3988F1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 03:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011630; cv=none; b=ctvqd2FlmUi5CxY3f22dHoh1QlVobdrEW6cABRVyD0nYnXGSoBx4XdUKZv/9CCNKiVknxZXwMvGDidCLZ9gSaxe/4pG85Bw8BNYn5zTr6u6Gws8M+5yuyL6+1/jbHIwef8bkyBqLBY/zf7CsbEssBbPEu2QW5P4rhLnuwWmHwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011630; c=relaxed/simple;
	bh=IkdLP5CMbNSeQcg1JlhjuFap/uVykSyWKF1wsJxcwHM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nw8cN6FJLzhvSoFUjHpR8/om92tfdA+MLqpbMbWxJ/2HvlFhvZtV7qcdUCY29rWOK8ab5pvN2bMXVyjhgp5eNDuIWSuwWEFKMV7JEiHKNuHpkTMS212TTIoUAXA2EWf9t4tObXxVrtZbeNJZu9hmvIG+rvuOWAwKbSxFHvvkNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B3wA25bG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=o51vr7Od; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B3wA25bG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="o51vr7Od"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789011627;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/RRjDlW0kox/juFkyRROqpQ/BAv5W8k8xAzyOIl9/BY=;
	b=B3wA25bGRXZXo6hDq6wCnlc2+RHoh+wEUUUmuU6R6mXnetdmip26ey0qNC/HEAg6c90Ppj
	yil/G4hP7YUrvh5PJ7zb5YPlcdH+cp0QU7M1S7IwQq8IjqpAEsEHb13Ex0WWoS0RIIipZx
	38nhAy9u9j7KmlQhFgyArDC6HUfTAEU=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-oqCcbLiyODWOQYOhVjndqA-1; Wed, 09 Sep 2026 23:40:24 -0400
X-MC-Unique: oqCcbLiyODWOQYOhVjndqA-1
X-Mimecast-MFC-AGG-ID: oqCcbLiyODWOQYOhVjndqA_1789011623
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4216aee8fso8907148a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 20:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789011623; x=1789616423; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/RRjDlW0kox/juFkyRROqpQ/BAv5W8k8xAzyOIl9/BY=;
        b=o51vr7OdvZcBS2BC9Izn1VxAx/e2BqwFxUP275616y3oLfxhmQmJcBydgbg7aYuN3Z
         HAtM5d/vqrXCAuF+8ZsB3cq/E+g1Mgr/b2Mc54VwIKZJ7B5hQELjm52n4CGHplVXv5pF
         jbo3VRD6mfx4KH958Qrr50uqkpNcWtN6thMulAF+a0Tlr9rvObJjNA73oaZG0w+e0wWo
         XCkXNFbcwncu87O+j86gf3ut6+fjF53QChPFSv493Mcw0qSvVzBPpZIsXjFB6Ajye1uQ
         B/cBz2hG/7/z3u6OUWLFBMJNFfUWhQnm6/uMr2mcpuxY5nuyjUc2H7LvNNuA+Y5pvC/9
         LG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789011623; x=1789616423;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/RRjDlW0kox/juFkyRROqpQ/BAv5W8k8xAzyOIl9/BY=;
        b=dIOaRKVPOaIGrwm01+ZJK6zsB6GYnYNgEFhXhK5i/2ac3+r6xSP3gC/GT6+wVSnL+d
         QeQoHWoypBY4SyJtdtc98f0IRURw3XKtEnJpSyXv/SQnv1Ls+zvU6iCFBygXsl/MAX1L
         N/R1u6lFKrsd6UC0YJukCq1dXzW5pU9+xo1atVY9i7smoG5fhN4/L4oeI0EqYEAFrHf1
         a3CFRTF9tmHSZF4M6piGKh9R8/2P+ocVsS9PhRFiKgCOTA9mwjDq6PHdIvaNgs1GtJW8
         0NDoOkmHnfDHgrwIPYl7cM0M/TzGxP71MJZ5ef2ZX7yZIpoKRo9TE7FPzW4YyCrYHiEP
         mEXw==
X-Forwarded-Encrypted: i=1; AKwUvBwCcWeqV6ejRT8UVdN3uP8AiDVWFP6ba8pHMKZZX7251KsXiL7r0AOE8Aa2Jt2T3j4Arc97DZgzcPQplIw=@vger.kernel.org
X-Gm-Message-State: AFuF++n/SCIPsku94Vmdjq4QeEVOR+Y82id3kZNR6oZEzaAHpE5Xildd
	ck/xARI7s7mXdmMVRFwu8vN1glR1pa6khuC3YnfTYlzEgbKRT4X/la9noApyqkrc4PuMAgMFZ0O
	XDb2L3ZxzjplzRNjEcVh8k0AyjKFO0RabNFzehLePG3f92h184K4VFtmBokNlL/Vbow==
X-Gm-Gg: AYBFou2xRao6tKh+2Xw/twuuqmRUHVusnCZN2e0qlN2RRfwC0a11E8/MGI+5xW0B9CX
	VwQhJyz4pjBivgFGHkQgqDwTAFmPyXIK2IBo8lSYaaEX46hyGPi9qVVmTjP3zKt6Q96EI7tJh9n
	djeahZuf8gRtjURRu3H3gIaSlbdvVY4NeP3J7/qu9dz6pYWjzUn3CW6l+Xi86lRTKHlriYdhNNw
	R9rpRbINeuwKmadU1romSTDifSIQEnq32Z2xU3juJNwtKJxWr3ar6R7kipz9ziknVoss+YzWzIx
	LhWTQ/AL1wDBJeaxQHhUMjkncZvSmTce+Ya3W+/fkJAiQrC6ugQHEFXDIzp+2olD9t+85EqX5u2
	7Qr3eEFeNqO00wG+rFGQrR4OoMXbreRh7ww+qv73SVw==
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dacbeed903mr8426015637.14.1789011622911;
        Wed, 09 Sep 2026 20:40:22 -0700 (PDT)
X-Received: by 2002:a05:6300:85:b0:398:8870:b58f with SMTP id adf61e73a8af0-3dacbeed903mr8425945637.14.1789011622523;
        Wed, 09 Sep 2026 20:40:22 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4aa39f605sm1053235a12.21.2026.09.09.20.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 20:40:22 -0700 (PDT)
Message-ID: <f24104a3-fe2a-4a71-acbc-a4c3d2d416d7@redhat.com>
Date: Thu, 10 Sep 2026 13:40:10 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 02/20] KVM: arm64: Avoid including linux/kvm_host.h in
 kvm_pgtable.h
To: Suzuki K Poulose <suzuki.poulose@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: maz@kernel.org, will@kernel.org, catalin.marinas@arm.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 steven.price@arm.com, aneesh.kumar@kernel.org, oupton@kernel.org,
 joey.gouly@arm.com, tabba@google.com, yuzenghui@huawei.com,
 linux-coco@lists.linux.dev, gankulkarni@os.amperecomputing.com,
 sdonthineni@nvidia.com, alpergun@google.com, fj0570is@fujitsu.com,
 WeiLin.Chang@arm.com, lpieralisi@kernel.org, enju.kohei@fujitsu.com
References: <20260908162223.1683432-1-suzuki.poulose@arm.com>
 <20260908162223.1683432-3-suzuki.poulose@arm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20260908162223.1683432-3-suzuki.poulose@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/9/26 2:22 AM, Suzuki K Poulose wrote:
> From: Steven Price <steven.price@arm.com>
> 
> To avoid future include cycles, drop the linux/kvm_host.h include in
> kvm_pgtable.h and include the lightweight headers required for the types
> and inline helpers used there. Additionally provide a forward
> declaration for struct kvm_s2_mmu as it's only used as a pointer in this
> file.
> 
> Both pgtable.c and kvm_pkvm.h relied on the indirect inclusion of
> kvm_host.h, so make that explicit.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch in v13
> ---
>   arch/arm64/include/asm/kvm_pgtable.h | 6 +++++-
>   arch/arm64/include/asm/kvm_pkvm.h    | 2 +-
>   arch/arm64/kvm/hyp/pgtable.c         | 1 +
>   3 files changed, 7 insertions(+), 2 deletions(-)
> 
Reviewed-by: Gavin Shan <gshan@redhat.com>

