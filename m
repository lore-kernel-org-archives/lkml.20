Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 036DF3C09E7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 19:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789587775; cv=none; b=itVTywBxHNV6+Iy6VSyp99xyWvZST/wsAWjsyWO7D1yI0t3qVYWCn+GBBJ7ba7jZVFKm3VmHmPQfG6w/aViPnkk9KT8TbjEUmL11GRTdoWbvZlryB9bFt7pUPr2ItYLYyaiAfM393CiI+W6GK0hz/YK4Ahw6eFkPdDHmK7A+yp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789587775; c=relaxed/simple;
	bh=Fq3BkwNwppeKK1UWo2It9BObdFKKPRXP4NeynFNoMfA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QM8UqxNlar4SqvTdai+9c84e6g07h1aWMWkBkgNlT108e5mmfAV18ohYIPWgR8Ac5PMUBfq7WtNt8T2UQAAyuQnnpBCvIwiXMFvVSz7rEDhTjC/RbYLm9Eh2lMyXZxSeTzh3KsyH1QnCv+EY87HHpsgj58pd6BM2P13pMU/avYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rk3VRcfG; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rk3VRcfG"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b965f447cso848675e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 12:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789587728; x=1790192528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fq3BkwNwppeKK1UWo2It9BObdFKKPRXP4NeynFNoMfA=;
        b=rk3VRcfG7z6e8UZ1AUO++1RfpOJ2ImyWi5FT+0ay7wkMe1bGvIs71PVjUd6ynxuYzR
         v1dpy3BNLr7BKjOknBhkyhhAHzM7COQGrrrbpSqgwBI/ew5J1lU1Lu4YAfayEjJIjz6s
         Q9yfznCdm4WXkOlxe8GnKbYIQg6SSitlcczwpqlJkCd0sKWxvG40JIkSPg7FAL/Ot2gY
         8Hx6nUFB3n62GPhd1qIRhipslNsurwzNxnr2hjwthiwXMPXpYKWzw/TPzelMbtkaAFHg
         4+S9co53yrBfrfrvahDQPIwQRCjC/QStPBkAsl55alBGbd1g2GT+EhvKBQhT/L3Ke0kv
         LwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789587728; x=1790192528;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fq3BkwNwppeKK1UWo2It9BObdFKKPRXP4NeynFNoMfA=;
        b=QKTom9cwt08iQmELFM09ElTqOWPEp+zwASqvo24pF9m/Gmx1/btvIWhEzsuuq92Njt
         0B6Mu1zTnmbuSvWEICam/YiA/KC9FU/KqTVL2k5aVC/PYY/JX3RBkJHK/utmpZ2CVUEU
         f8ZROHhbSsfo+YSNMrvzJLMu6FCu/TIGF1Dnr+8vlGrzwZQblW0GhHM+TKFHZFz/BGVQ
         XkiUNOSKPmehdQchWzoIhawf5kYnTH7rJo2FeFrj7ioAlGiNdH4W3q13Qhe/INbQGKpN
         oFYsfzOxZYOppJT9U5H7dtpCpW7QJnkcbr1vPK8VMQMWVoEAE4wkwXcyRpyshWLw+yrO
         /pqw==
X-Forwarded-Encrypted: i=1; AKwUvBxQJq4GVlWSyUWEXkpZoUaGlAjLZm7uhb4pypLFFoj6FKOfQH6Z4x7AROsarrNV0CzvKdmsUK8LGtpz5M0=@vger.kernel.org
X-Gm-Message-State: AFuF++lMw+55s8ccRI1Ubjq8w/jGyhj0aplwY50zd9/qZSmoPR+KO/Mt
	yCfo9H7lVBes+g5w/Y8HuABXsAaGklpefXEOD/i8GueO79nt4om4UHQR
X-Gm-Gg: AYBFou3r7EsGORKJAg6PUCsGb6weRGLmMuhpe5x4X3rZ/qYg3HLGveUNh+7Exkwg1EC
	LAP5NsZCCLTxgxFxDeR4sJC9x4YvbtB5VjU7cK16QmgYZtdtk//jpz2g3MJZPPOo4ZdOOSbZO1A
	BApykeIQ/mQK2saEGVYlIipBsJ9NgpjHQHjWWhEwP0QLCG9VSk/pGzg5/LA5Oyg/GdZAv/I5gPx
	mDasWZuX90p/3MsCBfUI+sNqEe4ggNKY0UHSvo2RgSRGcZGyUE+gj1lhUjHUTbTHmf6zsQg154s
	mDu/ZLZTSa03aBYCKMpsoOCvj5Fe7xyog90PE1X7esklhHjjTni+O2fw4x+olL2MbHcNqVWp3+j
	NVhK23FyFtXqWX9BuAqjSCwa6HTh3P+Qa8UB9R1gbjQCyWPuxeOtHhswDAlLmJSKt8F4/aoiEVt
	r4Di7xB1Maf1em8pK4OYIYCkVB509Bd9hCQn2L/etmmqbdmBWY69HBitq1r1a37LiEPAp1p0+vF
	xS50q/Y4OHPJ76PAAK0EfzReY2UTqo/Bu9/P7ewqNPd9dKebmDMnvIoYYM4CkCHTTQgQFLBX6DX
	4ybZHNKbBKbjVM4=
X-Received: by 2002:a05:600c:83c4:b0:49c:ff9f:f6b6 with SMTP id 5b1f17b1804b1-49eac463960mr49616985e9.6.1789587728274;
        Wed, 16 Sep 2026 12:42:08 -0700 (PDT)
Received: from mskvarla-mac.redhat.corp (adsl-dyn31.78-98-85.t-com.sk. [78.98.85.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bcc7d1esm9174964f8f.0.2026.09.16.12.42.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 12:42:07 -0700 (PDT)
From: skvarlamatus@gmail.com
To: asmadeus@codewreck.org,
	skvarlamatus@gmail.com
Cc: ericvh@kernel.org,
	lucho@ionkov.net,
	linux_oss@crudebyte.com,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stefanha@redhat.com,
	sgarzare@redhat.com
Subject: Re: [PATCH v3] net/9p: add vsock transport
Date: Wed, 16 Sep 2026 21:42:04 +0200
Message-ID: <20260916194204.99506-1-skvarlamatus@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <aqiGy_7S_cYs_6or@codewreck.org>
References: <aqiGy_7S_cYs_6or@codewreck.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 14, 2026 at 23:44 +0000, asmadeus@codewreck.org wrote:
> Right, diod has an open issue[1] for vsock but since there were no
> obvious client available either it was never done.
> I don't think it's difficult to do (probably more work to add the option
> parsing than the actual vsock support)

Definitely agree. I think with this in the client, it could encourage
more servers to add vsock support too.

Thank you Dominique and all involved!

--
Matus
