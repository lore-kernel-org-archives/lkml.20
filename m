Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794018111;
	b=3BebmlckrtRwwVhm/66KameFp7skDVf5it6dYq/xbTc8+vMYgzZnS5av23vFpYxLAKfZ
	 oOgagZSe4rDdaqImwbHtuxBlX6n9ynW75ijxfDzdSni5YGDNhBNdmWToHEJcjLTrDNLZc
	 BRlQPfX1QEqnQzZEPUFsHl4i8NTUq4zPW791p0rAyS0pDCMOWRFmZlgrV+jtrQB9fZQeF
	 +Ah/YzatfhQgfR8ZUI4eD0Yp7gzt3rduFHGAmPqmGY++gAV7rjnNA/umoq38CP4JGbPDH
	 EPnNIt+ik0u+/h04eRylhdrowuy4D8jedo8MKflMS9pCPSVEcLwfOzHv4Z/a4EiXvQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794018111;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gpBdG3pRFRFDOygXYdEjj/pMvx6yFZ2VtI5mPZqbzcw=;
	b=IC1R8JdrhYty0SDUJfHoQNaVeGd4DKzhiVPqg4/JEZbcafX2mcPzZ9YD5JE84Fv1B36B
	 FVwyUayoxcrlQsbx1M5OJWu/1EZHqIHJM9j+p6Rq+kWQhXV3O1DCjpmvlxidezIWASIh1
	 LJc9bgloQYqtFe/cEXWBHv6ZeVy+rvalAOt4wE6TmVNnb52Ou40//6styqpvVvxX/fTYL
	 JX58CLDRDaeSu2QIsXw9N977AZR983aepFIrIr7xSw1wx6lxcZYkaOCEHWeFcWY4FEYyj
	 BA5/gF9WFPqkX85fX/BNB1qwPL/4BRE093EQDeIpMDxlzO7ciq2HKGYLj3Hlcglv28Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NyvR+/mA";
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FFD606A326
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 02:21:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2FFD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NyvR+/mA
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdadf7e248aso493418a12.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 18:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794018110; x=1794622910; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gpBdG3pRFRFDOygXYdEjj/pMvx6yFZ2VtI5mPZqbzcw=;
        b=NyvR+/mAFfA3M7V1gGR2mCO2pVeaG2NOy+TdnwoN7CY5IFjwkfDK2cwanQ0it77Tcx
         /1rzkkdwkVBwqfcoL6ym9SoDVy9fZXS2pnCuYwZn2pfVNJDrC9aNiBZypz8VSJK7mR1E
         ecxt2Q1xYD2YYLcmihlz7nb70PudIgdmH4gD88zs8Qdn6qkScADWr3lpvnWQiTVJ6LLp
         x+HO8+YSpAHIOR4BYLjmSV8MB6xe9NHCmqPX3xMhlV6K82MBnhSN6ER1x0kHQYH21qeb
         /a57zhsMwhzkw9kWU/M1iBAdlhO32PcJs+lcnLF/rW31OCnkY+MB1ytS6MkHUbBQGtqu
         gozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794018110; x=1794622910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gpBdG3pRFRFDOygXYdEjj/pMvx6yFZ2VtI5mPZqbzcw=;
        b=N5jzfgml/7+uOvK/w0Gk2FAKfEifTIW6HXA2oLusJIzU28k6r+ZjKq36G+CREGenI/
         BNY/IcPhlOS5RRegcILZkdY6kiuQKe1jw51W52KsU8MV22jy1s6Z1f0Ppo3bi8b80F+z
         bFbigkjOH/2IZmb0jxk2/aJdH5EhkIA9ZMUyk8f3/oiQcTdd29T37ugy93W6CZBH8dWL
         xHIkq98dWrekm/IoL2SFuHajCsPSgHKDUthHSv75mmsU+EfXsfCTtgk6990Gi+DHVk3p
         FcKpFinmRi5OpTsOPrhm9aQfLYiaFBFM9NJx0k4qmdbBW5hjblkcA9JMJI5ZyO8s+L0n
         Bq0Q==
X-Forwarded-Encrypted: i=1; AL+hErF3CXBt8jmPt0zei2PqiTsK68S0TGZx9AyiCkSqPxP3wOGtIX0yr02cmOfGqNpcOcIU8NXFJuX6qxbmzUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kArnW+h9NBVF/WyI8l7JYKttW4HN0QiBitAM7zOHVV1BDc4Gv
	5Iz+Z2WucUbBihtl/KujxNGaLVn979nARdhWy/AzWEKSJDHN1o3gVpYz
X-Gm-Gg: AYBFou0cbS8taR/EwYkLq4/QVsl1XNWMhwiKDWoHIuzSEBwxlVKOeCugKxLHCbF3oV1
	Wk/x0571H38q+YJCjfy6Ua54/wqs0P1e1k1h2eyvbRhbNGTwqrXnhBaLEKn/HFIHrpN6gal/KDl
	jEMPFa7FLS6Mn39rTv86btZYAa/O5Ovv7qYRwKX2rk+U6aRftEiKotyUbKvKdKXqFi4UnKEFHwu
	EJirBtV55oyA2D4XjyueKzU1EDiNZznOD/1HCzeu6j8tULb5hHsjk8UA4ek491tZWvAIsiN3Mfp
	MHag4DvFdNMjxEMDutSA3AWAba9nyPHy2kW4De9vNcrNVRbX1is6cYaDGOYdM1q+fs2XUnraWSp
	MXYrD2JOaz5NDs2eGAYmI2WBGJf7Jm1MBHuYEE546brovjgxYkJ2VwHZxZ2fAcLxDy8LdDJ2bL0
	dFy0P9py1lWBsAC8fjr3GvrylcoN11MCPBeRKvCvdob7lIMF29Toljyg8RM9kWONTjPJwJFq25T
	qOi2Wua7MCRlamvqRruZH4JoB89rKDbOP5INDk1EE+vWlcgR94JTZwPwxbM3qdesLPNEHoMQ1sP
	wO74+IjXU4N+MOO+ZWNL
X-Received: by 2002:a17:90b:2e0b:b0:3ac:b048:fa13 with SMTP id 98e67ed59e1d1-3b0db7258a0mr3904710a91.67.1794018110033;
        Fri, 06 Nov 2026 18:21:50 -0800 (PST)
Received: from a1-free ([161.33.196.121])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1057c3db1sm1287015a91.4.2026.11.06.18.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 18:21:49 -0800 (PST)
From: TAKANO Mitsuhiro <takano32@gmail.com>
To: linux-perf-users@vger.kernel.org,
	Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	John Garry <john.garry@linux.dev>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	TAKANO Mitsuhiro <takano32@gmail.com>,
	Ilkka Koskinen <ilkka@os.amperecomputing.com>
Subject: [PATCH v3] perf vendor events arm64 AmpereOneX: Deprecate BPU_FLUSH_MEM_FAULT
Date: Sat,  7 Nov 2026 02:21:45 +0000
Message-ID: <20261107022145.1713159-1-takano32@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103112609.3772250-1-takano32@gmail.com>
References: <20261103112609.3772250-1-takano32@gmail.com>
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

AmpereOne named event 0x121 BPU_FLUSH_MEM_FAULT until
commit 10a149e4b4a9 ("perf vendor events arm64 AmpereOne: Rename
BPU_FLUSH_MEM_FAULT to GPC_FLUSH_MEM_FAULT") renamed it.  The next patch
in that series, 16438b652b46, added the AmpereOneX tables with the old
name in memory.json, so 0x121 carries two names: GPC_FLUSH_MEM_FAULT in
core-imp-def.json and BPU_FLUSH_MEM_FAULT in memory.json, and the
default perf list output shows both.  The old name has been in every
release since v6.8, so removing the name would break anything that
refers to it.

Mark the entry deprecated instead of deleting it, as Ian Rogers asked:
perf list then shows 0x121 once, and perf stat -e bpu_flush_mem_fault
keeps working.  The x86 tables use the same wording, and the same
reasoning brought back deprecated AMD events in
commit eda39f98bbc5 ("perf vendor events amd: Reintroduce deprecated
Zen 5 core events").  The entry still registers event=0x121, and no
other event changes; after regenerating the tables only the two
descriptions and the deprecation flag differ.
perf list --deprecated still prints the name in the text output.  perf
list -j cannot show deprecated events at all: the JSON printer honours
the flag, but --deprecated is wired only into the text print state, so
the JSON state never sees it.  No metric expression and no other file
refers to either name.

The duplicate came in because jevents checks repeated names, not event
codes, and one encoding carrying several names is legitimate, so nothing
is added for that here.  No AmpereOneX machine was available, so the
listing was not run on hardware; Ilkka Koskinen, who added both tables,
tried v1 and v2 and reports that they behave as expected, and his
Acked-by covers v2, which differs from this version only in that full
stop.  The JSON edit and this changelog were written with an LLM
assistant, Hermes Agent, working from the code and the thread; the
checks above were run here.

Fixes: 16438b652b46 ("perf vendor events arm64 AmpereOneX: Add core PMU events and metrics")
Suggested-by: Ian Rogers <irogers@google.com>
Link: https://lore.kernel.org/20261021224527.167637-1-takano32@gmail.com
Link: https://lore.kernel.org/CAP-5=fX+2eRGCHcU43sqU=gi9iKvxqyS6ipwRSnvFcap3D+QzQ@mail.gmail.com
Link: https://lore.kernel.org/42801873-8908-07a6-aed1-c7076c689e8e@os.amperecomputing.com
Link: https://lore.kernel.org/a188c604-46c0-48fb-9cbd-9eacad88b5c9@linaro.org
Reviewed-by: James Clark <james.clark@linaro.org>
Acked-by: Ilkka Koskinen <ilkka@os.amperecomputing.com>
Signed-off-by: TAKANO Mitsuhiro <takano32@gmail.com>
---
v3: add the full stop after the new event name, as James Clark
    asked, and carry his Reviewed-by.  Also correct three
    statements in this changelog: the JSON printer does consult
    the flag (the option is simply not wired to it),
    regeneration changes the two descriptions as well as the
    flag, and Ilkka Koskinen's Acked-by was given for v2.

 .../perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
index 6c06bc928415..b0934a7b252c 100644
--- a/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
+++ b/tools/perf/pmu-events/arch/arm64/ampere/ampereonex/memory.json
@@ -35,9 +35,10 @@
         "ArchStdEvent": "MEM_ACCESS_CHECKED_WR"
     },
     {
-        "PublicDescription": "Flushes due to memory hazards",
+        "PublicDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT. Flushes due to memory hazards",
         "EventCode": "0x121",
         "EventName": "BPU_FLUSH_MEM_FAULT",
-        "BriefDescription": "Flushes due to memory hazards"
+        "BriefDescription": "This event is deprecated. Refer to new event GPC_FLUSH_MEM_FAULT",
+        "Deprecated": "1"
     }
 ]

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.53.0

