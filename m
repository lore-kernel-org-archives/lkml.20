Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793301278;
	b=GMHQEn3SGC9XyzA6BNm8sG6Dcj8O5v6FH/nEr6zoQsqNf5KGvvv3RyazjRsUgB+ZiMhS
	 DQ1Cme3vx6Spq7y1yd/hX915Sla/5hYNZ8DibI7a5DYvwpJfdA/UUgMEYglcV4U/ALQYZ
	 UPVomTFdZevhjUUXqKCz0m09+L6i9aSuFec+KYinD1Q8ZpSgePoMGI2M/dMdZ9fvUfqWh
	 W183Q8t4cpWg0SdiS7duz1/SkcFKxbkqtgP1TsER/V3sRt5+jnapgeQp7OyPx7IlYP1IC
	 +JGsOI3GcQtYySilNw9S2gxXicp9l8K7bh17GMhsGOKaTLXCfkNoHqdqLC4lc9JIhZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793301278;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=u/1WhdoOF4T1NyAzW6xrSMr/6SbdBWjcS+rn2iyl6ME=;
	b=EV5811lNdyEG4EOMiG1HuheoEKzM8q8Zl+5QTId5CO1EpYJ9ZGpoz/GNo1XiKpV2tl53
	 FX0yjtmlQSlhOiKPBGiOGUY+AiOnqvPEAgE2mTfRa0HJisVPcmhG8VK5xYa+JEXau3jtP
	 QjS+Y+9jluGhbFM79q6hYFX2mUiWtBS8V0Lz0aZ0bvtwNXRklRGcdgVLoRH12DiDCXDxE
	 saRRqJAIE5zJdBDqHUM4J8uS+PUpumuWggghmQW0uqB6QkrFdsTuKCBmJs4wAUS4VZsn2
	 kJT6CqaK79rrdjBcdGAu6n1N/f5cshp+PPCBeEA6QHqUkdGmmkiYJZv5Gr+BRTI7gcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iFQv9YPT;
	arc=none smtp.remote-ip=209.85.210.227
Received: from mail-pf1-f227.google.com (mail-pf1-f227.google.com [209.85.210.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777E0606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:14:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 777E0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=iFQv9YPT
Received: by mail-pf1-f227.google.com with SMTP id d2e1a72fcca58-8a06210b29fso1311120b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:14:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793301278; x=1793906078;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u/1WhdoOF4T1NyAzW6xrSMr/6SbdBWjcS+rn2iyl6ME=;
        b=UwVBovVqShIxfotnO64cRYsH/y/OOb2qI1Nspc7yRnNynjR/hpEQk1wTQYLlLD0VZO
         xOoa3QplCS5RagS/9avjkzLRSgs+rdNO63XZyY3QogZk9RRR6exkZipUU5EO0LSWfKj8
         NpVMQQfXGNkO/25pMpsNhiWJ8MziGtErxsOYeriegMXvwletc1Rok9akzCuA0KLqao+c
         rb9Fez30fP1qV7E+f0ew2zPcaAfoRm2aSp6LdHuY7FK3WC9r3S9XC8wJyLl5vF8Nh0ht
         Xblemgrq//R5t4AOmm+jiWnqkDUWmJsJOe++WzD23mDI7P0oLjOSru/+o4XNxes/yx9J
         nvKg==
X-Forwarded-Encrypted: i=1; AKwUvByRlxVokLkoblJBiZCLqux1bT+jdbIgEHHGOAApLc1VPHHja/P60mSGdcS13FmGH9futFSIPBZzXCVI3nI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJHnRQK3/WxvjoXkfe7S8+Jh8BZW5nEEY+mb2G2/VDgpxtm6rCN
	nUI3UG+7B0vtDAKOPZx3qQq3aLsGJVLZndFQDwAXRWtuI8/xHKb8WNzdTOgN7wqJftN1GYasdSr
	ETpCFVlRgRjPEFi06rYYT0qS8VNuU8oJOz0aNbDm3MuUU41nTGeaGvwOxGT5DH+0tOxbHNYyWQJ
	jJKrJczJNGZDEAOVA15sKhM6cWGpYVthSNwxykjWGj3BUB7yt9iiebTf2kNSySMbr2gs4/TBUsZ
	9U9O6wPy43ED39q
X-Gm-Gg: AYBFou2hDZmpkfXOfrHdmcHmLo7DjUDtOUBJNUIQnfHvMFjPGdSBZu9GN2fSrLs2MdY
	ffZ330/fRlhhKMd0KYaVlfksBqMTzSWGZflsH61xYFaEVasF4m9KGAgpUrVM+8YkeBpOCu+57W5
	7e1Zu6lxAm0UaWmky7z+KU0t1sbnnzYbgzE/F4Kl63pUFouT/t7Ls8XvDqxHfqu52hf6pT5A/rM
	MqY62FGN1iX+H6ui0jotgXXWvFDnbAMUR4PfuToohkRb6h6A7uws7y2fah0la70IkFXHopY2pOO
	4V7dkIh2DLQBkslj3Bq6LqCCsBwrowdtNyA7E0R5FxEOEEi7hkh02qWJefui2y36wS3voIH1H8e
	K1WbqjUJAF7wPTQWCQZUe+hQL7Rt0++Z3fo3Iv3HbouY5drj2hAZE5cheyRf/qYiSaDmNZzGROZ
	HB8U3VCLZljOi/JCzuG2xOUNVO4L2fdcWB
X-Received: by 2002:a05:6a00:1395:b0:8a0:72e8:732e with SMTP id d2e1a72fcca58-8a9bf23d194mr51528b3a.29.1793301277539;
        Thu, 29 Oct 2026 12:14:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8a98ed13f0asm22805b3a.4.2026.10.29.12.14.37
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 12:14:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so7450346c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793301276; x=1793906076; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u/1WhdoOF4T1NyAzW6xrSMr/6SbdBWjcS+rn2iyl6ME=;
        b=iFQv9YPT7ryClDeZ62NCaxXHkJ2pwnlm+6zT5gHO+9OOwAUNNA9oAHrku/0rpBZbIw
         ZkHRBDNch46Y9m2x6z+EsEWIUOS9CyMwOvaNMNGGb9aHmxFBAqh83sSef0ijxkDkB+lW
         CWbKQqizWQxiMj3SW/HvLSHd3B07OCsYK7sEc=
X-Forwarded-Encrypted: i=1; AKwUvByO0VVjD/kvAwPxAF8yKbW6SfaIWpYhYDb6EhdajCWXdpE0r7ZSCOAbOXhdaK1nyS34RRI8/xCz4AGgaNo=@vger.kernel.org
X-Received: by 2002:a05:701b:4354:b0:1a3:116:848a with SMTP id a92af1059eb24-1a6ce9ba674mr8067573c88.35.1793301275568;
        Thu, 29 Oct 2026 12:14:35 -0700 (PDT)
X-Received: by 2002:a05:701b:4354:b0:1a3:116:848a with SMTP id
 a92af1059eb24-1a6ce9ba674mr8067540c88.35.1793301274903; Thu, 29 Oct 2026
 12:14:34 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027144051.249211-1-ulf.hansson@oss.qualcomm.com>
 <CAKekbet7B=EvD+3Q9PFJAOJZvpz_hCn_dU__e+3=qhsFet=FVQ@mail.gmail.com> <CAPx+jO_HUTrMnzNw-Ev0FWfJdgUQ1nU16knY=qC6oCTQh-=Yfw@mail.gmail.com>
In-Reply-To: <CAPx+jO_HUTrMnzNw-Ev0FWfJdgUQ1nU16knY=qC6oCTQh-=Yfw@mail.gmail.com>
From: Kamal Dasu <kamal.dasu@broadcom.com>
Date: Thu, 29 Oct 2026 15:13:57 -0400
X-Gm-Features: AclHuK9KmFGSEYdcQYi60LLFgu6cmmYMhKDxgl6b4RtrUPZj2dNUesCRjY_xeEQ
Message-ID: <CAKekbes0y4uXUsnF3r40ZMj9_bN4q34ci8LNQhaJCDsFQmo8YA@mail.gmail.com>
Subject: Re: [PATCH v10 0/6] mmc: core: Keep the card powered across suspend
 when firmware needs it live
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: linux-mmc@vger.kernel.org, Ulf Hansson <ulfh@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	linux-kernel@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000089d3fe065eff7d4e"

--00000000000089d3fe065eff7d4e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 5:35=E2=80=AFAM Ulf Hansson
<ulf.hansson@oss.qualcomm.com> wrote:
>
> On Tue, Oct 27, 2026 at 8:53=E2=80=AFPM Kamal Dasu <kamal.dasu@broadcom.c=
om> wrote:
> >
> > On Tue, Oct 27, 2026 at 10:41=E2=80=AFAM Ulf Hansson
> > <ulf.hansson@oss.qualcomm.com> wrote:
> > >
> > > Background: on brcmstb boards with a Kioxia 016G01 eMMC, firmware acc=
esses the
> > > card directly during resume from Suspend-to-DRAM, before the kernel's=
 own
> > > resume path runs, in order to load boot code using hard wired logic t=
hat is not
> > > field updatable. The card needs to stay powered and responsive for th=
at access
> > > to succeed, and since it is never power-cycled, it also needs to be r=
eset
> > > before the kernel reuses it after resume.
> > >
> > > Changes in v10:
> > >         - To help out with the implementation I offered my help to tr=
y to move
> > >         this forward.
> > >         - The DT patches are good to go so I included them from the p=
revious
> > >         versions.
> > >         - Patch 3 to 6 are new, but based on the work done by Kamal D=
asu.
> > >         - This is completely untested from my side, please help to te=
st it.
> > >
> > > Kind regards
> > > Ulf Hansson
> > >
> > >
> > > Kamal Dasu (2):
> > >   dt-bindings: mmc: Extend keep-power-in-suspend beyond SDIO
> > >   dt-bindings: mmc: Add reset-card-at-resume property
> > >
> > > Ulf Hansson (4):
> > >   mmc: core: Add option to keep an eMMC powered on at system suspend
> > >   mmc: core: Split sdio_set_host_pm_flags()
> > >   mmc: core: Move reset functions for eMMC
> > >   mmc: core: Add support for resetting an eMMC at system resume
> > >
> > >  .../bindings/mmc/mmc-controller-common.yaml   | 10 +-
> > >  drivers/mmc/core/core.c                       |  9 ++
> > >  drivers/mmc/core/core.h                       |  1 +
> > >  drivers/mmc/core/host.c                       | 10 ++
> > >  drivers/mmc/core/mmc.c                        | 95 ++++++++++++-----=
--
> > >  drivers/mmc/core/sdio_io.c                    |  7 +-
> > >  include/linux/mmc/host.h                      |  1 +
> > >  7 files changed, 92 insertions(+), 41 deletions(-)
> > >
> > > --
> > > 2.43.0
> > >
> >
> > Hi Ulf,
> >
> > Test results for this series on a Broadcom STB board with the Kioxia
> > 016G01 eMMC,
> > which reproduces the problem during S3 suspend/resume with two DT varia=
bles:
> >
> >   keep-power-in-suspend  reset-card-at-resume  Result
> >                             no                     no
> >   enters suspend, board resets
> >
> >       at resume
> >                             yes                    no
> >   enters suspend, board resets
> >
> >        at resume
> >                             no                     yes
> >   suspend aborts, -EINVAL
> >                             yes                    yes
> >   s3 suspend/resume works
> >
> > Changes applied to Kernel: v7.3 + 7.4 merge window (linus/master
> > d135ab453a74) with this
> > series, plus the one-line fix I'm sending in reply to patch 6/6
> > (details in my reply to that patch):
> > mmc_resume() calls _mmc_hw_reset() without claiming the host, which
> > triggers WARN_ON(!host->claimed) for every command sent during the
> > reset. Claiming the host around the reset removes the warnings..
> >
> > The -EINVAL in the third row comes from mmc_host_class_prepare(), since
> > MMC_PM_KEEP_POWER is not in pm_caps without keep-power-in-suspend.
>
> Yes, that was actually intentional as we can't allow the system to
> suspend in this configuration, as we may not wake up correctly, right?
>
> Although, perhaps we should also log a warning earlier during the
> probe of the host, when we are parsing the DT properties for it. To
> upfront say something isn't correct.
>
> >
> > In the working case I also checked the md5sum of the first 5 MiB of
> > /dev/mmcblk1 before and after suspend, and it is unchanged.
> >
> > With the fix applied:
> > Tested-by: Kamal Dasu <kamal.dasu@broadcom.com>
>
> Thanks and thanks for the fix on top!
>

Hi Uffe,

While testing I noticed an error message printed on every resume when
both properties are set:

  mmc1: cache flush error -110

It comes from the _mmc_flush_cache() call at the start of
_mmc_hw_reset(). That call was added by Adrian in 437db4c6e798 ("mmc:
mmc: Attempt to flush cache before reset") because a reset may
invalidate the cache, and it is now also reached from mmc_resume()
through patch 6. At that point the card has just been accessed by
firmware, so the flush times out. Resume and data are fine, it is only
the message.

The cache has already been flushed in _mmc_suspend() before the card is
kept powered, and the queues are quiesced by then, so the flush at
resume looks redundant. But I don't want to drop a safeguard without
knowing whether it was meant to cover this path. Do you think it is
fine to skip the flush when resetting at system resume?

I tried that, by moving the flush from _mmc_hw_reset() into the
->hw_reset() bus op and calling _mmc_hw_reset() directly from
mmc_resume(). That removes the message. I tested it on the same board,
booted from the eMMC.

Would you like this as a patch in the series, or should I leave it as
it is?

Regards
Kamal


> >
> > Regards
> >
> > Kamal
>
> I will send a new version shortly to address the comments and needed fixe=
s.
>
> Kind regards
> Uffe

--00000000000089d3fe065eff7d4e
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
H0K0rs+X8O45xZIUJlxzf5UZex3BLi1f/H+08rSQULWEtO/ECwkFod2DIzSX7fZdz5RQ1PpziEOp
goo/JZPYIeCmgt3rIyvMuupj8Ymb0J/velhpXfQuYUM52viw2nmqVcxCwBqyM3Iq7eI4xtEOFRmR
wxSizd3MSQMf6GCHA4/B/6ttnxhGAr3utaOU+x/RnzG0gPLTW1XRAQ0+GVc/tGFdI864OG1cyrRl
GvBnHJQSAFOIKwYrUk2oFpgMbafQ6osCAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
a2FtYWwuZGFzdUBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFOV9h+N/T9ZsJ40qRxh7NYYD+N6MMA0GCSqG
SIb3DQEBCwUAA4ICAQAKtKh30wv1/30230mCimgUjMWQE/LImRmyfDgrp2IhBVS6mDun+wH8thEB
WhBHQMz3gsGixU4ZBJG72eWi39IzQ7CGnisJwA0+hsGaGg03AVtFtqo1rXYRZ81MEDOb6BPYLigJ
RsHbNmrUGR+LsGeUwOWUeRXqBrYaYFrkgHKvVK1NEewv+vUY08n4tsezO3jq0HKhVDY46bMbf8vL
oQqqhtcQvu2+5FK2jpUayeubpzPwobjEG61RIhBvM0KivY4CB2s9A7qgjL1XBycAybIvG03BbFoT
t282FqXwk9JU6YihLlt+hpzO9UF7E8GZYlQlVIZOLOvytqilhua+2h77Yy8Jz/FJyIXKuaLPtvb2
SC2shL7jF28kQbP3QUKwAig+cxwbpngnUkd9D9cXSHVq9PPwYm0A4eAO0YQ/80Uq20+gXF++g0sy
NKrrV3i0T1dbCd86miGDKvarGzjh7pdsdwNY15liGP6Orib1tnWkJcbtP1rJty4r/mbbxcK8ILO4
IvTGFG6BfjJ+La0aRt69i1fQmjUWHLwzkLNpw9cJH8/MONZcEJeDkq9WELSyy29bagStk5KHu7NO
TH65sZg+i/4qmj3DEeEGTr/Shzp4YWSNn4W7NEelr0VgDlwa7xqlwZjXxG4MIJqy0SsQlAwEXtqd
nH2FpJfzgAetkuyU6DGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDEca
ZUGCu6d0oT1M+zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgBQNaMvBApD+xhFRG
oHr0dwOAFYgALmqbyxu36+7VDRYwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMDI5MTkxNDM2WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAybbj8JYbGYiXFI8y4QA8ahZSPEy84c/t8hybe9snZ4zi42bQhPVd
NBVd5m18Azb1VSTF/NDrBAZgkfCcGR0k+sU5NYqVpVbnRiACZa80c6GFNRsCLr7/Kn101o3Jyfv/
ScM8nAPUUFk7iVNdWpjTtvwlfye2SFY0m09bM08XsWyCJCorQehEFoQj0OMovpL7uMvhzT+g6RWQ
6hwDMDcXI1meMa0z8294xtfjJeAGh9Gh7Qmb8qrh00Nz7kxE/dwCH6C5rVcdaxUQPAfJWmPDtF2B
SG4PhFPJBVj7a2UJQj3R+2E4XnUrmz8ojXCpU/af1YRC7ZYGxjDScNeYfwKRRw==
--00000000000089d3fe065eff7d4e--
