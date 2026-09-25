Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4DF4E430C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 16:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790354390; cv=none; b=h7gLKHq2xVvq+wW47gaqyIR1wip8onNEB2r4MOPUTVKDE1N9iycPpfbGp5pFmUe1cGxCQBARoWcbWXEyDNCvnqTXcuMNNXzPMDy+xokifvDk1lykDm1QmG97yQ7R0JIZZwPWNoCpuQ4BoKAjFAkIcPsEF1Yp3AJUI5Jt2ONVP08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790354390; c=relaxed/simple;
	bh=piiNMhDZqsXj6hX5HCGLusCJOyYSSVJ4zi5UC2seskg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xv+yCT4BvDwxGWBMuPsS4sbs0+UvcDFLg9IfFjqt1LO71ZgNKubrwcazEQXXH0aGTVLVgx7jE/n8LP5rfp2afqbIEAf+Spk+iX2JBFxFVbwOw9SY6vQCbiX4j+xgPfYMhpUfRifZJNqMymcvKpftlhJktriS5CPlB/m83mpRfQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fxpXMw23; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fxpXMw23"
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93910cc46c7so109408685a.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 09:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790354365; x=1790959165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mXkCvwWsAa2E+Hn6icM7sU9ne8b/y7FRO5EIaNV7g30=;
        b=fxpXMw23ux7b9WzZ14zuyJVH3TeEIi10sTN2gESPER9P+9v8p5g9gZVJBOBiogIaqp
         BUJWQDA9g3INmPV3tiwLsAN+/LY1YHI+s+rzHmA0liD3iLw2aZfl77gkucEI40dTwRRz
         4SiPddPDhsiZMmtW1jcHtobVxrCvCtMc9Cxcrr/Es+YeFoozdJTMvnvFtT/aMc365rHk
         f3o9z8PdcBR71VrsPImb2bVmLxyM+xaYXUHCPdCfoswUQHMArskSLzlMDIxCLxniYOfb
         5xNtKnihPn0oNLM7PCu17eqcyEOH1Y94us4IbC1y5u0VVHsdsljbYs5ORfyZ31aw6bTz
         kYrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790354365; x=1790959165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mXkCvwWsAa2E+Hn6icM7sU9ne8b/y7FRO5EIaNV7g30=;
        b=ZpnHscnmtfW7sVfY2lOpxR1dcbkPOkmEEM2G3OKLi6IeB3H01yJfTSzOJhitDeMbNM
         Lp+gmGPG9T/4wafp/BjqdFxp/gFY0QC/svfxxTAXEoEISdqXmFqBkUXT7qzblBJ8nzyZ
         8VVUA9wNVoae5jp/H05Nz1HcOupa+MOy/QP7EL94jDsx+5OCtERjaiI75R9wQma/rBYL
         siKqA/WQQwpQ2dl+FSTB5fokDcRVieQHw6UTHPN+wagCeu48s+qbJYNeZem/wjMr8aaV
         N5uBg4ukvOD+5Wa9zVw5yWrWydf11Qo/SVCzUHPJRXQFQu+3bBpibXLU3OBdkWl4GZvO
         q9pA==
X-Forwarded-Encrypted: i=1; AKwUvBwEOiSy1oCyD8vlGDgObl90GCcisdU3LHXI8QdXs3rnpgyboy65FPBEoDf9vAswU5x6cjDmU/MuDJKBaVM=@vger.kernel.org
X-Gm-Message-State: AFuF++nwlnc6ppFsyikDH0j/qNtgHqd9EqQhxtLJXjmm06BVPmu4qJ+H
	SfmouykjoKY93JNdRwB+flAXOry5KiPo7xnjEEtztBnYMeUtKdmkw2rw
X-Gm-Gg: AYBFou3AcdCo7r53MdInc3vHEtvXLBrdS8xopOcib2TT8ttLclVG9dfnT+pLmDfAxmz
	8FzpDXe9Mv5s7paHS/eOedXtIVrGP2Znepz39JWRUpJGDMxX5t5HOmvkc3lytA83eZ/Y0CJfI1r
	9/yfeY4Mu3ijz4Aislmr9EJfuen4B6dqX09qGU+/aUcYK9hFygLnmpZpDSiP8faV+fH9btNTOkB
	S2pmiGs2C7lX4T28SL6pXMttX9LTsjbmbK3K3DVsuXagQzpFIiIXaviwjZ3ptPWr9dfHk9UNjG8
	YggulYjohLO8hjzO2O6SzlFu+nuJRNeI2M5oTPxdhxTz8x5ch6i8V15lsjHX96wnr3tOU35pBBL
	FcBpbVqmIDozigsbrSqUZZ9vpVVSrLf7AAYoejofOrukuydRyXwWqWerwUFiJg68nphMGCeAj5j
	CXDIPBeYYEZBfNi1yEUOkugZUU63Nj0oTVRK1Cq08mtI76BW3GAgnAmlRnUUqvgGAOUIquQxLiF
	CXI2O1HPHg7O6DISwoA9oQuQ/AYV9OH+J1OA4GCd/qPhtxeJV5bIe++1w==
X-Received: by 2002:a05:620a:660a:b0:93b:d7a0:d9e6 with SMTP id af79cd13be357-93c43d7571fmr552568185a.64.1790354364663;
        Fri, 25 Sep 2026 09:39:24 -0700 (PDT)
Received: from kernel-dev.. ([2a01:4ff:f0:3ff2::1])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c5222f371sm81163085a.33.2026.09.25.09.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 09:39:24 -0700 (PDT)
From: Uzair Beg <uzairbeg11@gmail.com>
To: krisman@suse.de
Cc: io-uring@vger.kernel.org,
	axboe@kernel.dk,
	asml.silence@gmail.com,
	lin2530632123@gmail.com,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 3/3] io_uring/rsrc: prefill the node cache when a file table is registered empty
Date: Fri, 25 Sep 2026 16:39:16 +0000
Message-ID: <20260925163916.524653-1-uzairbeg11@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <87fqza1imr.fsf@mailhost.krisman.be>
References: <87fqza1imr.fsf@mailhost.krisman.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gabriel Krisman Bertazi <krisman@suse.de> writes:

> I'm unconvinced this is the right approach.  This is only relevant for
> initialization overhead: once the ring is in operation, the overhead is
> gone because nodes are recycled.

For the first fill I agree. The part I would push back on is the
recycling. The node cache holds 128 entries, so an application that
removes and reinstalls more than 128 files keeps allocating past that
point. In the remove and refill test from the cover letter (4096 files
on one ring, FILES_UPDATE with -1 followed by SEND_FD) the unpatched
kernel allocated 3968 new nodes per cycle. As far as I can tell the
18.8% there comes from the larger cache keeping those nodes rather
than from the prefill itself, since the prefill runs once at
registration, outside the timed cycles.

> So this will really benefit
> short-lived applications that create large tables, something that I
> suspect is rare outside of artificial benchmarks.

That is fair. The reported workload is a microbenchmark, and I don't
have a real application to point to that fills a large sparse table
once and exits.

> On the other hand,
> people are creating sparse but arbitrarily large tables.  Does it make
> sense to pre-allocated up to 192KB in memory for short-lived
> applications that might use only a couple of those nodes?

As a default, I don't think it does. Would it be acceptable to drop the
prefill and only let the node cache capacity follow the table size,
capped? Nothing would be allocated up front beyond the pointer array,
so registering a large table and using a few slots costs almost
nothing, and nodes are only retained up to what the application
actually had installed. That gives up the first fill result but keeps
the churn case, and it needs neither the dedicated slab nor the bulk
refill.

I'll measure that variant and follow up with numbers before posting
anything. If you would rather the node cache stay at a fixed size,
that is useful to know too.
