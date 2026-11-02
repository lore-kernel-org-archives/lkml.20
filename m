Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793634463;
	b=NDVM969uwrk+SIBkdbGowMbJ9/Oq7HwrK06RzkMWYRRfEtn6U7tQl4k6tGtE/06tOCn6
	 lUA6jUGb7l5qBiBNjV6jiA6mPho9LTCClLWDqJpE4kvOwXMbB7glbtwEsX54PEXppkJ57
	 EIwNSi3FhBqCM0q89h5XC0lD9QnpUFwXutSTGx/TuYHso1NrNZS76b4OQCFweCYa2KQlu
	 0r55dzgi+h1kQn5WawTyGTJ4HyLGlyuddoXgQYYVAhv+1TLfYrwZg8enoWarLfP10g9YQ
	 VBtgmf0niFO80EkEgAwPZ214+ZETDxD9eKfbETbJCblohTuwoLjcfHfnAprVwOV42og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793634463;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=nbfS6ZNL2LYDjK/5nIkKSih611pJBY2CJhkbIyzDuj8=;
	b=Z9bFBJ2Eqy9l0ZSCD9ZHVxm5aYU5qY6ldtE6g7Xdy6ZMLM/SWXywG+EuHr2XZtCz6UmS
	 gG/v9t7p83Pbv6s6ilLU4wecPbU5UkdFaOZliPjBHUTgI8zTc7YLG9ybXWqpHWMQ0P6sO
	 d4WMJsnPi8RAry7wfTu/Cx81OCSvs60tGMyQ9VUOP7z2O6+j2h5IrpLutueEm9D3OUHUA
	 +PBlqtjmMfLL3obT1Li9T0GdYjB06zVmK2eNwD6kIfR/dtbkIiHLoKIGSOhNagI9c8of4
	 fhp/DIkzLtNnt3USxsUx33uhDm/g+1xLqPfJzId3NNtk5TgKcs6P5JoT+uS1JliO9bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=tiHKqoj0;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7217607467A;
	Mon,  2 Nov 2026 15:47:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C7217607467A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=tiHKqoj0
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AB73940917
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793634461; bh=nbfS6ZNL2LYDjK/5nIkKSih611pJBY2CJhkbIyzDuj8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tiHKqoj0n/hf4IV3dVFgwZvMIDU72hT4y8j7C5/wBcO0LTHTP1L5c8sb3+NAtKRuP
	 XT10pbAZ9vYMBbANSQkMLJ/qQaOpr61SRfmrvBZsXupcxz1kNPXcSMav3X4AIQ7ua5
	 A2PjeCTrpSr/eFEc9Vg6trET0mFGUf4dlI/g3izQ/qsHUoCIoM3DUdtBL1E2Q8/1H1
	 OorcaNrrU6lFo/YSdrfCmGgDQu2WcHMgUfM1wZsfgguep3TZ21TkjFlZ7KXBXarwYU
	 o4wobqgw8ylAjlQOKqhNqTdqcyMPj5kFbp7PlqbccJhsWrSyGt+i492v1T5YZomvdC
	 y2Y1KrT9I4X3w==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id AB73940917;
	Mon,  2 Nov 2026 15:47:41 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: David Laight <david.laight.linux@gmail.com>
Cc: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>, Konstantin Ryabitsev
 <konstantin@linuxfoundation.org>, Joe Perches <joe@perches.com>, Shuah
 Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga
 <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, Carlos
 Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>,
 Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang
 Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan
 <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, Petr
 Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
In-Reply-To: <20261102150535.6c5689f6@pumpkin>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin>
 <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
 <CAJZ5v0iOJ1r1OvYhV_KJSnHOJL+oVUrbOXizLk0kbGNiep7a6w@mail.gmail.com>
 <87a4nrfgjm.fsf@trenco.lwn.net> <20261102150535.6c5689f6@pumpkin>
Date: Mon, 02 Nov 2026 08:47:40 -0700
Message-ID: <87wlqvdylf.fsf@trenco.lwn.net>
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

David Laight <david.laight.linux@gmail.com> writes:

> On Mon, 02 Nov 2026 07:34:37 -0700
> Jonathan Corbet <corbet@lwn.net> wrote:
>
>> "Rafael J. Wysocki (Intel)" <rafael@kernel.org> writes:
>> 
>> > So it occurred to me that it might be actually better to stop sending
>> > messages directly to LKML subscribers and only make it available for
>> > download somewhere and as a Lore archive.
>> >
>> > Is there really anyone depending on receiving all of the LKML traffic every day?  
>> 
>> * raises hand
>> 
>> Some of us crazy people really do depend on it, yes.
>
> I certainly scan it.
> It is also useful to have an archived local copy that can be searched.

In truth...public-inbox is quite nice for the searching part of things;
I tend to use that rather than going into the email stream directly.

jon
