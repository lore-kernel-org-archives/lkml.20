Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE34E518153
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750578; cv=none; b=UUpYfp+JyKLI7Pd4ofesfUcxXUicOqbgD6biW/KYCJKI1iyUnWTObJZOwug4rZg3mfYUgA33iEUM4pVUaS15LfOi8mCjqTZa88SpEp9LE0zC2xkE2GwzAhIN9FIjUXxNP97QUOyTO+bZET5LTJHbZbMThKo3LQioD1UNwlcXj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750578; c=relaxed/simple;
	bh=U/LYoO7oBxOuvMc09F7HnYsAy38akskdSWtc0NSRjB0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KWIK+99oW/xL/be7xMDZbsWFG29/oA4Jkq+n7ANHfpS52ayO19zZu4J3pf/5VjTBapFokrmGB4/AP5Q1ue+8kfJrEVKB7pHQBOPHIJDVWqfHV2+kWJo7m9R+ET+X+11x8rS1xzck2R5A6k3tyXGxlZhULC2v4a0fTipbir2s518=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ifApiZS1; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ifApiZS1"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2dd4b43b20bso7443025ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750575; x=1790355375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlZnDcCseMui9jUINJQcjoCRqZxi7W4Ng1w2zFUjkmM=;
        b=ifApiZS1NdInPxdYtZTVQ46Q7vyyWRDRKf3XbM3ScVLxSkaPKnTrgu3KFdj/QbUJtc
         sx0FEfV9daGJ57/TyLzwhAwTNx5yK2bBreomDJ6wZWhHQbjXfkyplF7Gnv9QpoGPNI5g
         C3I7QzyWmHAjEGP2OncxnA9v7x1jbKmp49aeEpItknar1vWCaIJbdUiqofaliXACz951
         b97eumQSsKmcj2a84MiLfFeeDAoJkpuSra/Uw6eddZfd05Ehp+X+iGJpgp9LOGkOsDHo
         4s0F9HdIhPJjgQcFoYM+Sv7AePTB5rnpeG5b2drEShol9ZkcB9szeCZwWg4gLUraQ1Ey
         rqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750575; x=1790355375;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlZnDcCseMui9jUINJQcjoCRqZxi7W4Ng1w2zFUjkmM=;
        b=juiBg7dBpgl2M9YH3pDchggXHMOYhEDMpBPPOaiY9iC0GdZyvXkeUW+bI9i59miDla
         ispctwGYTNybF0hxtJWagFOhhEMih7WCYB/F9cj+mNGOdj0zjjL1R1SIIQBEAxNMn079
         rbBT8ubiXhAnLUT7tSUJAmPmcl5R62qwQ9hPrmLpRdGEMdzzxzB1HoYf19OPItRalqdr
         cpe88s0jf5j5mW1T7eg6Hz7IgFvXOPuxEOEOvvVRKOwNPbyLnSknE1ddJIvl6yB3+z/M
         50HEwpOX1QKlXWFV6SwAPY6poZPSN20SpQJQxwUfP8XzDlsiqBbXgsbmXn9NjkSmiuLW
         SuYQ==
X-Forwarded-Encrypted: i=1; AKwUvBweuGvVEfFu+smLNwJ0uzlb5Gaj1smx03IN3RmbuywWXP88+LDpksHeEFUzG3sfrFlm6WW38pXjSd75d2M=@vger.kernel.org
X-Gm-Message-State: AFuF++lQgmpwmKPyVBIu72hKe+/evLFpuxGIbcjwWEU34m+Ip/dDsA8r
	M6sfdbnJq152ivfSE8iGIymDcrEjGavcjLXG4ADvz7PyjfCfumhzDOcv
X-Gm-Gg: AYBFou0OT75wRaL9nTGyEgw3XdPvOCKzcBgUaycdDP7LAL6n0ecGlhPGcMN6cnCb9/V
	nigWV0E18iXyP+RAMFHE1ZbZbmbY1eE6C+FMbooKS5QZx7Va8aJQQUq9j1n2iNW4dgrJnEPh2Jh
	qKnoamTNeaV44iKi7mH8u8wydRuZosSEidBWCnk/WIt79bXHmAD0w+h2MHpf23+BxhWN+WDnse2
	iWMgScgwdd8PCMX5M7mr7WE0mhjzpgOQb18HvAgzMcUAHCq3ICzBZh8j6XlUIaXQ/eGAM9uRVgh
	BWc3HDvxgtx6S9BbzSebFSG+8K6k5YVLWLr4cLjF0SkpdlIzd57dnQbl6mlvBonBDTxDXE1zc1m
	eWU+fHsSzDhns3GnP5UwHZ6D8pYsn4VpLXiULxm0IKVF/pG2kPqeJpInqvVXYg8CVq5nLQGAiAK
	Jxel5yFNR4WeZcKYUljfH8MVIRVUqRf1wHi0tzjzhopVujlxNpRz4rv9RM0VjRWrY1tQ==
X-Received: by 2002:a17:903:3205:b0:2d8:f965:7e48 with SMTP id d9443c01a7336-2ddb1ab3990mr72792395ad.1.1789750575418;
        Fri, 18 Sep 2026 09:56:15 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb75bfe10sm11409685ad.64.2026.09.18.09.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:56:15 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Muchun Song <muchun.song@linux.dev>
Subject: [PATCH 0/2] memcg: remove unused page-based helpers
Date: Sat, 19 Sep 2026 01:55:56 +0900
Message-ID: <20260918165601.1014666-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

While reading memcontrol.h, I found two page-based helpers that have
no callers.

No functional change.

Sang-Heon Jeon (2):
  memcg: remove unused page_memcg_check()
  memcg: remove unused mod_memcg_page_state()

 include/linux/memcontrol.h | 32 --------------------------------
 1 file changed, 32 deletions(-)

-- 
2.43.0

