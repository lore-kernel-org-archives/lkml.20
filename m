Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.215.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793880413;
	b=IXlnSW9PLzGeA9KFwVbFgvU4dUpDsWdqjNJd4S4CWdZsCV2F9qy3/wUXK+vEmDX99q/C
	 rHW4lTWf0LK/XaXvlYBzSzmmh1UhPFsM2Um6lBN3JMZLRwbNviupe4wMx+0Ug3X7Z4PNf
	 CTPOmZwpLn7E6ujY/FTVWZzvXmRnCC5UuvxIZaUbaiyg93ShddO7nCmvhg0ZOZJAFBecz
	 2/UWC6JaxLVfHGYXzWYYMk6eYaWqeTpqFZQQybTg5VnuOQWsWn/9J0BWADpUvqmaHKyON
	 HvZL+AcLIpr/BVeSRpypubHjK54fOIXNeAT7l4lgDObgvC7qvDQqKUgHK5aWQH6iarw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793880413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
	b=1OzSNSOogCgf85rjRY0p5N74koJGimuXpDxtVHNap6gnJ2/1HmEN9MB4VupmNfKFg3Hk
	 LQpFJHfjvnVNa2vjjsm5yiXhJE9kN8BFJTAnK1CvzCUEd+bxGCYb/52BElpc9z/3gLs2t
	 jeI3TC9/iSwDfOcx/vQk+26Tv+g43ahqwycZbCe12SPNwBqPvRfZYeuW8ypH/qYxhJace
	 VLtR5jtGqbzuosef+QenHHMgBfn/qWSMuHMompMod3dmJxuor0i9KegZhIbNG/DDpbE0/
	 uMlAiRDIDncCuiksWVvOo0fKeHKXP/Pd+PoNy+X2Dli/NhCl57P9HDPcmQSwJiYdn0w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=fooishbar.org;
	spf=pass smtp.mailfrom=fooishbar.org;
	dkim=pass header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=nerl2VMh;
	arc=fail smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 867A0606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 12:06:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 867A0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fooishbar.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=nerl2VMh
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd8ca57ef64so232095a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 04:06:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793880412; cv=none;
        d=google.com; s=arc-20260327;
        b=X3Ec+lGaYm/e7G1+XoJYsvnLpUGzpuASAkgDD+kXQbQMMO0VrsTbyUCCzRxSm3ooas
         ONuLS6mwAr6hJh93X/eEN393thaiFyN2HqQKywoW2TruYD+KoEbs6fdSjBdlmxO19qVl
         s7OLBZ0CJFK2qwEFyYEXMrTKvndh8yQgS/GQX4StVaRPxu056XMgaep6eAAtYujMXrZ/
         1xXpw+urJTIw+S4AfusCQPXM0WjiRLMvMp94P40HThgND4egMqUEnsnkJStLsyiGZ3gs
         VQslZz/6h4SE6OoowQH1Bbsek2ABWB82zSS6sGSlviEht9PiKnjUSmH/ohkSjTwlM74j
         DAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        fh=TjWXnHjpGUDknQmCz6Nfcglr1f1pPDZkKVZd3NrwO5s=;
        b=nvCWLyu4BqlhLyAQeBlxDh0yn/y+u46TM1QDnuBYxHi8l4EUfhoOWcxvPaeE4uSija
         t+OPEfeU2jKrvqRk4LFzT8awTr3q+XRxdi+UPrXTugUnm4AcVAKVPyopvECeaibS8rrw
         eyY/6s+n8P+uAhgFal0StzHKvBGOANv2aOkHAKQSUyrH2iJpkypThLa31DXEtFbxebTO
         84WwRS6gk6nYeEgKJsAevS2+57xXweViUjrdCp5rjcRJ/LejV5ezZ4Xq53uTLV+X9S2u
         7L5jZ239UV5pCDFCicL4wP16Vx8Na4TKyb95qyc6JKpR4ljvPKpP862HwecsjrKf51JF
         M/Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1793880412; x=1794485212; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        b=nerl2VMh4VAzCzn1gPQetp7gLHry+Oo4GJEgU0dqhH6kHKg4JgeucS3GmPOVKBX68Y
         A6hzIRRZZC9smxgV6Z2Q6tYTEjxkEGad6zOuVJTT4fkpJ91mPn6iIh8cuxXZDsNJ8EgI
         vqyt+rc6RvDlk+/CQnvPqBn1HHAq8hc0YkwDMhL7YQ8INoleA2u3So6BtwtlutUwjP0o
         rF9kjuY2DAo/EL5q8w5tjlW6cjiBbOu1ghuJWyt1dKSaxiuAed5pfK1LgYbj7bjswaV0
         CGiyXLzDoUTocbPN4IFKqXYZ1bOgZsG02qZTgUcwRJ1EXEUEgDdJcGgn8B5tJ+cqJwOp
         4sQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793880412; x=1794485212;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SIhqbZ+2HotYam7MjDXog6M4P1fIwOCZkrn6io6yVIg=;
        b=RwXuFcyT7g8/fSbRJekAC4n4hiAS8WENfuc6KVydSPCtsMKX6EiYZlEFu530XZd28q
         wecvExucJXTbwS+N0s+yMs28EAUBDSFQf4QdvWWebd9Xkr7y/Y9VwbL9XTYSQzbXsHcb
         uV+qujcgOJAXMQKx/HLNwNXigi1MOShGHwkUQcxKhpwndbOB0ZXuRHSPQawT7U20dp56
         r928rMQttYJz5mUqKeDaIi7HNsfNhSryYWrXkrfcxGKlztwdTLY+aFMrNaWB2ff+Gwvr
         yyIgESet4AcwQt4MxKUp+XPe9s5v8ajy8NCRMCbEBDCW9L81lgSam2p7QD7XLUDHg0le
         DQ+w==
X-Forwarded-Encrypted: i=1; AKwUvBwvE2gsdVinZgQQ7fJ+i0llALr9NVZetglGxTWah6IkbM2rDXWGpl3E8pzRphRFqFEmFVcuQGVrRw0Mp4I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/stPdCmcRnVJ11A4wgLGDhLfQgTNlJ07nwfiv4EmvzMSh4EQ0n
	YYY+wgGJzOcH4RBxNhUlD/f4MiHrWeOQwd7FhpmrylBAbUOZ/iw9IyKVFyySsyQoyfgfG5f3K/D
	4ClywJRAaV80eHowkVWU9G/5dIRDH1OCLnvDFHkf6PQ==
X-Gm-Gg: AYBFou3hWqp5IJ3Kfk9/3xZkts4+rIApRxfHJwVUb7hwt5GE/r/kGW+DN26mq1AkJ01
	ozYb75kR9IGFp/envrb/VyoOW/S/8gdzdqHN4GssuKR0awJLdCWhuDgepTVru57logD6Gj9fGe0
	dIJdLwcorNoAu0Bj9lftOIc/cnvs52bINlJbxgRWhPOI7/7cSxa0KcVak3PzJFt2PeUYioxmBP0
	WsczHWcmtNIWSaIMHglk/vd8nKSBTyaHAG/hmh4vuBBQPnlzb7VeUmkEdgBc2UO9uZ7t84yaoL6
	lrrTT9PV+tre/0jOhgrXf2cUM3DEbWvID11rJ9Rw+nuEr3ujxXmXzZsATX2x80lqxsahXwlvIN1
	HQvZRBYyCxn1adk7O+kH2niPrUPu8e/EOcVlm
X-Received: by 2002:a17:90b:1fcc:b0:3ac:7406:b49 with SMTP id
 98e67ed59e1d1-3b0afc29351mr1335407a91.15.1793880411843; Thu, 05 Nov 2026
 04:06:51 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014-dw-hdmi-qp-yuv-v5-0-6fab0fe43a9b@collabora.com>
 <20261014-dw-hdmi-qp-yuv-v5-13-6fab0fe43a9b@collabora.com>
 <CAPj87rOMjFEjOQ9TVgbGWu3gTwVjmjuFNtnFiyxbWO+g_RPqeA@mail.gmail.com> <f9797a72-2fd0-4127-b741-dfc6cf3306f1@collabora.com>
In-Reply-To: <f9797a72-2fd0-4127-b741-dfc6cf3306f1@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 5 Nov 2026 12:06:40 +0000
X-Gm-Features: AclHuK_ucWApughnWJGAl5cPjcPtGno9PpRPUGuTDrBVFiQWtpP0tMXmnOOScVE
Message-ID: <CAPj87rN0944v4OyeJ+VNn5QBsnPsjGJUvNqiFmQFsO_wakOX=g@mail.gmail.com>
Subject: Re: [PATCH v5 13/15] drm/rockchip: dw_hdmi_qp: Support 10-bit YUV422
 output format
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Daniel Stone <daniels@collabora.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, kernel@collabora.com, 
	Andy Yan <andyshrk@163.com>, dri-devel@lists.freedesktop.org, 
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Igor Paunovic <royalnet026@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cristian,

On Wed, 4 Nov 2026 at 20:56, Cristian Ciocaltea
<cristian.ciocaltea@collabora.com> wrote:
> On 10/30/26 1:52 PM, Daniel Stone wrote:
> > Same question as for the VOP2: why only special-case YUV422 when
> > YUV420 also needs special treatment? And presumably in a way which
> > can't just be mashed into bpc, because the maths doesn't work. So
> > would this be better off being handled as a separate output-mode
> > adjustment?
>
> For YUV420, the halving is already in the TMDS rate, so the PHY PLL output
> equals the halved VOP2 DCLK - no special handling required here.
>
> However, since YUV422 is not deep-colour packed, its TMDS rate equals the pixel
> clock and therefore the PHY must get 8 bpc.  This is essentially what
> drm_hdmi_compute_mode_clock() does, forcing 8 for YUV422 for the same reason.

I don't follow 'deep-colour packed' as it seems like a non-sequitur.
However, the TRM is pretty clear that a 2x pclk divisor on the clock
rate is required for YUV420 and split-VOP display outputs, so this is
fine.

Cheers,
Daniel
