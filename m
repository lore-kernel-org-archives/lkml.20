Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch [109.224.244.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB27833EB01
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788092784; cv=none; b=aDMRMvmz0ruDL1G54O9T9iRGIvEcg5eEWlMupVYiYvNch5yx4vwG3EYPTFvsLv+mxuxhDnFKmfxoHrvZiJ4KjDNSpHqKRrazhhZDGDGNZFYCH+TKLMWkGb8uIBI8M8jRGzXaDSUr7nzWqadoD8DDRQGIa62vxLV751c9l0N/zWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788092784; c=relaxed/simple;
	bh=gMES+XbAaTWdwIOpV7xRmxgC1klgiNi5llJN8rx27zQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WS7SwXPETOaAiuVGR5USFQWufBTW3qP6TB2lV2j/FL2NeTe7xx2SLm1nk7GZSeAEmwceGcRJStv9Kyq21rxSWsqLDg1TRFzP4axVaWr/MWxNFsxphD1Ot9SMaDWxm+OEp0a+BlZ2hyiXNHcebNekNm7JRUISJD+BJRgxBm4ZBO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=AtBMpcnM; arc=none smtp.client-ip=109.224.244.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="AtBMpcnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788092780; x=1788351980;
	bh=xw89cOOqbr5zzKQkcOLyWx3QnxWIgSvTdDfm1qS8+oQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=AtBMpcnMy6Mj+QfWQlp+QKmjkYoDs4kGlyvdRgvJ/C7nKY/NGr80uq9S8HVNFX8Pk
	 aZ14W8iVUWBUzHYDEHJd910aK6vkmTgnuQj2t+JkyBKF1blbhOemiA9MsRPVQvof8I
	 13b+IqL/uzBuNYP4lHpSKH1rMD2ePHfEu0OMwTCp1os6U4ZJTMqD0ZViWYPe1Cne3p
	 +D600fTPh9rh3JZjfTe6yhIl3j7eFfssJzPQiC1SugqlzHDENIfHe5DrRNRAG3VJ5L
	 TiL0iigs8VUmylDNWxYKRZnXwawPMs6pd6ZsftpZInZLjQ1LBuLa3q2M8AP/UasEs6
	 3xSTDo7QX9fxQ==
Date: Sun, 30 Aug 2026 12:26:13 +0000
To: Vinod Koul <vkoul@kernel.org>, Bard Liao <yung-chuan.liao@linux.intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>, Oder Chiou <oder_chiou@realtek.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Amaan Lalani <zlzzm2014@outlook.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] ASoC: fix audio on the Microsoft Surface Pro 11 (Intel)
Message-ID: <20260830122606.47028-1-lsa.uz@pm.me>
In-Reply-To: <20260830084500.6123-1-lsa.uz@pm.me>
References: <20260804225853.31585-1-lsa.uz@pm.me> <20260830084500.6123-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a726369410a390c3c9c15938ac90a3a81daa0169
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Some context I should have gathered before v1, not after v2. None of it
needs action from you; it is here so nobody spends time twice.

1. An overlapping series is already on the list
-----------------------------------------------

Amaan Lalani sent this on 2026-08-28, two days before my v2:

  [PATCH 0/2] ASoC: fix SoundWire enumeration on Surface Pro 11
  https://lore.kernel.org/linux-sound/BY5PR02MB63701A05A58EF6B4D6CAAC31A0AC=
2@BY5PR02MB6370.namprd02.prod.outlook.com/

Same machine, and in substance the same two changes as my v1 2/3 and 3/3 -
the name-prefix reuse for _ADR entries differing only in class id, and an
is_peripheral_attached() test on SDW_SLAVE_UNATTACHED. So the review you
already gave me applies to it unchanged: it detects the ghost at runtime
rather than removing it at enumeration.

Their version is better than mine was in two respects worth keeping if that
approach is ever preferred: it hooks both asoc_sdw_count_sdw_endpoints() an=
d
asoc_sdw_parse_sdw_endpoints() rather than only the parse path, and it
carries Fixes: tags.

2. There is a body of downstream work for this machine
------------------------------------------------------

Andr=C3=A9 Gilerson has carried Surface Pro 11 Intel patches in a linux-sur=
face
fork since February - audio, cameras, an IR sensor driver, touchpad, lid
wake, a suspend hang fix. People have been running them daily for months.
None of it has been submitted here.

  https://github.com/linux-surface/linux-surface/pull/1990

His audio fix takes the traditional shape: a DMI-gated machine entry in
soc-acpi-intel-lnl-match.c naming the real peripheral outright, with
name_prefix "rt1320-1" and two endpoints. With such an entry matched, the
generic find_acpi_adr_device() path is never reached, so the ghost never
gets the chance to consume an amp index.

3. The part that is actually interesting: the generic path is better here
--------------------------------------------------------------------------

Measured on this machine today, with v2 applied, stock alsa-ucm-conf
1.2.15.3 and firmware-sof 2025.12.2, and no local configuration:

  Components: 'HDA:80862820,80860101,00100000  cfg-amp:1
               iec61937-pcm:7,6,5 spk:rt1320 mic:rt1320-1 cfg-mics:1'

  Using function topologies instead intel/sof-ipc4-tplg/sof-lnl-dummy.tplg
  loading topology 0: intel/sof-ipc4-tplg/sof-sdca-1amp-id2.tplg
  loading topology 1: intel/sof-ipc4-tplg/sof-sdca-mic-id4.tplg
  loading topology 2: intel/sof-ipc4-tplg/sof-hdmi-pcm5-id5.tplg

  arecord -l: card 0: sofsoundwire, device 4: Microphone

With no machine entry, the generic path uses a *-dummy.tplg base, dispatche=
s
the function topologies itself, and produces cfg-mics:1.

On the machine-entry branches the microphone is a recurring problem. Users
report the mic missing entirely on the 6.18 branch - sof-sdca-mic-id4.tplg
present in firmware but never requested - and the v7.0 commit fixes it by
switching to a dummy base and forcing "Playback-SmartAmp" /
"Capture-SmartMic" dailink names, which is the dispatcher's own behaviour
reimplemented by hand. Its commit message attributes the loss to the
monolithic base topology discarding the SmartMic function. Separately, the
missing cfg-mics breaks the UCM import outright on alsa-ucm-conf 1.2.16.

I have not run that branch here, so that comparison is their reports agains=
t
my measurements rather than one machine tested both ways. I have offered to
do exactly that on this device and will report the result.

If it holds, the general shape is worth more than this laptop: remove ghost
_ADRs at enumeration and let the generic path do its job, instead of adding
a match entry per model - which for this hardware appears to cost the
microphone. Surface Pro 12 (Panther Lake) is reported to have the same
firmware shape, so it would be the next test of that idea rather than the
next entry.

Thanks,
Sergey

