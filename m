Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B314EA394
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 15:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793670; cv=none; b=Sbf6rAhO/vWKHd/LaibLHeJt3HyIlFm1D4OKDPooVW46oHYeQA/pw7y8u4ZAYGsMqnkWk0ZGKRUzLAyx/GbCiTuGQ9S8kqWLS6hJIXbNv8CJpOaUFjs8BhvNSYidDBH8ENGXPmqR8LJwG89RYcI9n23jCKo6c600zWSOit5qTC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793670; c=relaxed/simple;
	bh=JScLvDY1v4ZXDmdRrVKEysuuyxpgWjgoIm5gZeod+cc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4GZJXe/fwWCImEnHhxapOO4/fS9CepsPQfpIsjaH39smYF+srWmVWIaywjyIGJWZ0SrOYy3gJvaZuYfHMqhRhJsjXY5VEP1ay/TuKlFCPEUV3CE0D7FVnjHijvNlBwlS4IYPJwVGndZIRh+DbDFkzvxawaa1RBiArQFQJLxYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9OhDCXA; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9OhDCXA"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c262f1186f0so217850066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 08:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793667; x=1789398467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=B9OhDCXAurNMkPXOw05CEdk2J6KNAWmlimpDn6VWpyokBfT/RNo4OBIW5XU0PQhmaP
         WbeHfDPrW4w42+5/RjnXMKAx+mJZQotxLC6zer9bDVmHNOOV7NMrKtcjNcSljx1JYMMT
         y2LCaLTZFmRQEwYyW54mJyYeKZ5ke8cqm08mhyCdXqh0kC0rWSpWzyXhUQ92+rtzDlXy
         PGUssRQR4Vz9BbEmCi6aGLepYeYm/Y10hYEpsTqiJ/x0g9omzXJ6KgAlkpwEeeozk3pv
         XLUiCNxG+tse14Ls+wU3Y+9UBXLAx57bZ6fhnD6ejK/OmTvz9FaDuZS1mWauray9et/z
         ++Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793667; x=1789398467;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PtaQqVSlZuFX18DeVPVqwMKwClza0Yn6Bnu05r8m2bg=;
        b=UGNzpTOe7hVzk081fS7SEsVPyU0A4yDBQqmzZwv1f5WaX2UdnXof5RH/JjCz1qqI3j
         nqBl062sqtuRL+NqtADcOY8RkL7tcmwJ5zDgRTybMrIUm2SSMwyJfY7O4nCi1AYij0IR
         ysvsnkE+M9Kw+UIBcM78HqvHLNNXrEtNdacFsIB0ZuTBW6aRH+FV+Ly15I9ovdNzZGHk
         6+g4h+4oZTweAHUUvPav2ciuZmqqJ9JgwmSdiz8NufjKeOaVmA6dYr6RwfD1tURWaw9t
         hw8loQW1ps4JoeFTt3GHS5akGEQBLLb2Rdl6bEbVheANhdMrgjGm+6oMHgpcK2bur7g5
         dghg==
X-Forwarded-Encrypted: i=1; AKwUvBzilsoLV4lDxPlZmeGDuXWNTOZlhkHhQPq0l0P31RrQ3InJw5wyy/2SpzIWtlHvyGycDWMBLwdEngowHGw=@vger.kernel.org
X-Gm-Message-State: AFuF++k24VaQlsVN3udvAx3G4qTDAjpFOUa2WoKdllX00STZQWhCMuKA
	En5doNilY/O4IV1KG/ce3BoLPS8PTynX6hKT0WjILAT1/47ZpsRZ1HLb
X-Gm-Gg: AYBFou1RbnCxQ7X0XO6FANZkRIWHng3qAF0Plwx1cVLsNPWkqgqpzXLJwPG7HNJoMIu
	+YDvLo6AD9LhcTIJG/a0L8SbQ8qWfCjoHBntM3+HFXsr8J5y4IMG98nCOhN43+bYe1pPZU4ifjM
	z4tB5Qy4VNuz/+yDF77qZeRCSIozhRIS94ny0biKOp0VdKSOIYv1rXZTwXqvg/Vq2CoXA6LQQ90
	yFuYstIFzKZ5avo8mrWd5SI1yYn0u6zviTY2D7Z0YeKvGF29T3Qzpp2Z0F0D1x3Okh8Bm+nOZW4
	cSXmqvsXmPiKYP8lbgJmpa9GlKPT0GJy79/0oTGQLgxzq4+0UJ3upgBl+BrguaAq9KrCOmVUyt8
	TQD+B50pLabZx04GRu0xBwVCfOUP8JODHELywra0k5Gmfl2NvAXpMlx/5YXrgp8sT0I9BQ7BF3W
	cAkTVUkRwvkQHynVVbvMqI5q45gxUHY9DAVqq8yED6s4ozdn8bMeCegTPp2PlhFIZskfgBpCs=
X-Received: by 2002:a17:907:94c7:b0:c15:e8c8:340 with SMTP id a640c23a62f3a-c260cb54a27mr1562947866b.23.1788793666838;
        Mon, 07 Sep 2026 08:07:46 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5773c5sm478376566b.40.2026.09.07.08.07.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:07:45 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: sashal@kernel.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: alexevgmart@gmail.com,
	karolherbst@gmail.com,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org,
	mhiramat@kernel.org,
	mingo@kernel.org,
	nouveau@lists.freedesktop.org,
	ppaalanen@gmail.com,
	rostedt@goodmis.org,
	tglx@linutronix.de
Subject: [PATCH v2 5.10 0/2] tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 18:07:24 +0300
Message-ID: <20260907150726.168416-1-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903-daily-reply-0001-re-mmiotrace-null-check-5.10@kernel.org>
References: <20260903-daily-reply-0001-re-mmiotrace-null-check-5.10@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Backport fix for CVE-2026-80689.

Masami Hiramatsu (Google) (1):
  tracing/mmiotrace: Add NULL check for mmio_trace_array in logging
    functions

Steven Rostedt (1):
  tracing/mmiotrace: Remove reference to unused per CPU data pointer

 kernel/trace/trace_mmiotrace.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

-- 
2.43.0

