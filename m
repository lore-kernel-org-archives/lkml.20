Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841963;
	b=1yDoIAck/pH5vWcIFDEQiEdXWquRv8zdECqgnmCRT70O6StG1pka9Gq22ILGGunXqs0W
	 KJWUCCtr3KMv5EmhGO33PmvVZz0atiUvec2fhcb4ejYNmmm1QxbVY4ScDd8D1LLnW4k8j
	 hFXfJtSkcd3KXOmEUjsw9lsG9BknrssWXgPenwrd9wSD7Y5JsryLb97FlXjPfl0+BP/Dh
	 Yuyt7PnDI5SJ8SdxRjydUkG9lYuV/yY372pq9KkzQIW8GsH9GPtlMWWfsHePLN4GBe7bf
	 ZP0Q5OQfTvGQU0Y07nTBvR7qkxUJBGiNij5svErVYYggX13QtoOj5RuLywbAK5u53WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wJmfnRvLC1EfEtRsVvAyQqePX9S5Xn9AJOFw7AAvahE=;
	b=5Sd7rwrsnWO1b4MDnW+aQ/wF9odQv8J2DfwcrObe98a2btaZeCkDHcKL86ADseyHRLEh
	 vpqFF9OOnSKLL2wnXezevn82+Lpj0X835APLTe5007e8BGOCCkubsvNbnIm3PwbByOc8W
	 xbBndJ06pwBAJIqU06apXeZukGqzWS0DfdTQl109EFsyQCqaUhJ4iqrQ4g0CGE6ULym/w
	 E/1pP4X02ZsCFPU0HWzO+ng8Jr+6bT1rXi6cQZ8V2q12St3FipwQPg/iNM0VJqOzkm5YA
	 SrEEWcXTepimHdWi2aO/Y4o6DUCWfQIW+NL74mhs1yAFQo1eL0B0IGVmYr/MmTu4mxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URcG2K+V;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A0AE606A32C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 01:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A0AE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=URcG2K+V
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-353804b591eso2584574eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 17:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841962; x=1794446762; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJmfnRvLC1EfEtRsVvAyQqePX9S5Xn9AJOFw7AAvahE=;
        b=URcG2K+VISfVk77nz9AxluxAo+6zOOU5BLm6U+wbfBxbJBSZ9mhRID6K3Fe0vr1dTt
         bGpBFinlx4Fc5TEHebUr8BZPeWqVY0zBtfX9rqHnjIm9pE4F2ziLMJM1XWxCuSr1C3qb
         f4L1Aa64IMK7FZvtc8jzMRmlnPm2EMmLMEYFxSv0JF8da0G822EL9BzvSYEuzrO1wUXJ
         kRZBhx4aamC84qem21tXx9NXtbhTj8quUvNkKgtFAFtFFE8LxVeolmqjDKwgy65fFeIw
         ObC7n755oIQJ4fh9m0/sbvXXl5S9+XBzr4mvMlUfH/+ELdadHjY9YNbKyFTruYEp++jR
         to4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841962; x=1794446762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wJmfnRvLC1EfEtRsVvAyQqePX9S5Xn9AJOFw7AAvahE=;
        b=Z/y7O8ufzU/XSGp7+1AcyPotr4fNMXvbSjlBrQEvlljGpZuJ/1bmezbuNC89uxPdoU
         3F634tpmrK46XhhKAHX0bIIi42z0TKV871HXwiYlTN7jXNlDZSmqqUtRfnb2BrY8rZ2n
         LvFCNfjScDPBe6pBIFGgOILOYILv31PHW3m+UpyOZzT+HNKT39TlOf4IaObWv0Mdyg9H
         FoeDgkJHXQNqDHtiCWYCtxLNUP59jcpgC1N1FEOcMstq2FqkX1Mg/Os6gteKR8ZV1qI8
         YNaFkiZpOLXuVHq3PGhnJD8P2nDgM9kg85z975NpvuVvp7UjxVyvFJltc5KCWUloewY8
         1+3g==
X-Forwarded-Encrypted: i=1; AKwUvBzImItY2ThccvGChsFWx9fBZwhb+o1RGjmTxbzdfQVcwp82ErlqBVWoNjwuiOx3//GDRljzbmL1ZMO+mtM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+OnuyCvMxnGQ6QT5qGqkpwrv/9Evmwtmk40Ple8z5NuntdrjIj
	Go5TOV7in21afK/n6XRsKj3HEuAFhYYe3guUeOfSixtXTh/spUIhJnu8
X-Gm-Gg: AYBFou1LvTfJ+K9mETlEIhDo4xm50iSwxsCZMEorlNT4+c637T5O+qcvuWGgQ/pwJrw
	23URjrg2DPBJ+fveVchWyyNfgC3WcUpLxJCG3iu/9v/n28zufno6uWXGPrCb2OrYAH8pq0+8+b4
	MJo80rKf7LWhyem3hkTLrWkuqE+DVEJOFt6KPhx0EyJNTfcwb8W49P8ABLDgjFjN1stRIS1A7we
	CwMiXoWsgmL0qDZRbJA+11rvPXE2MhsVG22Ahk47Nx7HhFfm/VXrBVz+6aA6mUn/XDt/LJwlZX+
	i9yNbsLoTTHCRF0wOV98bACP2AywKg+JJtpNX3TVTyirBJMjAATMviq4+AuB6CcRYO+6KR9+mBT
	UiW96OLVesl2qJx1m0MeMX8bYoNfbvJ707fVPKbdWcO+zE2rwq+IVO7PeaAB0hUy8z0zblzuc2j
	NdoYugtuRfyfcLmxNioYBYp3Icpoiq/giuIcRlSrqNm9j5Var+qKh7bodoYWErV4uaam/lFP169
	8yExEhpa2CehVaMaSrSnGe4IacjkJ019HjTrcE+srzfHjrJhwRPpK+Cq/tKqmg9VgOLlWCHJ9dS
	MoNqsepuzbbr4xtQKu6x
X-Received: by 2002:a05:7023:d0b:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1ac5de53bbdmr27814824c88.41.1793841961963;
        Wed, 04 Nov 2026 17:26:01 -0800 (PST)
Received: from ubuntu.. ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245b8822fsm13868493c88.2.2026.11.04.17.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:26:01 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
	Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Sagi Grimberg <sagi@grimberg.me>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Josh Triplett <josh@joshtriplett.org>,
	=?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] srcu: Add list_splice_init_srcu()
Date: Wed,  4 Nov 2026 20:25:56 -0500
Message-ID: <20261105012556.634691-1-odys.yuan@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <9f8c94ff-29e3-4ea5-b9ec-b04b2bc21b1c@paulmck-laptop>
References: <20261104-bug-nvme-remove-ns-srcu-v2-0-feb64ecb96ca@gmail.com> <20261104-bug-nvme-remove-ns-srcu-v2-1-feb64ecb96ca@gmail.com> <9f8c94ff-29e3-4ea5-b9ec-b04b2bc21b1c@paulmck-laptop>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 09:14:12AM -0800, Paul E. McKenney wrote:
> I am not inalterably opposed to adding a list_splice_init_srcu(),
> especially if quite a few more users show up, but here is what I was
> expecting people to do:
>
> 	static void synchronize_my_srcu(void)
> 	{
> 		synchronize_srcu(&my_srcu);
> 	}
>
> 	...
>
> 	list_splice_init_rcu(l, h, synchronize_my_srcu);
>
> We need at least six uses of the above idiom to break even on the line
> of code required for introducing a list_splice_init_srcu().

Christoph, as Paul would rather not add a helper for a single user, and
the idiom above doesn't fit nvme's per-controller srcu_struct, would you
be fine with taking v1, which open-codes the splice in
nvme_remove_namespaces()?

  https://lore.kernel.org/r/20261103-bug-nvme-remove-ns-srcu-v1-1-e239087d63ac@gmail.com

It fixes a crash and is meant for stable: a reader in nvme_wait_freeze()
can walk onto the on-stack list head and use stack memory as a struct
nvme_ns, which KASAN reports as a stack-out-of-bounds read, followed by
a page fault. A shared helper can follow if more SRCU users of
list_splice_init_rcu() show up.

Thanks,
Qiliang
