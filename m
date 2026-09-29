Received: from mail-dl2-f41.google.com (mail-dl2-f41.google.com [74.125.229.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDD61C2AA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 02:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790647649; cv=none; b=UXHF1IEVkVEDH8JD9jZJ6OxqwGR6NZKt26BbTUXX79pspqLIF5qYr4ujekmhLsg6qrV45QR9dSaoU0sa06959AVwilPX0YCK4ZkablPEpPSaLLPjDy1EVHIJRHWdbhVR30aKSeh1DSFIgTyL5xJECW3YJo7aWBg8qbAXvhJES3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790647649; c=relaxed/simple;
	bh=9gfcbmrzOmCvyf/1gnjeAcRps/PdsytRin5LsL6tW98=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=iTHlIMyEpKO7N+T6U/3hPpd/VWtpGTVc0yKBvMzdhaG09SFYuIQrWXt+BefnTyNtr/kRvo4rk4KH7lBlK7WGg06BCJ7aPsExtj5zIs4sixt17VmIet9s2r3Fmt7S7/JXwRI/pC5eL41rvoYG7LZs3IG1wHt7388KEiUDkg59hfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JnTCqlva; arc=none smtp.client-ip=74.125.229.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JnTCqlva"
Received: by mail-dl2-f41.google.com with SMTP id a92af1059eb24-149d5ec8e96so455857c88.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 19:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790647647; x=1791252447; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=fbDwKzts0Y/4dxNxzvKuYePx4Mzwd+ywZtamrjsWr5w=;
        b=JnTCqlvafBPdZUZhC8N49/E3YgMMwijfhjYhF1HemdDdWvcW5riXup8f6SYkldLhb5
         vMvl/0FNPx9LUIYuXWdR173ew1FHAYq3B3WB3tsCv1u1FuVNvDVtHXELZTeeMXssSgNW
         hDESh5jK4UT2W+vUDPWOesmbcujOeMeOwsYn7Nh6/xzFi1TO9MLKrG9LK80wa7SoqvA+
         17/NieOq1nSDT0CTlEuqSnrcZRjBBza/DzOyC5xBGhwQGGN0iX6DuZwRxVnuOZK0B997
         3JwbXlUt9X/yrMFk774JPZtEr39WNz2wUxKM3DCFR/kJs7TiT9vISf+7anKoc5fTuEx7
         ouGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790647647; x=1791252447;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fbDwKzts0Y/4dxNxzvKuYePx4Mzwd+ywZtamrjsWr5w=;
        b=Ezr40xOLeVUwP7E7KI2GSVNzVGhh7FMTqKUyK/7Bxfh45baIQFv9naDGouW30NRt48
         1Ww+AubbC1PdW4BeButtPbsBOExzx6IO9gCJ+Vswa2Me7ltlV1rgI/lh7yzZdPQVKX1u
         JA4CIkYElRQrqbETlBbb7DfO9fC2M1ruhYTxD36x/s+8UJXv59No+XFtJqhneJ/aO2hg
         lNDvEiYhWguA0+8nhaw93Xyk8IsjHLF9gtg6/SPtdnFatdI3MmdyNCZVe4JEy8FG5A3D
         /bcV+NNPt8bS+EasJbW1Zeyhn4ZKC7vlY73jMwWi2W083TmjSTamcED45mDxgs4j1+kn
         z5Jg==
X-Forwarded-Encrypted: i=1; AKwUvBzDPzn7IRhn/ZiKGBglMTU95NVKpr0+gTWQdNoEn48OIXR+s1MqqFuwjoo/kxQIrshm1ocwmQXPXZRTyi0=@vger.kernel.org
X-Gm-Message-State: AFuF++ki13piPFVqJDxenRWwMeAoHv89Ys2PGlrb4s/ZwnWWpBpdXhvP
	iSMLdbxc0C7m8DsbOTZqLsopdepHr9uWk19tpAhpiMjOOQnuTQVh7c1HEed2awMF
X-Gm-Gg: AYBFou2+u1Mdg3u5pWimHUGO/myqqHdFvH2fpoAnZZWSlJwP23g1olZzLrT2AXDKxa5
	Iylii0/1uTPea7CB8Nb+inpWPffDbB+sb1GPoUxOZVMLpdJT3hoGyB4mUgtT+38oi7Q0oTSAWvm
	RWi/fvn+NdVtxLONrxhqj4wnu+vp1iT8tW+qjxOfZRGOB1ag9HAVKWtLV96cMT+jwW2Wecitgwk
	3XIHlQTwGVo9B2qD2JNfh8g8dxi1Nbd1Wk2AMCLztJilQM7PLddEpZ8aTDQLRutug3jrSxf78rd
	ySpaJx2LPDROpuPvYyhosJOWN0AO2ds75VkotOVFHaJy0AmLcMkvX0bofRquuBcOIGJhtB6TAyK
	VdKKTQsVoCAAWLmoXAiUcrVX9d3t7RKt8V5oi1JcbiljWWD/ZOMM/Atg1FlvELqc4OpbsWz8AZ5
	KywKli8vNAEjks7YHMJzhf2ZAYxYyKyh9t90S6YdA3IoOmbG9K4ZhbB5DY4ho25b2TceURxeem/
	RgkpdW9E3Ud7vu/22C7/eTKTu3NnIylhwMyn+gbVQkyS1f3avx3tA==
X-Received: by 2002:a05:7022:1586:b0:143:26eb:18e9 with SMTP id a92af1059eb24-146d00b72bdmr12928702c88.28.1790647647112;
        Mon, 28 Sep 2026 19:07:27 -0700 (PDT)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145a7318afcsm26831012c88.0.2026.09.28.19.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 19:07:24 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC 08/12] powerpc/pseries: Annotate the DTL debugfs read lock context
In-Reply-To: <590f421ed3946c7908783d10de39a9127c4cebb8.1790517984.git.ritesh.list@gmail.com>
Date: Tue, 29 Sep 2026 07:34:14 +0530
Message-ID: <mrt0ke3l.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com> <590f421ed3946c7908783d10de39a9127c4cebb8.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> Clang's context analysis reports:
>   dtl.c: error: rw_semaphore 'dtl_access_lock' is still held at the end of function [-Werror,-Wthread-safety-analysis]
>   dtl.c: error: releasing rw_semaphore 'dtl_access_lock' that was not held [-Werror,-Wthread-safety-analysis]
>
> Add the necessary annotations to phy_attest_sequence_{begin|end}(),
> to fix these errors for enabling Clang context analysis.

Sashiko pointed out:
  "Does this commit message reference the wrong functions here?"

So here is the corrected version:
 Add the necessary annotations to dtl_{enable|disable}(), dtl_file{open|release}(),
 to fix these errors for enabling Clang context analysis.

I will wait for any review comments before revising v2.

-ritesh
