Received: from smtp-outgoing-1603.laposte.net (smtp-outgoing-1603.laposte.net [160.92.124.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CF341C2FB
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.92.124.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791362791; cv=none; b=Pg1L+HXYc2lrNjRfu/PtTg4WmZiVoJ2XfcZM5CdGaqvZZG8rSn6gRVxgYhwWKuOwOIqiyMxbJtlK2MxsFdHsZAMsCdNNhnLXIKjJeqnJPBZqybmOnETvTXAnnYQnoIzPZpAATSZq5XCHyHhO4IIY3Y9Yj/Kk6swU4okX59SNjxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791362791; c=relaxed/simple;
	bh=SpLsBqXRCfy4Rr6a3bJko71zXaFjAnrzF9A7JEZryaI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CZ+4UMlvnMAQ+qWqolXV9NAV2Iih3oaDaDsstbbgDCnzuyI4LCRKBSfIZAb4jl8jXqyheRzAiOqtQrKJAf0ksxV9u95zwJL1CwxuDFz5tvvF6CRx18hxcmNVxfQ3Oey6Z1tFzHeaBh0RACEj32lhMLgeeYAUe6YxMCkDX04Na7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net; spf=pass smtp.mailfrom=laposte.net; dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b=H5SPddMc; arc=none smtp.client-ip=160.92.124.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=laposte.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=laposte.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=laposte.net header.i=@laposte.net header.b="H5SPddMc"
X-mail-filterd: {"version":"1.9.7","queueID":"4j06D95YcfzjWvm","contextId":
 "3557f273-6794-4e9e-939d-a89cbadc7e2a"}
Received: from outgoing-mail.laposte.net (localhost.localdomain [127.0.0.1])
	by mlpnf0116.laposte.net (SMTP Server) with ESMTP id 4j06D95YcfzjWvm;
	Wed,  7 Oct 2026 10:46:17 +0200 (CEST)
X-mail-filterd: {"version":"1.9.7","queueID":"4j06D771qjzjWvW","contextId":
 "57e1faad-1bd3-450b-9ee0-ae141f1d44de"}
X-lpn-mailing: LEGIT
X-lpn-spamrating: 36
X-lpn-spamlevel: not-spam
Received: from [10.199.41.192] (unknown [165.225.20.187])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mlpnf0116.laposte.net (SMTP Server) with ESMTPSA id 4j06D771qjzjWvW;
	Wed,  7 Oct 2026 10:46:15 +0200 (CEST)
Message-ID: <41e65625-fb55-4440-825c-a47ed24800b0@laposte.net>
Date: Wed, 7 Oct 2026 10:46:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/display: let a bridge configure sink audio from
 hw_params
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
 Sumit Garg <sumit.garg@oss.qualcomm.com>,
 Shawn Guo <shengchao.guo@oss.qualcomm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, Saim Shujah
 <saimzst@gmail.com>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20261005131545.23219-1-jean-francois.bobier@laposte.net>
 <20261005161824.36445-1-jean-francois.bobier@laposte.net>
 <42emyzl5p3kpvq7e3b7npaaghl62r4skrpdflszk7v3jagexal@6jdg6h27eofw>
Content-Language: fr
From: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
In-Reply-To: <42emyzl5p3kpvq7e3b7npaaghl62r4skrpdflszk7v3jagexal@6jdg6h27eofw>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=laposte.net; s=lpn-wlmd; t=1791362781; bh=SpLsBqXRCfy4Rr6a3bJko71zXaFjAnrzF9A7JEZryaI=; h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:Content-Transfer-Encoding; b=H5SPddMcBNh3PZp+3kdov/qyuXhoaIuswlf9ObsYm6Kkmq8iQBTNsdIhnfT4TirHa29Gcx8dbJoKICbhpZjb4i+iYKvQaeaZ//pwXgK6O5BKNSr42g74s9VRmbik/dD7ZbsHQA7e1BiPoct5iIvF077sTdsdFUijV4r2fj3Tb9r/qgGEvCETwslcaOOue0cP/UDLICOo0XSVBDNqc53biT6LhyEhMD37aS/YQFT3BZLNTN64pUC+633Kg3LkVdA+gIs0kRUjc0iQoKQa76yceA1EoPF/jPPSqAFPNWWX3HMAVPtQaZYAp3xrgZDe5FIy1HKosg+BkFRTx0fDr8f4Ng==;

On Mon, Oct 05, 2026 at 06:18:24PM +0200, Jean-Francois Bobier wrote:
[...]

 > Similar changes were proposed several times already. The IEC958 status
 > bits are usually set by the userspace after the .hw_params callback has
 > been called. With your approach the hardware will never receive correct
 > status bits.

That's a real concern in general, but I don't think it applies to the
case this patch is actually fixing. hdmi_codec_iec958_default_put()
is optional -- hcp->iec_status already has a sane default from
snd_pcm_create_iec958_consumer_default() at init, and both
hdmi_codec_hw_params() and hdmi_codec_prepare() fill it from that same
baseline. Userspace only needs to override it for passthrough of
compressed formats, where IEC958_AES0_NONAUDIO has to be set correctly
before the stream opens.

For ordinary PCM playback -- which is the only thing DP/HDMI audio on
this board does -- nothing in the userspace stack ever touches that
control. I checked our actual UCM profile rather than assume: the HDMI
device there is a plain mixer enable and PlaybackChannels 2, nothing
IEC958-related. So the ordering you're describing matters for
passthrough users, but doesn't affect the case I have hardware for.

 > If my understanding is correct, a more apropriate fix is to make the
 > a6afe driver to emit AFE enables at the .trigger point instead (maybe
 > together with other commands) or to split the DP audio init, moving the
 > necessary bits from the dp_audio_prepare to the dp_audio_startup
 > callback.

I looked at q6afe-dai.c before replying. It doesn't implement .trigger
at all today, for any of its port types -- HDMI/DP, SLIMBUS, MI2S, TDM,
WSA codec DMA, USB all go through the same q6afe_dai_prepare(). Adding
.trigger there to fix DP timing would change behavior for every one of
those, on hardware I have no way to test.

The startup/prepare split is narrower, but I don't think it's free
either: .startup/.shutdown are tied to device open/close, not to each
hw_params/prepare cycle, so I'm not sure it actually survives a
suspend/resume any better than what this patch does -- it may just
relocate the same question rather than close it. Possibly worth
someone who knows this driver better confirming either way.

Given that, I'd rather not drop this while something that actually
works waits on a rewrite of a shared CPU DAI driver that doesn't exist
yet. Happy to be told I'm wrong about either of the above if I'm
missing something.

 > Please take a look at Documentation/process/submitting-patches.rst and
 > likely Documentation/process/coding-assistants.rst. For example, don't
 > send the new version of the patch as a response to the previous
 > revision.

Noted on the threading -- that's on me, I'll send revisions as fresh
threads with a link to the prior version instead. I'm not used to 
mail-based workflows like this in my work :(

Please let me know what you think - the patch does work on my board and 
brought up DP audio 100% working, but I would understand if it's not 
worth upstreaming given architectural impacts. (The bot seems to have 
found other gotchas on my v2 patch already so I will hold off until it's 
confirmed it's worth upstreaming at all).

Jean-Francois
