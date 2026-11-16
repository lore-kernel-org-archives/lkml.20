Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798246;
	b=lnbFOP+r4TX1E8N6SMX9j3V+GWM93o0IDijEpX4nEJKFM6UR15ZQua4Fy9N5AWyfx63w
	 WLK2woyJpF6Q2AoIAkbIK62suMbPjMynlHgz01VFUqUT/viJxnRoZ5/qq0KcptGvlPWRp
	 +2pPcn3mOe+/+GAE0y7sGtjenyo6dEDw1AiGqfzEpEQQYJuouEbSwNAqr2B+n8IEUqhTA
	 RkS/sJF+LQz3LRzJJ2dtysmAX/eBHDtA41k+nhx71vyDdpo9fYCV5Iw1YDnTJh98D7EBY
	 glxCOM628FzMQ+kKHwJfG+Qe0nBS9R9AM+Y11jLkn3WxuzFLRHkarZPrEVXZs9hkwsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
	b=Db8YGbX5/LI0QC1uUdrib9tvYOXgaJQf4oWuFZzr6lhdEeftk4vL+nZM5MiptXcOlzOi
	 lMHzSkFnMmc4bzuOMjR0hUnd0W68ncYiFN801OMPbZ1kky/IOqkRAKPrhnU4YBV6Qv1f1
	 tcxsYQtVqOXuiZ+TH83jfMXpdHEL2ECTJUAFif9FDsymaAlDW02iUxsFtyy0tgYI52qio
	 ESF6nruY3Iq/azi7r7HuPEaxFjiigXlzRh4ne+6yRU8M/vlF6gNGWIPtbnScGtoO2pd8x
	 URUXoTkpieM6BuQi667X8fg85pTbNamYktibYQEg+KLuc8Q0xZMn/dqL6yYWAoE/pbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvDJNgg;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5DD606A888
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5DD606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzvDJNgg
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36e795af1d4so2132932eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798243; x=1795403043; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
        b=bzvDJNggqUoq0TyUa1hN7WNyA7Xjm2AA4kC2UrJ7yMrYB8dbmketv7XDbp95p336CF
         Y0HRuDTMJMUlQGYxnFRLuZzDz5ZD8J6nB4WiUeTqyeRe9EC6bd/1MHxxOv84ViTWC2Ao
         Bh6GxxOZIIvYWh5y7RuU3bNloKyB3ZHcpBTtXY0UEOiv/eFMYcPzgUqcWxWfVEqWAfS3
         txCzve78djzcTRd+Hr9clFzcb9X2HruJ42HaxKsNFn/eyzXkK0nSSyrPgijMKuHFK7/e
         UQOxf21Pvbt5qBHeXaK9VkncOoJ8LnCr45/amjLJHenTxeUtN27BQ0ANP1DxT4UW183Z
         /xEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798243; x=1795403043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RtxdEvx2VdJyPhemxlD9laLvznIE0xM53vHAefz3Wds=;
        b=z3wNx1qH8C2qp6dUoWIXwjw4L/Y4rfxm+sUUPg0Y0p+yQl8Ocs56brMSlnSoPdEcgJ
         qhEWd+TZ/KiElFSuh86sa7fk05xZn+uy+QN3Zt2ynAaKVP/HOA4LXDkL+A/wQfge44k1
         yCnE+A69ywqImsq6+qhEKwK3cfRF21TwAA3lypuM9hsoeAWnAtyV2UMFD78/c0TKbJfS
         wClrbyCqApMa1dm8yiX5XZZVntcnxlGM7jBbqcLVC8dlCpGj/pJUOGt6+52DJdPdkwyf
         45X0B3hpw3af0sQmm0vrNADU5MqQZPKVZXdK24I5KGR3xVIO+jEdm6mrxnKozMT0R2aQ
         CZ1Q==
X-Forwarded-Encrypted: i=1; AL+hErFXiy0sbaqtRWxo0s5iECt79weoZihg6hcTtjs5R3+paxbMPWzZgw4n/ijmNklKSUJKb7ZNAxsJjb6uaV4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/iIM/BRqNGeKmoJGEzy9NEcoz8F0yiwzSZvOtDN5a2Nrn3bs+9
	RmTZFiISEKQrYl9y/s1OonpTKwbsdTkGfFBcFDiJKW1or4imvI2eb5Cy
X-Gm-Gg: AYBFou2Bcoa238NAIzTx8BKbILOvIpQXW40G921H72LVUHOpsWk2/0DKF5sUBPMAecE
	DnkteHZETOX5UpDsNfzonbU7yRMA2YnoXbaeZq+5zJQaQnQlbOv+P9ev4XLY1Hu+z3YKr53xasn
	i5jPEU7HZEIYLQpfhPdMe3fWvVxr+NxPmse9N9OBUOekIGcXSyx0A15HwnEEjBermGUKaNwmlPv
	FDo1rxrEb5reQTWQ0p0AS/JpU1rUcZCtgI5dcOwJ0rTMlZa2/iYGO8SeP+hN7vLQyw9ttptluuA
	xySeFl4oXLE5fyi1VTcdHZtiit5KKJ4epqpRpgVkzjvaIo8INyOvi0/Z31N9lYeBwGlsW5K77PO
	3Ag4cHVsYa/Lvo3AmEy73oTTyIqLlTkb2mRGcWS2wKj+H85uJSTDt0CdRT7J8VqRgFbuXqA+EGX
	AtSVSDVVF0/NTxlYYgHvL4aFAoXc71pdPJILqT5k36rKxNIZ4hpHoaOEHtYJz2j/faK2zn/qwj5
	X71KdRZL8uGY2iGjj3OCuYSIXGVOnXxsdWfHVOiXUqyrl+7cdRbbZ2NL0BXQijY28twfPGM2Oq6
	1nGN3ZWk3baqIWaDOGJY9pLpdNku6Vs5bkgWMz4IPaLEyeJADWNb5+8LPLCrCv/3k1KTCeeIjDC
	q5KZ3JXrx2JLCawXFFPup8M1WbVUYHr7qKZuv1LV5Lag=
X-Received: by 2002:a05:7300:7fa6:b0:36d:38e0:79f3 with SMTP id 5a478bee46e88-377e1af812emr17694637eec.25.1794798243051;
        Sun, 15 Nov 2026 19:04:03 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:04:02 -0800 (PST)
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
Subject: [PATCH 3/4] ALSA: seq: ump: Keep a soft MIDI 2.0 Note On from becoming a Note Off
Date: Mon, 16 Nov 2026 12:03:36 +0900
Message-ID: <20261116030338.422671-4-sammiee5311@gmail.com>
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

The cvt_ump_midi2_to_midi1() scales the 16-bit MIDI 2.0 velocity down to
7 bits. A Note On with a velocity below 0x200 becomes a MIDI 1.0 Note On
with zero velocity, which a MIDI 1.0 receiver takes as a Note Off.

Send velocity 1 then, as ump_midi2_to_note_ev() does for legacy
clients and cvt_ump_midi2_to_legacy() does in the UMP core.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index b35e3a50ec52..b42a7ffbf31e 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -457,6 +457,10 @@ static int cvt_ump_midi2_to_midi1(struct snd_seq_client *dest,
 	case UMP_MSG_STATUS_NOTE_OFF:
 		midi1->note.note = midi2->note.note;
 		midi1->note.velocity = downscale_16_to_7bit(midi2->note.velocity);
+		/* a note-on with 0 velocity would be a note-off in MIDI 1.0 */
+		if (midi2->note.status == UMP_MSG_STATUS_NOTE_ON &&
+		    !midi1->note.velocity)
+			midi1->note.velocity = 1;
 		break;
 	case UMP_MSG_STATUS_POLY_PRESSURE:
 		midi1->paf.note = midi2->paf.note;
-- 
2.43.0

