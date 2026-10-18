Received: from 3.mo582.mail-out.ovh.net (3.mo582.mail-out.ovh.net [178.33.253.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2954386441
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 14:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.33.253.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792335068; cv=none; b=UPNxd9EgQBacUBoWRZbQih1DL9A8Ke6LAqrriIvPbgUBm534ukbb8NCkMIqrTMezsj8Ii0Pn3LTo69dRmlk3RGgHJEAZoHRbzOOvIeZOhyjorA5W69JNw8IocbDHuRrJyVnY7CNVifKuo6PmcC5Hx0iOs1ID0QKpQaLOCY8pxwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792335068; c=relaxed/simple;
	bh=HoHaPtjHoYfkbv9dtFclewtiTpwiXcz72MUS8v1F7Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iQcV5Q3QdkxJdw7qzhtcK4aiGfolw/CmmbvV0P/nxzieReUm40aHo1K0mj6iq37G41uAmqEfFK0MHcrGestNR32VdIIQW7FEAOb9O3L45jNWqkqSVDrxW7RC0UNdA0lft8GE6NXxPkRJ/PijZELJco6+ureLuae/zOawaDBIE6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fortytwo.fr; spf=pass smtp.mailfrom=fortytwo.fr; dkim=pass (2048-bit key) header.d=fortytwo.fr header.i=@fortytwo.fr header.b=BglLw0HX; arc=none smtp.client-ip=178.33.253.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fortytwo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fortytwo.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fortytwo.fr header.i=@fortytwo.fr header.b="BglLw0HX"
Received: from director8.ghost.mail-out.ovh.net (unknown [10.110.58.95])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4j6x184Dmbz5xP3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:15:24 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-g6jb4 (unknown [10.111.174.188])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 0068FC010E;
	Sun, 18 Oct 2026 11:15:23 +0000 (UTC)
Received: from fortytwo.fr ([37.59.142.97])
	by ghost-submission-7ccd8bbbb6-g6jb4 with ESMTPSA
	id SwRZKUuq1GqLkAUAZOlizA
	(envelope-from <thomas.nemer@fortytwo.fr>); Sun, 18 Oct 2026 11:15:23 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002cba71a3c-52dd-4ff1-974c-945b586c1852,
                    B56F0971D6B095CE003BCFC685B2F3186F5EFD30) smtp.auth=thomas.nemer@fortytwo.fr
X-OVh-ClientIp:95.173.222.53
From: Thomas Nemer <thomas.nemer@fortytwo.fr>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Abhinav Mahadevan <abhi220204@gmail.com>,
	Thomas Nemer <thomas.nemer@fortytwo.fr>,
	stable@vger.kernel.org
Subject: [PATCH] ALSA: usb-audio: Fix missing sample-rate control for PreSonus AudioBox USB
Date: Sun, 18 Oct 2026 13:15:19 +0200
Message-ID: <20261018111519.191844-1-thomas.nemer@fortytwo.fr>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 12271183087021757979
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTECwDY6ynUbKWqkMeXQFbYg9bRd6yio3w7rsWEWqT1noq+4OFe/QChhGPGl0UFM6yq80jVtF+TPk0xM8/YNV/pHp9YEmPHjMjp3Wd+O18ZidHvCkWh5G+1sVl6Xx6zPIE32rrNLilFpC+fKE1UP2yL0xUYRa3C65tBve2mLCrQiqmizofo0mKnenTb6RzzXd4vS8h51a0KVT8ffzzb7hY1sPFc8VYPr0ivEYHcmWO0R/JbifqMnZE0+nRMQkYXbZqwW4Ul+0Op8Gi+emSzP2ciws2AfMs18GesHadyksTgx1y3l+HwiGhfOwJvp/8zN9HgXznruMmeVII2VjoIgKqoIBjfzzyNWROlFSaHJLLXyjJYLyUrW4Xm6OBzNcxethapTPeGyIURL69ulIKVEy6KG2TgEMQieGhfJHN0SOaioGy4NB7w4kWuXkGkeErTaVvrfu0jzZamZJQCzgppp4sjxPfpzNPKYXi0/YbuYytvtjmUKFVEwuCNiS1HgBHDrejRAJ8vVeEcX87wDuUANg0JV+Junj9feK0ZK0OxHC7zzecURtOwWzwH74kcWVULxjeyjiqG7G1qGMzHucTEZk3wJkzjMdvFcMqG4yVe4t+xqklJUQ364q6LdD804KtxZAaUT0zLRVcmx68jyHMmJKNsZUaf7zYm6zm6PSEJ6lfclOw
DKIM-Signature: a=rsa-sha256; bh=GvC2EkNZpLSK0S+Zb8J1W73t6EIxhICjDJ3m4zRPN/g=;
 c=relaxed/relaxed; d=fortytwo.fr; h=From; s=ovhmo5104297-selector1;
 t=1792322124; v=1;
 b=BglLw0HXajdquoFMYaeMJzWjqA67/eZjgtvG8knpnWwk602L42Jlni0UY60DsR6fMOZUSc0A
 EanytxtO+4w3sYond7siJNTxCxY8mKhcsKluQ8gYE0EgjVDTzb/Zy+/5cz2uGlJ45OWiZvRfInT
 p7wY3IJ3gCm/ZU+kFQc5JsfgmlBAgoguHNeUYjMNHRZXWu6VAwBMiuONuskoIU+Mk5DJhtDOvSo
 pjcAsBvNex3u8Yp2T2CEt0ESaAS3u+V+SOWkExUuaHckq4XgBBKhNI0nm1W4RwWqdWmxmEgv0v9
 uy0kiUhIr59sgd9pCw3GIadR1A2Y3gpCdPk5WHPnjwTGQ==

The fixed audio formats for the PreSonus AudioBox USB declare
.attributes = 0, dropping UAC_EP_CS_ATTR_SAMPLE_RATE that the device
advertises in its class-specific endpoint descriptors (EP_GENERAL
bmAttributes 0x01 on both EP 0x01 and EP 0x82).

As a result set_sample_rate_v1() bails out and the kernel never sends
the UAC1 SET_CUR SAMPLING_FREQ request, leaving the device on its
power-on default clock. Playback and capture then run distorted
whenever the stream rate differs from that default. The device keeps
the last rate set by a host as long as it stays powered, which made the
regression look intermittent (e.g. it disappears after the device was
initialized by a host running a kernel without this quirk entry).

Restore the sample-rate attribute on both streams.

Fixes: 34fe4a9df247 ("ALSA: usb-audio: Add quirk for PreSonus AudioBox USB")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Nemer <thomas.nemer@fortytwo.fr>
---
 sound/usb/quirks-table.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/usb/quirks-table.h b/sound/usb/quirks-table.h
index 2da8cbe3e6..6343a50fb2 100644
--- a/sound/usb/quirks-table.h
+++ b/sound/usb/quirks-table.h
@@ -2911,7 +2911,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.iface = 2,
 					.altsetting = 1,
 					.altset_idx = 1,
-					.attributes = 0,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
 					.endpoint = 0x01,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC,
 					.rates = SNDRV_PCM_RATE_44100 |
@@ -2932,7 +2932,7 @@ YAMAHA_DEVICE(0x7010, "UB99"),
 					.iface = 3,
 					.altsetting = 1,
 					.altset_idx = 1,
-					.attributes = 0,
+					.attributes = UAC_EP_CS_ATTR_SAMPLE_RATE,
 					.endpoint = 0x82,
 					.ep_attr = USB_ENDPOINT_XFER_ISOC,
 					.rates = SNDRV_PCM_RATE_44100 |
-- 
2.56.0

