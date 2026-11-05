Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872257;
	b=c/H9lbD+TjbTOL2XRS9ejtuO8Wb8N9kEm+I36xW/aoOFztGIPkUh2qGHvrLFSiEv/ZTY
	 f1FMWVq/kR7fpK/nqIqCc1JrVyhPgbeLnTDYHw6L3gHab7ZRKWCROAI7eIVzbdO/n8EFe
	 CXZ+vDACzSXd8FAvgzxMirhHCJywd6OkuAFniyUveeqAkmsXOV6hGXMYSKEs0oAAH96m4
	 /1CAJRrceK3J8FXZJUd3n6vZ6YytUVUtp6EMqE2Il/VVjhJpFsUh5X0CPP6LjIj/PLUh6
	 soauR9KwujzaU87ALw8S19pA9kiU7nG2HHQBk7w6toFdRqIOy6+jH/Ir91AkWajDGPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872257;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
	b=M28WwBGBzXGQQemjY3WTQRJUOKue9qUNOi9bllqRHlYYMZxNm0QLyOJa1E1z/vaGVpyF
	 ssRPwE/ZNBzBE4ejzMpso8MCv3bg5F8LTdazXd5k18CnmEwVeEfk2tsnWG4af51M4eFX9
	 D5AqV4UXoZTNMGEzGa4kHjIIUgGxbKZ+SgvGADRJLQW91Bn4n2Om8mOJ8pOyS6Hh+n5Ua
	 biM6mFOS5ibLGZNzNLlGjZ2o3yu5Vi95K5reOHloSfjYBC6P+RyXcQf3DVscLFih1yqKO
	 XAsfdVOKJE+CVb+W8vxERUSVxXsf6e3zFDEdskozWIiV86vj9LBMR2aRU40wQdyNUhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuatEXYp;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AAA606D838
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67AAA606D838
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MuatEXYp
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1002978f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 01:50:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793872256; x=1794477056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
        b=MuatEXYpYw5XB606NqlQPnOrhLM+ru/tYWtVbN/B2SnvQlfzf5rLbz2XYhFsx5mFxz
         CFMhcUVhCGgDe3tZCFlynn0RuDRRoMY4DnZcB4jkCuOCmuYm+B4MTy8Am6omYrJ1BxNa
         JQQBCEaU0BSP6/nDQeb9Dzst5j1pYTT4NYcmCiNQpqi7C52qLAXPG7FFy1LPReoselXj
         kQR/EPVR3+Pzf96RkzGWCh6wIa3t/uYdxfpRURkMnwxJQEALfb2zh1wM2wF+O9FPszHY
         4pUdGYaX34ysNMqvTf6RkQDYDl2EiFPE4Wm3ybIq1tjH96F85EfqvBDU05xr7i2X9Ecy
         j6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872256; x=1794477056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dyBthqcbOdm0JBXumEJTj6vVAKyTrhFZS6V5YGIPQiQ=;
        b=0jn9lg/gxPKRafIDWZY1RoLv/sRm/THR4Eo4ZmupfTxjR2SO+2RzHwjRr055Rq2Jhl
         7xevbwC3mPyDtOptklqdhuQQAbAOl9UtjzhYlr5UjIqmedvnIR4x/p1fsGFQsdpBiYut
         6Z9WaDCCh5qoTFhx9n5i/7gn+ILKcKGXjN6FoRcjJ8HJCYh4sxGOzbn8+3duVZYO0FIR
         vtC60bQwUQCgyRqCAnRpTSnepBHbidYGVgCYBzjkiA47V6CktS+ayY6GbFzPniLc/AMB
         rVSk4PAC+I3tGGCr2nn2yRJq2dz1UP26OcQXivdrV91KBzuIII0vvp71C5XwQpzWSpsp
         Nwhg==
X-Forwarded-Encrypted: i=1; AKwUvBw23FoQyx3Xdqo+CNmfq1rsV4x//cn6Bq8rzyFjBDV/IhCHP2i1+dAWQK5tr2yrJL6v8/fDnDpfaP0P2F8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CQdvBPLNLMToKYG0hukwXJoQ50DUn0LdClF1M5OTooYL+n0N8
	Vr0W9kgGitvgbVWL0WGGIetENsxWxY15VPNk6HSQtECstIohUAUOXPAh
X-Gm-Gg: AYBFou0/sPgWralFZPfZRGWBemveVctH0yh8CV5KHHONf9AY0WHtdZ4gn2tWa999GSO
	+V/+XxFe9UJjHZmQakZ06NahMbRKt1njfsye1BroOlesf0KLy30DPWULDklvJMu7BlqEHJdPFnR
	9EitRvhrrEgojpBd8JJZK6fh3H0l49yqrEvoPlr9PtvtTftjDZ/Ija+D1GE71rHcE41venYv1xv
	zpXosBUqLsPxNkDz0PIStzHQobE+1YB1wdm5g2QFvMy1rJsKN02X6ozv+GGJkaDwLX64NTSvCGQ
	KJTX+26wSXaH3Pyfab2eq6XKWFZVBPjcGGQgeh5lcdwDULqXu20OoM9+AhwD7LwVHZHz66xnicp
	/M0q0ldapRwpglm//CBv+bczZ0Ch4NQAgwsLLpQYoAXQSziv6GJqgh1OoVCN946JXFewID0M4F6
	1fa2lJrB0fBlmCkOCZPSdPOlVQqchtcDTxN49SiZX6/8fJHhxEhp7xCvtWWcVShgbxTbHIXXz2O
	Tj7m4WD/s0+/sYPgeJzAimBWwHXTBnFmXw3yQh9r0NUV1FDZY48JNRW5TEYRahtJzDTpeAX6EyW
	pA/vEkcQk7lZLkox/uKewe6d0pwbCduVW9XK12JLsAmyBkRxlaJ4vyrvwTlapYkTPyohrPIQN7R
	6ZP3EYOBZksVBg4FniOiEYa97JA4=
X-Received: by 2002:a05:6000:2282:b0:48d:f14a:9188 with SMTP id ffacd0b85a97d-48e73851611mr39371636f8f.17.1793872255636;
        Thu, 05 Nov 2026 01:50:55 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.lan ([2001:861:39c2:e340:c87a:3b37:3ef1:5ced])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fe7189883sm9331056f8f.0.2026.11.05.01.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:50:55 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: airlied@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	jesszhan0024@gmail.com,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	neil.armstrong@linaro.org,
	robh@kernel.org,
	sashiko-reviews@lists.linux.dev,
	simona@ffwll.ch,
	tzimmermann@suse.de
Subject: Re: [PATCH 4/4] drm/panel: ilitek-ili9488: add the PocketGo S30 panel
Date: Thu,  5 Nov 2026 10:50:45 +0100
Message-ID: <20261105095054.117210-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105040526.26323-1-igor@reznichenko.net>
References: <20261103110524.2812831-5-romain.tisserand@gmail.com> <20261105040526.26323-1-igor@reznichenko.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Igor,

On Wed, Nov 04, 2026 at 08:05:26PM -0800, Igor Reznichenko wrote:
> Minor suggestion: please drop the implication that COLMOD 0x66 causes DSI to
> display at 6bpc; the datasheet doesn't establish that causality.
> I think COLMOD only applies to DPI and DBI, not DSI. The initialization
> sequence can remain unchanged. Non-blocking.

Thanks for the review. Agreed: the commit message should only say that the
init sequence keeps the stock COLMOD value, without claiming an effect on
the DSI path. If a v2 is needed I'll reword it there; otherwise maybe it can
be fixed up when applying.

Romain
