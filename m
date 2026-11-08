Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794142193;
	b=ZzBoaS7S4yegTHIPOOZXfnM7DGnSoQwKENEeOrhNdoKVFONfcvRHgpSWlc0urejeXFGX
	 47wunGnvcyI5WJQ06/CJY1Im6K4U4l41Ip2ZqfMBhCwWIV9mOVKl3dpVTgijPODaMaTj2
	 aygJTuypEUURlEQ987gCjc+ayeVG7pslkvnMNNkQ5ynrgQPxEespHi8vYtkInlD52UaN4
	 DIrSo4UKufpuQHwgugVOSmF6jmH4d/oItoFkVCjv6GxgTEveOsiDG++/Qk++jxDiIeNY0
	 uEQiEwXE+bhvGnc3XPkVy/sa9stOFmC5o4Iv0XN6CNidDUI2q32B3nTBAb59pqRjPNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794142193;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UF6lZcZ5YxbATOBSsPg7rc9dk6wBGqppenAdVVixuRA=;
	b=UTgYXlxXNYE2hFPIHMJ2fg3/U/QjkyLn5J0rlm8TVmByFVdmOg5EwjK8Eqp/ISNsFxDT
	 eXBccgpNGImNCbzy2enjadmoiQtzxPKgfQNyBcOylyUpLy0/pwQNH7xwvKSRISsheUnpV
	 ionRQM8iy7BD/KPx8WaUPFe0P0wDGDdTQMxm3j1AorkUDfANZFXNwgu8idROJTRVcHHV7
	 ZDgC3omjoEq4ZN0aoUaRY923R1mNedtVk34bdicsDnXE/si/brplKy6msql1f5CGujOa4
	 174dJRKhPXt9vpXNXgeZeKr9szGKy8hmRfzBR0SxSqtLwOeB6jQw23pJmzH7PQe19cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeDiOjJJ;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B6E606A332
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 12:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45B6E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LeDiOjJJ
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so151824c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 04:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794142192; x=1794746992; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UF6lZcZ5YxbATOBSsPg7rc9dk6wBGqppenAdVVixuRA=;
        b=LeDiOjJJTV1qH0oUdJe962ARYenZo4GwF/uIxXoC1O4Bc0+EXAPseKS4DIKzjuh6Fu
         1C5N+7wi//IAxNlOBqf9TfOYhvThtehMIh5Zj0bADC7HDtuUghp1aDKvLa529BSp/PhW
         xrndWzAC9mDRLn9YqhwLsNgZ8FNAzY3PBYnynrzjGfQ06p3Fgwa4fZKxGMfc8o8eoprB
         yB6nJbo/z9fsrpNVCck0L03KGs/U98CLthtSDfDpnyssATGf54OsMLNRrFfAZrmSEki2
         aUqQzjxxbOyG2YN8NlpR1jrIF5RyS9A+aqQt4f38RWb/6xCWmyp0pQnkoT79itrrTy4Y
         hGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794142192; x=1794746992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UF6lZcZ5YxbATOBSsPg7rc9dk6wBGqppenAdVVixuRA=;
        b=u+D/MbBWAR/3t3Lo42ZgjrHFgvzJrwHJFXcn7ZrEmhFwSE5pggdNOZfRv2ZjUzgYfa
         wYDxEZWK5SVZWSMZX4JZvaDBd+ZNV2YBaktN75mu6vqZxjTNCp+Xtdpb625l6L+jKljt
         n9WqD4VEjVQx2WhywMBInTyk5itvnf8FwSgz1udno4n/49pdnzvhJnbm9PIQyeCJ4DTn
         2TGRjfSgLOAyQJNwN2r97R5WK90ygz5YwG9AMI5TeZksWhuvY6MVQqURMtAfTzGGecGP
         B81gRQGKy6mpUqWTGYTn3lf7XwuIYMNw1FUD/29JlWIwRgq2RIfNrpdWsUwiqsW+aPm0
         Yp8w==
X-Forwarded-Encrypted: i=1; AL+hErE3Qk/qLIkM0FeaUW4aoHpxsQtLeU/RLT04MVwqCwL9dIJuXTs7PhZo5TxexluzTWl2wzUm3Yplsg+fpTY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BWaem4hRvlRbjtiZg12DUUX+N2KjKYvdz/UZLJxRflMRHTv4U
	aXcw1aAW5Rl2zIdJt3GmMb/fYylgmAdlHF8X/udJoFd2cCUED5nO4Q1D
X-Gm-Gg: AYBFou16d4PIA3iBu0/XHvnx8VcI4ZVDVtLsSsluIwGO0Y4Fd9Zki8VYcnOATlQ/YAM
	v4efKTcWisCMWHUw2X0XkfXHY6m2T1/knIucmXjhwEQ+OtcF2lqDq3qeGNMkAPs/eofCUFCGidr
	29gdJb5yhPFNFXBceiGSWVe/5Rfu0ZbjBrUizjcNb+VxCej39gyM0oYAwzQx9kbkFOIRrQ6ugO0
	wOHFLNhv9IL2Gv2X/pxcalgwflX2DRGYb4xf3+OEGBxuomxxLxhPxXodaD/ult3Bam7PW8st8Gj
	je/EhQq/wTT4Ztm7dqxrMxdct9yH6l6ps/jUi8NwGdUuvx06q2WTDLVsl1teFjNZhJ64oW6UKZ4
	RTcss5Vq2hrNfeHCNdlLlfGCsO98ILVh8XpW3VmcgcRjgzc3kj2gHCK2MsBbb43TIBEgteOvq1W
	C0CuygrLuXfz8X2Mq3bM5O0RMZoyLFFNS/wAJ8lIlTp98V3zJsO0h5ugDjPXf8wLkd8fi//5v/f
	jmbYiVCYc86hgWLT+0rEPEDfzdjF1TMHpP/wmoxVI6RjK0WrhWbqafGGzKK0D3YUXmn1iEh9AHX
	8V3PsacKQppv2JYkJySFzRy+PDhi9MnwG9naunnY47c+zEz3TZM1GMGUhhthsAPs/SzWcdnkLCg
	+9tSMPSStnyEOgcwNwm7ur7KmpN6rXyUV7W7ATqDU
X-Received: by 2002:a05:7022:81:b0:144:de98:eec1 with SMTP id a92af1059eb24-1b39fe87bf8mr2150277c88.11.1794142192325;
        Sun, 08 Nov 2026 04:49:52 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265619774sm5623975eec.8.2026.11.08.04.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 04:49:51 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Alyandra Zahran Nadhir <alyandra5b@gmail.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 2/4] ALSA: seq: ump: Clear stale selectors in sequencer conversion
Date: Sun,  8 Nov 2026 21:47:49 +0900
Message-ID: <3c5cb0ef0023c4d2e835805498a14751a92feda0.1794141913.git.sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794141913.git.sammiee5311@gmail.com>
References: <cover.1794141913.git.sammiee5311@gmail.com>
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

From: Alyandra Zahran Nadhir <alyandra5b@gmail.com>

The sequencer MIDI 2.0 converter tracks RPN and NRPN selection flags
separately. When the controller stream switches selector type, the
previous flag remains set; fill_rpn() checks RPN first and can encode
subsequent NRPN data as RPN.

Flush pending parameter data with the old selector, then clear the
opposite selector before recording new state in both CC and Control14
event paths.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: <stable@vger.kernel.org>
Signed-off-by: Alyandra Zahran Nadhir <alyandra5b@gmail.com>
[HyeongJun An: drop the KUnit test, fix the subject, add Fixes and stable Cc]
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index ff4ee26adad1..bac37d4ef43c 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -847,6 +847,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 	switch (index) {
 	case UMP_CC_RPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->rpn_set = 1;
 		cc->cc_rpn_msb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -854,6 +855,7 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		break;
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->rpn_set = 1;
 		cc->cc_rpn_lsb = val;
 		if (cc->cc_rpn_msb == 0x7f && cc->cc_rpn_lsb == 0x7f)
@@ -861,11 +863,13 @@ static int cc_ev_to_ump_midi2(const struct snd_seq_event *event,
 		break;
 	case UMP_CC_NRPN_MSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_msb = val;
 		break;
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = val;
 		break;
@@ -975,6 +979,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 	case UMP_CC_RPN_MSB:
 	case UMP_CC_RPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->nrpn_set = 0;
 		cc->cc_rpn_msb = msb;
 		cc->cc_rpn_lsb = lsb;
 		cc->rpn_set = 1;
@@ -984,6 +989,7 @@ static int ctrl14_ev_to_ump_midi2(const struct snd_seq_event *event,
 	case UMP_CC_NRPN_MSB:
 	case UMP_CC_NRPN_LSB:
 		ret = fill_rpn(cc, data, channel, true);
+		cc->rpn_set = 0;
 		cc->cc_nrpn_msb = msb;
 		cc->nrpn_set = 1;
 		cc->cc_nrpn_lsb = lsb;
-- 
2.43.0

