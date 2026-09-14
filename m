Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B47477E51
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 13:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789392902; cv=none; b=e1dGz2OwS7RDk2h8PA0yt+9oSTPYZG5UsvrFG0NQNW9/CRvkinSW5XkDpITf/FoOENlIYFNb8azBlsR+c5nJcY9z6RaNCxm+iPkY3HN9cqTK0sqxbLlolVUVDpLYBS+SY2iGXMRpLoNeB88pvLhys89Foetskp/+ftbVVgcvIzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789392902; c=relaxed/simple;
	bh=N1I/WhP3GLzQG1Kmy9w756cHt+cWsHO36KxPWZULwGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c1QxXOo2EOc9EQEwHTmg/UbRaKSGlcyAKZ4U4OfzFGIdOC0hvrN9BeEpsPsX9fGz6MLLvLDkg4c/vvmXwei+ak8mSSHqJT8cjIqFmYLmB19drDg7S+6pcWF1CGAaIRvYOzTek8gtsL2oBQLRpFAwnYSmZwXU7yFbw7Ba3xADOO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XvCQpQiR; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XvCQpQiR"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49c5a927a1fso807735e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789392897; x=1789997697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N1I/WhP3GLzQG1Kmy9w756cHt+cWsHO36KxPWZULwGQ=;
        b=XvCQpQiRiBV4/3qqZ2+G9UedYpFsvJQYkGhvJgcLeI8YZoFmM7x+KxZQZGHsHQpJWN
         sHCV5Vbrh3KQceA9tExLEYXPp68TbBtD7PBRyV4TLDrrjk9GV/Io6uBZvx8YL0l/gRx9
         sMvLi5BbxCkBP+HLx8unst6vqgIagD8sfKoWcZpwXqpl2jpqcSF4PAONBQS85pdKCjDD
         gkFaWfcYa8pmTBbFvONL0bIIqB8XzbJhyNeWbDT/Sb+z1waZ7mtwtobiz8ST8L7Ycs7s
         ObuzEHvch0xocb7ivwsoljL0jTyPy2nq8kTcoHEFkC6Nxa0FR9rXbRpS8A8fXh3kyfQ6
         OVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789392897; x=1789997697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N1I/WhP3GLzQG1Kmy9w756cHt+cWsHO36KxPWZULwGQ=;
        b=Rpr6fUj3a0GAyrChZIYOL0BMTTS7lkZ3VYfnrIb8P4Xv69mcPtEuS05nIjnrMuv6PV
         78pvRQDSCHPYIa678uUBnpZIbe16OgTfemcRgHzTXGfd4UT56YdNtpYReJ6XmeMuedFR
         PXFr81aoyqZ6xZ4xnjtwKcjZ+ywVncIYEL2kkQvcYlLTDBO4b8FJNMk+d6g6yd3+U7Oc
         RVL+wrFSEG81wvrTl10YREAXewlS8sNRRpDO+ED/cARHYnlDYH622IpDFO9dXlJGWTXw
         5Fa1tEu18GEV2vXRHcB77EGH7+B3dqVK6Z7dgYRd3vEqDxp0pyiBp53ZPuUNNfJN2GO+
         0Wfg==
X-Forwarded-Encrypted: i=1; AKwUvBw1wcZCmJNj/mjM/t+kCD2w4Dqu041dulOSOefwHahnaXEsnbjZrAabvOgdFt+PsjlIX0ATwvx3F5+ZaAU=@vger.kernel.org
X-Gm-Message-State: AFuF++nDxU2r3HPh+mbBIq/Kd8JdtCUnpyOJvVTHjdA1UuRGi78+TNv5
	P79JoHo6jxsriCc1lX6wVB4o8pzhF/jQRBSnnayHhTrBlSkPAz0Em2e2
X-Gm-Gg: AYBFou1jSKnijL5x7eTuciKGDRpPlMhwEs+ztS85ueBgq7OYBhqjZIxijFD72rr6agk
	sM9xcgVjLtfoqJEvioNGMeWIcBWBTlaeoK/5ediWf1tUePiRtNVasJQD4Wu87t0z89T2/AFdyOx
	VTATebulBRloE7gh8JYEMJSmv0GKSBn+It0bWNjZd4RFt9s/wBa0bn2O2i7SxEas7qW6uStpKBj
	b4fQ9xaNG6ujQi5/TXJb06hNpOydsFJnPZu+1eKNKsQcAlQENi9lf0xTYTlINYxNzkCv0GBOWii
	ESGnLL4cqyHSSrGurYK1i1dMiQfFYvo8qomf27i5acSwoRmPuy3LNGbUHTa8NZ3IZDNqzugzZK6
	+T1FhOEeBXDwPWFBpQYjvsAWaVAFiOo0T4wrH7/G/f1e/pjUBMeXNUYwKlhvdp57VyBb58/bQYd
	kXYaGuwrJjpb4LdjyeZgubzp53UB0N13AoHi0DfEYCEaGOOnLuw3DHPm0Xi3o4PhOgw2nqhaDfZ
	Dg4E+rEFW5HnWE72BnnItWCo825GPtFOYVYdYDMU8PWR1k4gwZAcw2t2dGscwDGApettPei2dhU
	81E=
X-Received: by 2002:a05:600c:19c8:b0:49c:f9b8:bae0 with SMTP id 5b1f17b1804b1-49e7a68a919mr33411185e9.2.1789392897309;
        Mon, 14 Sep 2026 06:34:57 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B85A6000F50888CB3F3FDEE.dsl.pool.telekom.hu. [2001:4c4e:1b85:a600:f50:888c:b3f3:fdee])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm419054155e9.2.2026.09.14.06.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:34:57 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Triet Hoang <triet.hoang.dev@gmail.com>
Cc: Sidong Yang <sidong.yang@furiosa.ai>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Oded Gabbay <ogabbay@kernel.org>,
	Tomeu Vizoso <tomeu@tomeuvizoso.net>,
	Igor Paunovic <royalnet026@gmail.com>
Subject: Re: [PATCH v6 1/2] accel/rocket: Check allocations before use
Date: Mon, 14 Sep 2026 15:34:36 +0200
Message-ID: <20260914133436.8198-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914045605.381933-2-triet.hoang.dev@gmail.com>
References: <20260914045605.381933-1-triet.hoang.dev@gmail.com> <20260914045605.381933-2-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Triet,

Re-ran v6 as posted, on its drm-misc-next base (5052ea2e6bfc), on
RK3588 (Orange Pi 5 Plus, three cores) with PROVE_LOCKING and
DEBUG_ATOMIC_SLEEP: 30 sequential clients, 10 pairs of concurrent
clients and 5 after runtime suspend, 55 inferences all bit-correct
against the reference, no warning or lockdep report, cores back in
runtime suspend afterwards. Same limit as on v5: the allocation
failure branches were reviewed, not fault-injected. The tag stands
for v6; please keep its comment:

Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588, no fault injection

Regards,
Igor
