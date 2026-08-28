Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B1B3D5666;
	Fri, 28 Aug 2026 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918886; cv=none; b=P3kNghz7Xu8TAy3YnhmHB65cMQ2TLDuR52f3fYUGhxveGjLaoVveXNmMEYZbTAMqEvOlzK0DR8bCq6ZSq6Y7EnwdCPp/9Mw6bcIRRO6MijMzJ/h2DDd4LD15m0EWSssIb26GGSUMbYryW2B18468o+gHJZM75nOANwzMpQS1sLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918886; c=relaxed/simple;
	bh=LKTkxqKoon7duy6pNbYXhkMUtZoZS0ltoY5rlOlTRgA=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tft3n/aFclMAV/Emgm3YcwP7Vu3GYMMdULigaVCV+SuDgP6602OJqJr89Vw+/4sLTIzuRzQbhOhyK9kPucAUnkQSgEFhbXd8JIxfDVfbqrC/fZV3DXDNs1eU2br5OFGRbJ3LhvpjPG7F70sXKCs9l4d3Hfhm7qkWgvO1d2QNV+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Z9qgkhSP; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=z2QK+7fw; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=D2DkS627; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=bz00pIu/; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Z9qgkhSP";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="z2QK+7fw";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="D2DkS627";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="bz00pIu/"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F260221AD;
	Fri, 28 Aug 2026 12:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787918868; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PT+v/CY/k+PNsmOPqSO0u5nrIh+MELSj7465HIkYP7k=;
	b=Z9qgkhSP/HuhbkEe4nf6TjiexQ7lKokBV/m6gi/RSIB/W+mHtVxuQhEHyzkns525SnLUM9
	HqruPPbccYMMQBPB2BtRHSpUQwA0oVOlVkkoNIwUIKZzXcllhuJBnBXfLgynC+uWwsw2wR
	32x/K61QS2qZ7iBGZtfSfspjeFvf4L8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787918868;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PT+v/CY/k+PNsmOPqSO0u5nrIh+MELSj7465HIkYP7k=;
	b=z2QK+7fwdr82oIt2tV1gPlpAOUOjRiXunenLrN7OjdXL2xwM6GmPx5hK1cEHdMiWW3v2pc
	mos2LjjQrlVd0vCw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1787918864; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PT+v/CY/k+PNsmOPqSO0u5nrIh+MELSj7465HIkYP7k=;
	b=D2DkS627pb8L3rTQmO92ZOVY4qHJ9RFx/hMDiLLKwTCuKbmZmlE3tQPVbic7o9/D47MIMc
	YZ4mZTEBuh9/JsF0u6Seda6xUu+5P8puE40H1N74CGZe9IQXQsyI1rkDfdM8wzJcaiwCRv
	vuf7Z6Dh/8ndteaFkXSRGagQSSDSZ3U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1787918864;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PT+v/CY/k+PNsmOPqSO0u5nrIh+MELSj7465HIkYP7k=;
	b=bz00pIu/SlG3F22lYiOY1ifuJqDEmzXflLD3Xur5JnfeVrbm1EGV2Zz5zHk6QWLqyonwXW
	tcTScKYB8aVDOsDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D3B9D13515;
	Fri, 28 Aug 2026 12:07:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id z3tyMg96kWo9HAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 28 Aug 2026 12:07:43 +0000
Date: Fri, 28 Aug 2026 14:07:43 +0200
Message-ID: <87cxv2v46o.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Edward Adam Davis <eadavis@sina.com>
Cc: syzbot+c35f34092a4bc9855be6@syzkaller.appspotmail.com,
	gregkh@linuxfoundation.org,
	kees@kernel.org,
	tiwai@suse.de,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] usb: gadget: midi2: prevent in/out jack from oob
In-Reply-To: <20260826134606.127250-1-eadavis@sina.com>
References: <6a8ed2cd.1d9ded08.62e62.00a8.GAE@google.com>
	<20260826134606.127250-1-eadavis@sina.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Score: -1.80
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[sina.com];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[c35f34092a4bc9855be6];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVRCPT(0.00)[sina.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Wed, 26 Aug 2026 15:46:06 +0200,
Edward Adam Davis wrote:
> 
> The increment of config->jack_out in append_midi1_out_jack() lacked
> bounds checking, triggering issue [1] when the value approached the
> limit MAX_CABLES.
> 
> A similar out-of-bounds issue exists in append_midi1_in_jack(), so it
> is being fixed as well.
> 
> Before incrementing jack_out/in, the code now checks if the value has
> reached the upper limit MAX_CABLES; if so, it exits and returns -EINVAL.
> 
> Additionally, the jack_id assignment is moved to occur after the jack_out
> bounds check to prevent wasting IDs on invalid increments.

I think the bug is rather the arrays are too small; they should have
been twice as the jacks can be added from both input and output.

Both append_midi1_out_jack() and append_midi1_in_jack() are called
from the loops of midi2->num_midi1_out and midi2->num_midi1_in
counts, and they are properly upper-bound to MAX_CABLES.

Could you check whether the fix below works instead?


thanks,

Takashi

--- a/drivers/usb/gadget/function/f_midi2.c
+++ b/drivers/usb/gadget/function/f_midi2.c
@@ -1634,8 +1634,8 @@ struct f_midi2_usb_config {
 
 	/* MIDI 1.0 jacks */
 	unsigned char jack_in, jack_out, jack_id;
-	struct usb_midi_in_jack_descriptor jack_ins[MAX_CABLES];
-	struct usb_midi_out_jack_descriptor_1 jack_outs[MAX_CABLES];
+	struct usb_midi_in_jack_descriptor jack_ins[MAX_CABLES * 2];
+	struct usb_midi_out_jack_descriptor_1 jack_outs[MAX_CABLES * 2];
 };
 
 static int append_config(struct f_midi2_usb_config *config, void *d)
