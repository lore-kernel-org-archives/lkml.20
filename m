Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794279549;
	b=V1SMCSY1lfoXEa8/2aPg6lGszUj41vcKScewwdDQuDJvF2idBVhwLmGdxH0g6PiTYt6Q
	 P6wTJQq6Huo6ZGzWZf3mrGHc1K1Izm7dFbj4/QgeSR0ANQwySNxjd2Ms3skAEj86MIi8Q
	 5R0MV9mh9JPqmxXxDQ8UTx3kuE8RT3OG1nOMrx9DFuaqRSAdo8bc64MgLxDkclSLeELfG
	 zprmcbw2KO2aWYdM28DYT9rUbMBvUA/5PhDCx2gLArXdCWV6ISWBd/AIkVpwQ+V0+MdVx
	 Rf+atVH2mGFkZhhqyGLbfzAhtkbWCuEgxqbmgpwcos8wWE+HVAJwzoIZXKB7nUSZsiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794279549;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
	b=SozVGdRJkpjiXltCirituBDM7xHjbc4I/hwmz8uaM5jXbB492CwV+ZSwajSxOs+dm5uk
	 NX3tw2fSwFkdfZw+NDn/5nFUo9Hoa3H5oy+quCFle9C1rCFFA+AxfIkxz2H1Sjo9snOhu
	 Xtorrj1XiDub0Rc3gRQLa3nO+uY/IzXhDHl0aeDnc4FxijjA/8Vyq+ZbkyfvRX+i1/Li/
	 IwSMyeLMEF2JKnuHa+po8sbnzMF6JWTFTRtzTUuvwMiWY0GeCxbefK5kmbBehNAoq3vbF
	 scZvhYK70ZfFG02qGMtt+2rYd7tUe05S5whjQ6Oaw9sALXLZlQQK7U1K9HCizGlQY5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVs11Bvb;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FC8606AA1B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 02:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96FC8606AA1B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=tVs11Bvb
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-53653e30353so20576331cf.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 18:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794279547; x=1794884347; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
        b=tVs11Bvbn2d+gL5BWwC2m/viV4nrJeThHyuvCZDzw1Fvz4vCP0E4CmVRFsXywgJHIY
         7LTSviGZ1TH20B7cqWPSnImrklhjzzXSicv358px46izZzvsVQBbXufQHCZex31NLJbV
         1Yjqu7vKkr2sQr5GU2L7sVRoDf2Q5elBoQwKzbOiDy7mr3QzRgDLTrmevKYP3F8DmsE8
         agMvIRPrZcSXmAJTdEh2fkLpIG4smUtofpVr7fzO0snW42MVbShD+ZXHAfITn7XFOMEZ
         EIy4K5RboZwR6wZEonkflUS3wV0/xEQyuMEOSpthO7kX5F+LZJ65NH55+Oz4iWbrg4T+
         Q58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794279547; x=1794884347;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nGrmkDqvafTIDrI9ZJ867+6zF4oKvoOxGUyEpitlLog=;
        b=Nzib3TlmTBeQ1OuQEVhMoSBdjfZJhlAvsA81GtLBBjM+2Tn2mniGRTNHmYsmrdDP8W
         m5fSoZzqNvrw7bTiVIt3PBTMIoWKmFUoB8dJbszgnhYOV0boyBFPzOjfjaQLrRKTKPrx
         iXMW+wHADu3GF5zQltpnRmJ32pAgfret1m38JdvquD17UeQa2qsKr7kZkwCNC3geRbXQ
         X1XBbepo2teVXtbLHnW4jO3ZWs7O01mBZvWDXeEfJLnWhDP8Lv+ytQZfOnoSDXSoNmky
         QndRknisVKJ5NlkcQmunkR97SBPvs58kKbqSkDgi+rx4603QTollKJZ3/uLUhh8zSKdk
         3CCg==
X-Forwarded-Encrypted: i=1; AL+hErGVFq+/NiSZweLVxf/srLNcbJIMIMsv9azFR42wdOBVJC8rn3wZ407sIT0VhfxPqYjgwqxzmvAzeDfXiAM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/yfsPchx6/YRn/bfjyF2lznVBVY5eyUc3SRDhF1jjUTvizodRU
	jS+yWkG4l3Cdiq7QBCZ4Iv+PlqcYr70on0PBIhj82Uv5LVNJuKsZ78c=
X-Gm-Gg: AYBFou15Jrhri1WjX41YNxg8Wjf3Se3Aadu8oOxj38tEeD9mhd52oq39fK0GxEUbwuK
	IXeXQgnVqf6Dwd66SeYpOT9v2HlsHCsySmI7IKbgk8tcs1fTPALDf84cM3NrQmzYEB1OHf8UeG2
	enCu5ypTdzHFwAd7RmLK/jDi7nnvU25Dnd16U+btqpyrQXKNllB7QrBsT8rKqI0wKuICOFI+Ubq
	zWdC/vTGd8A7px3A+uO4F51xnDC/gRHF9frMYxt94ga1qZ98DjQTcIODuElV0ZXpF53Hqmpu1KQ
	FwAbQlYVDxLKav+DoPqHsjuZ8pgik6rSWvN/DFvETUhTc67e3wXE0Q205ipLAwYr5hfZ5qbEdC5
	bCgm80ZB9XXWqbfaOJJtMjZkX3TiHXqpg/iyrEZ6Kh1XEr/WebUi73ZEGMsK8iu/QzLuj7MRnAa
	vG1sUjsQJOkTo2HJyEBCgI1yyWFPWR8T2J21HOzmDcgZviY+U6/aEdtPEEj9Y4Ous+Uq4bpSKt/
	l+9SmCCgPIYTKt140iU/IirFoCcS//Kkqdh1uefeSy5yem0xg4xuv/v/bI8lEJqXczwxaLAa66y
	/08WgAiprARc3noS/bHKwbO+46Ym7CTtbu/sLj17JEV45BTxNSPfzXGugnWeQX6rFB9d2IE2XOr
	oCIgaZ5V2ip5fojaEDTdz8QaKflz6HK9FQELad+pgaTaYTt7dhoiymSr4yFC++/wo
X-Received: by 2002:a05:622a:4c6:b0:536:6d2:2c0e with SMTP id d75a77b69052e-55527b1b214mr20635311cf.36.1794279547476;
        Mon, 09 Nov 2026 18:59:07 -0800 (PST)
Received: from localhost.localdomain ([104.39.152.7])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5550c21e1fbsm12601771cf.27.2026.11.09.18.59.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 09 Nov 2026 18:59:06 -0800 (PST)
From: Myeonghun Pak <mhun512@gmail.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 0/2] media: rcar-isp: fix core IRQ and probe error handling
Date: Mon,  9 Nov 2026 21:59:03 -0500
Message-Id: <cover.1794278853.git.mhun512@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fix the core IRQ lifetime before distinguishing absent optional cores
from initialization failures.

Changes in v5:
- Regenerate for git send-email without wrapped diff lines.
- Use media-committers next as the base; no code changes from v4.

No hardware runtime testing.

Myeonghun Pak (2):
  media: rcar-isp: release the core IRQ before destroying RPPX1
  media: rcar-isp: distinguish absent cores from probe failures

 .../media/platform/renesas/rcar-isp/core.c    | 44 ++++++++++++-------
 .../platform/renesas/rcar-isp/risp-core.h     |  2 +
 2 files changed, 30 insertions(+), 16 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
