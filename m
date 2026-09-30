Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58935CB61
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790771444; cv=none; b=OMN64LNlfIilas//b9ivQt1EEafhRNFvC1HOlon71j79h44vIr4dJA1WMWMq6+nvx1hSJ9A0DEdOyqso8pmFvDdvnRlCVfEwrGg8AzA6Zwhq42vc9KTwkaUQ3MRL3cOwW1QOM64QUL8/TFDfAhbJEXN7u4sgJHB/I4s8NzUQM+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790771444; c=relaxed/simple;
	bh=umMdtdGHmNyN3QUyqFsFG/sSNcroWHL4MqclGkoUPcw=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=deX5TXrRH8vr0u7S7LLoW//QIPPTwPX3KhDG6WkxUOAa1USsC57RJJtyiAkTV98aiMfCjCaaYiu1ThiC51/8YFhbxpNYe2ip4ofnd+UNCgEJEFAQHWTftYgPgcdGlRfITcijQH4YDXUOUGHHUdnjWy7pHdnFovjfHTcwTJ8Y5CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=DtXE4IrT; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Cja5hqS+; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=dwCmq0xB; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=Jkl8R7lg; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="DtXE4IrT";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Cja5hqS+";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="dwCmq0xB";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="Jkl8R7lg"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8493A1F8D6;
	Wed, 30 Sep 2026 12:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790771436; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jdXUot0qtKaOs8crNAWjCWwwHQBoIPvaskpFXhLmheQ=;
	b=DtXE4IrThRusTGqzHYItRgTUOFQ6JLJAbDlZwf6BOcw9OIRdTZgdGUB4iUiZ+zBFTKlQSx
	H6jJDl9Z52lel80Dqx73nRGa0KPjsQex27WXB8fbMI9CYsmLkiaTFpDNFHwVggycb+1dNR
	m1yf0rmXF3oSU8hR2sr5jj54gX/3F+w=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790771436;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jdXUot0qtKaOs8crNAWjCWwwHQBoIPvaskpFXhLmheQ=;
	b=Cja5hqS+fduO6epvq2vv5jzR381iZeyuiWS9mOhOZsRu5shGARqx3MC4SAJxATu3zjKzP+
	XNCRDrXR87w6VQBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1790771432; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jdXUot0qtKaOs8crNAWjCWwwHQBoIPvaskpFXhLmheQ=;
	b=dwCmq0xB4Ir212FFx3TbmuGmnU9LnETlRDV5FCoEVuWxC4wxDP9W1I38XqQl0jZO+4N20f
	CHSTmyFvlmO3Ft/lMgCS5nngoH/9+vZ4wC3Fxw4+IXFy7EF9u+oyKN3PDKMdX/8bRwRTR9
	gkzwvJ+ePkkZG5x2E219loTqoo0cfYM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1790771432;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jdXUot0qtKaOs8crNAWjCWwwHQBoIPvaskpFXhLmheQ=;
	b=Jkl8R7lgjtwA5UI/kHyV0tH9FQVU2iNm2hsnkgNk5NMMro0uvr37k8P5MnEQjVpaWLVoD4
	5BybyRO/v2+7BrBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 372BC136AD;
	Wed, 30 Sep 2026 12:30:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id h4KIA+gAvWrPdwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 30 Sep 2026 12:30:32 +0000
Date: Wed, 30 Sep 2026 14:30:31 +0200
Message-ID: <87y0ci53bs.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Ren Panpan <rppxj178543@163.com>
Cc: perex@perex.cz,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	renpanpan <renpanpan@kylinos.cn>
Subject: Re: [PATCH] ALSA: hda/realtek: Add mute LED quirk for HP Pavilion 14-dv1001TU
In-Reply-To: <20260930065504.24151-1-rppxj178543@163.com>
References: <20260930065504.24151-1-rppxj178543@163.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[163.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kylinos.cn:email,imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO
X-Spam-Score: -3.30
X-Spam-Level: 

On Wed, 30 Sep 2026 08:55:04 +0200,
Ren Panpan wrote:
> 
> From: renpanpan <renpanpan@kylinos.cn>
> 
> The HP Pavilion 14-dv1001TU (subsystem ID 103c:8987) uses a Realtek
> ALC287 codec. The mute LED on this machine is controlled by GPIO bit
> 0x10, which was verified via hda-verb, but the subsystem ID is missing
> from the quirk table. As a result, the ALC287_FIXUP_HP_GPIO_LED fixup
> that drives GPIO 0x10 is never applied and the mute LED stays off even
> though the associated LED class device toggles correctly.
> 
> Add the missing SND_PCI_QUIRK entry to map this subsystem ID to
> ALC287_FIXUP_HP_GPIO_LED so the mute LED works as expected.
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=221810
> Signed-off-by: renpanpan <renpanpan@kylinos.cn>

Applied now.  Thanks.


Takashi
