Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42C6C381AE7;
	Thu, 17 Sep 2026 16:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661741; cv=none; b=oq97wyBpSgC5jYg52ALG1SwV6rI3rzI8HBF8Gs47nJAbQvtJWOGqZ6O1UAsGie9QevJwZWLzh/X7QruLCrZmALth6tgjZDvVECMIiF7nSq25YTeG3PxNDRFzC/egq9CUPlzUKkcOIzOd+aAOaUGx2vF9K8uvDwdOE2szqpOmXIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661741; c=relaxed/simple;
	bh=rI/8Pz6h+diYTCye6fa6RP84XxWcf9U6BehJPn1nm8w=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WpRtuTwxfUuQlQ2GxUdp/0IkCOYEB9eRjyTY5VNrlWUJi1Zs+67HdOHId97baWOUhQaLiaDj/PwoxmC4dHuatvtkmBYGJwBzhoprHH06raKQSBxbLEUYI8i4ah/XbhzN5dbfzBksx+e/Dj8EXHJd2Jx06shw98nWe2hB+T9uNDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=VS8mKE8A; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=jocF0JM3; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=XMuRnppN; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=psl5J9fR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="VS8mKE8A";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="jocF0JM3";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="XMuRnppN";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="psl5J9fR"
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E9C931FF45;
	Thu, 17 Sep 2026 16:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789661734; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAOsSnNn8akeKB/ds7/zHQ5IKx4yF7rHl8dELuZ67fU=;
	b=VS8mKE8AIgQVy30TUt3f+GxDlfrsSkH8B9nKKukCEM9cs0RTwkuXrrclG8Ud4WdzoF49xF
	n2rjLxZYgP7soudZHtpujcidfko2bzw6gcEHvmi+tDCca8gFpjW0UJ6NafYtNOpWqGqbBJ
	2NC3u9UyxExqzIteUP22MrAgcNyXWiA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789661734;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAOsSnNn8akeKB/ds7/zHQ5IKx4yF7rHl8dELuZ67fU=;
	b=jocF0JM327LmxNCME7AjyA6cWC5rXKmO9FdFuya0K3NdoTIipR5P2Aet0sCPs2CV43xZBn
	Nn9dVbRfquOkpZCg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1789661729; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAOsSnNn8akeKB/ds7/zHQ5IKx4yF7rHl8dELuZ67fU=;
	b=XMuRnppNjKD+Qnv2Rg9QqQjDLu0/CXMLi9hABGRAoMt0W4aZBaNLEw4BCWVqT6TtVskucN
	ezjOSIvR6/xWscZsEuP7dt/XFUycNRtiKc0F0inueI7WSRFXYE7RINRD0jJPolXEKjPYlg
	r4WXuXbq/Cdq2V2XGYPgnQj4fLFxeSs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1789661729;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nAOsSnNn8akeKB/ds7/zHQ5IKx4yF7rHl8dELuZ67fU=;
	b=psl5J9fR5EiXu+f5gEb5eI8Jw5CT70GZ6xC3zA1SazI20uCmZq0UTGqJTWUc9ZmdEs1Y/1
	IpZ9qWVJed+iUvDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9BE6A134B3;
	Thu, 17 Sep 2026 16:15:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V7J9GiESrGoUegAAD6G6ig
	(envelope-from <tiwai@suse.de>); Thu, 17 Sep 2026 16:15:29 +0000
Date: Thu, 17 Sep 2026 18:15:29 +0200
Message-ID: <87se37g8gu.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Zipdox <zipdox@zipdox.net>
Cc: Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	linux-kernel@vger.kernel.org,
	tiwai@suse.com
Subject: Re: [PATCH] USB Audio Class 2 Mixer unit support for GET_CUR, SET_CUR and RANGE
In-Reply-To: <05a53b37-8de3-4075-93c0-21129a839356@zipdox.net>
References: <d46fcac6-bd7e-4fc4-95e1-4e8d39f92ad3@zipdox.net>
	<87bj9yn55n.wl-tiwai@suse.de>
	<59b3dc9b-f324-42e7-ab03-a01c04e8b915@zipdox.net>
	<8733vamwaz.wl-tiwai@suse.de>
	<da56664f-901e-497b-a74c-ae41cbc5cac4@zipdox.net>
	<87a4phjjay.wl-tiwai@suse.de>
	<8733v9jfp1.wl-tiwai@suse.de>
	<87y0d1hx9y.wl-tiwai@suse.de>
	<895b9e3d-bc81-4688-8513-8aa42d40e4fa@zipdox.net>
	<05a53b37-8de3-4075-93c0-21129a839356@zipdox.net>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spamd-Result: default: False [-3.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.996];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid]
X-Spam-Flag: NO

On Thu, 17 Sep 2026 16:54:50 +0200,
Zipdox wrote:
> 
> On 9/17/26 4:23 PM, Zipdox wrote:
> > 
> > 
> > On 9/16/26 8:22 PM, Takashi Iwai wrote:
> >> 
> >> ... or maybe a less cryptic version like below.
> >> 
> >> 
> >> Takashi
> >> 
> >> -- 8< --
> >> diff --git a/sound/usb/mixer.c b/sound/usb/mixer.c
> >> index 33a6a1281410..c6639a45fb24 100644
> >> --- a/sound/usb/mixer.c
> >> +++ b/sound/usb/mixer.c
> >> @@ -335,6 +335,16 @@ static int get_ctl_value_v1(struct
> >> usb_mixer_elem_info *cval, int request,
> >>       return -EINVAL;
> >>   }
> >> +/* convert the given UAC1 wValue (ICN+1|OCN+1) to UAC2 MCN */
> >> +static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
> >> +               unsigned int validx)
> >> +{
> >> +    unsigned char m = (validx >> 8) & 0xff;
> >> +    unsigned char v = validx & 0xff;
> >> +
> >> +    return (m - 1) * cval->num_outputs * (v - 1);
> >> +}
> > You used multiplication instead of addition for the last part. I
> > assume this is a mistake? Also you should probably also bitwise and
> > that with 0xFF to make sure it's not more than one byte. The product
> > of the number of input and output channels must be no greater than
> > 256 according to the spec. I don't know if this is checked
> > elsewhere. Other than that it looks good for a patch to get it
> > working. I'll try it out and send a follow-up email shortly.
> > 
> If you fix the code like this:
> 
> static unsigned int to_mcn(const struct usb_mixer_elem_info *cval,
> 			   unsigned int validx)
> {
> 	unsigned char icn = (validx >> 8) & 0xff;
> 	unsigned char ocn = validx & 0xff;
> 
> 	return (icn - 1) * cval->num_outputs + (ocn - 1);
> }
> 
> then it works correctly. As far as I'm concerned you can merge that
> as-is. It would be good to try on some other hardware as well to check
> for regressions though.

Good to hear.  If you have a chance to test my last series of patches,
it'd be appreciated.

BTW, I'll be off from tomorrow, and the issue is no new bug to be
urgently fixed, so I'll handle after back to work again :)


thanks,

Takashi
