Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794762093;
	b=Gdqc6Gxlmw7l1nd9kll0CQuUzydIcEaV09oeMr8a7+ONimVzITqIBKLCQhgrtgPqGC4W
	 fYQHRu1o1gGCeA4LzkkoRxSnATnNJnR/+G65V8ItGzlvzSXW3YDKpGSInbXsdVquAKSoC
	 GQ3qTg4fvppNrx/GsRUQzQo1GN0Ui9fmRw4lV7yTbghXNT7D/sqBeXCuROyy7qFUH76Ro
	 GLjhg4+WlqA8UOKMNf24Du9G1J2XodkzzYgjwZ9hGoNpwIZOuSok/yfSdkxGV7QU9D028
	 Jt/3NJnDJrus6yTP/nZY2VtpOlXri3+eq6iOJY0OA2BZGLTdxBFgMV5NDyaR0mEZG8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794762093;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=t9j4Z9jjdISER0didX48taVrQrUdGTsKLLy0sIN8/W0=;
	b=vYQfiZo2zpdPrcuLoY/mMkCchZsucPmi6iC+512tWloWooky8w6oscoxFsQsnddp/uUG
	 Ueaou/Sjiq3MfUem4qxW1G2+HzOV0uHS/YLO15BpTYroQJys7sbwWeGrW74we3fgpWVXt
	 /j6tSUy6X3ypJa1WDJedHtIoMfkbfdxXDYznfVrthHmbwPqArJZ8SZMdRxbGahI1EN/+z
	 b6VYfxPukA5u1KrlKA4dsFTPcDrPtF2icsaHDp1WTn4xWCfAugsljXdK67a0euLYEjvA+
	 Ixe+RkYEzkyG+kMksBX504v7b6qtOYhC2bYGQQDpZUjgySq6aWtX1qbDkx1uHjR32wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Y+OHNB4T;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0064B606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 17:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0064B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mgcrea.io header.i=@mgcrea.io header.a=rsa-sha256 header.s=google header.b=Y+OHNB4T
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so29439745e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 09:01:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mgcrea.io; s=google; t=1794762091; x=1795366891; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t9j4Z9jjdISER0didX48taVrQrUdGTsKLLy0sIN8/W0=;
        b=Y+OHNB4TSwPMLnLH0QkR6V4WpuyWuQndY3o08arrujumeBFYSQ46bPNGm4rbMVF1Bo
         QTgFuX9COxXcM8bb0ZVlIPJxt03awbva/nTU+8XvTPS2kuExDNqWux4PKk7Pae5gLhzU
         35l77iXebl1veGfNMOZ22wk9o/Z06tKx3qfXZvW/9SUAlt/ESdRBZLKoV0vS414Eusz8
         VsUHqp5HY/zmpDGh4A9za+/8eGUIkPCaaqghBCx3cxJok/0hKX04WPpp/YAJukV6Xzw2
         8lR3JH2jzobkxS6FLUl9s9hhsSV8Hzqbh4GnKzYUzr53Xmu3xKHNcuBVc+RYjrjv94Mh
         YGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794762091; x=1795366891;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t9j4Z9jjdISER0didX48taVrQrUdGTsKLLy0sIN8/W0=;
        b=pWoXBc5wPpu3WuESZv7zyGMW1N1EqW89INzzy1ouAC6wUA6gjlKEr6yEit2Dy0oH80
         JPu7fXrhQhhbrhZjrP9mGRjVmqQRg/07bczDG2htI+vV8chRwMolj4T0orXvsWBbUT86
         y2p1as3EXQRRd5oLoaZcZR1E5XdU9IiLfK9jEcOJCrpvFsdx0GV2C87nrGufLV9ROt2f
         5TR++zx+xMyf/7QZ18U0A0fGQri163q6LJB5ji2MxyokpZAmFpdX3wIy3uMXPJpJRb/S
         caTtNC9G8hQZfTwqaI2XFFTX3g+Yt2AMo+KD87JAw5cZ/nrzauW6sCN+3CXRS7rhEHLX
         D4FA==
X-Forwarded-Encrypted: i=1; AL+hErEopI4irS2U0DXvPU7C8muM8b+T3oqq2n1sHwNMigo1HFRjQHjAerQn9tmLpliN0WpRN8EKl3F3lDn71NY=@vger.kernel.org
X-Gm-Message-State: APuU4Z+7jviwwdIlyIwwefrqy4Avju+1Oni1eCVdV7JHmMkEhb76PICp
	LDYeEErx1jrh98ZR6gIWAKiSHgidwJS8OzvkGbkk76+Qph7a8x1QDs8h2GQn7azw9zEsInQFrj4
	4KWN4
X-Gm-Gg: AYBFou01wDSsTuLvhEqZnewyJ6TKk2HwhR0wby9V1O5mp0upvAZeZujagcBtJH+yr1X
	own9rTczrNG5DI+KG//FqkqUoQgIWv0PAQss3d2t8CXj/CAzNmocWMirBy9WtVlcPrW+ziYykOp
	dSe7zVD1GicjHM59G9aqtddEv0/O2pF2FITbg+6yJWdgXspVdIVo2vz2tq7asKxAqOIcdeLoR79
	2BjNPZpimF+ZWZ7nJOWJVwMa5Svtk/i7DrK/2LPIRBC4+NU1/jF6lK1wPy8diN5fUTWj1qJWvCJ
	f7l2dUuWRpW07XedqIHOzjpNW+2fJr3ImApV7d+7DSNoynWFF/GKI3fTUghDyS2R2DfrB4Fkvse
	CHw+HrHsjNaYOoFPVywfxpkm7wAnogVG28OdnXvE6Ce4gZQshl9iSn7JFCYM+kLI8ZdWJZPDUp0
	V9N6Q/0popy+cGWaG2ZJTbtkoLU2PpAq2ZyRRQv0Cx2i93T7/LzlrPVNcZ2S+y7RH+/oD50L3iC
	HY0x20MPqKmPSLnLORC+m4GRhTISSSEbugwTDo1PjWeP/B9aZWSxbOy55q+Wfc7DblrmZZT7QGl
	cZf8Hk/h3H2NXkmlur002WuVhI+Ot0aAXfEAAt4ndOFAXmcaBhNg/Ar5z9sgx11zObAoi9pLinL
	yoy7P4qY=
X-Received: by 2002:a05:600c:8b47:b0:4b1:32c8:27db with SMTP id 5b1f17b1804b1-4bb55a7b9damr183311235e9.22.1794762091028;
        Sun, 15 Nov 2026 09:01:31 -0800 (PST)
Received: from localhost.localdomain ([2a01:e0a:9d2:5a71:b9ad:41d3:c29c:11b4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60d9fff8sm18132756f8f.52.2026.11.15.09.01.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 15 Nov 2026 09:01:30 -0800 (PST)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>,
	"H. Nikolaus Schaller" <hns@goldelico.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Paul Boddie <paul@boddie.org.uk>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	letux-kernel@openphoenux.org
Subject: Re: [PATCH v2] MIPS: cpu-probe: Recognise the XBurst core of the Ingenic X1600
Date: Sun, 15 Nov 2026 18:01:29 +0100
Message-ID: <20261115170129.24594-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261025073146.25326-1-olivier@mgcrea.io>
References: <20261025073146.25326-1-olivier@mgcrea.io>
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

Hi Thomas,

On Sun, Oct 25, 2026 at 08:31:46AM +0100, Olivier Louvignes wrote:
> Add implementation 0 as PRID_IMP_XBURST and handle it as
> PRID_IMP_XBURST_REV2, as for the X1830, which also reports company D0:
> write-combine through the WA bit, and none of the REV1 workarounds.

Please drop this one. Nikolaus' v2 5/9 adds the same PRID_IMP_XBURST
for the X1600:
https://lore.kernel.org/all/2e21dc4889ec55bf210dfc205bfadb57acb93eda.1794471031.git.hns@goldelico.com/

As agreed with him in October, his series carries it from now on, and
the write-combine choice is discussed there.

Thanks,
Olivier
