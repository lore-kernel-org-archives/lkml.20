Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794923732;
	b=ZCwsgfsuACv9iWjqM4eNWXw7aeC2C4X6K1YhH7f4hgQgW9imoQuJEKCHLN7RDPm3w/pM
	 HE/yBJ/B7rnXS+VzLvM7F2Pwb061qKjk6Z4GfH4O4LtrSlV8rOqPzJj4WX6Mrt/OlWaii
	 B3lTYpmzNAyM6XjyYuyyfUK2lIzid6R6nJa4puheP60jjI7gVX0qLI25WgqoP0Kdamp47
	 T7WUVIUJWjcqzi7gPHucN5scBZt/sLqV92Bnd+tgWlsXYAfMPySfELDEdxc5ewLCx9lot
	 V2ADWrrLu8g3fyw2GCFLnf7GLmKXZ68ly+uf/lCMoQubsLKpVhYwVO/85Trlu+Uj23w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
	b=oO1KBv2FsCtuxEo+fYy3AojNCOy/AN8Jl5MLiXVbVP8IR1v1hAILkzXSlplS63cdCZHz
	 9TfCwlLe9hH+DwEz6u/L2ghOfgyH9EqnfhBai285ynYN/WuASwPU7OiU/CC1qPzYRUTPh
	 8lfe32V5OY5lh3KwkyEW68taT8AacDzfyQC/2s+gYFaOH+pPQhXdJJnP4eeEEh2HLWAdu
	 HWLzv9O5EU+hdJJGKkTHIPO6MFUjuCsYAxwfXOAI2thxhtzzF0buIv02eY/0MxDip0cW3
	 SeGib65ra8VO/UIGj8tXeRGoWnv4vmRYdfugCc4Kgp0Jwq7FP7F7ymR1c4m/nIo6isw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=szeredi.hu;
	spf=pass smtp.mailfrom=szeredi.hu;
	dkim=pass header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=SH7KLr12;
	arc=fail smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C506606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 13:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C506606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.a=rsa-sha256 header.s=google header.b=SH7KLr12
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5363c8de563so58682901cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:55:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794923730; cv=none;
        d=google.com; s=arc-20260327;
        b=WsPwfkiyYcxiD5PRrCY72dobKziplRj0zZ/eskTLSMw3Kb0nDlEYPxSyw8tPno/x30
         3VS3AkbPL4JNLl52YLgq53KL+I7DoXgnEr4XbbaaJVhntLYclcg5C/sdsI7x45cYlggH
         ld9sRjPB45wtEPgiWkmXG0KA/kg5jIqtteDgh8CD4Hd95CYcoaV18yVC40X/T1cwT0y1
         l6UXbLtKaeZJ/BzO45izejGeOOGlPc3II2ebYa7TJWQO6pqPb/sdN5cFZS4ivFwwYBoZ
         LIVQb8vYhqEM2/+tp0Tg4NSsfq2bPDhroKtHpety1mE3yJSWi5j0F16MOybsGPA43FhG
         Y8CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
        fh=eujUZoD/qzqNTmpLkiacNskGZ7HNoc51bSiqttxa0KI=;
        b=aXklPmcxbAasMYyiUwoZ2f9n37+lqUPWMTz6o+eWU0B52aY09YoVbTaGVedvZo3DOz
         TXcAY6mH1WtLdIN9eGU0P82k1PvUiGTOdFwsypx8EMrMwptm6ZjHGat690usYs8adET2
         za4LF8veWbbFSSift1gaFMZPIZpahNBWFNXxxTr5TpJN1V42wRwLR04Mhkfy1l/7MT7U
         rU7iHO+9QOnoh2blc9TS0wejARf3lkMH4Nezb8UJjSIu1NpQgWbUPLayM0ndFQBM9ea/
         UrzAyF3Bcdo98b+c2+QcEDV4ZGYLD6b8XpvT5z0bmLfePosxWWuaE+ROn4HcqwchaJnO
         88nQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1794923730; x=1795528530; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
        b=SH7KLr12oFVQlGQu23gMnVbVU965VwERVkakgZt9pLWsAylpgYXB/mGouBKpUsgfOD
         Oi6VrUvTVvnr5h9x98HM+b7x+RuLo6N7E5W+WYGtMJKnY22ljV3ehYyNxJeOyzpzyEYt
         dQ1tKCwK3fIt7khNRP7wsWfQMc+9tMtznrE9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794923730; x=1795528530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=PCMFhWYNetgcqgqSD3/UH0RoHtSUqDu9dzIGNxeEMr4=;
        b=VlnfcmFeVtumYNN76lh2DeuGPHWg/WjBg3NMQ0eK0x/fwNZe38Oo3/LMxTTAAVZq73
         FH3NA1Rqy7/y2qWl+ObY2ITf3q5tod8Ktei0YQxqGcjJMeKrlFw/kEb6E5kDC45qfWlG
         L082wWLg6p28Q5tbm5WHStRCZnf26o4ilFBM0owrEzwacl19kciCZzG3pzhBLqxs4l79
         PFQlkZRXQHngHc5tlnpMkwQMOdXt+Hs7LdyX2sNWb+3yhjvA5MAyHq3qEDr4ouw98q+8
         uD3Bq0tRTXUFHu8MK9ScpLRSKnAbx2ZO2po7Ot8b5W9u1VnMoclr+i1fdZxHlIB2Uxoi
         tacA==
X-Forwarded-Encrypted: i=1; AL+hErHy4N7YaKsLRS7hYBDVTChECLgxrL2/Pjd2M9abh3MfSU5aaRJJ3/dmyZog/yi6cOoutyf2yW4ZRnFwe3I=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TeLuicwWRAAkv3DvC2Yl0XuCXPqP+6npvFAIh29fhBKRmFobv
	xuj6y13UBE4tSmPwZCA9kzBJgRFBc/3w8FyvnCvOzmmDS5NjxMfgETc8+RdjK02KPw+1mmWclfS
	GVGS1Hq6VNGXtyZ+ZKAJpfeiHcEJ1nfxOw8lBI0oxQg==
X-Gm-Gg: AYBFou3LCT4A6rVlM3JKQeG/CWHV4J1D7G8jtPYfmazizbcFVQIe+XHiVpmVpLoOV/Y
	wVVZHzMC0n1hwcs34OIvDHt5vEBIGDlpbd+vXoCCNa5pxjpi50HaBiIZgIKTpf9L6+BrxP1eaiJ
	GZ2IAzks720mLTEcFqwHW5l+9TcXe7G+VQn+PZFGKjQIw6oJAk69yMRE2nNWMtIRLCCxwK/1wS2
	8jgcptaSibkcvpQQLUkrzL9822uawTHUb6o67v4cqPct/mYi80wVVw4gkpr/RjsDI5TW88hX88P
	XG4EaM3T+BDIPHvH4mNJzppO7VpgPM66asTx1R2UukhZp6dUvg1U8sRKa9Rei7moXZaS8VwwzMc
	N5gV94AQT72eUNosIS5J4cWWwDG0weiTnFZvIHT/Vm39upKeEoMNLxKP7u16zeqpSCw==
X-Received: by 2002:a05:622a:1649:b0:535:8509:3138 with SMTP id
 d75a77b69052e-55ac366a4a7mr228951361cf.11.1794923730002; Tue, 17 Nov 2026
 05:55:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029033700.273707-1-leonming@meta.com>
In-Reply-To: <20261029033700.273707-1-leonming@meta.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Tue, 17 Nov 2026 14:55:18 +0100
X-Gm-Features: AclHuK864qzqHSTrfZsL886LInnKNh2XiAhmdPhsQx2jCLEfINY9UG0itbitE0I
Message-ID: <CAJfpegsKJCzdBGmQmbHt-Hxhe-b9cs4z5s-uDBMHDx3ZsnHQFQ@mail.gmail.com>
Subject: Re: [PATCH v2] fuse: set dentry epoch before making the dentry visible
To: Leon Ming <leonming@meta.com>
Cc: fuse-devel@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luis Henriques <luis@igalia.com>, 
	Joanne Koong <joannelkoong@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Oct 2026 at 04:37, Leon Ming <leonming@meta.com> wrote:

> Set the epoch before the dentry is published, and keep setting it on
> any alias that d_splice_alias() returns; the dentry that loses to an
> alias is dropped without ever being visible, so setting it too is
> harmless.

Applied, thanks.

Miklos
