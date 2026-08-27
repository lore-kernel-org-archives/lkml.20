Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76827356778
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 06:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787810572; cv=none; b=Nc7m+oMBrrjE645VALC/L2sR5s9v5PIeDUAa1LfRsh71oJCaAENfvhU5UWz/TPQO6j8bu3vFmf2H2WS3H4z+V8QbNSgCexoip/2xcdAGkrEQaNMIhqne1d94RilLgmFIg8NyXQ1pRLtxL2USjS+9b5li9MGCm73druvOFSTtrfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787810572; c=relaxed/simple;
	bh=v0DkDeSeO0CyaXOKZU81dJii6FE+xouGX6RiJ0zgFDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ul4dJgHMD0qMz7VJUQwJBDrfSZTih2vR+oP4ODQHkCUp3DGxcC3opGg7xTAW7uUjPRDojHrmQ+gARtXBn1T7O1qjvs0fxnZK4toe2ancZjIdudtOVud2HcrniDJn6OOMiy++349b/XERUnhbHeADADDkLfp5Nq8ED06sdEJj5Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XrnL32xY; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XrnL32xY"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8558c0b26a8so36937b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 23:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787810567; x=1788415367; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OIuQzA83NVqtXzGO6/EiDWZtsLFaTyo/lSlonpMYRbk=;
        b=XrnL32xYb+nSmIRqGb6C5taOoH7MCrIZHk5OouCYo8ZFNsqo71y/vRfwJ+djMmJKoX
         d8dSZZAAR4PL6iwr37mMeYphVLZpuZgeu+lQGImmgs3mbCHYCKCWe+aFV26PxJNapRtF
         D5A3fG9iZdqwhyeidh6hNMJAg8+C1ctsCGZ31uU5NLpK576Mp8PfuuTbWbX04zonTnev
         dKbip0EwGwZBA+dCUKYgT9HI4tK2gywPCY8h/S644sWtS53QsjOUPNdTuEOBDf/UM+nH
         4yiAAJ0POUCXw0VtkPJx7yReeNCK4hcQYQ57fesNf5IWyFpN9EkxJ+D4XHUqVop1lwOB
         8CPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787810567; x=1788415367;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OIuQzA83NVqtXzGO6/EiDWZtsLFaTyo/lSlonpMYRbk=;
        b=aN6b4lhLnDu74Zq3qZatDDxSARtQwIY17CfS9GGPYEe7u//B4XuarfNxl8DhBSSSFS
         BBHEMtZA+gBUV9at6B6BJkidOSnuFyB6Mc/x3PXyPAh2YoGmL/74Smrsf32IOGsceeY+
         o2rKHWxt0D7sKW5Pbb804LNneRuJqugA4dHaLVO6eHLTCBa4mbXS3O086w4IOj0VTMcQ
         RDk/pPkV2JbnOCfm2pObgE1IF9kpW8UXuK3xrXQandRcTL1P7fhjQgliSUQxO5HKMCzE
         87nB1Ro93sim68LIUMeXn6lhefqYJWXg4VqCAH0iLPvjI0irXi2jdNP22lpojF9iM4R3
         6IHQ==
X-Forwarded-Encrypted: i=1; AHgh+RqZlM6i1ZzhkGwkyupH9v3sR6HD6L+VDuznMWjiUz9M9FMGWQXUhs7o4SMqoIW4klrMhRLhs+c/K6i895M=@vger.kernel.org
X-Gm-Message-State: AFuF++mji/7C+G2J6a27Enyyk7FSU+VzqFzGXyPCHK9vkaghJpod9wT/
	1DD878IU2fKaxWtOsc1QPTU8ArZVVgpCTclvgk4IlI/gDm/pagzghcpjnSpKTQ==
X-Gm-Gg: AR+sD12cEBhR973SvnIS+1RVLFWTrBblmkrZXpQeKRAfkXFDpw78KcXxZkXzk4Qho8B
	Xt2U6JMX7d29FiIcegd6C5FJRPlM/N1wD2QfSZeRhT+GV5ONoxZSYJ7vnAzd60KNxmL8A32+8GA
	qelVIPZIDVYrqCLmU8EXD4GRtqqey+W2SAmg+ohbLh7h9t5KGAjQA92q9dvXDpPL7WF1HQGtDxs
	iE4l/0fYAFls9zUKm25uefL4foWoLFvLNvK5L5beqJwA+aTAt2jKI3Rvl+Vm1w+Xnn4JL+CpEc+
	aQCyTEqhqYOJwoygrPE9EA/vHo89lg67XxxmHzmqnpIw7D77QAv0vXihrZO8Rg9xvo9E+R1PMM/
	z2f+wtdcHTyYPT2zbx38DLJoT2/AKVC872yN/zW76ONcsCz0emFnbpoF0CPNYgFbFqwHzyzqJos
	qYAWKz4QeTcgX9a1e3uzLOhQfAt+xf9mPH+2n/rJOws6Z5x/GRg2qCoSxbVr1gp7THTLCZ3AcTk
	jon
X-Received: by 2002:a05:6a00:8c5:b0:847:93f3:a4b6 with SMTP id d2e1a72fcca58-85375ca6acbmr21643818b3a.17.1787810566706;
        Wed, 26 Aug 2026 23:02:46 -0700 (PDT)
Received: from celestia ([2402:1980:88cd:27c4:5897:46d2:587d:19e7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85359cd71e2sm1648618b3a.12.2026.08.26.23.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 23:02:46 -0700 (PDT)
From: Liew Rui Yan <aethernet65535@gmail.com>
To: aethernet65535@gmail.com
Cc: akpm@linux-foundation.org,
	damon@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	sj@kernel.org
Subject: Re: [RFC PATCH] mm/damon: fix damos quota walk-position tracking
Date: Thu, 27 Aug 2026 14:02:55 +0800
Message-ID: <20260827060255.18114-1-aethernet65535@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260827055426.16874-1-aethernet65535@gmail.com>
References: <20260827055426.16874-1-aethernet65535@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi SJ,

Apologies for the noise.  I accidentally started a new thread due to
missing --in-reply-to flag in my git send-email command.

Original thread: 20260827004438.82746-1-sj@kernel.org

Best regards,
Rui Yan
