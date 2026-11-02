Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639152;
	b=jl/QNK/14BcyjsWtzjCsmeRYVVgozc+QIG54Fuooaf1LpF9DmRCZVPrlOmN1BBepAegH
	 phyaVjNpCspBAU6isZ6m+WHCIhJQys0gaeAK/aKqKJTsjg/+AtSHM6EWuxLYEtDl2uoOS
	 2P+yTXuLNShPZcWrZSkLjaJmcCcxA3peBaxzRYfJP94Ob6O+SQ6Yz0uWNqgrl5vpuiTr+
	 0qEh+0lEJp3FLuL4sD3L2NsQLVjLs2qBsznBkO+XsPF3Va+kUWWFla/yz96oQCktnh8QQ
	 uF/UtgT7hLXXN95k7Iq5nijycja0LjvxzAlitVQ0taHpWk7jrOlrks+R89Y5xe0T6Uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639152;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=XxWtK8Hu0pGGe74xzR22BgI7py7+eqstBMc6PZqmye4=;
	b=IyWlc9S4sbwSPJ9AupfNoSj6GJRX4Hmygp08rfFnOq94nJqvEYy2aEi8QoOVzDrfbsBA
	 LGvgRR2sPjQdPDXnlcMuONN7bOUwo7EDhSqJsuMocIvfjpL0Reb78UZBvJvKfAPBdQU7A
	 fZPd7C5BEOInP70TnT8Vt8flgKzEt5ARLL2MW4Hahp2dIUk0fIHOTJBTdh1FKpBWFebig
	 y5PpspCa9/UbEfPHyUlNXZ5Yq7LHoo3eiqtrZFgric22TTVjUTM19Wy+4gaHW5eqreYjZ
	 lSUzZLrgfK2KLRslQEWRsyDRjrblmKGZyQOa01+gMKuopKU4kWsYVHfKgj1NPrhfpLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=dK7y17Ox;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1658606A90C;
	Mon,  2 Nov 2026 17:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1658606A90C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=dK7y17Ox
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net D45FF40911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793639151; bh=XxWtK8Hu0pGGe74xzR22BgI7py7+eqstBMc6PZqmye4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=dK7y17OxpRt1qxGZqFnUjMGnNgYhkB6RkJzvjr8NJUGmwaFeyu2iLEFFnky//0AH5
	 l6lASLtKAtH04mUW8huVMJg+sH6VUrNzD3BuZBZCRzTIeT4HFcfNt238wMp1tx+0rD
	 Cbh1M5yWVBRbDoFalczTeKmYz9pg5VAULyr0aghnirEAVKN5AD7Xa/uLxpsilMZHR+
	 auqkXdRl9gQc2XMqKZcebyE1DZZ0gasoKZs1DVGqHFf7nhKlv49uXFzWUJYLCGDqMK
	 5fd3uZRLLFqPIzxAaNiwG1eyXQx3fpPNfoXodYlr4jK/6n4ybdkhomJ8lNLdxJbnZn
	 7+vJMrA5K7myQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id D45FF40911;
	Mon,  2 Nov 2026 17:05:50 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Carlos Bilbao (Lambda)" <carlos.bilbao@kernel.org>,
 danielmaraboo@gmail.com, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Avadhut Naik
 <avanaik92@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove bouncing reviewer for Spanish
 documentation
In-Reply-To: <20261102085916.0d1043a3895ddfad9def7e5f@linux-foundation.org>
References: <20261102022923.686974-1-carlos.bilbao@kernel.org>
 <20261101184806.11850a34e2dcfae9c3f55af9@linux-foundation.org>
 <87fqxjdy63.fsf@trenco.lwn.net>
 <20261102085916.0d1043a3895ddfad9def7e5f@linux-foundation.org>
Date: Mon, 02 Nov 2026 10:05:50 -0700
Message-ID: <87qzh3b1u9.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Andrew Morton <akpm@linux-foundation.org> writes:

>> > https://lore.kernel.org/all/20260316125324.396889-1-yazen.ghannam@amd.com/
>> >
>> > suggests a better patch.
>> 
>> I don't quite see how ...?
>
> Avadhut has a new email address @gmail.com.

...but has also never reviewed a Spanish-translation patch from any
email address.  If Avadhut explicitly asks to be reinstated as a
reviewer at the new address, we can do that, but I don't sense a lot of
interest there.

Thanks,

jon
