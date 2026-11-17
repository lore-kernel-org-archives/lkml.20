Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794913229;
	b=eFW/vj3ptZgwATiznZYXMSRhCa5lUHVzEApWJ3EC2XBVAglWErItBR85wJeZBwGFS7A4
	 YilkzJOwDFX7zv91REeTJS2/Cg/TwLSliZUWE4tcFMCR5tSpQyIG28hY8XEEEYIRD+teE
	 yzbjnoqAm0Kuo0/pEv2F/suQUzGtwAYYYJ5VnRnuPnom0fVENmobUDFo3ZC3qdFqY2wY7
	 kbU0Z+sJSW7UtGd/sDhCB076BNXX38JUdVzaOmhNTReIjFOm5c0WzN9XGv2DhFAue5Cxm
	 NKMqlgBuJp6cz6XMum5NRBovl8RhrmmOp3EIYbfqjavhzqsBfYEbr5QhhwzkWc1CTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794913229;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yZcGmUeZgFYf5MfxX8LmPHDv5AJoPUL9ZmZSknKLDkM=;
	b=C139AU1P/2fU4KmAIeeT5HcrvsZ/oNDZYyrw0mOMm43rZxSvb/sE5wLnw4SmnmyuMyNB
	 OegoE/gWxwx7x7W7zVjr9b5r8nYqTNMLaRsp1ob65fUHW1ORQcukokhnTeBitd9NQLQTD
	 1r4EcDfn9ih/dodQaPsSaCXZKvjFtMtWKSgsS2VshLwY2+MEWrfWUGKlQvYqwliJMyQj9
	 eaz+YWLP2Sz5sYWveiOLkhov56zkV7YdZwzhhnz15sQvdDrhKn/+5VeR6esWRV9kH7dOc
	 +z21yLL1liQZixSfM0mjEvQN5Y8zSn//7z+wdx37WYR+1YKKgpOsthiwOtEYpHMg92w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+IHAM49;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D99606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:00:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22D99606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t+IHAM49
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5867138eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 03:00:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794913228; x=1795518028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZcGmUeZgFYf5MfxX8LmPHDv5AJoPUL9ZmZSknKLDkM=;
        b=t+IHAM49VlNygVAwQr1F/+c1XcncOZtHiwQsU3pDmXhHVM97Bgx9N1US98/CSmXpN8
         GH6SuIxGIblKSBzCVLmtN8b6gQPOX/gtZzZWnbdf0hwyN/QzRTyqgW6rRgceLKq/1px+
         01uUpEA1/+5tdIXKZImcvvI7YExb+BD4VyS1A7YNVYT05JmRyLkt/eHPQCYrcuVHaZ8t
         0HQgGAxs9Tu0o67cmBz6goURjqfJvy1SfBQb9V0amjgbiOJSWPo9IODbMwjhwj+SCeBB
         zx7uXe35zpdWCWkPBcANnM9N0FLyUegGvDy8m8KW0EWQng9N/5EnvrgHsw+yenygQzJa
         +KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794913228; x=1795518028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZcGmUeZgFYf5MfxX8LmPHDv5AJoPUL9ZmZSknKLDkM=;
        b=ObK9agh8aVZr1MZ6wdW19XpRBN/T7dX+683R0AJExEvlYEZtdF7HH4MaNiBKOYqZuS
         WL6xA6Xw2G2wqppKzmwoeIehFzpwqN2JGiRwsJQ9k0ujxUOWUwPVvHCDDcA+nPWX+r0E
         P9gdAcdnOuD4ssW45fQven4VTTJdadBbXsNhUQcp3cnUG6CGW/qSEncEE1QXbA1E7nel
         Te6C6vTntXRH890S8YUxKcm8iCfG40JWwEJsA5pbV8wFeq5Q1Ilf/sBQQi0Wm1pxxv0c
         q9YhXhy7UFsqbpszzpXSFZKp6FID4z87UNFH848X4MIrNDWzCxbwfDKc0EX2iT5kh/DF
         vwxA==
X-Forwarded-Encrypted: i=1; AL+hErFF6f0yPvQH7tI9FsnzDfd9OriHXv20+YRstkEPCDEG/W11TNZ4pVMbnroEmRVwLRTp4jF8ts1bH3mS05w=@vger.kernel.org
X-Gm-Message-State: APuU4Z+baVoRelwEDr2j+T/4+QYRQxpZtPT5y3VpxdiEddUIm4VbK5xK
	nCkkM0I4w9sOHCqgItN3+DF9Go0QXCkmr3NkS6oiYzVcCyuesj46+2ZJ
X-Gm-Gg: AZFdTZftzaAwe/DCNmdg0hlUHU8m7LCjYmJbkg24f3b/hxPtIBEmYkrs8y3W/96t8NP
	yyDl3zdiBwxWKx7GBAGy726rxB5eaWaeI5RH4cugnprxvIUgBK0KCjWbG2joKvzYIVHgBwktRsi
	HVkI6z0/U+mze52PnnFfKVBQmXI8l8L8NdTXi1Bd3+Ru8kCPJjF7Ue7VxWtHU5Nbsa2VYPc/FUO
	K1K16ZmVPzbfvlj74GQOP55rBg1gotlPN3rgwEm2zwuFVmdxC/Z+8oGBYl6BwWI3XpCz6E7H7pH
	VKgdsScDqz753b8cWCPOW4d1KDfu3a0ZhyLA2/jH1wFOIBfuUf6jM9VJp1M726KxA18scq3rJUx
	tLodMuaAms4xYu070BFLErSZKncSGK/RjHf60m9FUs64OZRpfqzsqktMC4+gCYAWvuTtp9Ivwcp
	fORLi/+0IIJV+2aI9ncCA52ya2FH0cziX/EakRKZonF3L52wzdHT4P6Oj7RqQR7pClEIpboabzO
	vf9M9oPk2BkDwGmt8+ZLktL6cTgWS9ajBz1YQfMIDs7NYkscym0DxVFe2Gl0pdaS/YHIhp+DHzD
	1XUEVJklj4+rzW6nYYYuy9UA9HKPa70JAhgqietqMHYFLQc7YU7YDXaRPAUbsmDsfrV6Nj7yEKy
	7Bu1gCk1ePVs7HVG+M4uB1c8MDtoRMJvzhFxoJoFjbfhggiu6dR81ng4cJ5WbJdpW8f3tK2as0E
	Oy964xCh+Qufj6jDZeon60U3zgTV7oPChy3wMqQ+S38n7lX1C2sjXhtqEzSie1XFA=
X-Received: by 2002:a05:7301:1524:b0:381:4b4b:f96c with SMTP id 5a478bee46e88-3814b4bfb20mr2043792eec.34.1794913226828;
        Tue, 17 Nov 2026 03:00:26 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38115cfdd6esm5883392eec.5.2026.11.17.03.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:00:26 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	sound-open-firmware@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnav Kapoor <kapoorarnav43@gmail.com>
Subject: [PATCH 4/4] ASoC: SOF: control: reject out-of-range enum values
Date: Tue, 17 Nov 2026 16:29:50 +0530
Message-ID: <20261117105953.188645-5-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117105953.188645-1-kapoorarnav43@gmail.com>
References: <20261117105953.188645-1-kapoorarnav43@gmail.com>
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

snd_sof_enum_put() passes the item indexes from user space to the IPC
enum_put() op unchecked, and the IPC3 and IPC4 ops store them as they
are and send them to the DSP. With the IPC4 sof-hda-generic-2ch.tplg on
a Tiger Lake laptop, "Dmic0 Capture TDFB angle set enum" has 13 items
but accepts 13 and 0xffffffff, and reads them back. The ALSA mixer-test
selftest reports this as a write_invalid failure.

Reject indexes past the last item, as snd_soc_put_enum_double() does.

Fixes: c3078f539704 ("ASoC: SOF: Add Sound Open Firmware KControl support")
Signed-off-by: Arnav Kapoor <kapoorarnav43@gmail.com>
---
 sound/soc/sof/control.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/soc/sof/control.c b/sound/soc/sof/control.c
index a36c4c1d4505..aa02376d61e6 100644
--- a/sound/soc/sof/control.c
+++ b/sound/soc/sof/control.c
@@ -141,6 +141,11 @@ int snd_sof_enum_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *scomp = scontrol->scomp;
 	struct snd_sof_dev *sdev = snd_soc_component_get_drvdata(scomp);
 	const struct sof_ipc_tplg_ops *tplg_ops = sof_ipc_get_ops(sdev, tplg);
+	unsigned int i;
+
+	for (i = 0; i < scontrol->num_channels; i++)
+		if (ucontrol->value.enumerated.item[i] >= se->items)
+			return -EINVAL;
 
 	if (tplg_ops && tplg_ops->control && tplg_ops->control->enum_put)
 		return tplg_ops->control->enum_put(scontrol, ucontrol);
-- 
2.53.0

