Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11CD3B71AD
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 20:49:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788900589; cv=pass; b=TGW8tolo1WzKIVia++5ICjjzGObr6ZA2e88ZK/ARdSeoQRCn8fEHhCV7KMs3NgbK+Jrh7ycm9G3MWBUSnSPiIJkenbrZPf8e7C6qyrHs5dMICnV9RNj179qwVP9CKlnbdw2/BSBBDm0JE+KG3VojJINgP1tA7m6/L7T8nl0wmkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788900589; c=relaxed/simple;
	bh=EVlaNLLv81/ctL5wrO5G7ci6os6GJavoAqGCYV2VlNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RVUD7WrIEKVjzVAxYW9gwbclCzyn7g5uGG5OSuO+Ecnc8LYyy1C/30eVLVuAk9+ifVJcfa1Yaaa95xi73NWMDtu/z2cZtH6iEPKpALBCtWLtR5bJoE3ZRUVtK9MSA3qSRqjCVTHA9k/WIVjGVB4RNgvwnJJ+w0Q7bJCCNeWeBm8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iNy+W5Eh; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iNy+W5Eh"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2caced6038eso46339375ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 13:49:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788900586; cv=none;
        d=google.com; s=arc-20260327;
        b=V3tqbLO2gHFQ4L5YcowGMk8LciU+Jy/pNhnTwQmc5cKLPnkhtAwLeVwJLf6MfFGX+f
         jzD4IaGFSp5dthdu2OAXKG82fHvYAP/DnDcQ7ZrMezwTffFX5SsP5duC0UP5qYCI7sWG
         DcdmttgJsvgQhxrEURD4grvtG/JOeERYkQZJdvOf2MUMLAUPKKQT59CJRidM4MudSij1
         y1Z/X6tVAYTB4vnnXIlmXcenkUH2QEetDqhB7jZi/t6UVfU8g1ilqL/qEmALlmCbMvBg
         EgONmp5TKdOE44c0ug3XDqfIxFeGD0CK+7L/wxw1yjzpQhb5JQROj+mQcUx5mva4Ld5v
         PPMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=37a7q/PfB7jenRX+a+NVB+F0WxScdqDkAs3yriyKj1Y=;
        fh=KQEv0MbfiGJ5wln+UPnXXvVRo3MgXOyjOC7x+bSZlVE=;
        b=KCefPz1GvbQUYomLBOajvbM4/Mu43oJujJ2msg1uiu6hhxNUnH05ZoFq7vt2QKIyig
         CkmRUQCqJzOKe83uW/m90yQ3n1TLAiFshnILe1qhKdFJ0079B8MKLM6Jpep6nK4ilK2q
         PjsNF0SftRrrHdndfZapPwX8FI2SSebumxDf2JpeaGkimrrKZOj1jJtZaaiGfRwZBnZW
         Nh8xQNlhWBsQnBM+YaDqMuuAbE4A5ENUE4WtywMS+YUna7eiEy+q8obqsOY71XgdkTCO
         mffNDnjFfWuKbufeT5FgENaR5D33hD17H5s7zGrEbkk08U84HV5QV+4Q+H5fg1zpUc/v
         SXow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788900586; x=1789505386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=37a7q/PfB7jenRX+a+NVB+F0WxScdqDkAs3yriyKj1Y=;
        b=iNy+W5Eh6knlS7Z1A716hnLbpNMC/DvtA2XD1mgyrOcldkeQQOuGMwfVhLS3h1pHzW
         YKiQU3dqR1Sw/UuIut4RJUf927V0rmvFor/DX3umBYl7Tt0BjJ/8HCG60YlauwZgRn9D
         WFy2xvAxEK1cMuPR/3B5bwGybgNs4G9+4H6tZLoLhHi1eBGmw5aadQYOaMxDHMqB+uEm
         ZjdtccTcgCk4DDRd723ak9Q2AUH8JU7/MGLgRU8vLxaXhVU6rPKvKg/dCmyHfrQU2TKO
         yo5SAXrThdmniO4hvsmWTVajaUqq9kunl9sRVmsdYAlEWLoQW7iiWMUCKH5c93UJvw5u
         2oqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788900586; x=1789505386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=37a7q/PfB7jenRX+a+NVB+F0WxScdqDkAs3yriyKj1Y=;
        b=gzOm2x3QeSRx49mik9XS8LaJBGs8GgwVNODbkVa/sH/VLImL+CaAd3ndXJX/IfvfOv
         Wod73WLWAQoa/XGyIgMhfnWTVnR4GGibmiXC1bbUAp2DzZJT+pexJaLxquMkQFQGvB40
         lzjYxYrD6H9H/0RcEkLvF2YXp6CihdG8RIFr0CTul3OaoH2ueiKWrmQCjWEJuHv/TcCe
         NQIG//lsYzdLopAQURf6OwUiac1P/hAC1Q7Q/hCdm607OC2ZF1r9qZiRbbsOEHU8nUux
         qeMwmbYVU/Q0IwAQiTZK5DeYSDdpow60OHvlE0qLlmYWg2cXEvGWiEkttgSVlr8rkpj/
         yjCw==
X-Forwarded-Encrypted: i=1; AKwUvByhvI5kMd/WQlPetjFi97hSS90+a66r2r5jyHqgczAK1ii1AZl+JXo8F5ykJGpooYUkL068E6H2+tuAXCE=@vger.kernel.org
X-Gm-Message-State: AFuF++mrVKymXyp2iBS6EheeaYiJiNqyyMJ7HQC42HT8hOx0/HA+swgm
	1KfK3t5t/gSLHvyNICQ3kbv6K7gOg5DNhxTx4HmLjGHBIBCmOOy4a/xz3XWiag0D9bpF5PZIqU4
	msT7vkfD+W8JzPqDMzEJFUlJ2L32UDm0=
X-Gm-Gg: AYBFou1/KpInO7wCAxOOwmHr4dT0bDfuORBnnjR1tFkC99keJIpHv+9Q0uhhrTLyf8m
	9lkIupM4Lbu6Jacb0PR2a4cjUqSqIdBeQ8hm/NnodLX+XNZK9hR0THCRxO+T2gpjFn4j76p8AfY
	cbcKv9hwQlSqBK9Y+kr9jXNVNmnPo7Udqz81nVxhZH1oDm8ahNyiJ6vc2AUlVeF638XkTCUEHj5
	yudxIDgpriC3meSDfevTAzyoLCXU+KhMGt+iXVXWBAbwrerb/8kK/ct37QR9G1cj3HfRCmHwXkb
	kMey56Hfe3y/i6ydTNTcOdQ/G1+bYQGBAvashlOX7rUrmul1nQX9PA==
X-Received: by 2002:a17:902:f707:b0:2cf:6e5d:23e9 with SMTP id
 d9443c01a7336-2dafb0b191cmr349738755ad.14.1788900585936; Tue, 08 Sep 2026
 13:49:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAAAbPi4w+YO=W8vFr63wy6++1WQ2mHUDVfUDKyWR8xcTWKXCKw@mail.gmail.com>
 <1fdd17c6-a0ab-42de-8362-8e1374d42fac@amd.com> <bc542e80-e572-452b-81ba-53e57ed3126e@amd.com>
 <30fed968a6f54a6c81eca4ee23ea4166@realtek.com>
In-Reply-To: <30fed968a6f54a6c81eca4ee23ea4166@realtek.com>
From: Cristian Timohi <cristiantimohi@gmail.com>
Date: Tue, 8 Sep 2026 23:49:33 +0300
X-Gm-Features: AcwNN1WUIP1ywDpgqNOpCPkqvPK7pXx-h1hVEKHoLB43vMtAVgt-9UhBN18djFg
Message-ID: <CAAAbPi4MekJAyNsCAi2Ww9QHVVrrGkW2cdDTrrpttZYmh7yZHw@mail.gmail.com>
Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA speakers
 silent and headphone jack buzzes on playback
To: Jack Yu <jack.yu@realtek.com>
Cc: Syed Saba Kareem <syed.sabakareem@amd.com>, "Mukunda,Vijendar" <vijendar.mukunda@amd.com>, 
	"Flove(HsinFu)" <flove@realtek.com>, 
	"venkataprasad.potturu@amd.com" <venkataprasad.potturu@amd.com>, 
	"linux-sound@vger.kernel.org" <linux-sound@vger.kernel.org>, Oder Chiou <oder_chiou@realtek.com>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, 
	"yung-chuan.liao@linux.intel.com" <yung-chuan.liao@linux.intel.com>, 
	"pierre-louis.bossart@linux.dev" <pierre-louis.bossart@linux.dev>, "broonie@kernel.org" <broonie@kernel.org>, 
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"Dommati, Sunil-kumar" <Sunil-kumar.Dommati@amd.com>, Fish690103 <fish690103@realtek.com>, 
	=?UTF-8?B?TWlrZSBMaW4gKOael+abieiDvSk=?= <mikelin@realtek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jack, Vijendar, all,

I tested both Realtek changes on the ASUS TUF Gaming A14 FA401EA (BIOS
FA401EA.304).

For reference, audio works correctly under the factory-installed
Windows 11 on this exact hardware: both the internal speakers and the
3.5 mm headphone output worked normally.

Test kernel:

current torvalds/linux master
HEAD before the test: 5acbae5f7
a20afec40ea1 cherry-picked
local kernel: 7.3.0-rc2-fa401ea-rt721+
Speaker fix: a20afec40ea1
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

I first tested only:

ASoC: rt721-sdca: Adjust latency control to fix no-sound issue
a20afec40ea1012659861e58374c1bcde2e18a43

Unfortunately, the internal speakers remain completely silent.

Direct ALSA playback on the SmartAmp PCM opens and runs normally:

speaker-test
-D hw=3Damdsoundwire,DEV=3D2
-c 2 -r 48000 -F S16_LE -t wav

There are no relevant RT721/SoundWire errors during playback, but
there is no physical speaker output.

So a20afec40ea1 alone does not fix the speaker issue on this FA401EA unit.

"Update preset for all functions" patch
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

I then applied Jack's:

0001-ASoC-rt721-sdca-Update-preset-for-all-functions.patch

The patch applies cleanly on top of the above kernel.

With the patch unmodified, however, both playback paths fail to open
with -ENODATA.

The RT721 remains attached:

sdw:0:1:025d:0721:01: Attached

but dmesg reports:

rt721-sdca sdw:0:1:025d:0721:01: Defer on undeferrable control: 5810100
rt721-sdca sdw:0:1:025d:0721:01: Defer on undeferrable control: 5810100
rt721-sdca sdw:0:1:025d:0721:01: ASoC error (-61): at
snd_soc_pcm_component_pm_runtime_get() on sdw:0:1:025d:0721:01
SDW1-PIN1-PLAYBACK-SmartAmp: ASoC error (-61): at __soc_pcm_open() on
SDW1-PIN1-PLAYBACK-SmartAmp

The same runtime PM error also occurs for the SimpleJack playback path.

I traced this to the new write in rt721_sdca_jack_preset():

regmap_write(rt721->mbq_regmap, 0x5810100, 0x8021);

Experimental 0x5810100 -> 0x5810000 test
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

As a local experiment only, I changed that single write from:

regmap_write(rt721->mbq_regmap, 0x5810100, 0x8021);

to:

regmap_write(rt721->mbq_regmap, 0x5810000, 0x8021);

This restores normal PCM opening. The -61 / "Defer on undeferrable
control: 5810100" messages disappear completely.

With this experimental change and the rest of the preset patch unchanged:

Internal speakers:

PCM opens and streams normally
still completely silent

3.5 mm headphones:

PCM opens and streams normally
no intelligible audio is produced
importantly, the previous buzzing noise is now gone

I also repeated the zero-PCM test:

timeout 10s bash -c '
dd if=3D/dev/zero bs=3D192000 2>/dev/null |
aplay -D hw=3Damdsoundwire,DEV=3D0
-t raw -f S16_LE -r 48000 -c 2
'

Previously this caused continuous buzzing while the playback path was activ=
e.

With the new preset patch plus the experimental 0x5810100 -> 0x5810000
change, the headphone output is completely silent during zero-PCM
playback: no buzz, but also no audio during normal playback.

Summary

a20afec40ea1 only:

speakers: silent
headphone behavior unchanged

a20afec40ea1 + preset patch as provided:

RT721 stays Attached
playback cannot open
0x5810100 causes -ENODATA / runtime PM failure

a20afec40ea1 + preset patch + experimental 0x5810100 -> 0x5810000:

PCM playback works again
speakers remain silent
headphones remain silent
previous headphone buzz is eliminated
no relevant RT721/SoundWire errors in dmesg

It therefore looks like the new preset does affect the analog
headphone state on this hardware, since it removes the buzzing, but
the codec still does not produce actual audio.

Please let me know if you would like me to test different register
values or provide register/debug dumps from this state.

Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=3D221958

Thanks,
Cristian

On Fri, Sep 4, 2026 at 9:01=E2=80=AFAM Jack Yu <jack.yu@realtek.com> wrote:
>
> Loop more
>
> Hi Mukunda,
>
> Regarding to speakers silent issue, a patch has been merged as below
>
> [1/1] ASoC: rt721-sdca: Adjust latency control to fix no-sound issue
>       https://git.kernel.org/broonie/sound/c/a20afec40ea1
>
> and for headphone buzzes issue on playback, could you merge the attached =
patch and check if buzzes issue can be fixed?
>
> Regards,
> Jack
>
> > -----Original Message-----
> > From: Syed Saba Kareem <syed.sabakareem@amd.com>
> > Sent: Thursday, September 3, 2026 4:41 PM
> > To: Mukunda,Vijendar <vijendar.mukunda@amd.com>; Cristian Timohi
> > <cristiantimohi@gmail.com>; Jack Yu <jack.yu@realtek.com>; Flove(HsinFu=
)
> > <flove@realtek.com>
> > Cc: venkataprasad.potturu@amd.com; linux-sound@vger.kernel.org; Oder
> > Chiou <oder_chiou@realtek.com>; vkoul@kernel.org;
> > yung-chuan.liao@linux.intel.com; pierre-louis.bossart@linux.dev;
> > broonie@kernel.org; lgirdwood@gmail.com; linux-kernel@vger.kernel.org;
> > Dommati, Sunil-kumar <Sunil-kumar.Dommati@amd.com>
> > Subject: Re: [BUG] ASoC/AMD ACP70/RT721: ASUS TUF Gaming A14 FA401EA
> > speakers silent and headphone jack buzzes on playback
> >
> >
> > External mail : This email originated from outside the organization. Do=
 not
> > reply, click links, or open attachments unless you recognize the sender=
 and
> > know the content is safe.
> >
> >
> >
> > On 9/3/26 11:11, Mukunda,Vijendar wrote:
> > >
> > >
> > > On 9/2/26 22:13, Cristian Timohi wrote:
> > >> [You don't often get email from cristiantimohi@gmail.com. Learn why
> > >> this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >>
> > >> ****
> > >> Resending as plain text, as the previous message was rejected by the
> > >> vger.kernel.org mailing list due to an HTML MIME part.
> > >> Apologies to recipients who received the previous copy directly.
> > >> ***
> > >>
> > >> Hello,
> > >>
> > >> I'm reporting an audio issue on an ASUS TUF Gaming A14 FA401EA (Ryze=
n
> > >> AI MAX+ 392) using AMD ACP70 SoundWire and a Realtek RT721 SDCA
> > >> codec.
> > >>
> > >> I have reproduced the issue on a clean current vanilla 7.3-rc1
> > >> kernel, so this does not appear to be Fedora-, PipeWire-, or
> > >> desktop-specific.
> > >>
> > >> Current clean test environment
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> Distribution:
> > >>      Fedora 45
> > >>
> > >> Kernel:
> > >>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
> > >>
> > >> snd_acp_sdw_legacy_mach quirk:
> > >>      -1
> > >>
> > >> There are no remaining custom snd_acp_sdw_legacy_mach/modprobe
> > >> overrides in the current reproduction environment.
> > >>
> > >> Hardware
> > >> =3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> Laptop:
> > >>      ASUS TUF Gaming A14 FA401EA
> > >>
> > >> DMI product:
> > >>      TUF Gaming A14 FA401EA
> > >>
> > >> DMI board:
> > >>      FA401EA
> > >>
> > >> BIOS:
> > >>      FA401EA.304
> > >>
> > >> CPU/APU:
> > >>      AMD Ryzen AI MAX+ 392
> > >>
> > >> Audio:
> > >>      AMD ACP70 SoundWire
> > >>      Realtek RT721 SDCA
> > >>
> > >> The SoundWire bus exposes one peripheral:
> > >>
> > >>      sdw:0:1:025d:0721:01: Attached
> > >>
> > >> I do not see TAS2783 devices enumerated on this unit.
> > >>
> > >> Known-good cases
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> The laptop's built-in speakers worked correctly under the
> > >> factory-installed Windows 11.
> > >>
> > >> USB audio also works correctly under Linux. I tested Corsair Virtuos=
o
> > >> USB headphones and normal audio playback works.
> > >>
> > >> Therefore the issue appears specific to the internal AMD ACP70 ->
> > >> SoundWire -> RT721 audio path.
> > >>
> > >> Actual behavior
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> Internal speakers:
> > >>      Completely silent.
> > >>
> > >> 3.5 mm headphone jack:
> > >>      No intelligible audio is produced.
> > >>      When the analog audio path becomes active, the headphones
> > produce
> > >>      a continuous buzzing noise. The buzz stops when the playback/pa=
th
> > >>      is deactivated.
> > >>
> > >> Opening the desktop sound control panel can also trigger the buzzing
> > >> while the analog audio path is active.
> > >>
> > >> ALSA playback devices
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> The amd-soundwire card exposes:
> > >>
> > >>      device 0:
> > >>      SDW1-PIN0-PLAYBACK-SimpleJack rt721-sdca-aif1-0
> > >>
> > >>      device 2:
> > >>      SDW1-PIN1-PLAYBACK-SmartAmp rt721-sdca-aif2-2
> > >>
> > >> Direct ALSA reproduction
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
> > >>
> > >> Internal speakers:
> > >>
> > >>      speaker-test -D hw:CARD=3Damdsoundwire,DEV=3D2 \
> > >>          -c 2 -r 48000 -F S16_LE -t wav
> > >>
> > >> The PCM stream starts normally without an ALSA error, but there is n=
o
> > >> physical speaker output.
> > >>
> > >> Analog headphones:
> > >>
> > >>      aplay -D plughw:CARD=3Damdsoundwire,DEV=3D0 \
> > >>          /usr/share/sounds/alsa/Front_Left.wav
> > >>
> > >> No speech is heard. The headphone output only buzzes while the audio
> > >> path is active.
> > >>
> > >> Zero-PCM test
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> I also sent only zero-valued PCM samples:
> > >>
> > >>      timeout 10s bash -c '
> > >>      dd if=3D/dev/zero bs=3D192000 2>/dev/null |
> > >>      aplay -D hw:CARD=3Damdsoundwire,DEV=3D0 \
> > >>            -t raw -f S16_LE -r 48000 -c 2
> > >>      '
> > >>
> > >> The headphone jack still buzzes while the zero-PCM stream is active.
> > >>
> > >> Therefore the buzz does not appear to represent corrupted applicatio=
n
> > >> audio; merely activating playback is sufficient to produce it.
> > >>
> > >> Mixer / UCM
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> Speaker:
> > >>
> > >>      Speaker Switch =3D on
> > >>      rt721 FU06 Playback Volume =3D 87,87
> > >>
> > >> Headphones:
> > >>
> > >>      Headphone Switch =3D on
> > >>      rt721 FU05 Playback Volume =3D 87,87
> > >>
> > >> I also explicitly enabled the corresponding Speaker and Headphones
> > >> UCM devices. This did not change the result.
> > >>
> > >> ASoC DAPM during speaker playback
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> I inspected debugfs while speaker-test on the SmartAmp PCM was
> > >> actively running.
> > >>
> > >> All relevant widgets were ON:
> > >>
> > >>      Speaker: On
> > >>      rt721 DP3 Speaker Playback: On
> > >>          stream DP3 Speaker Playback active
> > >>      rt721 DP3RX: On
> > >>      rt721 FU 21: On
> > >>      rt721 FU 23: On
> > >>      rt721 PDE 41: On
> > >>      rt721 SPK: On
> > >>
> > >> The DAPM graph therefore appears to activate the entire expected
> > >> speaker path:
> > >>
> > >>      DP3 Speaker Playback
> > >>        -> DP3RX
> > >>        -> FU 21 / FU 23
> > >>        -> SPK
> > >>        -> Speaker
> > >>
> > >> but the physical speakers remain silent.
> > >>
> > >> Kernel messages
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> RT721 attaches successfully.
> > >>
> > >> I see:
> > >>
> > >>      rt721-sdca sdw:0:1:025d:0721:01:
> > >>      Driver needs fixing: Unsorted reg_defaults, sorting the copy
> > >>
> > >> On an earlier 7.2.x boot I also observed:
> > >>
> > >>      soundwire sdw:0:1:025d:0721:01:
> > >>      PARITY error detected before INT mask is enabled
> > >>
> > >> I did not observe additional SoundWire/RT721 errors when starting or
> > >> stopping playback.
> > >>
> > >> Kernels tested
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> The same issue was reproduced on:
> > >>
> > >>      Fedora 44:
> > >>      7.2.2-300.fc44.x86_64
> > >>
> > >>      Fedora 45:
> > >>      7.2.2-300.fc45.x86_64
> > >>
> > >>      Vanilla mainline:
> > >>      7.3.0-0.rc1.260901.786262be.417.vanilla.fc45.x86_64
> > >>
> > >>      CachyOS kernel:
> > >>      7.2.2-cachyos1.fc45.x86_64
> > >>
> > >> The current reproduction is on the clean vanilla 7.3-rc1 kernel.
> > >>
> > >> Previous experiments
> > >> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> Before testing clean mainline, I also built a Fedora 7.2.2 kernel
> > >> locally and experimentally changed the RT721 speaker endpoint in:
> > >>
> > >>      sound/soc/amd/acp/amd-acp70-acpi-match.c
> > >>
> > >> from:
> > >>
> > >>      .aggregated =3D 0
> > >>      .group_id =3D 0
> > >>
> > >> to:
> > >>
> > >>      .aggregated =3D 1
> > >>      .group_id =3D 1
> > >>
> > >> This did not change the behavior.
> > >>
> > >> I also tested that custom kernel with:
> > >>
> > >>      options snd_acp_sdw_legacy_mach quirk=3D32768
> > >>
> > >> The kernel reported:
> > >>
> > >>      amd_sdw amd_sdw: Overriding quirk 0x1 =3D> 0x8000
> > >>
> > >> but there was still no speaker output.
> > >>
> > >> Those experimental overrides have been removed. The current vanilla
> > >> 7.3-rc1 reproduction uses quirk=3D-1 and no custom modprobe options.
> > >>
> > >> Question
> > >> =3D=3D=3D=3D=3D=3D=3D=3D
> > >>
> > >> Could this FA401EA variant require a different RT721-only topology,
> > >> ACP70 configuration, SoundWire setup, or codec initialization quirk?
> > >>
> > >> The fact that all-zero PCM causes the analog headphone output to buz=
z
> > >> while the stream is active may be particularly relevant.
> > >>
> > >> I'm happy to test patches or provide register/debug output.
> > >>
> > >> I can also provide full alsa-info, kernel journal, lspci output,
> > >> SoundWire sysfs state, mixer state, and DAPM debugfs output.
> > >
> > > Could you please log a Bugzilla ticket adding ACPI dump, dmi
> > > information and along with alsa info output?
> > ++RTK Team
> >
> > Similar kind of issue reported in another mail thread, realtek is worki=
ng on it.
> >
> > @jack could you please comment on it.
> >
> > >>
> > >> Thank you.
> > >> Cristian
> > >
