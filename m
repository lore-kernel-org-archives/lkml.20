Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793322796;
	b=oVVlJKFRyfXRJpk3kMMc2DS2VW/WXMET1j5ydhmNjnSiUM7R5CADjhqNkdSFk3qbDStR
	 XIHHyXjhigvwZC+TbAcxIUGNwFjDmyCBg8wPdxJFEEXXRD7G93YpJ9PRXj8IFzrbSENnj
	 ENh3ERqIGs498KlTJ7A+modyCdRkOGoYzHpInOrAOYOL+pHhykX7EnckPMKhhVJNjb+WC
	 1pWf2zevtKgAE/b34yccCU0ec+0My/dEveAJtpj8Q7JH+2R1/ZC2onF8ZXM1aPmex2/ID
	 JIW/EZpgmOE5LpvjGwiNTBshCAVwaM31tBsQMqNRMHxGEvjvhIW5BeVy6BLUhA7dvOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+jUw8Bd/Jslu03fjp200As37/ZzXC3YVxNBvroxscwA=;
	b=YqFc6bjFq9hqj7w6Xc0i1S8P2gdG3ilefHOkhJTDnFeLS/xH6zoKPUUQeLC0XItcxgWP
	 40jJmE4QDkXjKotsFLWC5OCXw/PptkelI7PToOBxaaGbVjT0UlGgI2R3z6o8vhBt5Upbp
	 KGTgaq0Vtj3qehhv4ApKK70uErfeYzdi2ov/Bm7XDP1oDEOJFRIOP7LX5Zqk5aQ/QSGfv
	 v0hpSJ7KeK6hDL1C22/5CLz7tetMQvRc6ZNsxyfOwC3h0bI2lWd1LZYHQd4DwjjlWLl5v
	 5ijaf503RFMdWfONMvQPjxV287Rwg8OHKQXXS3qM/ugP1YICi2iMoBOvL3bKpwgr/WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7ECxrPu;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02409606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02409606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=C7ECxrPu
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-369f33df08eso485045eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:13:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793322795; x=1793927595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+jUw8Bd/Jslu03fjp200As37/ZzXC3YVxNBvroxscwA=;
        b=C7ECxrPuwXKmtCnR9zQ5UVrBA9ZnwzJeDyEym7gi4HXYEgTrZb6RNABLI02VzTUPkk
         0xrXqeCGLGxdHW9chPwY9oHqbBvcSFB2TEtki2VETj1P7K1PPZ9vQVTtq7d6sgPDqMjm
         cCmelUwE+X8lFarqT1y9UE6Cy2dpEGFtEMnDB96o7S0epnznQ7E1antid2nIPSTBsWAB
         f+4BwJD8z2Ce4mBwC+7d74g24BsM0githUMuRf73+y4k8yR9fytO+kaj4uYRnSBJip90
         8xIiD+kX3dvl9r4E40D6LGq1la0LevL8C9Wp3fMrzQE1/jGQivXDAVL4/IqcfJiBfvFK
         u1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793322795; x=1793927595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+jUw8Bd/Jslu03fjp200As37/ZzXC3YVxNBvroxscwA=;
        b=16GNOmyDpSMDPPXfRg8KTkdkSOQ/DnC/dqeNLEgtSGhp8gQEkgfecWA43SZpsMFCC7
         prFA93RNHauE+ByXgF3DoXG9JqkaH7TT2JFMlevoc28VFKJj976Lm3Sep6BR44nGI17a
         BfwFSwSLfsDoZVy+JMkLJofCz0G2GhJdQy1kB0KeKdQQkuLLV+4IEFLbBNeGbFWdMKuU
         2qkp5ehN99RuY+770XOoEPeaNYVAYfryqUJvoxRxaJEkFzwDYVujemPWlx7DZbdXsenY
         SU5EdeuMVxfY4AfMYP5yIeXDS6a7/MYGip6yC7s09RSi8ZAp08msYMAt3lJeKMT3A3RG
         wurA==
X-Forwarded-Encrypted: i=1; AKwUvBzkbejYM620I+gyfz41z+7gawyp1vsllcXWKEDeH404bcIL/jyeP7SvR7MxRYVZXtWRiX9DZ9YZyD4bkW8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLNly790luNjCOUUJvl3KcwMsuWuZHOGqLU+O7mPrXE24Kxo4JE
	9EmPEy6+AAjin47lb15mUSmLkU4i7gR3QrzuAx9hrIgcUGzejUM2qOfS
X-Gm-Gg: AYBFou32NWD0daog7dDNLpYpDVG9XD/RCzw7ipfnbjA0wETI351VrRahtQ0gIcgdw4n
	Uq4yTfSBU3ubcV/BlTYjjFL08LUuLxNcX1gfKOYK7gcDqIhU9o+gAMyh6bgmc1D8qXPsO7heopB
	O5Ywll0e6uqcUTTV3mPKHyhrVV6di+Q+Q4xu6WC5X2gbAGxi71xF3THTlBePEKPmzJj7kRSaRwv
	qoCYRsisNHx5mqBrIL5bLPElUJYmmLErME40z2pM0v3F+tndJQCi3kxbhrDvQuO3EtNZePrCcbm
	mjZ54soY/2tpMrsOyfc3x0Z02nvpyQ5zGX4sXNPMZy9oRX/6a+qnnxbKdZweDHqZYxSRDQdeURj
	JML89PSAGf11Hwk6C20LZck7oYtwQEwAILLaZq9j/Tnjgn3xz7LKjQPXdJ87fBJIlSvhiiQsuga
	5BYFSDn3Wcp0ySNiYvLiwy3F24Hwrl2g9H7Ldj3Mwd4iVAl4yCgvEODC5ufBpZyKT/jAS2tcWtr
	EmRbmi1Lz3KOmWKGX5DT9+JW6VwTOVe4uDhDlofe4j1xOofRxSMyRNHU5+6X1DvZVVl/r3yZ2VP
	Jn1VqrCJf8NzNifynHys0WK2Fwjfy/+MimkJxNwSJPH3geXhvTfQoaeYrnO71I8vxQ==
X-Received: by 2002:a05:7301:dd95:b0:36a:43d2:c9d4 with SMTP id 5a478bee46e88-36a43d2ca02mr888540eec.4.1793322794937;
        Thu, 29 Oct 2026 18:13:14 -0700 (PDT)
Received: from jeuk-MS-7D42.. ([211.226.54.223])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42952e1csm2323086eec.20.2026.10.29.18.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 18:13:14 -0700 (PDT)
From: Jeuk Kim <jeuk20.kim@gmail.com>
To: bvanassche@acm.org
Cc: James.Bottomley@HansenPartnership.com,
	alim.akhtar@samsung.com,
	avri.altman@sandisk.com,
	beanhuo@micron.com,
	can.guo@oss.qualcomm.com,
	cw9316.lee@samsung.com,
	hyenc.jeong@samsung.com,
	j-young.choi@samsung.com,
	jeuk20.kim@samsung.com,
	john.garry@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	mkp@kernel.org,
	peter.wang@mediatek.com,
	ping.gao@samsung.com,
	rafael.j.wysocki@intel.com,
	stanleyjhu@google.com,
	vamshigajjela@google.com
Subject: Re: [PATCH] scsi: ufs: mcq: Reap aborted CQEs before returning from abort
Date: Fri, 30 Oct 2026 10:13:00 +0900
Message-ID: <20261030011300.1868002-1-jeuk20.kim@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <a7f072a8-01be-42e3-b17d-4bcda4c7cb55@acm.org>
References: <20261026091745.1490707-1-jeuk20.kim@samsung.com> <a7f072a8-01be-42e3-b17d-4bcda4c7cb55@acm.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bart,

Thanks for the review.

> If the late CQE arrives after the command has been resubmitted,
> ufshcd_compl_one_cqe() also overwrites cmd->result and calls scsi_done()
> for the new instance of the command

Fixed in v2.

> Please release the command only after the host reset has completed in
> the timeout case.

Fixed in v2. On timeout, abort returns FAILED without releasing DMA.
Recovery is left to the SCSI core.

> Note that ufshcd_mcq_force_compl_one() skips commands with
> SCMD_STATE_COMPLETE set

Fixed in v2. It now releases timed-out commands' resources without
changing their result or calling scsi_done().

> Have you considered setting a separate "completed" bit in
> ufshcd_compl_one_cqe() for every command type?

Done in v2. UFSHCD_LRB_COMPLETED covers all command types, and
ufshcd_release_scsi_cmd() retains its original semantics.

> Does UFSHCI guarantee that the OCS_ABORTED CQE has been posted by the
> time SQRTSy.CUS is set?

CUS alone does not establish that software has consumed the CQE.
v2 waits for driver completion in ufshcd_mcq_sq_cleanup(), covering
both abort and LU reset, and propagates LU cleanup failures.

> Please don't mix SCSI EH return codes with negative errno values in
> one return value.

Fixed in v2.

> Calling ufshcd_eh_host_reset_handler() from ufshcd_abort() is
> completely unacceptable.

Removed in v2.

> The kernel-doc for @flags should say which bits it holds
> (UFSHCD_LRB_*). I'd also define the bit next to struct ufshcd_lrb
> rather than in ufshcd-priv.h.

Fixed in v2.

> Please add an in-body From: Jeuk Kim <jeuk20.kim@samsung.com> line.
> Please add Cc: stable@vger.kernel.org.

Added in v2.

Thanks,
Jeuk
