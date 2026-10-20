Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497263;
	b=IL7/CmgV3gw2n6wR4KF++iPUEXlldFI1y2SwYJFRmIBFIXE17Zhw5giiPj0HGREtYEzX
	 3AWddahagALvoVehGVJ44H6+CJsh5SkSwD3hwelS2158/A0dIwtjohXae7zFgKRCk1pQH
	 SkRJig2HTXkv/96eBnl4DBRUcfSVyww4hxWwEk+LRxbtiSqAUILGowYmwTcy8tF7HN1MJ
	 guMJ7MNnyekUEThS/bLSo3NSIOPBCKe6rAynM7IbVDo/FkeTJgWLNLnW1xa2VQVoFevrC
	 FGBxIjwO3O3cXVg23/ZaItCi5ibrTkXRFw9M57BXkO6QJnkl+EYuHsVi+yk2v9CyaVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497263;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Rspamd-Action:X-Spam-Level:X-Spamd-Result:X-Spam-Flag:X-Spam-Score;
	bh=QaZoIjVJRLkL7XwEh+EAo4RNnx880rLizx+x3ryA0UU=;
	b=cx96Sa1gDo6wP+usEsaNtQyqNKcU/qIF9JHB2VxALupP0Ck2znQCaY74fcGZ6eCz/TJ4
	 qh4XudPa+NI4oG3TAK4hCehYdYGZukj7phXRr7qqV2M4FQnRoCt4pu1FE5dlfOv6M99LO
	 /bPxsBXfjWL1iEnAI+h7TlR7ybPkdYrE+n1WjgnJoLWtLIEuekw9RuI+C7WHXrk372sis
	 46IKNeiQlhhNeDAsWrBQ0T5LBNeYG0IpLtbYdWhpMM3lmP39LGg3yboDtxSV2qbAILE3p
	 xiDYqeojnRwuaD2+hZRYFkpbUkIAJaisoD1gGB0a874xe7A2EhUnaSK0NAJhBw0S+oQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ytXNDCNK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cU8UeJWX;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ytXNDCNK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cU8UeJWX;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA236606A319;
	Tue, 20 Oct 2026 11:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA236606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ytXNDCNK;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cU8UeJWX;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ytXNDCNK;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=cU8UeJWX
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id F408D1F7B6;
	Tue, 20 Oct 2026 11:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792497261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaZoIjVJRLkL7XwEh+EAo4RNnx880rLizx+x3ryA0UU=;
	b=ytXNDCNKe1IFl9tgbkQpEa3ni0rdofBk/7qnVvN1s0igomqBTdNTXuXV5OP6muVBYbQleF
	ioskDYl5CvAqewRxhDCBTOYg0xiqNU79dgpkE5F3C+S6G/svrg5EHSb5BONSuH/GAnFPO8
	k4OeNKRhLt+9eMDIDf7Nx2zQ3bepMJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792497261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaZoIjVJRLkL7XwEh+EAo4RNnx880rLizx+x3ryA0UU=;
	b=cU8UeJWX4C+VVqDcrWptVEOmjHLcAu7Z5TmPyDnWdpUWPeJhr4k8jRYL3zjHs04SYPm+1J
	p1QeFfy7PALLsoAQ==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=ytXNDCNK;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cU8UeJWX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792497261; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaZoIjVJRLkL7XwEh+EAo4RNnx880rLizx+x3ryA0UU=;
	b=ytXNDCNKe1IFl9tgbkQpEa3ni0rdofBk/7qnVvN1s0igomqBTdNTXuXV5OP6muVBYbQleF
	ioskDYl5CvAqewRxhDCBTOYg0xiqNU79dgpkE5F3C+S6G/svrg5EHSb5BONSuH/GAnFPO8
	k4OeNKRhLt+9eMDIDf7Nx2zQ3bepMJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792497261;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QaZoIjVJRLkL7XwEh+EAo4RNnx880rLizx+x3ryA0UU=;
	b=cU8UeJWX4C+VVqDcrWptVEOmjHLcAu7Z5TmPyDnWdpUWPeJhr4k8jRYL3zjHs04SYPm+1J
	p1QeFfy7PALLsoAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AC2F4136C6;
	Tue, 20 Oct 2026 11:54:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id poq3IGxW12rFGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Tue, 20 Oct 2026 11:54:20 +0000
Date: Tue, 20 Oct 2026 13:54:20 +0200
Message-ID: <87o6coh9jn.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ajanesh Lal <ajaneshlal3@gmail.com>
Cc: tiwai@suse.com,
	perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute and mic-mute LEDs for HP ENVY 16 (103c:8be5)
In-Reply-To: <baf51d2a-e2f8-4c01-ab2b-3fd8834c94ca@gmail.com>
References: <baf51d2a-e2f8-4c01-ab2b-3fd8834c94ca@gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Queue-Id: F408D1F7B6
X-Rspamd-Action: no action
X-Spam-Level: 
X-Spamd-Result: default: False [-3.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DNSWL_BLOCKED(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Flag: NO
X-Spam-Score: -3.51

On Tue, 20 Oct 2026 12:32:17 +0200,
Ajanesh Lal wrote:
> 
> The HP ENVY Laptop 16-h1xxx (PCI SSID 103c:8be5) uses an ALC245 codec
> with CS35L41 I2C speaker amplifiers. No LED fixup is applied for this
> subsystem ID, so the speaker mute LED and the microphone mute LED are
> never driven and do not follow their keys.
> 
> Add a fixup that calls the existing ALC245 mute LED COEF helper and the
> GPIO mic-mute LED helper directly, then chains to the CS35L41 I2C
> amplifier setup so the speakers keep working. Use it for 103c:8be5.
> 
> Tested on an HP ENVY Laptop 16-h1xxx running kernel 7.2.11: the
> hda::mute and hda::micmute LEDs appear and follow their keys, and the
> speaker amplifiers still bind (CS35L41 Bound in dmesg). The mic LED
> GPIO pin and polarity are not verified on other hardware.
> 
> Assisted-by: Claude:claude-haiku-5-5
> Signed-off-by: DragonicRage13 <ajaneshlal3@gmail.com>

The patch can't be applied, likely because your mailer broke the
spaces and tabs.  Could you fix your mailer setup and resubmit?
At best, use git send-email.


thanks,

Takashi

> ---
>  sound/hda/codecs/realtek/alc269.c | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/hda/codecs/realtek/alc269.c
> b/sound/hda/codecs/realtek/alc269.c
> index e98cc42e1..850a15801 100644
> --- a/sound/hda/codecs/realtek/alc269.c
> +++ b/sound/hda/codecs/realtek/alc269.c
> @@ -1572,6 +1572,14 @@ static void
> alc245_fixup_hp_mute_led_coefbit(struct hda_codec *codec,
>      }
>  }
> 
> +/* mute LED via COEF bit and mic-mute LED via GPIO, called directly */
> +static void alc245_fixup_cs35l41_mute_micmute(struct hda_codec *codec,
> +                          const struct hda_fixup *fix, int action)
> +{
> +    alc245_fixup_hp_mute_led_coefbit(codec, fix, action);
> +    alc245_fixup_hp_gpio_led(codec, fix, action);
> +}
> +
>  static void alc245_fixup_hp_mute_led_v1_coefbit(struct hda_codec *codec,
>                        const struct hda_fixup *fix,
>                        int action)
> @@ -4230,6 +4238,7 @@ enum {
>      ALC245_FIXUP_BASS_HP_DAC,
>      ALC245_FIXUP_ACER_MICMUTE_LED,
>      ALC245_FIXUP_CS35L41_I2C_2_MUTE_LED,
> +    ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED,
>      ALC236_FIXUP_HP_DMIC,
>      ALC256_FIXUP_HONOR_MRB_XXX_M1020_AUDIO,
>      ALC245_FIXUP_HP_ENVY_X360_15_FH0XXX,
> @@ -6859,6 +6868,12 @@ static const struct hda_fixup alc269_fixups[] = {
>          .chained = true,
>          .chain_id = ALC287_FIXUP_CS35L41_I2C_2,
>      },
> +    [ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED] = {
> +        .type = HDA_FIXUP_FUNC,
> +        .v.func = alc245_fixup_cs35l41_mute_micmute,
> +        .chained = true,
> +        .chain_id = ALC287_FIXUP_CS35L41_I2C_2,
> +    },
>      [ALC236_FIXUP_HP_DMIC] = {
>          .type = HDA_FIXUP_PINS,
>          .v.pins = (const struct hda_pintbl[]) {
> @@ -7361,7 +7376,7 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>      SND_PCI_QUIRK(0x103c, 0x8be1, "HP Envy 15",
> ALC287_FIXUP_CS35L41_I2C_2),
>      SND_PCI_QUIRK(0x103c, 0x8be2, "HP Envy 15",
> ALC287_FIXUP_CS35L41_I2C_2),
>      SND_PCI_QUIRK(0x103c, 0x8be3, "HP Envy 15",
> ALC287_FIXUP_CS35L41_I2C_2),
> -    SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16",
> ALC287_FIXUP_CS35L41_I2C_2),
> +    SND_PCI_QUIRK(0x103c, 0x8be5, "HP Envy 16",
> ALC245_FIXUP_CS35L41_I2C_2_MUTE_MICMUTE_LED),
>      SND_PCI_QUIRK(0x103c, 0x8be6, "HP Envy 16",
> ALC287_FIXUP_CS35L41_I2C_2),
>      SND_PCI_QUIRK(0x103c, 0x8be7, "HP Envy 17",
> ALC287_FIXUP_CS35L41_I2C_2),
>      SND_PCI_QUIRK(0x103c, 0x8be8, "HP Envy 17",
> ALC287_FIXUP_CS35L41_I2C_2),
> -- 
> 2.56.0
> 
> 
