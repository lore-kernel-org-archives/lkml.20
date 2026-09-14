Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 558F13451CF
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411953; cv=pass; b=NjIYeoJ3J09Yo7ib5IbGa2OdHxecRNE5FghD5VN+Da2YbpadayfrjdRbNJcICIh+uNBimINSqH9xD4KR8CYAxoSzpLYNES6ELzdGIzEco55FfLqfuO6HXK2ji2M6t3Tcj/APPPzOs8PiUpR+ZOPFKvEemj1/vJAu1dYUlG/mzYM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411953; c=relaxed/simple;
	bh=MzrlE7z+VTvhDvBCSRdTgaBxbFr074860A6PJOduIfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9+xHhphJtrCtBmYLNR2UTLTwvfx3MUBCDui7KyHd1b8+HNGGUXyr0MS3X2g7CZTWJ085pOrnLivJ9SuQDCxf7Anl30AKAyA+bwU7wSRPoM6YBIyPJHj9kMsKNV9G1PN68POg0DA8EhPpzN1p0V+ESLX2eQD8CK6ax91Z2e5EkI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QbkM70sp; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QbkM70sp"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1731142a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:52:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789411951; cv=none;
        d=google.com; s=arc-20260327;
        b=eb1YlazNNfXAr2SKVz7j0/HBTwW5cIiNfNk8Zu8s2RrVyZPIeoqL3mKpgTXsUUHQPg
         M9LhdRT+5NhwI42yJRbTJjSUASF5nYvUZjOiJdbHVD7XO2hlto246SrMFKSgSaBpmyaB
         M5lwQ4obhTgDHw4fdNgXdoLAtkGsQCvL9B6nmamSK2Zl5lbNB5EDG/hJvZskUARUW599
         uH8/LqDQuTqmgaM11VsYESzBAT/iYwCQnGL6myDlbaVQUolSLrIXhnPwxvPbGkitVnr6
         KQ0sSqMJGVDzG4/X6V6dWgfg84fQh73sva9tlYBGbZJtRyvPZDBaGiphD46jVN+sT+Nc
         L5sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+XWSHTY/9qkZ8/Fw4YT2g5oPsxXjpjZO0/95164Ca2E=;
        fh=VVMjILeJbf9mMdX0pVIEoq28QkOkKqB9ao8dnE44Cs0=;
        b=llMZgIaIteLa2bxIIUkuBSBzZIbckGgqdt60cLwg1Hf8SGBiOUQJ/eKTAZPYzygdBr
         bJCTod8PvH+MglbNV3+VKjCJUaUZNEQaDyBYyLYqrzKkxCyaZFCnXcspPQZ7Ba16nE/5
         AMXUEfhPicKhEMhtH20fBRwt7BnJ8h0k2Pf1uyxSWtM+Xg2hHbe74HuiS/aKbTQ1pMAX
         w1gTdAzB2kDMY3Vph+RkVnDLt/J3AiErmoHUDkeYcGKwAR8NlW5+PC8m19vFu3Pmg5St
         eySedXWEXuXVK2k1EDlU4KRvFUAMBdHPAUKCCSTUp9gjBG8byg6mkQwVyehj7t0o4uwO
         wP2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789411951; x=1790016751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+XWSHTY/9qkZ8/Fw4YT2g5oPsxXjpjZO0/95164Ca2E=;
        b=QbkM70sp9CIZG2yTRRAHpqAcGlZ6alCgDJOkUUtzu4N4EvYIY26h5VLCoZk/deeR2P
         Pp2myBkz7w1ENDbuzMIc4z+EnpzJoPBvmOKiEgrU7tDTuJaTVpFlY5xMsZ2dgk0kw47i
         4dSg8QMI2AaJidXwWdx7qMaUNiU9/fIbtDjHJr2w1BB9WhrbzgZlDEduhR5k9QSVjCGS
         k9K9tY84wdFlZM05n/Rfu+QqX+ZrBCPzv6SXi2xyny+w3oDFcQgUDimRSn3i+T+Ti4eK
         SHDJgMqpNl88z6r8Y3CnQe/cETL/DA8h1dZLXQ5YS7ciQPGPVr+K0n+4+V0g5Xm8/CIg
         OdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411951; x=1790016751;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+XWSHTY/9qkZ8/Fw4YT2g5oPsxXjpjZO0/95164Ca2E=;
        b=BhU83mM6gE0+Mco9ruvvPelMA6TfhhFl+BAAbPOU2gBNKkXnbom5Pc9ZdBwhlOUPUY
         +JaRy749AfxM1ZJIJrxfmd/O0L90LOB5lkusIZvjR4TzSEjOERJp8TWP5OITsDm5cDak
         2VelxogUJ5XPoPqjefBuCsYZFRS4tF6TZWPkcUqgDPd2pnRTEe21Ln8QMbarFH1D3/sb
         HdOWATqtajsntozbYao2vdFIHdZiJuNt4XVpEalUgxjvnqQnscfsHPLqYciqVSixK5rZ
         3jBtxvaLYD8PFtojkLuJ+i2TgQOtO9mMFaI3p29lc/IzYC/6C7Ki42MiUU5JA/I/3iNf
         myXg==
X-Forwarded-Encrypted: i=1; AKwUvBy7hI8egAL2WUjaWYhoXMSNpHSlufHpJnD7p7/wKCW2nFbWdc/lBzVwnWLd3L0F/L9gGlC8Htlnj/7o5eE=@vger.kernel.org
X-Gm-Message-State: AFuF++ktoJDXDbR6j1X5DO+FWcTjbv84rPNwfzQfljWIapj26KAZESSm
	ToKlGMPsfHl8LlI4UCPEJ7YELntGdpTZ2xh8ACktUZRZdiRh7dRej0rgEGzavxal6xcnJR7dVjL
	/p5kcv1Drf1pJTxHnFPKH4ofxVmxlcfQ=
X-Gm-Gg: AYBFou2xjUGLWDW8AZvCMaxOgZ3T9va4BNPyD/L50eTxXXfZbxk4+7zfy6KTzN2SkcG
	5clJX96c0PDYq/wcvgYB8B0BV6JWgLjbPKJfC/UmsScy1vT6m1C0YG+QdeV+h9xGiypUEh0wchK
	EVzNj6f9RTY/YF77w2Q1UawO95kWHEf8rs4W1ooIKrJA44P2iXDpGl1Hw1UUM6i5CletKSFtzQz
	0F8N7JnNJnD+JwY0D7pf50anpWLMgQQRaYRk0GV37r5cEMYa9Xgbcam3TSM84lNknCJjpqELTOb
	+Y6r03CqCEF772LkACuuqFqzJV9s62GoOJ3GXIgUuTVWHzcEOT8ymA==
X-Received: by 2002:a05:6a21:998a:b0:3cd:7ba2:e669 with SMTP id
 adf61e73a8af0-3db403efc88mr8907716637.10.1789411950273; Mon, 14 Sep 2026
 11:52:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
 <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com> <bc542e80-e572-452b-81ba-53e57ed3126e@amd.com>
 <30fed968a6f54a6c81eca4ee23ea4166@realtek.com> <CAAAbPi4MekJAyNsCAi2Ww9QHVVrrGkW2cdDTrrpttZYmh7yZHw@mail.gmail.com>
 <3fa3de8f2bf24041ba9c029e0984abfb@realtek.com> <TY4PR01MB144329FF6B2B48FED9486F12E98BD2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <99e1afd842c4466ea562c83bb736fa74@realtek.com> <TY4PR01MB14432C55B885DB8231CA07C6298BB2@TY4PR01MB14432.jpnprd01.prod.outlook.com>
 <aqg5OYBZ5eYqd-QX@sirena.org.uk>
In-Reply-To: <aqg5OYBZ5eYqd-QX@sirena.org.uk>
From: Cristian Timohi <cristiantimohi@gmail.com>
Date: Mon, 14 Sep 2026 21:52:18 +0300
X-Gm-Features: AcwNN1VcEOu9A4leuG94q1iHn3TbbbOC5A5d6JfxPgMm33LiumATR7UdqSoZlP8
Message-ID: <CAAAbPi5fkpV3V1Ju+RYFOHWqNO+KjwoRVXnDgamNL5DVG0rbzA@mail.gmail.com>
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Mark Brown <broonie@kernel.org>
Cc: Shengyu Qu <wiagn233@outlook.com>, Jack Yu <jack.yu@realtek.com>, 
	Syed Saba Kareem <syed.sabakareem@amd.com>, "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, 
	"Flove(HsinFu)" <flove@realtek.com>, 
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, 
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>, 
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Fish690103 <fish690103@realtek.com>, 
	=?UTF-8?B?TWlrZSBMaW4gKOael+abieiDvSk=?= <mikelin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark, Jack, Shengyu, all,

I performed the test Jack requested for NID 0x5f / index 0x30 on my
affected ASUS TUF Gaming A14 FA401EA.

I am including all details below because there were a few important
observations during the test.

One note before the technical details: I am not a Linux kernel/audio
developer, and this level of ASoC/SoundWire/RT721 debugging is beyond
my normal area of expertise. I am working through these tests with
ChatGPT helping me understand the driver code, build temporary
diagnostic modules, and perform the tests carefully.

I am trying to keep every experiment minimal, reversible, and verified
by readback where possible. I hope the results are still useful for
debugging the actual issue.

---

## SYSTEM

Laptop:
ASUS TUF Gaming A14 FA401EA

CPU/platform:
Ryzen AI MAX+ 392
AMD ACP 7.0

Codec:
Realtek RT721 SDCA

BIOS:
FA401EA.304

This machine is already running the latest firmware/BIOS currently
available for the FA401EA. Therefore, at least on this unit, the issue
is reproducible with the latest available ASUS firmware installed.

Running kernel:
7.3.0-rc2-fa401ea-rt721+

Kernel source tree HEAD:
1a3fdcb408 ASoC: rt721-sdca: Adjust latency control to fix no-sound issue

This includes the a20afec40ea1 fix.

The following patch was NOT present during this test:

ASoC: rt721-sdca: Update preset for all functions

Audio card:

amd-soundwire
ASUSTeKCOMPUTERINC.-TUFGamingA14FA401EA-1.0-FA401EA

SmartMic capture PCM:

card: amdsoundwire
device 4: SDW1-PIN5-CAPTURE-SmartMic
DAI: rt721-sdca-aif3-4

---

## DIAGNOSTIC MODULE

I built a temporary out-of-tree snd-soc-rt721-sdca module matching the
running kernel.

No DKMS installation was performed and no permanent module replacement was =
made.

The temporary module initially only did the following:

1. Added MBQ address 0x5f00030 to the readable and volatile register lists.

2. Added rt_sdca_index_read() calls inside:

   rt721_sdca_pde11_event()

   to read:

   NID:   0x5f
   index: 0x30

   at three points:

   * before requesting mic-path PS0
   * after requesting mic-path PS0
   * before requesting PS3

The existing PDE2A power-state request itself was left unchanged.

---

## BASELINE READ-ONLY TEST

Before capture I enabled:

rt721 FU1E Capture Switch =3D on,on,on,on

Capture command:

arecord -D hw:amdsoundwire,4
-f S16_LE
-r 48000
-c 2
-d 3
/tmp/rt721-mic-test.wav

The register values were:

RT721TEST mic 5f:30 before PS0: 0xffb7
RT721TEST mic 5f:30 after PS0:  0xffb7
RT721TEST mic 5f:30 before PS3: 0xffb7

Therefore, on my affected FA401EA:

0x5f:0x30 =3D 0xffb7

and requesting PDE2A PS0 does NOT change it.

I then analyzed the raw PCM samples.

Capture:

144000 frames
48000 Hz
stereo
S16_LE
3 seconds

Channel 0:

min=3D0
max=3D0
RMS=3D0.00
nonzero samples=3D0/144000
nonzero percentage=3D0.00%
distinct sample values=3D1

Channel 1:

min=3D0
max=3D0
RMS=3D0.00
nonzero samples=3D0/144000
nonzero percentage=3D0.00%
distinct sample values=3D1

So the SmartMic capture is exact digital zero on both channels.

---

## 0xFFB7 VS 0xFFF7

Jack mentioned that the default value according to the RT721 specification =
for:

NID 0x5f
index 0x30

is:

0xfff7

My hardware returns:

0xffb7

Difference:

0xfff7
0xffb7
------

0x0040

So BIT(6) is the only difference between the value observed on my unit
and 0xfff7.

---

## FIRST ATTEMPT TO FORCE BIT(6)

I then modified the temporary module to set only BIT(6) using:

rt_sdca_index_update_bits(..., BIT(6), BIT(6))

rather than overwriting the entire register.

This should change:

0xffb7 -> 0xfff7

In the first attempt I performed this before requesting PS0.

That attempt failed safely:

RT721TEST mic 5f:30 before PS0: read failed: -16
RT721TEST force BIT6 failed: -16

-16 is EBUSY.

Since rt_sdca_index_update_bits() first reads the register and returns
immediately if the read fails, no register write occurred during this
first attempt.

After PS0 the register became readable and still contained:

0xffb7

There was also a runtime PM issue during this attempt:

runtime PM trying to activate child device sdw:0:1:025d:0721:01 but
parent (sdw-master-0-1) is not active

followed by:

Failed to resume device: -61
Slave 1 alert handling failed: -61

Because of this I did not consider the first attempt authoritative.

---

## FINAL CONTROLLED TEST

For the second attempt I moved the BIT(6) update until AFTER PDE2A had
been requested to PS0.

I also explicitly kept the complete relevant path runtime-active
during the experiment.

ACP PCI device:

/sys/bus/pci/devices/0000:64:00.5

SoundWire manager:

/sys/devices/pci0000:00/0000:00:08.1/0000:64:00.5/amd_sdw_manager.1

RT721 codec:

/sys/bus/soundwire/devices/sdw:0:1:025d:0721:01

For all three:

power/control =3D on
runtime_status =3D active

PipeWire, WirePlumber and alsa-state were stopped during the
experiment so nothing else held the ALSA devices.

RT721 status before capture:

Attached

The sequence inside rt721_sdca_pde11_event() was:

1. Read 0x5f:0x30
2. Request PDE2A PS0
3. Wait 10-20 ms
4. Read 0x5f:0x30 again
5. Set only BIT(6)
6. Read 0x5f:0x30 again to verify the write
7. Perform SmartMic capture
8. Read 0x5f:0x30 before PS3
9. Clear BIT(6) again
10. Read back the register to verify restoration
11. Request PS3

The resulting kernel log was:

RT721_BIT6_V2_BEGIN

RT721TEST mic 5f:30 before PS0: 0xffb7
RT721TEST mic 5f:30 after PS0: 0xffb7
RT721TEST mic 5f:30 after BIT6 set: 0xfff7
RT721TEST mic 5f:30 before PS3: 0xfff7
RT721TEST mic 5f:30 after BIT6 restore: 0xffb7

RT721_BIT6_V2_END

So the requested value was successfully written and verified by
hardware readback.

During the entire three-second capture:

0x5f:0x30 =3D 0xfff7

After capture, BIT(6) was cleared again and readback confirmed that
the original value was restored:

0x5f:0x30 =3D 0xffb7

---

## CAPTURE RESULT WITH 0x5F:0x30 =3D 0xFFF7

Capture command:

arecord -D hw:amdsoundwire,4
-f S16_LE
-r 48000
-c 2
-d 3
/tmp/rt721-mic-bit6-v2.wav

Capture:

144000 frames
48000 Hz
stereo
S16_LE

Channel 0:

min=3D0
max=3D0
RMS=3D0.00
nonzero samples=3D0/144000
nonzero percentage=3D0.00%
distinct sample values=3D1

Channel 1:

min=3D0
max=3D0
RMS=3D0.00
nonzero samples=3D0/144000
nonzero percentage=3D0.00%
distinct sample values=3D1

Therefore the microphone capture remained exact digital zero on both
channels even while 0x5f:0x30 was verified to be 0xfff7.

---

## SUMMARY

Firmware:

BIOS FA401EA.304
Latest currently available firmware for FA401EA
Issue still reproducible

Baseline:

0x5f:0x30 =3D 0xffb7
DMIC =3D exact digital zero

Normal PDE2A -> PS0:

0x5f:0x30 remains 0xffb7

Explicit BIT(6) set:

0x5f:0x30 becomes 0xfff7
hardware readback confirms 0xfff7

SmartMic capture while register is 0xfff7:

Channel 0 =3D exact digital zero
Channel 1 =3D exact digital zero

After capture:

BIT(6) cleared
0x5f:0x30 returns to 0xffb7

---

## CONCLUSION

On my affected FA401EA, explicitly setting NID 0x5f / index 0x30 to
the specification default value 0xfff7 is NOT sufficient to make the
microphones work.

The machine is already running BIOS FA401EA.304, which is the latest
firmware currently available for this model, and the issue is still
reproducible. Therefore there is no newer ASUS firmware currently
available for me to test against this behavior.

One interesting difference from the earlier reported register dump is
that my unit does not currently show 0x01c2 at 0x5f:0x30.

It shows:

0xffb7

both before and after the normal PDE2A PS0 request.

The only difference from the documented default value 0xfff7 is BIT(6).

However, setting BIT(6), verifying 0xfff7 by hardware readback, and
keeping that value for the entire capture still leaves both microphone
channels producing exact digital zeros.

This seems to suggest that some other part of the analog/vendor power
sequence is still required.

This could also explain why the community workaround which writes
several RT721 vendor analog power registers succeeds: that workaround
modifies considerably more than 0x5f:0x30, including codec-wide power
state at 0x5f:0x00 and other analog power registers.

I intentionally did NOT apply the complete vendor power sequence
during this test because I wanted to test Jack's 0x5f:0x30 question
independently and provide a clean result.

For reference, the internal speakers also remain completely silent on
this machine with a20afec40ea1 alone, as previously reported.

If you would like me to perform another targeted test, please specify
the exact register/value and at what state it should be read or
written, and I will try to reproduce it carefully.

Again, I am not experienced with Linux audio driver development and I
am relying on ChatGPT to help me understand the kernel code and
construct these diagnostic tests. I wanted to be transparent about
that.

Nevertheless, I have tried to keep the experiments minimal and
reversible and to verify register changes by hardware readback
wherever possible.

I hope these results help narrow down the issue.

Thanks,
Cristian


On Mon, Sep 14, 2026 at 9:13=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Mon, Sep 14, 2026 at 08:16:22PM +0800, Shengyu Qu wrote:
>
> > On my FA401EA this issue doesn't exist so I can't test. Maybe you can a=
sk at
> > bugzilla so other users with this issue could test?
>
> > PS: maybe this is the issue for some old batches of RT721 chip? My devi=
ce is
> > very new and this might be why I don't have this issue?
>
> Could some firmware update have done something that helps somehow?
