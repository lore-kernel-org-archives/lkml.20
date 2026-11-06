Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793949375;
	b=M8uQ89STo+E5RmHg2k07T0RI9a5uhJ8mKDTt+L7iuKFnLlxiJpHQyIrs2LQsKuoyj7bm
	 aH7aX+OybXOAxfWC5cZCqzgrlyfKk897UJ8Mk00eM+jA0rjpp7c0cMkWYINc3B/Kk6X1h
	 QaP+YpQK7sWg1jNrS47muLMYYmj54xroyizu5vXVAudr5myINKBfpWvNHhJMpEozf3wU3
	 8dx9fOENlp/Jd9q9XaZIdeDKJAMKg/mwiOUplLpHU2dGy/CT/dBSzZJ1lLO4bmcdSIAHj
	 CUuMbHFBb3EnCRuBgrYvQTdo3of4pdTky2KdPB4z9n23OtO1KsPMKzQypIPDkokLaEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793949375;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:User-Agent:MIME-Version:Content-Type:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=wEtBKDb0MJ/hesgLaUZ1AmZ8Y49zDVocm3g03+nRNeE=;
	b=riQIApEWQJy/XovVjDUpQOrPK34YYczYB8rp3nhrOg1P/4jcWRs9QFz8mczHXCpv0qRR
	 dWWVFaxJkc3Js73U1rVg2tLETy/qOZiQtYS1igY6lp1KDpeCE8iBGh8Zm4W3TlL/o+Nib
	 t3XQt6Bzy9IGpJFrxHHXBw4J5/F7DWTiYfKwzurRXSd9gay6Yiqvop7YIwjqN4LGc+mcs
	 mJz4nlqZi35hXe+NHDYpkKAI/faz4EEK6MPo1T2wO1gWXT3Lx1ETnsZJY5htE8I8nfGXR
	 IIgTGn9dEfHcO0rWnAFBTnTpl2FPx3k6Shai/Z2CPZDLQ9BKn3DOfHWJDLQf1rtUrmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZtngVeIz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lLu+zf76;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZtngVeIz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lLu+zf76;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66DCA606A326;
	Fri,  6 Nov 2026 07:16:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66DCA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZtngVeIz;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lLu+zf76;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=ZtngVeIz;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lLu+zf76
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 953F71FB91;
	Fri,  6 Nov 2026 07:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793949372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wEtBKDb0MJ/hesgLaUZ1AmZ8Y49zDVocm3g03+nRNeE=;
	b=ZtngVeIz/TscJr8b9y5RTN9n5X+bg/cNRN00Oz2g+hFPMmLSmqsADPx22wIU+tW5frtTXf
	IWsmAsZ4rOlHuhJBlnrm/4U0uvbiJZCYS1DlBvBc4iO3kgpSMb8MxJgF+27T7U4KqY2x7/
	YeIetPUkth5XD3Y94Co75NmVA/cfwbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793949372;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wEtBKDb0MJ/hesgLaUZ1AmZ8Y49zDVocm3g03+nRNeE=;
	b=lLu+zf76rfClxEuSsGW0Ae6rkgGtWxyCr+fsvMkHXRmrwdiVDnipU6nREaSTFb11PVlnOU
	LX3GWXoWdJd0BjDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1793949372; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wEtBKDb0MJ/hesgLaUZ1AmZ8Y49zDVocm3g03+nRNeE=;
	b=ZtngVeIz/TscJr8b9y5RTN9n5X+bg/cNRN00Oz2g+hFPMmLSmqsADPx22wIU+tW5frtTXf
	IWsmAsZ4rOlHuhJBlnrm/4U0uvbiJZCYS1DlBvBc4iO3kgpSMb8MxJgF+27T7U4KqY2x7/
	YeIetPUkth5XD3Y94Co75NmVA/cfwbk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1793949372;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wEtBKDb0MJ/hesgLaUZ1AmZ8Y49zDVocm3g03+nRNeE=;
	b=lLu+zf76rfClxEuSsGW0Ae6rkgGtWxyCr+fsvMkHXRmrwdiVDnipU6nREaSTFb11PVlnOU
	LX3GWXoWdJd0BjDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id CABA6134E9;
	Fri,  6 Nov 2026 07:16:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id eUSTJ7t+7WpeLQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 06 Nov 2026 07:16:11 +0000
Date: Fri, 06 Nov 2026 08:16:11 +0100
Message-ID: <87ld76qvk4.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Kai Vehmanen <kai.vehmanen@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org,	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,	Jani Nikula <jani.nikula@linux.intel.com>,
	Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,	Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>,	Tvrtko Ursulin <tursulin@ursulin.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,	Maxime Ripard
 <mripard@kernel.org>,	Thomas Zimmermann <tzimmermann@suse.de>,	David Airlie
 <airlied@gmail.com>,	Simona Vetter <simona@ffwll.ch>,	Takashi Iwai
 <tiwai@suse.com>,	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,	Harry Wentland <harry.wentland@amd.com>,	Leo
 Li <sunpeng.li@amd.com>,	Alex Deucher <alexander.deucher@amd.com>,
	amd-gfx@lists.freedesktop.org,	Lyude Paul <lyude@redhat.com>,	Danilo
 Krummrich <dakr@kernel.org>,	=?ISO-8859-2?Q?Tom=E1=B9?= Hnyk
 <tomashnyk@gmail.com>,	Wim Taymans <wtaymans@redhat.com>,
	nouveau@lists.freedesktop.org,	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm: Populate ELD Port_ID to identify audio endpoints
In-Reply-To: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
References: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Spamd-Result: default: False [-12.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,linux.intel.com,intel.com,ursulin.net,kernel.org,suse.de,gmail.com,ffwll.ch,suse.com,perex.cz,vger.kernel.org,amd.com,redhat.com];
	R_RATELIMIT(0.00)[to_ip_from(RL9y5169nakf5i7mj5a3kbj5yk)];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.30
X-Spam-Level: 
X-Spam-Flag: NO

On Thu, 05 Nov 2026 17:02:38 +0100,
Kai Vehmanen wrote:
> 
> The ELD Port_ID field (bytes 8..15 of the baseline block) is typically
> zero on Linux today: drm_edid_to_eld() leaves it empty and no in-tree driver
> fills it in. amdgpu, radeon and nouveau pass the raw connector->eld to
> the audio component. On the amdgpu DC Azalia register path the value
> is a hardcoded constant, the same for every port.
> Only closed display drivers fill the value.
> 
> Pipewire added support for "Port_ID" in merge request:
> https://gitlab.freedesktop.org/pipewire/pipewire/-/merge_requests/3025
> 
> As a result, when two identical monitors are connected their ELDs are
> byte-identical, and userspace (e.g. PipeWire/WirePlumber) cannot
> passively tell which HDMI/DP PCM belongs to which DRM connector.
> 
> This series adds a DRM helper that fills Port_ID with a common layout,
> and uses it in i915:
> 
>   bits 63:48 - PCI domain of the DRM device
>   bits 47:32 - PCI bus/device/function of the DRM device
>   bits 31:0  - DRM connector object ID
> 
> The upper half follows the layout documented for the AMD Azalia sink
> info registers (dce_audio.c: "PORT_ID1 = 16bit BDF"). The aim is for
> this to become a convention other drivers can opt into. For drivers
> that copy connector->eld to the audio component (amdgpu DM, radeon,
> nouveau), adopting it would be a one-line change. Comments from the
> AMD and nouveau folks on whether the layout works for them are very
> welcome.
> 
> An alternative would be to fill Port_ID directly in drm_edid_to_eld(),
> so every driver gets it without changes. I went with an opt-in helper
> to avoid changing the ELD contents seen by all drivers and existing
> userspace at once.
> 
> The value is exposed to userspace via the ALSA ELD control and
> /proc/asound/cardX/eld#Y.
> 
> Kai Vehmanen (2):
>   drm/eld: Add drm_eld_set_port_id() helper
>   drm/i915/audio: Populate ELD Port_ID

Reviewed-by: Takashi Iwai <tiwai@suse.de>


thanks,

Takashi
