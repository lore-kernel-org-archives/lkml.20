Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C413CBE6D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791580793; cv=pass; b=Npvdrh/4FGbQB9EdwvyKfWnL570C+AQwv+3ypWbWVz82KTTnx2dWNqdm01YzAOhWvQrgm44lTRiS/Cv1g5B2DJzdwcT0caLPeKCoLwm8wd4TDkuhUduznHgpqKMWCTQlYtAMK6wKtmBCBU/W0giPe8wcuK9JohROGCgusDliAWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791580793; c=relaxed/simple;
	bh=HP4oKljIm8A1tbLIw9FD1AKYGFAbknP741VMRtCB644=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=VM1sYOouHIfnXEcP5J8a6UqIZsPPMqmm5bk4aXsQuRoZtGYcB/VyWDxYImkbh5jFXudC2CAW/zAfn8ju5Ninsh6bbLyoWV6sPWYQJztXBfPOJ/9DzM9p8fSEUvJScpGhM9m4znUrgHe1ZgkmDU1bUfgfljiBR8LB5/SorazawWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RB+7RQ8S; arc=pass smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RB+7RQ8S"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-917a707f37eso3128396d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:19:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791580791; cv=none;
        d=google.com; s=arc-20260327;
        b=PfXJaIrJzJc5zPMKVfv9fGebA2t20Pfkyu8+I3QG62Zp4Plfd0zQL9Nd0Hqi7TN+lu
         CiitMueK20IKfCC0+0tQVtH2WfqGP1SjomaT0svlKOitGNOpJ7kBhYCbU3hyTax1UisT
         VXdwCtCMf2Kq80LMH5tpLj/w/pehbDOBpXeaFry0cxxtSr98cSK+3LepRa9WbxgIWv42
         s3v8jYl3seu+YGPX22XcrNSNi36XLrrZeBfg5PBfeN+9P7ytUec9QTRMiuPlz4Iy/H5v
         jyoDDAQ6AIx/k2n5R0rSmuSOeY81nWYQZqJvMTECLg8wOGHnr2UOQ8XVXXrIDx5eaUiz
         mq0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=8PfLCZv26J4obnNs3881wTOhGsGYZus4yuq9PNPKkTg=;
        fh=FqPDMz31RIVaJ7HJv0uLRqFMJJl5gmwZ5y+/7EwlbT0=;
        b=e26ZDd6vHWhzUz3cDeC84AaTKwxlspS7Z3xg19R03E2bv8ilysArhn1ER1BcBBlkFy
         om2tFvnL7vBnRoJ5qPdjfWEhnXMmTUNAeOoChJ1l/EGRFeiL1h58V8zM9ucM+0KKxY6K
         WPL3iTmXOVALCQbGVDVZDcI/Go5zrnBAEC9/7F9u5e/CzaIT6SRLf2aPNsIq42axeZqY
         q5UyLzyJjBNKhD+f2h6jrMe7YTYtCzCQM017aL4jMjpS2MLhM2trTKkX6BQWU13yDqA7
         aZpU6U0K8DzBBt4ke9ZCikBIqOAWzphBZpRoCBT0AIjpwUL5Fil7BTgE+kBEy/SD7SWY
         m8ng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791580791; x=1792185591; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8PfLCZv26J4obnNs3881wTOhGsGYZus4yuq9PNPKkTg=;
        b=RB+7RQ8SoJlOdv66T2nc7n3glPTu0gCameYFoCjHrrl4gJIuIa1i/XE2KUSYl+GDkg
         iRzgIVAAzg5rfSuk4oa6sjjj9K5QZWQw2pw14NmJKYMlA8vqO1VYD/Y0U903Zfbmaghq
         yGHlDcY1Y68Po7rEg9qUDZ/aWBeyn87Ci0uipyJqal8dkbYRbFwkF+lP66ECEevkLZ7E
         Ij1+BscAGbaH7hZN545Yo+ZChNzCb8Nu5cO9qD1QywTYe0IED7Hcuuk8iDNOajeBAyTm
         fPjIb/YdsSryXnXS99vr+t+aI9aiBFq8yGuJI2jnr+XXMVtPMDzAOv6VRlpVyiRmSoRx
         aRqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791580791; x=1792185591;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8PfLCZv26J4obnNs3881wTOhGsGYZus4yuq9PNPKkTg=;
        b=F4e2tS7az2qPN+oryZ/jukCXteNABHn7aZM4lRBFbZRFaSaGgZRGQ4iHT44WKh+Zif
         ZThy19sGlf3sfi9UMoJhQ1C3LoF0QldO3Rynv7nb0JmufbYJUD339EZ/eSqvxi19YcrV
         oTwe3Wzjf/Rc84woK5CmqbMtjiW6ILJrsmKzclNAIQW3c38bqo5Kg7Kgi+OJcjHEsStt
         +9AjYlaYN9Y317BDgzAFARxqWSAB4+tgRxEp8EJPpujbpn+21+KhBgzXxkXbVGQScd7i
         +JA55CgvWuaPnY3N4AOewmi7/XDdLGEKa5ERrgwfIybn7erBgnASWawEwNiC+Js0zMNy
         ehOw==
X-Forwarded-Encrypted: i=1; AKwUvBzxrCXBmylNXo2mNNtOICkxLNGwJSXWkTJfkdZa5RYN2YI4xCwXGEz+N183v5PX2Hwm9f99q58IU31UH0M=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOT6H9den5Xv8CFt2ExuMQgg4sAxI97h+d2M/BdCezUh80BBPF
	4y4Jl3+1PmUKM7tXr+xHYqYwnWaDkCqjdWbb/1QiS6+eqD9HEyExNz03OgxuHQxayAeJ9KhtxP5
	7FUFlB9PlvwBbf6QLc3iFWJsXnVEBv9qReRlE5zc=
X-Gm-Gg: AYBFou0Q4raWdb/jWW6Y7jU51LLRMIF5e13b8lUaLZCvs4qvSuyzyvHXvesbatY1bns
	8i60zCPhlNgOE9j2vYHQkiSDZ7OflOR/SgQo+biYUMj+aKVXpLXJzRbZKXVA7Wf5XzLuGDUn0Np
	Rdz5I3bv6LnzUaQ7qjiFUin6Il45LKkgxPgBRQRCs57GPi/vdcqkyMiHCGmUH6WrZKA6RS2F1r5
	zNCX6cBmCW7wQKYQSRDu0PxQPZGLTvzl0RKbPc7zgK48vBAhwgqgLMjMaYc2vruULq57z8a1K16
	/sq5dZQYSm4edUF1yVti9ROHj4bxqlc/f+o8xSN7CU+Sy+/e40P82hjr4g==
X-Received: by 2002:a05:6214:328d:b0:91b:5d3b:4abd with SMTP id
 6a1803df08f44-91b5d3b4da4mr43259836d6.50.1791580790626; Fri, 09 Oct 2026
 14:19:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Alex James <igotmysoul@gmail.com>
Date: Fri, 9 Oct 2026 23:19:39 +0200
X-Gm-Features: AclHuK9x4w1zNOPCZuvfOG5Pk6eXxx-M5Iw5o-lzQdKvMsi3uw9SttYodrL7eAE
Message-ID: <CA+YQcmcUKi98dKYRWjg8MR6hQoxoOEvXAuSDLgUUVK-L=ge7JA@mail.gmail.com>
Subject: [PATCH] ALSA: hda/realtek: Fix internal mic capture on ASUS ROG Flow
 Z13 GZ302EA
To: alsa-devel@alsa-project.org
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The ASUS ROG Flow Z13 GZ302EA (Realtek ALC294, SSID 1043:1fb3) exposes
two fixed internal mic pins, 0x12 (0x90a60140) and 0x13 (0x90a60130), as
capture sources "Internal Mic" and "Internal Mic 1". The input mux
defaults to 0x12, but on this model 0x12 is defective: its right channel
rails to -32768 and the left channel carries heavy noise, so out of the
box the internal microphone records loud noise/hum.
Pin 0x13 captures clean audio on both channels (at lower level). The
mic array is not reachable through the AMD ACP70/PDM path either: forcing
it on via ACPI _WOV=1 creates the dmic-codec device but all samples rail
at -32768, so HDA is the only usable capture path.
The existing quirk for this SSID only initializes the two CS35L41 I2C
smart amps (speakers). Disable the broken 0x12 pin via pincfg so that
0x13 becomes the sole "Internal Mic" capture source, and keep the CS35L41
initialization by chaining it in a new fixup.
Measured on a GZ302EA (arecord, 48 kHz S16LE, identical gain):
  pin 0x12: L 47% clipped samples, R 15% clipped (railed noise)
  pin 0x13: <0.3% clipped, hum components below -65 dBFS
The fix was validated on the target hardware without building a kernel
by applying the same pincfg override (0x12 -> 0x40000000) through a
boot-time HDA patch firmware (snd-hda-intel patch=). With the override
the codec parser drops pin 0x12 entirely: the card comes up with a single
"Internal Mic" (0x13), the Capture Source mux control disappears (single
input is hardwired), and capture is clean and stable across boot,
suspend/resume, and PipeWire/WirePlumber route re-applies. Note that a
runtime hda-verb override alone is not sufficient because the bus driver
builds its pin cache at codec registration.
Also observed on this SSID while testing: repeated
"ALC294: Invalid fixup type 2016568172" messages in dmesg during probe
with the current quirk; likely unrelated but worth a look.
Link: https://github.com/CachyOS/linux-cachyos/issues/880
Tested-by: aic0d3r <funforfreeapps@gmail.com>
Signed-off-by: aic0d3r <funforfreeapps@gmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c
b/sound/hda/codecs/realtek/alc269.c
index be54825..20b5c82 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -4219,6 +4219,8 @@ enum {
  ALC294_FIXUP_ASUS_ALLY,
  ALC294_FIXUP_ASUS_ALLY_PINS,
  ALC294_FIXUP_ASUS_ALLY_VERBS,
+ ALC294_FIXUP_ASUS_GZ302EA,
+ ALC294_FIXUP_ASUS_GZ302EA_PINS,
  ALC294_FIXUP_ASUS_HPE,
  ALC294_FIXUP_ASUS_COEF_1B,
  ALC294_FIXUP_ASUS_GX502_HP,
@@ -5889,6 +5891,19 @@ static const struct hda_fixup alc269_fixups[] = {
  .chained = true,
  .chain_id = ALC285_FIXUP_THINKPAD_X1_GEN7
  },
+ [ALC294_FIXUP_ASUS_GZ302EA] = {
+ .type = HDA_FIXUP_FUNC,
+ .v.func = cs35l41_fixup_i2c_two,
+ .chained = true,
+ .chain_id = ALC294_FIXUP_ASUS_GZ302EA_PINS
+ },
+ [ALC294_FIXUP_ASUS_GZ302EA_PINS] = {
+ .type = HDA_FIXUP_PINS,
+ .v.pins = (const struct hda_pintbl[]) {
+ { 0x12, 0x40000000 },
+ { }
+ },
+ },
  [ALC294_FIXUP_ASUS_HPE] = {
  .type = HDA_FIXUP_VERBS,
  .v.verbs = (const struct hda_verb[]) {
@@ -7937,7 +7952,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
  SND_PCI_QUIRK(0x1043, 0x1f62, "ASUS UX7602ZM", ALC245_FIXUP_CS35L41_SPI_2),
  SND_PCI_QUIRK(0x1043, 0x1f63, "ASUS P5405CSA", ALC245_FIXUP_CS35L41_SPI_2),
  SND_PCI_QUIRK(0x1043, 0x1f92, "ASUS ROG Flow X16", ALC289_FIXUP_ASUS_GA401),
- SND_PCI_QUIRK(0x1043, 0x1fb3, "ASUS ROG Flow Z13 GZ302EA",
ALC287_FIXUP_CS35L41_I2C_2),
+ SND_PCI_QUIRK(0x1043, 0x1fb3, "ASUS ROG Flow Z13 GZ302EA",
ALC294_FIXUP_ASUS_GZ302EA),
  SND_PCI_QUIRK(0x1043, 0x3011, "ASUS B5605CVA", ALC245_FIXUP_CS35L41_SPI_2),
  SND_PCI_QUIRK(0x1043, 0x3030, "ASUS ZN270IE", ALC256_FIXUP_ASUS_AIO_GPIO2),
  SND_PCI_QUIRK(0x1043, 0x3061, "ASUS B3405CCA",
ALC294_FIXUP_ASUS_CS35L41_SPI_2),
