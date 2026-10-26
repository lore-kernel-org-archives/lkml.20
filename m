Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792978717;
	b=FhZSRozG2Zwy8Vh3uHLcEk9pZMSVD/nsCQS5I0LxLq4rH1y4w4XLnlmknV/k8Gmbj2Qo
	 De2hraQ/1510aX9nPdKfHxnh022PTO3O/LDQOKx4BB0/7aUSM4G1+jOCimPSnkNsFEQLc
	 iwmORGMKbgWgoc3QfDaQ7vJWnY+5t4CSlF4gY0DYfcCkzkKdwxuPLo93mACEnRADLUFRX
	 fIXtrfN0U/mVLHhteOo5uyKkMVYKJklmcpQseXoyS15pcWZ2mAUSEBSVdWEQD6Kr8q0yN
	 H7z2s0lG99uv6eHC65rg8c/npk6jFnM4j/8hAV+jA4aNb7TgysgeSwCJIoAm8deMWow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792978717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x2qb8Gv3TaN+iK7uUG15B8LwsjSdliOtFfwZ6kHYAiw=;
	b=gCS9u7cYOa7ItKric/+0bGNwtOXJtw0i2lSkxcWglYTAjgO9BNWb2Gwh+LW5muMsx3QK
	 ao3vy33vhzrmCA8ruJH6FmAljKWZc9BIYlUYqBslZeo97RdGwTG5m9CgXe8ezqqXWfclW
	 C+fkbxjLHoZqJouU7+M/G0hORqRtkKQtvPbUnhprYYa5sdZzAqnKnMDRwE+LOrGWNJLH9
	 20BBy0ER2Xwatt5aqB+oiy8RKysFg4w7jxQf96BPBVhYM1o88vr7H4UeFC5lfFhqnx5/k
	 +HvoHMmI7+xbqsWRKBCLQLW1iuimz1LqXP8l5nNslEVRwXXL+yWA85iV2jckuNRtWiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pkWh3yVl;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAB7606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 01:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAB7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pkWh3yVl
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e985106c0cso21182825ad.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792978717; x=1793583517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x2qb8Gv3TaN+iK7uUG15B8LwsjSdliOtFfwZ6kHYAiw=;
        b=pkWh3yVlSIg8kBOCK8qMWpKxm5KaW6c3xbpuw5l6ILeZZbVRq9JNMdQ9H6vp81/69L
         4Q0wztD5iYf9XoMsJ+8PF00untJcyqkx2HqCGpjxTR7baF5ke9qKUwf2jDaq9QBsb3zz
         rYsH6gbDc8MjLfFFfwo+RDEf1YZ+RF8XAKMi3kYrw1S5qv5UFUfGmJDmw9Jj5zWAGG3G
         bauIH0yhPcp00L8zT5l6VaEEA8QHXie23/RaKJpDEjt2oZJHKdPj2yREejMhowQypiSk
         4B0OGvBOje6jr3liQxry6vJPJb7xzFq8/THVMI0by2GFAinPQnO0bmS0izOTpP+CRnqn
         PvTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792978717; x=1793583517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x2qb8Gv3TaN+iK7uUG15B8LwsjSdliOtFfwZ6kHYAiw=;
        b=px+ElozXWyJwkvNHqoEz4ebyStW9ZA0JFE1EaC7rdQvixGD0Htb/1+icmpqOfMqFOY
         5tKpPr0HKmziq3n0Ema9HRRm9yoOeGOZSLrwSPUGhF405WJOL/mrXLCO2zEQBFn9SRJT
         u2CzuKBiX1hLyQXmdv2P86zbmV7Y7CK90mFkFp4Z3r0SdQNeJQ9nIG87so9HDcNZOl37
         JIdfuvZLoSlQqrMxq9JY1ugQVpX/qwSIU0clNCCyQcnKbemu62+ga0rdeWMump5ohhgC
         5IECLtEBTHYLudWqCMNoivQIYj524eG717+8LT7FRIb9lc2lNgMf4N8e5zMVmB5a6e1M
         lX1Q==
X-Forwarded-Encrypted: i=1; AKwUvBwINwkIgOBiDmWWTRAl3ECSWM3U7nk9bjcFbJb2lg2wgag7hdNdfnHnjFMB/WEkOWizAhLkIH1h8zGdA/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjlK+qNxL5fVSUS83/M/1DZEIDnP4eDkPPlYHIC6bMUtVz8fZX
	HV/XnFnbFKmC6z/rcVsSEWvSulGEy9Pa0Bwl6fgH4I8OMJQlZhcGnDJ12E4Qb3wFrJI=
X-Gm-Gg: AYBFou3YF9CGpzduECEefiUEhZ0fbQfB9BjQ0sgJ9orcOfyVmE+UwgEcGeApEVrNIQ7
	ceeP4i/ekyq2/jk5HqpxiTwvRjdIW2JaE+UpIILVp2sTPEbG5bzSN/qioLTHjBQUaOjp/FTojQO
	4bdNKBo7HRw2gXPaFS19ZJOR7mZj5HVW/whpjadgrcFqXx1Do8u2F0lMMtaUTwXFNFLOR3Kr5Rg
	d5QKI9ru+Ch9toly6SAShBMrBoBfDggSrg3FK+K0jBRgdX7DmjLBX/w58QGZp90wBauis3vNVFz
	Yvn8RktBL57UG/WMCdDNUw6OLo4MlZACXRO+VykNecOsKe9EMvbPCvRHAXTEAcan08cxplaohoz
	/oZljTCHNdT0wo3Ht8rGSDCnMKwNez9X49wT9e7KCvlRGWzcXmltekvwoQh+50LUR2euucK7YxU
	nPtsuc7aRGxGoglFdtK/sU8TeMx8g2dKPYGgJjqhP5b36ijVxGJxvVHnmMPCmVfC4kUerNNgAIh
	sIXojTQ6xbct07Jonszi6zPgv4P8i8jSrNh3u8fdw3Lt9Bc3/jKUZaY3/XWD/i6SE8vWHF+LY7C
	rFcSS9I=
X-Received: by 2002:a17:902:ffcf:b0:2dd:ad73:c93a with SMTP id d9443c01a7336-2ea9c68a7f2mr42720475ad.27.1792978716682;
        Sun, 25 Oct 2026 18:38:36 -0700 (PDT)
Received: from yogi.shaguar.org ([2601:600:8282:f152:c1c3:8958:100:6fc1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea9b1a1c56sm10567635ad.44.2026.10.25.18.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 18:38:36 -0700 (PDT)
From: Michael <jagerkin@gmail.com>
To: arunr@valvesoftware.com
Cc: tiwai@suse.de,
	tiwai@suse.com,
	perex@perex.cz,
	alexander.deucher@amd.com,
	arun@arunraghavan.net,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/core: Log stream DMA errors on interrupt
Date: Sun, 25 Oct 2026 18:38:35 -0700
Message-ID: <20261026013835.98210-1-jagerkin@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
References: <DKT5BQW7XPHP.2KNASR1XE11UD@valvesoftware.com>
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

On Wed Aug 19, 2026 at 11:53 AM PDT, Arun Raghavan wrote:
> On Wed Aug 5, 2026 at 11:30 PM PDT, Takashi Iwai wrote:
>> So what's the best option for users if this happens?
>> That is, what happens if we don't restart the stream?  Is it a
>> temporary fail-out and the hardware recovers / resync by itself while
>> streaming further?  If so and it's short, it might be better to leave
>> it as is.
>
> Unfortunately, there doesn't appear to be much users can do in this
> state. The warnings we have introduced should at least point to a cause,
> but the issues seem to be around GPU clocks and power management

A data point from Intel hardware, where there are no obvious issues
with playback quality.

7.3.0 logs this continuously as soon as PipeWire opens the analog
playback stream:

  snd_hda_intel 0000:00:1f.3: stream 7 dma error: 0x28

Per include/sound/hda_register.h, 0x28 is FIFO_READY | FIFO_ERR, the
same bits you reported.

The only open PCM is pcm0p (2ch, 48 kHz, period 1024, buffer 32768
frames), so I'm assuming that's stream 7.

Counting the callbacks suppressed, it's something like 7-8/second.

ThinkPad X1 Yoga 3rd gen:
* i7-8650U, Sunrise Point-LP HDA 8086:9d71 subsystem 17aa:2259
* Realtek ALC285
* snd_hda_intel
* no dGPU

If there's some data I can collect let me know.

-- Mike
