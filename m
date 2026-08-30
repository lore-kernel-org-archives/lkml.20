Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09466321420;
	Sun, 30 Aug 2026 21:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788124344; cv=none; b=U+iLA9BKIkOnZE6+YdGiYYgoqQjt7hvMcO0q7T01gvVnwfkeYV7mZI2A+HKxhA7UymSGRQHpJGIhj252y2lLJVDZGm1K7YJqM+r8juNDOEM6461L/NhA7cvwpI9E1LBnQX2m6L/ZyNg9iQ15Ipwtc81idM0Yezq9VrNU3vZb4is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788124344; c=relaxed/simple;
	bh=2xS7cIILr/eMJ7yp7jKavDyvprjG9VPjxmtqAVVV7eE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ahlQySEXONKyY9dNOZEDy+500rc5pPw3EPqJBAhTK+SmwQGHrJtaXSXrOAnktZAYMDMxQtMZ+n29NLeCw7tUy4aQ9v+6QBlID50oKbakv1xYk3/BruDgjx1kyNHFGQ9OXOXSyPZMOl05C1nEp094SQTZfr5TN611DxSYF9h0OdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=DRL/CDKr; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="DRL/CDKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788124338; x=1788383538;
	bh=Roy8vgZd03B6QxjB8XtzlYYBRJ437LaK5lIB1jh3Ppk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=DRL/CDKrb8nnvtKpg09+LFs1GK5EhPtn1RUdBniymogN2cQ/HIpfE9h68GN/bHWS5
	 76TAiOVItVi5xc5ofqVd9L8wqPh71Xvp7HvfHZrU34iAe/TT8pzR3HL7DMXpB2qLp9
	 0oWC0JAwMFji8Rt7A03RzDZ1Fb/UCMfQeCDrlwkeykw0Mgws4L02hPPGj51tYvXv4K
	 ccwU8VO9iYL82NLxvT2C/eTjtUANqr7UVqzXfnXuIkRfYAct8D60dflqHX1QBzfSp6
	 YKwvev0VMWrUjnKDmkf7LXc1+svbz0/2DuLxAx4YrYMrgA3pEnzXQ1NvXQfcZy+516
	 5HvNQf3MmzlsA==
Date: Sun, 30 Aug 2026 21:12:12 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Bard Liao <bard.liao@intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Amaan Lalani <zlzzm2014@outlook.com>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] soundwire: dmi-quirks: drop the ghost RT1320 on the Surface Pro 11 (Intel)
Message-ID: <20260830211203.50752-1-lsa.uz@pm.me>
In-Reply-To: <20260830151516.44629-3-lsa.uz@pm.me>
References: <20260830151516.44629-1-lsa.uz@pm.me> <20260830151516.44629-3-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 0b7342d2710e395a1b60a0093f8cb971b194ea55
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A second Surface Pro 11 (Intel) has reproduced the ghost independently and
confirms this patch removes it. The report is from leihua-dev on the
linux-surface tracker; I am relaying it here because it is a different unit=
 with
a different BIOS from mine, and because this series has had no review of th=
e code
since 2026-08-05.

Unit: Surface Pro for Business 11th Edition with Intel, SKU
Surface_Pro_11th_Edition_With_Intel_For_Business_2103, Core Ultra 7 266V, B=
IOS
17.100.143. Mine is the same SKU with a Core Ultra 7 268V and a different B=
IOS.

Before the quirk, both _ADRs present and ACPI enumerating each SDCA functio=
n
twice:

  acpi device:28: find_sdca_function: SDCA function SmartMic (type 3) at 0x=
2
  acpi device:29: find_sdca_function: SDCA function SmartAmp (type 1) at 0x=
4
  acpi device:2b: find_sdca_function: SDCA function SmartMic (type 3) at 0x=
2
  acpi device:2c: find_sdca_function: SDCA function SmartAmp (type 1) at 0x=
4

with sdw:0:0:025d:1320:00 permanently UNATTACHED. After the patch only the
2b/2c pair remains.

Their DMI_PRODUCT_SKU matches the quirk key exactly. That is the evidence I=
 did
not have when I chose SKU over product-name matching in v2 =E2=80=94 at the=
 time it was
one machine and an argument.

Two limits on the report, stated so nobody has to discover them:

  - They run a 6.18 tree, so the dmi-quirks.c hunk was context-adapted; tha=
t
    branch has no ghost_realtek table yet. The logic is unchanged.

  - They applied five changes at once and did not bisect. That does not wea=
ken
    this patch specifically: the duplicate _ADR and the doubled enumeration=
 are
    both observable before any topology loads, and their before/after shows=
 them
    changing.

Full report, with their kernel and userspace versions:
https://github.com/linux-surface/linux-surface/issues/1876#issuecomment-547=
0909030

Separately, one hazard that surfaced in the same comparison and may be wort=
h
knowing on the list. Backporting a machine entry whose .sof_tplg_filename n=
ames a
dummy topology onto a pre-6.19 kernel yields no sound card at all =E2=80=
=94 probe fails
with -ENOENT before anything registers, speakers included =E2=80=94 because
225d70b80745 ("ASoC: SOF: don't check the existence of dummy topology") is =
not
there to skip the existence check. Upstream is fine: sof_test_topology_file=
()
tests the name and has no idea where the name came from, so from 6.19 a mac=
hine
entry and the generic path are treated alike. It is purely a backport hazar=
d, and
it cost that reporter a boot with no audio at all.

