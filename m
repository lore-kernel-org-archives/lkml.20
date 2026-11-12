Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794502672;
	b=utaJFrGN8mafVMh2q9jaVYPNcz0oC+ZQkJyVmJNTAWeZqSzD3TWaw43UAQUF1NxONx53
	 PWv/AaC1EoW0YZqEykw7nDrtRE8nIQXu3Zthw5JKXoSIwTRY8EB0FvgUh7hrqc8mkjd7u
	 k2RIXHJBPQ2iS8JxNKnpFHYmWnxCKcVrZveWJBci54xR4fENlyU2wRKB7Hs9+LT3RPgNW
	 1Z1HM9espGQ15l7nahmVqc1eGqAXkxe+oqKxGrhwY8rKe5I1xujd+oRTxj+9GxGPmOmvP
	 rFyR5DZoGwgjG8+EdQEWVYU/uH9EGrpFvFIBXwY/mz1/QyOZ0gWnE6YHSDm+XTwySqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794502672;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hUnOVjFYHGFbt1mgqPXrl0v314IpNkEBO0y4IzTD0JQ=;
	b=BwzEzzG6D25w4fNn2no6tfz8eBHwRXMt0tBPuB5A+vaMzO4Pd4AWupEtQnJMy42BEpWK
	 Y0X8lYAHkXgk4JZsKVMei7c9JuNAZHOYIIki28fA/TnubeUWwYqX7WRtJaAPJ9NbxfKj6
	 Nstp+Hd9ypSHEtce91kFJ97kA8OrPt3fn3SIn1Y360159T3zFCYwnq4SYIZGMIW+C5oWu
	 BIBCA1bcgyQNocaP+UZFNKiyn0Y8twveaTRewQeQKdf5vOqvpL659q0gghAwPnY7cC0ik
	 LVM1VaXQ2uFi4HQIaS8c33jbk38nHgLYFpxj0OnkMXm7oW5Eu/rb/o5JdPYj5dfAWxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=eFsdmVnw;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40593606A321
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 16:57:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40593606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=eFsdmVnw
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so2623140a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:57:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794502671; x=1795107471; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hUnOVjFYHGFbt1mgqPXrl0v314IpNkEBO0y4IzTD0JQ=;
        b=eFsdmVnws1YHcyPrg5gzVXT1wz4U85lItJg/8kGHzCRkFAUjQgrJnFC21MTgfQWpBX
         Pl0DRhj6De+1QUD8pFyORIbWjMZt0B3hX79aaEdnvv+yTCyWKj9tQ7LRY71LHoX2485V
         yB/SYnFHTpEGTrAeZekNh+uXfa7nVnGleI2Nk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502671; x=1795107471;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUnOVjFYHGFbt1mgqPXrl0v314IpNkEBO0y4IzTD0JQ=;
        b=tAC1A+9D1Eyf6EGjspeC8aqEW9deVkUn12f2tdhvEG0imJpLSk/2HarXaPIOY0z/iN
         ZsfFkQpqa9TOXUCe49YK50EDxn0XZ6rNF8bRysb6dDbkuh46h8j8bGysAndu9wGD78tb
         p7cgzOo0npZKV6uD/1+JfKslX1asHxlC7tO14DUbAbdhJxP2slhzVHRntmwrYW+sEQ0P
         lzV8yryE2rlvCoBMhmt7LswppZig5dXbkoZaQNG7sc5PxrAbcoBmPrIPH3LE3wdVUxNE
         LwETt36w+VykOv/IULBSyRnqXpOaSjs0R3SViokdel7gMIRhTWfjt7Lak09IxpB4SN4p
         xPfg==
X-Forwarded-Encrypted: i=1; AL+hErEyhyumG9gsD/abD40PW+s9WO2WJUUm3xDhG0grOrvf5lEWMS5eAEwhLBUYujtdVeRa0iQ0oDeIPSHMpEw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+tabDCSmIbWTSDljBwMhdFsP9zmuM8p+FPhs8jDVag9sLl2vHj
	hbv/sNIq/0pTKHbm/1X44Eq7zVKJQbBomoDgdosZT5Rspb8j4jnGDrNDTgDaRfJ9SWQ=
X-Gm-Gg: AYBFou2SzFA4OQzuqThOKAOxDEjj6ajgeReyZVJltvL+wyO95d4L32wT5658gzngCiB
	lUEbXrDSadhfW0trnzIJgEkPNb1rX90ihwCnf2+/THqYOBOwJ+iGhe7StapREMb4lloypyi32sU
	2ZckfEiAOyJ8XQwrOCJh9pA5kAVFyUWJsGGBpLopwY9LPxvs5yLuVtyLE7HNvoP5wB7XrlktaGX
	gs5VOe66dFE1h2P93RPuqygvPEnLHwUBEOuJuckl98CttARnG1flM8/aTD2xerIqNl4HjrK8f1k
	A4vubibuLEo0utihf8+0xvpY1P8CxMLq7vYDvDhNznc5LscVWHC4AZKOWKyIGU8PEpWNV4UM+L7
	A62XaWsAJpqtISqM2ccq+oEXkTi+JPKf1gLUKFrq3iDQarUo4rc6Q7sNBYLqhaRQ9YNO0r4L37g
	ElOBTHC114Lcu8MrIsnXwC8LWeIwQCVXYt3X85pOIjDbKkNL77d0cc2+ZE4b5xC3ikqLHiMucK7
	clhywjcgefvpu6tLkeMiEbO5OCzI6vyPHpXu5h0E7hD4ruvQm/E/it6t9FUS1x4yAJjfv61zvT0
	D47iqmFvn8rSj5qn6OUY7PY5km2p/cBgYLpboUIj8IYg/6b9FWgHhi6xsh3TeiCk7zrXXGsmcwx
	DCB5Q3Hu+ZDBe
X-Received: by 2002:a17:90a:c110:b0:3ac:d39d:ee4f with SMTP id 98e67ed59e1d1-3b182f58538mr5387882a91.44.1794502671465;
        Thu, 12 Nov 2026 08:57:51 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aed76745sm163431a91.16.2026.11.12.08.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:57:51 -0800 (PST)
Date: Fri, 13 Nov 2026 01:57:35 +0900
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Tomeu Vizoso <tomeu@tomeuvizoso.net>, Oded Gabbay <ogabbay@kernel.org>, 
	Gyeyoung Baek <gye976@gmail.com>, Philipp Stanner <phasta@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] accel/rocket: Report NPU usage through fdinfo
Message-ID: <avXv7jGeaXOPeHCR@rock-5b-plus>
References: <20261103155338.1949294-1-sidong.yang@furiosa.ai>
 <a9f016ce-f086-412d-9ca6-6608a41840e5@ursulin.net>
 <33ccceef-3498-426a-ae7c-a8bafbb88992@igalia.com>
 <2ca12f1b-89f6-4069-aedf-4e5d645e8deb@ursulin.net>
 <au31m2jC9SmQ6iZh@rock-5b-plus>
 <fc21d057-be4a-4cea-ab92-0951c4eb7de2@ursulin.net>
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
In-Reply-To: <fc21d057-be4a-4cea-ab92-0951c4eb7de2@ursulin.net>

On Thu, Nov 12, 2026 at 01:46:37PM +0000, Tvrtko Ursulin wrote:
> I am neither Philipp nor Danilo but I would say go for it.

Thanks, I'll send v5 with drm_sched_entity_get_runtime().

Thanks,
Sidong
