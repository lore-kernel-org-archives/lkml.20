Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2634968EE
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 17:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789405698; cv=pass; b=seNx4q7sen0cXym1sl+TD6h4kNJ2BA/psdbX3z/FMOPsumeNqr+Jl9LTz+3k3kyOiDTj6/4GjaaaTcOCEn1XfoFeGI6nMd7R27UtpVxzc2hy2xl5EqbESXyXYgOfwBcYxCuD6ztzYOo+jvdLW8w8JNEwf8w0q/WsammeH67JGHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789405698; c=relaxed/simple;
	bh=dpYoff2UzJF54DLTAnCpmVmIrYHi/pZZ/RdTFWYirUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dnRw62mbN2Bamfo0iE0C5B/hQY/yS9rqVhe0kEifXe/IhA3JrC1E/5oeQ4qTNgzpU9RdP69xwvD6bI7nJ4xwiIOqT5aMeURy+l6PT9A4+rBEfIZrHeOg51YiEMWxKSGPJNyeGPoUlTP2xineYRAc6BIj1ju0HiG5i/k+P4ENmIQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=H7/bhH0t; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="H7/bhH0t"
ARC-Seal: i=1; a=rsa-sha256; t=1789405646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Edlam33l1X0WI1OrB7u2Oi2y4BDkKlma8QjA02JvSoaDxpCa92P/CCtUkM16iKiJx9M7DYtg86KhuipKWOJQvzDTNeyeodYwJhhFXDRbUhUWpbd9TFoh4LjLMzVIsU+H36ZMvSktV3SfeKTEBeAqOFeMeK25RGsuUeQW986dtkc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789405646; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+angtaWnDipQewgGz9mUegs+98WHwzGZawVa6NY7uGc=; 
	b=LPNxssC28lKjfWdU8WDWwBoYFepkrqhrMfFW6eWiD6kKWjmgHtgd2y6Vjg684Y1IVpBsZm/f1chPLwaOy3Cdp/0/0uTGBPStOAsED0ZPugdJZ0Hg9BlmCmHPdariz5scbgT4HLcoCUGDcfdiOD+Ah13Tr/pg2Lg3vQ+nyUB85Zs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789405646;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=+angtaWnDipQewgGz9mUegs+98WHwzGZawVa6NY7uGc=;
	b=H7/bhH0tH3/76qPygUPmL4xEqjOXzbIP20K2eJgFNDrskKak1+9ZMBsWZQOHjc1e
	hVrFKHf6f7ksMGiPzhmSf2DbgcQj+Qq4TEx7qteiSFn/FLKpd90IAS9twFhPRPJP5XR
	rFjBmWErxwCGnP1kCJCvGDfNJ8By2okwkPx7U8RY=
Received: by mx.zohomail.com with SMTPS id 1789405645288547.3965894530555;
	Mon, 14 Sep 2026 10:07:25 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Maud Spierings <maud_spierings@hotmail.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Frank Zhang <rmxpzlb@gmail.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] drm/bridge: dw-hdmi-qp: Return -EOPNOTSUPP in HDMI audio
 functions
Date: Mon, 14 Sep 2026 13:07:22 -0400
Message-ID: <5kr9i6ZJT46mREykuuT_Jw@collabora.com>
In-Reply-To: <20260907153000.hdmiqp-audio-2-royalnet026@gmail.com>
References:
 <20260519-fix-hdmi-audio-warnings-v1-1-9608966c993f@collabora.com>
 <20260907153000.hdmiqp-audio-2-royalnet026@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Igor,

Thank you for testing !

On Monday, 7 September 2026 09:01:30 EDT Igor Paunovic wrote:
> Hi Detlev,
> 
[...]
> 
> One more reason I think this and Frank Zhang's patch [1] belong together:
> since the startup now fails, ASoC never marks the DAI as started, so for
> a PCM opened on a dead link the close never reaches hdmi_codec_shutdown()
> -> dw_hdmi_qp_audio_disable() -> clear_audio_infoframe(). That is the
> same class of bug as the SError we hit here on 02.09 (PCM closed after a
> failed prepare, register access with the PHY down -> SError, panic; full
> trace in [2]). I can't be certain this patch alone would have prevented
> that particular crash - a PCM that is already open when the output goes
> down still walks that path, which is what Frank's guard is for - so both
> still look needed to me. (I saw Cristian's question on v4 about
> open-coding the clear; either shape works for the crash I hit.)

Yes, Frank's patch is still needed, this is not fixing the SError, only giving 
asoc and userspace the right error code.

The situation you describe on opened PCM that goes down can indeed still 
happen (This patch may just decrease the probability of seeing an SError)

> [1] https://lore.kernel.org/all/20260512103153.8861-1-rmxpzlb@gmail.com/
> [2]
> https://lore.kernel.org/all/20260907153000.hdmiqp-audio-1-royalnet026@gmail
> .com/

Detlev.


