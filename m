Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271581;
	b=KxrejMLfmlDym+BJ9BtYaxUM09uzQs9i3jED8PFZCLdmbkk+ywfW7jh8Fl99eZEzZHEc
	 yZAse4RO68ECrkIhaPW7Y1J/i3ZeJLJZV2ATHJkmBNQ7ld7ZocJ08d27QPsq0pQheazBS
	 3xNa5Y+b6xa1xOYv6EVVlXGac+rSsCig3iEhvDWH2BjE/fXNTNjFFIOSjfK6wzhQs+IU4
	 czss6xMhPnRxSHS6Mq+hTo72CEho+wfh96Hy5t7s1tV9o6cXVL204HAKz1MPsejPWVKT7
	 Zigz91KTP9wFZ2eRkOuZjMSYYf49Lj0v6ZgwAz38nWhm0cqoVQlO+wwtH/gacOOlb2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271581;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
	b=kCeZt1viDlxuZNHYFnJQQ6ETPjhoJWjR+cBV9cKUsZ3rp+DPlYYIj6cfZPEqiWQUwuWp
	 hNZVZyjFifjxQMs3Yz0ZeWRU1/4t35J/wn+1GAxDsVOggF497mZAI6jAq6P0ICsj8KSAI
	 3ZUtK63N8ajG/ldPwWDDt/xuI5XCL4LiuUHwDyXkjjcPFriDqehn/XpJO3c844w+R/pDZ
	 BYXZM5vUYaBG/1qi0e0okBGe/kuupGZIABKzctS2r0z+A/rWZgRdeO4dWuQ+YAZhryvma
	 X9ASlKeZOUMdbYzDxUsmcrWTl1AinX6PZUGzT9zZv9WyYg5Cl4YhPEn66BlYKm2mfDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bH2T7UA9;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D91D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 10:59:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D91D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bH2T7UA9
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c414e5d282eso263823766b.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793271580; x=1793876380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
        b=bH2T7UA9tLjqiPSC27GHnMZnwzVqlz1naUj9j1xsfLTT6zixCP4NCnKLMIdCwYRtRA
         KTDthIi+SkhmLNmsmOha8rNdJf4bcn3/b0uVa0M61bA0y2njv0BQK2sgR7UFUKgKbiGy
         cRV+vhjsVTSQ/xkQqnQb/8dsqgm6iCa5faIc5jN5vYODZKHdbxruZ8jirfXSmx59xE1e
         WRGjI/TdQg3yDxXL5GbZZuQzkX/yxpYaK805E38ZGSd23gjyZlPhQCZb2wLnFGuNVD5/
         smaxHHml2KL6T24KhYMZNNbOZEDyk01wY1ikv8vYqd0PLEmrRAJOhheMPgwfebqcpTo3
         stmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271580; x=1793876380;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=21Pr25KW8iRWF16tMS8FhZNBj9jILGnkXcKJJd4L4vg=;
        b=1SrJO8J+POnQOKGMDTEYJFGdtOF4O9n0KOIBzmU1RPcjNTQwiVYjcaSsFGONxraAn5
         rPIe/0QYyMsSyKDZpySYjC0Lqeiuy6K2M+QiQGWwXDxzZOftSI1JvRL9NJpRf4Ft/Qic
         VMJG8AwQOsD9ppkfuaTL5qPa/AMtFQNqd8LRANjFSoMBjCuUGzZs4rqBnRZr7aCyoSTi
         3uBJfrMCCR1eryrDk1kVrsRhUHZAxUr1W3gNTGNsBXO4TTzUpQvauYqpo2cbYuDNYG2M
         bkAIHrEnahlF0cdDX76ByACQr7q6WwTcL8MH5C+cxg2lRuEFHlJ0EZcccLX4B3a7QoH4
         xSxQ==
X-Forwarded-Encrypted: i=1; AKwUvBxrYuSWDDtjRRqEEtWM7l9AVkowMCs68chI9J6NrtOtxKzQpPtKztS1WSYkvP3L/J1c1xWBEoJIh9rN/00=@vger.kernel.org
X-Gm-Message-State: AFq9FYIG3UtWmhijCeB7g+CO30pt1pw+fnDl2RGQUhVO9FlHBBqvIUqa
	Ppgjh079/44varIqNnQDV71AduzRrknBnpA7b3DuD6lKBxmNDvN/smT9
X-Gm-Gg: AYBFou0pG1SBGp1+kyNHcNSsXhy6lwEG83gS53A8yh0fi/tdDK/jy1KyoKqkLCII7mH
	reMKLb3v75BxxIY85ad1eT36O/C7PJNusMMGbNExL72S6JLT83xGgTU4WuhnlK5feE5+bRbpcVL
	ewp+/acpW5iaSCC38VljOPKvxQdbDdao1kxPmpTo3u7PEBSAtDipFMGSL9wzhS545eO689VqQvJ
	/zitAwKT0ldSaD+fl9QKnUNhZgPWuCbaC1hBX5vV3vfHvukLEaDApYBiOmeSsSSWfyrSCyvubjc
	Om57/QLmgOq3YjV4tQ/85uslpKDvoTVGt61Llowf3+y9/7nRbi8wIXQmif/FnN+SZtkSXTz3trJ
	1MBjiYJDz8TQWY0YQQS6WPH24woqmsoQKjtNOt9fviQvaSPmjfrhDkfYo7JY71Yk0y7ToVG4FA/
	C2RTtNbT2sAFM5NdakawY3cx+canp+WyQyz/xyWmM8UIN5a3QIkFMJsVINJnBTBiDJIvj8JbWMb
	TMZVw5tWTysKcApV4ec8V5JDNnR08J9dBdFfSN81oSJqmME6dub7Gu3o9EMtIzMcHPyaoUCWEaw
	Ps4BUkBtfxMKjngAbogS7qh7MvD5SIrJCQe8doX6MqrHMwJmeyexf8AIhOJUXRWblIeYDXFvfpa
	yVRNm1ebxHKJrsCzOb0XUb7oSt9VR4upT35nRkBS4TiOcLQ==
X-Received: by 2002:a17:907:3f88:b0:c40:9e84:942a with SMTP id a640c23a62f3a-c49be05b0e9mr431771066b.48.1793271579384;
        Thu, 29 Oct 2026 03:59:39 -0700 (PDT)
Received: from nixos-macbook.taile68cd7.ts.net (20-144-89-188.ftth.glasoperator.nl. [188.89.144.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd7b5d54sm704604266b.86.2026.10.29.03.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 03:59:38 -0700 (PDT)
From: Jacob Procee <sn125164@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	=?UTF-8?q?Martin=20Povi=C5=A1er?= <povik+lin@cutebit.org>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacob Procee <sn125164@gmail.com>
Subject: [PATCH] dmaengine: apple-admac: Fix position one period ahead at period boundary
Date: Thu, 29 Oct 2026 11:59:08 +0100
Message-ID: <20261029105908.22809-1-sn125164@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Speaker playback on a MacBook Pro 14" (M1 Pro, J314s) underruns at
irregular intervals, audible as a tick: 8 times in 3.7 hours of
playback. Where an underrun was caught (4 of 8), the ALSA hw_ptr had
jumped by one buffer size while about 70 ms of audio was still queued,
and a kernel trace showed the DMA position stepping back by exactly one
period at each of the 6 underruns it covered.

admac_cyclic_read_residue() derives the position from the report ring
(periods finished but not yet reclaimed) and REG_RESIDUE (bytes left in
the current descriptor). When a descriptor finishes, the residue first
drops to zero, then the report is posted and the next descriptor is
loaded. Usually the last two happen together, but occasionally the
report comes first. A read in that window counts the finished period
twice:

 - residue2 == 0 with the report already in ring2: the period is
   counted in nreports and again as the fully consumed current
   descriptor;
 - residue1 == 0 with the report already in ring1, and the next
   descriptor loaded by the time residue2 is read: the
   residue2 > residue1 branch adds one to a ring1 that already holds
   the report.

Either way the position is one period ahead. The next read is behind
it, snd_pcm_update_hw_ptr0() takes the backwards step for a wrap of the
whole buffer, and the stream underruns.

While the channel runs, a zero residue only occurs between descriptors,
so read the registers again while either residue is zero. The retries
are bounded, as the residue also stays zero on a stopped channel or one
that ran out of descriptors; after the last retry the position is
computed as before.

With a debug build counting retries, one hour of playback needed a
retry for 2210 of 3.39 million reads, at most three retries (3.5 us),
also across pause and stream restart. Both states above showed up in
the logged register values. There were no underruns in three hours of
playback with the fix.

Fixes: b127315d9a78 ("dmaengine: apple-admac: Add Apple ADMAC driver")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Jacob Procee <sn125164@gmail.com>
---
How this was found and tested:
- The underruns were traced with bpftrace on snd_dmaengine_pcm_pointer():
  a position read 19-37 us before the period interrupt was exactly one
  period ahead of the interrupt's own read. The register states were then
  confirmed with a debug build of this driver that logged the raw report
  ring and residue values on every retry.
- There is no hardware documentation for the ordering; all of this is
  measured. In the 1906 logged retries the next read always showed both
  the report and the new descriptor, or neither, never the new descriptor
  with the old report count.
- The reverse order (next descriptor loaded before the report is posted)
  would put the position one period behind and is not handled here. The
  bpftrace probe checked every position read for a backward step, so it
  would have caught that too: none occurred in the three hours with the
  fix, roughly 10 million reads.
- RESIDUE_RETRIES is empirical as well: of the logged retries, 1189 needed
  one, 621 two and 96 three, none more; the longest complete retry
  sequence took 3.5 us. A round takes about 1 us, so the limit keeps the
  additional polling time, with interrupts off, to roughly 10 us in the
  observed environment. If the limit is reached, the position is computed
  using the existing calculation, so the original error can still occur
  in that case.
- Tested on a MacBook Pro 14" (M1 Pro, J314s) as an out-of-tree module on
  the Asahi 7.2.12 kernel, whose apple-admac.c matches this tree apart from
  the unrelated admac_hw rework. The three hours above used a limit of 100
  retries; the code as posted here (limit 10) ran for another 30 minutes.
  On this tree the driver builds cleanly with W=1 and C=1 (arm64
  defconfig), but I have not run it here, nor on other Apple SoCs.

AI assistance: the tracing, analysis, the code change and a first draft of
this changelog were done with an LLM (Claude) in a session with me. I have
reviewed and tested the result and can answer for it.

 drivers/dma/apple-admac.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 9a1c79c12..9b284c658 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -28,6 +28,12 @@
  */
 #define SRAM_BLOCK	2048
 
+/*
+ * How often to re-read the residue while a descriptor boundary is in
+ * progress, see admac_cyclic_read_residue().
+ */
+#define RESIDUE_RETRIES	10
+
 #define RING_WRITE_SLOT		GENMASK(1, 0)
 #define RING_READ_SLOT		GENMASK(5, 4)
 #define RING_FULL		BIT(9)
@@ -358,11 +364,24 @@ static u32 admac_cyclic_read_residue(struct admac_data *ad, int channo,
 	u32 residue1, residue2;
 	int nreports;
 	size_t pos;
+	int tries = 0;
 
-	ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
-	ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
-	residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	/*
+	 * The residue drops to zero when a descriptor finishes, before the
+	 * next one is loaded. If the finished descriptor's report is already
+	 * in the ring at that point, the position below comes out one period
+	 * ahead: with residue2 == 0 directly, with residue1 == 0 through the
+	 * residue2 > residue1 branch. The next read is then behind it, which
+	 * ALSA takes for a wrap of the whole buffer. Re-read until the next
+	 * descriptor is loaded; the limit covers a stopped or starved channel,
+	 * whose residue stays zero.
+	 */
+	do {
+		ring1 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
+		residue1 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+		ring2 =    readl_relaxed(ad->base + REG_REPORT_RING(channo));
+		residue2 = readl_relaxed(ad->base + REG_RESIDUE(channo));
+	} while ((!residue1 || !residue2) && ++tries < RESIDUE_RETRIES);
 
 	if (residue2 > residue1) {
 		/*

base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
-- 
2.56.0

