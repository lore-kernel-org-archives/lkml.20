Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792534009;
	b=1z6G+q6uIYIS8bql9annKEvwZoug0D4WoePSvL6H5khyS9xDoJjSPMfIMtHM3adj5XRH
	 ykokZJk8b+WXYRJ7ceL5asSGEPstrET26Cp+wzFwnLG5+8sWcM2NUBqDJa4t/6qy/PzbB
	 9/eMxyfDNqt1PSnCZZ6sFOTATpmbyQF53GW5m1+k1n42d9B5kLBMMcf/l0p0Km41Exvb4
	 LVzRvSUg1PT6mL0vHgt+v51tYt4SLyNKfiixkIXqa3KI0U5y8vPGJKGGJkISSBT4SbRKg
	 xbpqHDWCzoqHp7syljTzpKKLxYvJobPCq+rfdelgg0cCgbU+FjlySAcs43SUAxpWlBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792534009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BDPUl7nDjK76W6L4g18Vmnrbli/Qz3DCuzjE0OhX4Jw=;
	b=L7OjgiTpc9oiHWRemAf72b7KbvJMDEFfJzaq1/YU2oMskuU3WDvOnGK5Wv44tL7+PGEO
	 xKYfue/c3WiGaP92BFrV3XlJ+OttHEDGwNonUYbKbJFqYBxX1Tys0/YidcLmlhfl20tMH
	 qmb7+xr4gZf7pXMIZ4FTD1QdsJ83akOl7tsDH2ReZzDNXq7YDsft8Ek2aavuipKJON88h
	 3pnyfxzIMimOnQAkuD6rINiOYrky2sq4jUZLvlGSt6aCUmxT8nVxrhNXDWiFkEH53R37g
	 9nYAb6FFMYsG2VVSYSpmnJb0fLmDR9ksizxxA/xu3otcP3+Ot3efNQJj8bsWT2ymmgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Us+71+dX;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D681E606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:06:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D681E606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Us+71+dX
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c38ac26cc5dso1538966b.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1792534006; x=1793138806; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BDPUl7nDjK76W6L4g18Vmnrbli/Qz3DCuzjE0OhX4Jw=;
        b=Us+71+dXBI/WCqf6w3s7C1FM7kMNrFcfcrsQIYgqdfO/t+tCS60u0tVn2RkT8FpY0t
         gS9tvVHQK5av8qGF9cUq1O3BpOfYxtXpWlRnVncrldfnJktAR/knwVk0baRy20WwT1UL
         faoUolyeP34oLjrX+SGaV2F1+9/pM6unnU5uQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792534006; x=1793138806;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BDPUl7nDjK76W6L4g18Vmnrbli/Qz3DCuzjE0OhX4Jw=;
        b=OQHERc6eAWyzWdeJBo7Nsf5tJmcV0/VcXmiLFAtyPUQXNdkw08L7n/7UaDNXN/1pz0
         tYGamZblmUeyKwv34SHIsjghOwS2/30IPQshyt9hxbC2pJujRyjGlEzPOc2NGa/wGDB4
         wsinI6hi40DQ4a6uaakuyfMWkqYZaUhVr1ft1hpQdVyQeColqHB3LuaQwUcUQ3gW0tuQ
         EhHbonMISkbTHzfMSdnfWhAQDmsXaE/u6H1q08nrlpCG+SbwdLyXtmI9KPvY49q2t8XX
         rjEOk1DzyBKAA+9953ZFGSqzjR37fIAnhPPamD5tOFdD5ohd2FSj9IHO1+Grrmh6ygdK
         IwgA==
X-Forwarded-Encrypted: i=1; AKwUvBytEggKv14fx/+gYkKnNROFCTBxHxtpiGATrPiUMYLY+aWsBY1hO0nVbjLp/ntjHg7Cm/IUtdXX1gNzIm0=@vger.kernel.org
X-Gm-Message-State: AFq9FYI+7gQ7fSnIRJz7WJbkq/d7j6vO5duxaUH15TuLoyvCmAM24uCO
	DemSQVM4du47QDQNoJJamqT/K/x95Xhc03d1Au5G6wdfFYyDIBJfglbHZYQGVSvhyoy02+MkQyw
	6IMLVUAA6hQ==
X-Gm-Gg: AYBFou0Az3y1780EHrEa1cuQnoqqLOOyE8gYvx+FQLZQ8KC7x9VR5n8ByNhi9De15Hn
	uxFiWMZkM7ZTnTLo3/ySGGROg475bH7el/m0UGBj0Pcdv3M1HoqB7rQ+8JY/6ioiseVyR6b/vCz
	osfvXcGixRbpJW2vc0p3EH/VYFbgvzEwZN418VmhRHKUqoC2caCfgFJSGF+Fu+sBslClnWh+zhK
	JTR9r/kH7i7UdDm09sxDCnBOu7FwYTCz3b+8asEZP7pZPlqjX7siOSW3T9JMgNmkIaK+u8SUadE
	llk7TkXc//v2ohl+GuBDUfxKkP/5/JCqfdFV9uT5c7ocPfUudzZyOsqgRqSWruHZSX1avvPoxXy
	peK/axb2iuk89g/2bldQCXtEhU7dA7e7qzb/7gdq1pzSmXVRwcjyq4JHeXeYkzeoYs0KI6ys79+
	PxQAGTVW0BLP09G7W5ciq26wE9omS/vkk8iTz46uVvFCRWuxmvYrLM+S9rGiXEOowed8wBlTl2/
	zUXoiZ99Ug46PyuFzcizzjrlDww3KAXyjmX2wTHPSmXFZvV
X-Received: by 2002:a17:907:6e8c:b0:c29:f5d8:9c72 with SMTP id a640c23a62f3a-c4679788329mr31382666b.33.1792534006140;
        Tue, 20 Oct 2026 15:06:46 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46790366d8sm15782266b.87.2026.10.20.15.06.45
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 15:06:45 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa2848d2so67621a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:06:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzDaDgP3/ZbCDqHjPAmm5V1lPhtMtmXOtWwf5QiwLISAyLMYsrDKOVbnIiI/oe9lERI8XDQ8viAPFDxxUE=@vger.kernel.org
X-Received: by 2002:a17:907:60cf:b0:c3f:d8f2:f08e with SMTP id
 a640c23a62f3a-c46799f0243mr33781666b.44.1792534005230; Tue, 20 Oct 2026
 15:06:45 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019153437.1871645-1-dave.hansen@linux.intel.com>
In-Reply-To: <20261019153437.1871645-1-dave.hansen@linux.intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 20 Oct 2026 12:06:28 -1000
X-Gmail-Original-Message-ID: <CAHk-=wj5m10cSGeUqzgTvhnMe3FvrhnyKr_xGDXBknNRvoug-Q@mail.gmail.com>
X-Gm-Features: AclHuK--4mGVT5nB4UD-awCZ4j4NkGvVMi9xGydbIMFnaknJabRv_q0KrhCw-o8
Message-ID: <CAHk-=wj5m10cSGeUqzgTvhnMe3FvrhnyKr_xGDXBknNRvoug-Q@mail.gmail.com>
Subject: Re: [GIT PULL] x86/misc for 7.4-rc1
To: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 at 05:34, Dave Hansen <dave.hansen@linux.intel.com> wrote:
>
> Please pull a single x86/misc change for 7.4-rc1. The "itmt" scheduler
> tweaks are getting disabled if debugfs is not available.
>
> Allow initialization to proceed even in the face of debugfs failures.

This same fix seems to have already come in earlier with the scheduler
fixes that were merged for 7.3

I did the pull and wondered why the diffstat was empty...

               Linus
