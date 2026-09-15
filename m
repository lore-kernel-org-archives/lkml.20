Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1213876A4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 21:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789508635; cv=none; b=iCrlPMFQm63F7xbkz/uVgN5wZVVweE5e7bmZZSVd+zHNSXRl2j9A0GxYNfZ25ABsJvi1OR3NL38GauFERPEFhHA/aUJ85YrmdZKvk+Abav0dtzIA5Je2A9RDzApR+yKhkhc1//cgJZk6VdMD8ME5tBeiQ3XpqVCeIFoJV1IFrqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789508635; c=relaxed/simple;
	bh=eOrN6vX9fk15Y0E8S5iOmB0Vt9FnZ2XuMSEV+vQu+5k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lkytzdD0bBI7WN4BDG6xivYg0B6xspgSHJZA4YIoTU8N0YmY/ZfrGtOt8QKsZ2wGSsds7SUyMZy+iveRdu0jvjbTM3dSkUuiyJ4Lj3ta3QZOqHLoe7XIC/fZr67eCCDWlc/XSeNUzBQVfGkQDBV8Gw3u5AF5WP62iNhXc4Z3nS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TrZH+Coa; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TrZH+Coa"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49d1ddd5d0aso213845e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789508632; x=1790113432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOrN6vX9fk15Y0E8S5iOmB0Vt9FnZ2XuMSEV+vQu+5k=;
        b=TrZH+Coa70fldzG3fz6ftiQ5Jbz9EahiP/2pdZQAVSKrX/0sjmCtgXCaE4bnrgwG+o
         61PbcPlthGQbj4zWrVIgg61UUXABp9dtqe5mdgcTIzoYGl6/bpgZaJtxEfERZB9tJRHd
         fluDP5kN779dQS/7l+j9TqKhDkmO30Ob7b+r9cvAMEZGZqbQgZda1Z4ZR5GjQ8JcbEMP
         s2Dbd4i5YGuaqjWQgPrDYFWSjqsfx1Co4RDL7clieXc3ougLkPomgqbODtDz7A7fnDti
         jxjBNvECDNRz9DJsgfV6W+p/rOdbrEzYijJpNEIHmdGtob4/7KPyNUVSas98Xa8AHXok
         C9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789508632; x=1790113432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eOrN6vX9fk15Y0E8S5iOmB0Vt9FnZ2XuMSEV+vQu+5k=;
        b=czed+7+aqLcmXCprGZTxUyrHd9e2V6Jr94cAJLSsEspIqcA5snfw3r5nHog0VANFGG
         JMpq6g1ySox3RLaiOJpCtFIh4/OJN8o2rSJDZTfN8zrpziR13XhTQJe/M7G2VSbWGvfJ
         Dnbg6DWQs8Ozr/f0oN0ZC7RWHgVfdJjM8triuIUDscvtHgSGKLWiIfxey3+bcFW2itaq
         lqlAPBmhLT0i2HRRG/gQWekT4Lj2dFL0h72z6H55nVgO+jtJDjGHnOtCOF5/KGxP3wFx
         nJixW6bZFQPni9jXZAWcgYurRHCbAd9lgDZyIRWHfa4r4D0No1j9uyh2w8E9srOAoq7P
         VNJA==
X-Forwarded-Encrypted: i=1; AKwUvBx3J1FpmdUsqDLRbdaxH+X1prStqWouuCMvkWs9uaFIoGeitJk7b76c1vA4J+MwPMlFyRwGsjBA/aXFRy0=@vger.kernel.org
X-Gm-Message-State: AFuF++k6C6V+zhNDPvKjZ1pil8tG4f0n8WdXSaTFMJXiRfhp2audddom
	CS2vIpAGEuxTMuYtj4fwZv6+kEEo3w3rzBrfe5Cp3j5y9wJ8o9m9pxkY
X-Gm-Gg: AYBFou0gF2zXgFwovOZO7UlLsdRb0RE3tiapa57rwRvau4MXjjQ4n/0q1N2f9ORVG8P
	n44skWlZhO8PmHe/jWseN49fULZlBcm+bTd0zdb/QmsjfwndU81v+hydqM2Gy75UFjcPQuCS3Pm
	mEcTgDt9Ly53Tm68j8BuTUGi2L74gf0WE2aeLhF0vGuH2Bd4oc1fPR4RUrrD2znQn3s0kDeZEos
	MIswjH5B6d1iWdEcFQE8RZ9tcenoNVWcGM6XNWk2QdCs+ybwTQaSuemlhpjfCnkxkrnLFlhkW8n
	/a68ZKauc5jhONTNgJ9OvSnpxd1w51ZRd9F7FXTOM3YbJnf4RnO+xlndoHYJMhGae2XLMfGDoHP
	2DahgxBJ5gQYiITGG56xcJ++y2/vpAw6RY+dsmNUwgdVshn4tPOU2PkcGa3Hz2pWZ8Zyx/Sdm+A
	lpi31TFsiaNLCA5WbEXfFtHDAILtE1pIM9sErJGwJ1DHP4O97ep/U22mFPTexd/wfUXowXsY63F
	UMlDaf9iCw0hbuo1dBvKg==
X-Received: by 2002:a05:600c:3ba4:b0:49e:6806:5712 with SMTP id 5b1f17b1804b1-49e7a66d0f5mr125063485e9.2.1789508631498;
        Tue, 15 Sep 2026 14:43:51 -0700 (PDT)
Received: from lima-kdev.local ([85.100.66.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83db9102sm21355775e9.12.2026.09.15.14.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 14:43:51 -0700 (PDT)
From: Kayra Cizmeci <kayracizmeci@gmail.com>
To: vincent.guittot@linaro.org
Cc: bsegall@google.com,
	dietmar.eggemann@arm.com,
	jackzxcui1989@163.com,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-kernel@vger.kernel.org,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rostedt@goodmis.org,
	vschneid@redhat.com
Subject: Re: [RFC PATCH RESEND 05/10] sched/fair: Introduce select_task_rq_fair_thin() to select rq when LB_PROMOTE
Date: Wed, 16 Sep 2026 00:43:48 +0300
Message-ID: <20260915214348.22220-1-kayracizmeci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <CAKfTPtCa-Aycx7Lt9Nj7JDs8bdq0oZCt-k_cZR3WiG7YJhBTng@mail.gmail.com>
References: <CAKfTPtCa-Aycx7Lt9Nj7JDs8bdq0oZCt-k_cZR3WiG7YJhBTng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello Xin and Vincent :>,

I already read Vincent's review, so I'll not repeat the same things on this one.

I just wanna ask, why we are dropping whole energy parts? And creating a function that
is connected to only one option?

You say this is for embedded systems too. Don't you think energy parts are important
on embedded systems?

I don't think saying that this is a 'optimization' is the true term. It's more of a trade-off
that can be good for some special use cases.



Sorry if I repeated anything, :>

Thanks,
Kayra
