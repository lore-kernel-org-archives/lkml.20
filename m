Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BEC31194C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 01:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792372633; cv=none; b=dN/JZsSd/+8+5EczChHNh+YnCORE+AEc6eyfj/IXSEM/6W6ITEq1tHciCTAx1Vxah5tVAscqOLSWAHB7T7ft3s/8OYd9qg7TNC/lER9QUTpY5fO4CU/ytQsXUss/7WTWeEWmC3O8J+F9167+qqds9n4Lirzpp/KNRa0aOhpBwcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792372633; c=relaxed/simple;
	bh=lHZqNYYXwhP6kUYddjnLkScGt2Qj0fv+ATQPgasBkTM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Pe043yvdc6X6kR0LUVoofSYJG9kr0KrB2j59jcdPD79cMwilfo6ZscKIe4TsFoZRXAeR7B/SjsDGPtTyjiWaMBt5fGCblpV2e/8BJgXIGOf/Ki0jh5umQFxACeH7takiG331yfj3B62FgudPv1+Skcr0LP7W5ur7fPYuJRvMAjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuIFT9o2; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuIFT9o2"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-17bc533fda3so1714590c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 18:17:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792372629; x=1792977429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=GYcC1zpNIexSJ7Tb92Jn1IVQJ53RYnQjIQBtHmGKTjk=;
        b=MuIFT9o2xzQmtsPkAnK4pZuWyF13ir2Zz43lEYKp5iDRN2Ss+NknUBtFv87TNLMrmT
         0zdFUYxl1Ph6H29bnHzAy3q84wKGsc22nGNivfNIoLTfY7Orvnf8ugbNfNJT0cK8EDYG
         U2pg+kEAzyD8bI96KV2ZuwNP4Wtvy/awhajoCfuLnwzIYB9w4SpqwVTiIZc+n4v/5Ufb
         nARqyTNIwtqhuzW++qfpERVbWcKaVdAhz2P+6OT8RS2VWhveNVEL0ppkvJ+lHw8jdlQD
         fzGWIdKaXrXK+YENW8s4KobLpxmnzVUqPBjhatktUSfc349gFmgpoa+UjN0ORBdyW9dS
         7vew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792372629; x=1792977429;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GYcC1zpNIexSJ7Tb92Jn1IVQJ53RYnQjIQBtHmGKTjk=;
        b=RV3U9ScODtp0szxDiET0GGfhilosSC3iqa8UrBGi7RahQA6uhZVlRhZAyHqDu8Ledo
         vFv76hdDWat70iq7TR9lj0JEscztLX5/wHVkVIPFJoJKwxNRPSNyPZKICIrBw0F6bISv
         SF+pZupg9M2FHdNxcT+i7mjxlpYJJNdVSmmQ/VUpiS9dHeC9amjiEsNTB2ziTHwo+t3Q
         YmNTh7Q8WjmkgohBd3vM3mQaOFlY7HPHSPmX/v2ZpJIHGJNtT1kI3Q4W4cyvmZgJsWEJ
         ta7AhM3BKtU5xoBjTwgguLnjueGENEvz0StWZzevXJWxgbmhhF2Ka1A0QQmXzqqc84PM
         7lxA==
X-Forwarded-Encrypted: i=1; AKwUvBwFIvcrg0TfBT913iVIxQrpXoSGbKk+KwQ2Tt6mQw/srPMAQEahquV6nF3isRmcvRr9py7l5zevlxU4ecQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZaicDw4GjDo0rj0D7CBzgxph8GygV/RptNQ8NIkZlu+29d5he
	PgCalF5CxClv7p29PYhXt9hoT2qPy2UWgDn6CplAoyWkQ166DOrE1/hG
X-Gm-Gg: AYBFou2M8TyTzULtl1RznvfW/WgeAyBGDoOAqFbkBzQfZ3liBV5CFAxHR4uJG1v7mrf
	qXUVYOGZ5tLEFeTe358Dwqvo4vfQYO+7kf2u03KO1PlwdxjTSI7Zq5BiTjw/F2Hyn/k2rsNduHw
	bWpyNu9VDx3qxgrsA+FM1xNeFiQiEjdBa+Cxlj3X9WUHuGXvx5I2kzMiOkAOewoz8VH6PazX12d
	elj1MSaRjwTlX9R9Fa1nti4SnxEBo57WHOnH83D5JJU/V10vljrGFRq+3PDTd0ogVsI/KOB1wQF
	PM2U2ArVQ2PWuhW7Yf4mw97Dmx5LSC170Ehal0RbK5D89jaYEbtvCBpY4FKCymGXjlmYeW7YlUw
	Eva+CsdXROv4nzpkEKXXfHbqQHZ/lD7yMcSa5kWlkZBkK8pH998XGjVyi9Nqr7160yrl/KodPxC
	9GQeaCZRKqL9qvDub1h2PMAy7Xdvboa059HGF3NS5VuVlM5PZhigWiDfhyIN7CyO0npmb1ep5uB
	n9/D4IGene+4oSDG1ejaAfee61ZWEAP7f+taUUmkEPZqXqcF01oTZ3K0yrQqopxEniI
X-Received: by 2002:a05:7022:b043:20b0:189:d6bf:7ec7 with SMTP id a92af1059eb24-189d6bf8278mr2830707c88.19.1792372629290;
        Sun, 18 Oct 2026 18:17:09 -0700 (PDT)
Received: from ehlo.thunderbird.net (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c2e7bf4sm21803582c88.20.2026.10.18.18.17.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Oct 2026 18:17:09 -0700 (PDT)
Date: Sun, 18 Oct 2026 18:17:09 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Rong Zhang <i@rong.moe>, Ike Panhc <ikepanhc@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, Hans de Goede <hansg@kernel.org>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_0/2=5D_platform/x86=3A_ideapad-lap?=
 =?US-ASCII?Q?top=3A_Fix_unexpected_charge=5Ftypes_on_probe?=
User-Agent: Thunderbird for Android
In-Reply-To: <e7e6423eb2a358faa0d2a26fddd0f992e3d03448.camel@rong.moe>
References: <20261018-ideapad-fix-charge-types-v1-0-db52e3bb061a@rong.moe> <DB59F3C0-040F-4663-9750-C387963DCFE3@gmail.com> <e7e6423eb2a358faa0d2a26fddd0f992e3d03448.camel@rong.moe>
Message-ID: <C49666E5-E76A-42E9-8CEA-6195D066A02B@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On October 18, 2026 7:19:33 AM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>Hi Derek,
>
>Thanks for you information=2E
>
>On Sat, 2026-10-17 at 22:30 -0700, Derek J=2E Clark wrote:
>> On October 17, 2026 4:16:17 PM PDT, Rong Zhang <i@rong=2Emoe> wrote:
>> > It was reported [1] that some unfortunate combinations of BIOS and
>> > Lenovo utilities (e=2Eg=2E, Legion Go 2 + Legion Space) may enable Ra=
pid
>> > Charge and Conservation Mode at the same time, which is very out of
>> > sepc=2E
>> >=20
>> > If both are enabled during a previous Windows boot, ideapad-laptop wi=
ll
>> > see both bits set and correctly shout "unexpected charge_types"=2E
>> >=20
>> > A planned BIOS update will address this=2E Before that, if unexpected
>> > charge_types are encountered on probe, enforce [Long_Life] to prevent
>> > the device from operating in an out-of-spec state=2E On check or fix
>> > failure, skip registering the battery hook and the conservation_mode
>> > attribute=2E
>> >=20
>> > Note: the switches never enable themselves autonomously, so there is =
no
>> > need to fix it during runtime=2E
>> >=20
>>=20
>> Hi Rong,
>>=20
>> Note that this isn't strictly true=2E A known bug in multiple Lenovo de=
vices is that querying the EC too quickly can cause it to reset into an inv=
alid state=2E I=2Ee=2E some games run under wine for check the state of the=
 AC adapter multiple times a second=2E In such a case they can reset and th=
en report both modes on=2E=C2=A0
>>=20
>
>Could you confirm if it's a completely different issue compared to
>https://msgid=2Elink/58586fa666f09c209f9d7fe8c692a8bdda6d4410=2Ecamel@ron=
g=2Emoe
>(i=2Ee=2E, an ACPI mutex ABBA deadlock cause the GBMD method to return
>garbage data)?
>

I believe it is=2E The invalid state survives a power cycle and is precede=
d by a process hanging for a few seconds before the EC resets=2E It can be =
reproduced repeatedly by a simple bash loop that reads the state multiple t=
imes a second=2E

- Derek=20
>> I don't believe the device re-enumerates in this case=2E This is docume=
nted in the driver [1]=2E
>
>The comments and the relevant fix was added in a patch of mine=2E They ar=
e
>about yet another different issue, in which querying the EC with an
>interval < 50 *us* causes the EC to shut down the platform=2E
>
>Then the user must press the power button to power on the platform again=
=2E
>It's a cold boot=2E All kernel drivers are loaded from scratch, so the
>probe-time fix here takes effects=2E
>
>That being said, as far as I can recall, running into the issue doesn't
>set both modes to enabled=2E Besides, userspace checking the state of the
>AC adapter multiple times a second must have an interval much larger than
>50 us, so I don't think the issue you described is the same as the issue
>described in the comments either=2E
>
>>=20
>> Lenovo ha mentioned to me a BIOS fix for this issue will be coming for =
the Go S and Go 2 at some point as well, but this isn't exclusive to Go mod=
els=2E It may be prudent to fix any time an invalid state is detected=2E
>
>I am OK with the fix-whenever-seen approach, but in this manner it'd be
>better to wait until
>https://msgid=2Elink/20261018122348=2E679126-1-aliamemis@disroot=2Eorg is
>applied to solve the ABBA deadlock issue, so that false positives during
>runtime are reduced=2E
>
>Thanks,
>Rong
>
>>=20
>> Thanks,
>> - Derek
>>=20
>> [1] https://github=2Ecom/torvalds/linux/blob/32c52ec87d6245ee2d12ed5dd5=
09e40062939b50/drivers/platform/x86/lenovo/ideapad-laptop=2Ec#L286-L296
>>=20
>> > Fixes: 90430ea98f55 ("platform/x86: ideapad-laptop: Add charge_types:=
Fast (Rapid Charge)")
>> > Closes: https://github=2Ecom/ValveSoftware/SteamOS/issues/2876 [1]
>> > Signed-off-by: Rong Zhang <i@rong=2Emoe>
>> > ---
>> > Rong Zhang (2):
>> >      platform/x86: ideapad-laptop: Factor out charge_types methods fo=
r internal use
>> >      platform/x86: ideapad-laptop: Fix unexpected charge_types on pro=
be
>> >=20
>> > drivers/platform/x86/lenovo/ideapad-laptop=2Ec | 113 ++++++++++++++++=
++++-------
>> > 1 file changed, 84 insertions(+), 29 deletions(-)
>> > ---
>> > base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
>> > change-id: ef28eda4-ideapad-fix-charge-types-067d46d08945
>> >=20
>> > Thanks,
>> > Rong
>> >=20

