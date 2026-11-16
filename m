Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794797657;
	b=Y4pTY73MeMEj9UL6MRJ+8d1R6Lia9+bJXhFzYXRhCkGOhzVMH7ahxONWVooxM6HgtkkD
	 Z2xIZJAAHltOTSTSBSMUwRw2Bm5DnMh/D1ywpCQDLEdkTshZYqQa0czrX9Tqgdigp9PzB
	 oi9evK/WfbtN3S6V2XSJYFOiFHQuwkq1XHQXstvlGpPJEtrA0bKQ0IanG25nAQ07aeYYd
	 AhLFjP3JcAZA52OjPtW+ziEdJrCu4tpB3nA8CqD5DPBC1kUg/vM+TiI9mqRYv5LX8eLzU
	 eBTCqtWaJgBMyGSjJfnLNfn693kChDXJ7FwIg1pzoIDqEeJDzdXphzR22BPezbj6Uxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794797657;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=M2flRQKo2+TtLZp+hFRjcx5hzz90PxG00ajsTx7UBfc=;
	b=P+QsAtd3BTYVZ98VuUD1eQgxDE3YAYCmo3cJC1qBr1NBR3YWhlYo6irI8lVrdJlpHibL
	 fo5aQakD3C6BqagK4oMZ0z1sxHatxZdKfXAIvn929awHg4wThxYKnxNzo3JAM0ActQiw8
	 JErf0WR4GuAVPIPkyd771/t3M4TUVl8YRLEk9RISur4QqOtAqXzT6ED4k7ZUuGxFz4utH
	 G7Y7Ca702dfKQGHIU+YMzwCRJKcu+OjWN/4jqI5qZwD45sBsr7WOElSDlvyjhLmUYz7uL
	 YZTDsHgdrWVKrZGtktv8OIPCBNYrPwXYwf0sE3S9l7pYJiRsWrm3j/sAxUoJuiELSLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="c/Vko28w";
	arc=none smtp.remote-ip=209.85.210.41
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8F606A321
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED8F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c/Vko28w
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-85c1135c286so2955441a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794797656; x=1795402456; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2flRQKo2+TtLZp+hFRjcx5hzz90PxG00ajsTx7UBfc=;
        b=c/Vko28wUycMXkL74hc1w6BAu6WuqjximbmxUPr+oRHuaGhh8QAOA7olC+X11cUBGQ
         UxmYxlQJYPAAlKsDhMIAPrVlHfjIHivWF2V63wlAix6p31SjbJfo0njLo6ZonO2fkUSG
         iQbXh7E51z8zOmJGoW5AHi60/GZKCrpnx2Uwj98i/FOmz5N3cVHoUlKzMnXsW5f+FkAW
         5qbG7XT60kM913d2HNcxujKUvECcHGIBZJNdarkJ8F4LmApmD1zihBWxP86cmolwyVI3
         kcJuugFhs8XcFcwdgbWrFp/D2ZjQqFJT5FGqXOvUR48DbrVPynxdMFNu/3kH2JjPnXSa
         FmNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794797656; x=1795402456;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=M2flRQKo2+TtLZp+hFRjcx5hzz90PxG00ajsTx7UBfc=;
        b=OiwgGzziZT11YT8w0Qz23FwKC3SIqsAIovcIXr/jvIuE1Vc6EfuRLxWnJV8oGmSdKx
         Gc9RhjazUrvkUx/uFbYnQbK/fPERPT5OJo3KL5A3Zk0IgnFc0901K1hW5DysO8WZ0f6h
         31RuTqh9klYjbnP4x9904d7LA0VIbQf9a0NvfBJRc7zp2jTHbinApV7PxfuKW8Qarg8G
         P86OLthHbmM1VNwYfd7511ZhR9s2QYcjYmEDg32if3ZBtYgTXdrppO4Gbpk872u2FI2U
         WTx4L2AF8IL86iZboudail3SM44ScK2REjjbwoYRWsebGqJ/9gzAiJpbSPurGmEyXE6w
         2Fog==
X-Forwarded-Encrypted: i=1; AL+hErF7tYeMTzRp5Z30RvzG2fmdUMqbkjyJoDvY2vzp8462QceR0SfeJ6qsrSfcA8wpQZAomHkOdu8AYpEUbuc=@vger.kernel.org
X-Gm-Message-State: APuU4Z89BiRdZ+3UVxNTGbb129T/lais4wrb8K0VNhhugeuG0Y47jePp
	Owe4o4aQDETJNcpL1v+Fb4GTvn7tdIyPSube0yFDR9mqfLMdxvThItQd
X-Gm-Gg: AYBFou3UdOW/q1WA/hHpdSuKnDzM6efalFKx62Yaharp7vzbJiyL90kifD7xVnqqCAt
	l7IpeMY092KLO5LEWL7WsHUHCe22QGl3Kz0NpZdsLya5spAeQ6uNb9sZWzAWehycCmQC62l59og
	O3HebUW9D4bI2W0QQQhZYJmlZx5LIHuUVXaNoM5RN8TV5i++qBOj94VggdMv4zP1zjPzyVkzYor
	QEG+aza3VrFBggeBTxccLx/ClVcHiV2TrnGFKJiI1cFXRmQoGCVJfd+aNI6P2WSB94MzGFRHh6y
	Y9PQK6c5bZe5HkCVtHS16rlnk0VE+zFYeWCyTlIYP78N+SruGrQ7Da+FDNB8ysczroGrRhtpJbV
	xYD1nTPqaCiyxXdDmXY9/zHV7pXCpjEbyMWwYdHjxbso8IFOcYl9eDfw0WfwADqCNBihBrj10sT
	G8UUhDcILBcMOP6PWW7dcAx9/CZ0QBE8CySdmy3S/CZcrDgbZV11UFlnOvces16HrwnMaHrKhxS
	bXFxSCbM6M49Ia9tcEhcBL5AYDuYgjc/Tjbd6lQ9o5DTvVWRop4PLu1+N8O7h51xzYUxmtD6AHD
	yYoNPK9gj756OTEaJELxZT/yw0gDOtHr7xPsD0wB3Yvwhg==
X-Received: by 2002:a05:6830:442a:b0:862:bb04:b554 with SMTP id 46e09a7af769-862bb04b5c1mr2685668a34.14.1794797656295;
        Sun, 15 Nov 2026 18:54:16 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-86287f0e257sm9339432a34.1.2026.11.15.18.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 18:54:14 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: Re: [RFC V4 PATCH 00/19] Re: ALSA: mixer_audient: Cache rework and simplifications
Date: Sun, 15 Nov 2026 20:53:36 -0600
Message-ID: <20261116025336.3718463-1-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261115214336.17917-1-arc@gmx.li>
References: <20261115214336.17917-1-arc@gmx.li>
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

Hi Christian,

Thank you for V4. Your plan works for me. I would like to take patch
19 with one functional change, and I have a question on patch 18.

I squashed patch 17 into patches 12, 13, 15 and 16 (patch 12 got the
inline changes). With the diff below, each patch builds with W=1
without warnings. checkpatch --strict reports no new errors or
warnings, and the diff adds no new checks. On the iD14, with the diff
on a 7.2.15 kernel, our read and write checks pass, and every enum
item reads back as written.

> Please double-check the new patch 10 to make sure I didn't miss
> anything

It looks right to me. The cache bit and the cache_val[] index are both
the channel number of the request, and the probe sends no GET. I found
only the bound check in the list below.

> There is also a subtle behavioural change when initializing
> write-only cache values.

On the iD14 this changes nothing. Its write-only booleans have init
equal to min, and its write-only enums already read as init. On the
hardware, all of them read their init value after the load.

Patch 19
--------

I like it. One thing: the FU 12 type has INIT_HW and CACHE, but not
GET_BROKEN. On the iD14, GET CUR on FU 12 does not return the FU 12
value. It returns a reply buffer that the device shares with other
units.

If the probe write of a Cue channel fails, that channel has no cache
entry, so the next get or put sends this GET and caches the reply.
The control can then show a value that is not the value of that
channel. A later put whose device value matches that reply sends no
SET for the channel: for example, a stale 0 dB shows as 127, and a put
of 127 sends nothing. A stale value below -127 dB can also show as a
negative control value.

So FU 12 looks to me like a write-only control with an init value.
With GET_BROKEN, an unknown channel reads as init (mute), and every
put sends all four channels, as the comment above ID14_FU12_* says.

I checked this with a test build that skips the probe write of Cue L.
With V4, the first access after the load sent one GET for Cue L. The
reply was 0x8000, matching the value just written to Cue R, so Cue L
showed 0. Puts of the shown values then sent no SET, also not for Cue
L, which the driver had never written. With the diff, the driver sent
no GET, Cue L showed 0, and each put sent all four channels.

Does that match how you read the flags?

> We could even get rid of the FU12 specific value type if the iD14
> accepts -127 * 256 as a volume setting

The device accepts a SET of -127 dB without a stall, but I tested
that only on Main L, which the firmware ignores. On Cue, -126 dB and
mute (0x8000) both measure at the same small residual level that the
headphone output keeps. I have not tested a SET of -127 dB on Cue.
The type also has to stay for now, because it holds Main at 0 dB. So
I would keep value 0 as mute in this series. Could we do the plain
integer together with your don't-touch channel mask as a follow-up?

Patch 18
--------

The old gets read only the channels below hwchannels and filled in the
rest. The new get reads every channel and then ignores the value of
the channels at or above hwchannels, so an error on such a channel
fails the whole get. I think this affects only the EVO4 "Mic Playback
Switch" (4 channels, 2 on the device): it now also sends GET for CN 2
and 3. Does the EVO4 answer those? Either way, the diff skips the
transfer for those channels and keeps the values they show now.

Small things, also in the diff:

- raw_get_one() and raw_set_one() accept cidx == MAX_CHANNELS, but
  cache_val[] has MAX_CHANNELS entries. No table reaches it (the
  highest channel is 55), so ">=" is only a guard.
- Two comments from patch 10 still say FORCE_SET.
- Patch 19 removes extra_init but keeps its comment.

Next steps
----------

After patch 19, nothing of patch 16's own FU 12 code is left. So I
would drop patch 16 and send one FU 12 patch after patch 18: the
control as patch 16 describes it, built on the unified get and put
with your code from patch 19. Would you like to be its author, with a
Co-developed-by for me, or the other way round?

A note on trailers: V4 dropped "Assisted-by: Claude:claude-opus-5-5"
from patches 8, 11 and 12 to 16. I put it back on them, and I added it
to patch 10, because patch 10 now holds code from my cache patch.

May I fold the diff into your patches 10, 18 and 19 for the final
series? I would send it as a normal series, not as another RFC.
Should it wait for Takashi's answer on your four mixer_evo fixes, or
carry them at the front?

Thanks,
Will

-- >8 --
From: Will Porter <mrwillporter@gmail.com>
Subject: [RFC PATCH] ALSA: mixer_audient: Fix FU 12 reads and the get loop

Proposed changes to patches 10, 18 and 19 of RFC V4:

- Patch 19: mark the iD14 FU 12 type GET_BROKEN. GET CUR on FU 12
  returns a reply buffer that the device shares with other units, so
  the driver must not read a channel that has no cache entry. A
  stale value can also convert to a negative control value: 0x8001
  shows as -1.
- Patch 18: send no GET for a channel at or above hwchannels. The
  type-specific gets did not read these channels either. Also correct
  the comment on -ENODATA: an unknown value now reads as init, not as
  off.
- Patch 10: reject cidx == MAX_CHANNELS (cache_val[] has MAX_CHANNELS
  entries), and say GET_BROKEN in two comments that still say
  FORCE_SET.
- Patch 19: remove the comment left from extra_init.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
Applies on top of RFC V4 patch 19.

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e24a6e9facc1d..93fad4b74e18d 100644
--- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -408,6 +408,7 @@ static const struct snd_audient_ctrl_type {
 		.type = SNDRV_AUDIENT_CTL_ELEM_TYPE_ID14_FU12,
 		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED
 			 | SND_AUDIENT_CTYPE_FLAGS_INIT_HW
+			 | SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN
 			 | SND_AUDIENT_CTYPE_FLAGS_CACHE,
 		.len = 2,
 		.min.integer = -127 * 256,
@@ -540,7 +541,6 @@ static const struct audient_devinfo {
 	const struct snd_audient_ctrl *controls;
 	const char *const *const matrix_names;
 	const unsigned int matrix_channels;
-	/* optional: controls the tables cannot describe, created after them */
 } audient_devinfo[] = {
 	{
 		.usb_id = USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
@@ -649,7 +649,7 @@ static int snd_audient_raw_get_one(struct usb_mixer_elem_info *const elem,
 	__le32 buf = 0;
 	s32 val;
 
-	if (cidx > MAX_CHANNELS)
+	if (cidx >= MAX_CHANNELS)
 		return -EINVAL;
 
 	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_CACHE) {
@@ -659,8 +659,8 @@ static int snd_audient_raw_get_one(struct usb_mixer_elem_info *const elem,
 			return ctype->len;
 		} else if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN) {
 			/*
-			 * Cached FORCE_SET controls are treated as write-only:
-			 * an invalid cache entry does not trigger a GET.
+			 * GET_BROKEN controls are write-only: an invalid
+			 * cache entry does not trigger a GET.
 			 */
 			return -ENODATA;
 		}
@@ -692,14 +692,14 @@ static int snd_audient_raw_set_one(struct usb_mixer_elem_info *const elem,
 	int ret;
 	u32 val;
 
-	if (cidx > MAX_CHANNELS)
+	if (cidx >= MAX_CHANNELS)
 		return -EINVAL;
 
 	if (force) {
 		val = !value;		/* just make it different */
 	} else {
 		ret = snd_audient_raw_get_one(elem, ctype, cidx, &val);
-		if (ret == -ENODATA)	/* FORCE_SET and not cached yet */
+		if (ret == -ENODATA)	/* GET_BROKEN and not cached yet */
 			val = !value;	/* just make it different */
 		else if (ret < 0)
 			return ret;
@@ -825,14 +825,18 @@ static int snd_ctl_audient_get(struct snd_kcontrol *kctl,
 	guard(mutex)(&mixer->lock);
 
 	for (i = 0; i < nchan; i++) {
-		u32 buf;
+		u32 buf = 0;
 		long ret;
 
-		ret = snd_audient_raw_get_one(elem, ctype, base + i, &buf);
-		if (ret == -ENODATA)	/* unknown write-only value: off */
-			buf = ctype->init;
-		else if (ret < 0)
-			return ret;
+		/* channels the device does not have are not read */
+		if (i < hwchan) {
+			ret = snd_audient_raw_get_one(elem, ctype, base + i,
+						      &buf);
+			if (ret == -ENODATA)	/* unknown write-only value */
+				buf = ctype->init;
+			else if (ret < 0)
+				return ret;
+		}
 
 		switch (ctype->type) {
 		case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
