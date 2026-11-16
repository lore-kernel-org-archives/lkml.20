Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798230;
	b=GmmGneIM2VfujRFf4p3SkbW9H96qYNyBXF7Mc4VrXrMZFjM1jcWnXQe5cm6Ibu39DQQa
	 P5tb+AYOiHbYmKJI9iW0pJ4EbJz5D7SgZ9pTpLaaJEuLy0iZapCIofO4uSttt4WO5Fams
	 B+aWbDY3mbssysGqoL7MFGzjh+RoIi0U3Ca7uqKtiMUXSXymqXYiUI9gsiaM70hhL71i4
	 NnUsa+GtysK4hmHn3WMuku/egO3YyQ3iTjhy3N44Z6LWyzbDNPrkYC7c24h2gc1DIGdbH
	 TfsmseSc/sw8oZoEcTwqewx7phrRFTHTuoo9G8cQ7Uahffdlxyq20d3Rj0en1jxOtrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
	b=tT/Nvea9b2F7vcYiDvSBLL/Vc7RFHVHW8ivkm0lBCsVbYwr9iE4AL9qnY+37nVRb97W7
	 RMlDxjmdpIBFcSxmE9IItHKkjbGPiJfXzeK2PicrXaNwENnmv+bGsBLsQiBwe9BY6pCvs
	 BLUyhfOK3SjJJ7lqNqtrOCHBDEEI8i8V26eqHnBpP5GeybOmq9Kl5j5GSw3N25f+aRkAm
	 drJW2kVACb0WUjT9cm9xtRWhQRbUsIZl74OAZeV7F2aGxTMqIUTSPeDZxuTSIWPmWABo6
	 eGb+zvLOUPP/otUkhXO87J+SwhgjRH9g5Yilw055vlWlsjEkBi+UhveZgchq/x1tvlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbuhLi0k;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 417B0606A893
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 417B0606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cbuhLi0k
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so3861726eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798225; x=1795403025; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
        b=cbuhLi0k4gPQunm0cCmyXkobLQ+2PbqWxQNlMMwNnijYec+2l1ABQqA7z+WCEKmsxO
         zvKYa//6SGPJMW8Gnle952xsq2krkWRMJp+Lf94BVv09Wr2ZG3wZvzeZX5xTesLlFtO5
         1xGajNIVDjGJ42VXgqvefUaZiDClnCWMj8Ld4jC9YVh5maMEBZ+b+9NTq9CY7l1Lr7GJ
         6T3tDDaw1rwFNGcEI42z/f8r0Hhd/jL7/3giFsMcA3S/zb/eETdElF5AopnnxICyqLrb
         pQtyeMQZEpgYCLeStJFwIjdUkthkrXIofhMLqbPwmxrcvO3YAl8aA4tfWhzgLByVMjEA
         zRHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798225; x=1795403025;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=taZmjC+r+n5amxH5ylYkvKHjlAAevcJwdM3ESN5VOIU=;
        b=RLpOomN/ifw5N5kz1KLSGnITK58863dpNBa2ajgMk8+CzvmuPx9y/N2+sMUQ29GKFS
         I97jeeLt/oGR5rGc8rTo6KbKEGnJU216H6gmVdnCAuLIk35Qbyxt+cgnvZz3lof3Yh5B
         /6LQzbEDhxrIpVgvAPW6u1uSVs6UjU9LLAIpHUQBALCemGNwqDachTJPSInXofkpUwiJ
         RT1mJpiHiSzm9txR9PK8ydrCfzBnQyaN2Nxd4SJGN/xDRVGpfZUZx0aMx+bOBJvpJ0H7
         ZhHlFJU+oTWuhUhPmGX1qs9nfnVyTjCilfoVV0STHJhOmK1PdpUF9NgoAYY2YjVFQvtP
         41Yw==
X-Forwarded-Encrypted: i=1; AL+hErGdmgyvmIVz5mwVFueg7NnEvS4LbfUdRN8JMJYDqNFTd1vxNizjsmrlI8gPHAja7EfPzGTvZxvoK3oumho=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V2h2ADjlk6yy5bXXJWLLNNKd+jrMYSGabj+PxqY5ImelESrU1
	P1RYp2Pd3+ZqFxenjEa7YUAQ7b56HwzibCBksGcJFvIG4XqcUgiptELT
X-Gm-Gg: AYBFou2RITCTqML6/jnB8w8KWJoA+onEYWPO/jK4TtImnu3iKCJgRcxhI5k5qxP1Wmy
	dcP1MKigppRXfSf8/3YgFQPreLQUD+vCtbEVYUzBkML3mFgFef3kaqFgwawbg5rRUfBYUzS2/T8
	StwT3IWoeFG55SAl9+A7Eksw5bd7IWTMxcHbwhZrITEDQ0DjWwOa0teFR5w2FmTlCk/mEmr2PZW
	D/MmFhM7ZJAhboH2+c4h+4I64JSCfJ/f1dg6Qdpee+ajaFHWXwSLI650uwkSHMo9KhMJ/6BKM6+
	JJgsBrdDyaiG5rrd62pVltPOV5u17DguhYvgepIf9D7ZDDbUAifSkKDzOzc32aDJiHxsUhmBFFf
	LfYz/HA8Hd84RzydI0j7khhwRHNTuEBJGOMMyU1FOWI8O8Axce7FdBN5vgjnzeSkXLVuMehFUaj
	UhER8ci9YQ8yQUFtJlm7UDl6ux7xQh4TabvIBACsFAZq9BBLrw+FWCa8R+ghKh1507GOOXY83eO
	4TfTkm0vkmIerZUhFSjQKywcczO2UwGw79ovv9fJC6JtqxdMEwudUPmHRn6YoMK6MvYnZmX7dl5
	d7t4miLT+MQLQVz9F7RiLOvNBJeRSTelxqUZFmvuQ6GS/RVJL4KMV9UXKRGNi4lRszQSI4Ffr54
	XXCbp+S9IAcOzIm7KaquE+46/ZHKDg53SOtzYaDfD
X-Received: by 2002:a05:7300:d40d:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-37966e3a7cfmr10269605eec.11.1794798225248;
        Sun, 15 Nov 2026 19:03:45 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:44 -0800 (PST)
From: HyeongJun An <sammiee5311@gmail.com>
To: Takashi Iwai <tiwai@suse.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	HyeongJun An <sammiee5311@gmail.com>
Subject: [PATCH 0/4] ALSA: seq: ump: Fix Note On/Off and key pressure conversion
Date: Mon, 16 Nov 2026 12:03:33 +0900
Message-ID: <20261116030338.422671-1-sammiee5311@gmail.com>
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

Hello Takashi,

While extending seq-ump-test, I found three conversion bugs in
seq_ump_convert.c. In each case the UMP core or the other sequencer
path already does the right thing, and the fix follows it.

Patches 1-3 are the fixes. They also apply to for-linus. Patch 4 adds
the tests on top of seq-ump-test.c in for-next.

Without patches 1-3, the new tests midi1_key_pressure,
ump_midi1_to_midi2_note and ump_midi2_to_midi1_note fail and the other
25 pass. With them, all 28 pass.

Prepared with Claude Code (Claude Opus 5.5). Tested on x86_64 under
qemu, on sound/for-next.

Best regards,
HyeongJun An

HyeongJun An (4):
  ALSA: seq: ump: Don't turn a zero key pressure into a Note Off
  ALSA: seq: ump: Convert a zero-velocity Note On to Note Off for MIDI
    2.0
  ALSA: seq: ump: Keep a soft MIDI 2.0 Note On from becoming a Note Off
  selftests/alsa: Test the sequencer UMP Note On/Off conversion

 sound/core/seq/seq_ump_convert.c            |  10 +-
 tools/testing/selftests/alsa/seq-ump-test.c | 187 +++++++++++++++++++-
 2 files changed, 188 insertions(+), 9 deletions(-)

-- 
2.43.0

