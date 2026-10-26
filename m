Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013740;
	b=vwaJtWVmH4udl0jl0DyE7+LvPb4rrFzWpgd0SvQuoIFC3DPtuRUQ+IqRljlIf6Eh58zA
	 4tn3jimUuy+P7Gkd9NFS4Xn+QPo+EYuK0+LfnClk+Jdnvryp+oOgBkUgRRBFg5Hab2gqP
	 ROI1XxZCGmiXp9A5fQ/IF7y0hUnfNX2s3PqMHZwxGQ9GoaEs8u5UFcmPljJhOWPJkPkf+
	 gqu/kAtX+cYGgLA+yZu2hnled/hqavPzdNnOHv/6WZxmKSVhF3JaUKTDQLCn2P8EjqUVu
	 Ap0LHM+bcHufBNA8ArWMsf6drV1wJLYoQ6lUSwyqxpzU62RDrmKDWPgiR3+si0LzpNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CshcBQHuBaiwBblArFZhJHX0pEvJjKnI4lGTEeUq7uE=;
	b=ZM8c6g9JEhnx6sLQ1cyKGY99JEjCpsLlNh3LIsGBW94uAP4D+o29dHE1sZ9qZIKPEx2a
	 LfuL7z6yhTPC/2nOY+XYlVx5K5IQowX2amuFLMrxPdIbT5uSkawSoqCPowGUbJ1h7Ki+Q
	 24sS1BsrX1dmrXaT0M3NpPstHOr8VtmF+Gc22l6hUekPzKTA2CO1ZgZ6qAPQtSi8ko79R
	 66eca/MqQAQFS+dOqu1bMAkLSlBO9E1u3uMXsYVcGyDx8RXSQ3l1seze5VnV08PEHGgcD
	 S6/qsTwmXdhAKjGR2w3wCuefmWCnAA7tZNrBiaAGzF9IPbmITHc3EBXZw8K66lAdDfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFdenwJg;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5860A3826
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 11:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55C5860A3826
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TFdenwJg
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a218c463d1so17053565e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 04:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013739; x=1793618539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CshcBQHuBaiwBblArFZhJHX0pEvJjKnI4lGTEeUq7uE=;
        b=TFdenwJglwNv78LJK9io46mIH7dcJiPtAvl2c5mS+6t5BMhQWD+/S3rvX+JHd65u9U
         vvJjqUasRgLO1SpwM6/z6hp+r1JEwribYZ3Qp0tubHcS90ocoANwbjuynh0W+H5ph9uF
         cXVX7DPYaA0VmMkZHwiDqudBVhDOSRxbb5QH2VYsGD4WHCXuYkL3gPxO4VGpJtK0YMsZ
         XQmlXzoQBwTCGi47a0VdF4bFHmUFmyeri82JyCdSx8ts7TeDK85BEBSyjPlLXa25AG8Z
         G59qbHMMWgPMG9n0bzJSkC1kUgQDuMnPbnPRAADAlAPUOi4YzhCIiYZKBmzuLtrnqBIm
         ftkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013739; x=1793618539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CshcBQHuBaiwBblArFZhJHX0pEvJjKnI4lGTEeUq7uE=;
        b=zO7Dmv0Q9fa2jFJp0XnFaaaVBJP2axmgJFcofby5Uo1ebx7NtmilPE5iIWhCETbjsG
         4HY7Zrp/ZFW/DXIDkoWnLU7MJfsfiz6Nr3Vp7aW+OcRMabxwpTJctQ1aQVAOrYGLyh9k
         JlJjmN6pnjxjefksZGSzN/+4s2Q7frclqqgMaa3ZkfJ4D4M+R0sySgIuYDgz+rwTy5hi
         xVaG/jDhIvg9tqmasAvNDIlplcJNB0+c+LS2CBWmRjW1/rnWVlmmNtnP2KFOpnOUwS8u
         EW3aCNVdnsdtTzgIZ6d8RK0n5ake7vY81rFRph2RX6w537xVrwrpD7rWDrOwwOWB3T+7
         6b6Q==
X-Forwarded-Encrypted: i=1; AKwUvByubY0sONgHajSOM6r/F1zwHixtJrp3HTNHY5OwenD83rhCyPD2a5pvKOHLNeRJTQSnLmoFqAcqqOcTJpc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrPRke/OLMjJspJEpR2zFnyDOX9PCDvVKAqnU6UYs+skOrf7qI
	PJToK4qMbAy+NSTV6FqWn4amNv7dmzUSbfMhVJpkNN88U8TPkGNss0c=
X-Gm-Gg: AYBFou0OZuqK5mxPhipcXwks1fh9Eciweaq9lBngoWdbPxeqJvXtqEiYC/Q8iBc3QCZ
	1yLFY0FqHt8vUxSOMJoYz0jGFQlVYxdfvRXr/FquxRP3ng3ZID2xLadJE5VAjm+Q7I8pbtbUbSH
	RvKo7Qf+MrrMFQS1LL9t8jNlKzfseXSonjYRM2NVIQ/StGUCrtI4FRIucvnOgRAb1jQsm0ezLge
	/ek8ANx5uO0ODLF1LzHp885V3QONqO2qIfdt2GADOyHeVch5yYCt0ltg10Jt30fyENl9Q1VJYtc
	VechI1w79ddPehgEgCr9AdC/y4tkTBGz/MhZA/zck3qUETlX7ZSOK7xhrrwygtiGVSsPUG7ZUW4
	SRVdn8meZupq3TAktGvK+GgkfaBcBCzFelsgVstEAGtvY/F4h7IcmwVKx8LWnMH5OqZHYi5FuZX
	nYE5til+sBDu0G22qfvKNCNYVBQtWqqpozool65Q42EgG1VeInIzGSH41fjvhEhvPQC2cy6XID0
	wwWG2PSuOVlfpSRfg2OXsFB
X-Received: by 2002:a05:600c:1c06:b0:4a1:e7ce:107b with SMTP id 5b1f17b1804b1-4a35ac407fdmr160741305e9.2.1793013738712;
        Mon, 26 Oct 2026 04:22:18 -0700 (PDT)
Received: from debian.. ([2001:41d0:303:db6b::])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f59750sm129141265e9.0.2026.10.26.04.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:18 -0700 (PDT)
From: Tristan Madani <tristmd@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: Oder Chiou <oder_chiou@realtek.com>,
	Bard Liao <bardliao@realtek.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Jorge Eduardo Candelaria <jorge.candelaria@ti.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Tristan Madani <tristan@talencesecurity.com>
Subject: [PATCH 4/4] ASoC: wm8994: drain all delayed works on component remove
Date: Mon, 26 Oct 2026 11:22:12 +0000
Message-ID: <20261026112212.2519775-5-tristmd@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261026112212.2519775-1-tristmd@gmail.com>
References: <20261026112212.2519775-1-tristmd@gmail.com>
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

From: Tristan Madani <tristan@talencesecurity.com>

wm8994_component_remove() frees IRQs and firmware but does not cancel
any of the delayed works that IRQ handlers and DAPM events schedule.
jackdet_bootstrap can spawn mic_work (via wm1811_jackdet_irq), and
wm8958_mic_irq can queue mic_complete_work, whose callback may in turn
queue open_circuit_work.  If any of these works are pending when the
component is unbound, they fire after DAPM widgets are freed.

After freeing all IRQ producers and before releasing firmware, drain
the full work graph in producer-to-child order: jackdet_bootstrap,
mic_complete_work, mic_work, then open_circuit_work.

Fixes: 99af79dff5a6 ("ASoC: wm8994: Ensure we get a notification on startup for jackdet")
Cc: stable@vger.kernel.org
Signed-off-by: Tristan Madani <tristan@talencesecurity.com>
---
 sound/soc/codecs/wm8994.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 8bf58a6a8af7c..32c1786bd48ef 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4592,6 +4592,10 @@ static void wm8994_component_remove(struct snd_soc_component *component)
 			free_irq(wm8994->micdet_irq, wm8994);
 		break;
 	}
+	cancel_delayed_work_sync(&wm8994->jackdet_bootstrap);
+	cancel_delayed_work_sync(&wm8994->mic_complete_work);
+	cancel_delayed_work_sync(&wm8994->mic_work);
+	cancel_delayed_work_sync(&wm8994->open_circuit_work);
 	release_firmware(wm8994->mbc);
 	release_firmware(wm8994->mbc_vss);
 	release_firmware(wm8994->enh_eq);
-- 
2.47.3

