Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794798236;
	b=pBkkzxyR3C83ZAXvV9u42rTBEQLdw4qER4ZKkIyIyAFHV1AN6fbIG/qBpuePmCKsW/HM
	 CSJqVECHccza9eZf3Cry9n9mVh9OGT3Oz6nxtZSp4rKFTSd8TF3Z4B1A1065Zg4IdHMdJ
	 qEmipvNQiHXLKIn0rCTOKgkx56yS3bin4+Zf6BJV4oNAqd2pP/hWUNpCqpbe29Vlswa3O
	 iYbgaB0j9ix8czViPDibBoWxe4j4pvobK4qkKwDAe0fSwyqkDarTY55HhCsYN8YGtmH8M
	 tLoCOCGzrhncIQ6bXDwkwOZlMrxxRgiAZuC+k7kaePWmFaN7YuzPlSGJfO9OdraE7bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794798236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
	b=XyLYSm9DdsRf5zrwfUDFuZ2zuiqubg9EtEZIvu5K5RLLsF/khsQwWghnmceawG8QfmwH
	 dWWozfrt60FJFcW48mGchUqT6t6qB3rzTyQ3bxqjyk+zEtnpQg/ZmcWF7OIZAllVrdyIX
	 xz64c2E9NQUDU4UW5lasLYrp8e4RbNPxN2SRIqm0MtpM+YjxdA651dqIczwfKSKNnTnuu
	 qS52UP/ZyuzfriwH7YC29xUQTCF3VCNIjtD+KzDvxl/SzBnmiBUWCi+toyl7cRV6c2eSc
	 /Vhd/kGxZfUpLW1+KamhzJRJPFyfJJNO+7W+Q1F5R3irRsAi+/rrKtlLcq3nhoPdgvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pe90he5M;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181AB606A33D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 03:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181AB606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pe90he5M
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-37000e7234bso2179810eec.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 19:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794798235; x=1795403035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
        b=pe90he5M91kANyHpOtEYXLVei3WC1v6hnxARz3LPWc+ngmX9flCf8dFGhzEps3ActE
         ufnm/3kO5npj5GS90QK74eqTir8h+5vpLwfA+cYlWN5uLa5R0Szpu38UXMVtYEaQ+WdE
         55gAdIgoEzNr/FrMY/Z9cyO57SveUqLkRJ0/3KowgS4NM3jZmMDfn99HjuvVldswJs9X
         /osx5NMwRPT6o87+Ng33GMT36pbHNouP450qaHTrO0L+vAyCgeMbdvOT9KEYnBEf30pc
         yi0Q6qGdGesBF1xABj+cp52ZrvUd4Z7cLNB9eb8TCfXgRXz/pfHPvYsFO8sG6ISfRG3E
         0tjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794798235; x=1795403035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SNeaXfTa9XrrJcc3jd4rJaGJBMOoRygkUVLasRGgUSw=;
        b=zb3oPyo0S60kNIa93DOqmsgy8UesRhH5zqkVUIima3ARiTz+xmIoQEIcOmNMzVz+xI
         hTczK6UoOis1pirCLIzOkgyczW/aqi8ecXUxdc/k/+CSIocCuvI7pEwvTlDaeLz7yKEa
         o1eAwKjHBlxwlSwQQ22S7Iosxac+HmT0DqpusOpAnfz1ZQRMjAoBPN4oc+euxISlYTAX
         JwyroBNJ+0bxzGb5nINtbF0bZFjTeTdWKkxqz3n6qiGV3Z0I32dSv1YNjJwqcJDZQ/TK
         Y17X5fAymG+N0PyYCT+RRwwbVC14jksK0bdjAMNOQdstTa0yzlJIgYhf+Wk7aGeQs/s9
         8Lcg==
X-Forwarded-Encrypted: i=1; AL+hErFUoa4MxSVLpq5TbKv/j7NOqffdJGh8j1s7XoLwM8asRMhCe8trFRpc5ztXYma1OCfGaL6vqKf8TPtHAWw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ENk2dxdQuPtqYeh86wNCbCl2/PlSdfGW3AmE/IP5ZhXlm4Smq
	GGAEiJ+TuTcfCztXhNd5iUCmXeHw+nSLBItDddhfX7eA40uFHcEnHtqb
X-Gm-Gg: AYBFou1sMbOTqgTfs8jJsQOv8VUSBK2W/7jJSypzSwgzMG3+QKN+/75rT3bt8fLkVjZ
	xJ7aUv6NvXjZoRWNe8GrzbY8HID6lA68dcga1sjUzW905yWcbSPEik6TNfEQQ/ulV4vaLXTj+Fh
	DEMPA8QcXkRLCq23+7PVSpkH+/pE7HU3GMJm1OoA4Z7ZXJNWPkIto4sKIgHcSx2UkLwC4K/0J/4
	U4BGZ3lyH//jHzFRrqY7bG+9bzG8dikRAM5tZo2U1T//iEJI0lS8S4XK5QVTlhRHe3l5O6cQSOe
	JPrAp5kPRyi+XMiwieqkKdPcMNw9JD8KdKEext9azyZBk8jlt0jkCHpVw6cILNp4i3Al0xcNzNh
	neOxQFDpOT4m0pOc7JqIOOw19FoUsdJ/kWYha9tFdIdyoLjO06+I3X3MB4hksjGdibWkM7T9Fq1
	8Yx8YeTDirFYnM1I478YwtgbUhVGELA7blxFXNOI27VHuGrV4SO7BcqTvYgarkk2HrMmGISYbju
	tHbJvwcDin8gB8VMAUMkqa04xPMacMlFnfuY7A0jkXmrkYYavd4yXSbo8p3bntc7nT2pfE0JEfK
	FhW4y0SVRbYMMqXpQYlmQwFkmt0DSsDr9/X9khzvl0jFUwe7kvGLRlhItMhnxwgLifSOOU++ZpX
	OT0Ol9uf91R4EAZJ+/yMKHG9HNnGlEOriN0UZQKo+
X-Received: by 2002:a05:7301:db11:b0:369:fe4c:b48f with SMTP id 5a478bee46e88-3796047be6bmr8947853eec.0.1794798235185;
        Sun, 15 Nov 2026 19:03:55 -0800 (PST)
Received: from nugod-NUC15CRHU5.tail9f095a.ts.net ([218.237.104.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379508762a5sm29195595eec.0.2026.11.15.19.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:03:54 -0800 (PST)
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
Subject: [PATCH 1/4] ALSA: seq: ump: Don't turn a zero key pressure into a Note Off
Date: Mon, 16 Nov 2026 12:03:34 +0900
Message-ID: <20261116030338.422671-2-sammiee5311@gmail.com>
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

The conversion of legacy events to UMP MIDI 1.0 uses
note_ev_to_ump_midi1() for KEYPRESS events as well as for note events.
The function turns any event with zero velocity into a Note Off. So a
Polyphonic Key Pressure of 0 reaches a UMP MIDI 1.0 client as a Note Off
and ends the note.

Only a Note On with zero velocity means Note Off. To fix this, check the
status, too.
The conversion to MIDI 2.0 already sends a zero key pressure as it is.

Fixes: e9e02819a98a ("ALSA: seq: Automatic conversion of UMP events")
Cc: stable@vger.kernel.org
Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
---
 sound/core/seq/seq_ump_convert.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/core/seq/seq_ump_convert.c b/sound/core/seq/seq_ump_convert.c
index 62bdef6dca58..c248d87f7a83 100644
--- a/sound/core/seq/seq_ump_convert.c
+++ b/sound/core/seq/seq_ump_convert.c
@@ -630,7 +630,7 @@ static int note_ev_to_ump_midi1(const struct snd_seq_event *event,
 				union snd_ump_midi1_msg *data,
 				unsigned char status)
 {
-	if (!event->data.note.velocity)
+	if (status == UMP_MSG_STATUS_NOTE_ON && !event->data.note.velocity)
 		status = UMP_MSG_STATUS_NOTE_OFF;
 	data->note.status = status;
 	data->note.channel = event->data.note.channel & 0x0f;
-- 
2.43.0

