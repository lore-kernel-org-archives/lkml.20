Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794061220;
	b=1vdn17LLGzt2nBfADOvQ4uOopmsO/1UAT8ccZqFNvsA+Y4RDbIH5BLHkMsxCTQz08byG
	 8GrCuk+10sRL+amGoMe481vNqIzaYbIFW8F0Ebi00eV1AYNA+rfbTleYg4lT6eocO63pY
	 c3trgpYDgP4K1CyHQwwEuWjduLCDpmzzKcxfi2edYM1LtJ+BuvK2js09EANTCaC6MZMMM
	 +u0IB+nq9FjSpP7DAsnvxmW8G5MGfwtqdA1g6XCxUoag3KeSiIbakwvzsnSt/+bgpjL1A
	 h5MfsjLGyy17/Ui8ZjoL6N8wV61vmrEjnAa6B0uzwwYjcAeswMc65lumqpCn0JVp/lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794061220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nq7TMgdP67AQJEH8b+kZWGdLv4SVRS2B3Pui2dDDqM8=;
	b=dNbR5qug+2YnhUefLLtyj82Ux3f5Qn3ye+KOrFRef3kaTLF8CBTmQsVSwEN95vbXDTkt
	 lxfTy/CBLsMfiobgF6AkV3o7WNWqAwCdUzcEL3z8Y+Xj+4RLyN87dS41pvchNEB2mUCyP
	 b2Anew5fd/dYEHMy4TqWtyeW0w3iai7kLMozTxLXSmTS6V+2JtQcQbyWR+p46+4J/7lVq
	 FEp8LI+Tfvef1qTGiR4LYqnCuyuWe5uttYH6QLyOmFZYjSmPR0L8Qwe/lIrbTxjTMQqpq
	 Gb6XcB1XW7ZAAFv6poQTSeFzFbrpTQvmU0QZHbt6HyVKYkU4OI8Z7Wu7cF5C/o7p4OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TUT02lU/";
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD3E606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 14:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1DD3E606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TUT02lU/
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1518562c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 06:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794061219; x=1794666019; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Nq7TMgdP67AQJEH8b+kZWGdLv4SVRS2B3Pui2dDDqM8=;
        b=TUT02lU/jlFCsnVOhUhT1N8m20Y35Z/eHxf9abrzTZo/VbEolQzmTQ1NyySvYShKST
         qDkW4MslSeAxqdfKUCxB5x9bfeszVmSa8xeNMAIi5jYAYkyWhsBt/ZmhKodeE2UYMWkj
         Pvgoc8ClyIDxNZ7HXXxS1OjnxD07Qk9mRV3+L8xPKu3h3XHcL/QaHVrS+HYHou7O8D0F
         wV2F9p87PoNrS/DXeeqe6cRmiBBHWuLTbr0ZXGfLqJRR85W/4zRogGPxEGi4/fa3MGQl
         dSyTaUnYo80o1EsVy4T2k1SK2Fp9GwnOSe4PIdEfiSGgAvLEJiUQ/8ItEdoZuVcuaTZB
         ZhlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794061219; x=1794666019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nq7TMgdP67AQJEH8b+kZWGdLv4SVRS2B3Pui2dDDqM8=;
        b=CSOwiggcC1rU5EXmfSPOzcQp1V7KbmHOPj9Z6OdrrUpccShegWZ/j8LA5si1K9cq3m
         S2XN2uoj6hOnIzSQgQ4XBnM5OlPRudxcaOYj82f7WiiJURGHi2Fhk7H0EZAp1oDLexGE
         P3X6I1FQT7w7JLt3eeBPralLiZ3Ni4lavtYtRxG2dbVcWiGEg+B6kuoocpKmPcR0bhy8
         /cfouctEsxTuk0IuVwMQP418NXjBkN2m9eZNIVc8aBaEg0Qs/Pi33ym3BlqGTL1HDh62
         V4EFL0I9KvtVlob5nWX4D38vW7oUi7+QcGR0XbZuiBODeTrX2Kf3OMd/JuTLq2zkgKYS
         BRMw==
X-Forwarded-Encrypted: i=1; AKwUvBxdhsvW5ugWYUQtPxJ2SMtm8/MFNw8HZXK8NSfgLFkuyakFZ5PFhweFsgLI+bCKzjzjEWcUwbmJW5JIxuU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/51p8fIIV7JLKAayHdO3TrUNEt9RUlTtkdUkgCpY0mJqnsbjOR
	wpZsEpvvAmPvzfhbbdEyz6q/cLd+F/z39swlkNK+qYo3/RyTN6vhL3/LUQmb8PM6
X-Gm-Gg: AYBFou0ss+RHB/oDmTfOuDPxrRgg6EdsrqcHgCJkIoYzOWg7zAVUnkfwJNv2fHAU9xw
	2yl//mWs7c018np2iiEaPI0AHHOpD7F+Nl0MHAlWVzZZnr5P6MITbY4J8QlVLeNyErhTwsrrdij
	kJwfZoz3SHtgqueUX/E2Ap7yJ40CHs/X5YRGXrTD5rrsv+ucPU9vWb9BW9mpB+hkI7UPglJGTp+
	qH0+rHSmz71jqVVZeHyoDfx8XQZgnluiAhc0pghvzMDT/Gkjcf2hKYL11slhjYn6OBf5YPZWOTa
	VxhE+p50RnL5GkdBgKIwCLL43B2FywD6bDzL7+KD+kod7KVx5W4AnZUchvhi2k/DUvOlwzwZqPY
	PS8iSsyZcnzIAYA1oLXkdTQLFVvZKwDGRAtAmkeep5ZQWPidb60HZi7EDMXlaSNQTye7oZcK7Wj
	Xpl/2uPhOsA5hWT5HIcfXlXUbmb683jVAXc7Rx4KK57aHbUcb/UhcrQusb0Nb/WNrqdfztULlQ3
	LtNTgnRM4+fPkMbmmQattGm2j7uNETNz81IwAcbToRcR5ZCbE/3Zq7DyXUAf6CeGdCvJiwapfm4
	9AZ7gPJ8dc0Q7H8xBNW3jOgyEdH9QgGMSI9TcsKTKQ9mtPMrHDVtMlXNEUURr2of3gPHGkI=
X-Received: by 2002:a05:701b:2505:b0:185:fd0c:4585 with SMTP id a92af1059eb24-1b25d346ecbmr6821632c88.33.1794061218976;
        Sat, 07 Nov 2026 06:20:18 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4840f3sm25727366c88.5.2026.11.07.06.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 06:20:18 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] ASoC: twl6040: cancel jack-detect work on component remove
Date: Sat,  7 Nov 2026 23:20:06 +0900
Message-ID: <20261107142006.3711973-1-hj351016@gmail.com>
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

From: Hyunjung Ko <hj351016@gmail.com>

twl6040_remove() frees the plug IRQ but does not drain the delayed
jack-detect work that the IRQ arms, so the work can run after the
component and its devm-allocated private data have been freed.

The plug IRQ handler twl6040_audio_handler() queues hs_jack.work with a
200 ms delay, and the worker twl6040_accessory_work() dereferences the
component via container_of():

	struct twl6040_data *priv = container_of(work,
				struct twl6040_data, hs_jack.work.work);
	struct snd_soc_component *component = priv->component;
	...
	twl6040_hs_jack_report(component, hs_jack->jack, hs_jack->report);

priv is devm_kzalloc(component->dev) and is released by devres once
component removal completes. twl6040_remove() only calls
free_irq(priv->plug_irq, component); it does not cancel hs_jack.work. A
jack event that fires in the ~200 ms window before removal leaves the
delayed work queued; it then runs against the freed priv/component after
twl6040_remove() returns and devres frees priv (use-after-free).

Cancel the work after free_irq() (so the now-detached IRQ handler can no
longer re-arm it) in twl6040_remove().

Found by static analysis and code review; not tested on real hardware
(needs a TWL6040 audio codec with headset-detect wiring).

Fixes: a2d2362edf9f ("ASoC: twl6040: Add jack support for headset and handset")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunjung Ko <hj351016@gmail.com>
---
 sound/soc/codecs/twl6040.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index 650836f..826bde1 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -1136,6 +1136,7 @@ static void twl6040_remove(struct snd_soc_component *component)
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 
 	free_irq(priv->plug_irq, component);
+	cancel_delayed_work_sync(&priv->hs_jack.work);
 }
 
 static const struct snd_soc_component_driver soc_component_dev_twl6040 = {
-- 
2.43.0

