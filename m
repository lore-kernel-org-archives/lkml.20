Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616047;
	b=yNG8dgQ4r8uyAEYM3Skwe6VjsM6Gws0Bv+HSXmQdrLThtdsZEV84Ma5t1H2O+AoOhLZw
	 xF9IBo1IPfMH/tyqeGCOoGHHmtqvi1T3wiKT3+56OkfERbvJNyc2/m/zjy/V7jho0VpjL
	 GAMgOwZWMlQli2n9NyPZrNZ51/IMHBfgUOMOeZ8gViSI1Wy0BhmTdIqZwHZF1l015AdRy
	 bkxk5GBjiYAUaTDEchpwp4gi5Wa7xkBy6UgQyCpSPdOqS8K9bWdAW/eI/8q8NKn1AGgYG
	 VPZzieiSY++3R7TRuAZZ8R7K0ViAsYYMmsgYd2P9EufR5n+oxHfsYt8t/PUB+XvNpCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616047;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=B71Xd6UyOF57DY2iYcCZYgvbSQL/W1nl16YQ6e8+bhU=;
	b=OFvRQEf1GPcUgX8UL7jJ4Dv+0PwCg34kTCpZDDBflb1q4s1VoubfUumJoIBLNIeSpY3P
	 yP4aMyEIKQTedeG/CmcS8G6+erI8Xmb0olnqdwXABshSjxFxCH165tmdk3pbxi2vCB17G
	 emLY4lNGX0q6IKBDXQ9/bu1vU6lmbDkRFyLv6TdJJA6kEwvAxG40Tohvw4W1qg9EmTF3f
	 3YS55SbvGPxruHbArQ90eq3YLZq7nEyzQ5MLc2/TyNLbCxM2fnQC37SPH+2hwEDRiuRn1
	 WWd0AooooT2FICMioIuNY0azLCfgBcSSAua3u2+HKNW/4whPfV2egZ2tKd+uZrW3aaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sakamocchi.jp;
	spf=pass smtp.mailfrom=sakamocchi.jp;
	dkim=pass header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=Y79+lkrF;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="b/wjp06Z";
	arc=none smtp.remote-ip=202.12.124.144
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F5A606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:40:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F5A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.a=rsa-sha256 header.s=fm2 header.b=Y79+lkrF;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=b/wjp06Z
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id D0C6C1D001EB
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 05:40:45 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Mon, 02 Nov 2026 05:40:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1793616045; x=
	1793702445; bh=B71Xd6UyOF57DY2iYcCZYgvbSQL/W1nl16YQ6e8+bhU=; b=Y
	79+lkrF3etg1kTy3PkvV8rzw/c7NnkkBD+dV7QbmOGEMPpPStne/muvphOBJaaFa
	jiD7ajRNKosdQVE2g+tcmNxkjtMn0O2lGU6MrzUu/V0zL0TaugbHlaf9vgAC44jz
	+K4PDHnHXKvg8N5m9Zj6A/mxK37Lh5JXYGmJ1aN1cSzmXG9CIPux2TcoRHzQ026W
	LtH6ujyxOxDxiCUzKAuNl1NOeqRUlw4pospQSYctBQLHLVGglWBOOPTyuowbmIaP
	N8Bns/FFrOkadtJ4NzZdk4Vo9eo/56kc/I3FB/JqGDZxCZzWLAIPm2a5z002MkME
	E7+Vw5ehCgL4Cdb+qdrag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1793616045; x=1793702445; bh=B71Xd6UyOF57DY2iYcCZYgvbSQL/W1nl16Y
	Q6e8+bhU=; b=b/wjp06ZAXrprvNDZNfb6liLt3hUN49q7/FgPMaeyeMidfjkeCs
	g5iurX3U1cT/1in3Ykwe942ESqTymEEwNmAo8TIvBf2wGNW4yLslf9TElhDewKXi
	rK2tKLRFvzXkQbstuH3j+knbLtOrYxPSjZ1OULaU9DASB6V+Bh+yU2rjYEwF4iFa
	1P6KvKIEQBbtgcS+Crs61wnyT8LynFV8nLsMd1ORKC8VIw8zqVcwaFKHbD5spWtb
	xTFVfcrHiSgjL5trUm3tLE/cMuitgzjeAl/C+vlJJfz+ku/s0HgVg01/kjGJNnqC
	9zHkGNRpfDDp/FmDtAwjJk/rPG/h46RURSw==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=sakamocchi.jp a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793616045; d=sakamocchi.jp;
	mf=PG8tdGFrYXNoaUBzYWthbW9jY2hpLmpwPg==;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:XUctqr0kgc5hVyaSngKbw5iTYAEH7A0UQ8wY9iycv0WgXk0
	5Jpi8Qd6FiCgLxuVCREnMu1KNJIVQyi813c8622GIUADeaeBCLCpMfAex6gLHFsm
	w4b5MrbpA8KgLzX9lLViXP8xmBAuJH/ZzBo4fJofogthfeqjBxibJtAqD//7cGvs
	0JyJxCKb2g6QntFscKPTXxSPbEMcaJZaUhc5Fu9tBGRHMnwrTwqWOWZVLCjX//4w
	le/nHqigxF4fbCKjXn4iJ7MwtAnMhJjoCDNlQ6reBGBrp6nb4bSVwpFcprINZmdK
	bT2dvMO5qOrM/FHixKLvtDvEp/gO2En8S3geb4w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-type,date,feedback-id,from,
	in-reply-to,mail-followup-to,message-id,mime-version,references,
	subject,to;
Message-Instance: m=1; h=sha256:ptFdBiRHV/C5Z0CR4NxbDkuZerAVaPEUR1NAxkpTuMc=:JRNqh/JzySAef0qQTpGh9srCMxR32N54txgnNvvAwEk=;
X-ME-Sender: <xms:rWjoanwlCoeF3-oqL8Rmz5ecX3hA6KUImQCfsD-dc9uWIKQeHwq36Q>
    <xme:rWjoatOmKdshVCfgC-NOXMNodgHP4H41lQBSMbLhvKWxjY7u_Z0_LF9R3QNuDde9c
    2HS14D5T5t-ih_UAtKfThRGQSSFQT7yHd_ilEFIeaSIzVqmTwvfM0LZ>
X-ME-Received: <xmr:rWjoao4X6Gp_y3iMljF3Mq0LDevVykIKnvs4PZGom6gr17Al-Q5Ggx4AezY-vgu4TaJbXl9QXPa5RUTBy_oNmuaQlw1huw>
X-ME-Proxy-Cause: dmFkZTF5tOr3kw2gJzofWzD3JSLwMYgMEEpeGBA1gYJRy0b+pVVwNGecxqr8VZKt53OxGr
    GIkRsW2rdes1ZCu8tdm/QAXUSpmstmBKYb/pejNE7pWGvK7sOm8Qgdhaerx6Cnds8IwdKR
    iA8lLT4Uf93A5Jz/BjsT0bv/Y5CA5MdMq+Tnnl906JJuI4pWqQY9a0j5FeEJdBuzizMQtE
    O0pPrmJnKIXOfrU0NGsOY7gAF/td6N1CHghZkTR2l8ZZCz+oM0jwvetzf1a2nT28D8RI1j
    rvw8NPmJgJbQmm9Af/uIjTOFTHMYO8fDQKcKO6ru9augWI3TVaXbfm3Aib92F0HqtPgYPa
    h0tuzph1G9Sm50li5tShdeFsyWCscuyp8jSgyO8fwTRQianVSXsvA/noNDcaAqt3bqU/IK
    HjMmDgsWK4nlnzfK6zD5qnz20Fn+LytHtFlNiLvTXazj3tEspTgMuylFf6z149cky2g5hS
    IhSiXASx8RlIWdhssorPM4JD/Rs2nec7V1u2+99Gqmq8tZ8ntq0CghLPehW6pciNNbSlAU
    9ljt8y6u0Dqa3PxJXl5J3I81NVqm9RwSYs15UFRFf0YNTJOw1UlFeV/bs5+6Nv3e9RG8+3
    +3ANs2jDN8X1XhvQ//F5xn0aPS8oUhdOtDtPOqNL9wIu3FLV+imPtKvoCB7Q
X-ME-Proxy: <xmx:rWjoauOGe4LAjquA379EYMAFoHoYProC7OocrCSapISy3FIMIZfykQ>
    <xmx:rWjoamkToZhXz0ISG0Ctv9RVRfXhMpPaJJFZlElO9y_afGTDX0UXuQ>
    <xmx:rWjoalSRo1jwrN31gTFA9TxI6dLbXdHhVKbn2z5EcgnHi7H5fvb7EA>
    <xmx:rWjoaiBhJLiTdDgdv3cVZEqHd1_hILrz7MHK9axiW2swmUzVDQD-Bw>
    <xmx:rWjoavleaxUDWBju8T9J0GfrlS1zH-Wgolcm588H6BoXUavcmW7LFaQy>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Nov 2026 05:40:44 -0500 (EST)
Date: Mon, 2 Nov 2026 19:40:42 +0900
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] firewire: cdev: add context analysis annotations for
 isochronous context
Message-ID: <20261102104042.GA1197999@sakamocchi.jp>
Mail-Followup-To: linux1394-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
References: <20261102041913.1187814-1-o-takashi@sakamocchi.jp>
 <20261102041913.1187814-4-o-takashi@sakamocchi.jp>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102041913.1187814-4-o-takashi@sakamocchi.jp>

On Mon, Nov 02, 2026 at 01:19:07PM +0900, Takashi Sakamoto wrote:
> A client can operate on a single isochronous context at a time. A mutex
> is used to ensure exclusive access to the context.
> 
> Use guard annotations to describe the synchronization requirements for
> accessing the context.
> 
> Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
> ---
>  drivers/firewire/core-cdev.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/firewire/core-cdev.c b/drivers/firewire/core-cdev.c
> index 512afa589e2e..418b72cb8835 100644
> --- a/drivers/firewire/core-cdev.c
> +++ b/drivers/firewire/core-cdev.c
> @@ -62,7 +62,7 @@ struct client {
>  	wait_queue_head_t tx_flush_wait;
>  	u64 bus_reset_closure;
>  
> -	struct fw_iso_context *iso_context;
> +	struct fw_iso_context *iso_context __pt_guarded_by(iso_context_mutex);
>  	struct mutex iso_context_mutex;
>  	u64 iso_closure;
>  	struct fw_iso_buffer buffer;
> @@ -1129,8 +1129,11 @@ static int ioctl_create_iso_context(struct client *client, union ioctl_arg *arg)
>  static int ioctl_set_iso_channels(struct client *client, union ioctl_arg *arg)
>  {
>  	struct fw_cdev_set_iso_channels *a = &arg->set_iso_channels;
> -	struct fw_iso_context *ctx = client->iso_context;
> +	struct fw_iso_context *ctx;
>  
> +	guard(mutex)(&client->iso_context_mutex);
> +
> +	ctx = client->iso_context;
>  	if (ctx == NULL || a->handle != 0)
>  		return -EINVAL;
>  
> @@ -1149,12 +1152,15 @@ static int ioctl_queue_iso(struct client *client, union ioctl_arg *arg)
>  {
>  	struct fw_cdev_queue_iso *a = &arg->queue_iso;
>  	struct fw_cdev_iso_packet __user *p, *end, *next;
> -	struct fw_iso_context *ctx = client->iso_context;
> +	struct fw_iso_context *ctx;
>  	unsigned long payload, buffer_end, transmit_header_bytes = 0;
>  	u32 control;
>  	int count;
>  	DEFINE_RAW_FLEX(struct fw_iso_packet, u, header, 64);
>  
> +	guard(mutex)(&client->iso_context_mutex);

Sashiko reports that get_user()/copy_from_user() under mutex locking can
cause A-B/B-A deadlock between the above mutex and mm->mmap_lock.

https://sashiko.dev/#/patchset/20261102041913.1187814-1-o-takashi%40sakamocchi.jp

Let me rework for the series.

> +	ctx = client->iso_context;
>  	if (ctx == NULL || a->handle != 0)
>  		return -EINVAL;
>
> @@ -1252,6 +1258,8 @@ static int ioctl_start_iso(struct client *client, union ioctl_arg *arg)
>  	    FW_CDEV_ISO_CONTEXT_MATCH_TAG3 != FW_ISO_CONTEXT_MATCH_TAG3 ||
>  	    FW_CDEV_ISO_CONTEXT_MATCH_ALL_TAGS != FW_ISO_CONTEXT_MATCH_ALL_TAGS);
>  
> +	guard(mutex)(&client->iso_context_mutex);
> +
>  	if (client->iso_context == NULL || a->handle != 0)
>  		return -EINVAL;
>  
> @@ -1267,6 +1275,8 @@ static int ioctl_stop_iso(struct client *client, union ioctl_arg *arg)
>  {
>  	struct fw_cdev_stop_iso *a = &arg->stop_iso;
>  
> +	guard(mutex)(&client->iso_context_mutex);
> +
>  	if (client->iso_context == NULL || a->handle != 0)
>  		return -EINVAL;
>  
> @@ -1277,6 +1287,8 @@ static int ioctl_flush_iso(struct client *client, union ioctl_arg *arg)
>  {
>  	struct fw_cdev_flush_iso *a = &arg->flush_iso;
>  
> +	guard(mutex)(&client->iso_context_mutex);
> +
>  	if (client->iso_context == NULL || a->handle != 0)
>  		return -EINVAL;
>  
> @@ -1937,8 +1949,10 @@ static int fw_device_op_release(struct inode *inode, struct file *file)
>  	scoped_guard(mutex, &client->device->client_list_mutex)
>  		list_del(&client->link);
>  
> -	if (client->iso_context)
> -		fw_iso_context_destroy(client->iso_context);
> +	scoped_guard(mutex, &client->iso_context_mutex) {
> +		if (client->iso_context)
> +			fw_iso_context_destroy(client->iso_context);
> +	}
>  	mutex_destroy(&client->iso_context_mutex);
>  
>  	if (client->buffer.pages)
> -- 
> 2.53.0

Regards

Takashi Sakamoto
