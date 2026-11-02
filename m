Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.33.253.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620196;
	b=KF5iCbx9v/3Udgp7pf8onyIryxrECotJfpHcrSJ1BDUV8PZw/LkEqMlqUi0y0BHIM2nq
	 rY0xdWvm3v7Zya+m37AiUCpIuMAgYmM8LoRr38ML4E/sOaMPtpGZU0q1PUK0fFIBrsrnJ
	 LKAXWNjnmcG7r9ZQ4Wrat9YFwYqvs2Rl0V+BJgYWXm2fxcQt0QKQxoIuP7woZZRIPdcsu
	 Bq6a9kN8VYQ/JnURRbQ/oXrDRdt1DgPxkPj3iBbydJ+FNPu/9rjwVrL7DjMrjM053sCUP
	 GBMNEErupQlUQj/M/f0htGPy5Og98iSsHmfrFCj5V0Mvr0oU0FxkxlmUzPSSVo53lAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620196;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=pBDC2BgbnIqEvLnUWulTMsTHrM2uTwD94vFd7QfQ5MQ=;
	b=1qKUUKREFo4ipGzbJ69xSRjfzPOCEG+bv0OcAN0yV00yjjzCBgfzAZ4q/jyant3KP2dp
	 qaTspM/y35Ij8I2hK4uOFZ2GlmY8sEsceHkcVFC2YAfzOv237VmQLBfWsuaqEBRtmnU3T
	 TC6kvV7PdC7iYJ2idfvibnfaZToBwwcbwKfu8dIUtogizmLzSuqeIFRuvIMpwLCaaQns+
	 2bi1QiZBS4dDk8XfgLKBOq5/oPgOTmh48fz3/D0IDrJXwsjfivbisn6rOr6QJzuLh69jv
	 tku1WRKtQcKJ07GHDSlyqLbJpOtbuDVsdGeAR77IZrj28NQ2Ovf6cc6yrHXjCpMCzeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	arc=none smtp.remote-ip=178.33.253.26
Received: from 3.mo582.mail-out.ovh.net (3.mo582.mail-out.ovh.net [178.33.253.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF463606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF463606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Received: from director2.ghost.mail-out.ovh.net (unknown [10.110.58.102])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4jJ93t2gbLz60x6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:49:46 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-lk7gq (unknown [10.110.54.206])
	by director2.ghost.mail-out.ovh.net (Postfix) with ESMTPS id C358CC156D;
	Mon,  2 Nov 2026 11:49:45 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.98])
	by ghost-submission-7ccd8bbbb6-lk7gq with ESMTPSA
	id KZIQJ9l46GpCoiIAhuyspg
	(envelope-from <michal.kopec@3mdeb.com>); Mon, 02 Nov 2026 11:49:45 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-98R0029bbe1376-0339-44af-b212-b97335df3e99,
                    1A0BC365A2A0EE6FE4E0299828BF967916D351CA) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	piotr.krol@3mdeb.com,
	maciej.pijanowski@3mdeb.com,
	Michal Kopec <michal.kopec@3mdeb.com>
Subject: [PATCH] ALSA: hda/core: Stop capability walk on empty capability header
Date: Mon,  2 Nov 2026 12:49:39 +0100
Message-ID: <20261102114939.2182131-1-michal.kopec@3mdeb.com>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 8708272832907353758
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGTW4kcrLOE8RjhUI22VIDhDR0h5MgeIgYU9kMbfQ/GFkRgwpuA75AcafHgHEOeoq1x3o8CetBKv1bzhIkHWBt609Gq0K1jyHwYooKet4WdQ9sq+f7clj7nMRzIvaHeFOPUnc5/cjwJBloDTsogQlnz5XtWvH8P82+UEp2BUCBUfxyCIMF3zt48kvUTtVWy55jLr87otUl7wlJ0YnOSop/Wff3bUwp3JcEpyEqMBVCrOAnnyTpTAmcxkEdE9/FFTDTqbRrB0MV5eL3EApjvanaqcavm0v54FrOZZvhJN+ZVuP//Gu+qIsbr7GGqfSS+VeXlEeG3lG4C0A8WtuC2QPVxiSfqL7C3ZNi2V0TSdqVYRjEU1iZM5V4Ct+7CMzkpqvQ0Q2WFRP44LRAQgBMzEMbzWjp5HofcX9cEOoQqLvqk4VSknde1z632kGulWj62Jd1gifRiNLeodFWV0pxLjcO+la72cTuRhONsDkEdzDKI5rQWwZ7Qgu0w1FtVhjlTEcOmfBltiDvas7aebdIHdLCwxE77K9Rlmn5aonTLhW4Jjzv8+w61zAzeyfDOxepgSDKBTaWH4oI8WEujwQe8/4Bq0pK58aIcQHzSh/OqTuAD0urfFWwnnLUwCN2PLsMk33ZuWh8Zzel4mC+x6x/og+kHmqxGnu0TF5BcsWGeU3aRaA
DKIM-Signature: a=rsa-sha256; bh=pBDC2BgbnIqEvLnUWulTMsTHrM2uTwD94vFd7QfQ5MQ=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1793620186; v=1;
 b=PNS2tLbsWpE0uxFQOiKv5deabQakw1XfTEAXrIuuqtceJvXnXAicxLxDk960XrtBpXe/GTY1
 GjdOADQcfMRpa+Nb++8OIeS+qjzEU0IkqGw/8UJBlSGl3sd+ky/3vOgrLYv0d4DrSQJkER9gWyy
 poLF67C++ISjh6GUqngK40Pf1FtBu8F02d4xDapM6HC6h05WFzo8P0YxtiTeztvseTNRoZQHW2S
 74bgpVlyUjT5OCvWsB3C9NUL9c9PtLHHL/Vgc+QcFcDx98OlIIEQ9R8lDrklGkOniYyZO25qdR9
 84NzFsephTl8F1PRKqT/Hfvpdjsmn5x4Ht3PNd58bwgeA==

From: Michal Kopec <michal.kopec@3mdeb.com>

snd_hdac_bus_parse_capabilities() walks the controller's linked
capability list starting at LLCH. On some platforms one of the entries
reads back as all zeros. Such a header does not describe a capability,
but the walk still treats it as one: it falls into the default case and
reports an error, printing the raw register value instead of the
capability ID:

  snd_hda_intel 0000:00:1f.3: Unknown capability 0

The walk then stops anyway, because the next pointer of a zero header
is 0, so the message is only noise.

Treat an all-zero header as the end of the list, the same way a failed
read (-1) is already handled, and log it at debug level only. Also
print the capability ID in hex for a genuinely unknown capability,
instead of the full header value.

Fixes: 0b00a5615dc4 ("ALSA: hdac_ext: add hdac extended controller")
Signed-off-by: Michał Kopeć <michal.kopec@3mdeb.com>
---
 sound/hda/core/controller.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/sound/hda/core/controller.c b/sound/hda/core/controller.c
index a7acd3418ae8..52deaa9f1a91 100644
--- a/sound/hda/core/controller.c
+++ b/sound/hda/core/controller.c
@@ -445,6 +445,13 @@ int snd_hdac_bus_parse_capabilities(struct hdac_bus *bus)
 			break;
 		}
 
+		/* An all-zero header means no capability is present here */
+		if (!cur_cap) {
+			dev_dbg(bus->dev, "Empty capability header at offset 0x%x\n",
+				offset);
+			break;
+		}
+
 		switch ((cur_cap & AZX_CAP_HDR_ID_MASK) >> AZX_CAP_HDR_ID_OFF) {
 		case AZX_ML_CAP_ID:
 			dev_dbg(bus->dev, "Found ML capability\n");
@@ -475,7 +482,8 @@ int snd_hdac_bus_parse_capabilities(struct hdac_bus *bus)
 			break;
 
 		default:
-			dev_err(bus->dev, "Unknown capability %d\n", cur_cap);
+			dev_err(bus->dev, "Unknown capability ID 0x%x\n",
+				(cur_cap & AZX_CAP_HDR_ID_MASK) >> AZX_CAP_HDR_ID_OFF);
 			cur_cap = 0;
 			break;
 		}
-- 
2.56.0

