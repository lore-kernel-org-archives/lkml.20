Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793831542;
	b=s005iEg6k5o+grcNPv7PTq5ecKAx9tfVYDSCpKxJRvqhcwz0TiM1SB5pwY9eG9QDAFIR
	 HiwZb/fc030Fl9vgB0jf9pL70R2nAwcDfbd306bQeR0FrBJlTrbZ8ohJR9E6PrR1nqyX1
	 h+0Im6ZDGkDeFDiBAmU5f505/keh/jfCReFsEvX5FWTdbT4J3O03QPfa7nhvnx//sPvmQ
	 Wf93NQunGUJhJsPo5G2WKZoyjE4pYmJRSuEdvZiuuqVX/b5o1gu8CXdeNGpJ0ovBRK6C/
	 Ba+8cxf1wZXgbgAexQJFLkulWkLZ75mrMaDHY9FykGq7wKlBwHpBrGgx84vuzm61/lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793831542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
	b=o+723Iwm8Rwd1IMEM/OtulS4L9a2yjQwc3y31XizwG9ype1J1gXoFtz+MmYNRWhGmt7w
	 Tq5uWJkHsw5dFx1LraH8EJI5PN+Oqv3YMrDdA4C1p+raMsJIzYxcfBcyapQi1hFnbAo48
	 8o3H+c/S0h2C/teoYh7F8n/93wl8Ap+RqmBJVzjie0i+3iPrBow5B/GF82Aop2xJfilLb
	 64vc5jFYucj3DfMCfQ2oF819FH6aMjPCFQdIys4jyDZx3//F34e5rFsjYrZ6QtgeJSOJL
	 F5LKndX/Gzo8YjQoh20RcBp94t+iADZe1l2NnYDR3IlSLMLkHHoZwWjfPb/qVEMDVag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7LHOZQ0;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF68606D820
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 22:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EF68606D820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Z7LHOZQ0
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e95bd1c14cso10352485ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 14:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793831541; x=1794436341; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
        b=Z7LHOZQ0+vcoKUS7yCEOrnmDL9Gq4YrSvwIsK5QMV9vH139XeuBqLTQbiHcG5nbodq
         QSX1ZySWx29FjN/EplLMWd24FBt+mCyTuKSInC8DFEzr0ky1W9Tq4E3HhzCZkPwqe8YJ
         PE92jDwE5ZT7DweBwdwmPnLE69d+fhrINoPAd4J/HxFH2PLl3esJAJbJDAZ25lTbiSHY
         M8z4PiYBS6k/3rqlAk1XbEvkp0km0XPgMugi4y8LbTQ5DucCb+VusJmKXS76B+JZ1z9E
         TAudHtwEEiDLzHGvErFDbIxa+pNY1DN8Je7gGT4t0smJlGP8fHhtAoBBDorN5UKEhFDs
         RqDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793831541; x=1794436341;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AqrMQTautnZWVcHeal8+VHryjxTdMHJnQLEYqFDhRfQ=;
        b=SoB9Z6r/HMlgXuE7o61gUTEf4QHSc3QSyPVwTg2RK+TNjwpdoyweMKLj4JzKD+EaUe
         PZXkLIGH6ay7jd9yB9tU/wVLiCZINv5/gHoTF5SBqNopPj7z/ITwlSSRbRGPPSe/Jx1P
         K4HEMRJ7owHAAM3H7oIYOT+pdauCXxel8zoHB3fUULHHVoQkQFEFInd5PWcNZzKmvXEw
         kpjL2jjUs9IblMhIrKTWC3yPdRbOTvSp3Uokipv4zjZtyePePmz9bJlslXMk1W1Wkkhj
         mSiqi84RpzJrcAT+IR3+pJRy/DrEEBGCfD4AOH2CeQgRrtlUp2K2GJoprVFDSf381Kb2
         /Mjw==
X-Forwarded-Encrypted: i=1; AKwUvBwI9rkTafczjLTANoav/BWX1iZ41iktk34IgsIzD4ziy53giLMv/TiDiR1DwIw2ZVCS9jYtUrwNEt9q0nA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+p21H9ay1k8qhS7MNsXmyEpGw0NI3WmmZrRvkU+sR8bm4j/LOu
	/9OpoNXNzrmWNcCOqZO+ulX3yhru2YJkRYRMj2rWmPhXIwhJski7wB+mcte5YZSE3g==
X-Gm-Gg: AYBFou34+Aht76NXUajH47pSglGqLKQ6KCd0oNztxhRbZiOTcDWCcBc2NgCxw8IXnup
	BVpx8YHtwkhULZtCTF5d4A4E3JuaEkWrIT3z0yOEUhuJwkJtCytoxPw/QfCA5eCy5ZdOeG2SJan
	qz+0a96wXCi0Et6rfraUDcfG4PzHAyOmy8XNIeJDMmlVCb2ugC7KYGoPOx4pW1JmnSJDdv8+qx/
	hmgr2XN1+5g9lVKSjenqdN+H0Wc4KputiRwRIxJt51McZBOYnjW3eys9LR2VqzpU8HyT22bu4+z
	Aw/mjoxXq7D+8JCWRAW7BV/koq2lK5X/VCmkofTD4Vkespf8ivAmndx/4PSABVVzYRM6xAkjmmV
	wVbvWjPIOZuN27KjB6DFWRlt4BcjNJ4Kd7UY2obSd5CT/K+IQtoNOsbfk+BA3tfR3Mhc0bj6ecN
	ShZGbPV9+JUBx1gEyHmJvLHT9gkkFgYEqASy5w6dSiY02m4RcaIYWavOpkEqIPj8N3I34AhNG3Q
	hiofZumyD4hmWNwnIDJ0f9MyD5Dl2RWrc4UzHPFHu1P6pMytPE85BcH5XKS3Ug0tUpQmlzV1K9v
	aqZWKaL29W7inbadpOWXUpMvRD21oIby1zmJhB0j49kml7dCV8TEL+U9bYFv5CH8a8+kp6pKDVR
	fneoPpddVhg==
X-Received: by 2002:a17:902:f603:b0:2ed:130f:869d with SMTP id d9443c01a7336-2ed130fba9bmr22390155ad.43.1793831541004;
        Wed, 04 Nov 2026 14:32:21 -0800 (PST)
Received: from google.com (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090a1475sm11919255ad.41.2026.11.04.14.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:32:20 -0800 (PST)
Date: Wed, 4 Nov 2026 22:32:15 +0000
From: David Matlack <dmatlack@google.com>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-mm@kvack.org, Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Christian Brauner <brauner@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>, Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Samiullah Khawaja <skhawaja@google.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: Re: [PATCH v3 08/10] mm/shmem_luo: Allow preserving tmpfs files that
 are still linked
Message-ID: <auuyb7FYBX7xdr5z@google.com>
References: <20261103010216.3447716-1-dmatlack@google.com>
 <20261103010216.3447716-9-dmatlack@google.com>
 <2vxza4nok0ji.fsf@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2vxza4nok0ji.fsf@kernel.org>

On 2026-11-04 05:45 PM, Pratyush Yadav wrote:
[...]
> > + * Preserving a file requires it to be opened for reading, since the retrieved
> > + * file can be read. It also requires permission to write to the file, since
> > + * preserving it affects all of its users, as described below. But the file
> > + * doesn't need to be opened for writing. For example, a binary that is being
> > + * executed can be preserved through a read-only file descriptor. The owner of
> 
> Why are you talking about preserving binaries being executed? Seems
> oddly specific. I didn't know that was a use case we cared about.

It's the reason the check looks at permission on the inode instead of
requiring an fd opened for writing: a running binary can't be opened for
writing (-ETXTBSY), so requiring a writable fd would make it impossible
to preserve. Preserving binaries is a use case we care about, e.g. to
carry over the binaries of services across a Live Update. I'll keep the
comment shorter and more general in v4.
