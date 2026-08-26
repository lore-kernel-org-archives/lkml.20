Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092A83D1AA2
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 18:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787770668; cv=none; b=KLVBjGV6jpV+/XC/tAOvdEa6V3ld6ny1zDlepqkVIaKrHFFJRIaVoNlfCrIdV+a0fshxgaLZsHhhzznYMcdV+0uMuSt+4kGs+cxFjjlySKGtHfC4WDtitUgSfTQlPZNi3WPgGRJRWSAIqmk9ZCz0y8BwPwKHOp9kAfpwkSNI4OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787770668; c=relaxed/simple;
	bh=eqW9dULQhhU3G7ws54zCceM0EoBsczV+jS1ZQluWZck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WI0Q6KRKC8E3bhELgJflYVmQr2h0bnagAWwTXUq3eTqHnzEgVeoHSwdEMJtE7phlEcvLm0llAMxIIViA1Pl5Cp0A8ogxmRjO0txNxZLmECXKsnBj2aW4L1AXn6uxPSnFOTSHCdg1nj+6rl4r6Y47heMP/L5lnIHYE7YAMFI/9+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ew9SP0fg; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ew9SP0fg"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52f9e79ed93so4212501cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 11:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787770660; x=1788375460; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RDUN/CqDH3QUdCprOlnwnW7Ph3YkwVfVnP88nyyY1gM=;
        b=Ew9SP0fgJTCSTA++0z1+h09vu9Z8sahGkQ57iLf5bERBL6R9B7HX5reFwOS85YyeKG
         56ol4f39fq+QSN+p/TdsPxMeAp51rAJXzFVsbhF6RAdYyr6tIHW1E+b30moDuPCtmg35
         OS5UkLX6no55HVfrBw1eWWjh6fBmy8UnVX5lIIRwC8v0fdFRjNrTwPQSDgy079f4Gz4x
         zeSkKJ0EtgVH7iVZP2NLNzlKmjyS4TRKEUVrKyrBb871312t3hwcEy7Xs9vMvblo89W9
         XNJEva/SL7TFPhxn+wExna2pi4J2JO8Uzd2g6+qHbZGkvRDt/GBpLp6eIKkuHciVXGaP
         QhVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787770660; x=1788375460;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RDUN/CqDH3QUdCprOlnwnW7Ph3YkwVfVnP88nyyY1gM=;
        b=mZb9lxqkeBzFgEVt4zwZHb5DRNlCC9g3Alk9YIqu8VX4erKKY2gtSSy3nNksN6J07o
         VDZFkhIhHdlrQjCJFj8xS984k2gLK8dl+dMuCCXAAyrj/arkx7ytPceDw+RuwK/ew/j1
         MpKHfEpckWQuGhXmHaUj9EuQ7qnuOsy13WhOljgYhvj+L57WoWh9iYvjCGEGk690Pq24
         /Amk/WZwdo9568+fGA5hR8BwglO6oiLgGn6Z8R2V867t1I2cQscaOTgG2cvY6SdvPcYk
         wuHWkhOO6a0zNZ/YfvSTugOHOWTUeejnB0uhcIMnA+rjUBSPzAQMFe1RIW1CWMkRjlYF
         qNxg==
X-Forwarded-Encrypted: i=1; AHgh+RqAncypqtjml/mOsGZDNtjcqsDjLp+F+AZDqko9ecKp3ZkpySisxV/xjhFatpX5gDijKdZtl1RnixkpXQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++ldPMmeYtqWCWhEP/y6t7swJPMiVQE8q4bokjsTuVElmKJ6jX5f
	o92FwD2Nks6FJwbSdZ+gfzQ/X+NbhRkxE8F7SjPkqvG3F20OoZtrDEAo
X-Gm-Gg: AR+sD10megshigL1Mdzih9HYdjGAYTdnPks84ybhY6B7fOiCkGVfqtWh3dM20fbhe23
	0GSM1KfLdMXZ90QDxhn/ArKeUh+W4/Eex2D78UTYezHlR7u7/L4+nwwGCPc652jZQ/TyIGrwBDF
	aUYOREbbLRNWUdf0XRFqfXqkwH7+SM0wD2lQIx3I+q26trUvHmB0w+HFc3r1MzudS2NVAwKlMLZ
	ffkmj8qREv6lecmZIw42H6jMR9dj4uNeXgTQFMhe1+tWsuwAZWb8NoqhHKENnn7tTGuqNVLD+St
	y7qmdNMinxRXkTdXLfCGfzj3DEXCto3oxQ9tacdzt8DD3WSwLTEiQH+caczqpT/xxHnLtpnjJIa
	5Wsn3JaKagiZuZ4KAKL6yLtwZp/CmR7vPHcy+1VZfBYcRQ4HfLJW7TYwHAnHNL7gP0h3bd01wkS
	ptNG9I1ERieTY+aC/VmR9zDMdd8g0efwpaNg3Izf4MyH+AGECQ6wNUTwAt6DhTwGZ7A/p/u+uEg
	qgGE2yAGyzGbnWCM7TgrPgARRIjT29pE2wyyXCdekXhwH3rmWsU/Poq328O9j4AQ8hZVDkMG1VI
	BmvvwAV6G0QxalUUf2ulqKZzFQTlFNvGCMWluoVfRg==
X-Received: by 2002:a05:622a:2618:b0:52d:cf85:aeea with SMTP id d75a77b69052e-52e423df762mr109569401cf.24.1787770660104;
        Wed, 26 Aug 2026 11:57:40 -0700 (PDT)
Received: from Cumhall.redhat.corp (bras-base-rdwyon0604w-grc-05-70-53-55-174.dsl.bell.ca. [70.53.55.174])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90cc6507f13sm32593386d6.32.2026.08.26.11.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 11:57:39 -0700 (PDT)
Sender: John Kacur <jkacur@gmail.com>
From: John Kacur <jkacur@redhat.com>
To: linux-rt-users@vger.kernel.org
Cc: Clark Williams <williams@redhat.com>,
	linux-kernel@vger.kernel.org,
	Sana Sharma <sansshar@redhat.com>
Subject: [ANNOUNCE] rteval-v3.13
Date: Wed, 26 Aug 2026 14:57:32 -0400
Message-ID: <20260826185732.208384-1-jkacur@redhat.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I am happy to announce the release of rteval-3.13
rteval-3.13 introduces an MCP server for AI-assisted analysis of rteval
results, along with stress-ng usability improvements.

New Features:
* rteval-mcp - a new, optional MCP (Model Context Protocol) server for
  analyzing rteval result files from an MCP-capable client. It provides
  histogram extraction, percentile and per-CPU latency statistics,
  result comparison, batch analysis, filtering, and log-file access.
* stress-ng stressor validation - invalid stressor names now produce a
  clear error pointing at "stress-ng --stressors", and a helpful message
  when stress-ng is not installed (Sana Sharma)

Improvements:
* stress-ng: apply taskset to keep stressors off the isolated CPUs
  reserved for the measurement threads
* stress-ng: updated parameter names (Sana Sharma)

Documentation:
* Add README, demo, and enabling guides for the rteval-mcp server

To fetch

Clone
git://git.kernel.org/pub/scm/utils/rteval/rteval.git

Branch: main
Tag: v3.13

Tarballs available here:
https://kernel.org/pub/linux/utils/rteval

Older version tarballs are available here:
https://kernel.org/pub/linux/utils/rteval/older

To accommodate distributions that require this, I have linked the last
version v3.12 from the older directory to the current directory

Bug reports, patches, etc are always welcome.

--
2.55.0
