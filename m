Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE366395AC6;
	Tue,  8 Sep 2026 07:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788852129; cv=none; b=h77L+rGYhQAIKvjdjxyhVmkpqs+ZTF4I4cAkiKKOeMdmS6E1ExMMUlKp3tUUfdwPC0b3MeA3GGOeuPF/MjpfrsSI1qepojzoGuOjlt2l/6Touo54FN7gF2NXupBzxmxn/gZ6u43kwlJfHurjelh1c/bgtOxCwcu6/caZq54pzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788852129; c=relaxed/simple;
	bh=c/UOezhR3ck0+vPGa0KccIRAo2wvr3A7zcLg0LqWeWM=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=breva7jtxrBKF5D/uoxgpziY3UEB+/SqvvQlHi2G+dhSDRX/UdN5vsbWSpatbtm+4V1WB+5qkfpHc0UrO3psawnmEkWmicTF0L04QR+FpJQ+2FNmVgN/KdqnjH8NDirnHXMZHIrq1ZFBh6hrtre/RJkrIkYQQ/vo6QCclj13zmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=nPlAHklQ; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=ZvncwBjZ; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DGiAV67G; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=rV7109yT; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="nPlAHklQ";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="ZvncwBjZ";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DGiAV67G";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="rV7109yT"
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id C32AC1F449;
	Tue,  8 Sep 2026 07:21:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788852121; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqefEv/GeFfWWXxNH97SYRaK8ovpP3GwVWeC7CpomDs=;
	b=nPlAHklQwJjH+7K4gPXxJ8l6im7d7cvX9wH54aJjKWmahWYkTAau5e6qebuEWVt09R7saq
	Y6CSis+WMnghxzPgQUaNfG+gzEI7cw+kaljavZM7RI3TlC5tDTj8Vhod+4IrC1AreCmUmH
	hf0ogqGHM0guQDPdawj5400TYnTsxzw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788852121;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqefEv/GeFfWWXxNH97SYRaK8ovpP3GwVWeC7CpomDs=;
	b=ZvncwBjZ1l3U8nsW/WJiOrh96YqpXgU4Cxpit7xaQ/5sY842SJe8uMYHJ07arKiqcKXOj2
	StNfm2XNdDegQ2BQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=DGiAV67G;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=rV7109yT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788852117; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqefEv/GeFfWWXxNH97SYRaK8ovpP3GwVWeC7CpomDs=;
	b=DGiAV67GW/jZq1Ai8Y6U/uZO1U6gqgbt2OFKAb38ycloDl4zGCX8HyXHmd+j0Orwvnj0rx
	nrm64y7FqOKpMi2padfwLTzarwHAtX1awsyADLYmdXULxEOQZuVfwpfXt0SN+Ar1VwqqWj
	xxgUdpva9li7GOca6l4a77sMuHOWLm4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788852117;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iqefEv/GeFfWWXxNH97SYRaK8ovpP3GwVWeC7CpomDs=;
	b=rV7109yTOdo1IqMtd+ndZeieAZMyiG6DinSXqENt/pt9Sd2mcNktJSBvH0LcMQYosoQzbG
	WoJ9iSTmcY1DNeCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 81D0F13332;
	Tue,  8 Sep 2026 07:21:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id jvB1HpW3n2qGWgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 08 Sep 2026 07:21:57 +0000
Date: Tue, 08 Sep 2026 09:21:56 +0200
Message-ID: <87a4psqkbv.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Suzu <suzu1dev@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] ALSA: hda/intel: Disable power saving on ASUS GU605CX
In-Reply-To: <20260906202439.209462-1-suzu1dev@gmail.com>
References: <20260906202439.209462-1-suzu1dev@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -3.51
X-Rspamd-Queue-Id: C32AC1F449
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Level: 
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO

On Sun, 06 Sep 2026 22:24:39 +0200,
Suzu wrote:
> 
> On the ASUS ROG Zephyrus G16 GU605CX, the ALC285 analog headphone
> output produces a loud pop about ten seconds after playback stops
> with power_save=10. This was reproduced with iLoud Micro Monitor
> powered speakers connected to the 3.5 mm jack. Setting power_save=0
> eliminated the idle pops in repeated pause/resume tests on
> 7.2.3-arch1-2, with power_save_controller left enabled.
> 
> Extend the power-save denylist check to cover the tested Intel HDA
> controller (8086:7728, subsystem 1043:1034) on this board. Check the
> DMI board vendor and name as well, since GU605CW also uses subsystem
> 1043:1034 and has not been tested for this issue. Keep the existing
> pm_blacklist override behavior.
> 
> Disabling idle power saving can increase idle power consumption on
> the matched controller. A separate pop during shutdown was still
> observed with power_save=0; this change does not address it.
> 
> Link: https://github.com/omacom/omarchy/pull/10498
> Assisted-by: LLM
> Signed-off-by: Suzu <suzu1dev@gmail.com>
> ---
> Validation completed on the affected GU605CX:
> - Built and booted the complete patched 7.3-rc1 kernel; the native
>   kernel build log contains no warnings.
> - Verified that the loaded HDA module's srcversion matches the built
>   artifact for 7.3.0-rc1-audio-pop-test.
> - Confirmed power_save=10, power_save_controller=Y and pm_blacklist=-1,
>   with the expected 1043:1034 power-save denylist message.
> - In five samples spanning 40 seconds, the Intel analog PipeWire sink
>   was SUSPENDED while the ALC285 remained runtime-active with
>   power/control=on. This was sampled observation, not continuous tracing.
> - Intel and NVIDIA HDMI codecs were observed suspended with
>   power/control=auto; the NVIDIA HDA controller was also suspended.
> - After booting this kernel and receiving the pause/resume test
>   instructions, the user confirmed that the popping was no longer
>   audible. The exact number of cycles and pause durations were not
>   separately reported for this patched-kernel test.
> - The earlier power_save=0 workaround also passed human pause/resume
>   listening tests on 7.2.3-arch1-2, with controller power saving enabled.
> 
> Headphone switching, internal speakers and suspend/resume checks have
> not been reported for this patched kernel. Boot-time popping remains
> unverified. A shutdown pop was previously observed with power_save=0;
> this change does not address that shutdown path. No reliable measurement
> of additional idle power consumption is available.
> 
> Test-build context: an Arch-derived configuration with debug information
> and BTF disabled was used. NVIDIA 610.57.04 test modules required a
> separate local adaptation for the 7.3 dmem cgroup registration API.
> Those modules built and initialized; their objtool return warnings also
> occurred in the production-driver build. The NVIDIA adaptation is not
> part of this audio patch. Full graphics regression testing was not done.
> 
> AI assistance: I asked OpenAI Codex to investigate the idle pops
> and prepare a GU605CX-specific fix. It assisted with the patch,
> changelog and build/runtime checks. I performed the listening
> tests; results are described above. I booted the patched kernel
> and confirmed that the idle pop was no longer audible.
> 
> No introducing commit has been identified, so no Fixes tag is proposed.
> 
>  sound/hda/controllers/intel.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
> index 24015c73a..6da1d7ee5 100644
> --- a/sound/hda/controllers/intel.c
> +++ b/sound/hda/controllers/intel.c
> @@ -2328,18 +2328,30 @@ static const struct snd_pci_quirk power_save_denylist[] = {
>  	{}
>  };
>  
> +static bool azx_is_power_save_denylisted(struct pci_dev *pci)
> +{
> +	if (snd_pci_quirk_lookup(pci, power_save_denylist))
> +		return true;
> +
> +	/* GU605CW shares the subsystem ID; only GU605CX was tested. */
> +	return pci->vendor == PCI_VENDOR_ID_INTEL &&
> +	       pci->device == PCI_DEVICE_ID_INTEL_HDA_ARL &&
> +	       pci->subsystem_vendor == 0x1043 &&
> +	       pci->subsystem_device == 0x1034 &&
> +	       dmi_match(DMI_BOARD_VENDOR, "ASUSTeK COMPUTER INC.") &&
> +	       dmi_match(DMI_BOARD_NAME, "GU605CX");
> +}
> +
>  static void set_default_power_save(struct azx *chip)
>  {
>  	struct hda_intel *hda = container_of(chip, struct hda_intel, chip);
>  	int val = power_save;
>  
>  	if (pm_blacklist < 0) {
> -		const struct snd_pci_quirk *q;
> -
> -		q = snd_pci_quirk_lookup(chip->pci, power_save_denylist);
> -		if (q && val) {
> +		if (val && azx_is_power_save_denylisted(chip->pci)) {
>  			dev_info(chip->card->dev, "device %04x:%04x is on the power_save denylist, forcing power_save to 0\n",
> -				 q->subvendor, q->subdevice);
> +				 chip->pci->subsystem_vendor,
> +				 chip->pci->subsystem_device);
>  			val = 0;
>  			hda->runtime_pm_disabled = 1;
>  		}
> 
> base-commit: 45b5beb60bf7bd41c55ef17f6f2d28b351fad6c0

First of all, note that the power-save deny-list is a last resort.
Often better to tweak the existing quirks than disabling the runtime
PM.

And, even if we go for the pm deny-list, you can just add PCI SSID.
Both models are very likely same configurations.

Last but not least, you must provide a full real name (or a known
identity) in Signed-off-by tag.  It's a legal requirement.  The From
tag should also be the same, too.


thanks,

Takashi
