Received: from mail-wr2-f38.google.com (mail-wr2-f38.google.com [74.125.225.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957DC3BED79
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790242757; cv=none; b=HW8qPraOisDflV5w/JxcZR/wvMv22shdm6gjCe2OrheD6Knjilvu1ktaM9KfO3Z/BTzBtHu+h9aKez/GJqGGs21lNa68NYa3WkKM8kO2Dy3r8pi1eiQiEtJBV8PblAVluLM5XpHo4FSauuIn4F9hHMRKLfh/zHkcK9agG1PfB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790242757; c=relaxed/simple;
	bh=LfT3h3IRUJIeIqCLIWflG2ESFNR0GkhmG43HFl2Rgv8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXR6T/ngVPp7eRW4avrTimUfbv9uR9RT7FYaveyhleInZ+nodokwmnApE0iY4rOhgBbmyOnrAQtZsPBvJIcTklBalEmLhFrS8BmhO+nBMNQcN+v1SaiL/sa0C8Cebjbb1O36wrlzxLPtJWwPnpuCPIC304uqI2tNEWnmb5tCMtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XZmu/RcT; arc=none smtp.client-ip=74.125.225.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XZmu/RcT"
Received: by mail-wr2-f38.google.com with SMTP id ffacd0b85a97d-482f6350f89so1291861f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790242753; x=1790847553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo1Dt03xk0CNyDvjLToBhLcXGkmtA+S3j19+BkyISnk=;
        b=XZmu/RcTq4qU6ba4nVDwYBtwiF6Kv/I2dLvc1vHC2DJwzQiwxUfnBbUFxhkWOMSN1r
         UM/Am1Cy4yCP1Y052JuP1NPBc67wBBh0UpZObqwznNOcR19P0yLBXi7B/ExI94muqM+2
         rkAwbX99KknRGefOz/6VJrTqo4EjiuH/JNaAIMaX0+ra+ZGns6GmKxnr8CtOMe18/pNP
         6rNzO4CS9dZ15RMd31vTWwTxuD2b8c8j+EZGDL5kY8b/25cQ7oS0s5b5l44V00wExJkb
         03uMgTX7pPOVlb+HyNstaO9o4H6c041BKVGSU4pcckNg9jogJcT1Om4LVk2BugIflM10
         bCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790242753; x=1790847553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo1Dt03xk0CNyDvjLToBhLcXGkmtA+S3j19+BkyISnk=;
        b=RRYWaSsupZ+KS8znvxOqhGVcNtCANyJ7klBhDNUk/9bS8dToeiIQ8Kt49M0o4LBfBh
         iAKzZwD6ONqP56FWVdpRsz4tDXlsjnnZUfKrt3xBhUreMt1HezEV90SuaFH+piR35pV0
         zHJLZkFFQEdzHiDz3xdJ7axOs2yAFUMPXXLqTVCm46vn43i75wR5tCbXoWIvIVF61eeu
         a7BAFhapsvl1ZjIMXMPqpMUDg9NUKBzsDQ0sLN7h+k9JyUhmxV+2EttN+ysqosogWXfU
         yQBPF99E1gEN5bCvYX8HsXbCrabuEY2mHMJyUj5WLgA92cSWCGYO32H6P9rrLBacB16U
         YYvg==
X-Forwarded-Encrypted: i=1; AKwUvBxSY5E33OnhChqdWUCyTxq8h6lKjvY2lpyarkRzNdkS2iQ80MksS/V6BOK03JBwxRQp3xIDnXlqvpN7pXU=@vger.kernel.org
X-Gm-Message-State: AFuF++lhgBk2d9jm/B+cyAAY5aQU8ft8A9XrrQtIzJC4HRwzUvc2fH2r
	gd5nj6PbAyZinCMwq5jNl2zBwWlvWFHineGhFYglOVSxm8I56wJ92nZy
X-Gm-Gg: AYBFou0vGWIVHQzvUd54pEl84EVggK1/MezO1oRz0PI9OBY6S3+3DbC9/QOZh9em84I
	lcr8BX7HaZ8Op5RyiGZ/mtnmzd907EQPsddi5sBwSQr+/z3KLqnLeXpyMepQgk1CNmQEWABNiUD
	FPHhd0C4Tfl3GjxPqaUNLI2XIhq+Q5mGPYpKthNwEJrupwQqPDBnuBCzVcJ66jobQqSVpr5iMua
	V7kCGZdqDnPFcpvoRwqAi9RZYFmxJJXYGiQAVl4Qk9PHkgjVFuOW/SlatWHOOop8uhZORZSgJik
	FpthljIx+VSRFbCDjGXgSJzUw8iQTB0El+1jGSFVih+FQqaSTmgbR7sjPG6aU+S0WDVUSeCpRGr
	zTjX8qG1efoQnao8QlN20b/WEZF5gBw2Il27HlegDCkR1UoUdz+BZCFXY4vAD7oQNE3zFszPKO5
	bv6adHeuO87oNPQDfZjmZ/OItG+DUX0/9OFF56PMaIJCAcJQ4Xcv1X4RZlswrtvyLuEt1VlBXNi
	euYropr1s4J4fFExgV51TBWcoVhSlg7NkQ/HmJDq1VwL2HJ/UNtgOIGOvj8eRUXBnP4OhGs
X-Received: by 2002:a05:6000:617:b0:486:f46d:bb02 with SMTP id ffacd0b85a97d-4887197b60emr3087180f8f.57.1790242753297;
        Thu, 24 Sep 2026 02:39:13 -0700 (PDT)
Received: from localhost ([188.234.148.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-488682668e7sm15230022f8f.4.2026.09.24.02.39.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:39:12 -0700 (PDT)
From: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Vishal Moola <vishal.moola@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	x86@kernel.org,
	linux-mm@kvack.org,
	regressions@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mm: don't schedule deferred kernel page table freeing while booting
Date: Thu, 24 Sep 2026 14:39:09 +0500
Message-ID: <20260924093909.25643-1-mikhail.v.gavrilov@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arTtl-7Nl5Ie0SEs@gremlin>
References: <arTtl-7Nl5Ie0SEs@gremlin>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 10:31:15AM +0100, Lorenzo Stoakes (ARM) wrote:
> I know I said go ahead so it's my fault not yours, but in general please don't
> respin so fast :P

Noted, sorry for the race.

> Maybe we want to ensure the drain? Like below:

Yes, that removes the one caveat v2 had to state: tables queued while
booting no longer depend on a later free to get the work scheduled.  On
this box they were drained at the first module load, but that is one
machine.

I'll mark the initcall __init, boot it here, and send a v3 no earlier
than tomorrow, so that the others have time to look.
