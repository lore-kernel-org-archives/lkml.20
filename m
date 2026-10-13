Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D895372E7
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791906786; cv=none; b=DLoyIX01nLnFMG/UWJWTZGeeCqdckVlJTClzyryES+xbE2VlZUbitbSzJ9r88MU7TQ0o/59m0WZmNS4fx5tOFeCbkHr8eMpsh6Ix3WP1SC7WIv9rtM1YRetLh2plRh5jd5/Cuu3JQbxSKbXl/PtijvT9Vx/CBTJ5p+oxvuSfqcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791906786; c=relaxed/simple;
	bh=qOMnAQshZi5I2yY9rgOyo/tDqeNoazX7meSK44gFpfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D5AP9g/FYoMFwesRhs2YCBn6Z2vOzcx9B0RcqgrdcB30hHLqX1NS05UvDC49ipu3sAG/qgcnPGDq4L40ItXJ7o8vMrk4wU3BwEVPmQgxZwJ5cPPfJqIixzQ42DFJHb4n+7+OYLJsVqENCQaiLZ63MQbsW5sncsz1iTkMt35y+sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=apNgJkD0; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="apNgJkD0"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc1c9879395so1084635a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791906784; x=1792511584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vlJ72bvKXAZMaGRlcugIP3h82wTWg8aaVMxMBFjQrAs=;
        b=apNgJkD00Rwd/fWzRGdzIRiHFuDx00OqweM/VVm/BXrJDhuZaV8HFF4EUfhKtyFKdy
         jywTjAm9BbhrSq/0/uqw4lFGe+fV8f/3BZtCWPvT6IcZRgANll+LBqhstBQx2BZ1D7c8
         b7Jr+7B9I5rxYTwckyMYkc47hbf/p955tL2wSKP2LTs2753wn1n0ONKCnM4HmFaVRwFX
         UiI+McEUQZt2lpUItFO9oYLCw8eLyqwMDjihSr8xKM6YaKs6Zo6QFjkSFdComOYV7dyM
         RnyA9sji5aMS8/7TG1cgMGRQDY5kRiwPcbvfUHqEkiY11J8McPGww3DYFh8PV1xr5ob1
         Zz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791906784; x=1792511584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vlJ72bvKXAZMaGRlcugIP3h82wTWg8aaVMxMBFjQrAs=;
        b=wWjjhbFqs0AvttdUNZ9GLH7QLmnxBSh7909CKPvqZYvGMpJdhu6q0Av4ldO7bl0ym1
         oYTq0grLmcnpn8mqegiWTFubLdbj54SFYjFlYz0c8DtkqJIT0m2fSKqYZKZCntslj6Bg
         JatK3j77Od0cDBZ9h6rd+fOuBLAYCEPE64p4XMN6982TJlcyb2W7ThMjrBuro/KEtDUJ
         +A5rfV3JgIcvl56gUPNMz+NRrimjlrQlqUiXPQVPT9KkiC/kM2J8HqkxLrBwG3CVL6j6
         k7p81Z7P3jbaz+muJMBU2V9JmT1Xpa6OcuLgArpjvgWySBidGOtbPqHgg53R8xXUdDEj
         P+3g==
X-Forwarded-Encrypted: i=1; AKwUvBygG9eBmKfdy3S95dXd+Uu0kiJViH9bChdts2twUkWvB3XFidb5IzAwhlMGirkzsNvKOja+LOYzxA3h/oc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvAzI1/4LZ0vUn9Bfqib5C+sKZOd/UsxHMzpfAXuMfOXhzwHdR
	dVSo2hZaZkRnpRN9J4PvjsBAlTVfSa0fAojbo0wDeh0ai31XDWCNGMpQDai1wEY8zJ0=
X-Gm-Gg: AYBFou3GUCr28tJ255mdk+1UEVsP3Aw1V/2YcivwYnyX6e5WM6WSdWvV3g6yvHCtom3
	L4q3YJTUVsGtcMh0cWqliOLm4ZBwh9NqFSse2AnBakhJEfDEW5kOx5N7XqH1h8hDMNEIE6KNbnQ
	Kjj2HXxNEcExCMT3EnDjaBudM+25I123VecW1onMkgHzne23iB1HHfNJZoSdcOCEfK4DtfIBV3u
	CAkuc3DCHWVh2JO4dGvrfj01f358qNpErSd+06KrEA283am7Ys2Utw4LHUJK0VOoWwilQpygiAq
	OJmUnhpIKm7mfcmURUlFqSgHl3bUOHs/TnyvwvB48NGicdPQY9qen1q5chUu8WU3PSb/divPaa2
	Tt49FD/OveBFyAH7lQXhBh1qKZDvjPZVjNal99g+eu/Jquyi4EInUh/K5nnbQBmzb4zuzlABSak
	OE1Ht3p3in1JNxuCHU58/jLPUOtJf9it8cvWTkU87n7q4DBuRbudackiOZsC2kvWIFZhcr0k/5e
	y1h7S/GFpk4+PeXUDKr
X-Received: by 2002:a17:90b:2ccb:b0:3ab:17b6:9a93 with SMTP id 98e67ed59e1d1-3ab3afcdc6emr11228102a91.52.1791906784181;
        Tue, 13 Oct 2026 08:53:04 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:c51c:be8a:c517:276])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f27d491sm165944a91.12.2026.10.13.08.52.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 08:53:02 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Keith Busch <kbusch@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>
Cc: Nitesh Shetty <nj.shetty@samsung.com>,
	Hannes Reinecke <hare@kernel.org>,
	Kanchan Joshi <joshi.k@samsung.com>,
	gliuxen@gmail.com,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v4] nvme: bound FDP config log reads to the received buffer
Date: Wed, 14 Oct 2026 00:52:36 +0900
Message-ID: <20261013155236.3188723-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013142003.GA14422@lst.de>
References: <20261013102812.3020500-1-yhlee@isslab.korea.ac.kr> <20261013142003.GA14422@lst.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks, all.  No objection to trimming the KASAN trace down to a few
frames in the commit log if a shorter one reads better -- please feel
free to cut it down.
