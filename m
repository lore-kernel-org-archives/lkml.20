Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A725370D41;
	Sat, 26 Sep 2026 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440535; cv=none; b=DWXsV7U9TW+49RtkcKDfd0j2V+ac/MlQqs3j+/onEGGCfkzsMoz4OF64OJh7f8YPeoG1glECNi+sWtmGBDhWg2dry91MiDtn7ISupmj63btlwWtrkKal80m220QzrUSSo4ESLsRARnRD+CyVOfWtTd/TWuv7pjpKr3kClAgWgoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440535; c=relaxed/simple;
	bh=Tvc5frVvnL27KSYfoyGL8NYtwf8JQKc4/Bx388UyAOY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ABOF7TVfvjuE+z9cTcg7L7BUsp0RgXl7R7YgJ0XBgjqKs/DK0ectQP2yiht103HBcoqbJVdfUa1ZkSygx0v6MyQEPwR/EisJg/vrYm4DVtDXGzrr7WP6vb0/AN5BU5BBuM2mG6ItV5jOsmWFggzzGVTT7dXdqD5JqrgZzlDOiG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=O9noFd9o; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="O9noFd9o"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net EF876408B3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1790440530; bh=nvNNb58SlUv6OwRselUDjpHAH0Au0QshR5l5Y4w8E7E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=O9noFd9o6ta+mfyqotqGUEiHzrvIbkh7GQ0zBBPojN/sY6Hqm9m0XKqnkC+Gv7Mpl
	 r/ddxERFr/i5UGGbnhfSa+GM0cOVwkYS/p/Sgb2Q1Y6WFV82U3DAje2S8g9H1gZkPO
	 JjghMgHJBqBQahUDpAFlwFm24JhNyHGk+9ZRCPfR2wJZk6k0EJ/0X96P5Vu8WwzH2k
	 CqxdlVqQ95dg3NCtX8N1Vfd3wG5dH89VALAAoeNQz1+At4KJKPKN6bDzZ+DYRVY8TJ
	 oRS+yvcPnWER0gDK09XFYYgVXvng7y3Yple4B/Qgnq+qxZ4bMHzbaWww/RYKM9IVbe
	 UvgDCMVyjl4/g==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id EF876408B3;
	Sat, 26 Sep 2026 16:35:29 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
Cc: bvanassche@acm.org, peterz@infradead.org, elver@google.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org, rdunlap@infradead.org, mchehab@kernel.org,
 aleksandr.loktionov@intel.com, kees@kernel.org, tudor.ambarus@linaro.org
Subject: Re: [PATCH] docs: kdoc: parse context_lock_struct() as struct
 declaration
In-Reply-To: <20260926162428.11127-1-emmaonana18@gmail.com>
References: <5315b896-e496-4020-9e46-77ffb942ea37@acm.org>
 <20260926095405.56438-1-emmaonana18@gmail.com>
 <87o6dk3uwy.fsf@trenco.lwn.net>
 <20260926162428.11127-1-emmaonana18@gmail.com>
Date: Sat, 26 Sep 2026 10:35:28 -0600
Message-ID: <871pag55tb.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com> writes:

> Hi Jon,
>
> On 9/26/26 9:16 AM, Jonathan Corbet wrote:
>> Omokefe, I have to ask: did you write this patch yourself, or was there
>> LLM assistance as well?  In the latter case, it needs an Assisted-by
>> tag.
>
> Yes, I did write this patch myself 
> I have also added Assisted-by tag to my first patch V2: https://lore.kernel.org/all/20260916214357.22573-1-emmaonana18@gmail.com,
> as you requested.

Ah OK, apologies for asking you again.  Keeping up with the world is
proving challenging at the moment...

Thanks,

jon
