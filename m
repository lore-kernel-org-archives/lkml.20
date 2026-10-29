Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793279146;
	b=YiRRSMBVbNie5oKReamZZfXSOkBxrKuRXhTdCxvZO3MsyVVKxa2cKpulwW3clYxNpqtC
	 h6kVJIyrCTFlaGHtoAa9MMPrMilXQeiER6Hy4NmN2qLg0pc2R7YOqYk8lGISC2v7LyMlS
	 K0rmbT1BCGYgzVov2WJFQExw57xWKkatcaOieOzIZAWC6usLCpaHa87XT0cEZ8eFm8SE/
	 sz3GqJsxrmVc23P785jTWDfkmSjGc020+O1TSPYMGj8iIuxLE2MaAx4eHaxadeoJ+V9Ea
	 xfiTTqgMkkEfdvMNumIIoHROl2aOkHczEL0UwIgBf79R2cL9NUKQ0kop0dfkK02qntg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793279146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wNUOdm/IOUvvzJJ7mh0K1e4OLnQV405xLGrAKQJel44=;
	b=fbPwHcZNz2hDgjXGTdW4ttMhLcXE8aMCovjYJ3W2kQbb3qvXHzvH1CYurFgl4F8OUZAG
	 SDqCxisZfzJEuLDgiArpht45mGMzIFV3ZEryHalyxzfvWvsr/b65fw6uxQrxkugO/9BFr
	 eQfSIs6kxgdHY3ZY6lLOcU+kCTFD5aXFjn1Cjhdk869Ai3ltGIhfCTEnlUJfC3eE24RFc
	 PG815MeVKSpSTS8EnKj4HB+TPXMNnlBtXPmCSdjpNz3D8X8ftDRpnv3j8KbUm5oDUMUzu
	 J8Ihdbi2LC3UwXP2ECCvQzKM/jP636ppuN2Dtuy2lFkz+dyvh/kgcfvfvBqsZUGiOLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0Z1+RBH;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07267606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 13:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07267606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b0Z1+RBH
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-170135e43c7so1414387c88.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:05:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279145; x=1793883945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wNUOdm/IOUvvzJJ7mh0K1e4OLnQV405xLGrAKQJel44=;
        b=b0Z1+RBHNX51Mk1N0BEEnymeLKvBCMIDV3LQX1GA5YjhmMxTeZ5GUscPtVYL0HzVM9
         CpvsnF6PXb/Rrwk5oLrQgUD3wmD26JQHPv8ZjFlZz7LG37/3k3fOuI8L2Ay8+HVpOLCn
         NwO8ma+ICHu7ei1tvcD26EGn+gYfWN983XV6d6b8TvJqxEuQjMBqjUoGoyVawac+1x9A
         ZhTf45ucKratTaL+vsJn851UpfsHfPrymSSHM9Za2dlxDjJ+pvqha14lE+8VXudb22Lm
         BnCz3gSIzNoE0KWZzBHGwvWwEKh+mZvjDmpnO0MhiEqguhkEbg4PLz09+Ehbr0A9tmrN
         IECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279145; x=1793883945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wNUOdm/IOUvvzJJ7mh0K1e4OLnQV405xLGrAKQJel44=;
        b=LsJ6NIXzY4gLlZs1ITnEWTMMYI6rGFCo79CjKhTG2UqTA+V0lsshScZm1cXagvfI4N
         EGNG7umv2ihZfnQ9OkSq1ahuNOvdENK45NDSyJTjoRj+RzKFvUYMi6pLZTzcWwShc0cX
         ES9w7VaoAPKwU5HR9amj3GJa4esU8xIRNcciq1jlbMFSqYJRGL9xpmBs2kjuAq4hQS6V
         nTbuIurdP7krCrUjH7D/e71e5wuWIMvInZJa2fbsvZksIqDDUlNcbtGf+/gS12bEDGRR
         QP3lumNj9vA500RdzjvVa0a+nauX8lAy5KOlU2DB5N62xoytHcqMhirTQrTFGWRTblqk
         rqTg==
X-Forwarded-Encrypted: i=1; AKwUvBxHF7MGswiBtSst6wUlUYIHcuVWr7U0dxg95zw76pcq467cORvxk9eeBG1xPdKUtnhD2eYEuhjeuHInaSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxaWn2Cg9hXSXRNJqDnz6pbDEVXkWGalfTAYiEt4Fx/RNFuPbu
	zMlG8kaKcrvGki+j45E0ff8abn2mCgzaF0mqMHSHCO4hRHZMYmLPD3AM7mtTYg==
X-Gm-Gg: AYBFou1DLHdHW389jVJfPhcpzzOhSWnbsLxbm1Fk5+r3drscG5gHFfZ5cSaKgvZCP7M
	k8QNgUcsvegcAP75fYZB5zGxY73c9a3pjvZ3kU/ukSYChM6j/6qx2xFPb0S7Yfr50/WIRuk62ma
	SSVcctTjTTA9s+Ac9deheuHyu/aJnKM2honVEFGTaOgcH6/jApLfpgdfW7T5Q8Ak9lrCRPcU/4q
	zf7202QslpdGnINIMrNnYskMrXntJ1+rZEYPE4bxK0a8S6iVhnhiNKLKYBE689SCBvpIUkcdpvo
	QEd6fnOy/iRR7LLj97DNnDMrgY+sVVmU5hddlAz9Dz9hg9vaB5ViXVpLmhwqK9eGHs7Y0v1F7FK
	6nHDcxdkl1mG9S0VYX3MXWnheW90G1DaKpFb2sZEVQzUKRZG4Eh2BjcVkMafqyzAbqL2U92f9uv
	js8u+y1TYE6cTqSXm3MS4DsbNIp0zpdbcfrcu4Q7AGjuvtD8FANbSaDyfaWzQNHLnxMY2NRuWPg
	yF6Cpj54D3E6uU1a9wa1uTRxiedM2wjUh5wiMESPD9Xkae8zlX5iSO2FuUAggzn46JXi2TUbbOU
	ZoyPYJFr3+FYxWXorYBXpUP8gjFL/S2AIskhtS4lhMms+FiHdtPNQVNPRhhDYEf7B3yEPGImaDs
	cbHYol6Jm+Pxp9NK7kX7mxuSlQ8hxa47wqww750Gj
X-Received: by 2002:a05:701b:4509:20b0:196:aa86:fcf3 with SMTP id a92af1059eb24-1a6cdb50d84mr7706490c88.26.1793279145054;
        Thu, 29 Oct 2026 06:05:45 -0700 (PDT)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a760569d53sm15322824c88.23.2026.10.29.06.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:05:44 -0700 (PDT)
From: HyeongJun An <sammiee5311@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: ump: Fix dropped data bytes at UMP System message conversion
Date: Thu, 29 Oct 2026 22:05:37 +0900
Message-ID: <20261029130538.1985867-1-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
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

The cvt_ump_system_to_legacy() function switches on
ump_message_status_code(), which returns only the upper 4 bits of the
status. The case labels are the full 0xf1, 0xf2 and 0xf3 values, so they
never match. MIDI Time Code, Song Position and Song Select are converted
to the status byte alone, and their data bytes are lost.

Switch on the full status byte in buf[0] instead.

Both callers of snd_ump_convert_from_ump() pass the result on as is: the
legacy rawmidi input of a UMP endpoint, and the MIDI 1.0 path of the
f_midi2 USB gadget.

Fixes: 0b5288f5fe63 ("ALSA: ump: Add legacy raw MIDI support")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
Prepared with Claude Code (Claude Opus 5.5). Tested with a KUnit case
for snd_ump_convert_from_ump() under UML. Without this patch, MIDI Time
Code, Song Select and Song Position come out as one byte with no data.
With it, they keep their data bytes. Timing Clock still converts to one
byte.

 sound/core/ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/ump_convert.c b/sound/core/ump_convert.c
index 0a7972d91ec5..ecbd894f4c83 100644
--- a/sound/core/ump_convert.c
+++ b/sound/core/ump_convert.c
@@ -69,7 +69,7 @@ static u32 upscale_14_to_32bit(u16 src)
 static int cvt_ump_system_to_legacy(u32 data, unsigned char *buf)
 {
 	buf[0] = ump_message_status_channel(data);
-	switch (ump_message_status_code(data)) {
+	switch (buf[0]) {
 	case UMP_SYSTEM_STATUS_MIDI_TIME_CODE:
 	case UMP_SYSTEM_STATUS_SONG_SELECT:
 		buf[1] = (data >> 8) & 0x7f;
-- 
2.43.0

