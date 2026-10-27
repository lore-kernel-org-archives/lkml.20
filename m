Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101378;
	b=aCp6i8+NCpv9SOVs2QbYdPahNrN/RhgbqEE8upGE5N/EniR7yrz13A3fXMRtjX4sWOMS
	 VQCgpz1KklJpRyIykoBEZZuYZ2K+4U0rFp4iu4h3NWTda48NGImqYFIAjmqblbN1mIde1
	 0p2h1dABnWeikqprQWX5vQvJcrPLmcdJFIdfExuF/8TRkjW6JChghcY0DuWJVFyJk2Qk/
	 eoA24ooNT8YK5ERGSgR0FDfchtqSXrzJlSkAMgEB+aV+JiUFVz/p5q+W2/cs8WlwrXgJl
	 W7x7GHcSsF+1Ac4KcZ5Ng8mwL+XnKuZmN//c42ZE0/G4+XXRO7yTlSagg2we7r1n37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
	b=TEhYCbQidM5knpD6yxvql8SP9dGsDRIb2MMvcu86dBP0oviXhRiMTxa7uwoioBf4QK7g
	 a3xIzddFVSa8M12ek2nIRhg0mho/pgx/ThQeTSwLQupACXbY8Onf7eDcKPv+cdzYBHTqk
	 HefpmstqHAhJBW3BNjVto1NdqnZFGVm6mtFVDt043KEaYtP6+XxfS/EoHQ76EgHKUztxs
	 GPxcGXfWQfj92bZ+Oy2jMXSbO0yFZ2O0sPqbhdOlrtOAJAYAZYxMEljXWQCPQ0CD437OQ
	 Ky8XL63xidVc986fSqpzvuHXZAEQg8/O3vRU5EgREPlAmC4KSDN4WajzST23HL4ubmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ELiSdUOH;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5AB606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 11:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD5AB606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ELiSdUOH
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdab8873d9dso682075a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 04:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793101377; x=1793706177; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
        b=ELiSdUOH/cIJPyFJHbgZeLUlxA1ZsPoFOAPtjqLzx/rzQ9JO7MiO1l1EylHRSz9ezg
         ictUVQ2uhhQ2pYHxEdBrFH5HIDKQqTiAHMzqlnq5QD5CgC6J+EP2q6pJpZRC73jUwRhD
         ylqMz+7fKAuQWhpAwt6wJQNE9JgQDJ+tXRAss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101377; x=1793706177;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IFKYyZe98olIOt/z7FVjqJN0LXwahHsaIWrhXMheXUY=;
        b=m4NEnwxsKWZqoexW0wHycU1Si2NfozpC+EvJLgLSQFba8lzdP499pmbgD3NU7eFIIx
         fQdZQ2pCxiOUp2QSb2Dtm1mV4QaitGxfZu0Dzghf1hmsKoFRNG3t7d0nANSzZIcWavhP
         d7K/GRxKJb4DOGC5rfpqX3fM1pPaa4nujovBK+SmIrmiZw3XRLXkWuakf6d3tMYI5fh4
         ew0tODSFqbn8SG5DwsvUBYKpoMJZFgVRbE7UNlh3QbuBfpZ5Hxl9KHy1ftlcwHwqFnBU
         DSOvBraVfFR9Gh1pqbvBR7/Ta1NoHASL/DPCochV+PiQljtEQHLJu69/E4w1rgi9+pFG
         qxlg==
X-Forwarded-Encrypted: i=1; AKwUvBwzS6Xswn2dYN/Nict9Qytb59Lo9iS99JY3p10UWZ18Nc0QnXXmFKVLyHwZ6gEgLQEAy0vDksxmJZZ8Hw8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQVTN9/xVvVOnttWeSSM+h7uycIKJJ3/xZPyBum0pWdPYFYnxo
	l0crWTG5HkgKZ/bfzeBV1aECxHbxELm3zAPUUlhIesPMO4ObmmKjOzojXuh26yZagVE=
X-Gm-Gg: AYBFou2w4mXQYu3peDNLE2MzPhCom7x0A1xBoEZ+mu86OwDfbkJvMe9gxlOSsvnjrZe
	N1r1dTk4FvYBjnihxJk9EJbW7tL5Q+Aol79oKu7FDWT5mZiV7anBddYNzb3+6Ha1LZiGtsEaqPm
	jb6VCbhZW3kgdxibFVNGCPtcsrc5SXq0drdQnWJ9/fF/jVkffaEnRLJs1nGrfEbSc5G0PgOo1uU
	pSQ0oh7/RD/SBeqWg7E2OqwJsNqQqF6hZst1t7BIDdaMOB5bJuz7e6RhyB4XlVyAsdIlF/VacUB
	NPo6DykdY3XDNaX446HW+uc9jyDb03wfO9rEYOh7L0WOGUSuznLw0upsmYEgf4sqg1QN286qx2K
	liwHfm41RuVXrM0b4p0myV57dmGveWU0rUVadq7UW7UoGJm98ICFl8VhL396MpdVFHHiWx38yCu
	2qdmXW+yKrHvFNn4U/CEavfsy3+zrrlsAs84rOGZ8ghfecAXXK/cPJ//EqqtzvDPcOzAGNUTyWk
	GTv6wWQpBUH1jnqTUXsZY7I3qk44nU28KQ+eKn9dLk8l3G3A2WLdHCizFvt54uo56n9fXfpWdn3
	x1cuNQ5R42143R8bASw2WaqTbCeLReeEXEwXDhV1TwO1wZWgSi5GB0v9pIcg7N8CxWi4f5DKH3d
	6rW3Ow/31kfkyLtYv/atTqQMKGxEnCbZ5fyT+YFzEfIO1gZ5UnkjrrzJcZeO464pbqML+0WQQ
X-Received: by 2002:a17:90a:d888:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3adeae7309cmr8343178a91.25.1793101377141;
        Tue, 27 Oct 2026 04:42:57 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404426c2sm3637757a91.7.2026.10.27.04.42.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:42:56 -0700 (PDT)
Date: Tue, 27 Oct 2026 19:42:54 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	David Hildenbrand <david@kernel.org>, Kees Cook <kees@kernel.org>,
	Jeff Xu <jeffxu@chromium.org>, Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>, Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH 0/3] mseal sysmap: Choose system mapping sealing at boot
Message-ID: <cover.1793094611.git.chris@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

System mapping sealing is currently a build time choice. Hosts which
want it and hosts which need to move or unmap these mappings therefore
need separate kernels, which is not ideal. Let's allow the administrator
to choose at boot time.

Chris Down (3):
  mseal sysmap: Add mseal_system_mappings= boot parameter
  mseal sysmap: Allow with CHECKPOINT_RESTORE, default off
  selftests/mseal_system_mappings: Test vdso unmap and remap

 .../admin-guide/kernel-parameters.txt         |   7 +
 Documentation/userspace-api/mseal.rst         |   5 +-
 include/linux/mm.h                            |   3 +-
 mm/mseal.c                                    |  13 +
 security/Kconfig                              |  17 +-
 .../selftests/mseal_system_mappings/Makefile  |   2 +
 .../selftests/mseal_system_mappings/config    |   2 +
 .../mseal_system_mappings/sysmap_is_sealed.c  | 236 ++++++++++++++++--
 8 files changed, 268 insertions(+), 17 deletions(-)


base-commit: bae9a042b03b27924c6fd5bdc00a20d6a44d6041
-- 
2.54.0

