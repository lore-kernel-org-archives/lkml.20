Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798243;
	b=fqD8Ek6vlsZkgEz8DTbgMLjUUCr9J4lqQHZFdcphPgJ7Ap4USmg+1QJm4lD9sufrbhYJ
	 Vva7Fta1gRU5DBVTN+g5L1m6ea+SG5kLSeTV1/kQkFch3UqqogYEo1+y+36hF+XFJYM9m
	 xEkjoDFl8Dt/f3+/LZi6Z6KzkbljoGSM0BHTU/Lhxx1KJIz89ZCGJFextaAS6K3PCE5m6
	 EgMb0OZp8Z6a19/MNpRhyQ7NRlufM0PrthrktKAX9viiRkCIOwTu6xU7amVB1JTzxVe/n
	 Uwt9R+taQnYVsJJaBYUzA6nF/hMWKnVgQxXPOgCyDJcvunnPIfK1GdhQgz/FnXxu/RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
	b=EL6EdrBc8394OZUsinhwcbEq7/5nEJAkSanv2H0BcGEOLlbuq7bf6UTHOgNHMLeSml31
	 8CCJpt2MQRf/NJ4+XhFhCPQKP5jvC5ZU59MJN+2m1niDLKeuwJ/npydXquTpnECb/khEv
	 H3OE3bIhd0a1FPd5WocofYQbA/Nghve6GPLO1+owNe1Zi6RK3xArKudSw5y03p29/4MtA
	 5uu2W8hgqTBzp9unk9D6jcNoJ3elmKkHVRoUtAJz6dNbxcyG7srft0Xm5+N5KkoXSDQCv
	 oDzF6D68K44PveoSwFfGIqJgFva4LK7Z6bjQPiouxy1XG9vLA16XPFdiWNp2iEgrOhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybKS4G7a;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B60606A882
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53B60606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ybKS4G7a
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-33fb4680717so8219702eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798239; x=1795403039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
        b=ybKS4G7akInIdfyuopW0i7MzNAHHhFJs0VsmC1NaI3dodJUHEUeD9GYw5jDoc+Y+2z
         bKKvyev8t+msX/NArlcSHiHRiup94Bi1hrRxuyVIkSvo+7Wonh5p74vBPp+lXf4d7LQW
         hShCDEQfRFUF1svOwlYaosXNmsH80bj5XZq6ahsAP6h588kapU+P0aR9tY7HIVpUTCgd
         4Ul9sfPta+4Yh7qS8ywSa9NKPMo3dNcLMvI4+qhstc9eqPUKqHcdSINel9sK/jBjIoNG
         yWebFEGEZjHkpDb1Yr7B+HqM6uMWF8u0qzt++bWztvlpSQHLd2gLXR69BpV+MgqIyrHI
         6M2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798239; x=1795403039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tilAlplfK1rw0akhzzldbfcTxnq5HziwNFLGGQNriOc=;
        b=ykRnMNd2RosKJ5m4eWlxGZu95tuPEfQS4nE5AjWD8pcgPHq58awZurJ5HhrqZjQdhj
         GutVM/ASxLm5msxOQiFYPVPQG9ug2pZdjBTNHpBgIgb04abVOCL/kGolxWDKUa0wJYX5
         g4JzvgSFuWRzimEhm8higyXEJci2xnvp8y8EwBm62z6HP/UwdKmXnwNhDX8HEUoa1nJq
         r+5aEUqQrByNjRhrDk17dGZ7LzmQ7YyX4krGMZNcbDPZbBseGMouFzeeud8OuBXFrWWs
         4r7BEeVnLHFKxINnJqMqWYdJwgGyB0PWSFrnWIxI9PaiuzWbKJxYj2ycKnR4C1AHg/AU
         a7Hg==
X-Forwarded-Encrypted: i=1; AL+hErE/XApWdMK5KoxaqDFP3UOyKETFhnVWy+LzohxnkoZltDBoGsgE1w7Po9ZPHKZNEOGxRNpSnL5OCXV8D1U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+iremf+C8axkPi+29EXoM6TpSw5qz3XvBtKw0KwdrkYAGgwe2k
	F2cC4QGXht62WIAPGzmUlifMwB8HI5KSK/fwdpm4E7jsDti7rS0yhLLc
X-Gm-Gg: AYBFou2/rhYoAQlVdJDTrtowMJ+JPMMpsIH5Z0ZKbCm7nWweJJFObujmGg8AsZOZMHb
	uUh9KWjzY30a12NuJp7fh/gSZxFlPD0tY2f/PtcFi5m6pVul+lUtlp/eS1Da+SbuBTlkmX5KEW9
	yj0wQrOZImsC0mCNCgL0q7gl75zTApw6zBxTl6AjP2uvqudjd2oyMNbx8WzDBnLyQ2yVOfHcpH6
	UP/Avw8ZyAshqbtHY3rtIMVZG/20nBf2DMmKJ0H2KkHxQeDkm2SrKX84st35HGjCyX5tqV7KwtJ
	eZUBE325uhmZZvbZdEOwXtUCBqmWd627BnC+/ZEB3+FU/mZWUVrThMgt9jjcERAN6M43YuDSAFj
	hqT8YsZTiM/Ctor0TcHP0KmZe70UNNpQdG0I3Lzw28X0MZ7vKKld3rBqZUh/w9gXoItiZRBk1im
	puAnRWXZV8Lb7+LK6826h+Bb9ul6nRQkmp2h8Ya6bA4jvYbRkgmVNVsPAy0saKa1VMnzcJYE7jH
	ysFdcn3o1gN8y1J2JwnuJi4D/53UXItjzJX0ufzvUaDeMAnWmaVP6JswM8rmXFrlFuIid3qStYX
	hN+cYbx7wGIXabvn4TZLRKdtrBc/y2152/csLL5COoXgSeLuq6APyCVFOQ1fbyb/5/jR82abJrQ
	kQvggUIiPyGuKFcmLVz38nfiFZaCglkDWI5bhaSQXVFOJM1eeb2Jrzz2MpBne8A==
X-Received: by 2002:a05:7301:1284:b0:36a:1e0c:e28d with SMTP id 5a478bee46e88-3796395410dmr13036616eec.4.1794798239386;
        Sun, 15 Nov 2026 19:03:59 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:58 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH 2/4] ALSA: seq: ump: Convert a zero-velocity Note On to Note Off for MIDI 2.0
Date: Mon, 16 Nov 2026 12:03:35 +0900
Message-ID: <20261116030338.422671-3-sammiee5311@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116030338.422671-1-sammiee5311@gmail.com>
References: <20261116030338.422671-1-sammiee5311@gmail.com>
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

When a UMP MIDI 1.0 client sends to a MIDI 2.0 client,
cvt_ump_midi1_to_midi2() passes a Note On with zero velocity as a MIDI
2.0 Note On with zero velocity. The MIDI 1.0 sender meant a Note Off,
but the MIDI 2.0 receiver gets a Note On.

The other MIDI 1.0 to MIDI 2.0 conversions send a Note Off here:
note_ev_to_ump_midi2() for legacy sequencer events, and
cvt_legacy_cmd_to_ump() in the UMP core. Do the same.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index c248d87f7a83..b35e3a50ec52 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -380,6 +380,10 @@ static int cvt_ump_midi1_to_midi2(struct snd_seq_client *dest,
 	switch (midi1->note.status) {
 	case UMP_MSG_STATUS_NOTE_ON:
 	case UMP_MSG_STATUS_NOTE_OFF:
+		/* MIDI 2.0 doesn't treat a note-on with 0 velocity as note-off */
+		if (midi1->note.status == UMP_MSG_STATUS_NOTE_ON &&
+		    !midi1->note.velocity)
+			midi2->note.status = UMP_MSG_STATUS_NOTE_OFF;
 		midi2->note.note = midi1->note.note;
 		midi2->note.velocity = upscale_7_to_16bit(midi1->note.velocity);
 		break;
-- 
2.43.0

