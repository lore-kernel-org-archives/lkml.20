Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794393013;
	b=MCaM+lMAS7Cf64QRhvCZ0qQIiG2HIgV7Xuj1vssU789tVO9wYvmfFcvUU29RGqAODSFR
	 8ITR/fHPYjCa/hl1kJb2+e5PQUngySL5S/cUWrGMPv3HrmfeoLVxzAImgiECcSCvnDOsI
	 t/J50S6OcxV+lrf5KpiJn57EPb9YPDjiOWKdQyYLRItx14PY1JgvDbDQlI/OF8c3qmGZb
	 VX3tsyJjz4drK77PXo4N3KHbybcBm1L1m4lj0zDwNVRT4RIYSUjoA9Qio2qjG/ft5MbFc
	 pyfzcrwMxk20JxS9cVyU+z8X40rZim7g4+PCpxzxkF3RGxqdecLfBP3o48u+c3V1C5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794393013;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=jOiHR4ad68Npg1NXZSugMmWFxLEASeXZ1K6QbTQKCRw=;
	b=n1WdMI6U0GHQpnxrJfygT6CbsuHSKS/pb05A1qmxGAZR5vXJL2toq0hd36aEcqIyElUO
	 TSCMlbanMaDiXuFNt5IbFtJosEyn96IwmwmvIF7qXQqqOSB6Yf/xWq8NTMuAobxs9O7YE
	 6FaCuLbM/zGacD/2Fr1uQ6ZWctRBelvgzUoxlKoqDk85PoLBOi2lwh0h/QMKQs6gVSBAt
	 ufrbdWY6vEkO5UovHswnP6naQ5eVAQdW8oDG0322z+i9LLg7lxoV3oWPITosIfrnMZVEM
	 Kp0Y3dgMJfyvNXqgpt9pKi26zE4NxuNNNPc24lPEBm8d/B1tsuj3RMjypXHPcccG63Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEjJdJXj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC26606A881
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QEjJdJXj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C75F91F00A06;
	Wed, 11 Nov 2026 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794393012;
	bh=jOiHR4ad68Npg1NXZSugMmWFxLEASeXZ1K6QbTQKCRw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=QEjJdJXjxc7Lur7NIFKjf55sh5sYArssTP8Vhpn9QBhF5GOPrlZ6OebMEWuma6wKx
	 4vRXOpyYd5xdTJDEXZiVyTiVlmF5QADj9BSFmKHsUpjIOBcvmCMi3zXT2HmJ6QCoIo
	 ZsvGLonn4K7ZQw+EeXWsiqS37DCeoSK8DQc0UU04k9ydoLmmARyrKNHTbVOOrfnFHW
	 X/U6wJmqd97vSowvOi9ZTLvX4SVmsb26JUNLNZQuN4WyNYQuQpm+6GGaVC+5SILhsE
	 7QEdy/Zdigj7BsBE1nC4KLIPM6L0Cg0zCO2HPnDbOtLZLAL82KzlKDgsYxXt6otr3h
	 B9uJ9/xc9f0TQ==
Message-ID: <ec39ce6d-e604-48ab-9582-04ff73d13c16@kernel.org>
Date: Wed, 11 Nov 2026 11:30:09 +0100
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
Subject: Re: [PATCH RFC v2 3/8] mm, slab: rework KMALLOC_RECLAIM handling of
 SLUB_TINY
Content-Language: en-US
To: Hao Li <hao.li@linux.dev>, Harry Yoo <harry@kernel.org>
Cc: Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>,
 Damien Le Moal <dlemoal@kernel.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20261024-slub_tiny_rework-v2-0-bf1419ab5ffd@kernel.org>
 <20261024-slub_tiny_rework-v2-3-bf1419ab5ffd@kernel.org>
 <auHcj2G78VkXy-Vz@fedora> <auycUvCC2mL_EQ1r@thinkstation>
 <avE01iTQccxQnhl6@fedora>
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Autocrypt: addr=vbabka@kernel.org; keydata=
 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
In-Reply-To: <avE01iTQccxQnhl6@fedora>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/9/26 04:01, Hao Li wrote:
> On Thu, Nov 05, 2026 at 03:19:01PM +0000, Harry Yoo wrote:
>> 
>> > Given that, would it make sense to
>> > change this line to something like:
>> > 
>> > if (type >= KMALLOC_PARTITION_START && type <= KMALLOC_PARTITION_END &&
>> > 	!slab_tiny_enabled)
>> 
>> Maybe you could send a patch as it's a separate issue from the patchset?
> 
> Sure thing! I'll post it once vbabka's slab_tiny series lands.

It would be better if the fix preceded the series actually.
