Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823067;
	b=QvoY0twyGtYf+8Y9gyAKrJOCCyxLfaqYs6CM0m5TJnBRMtZvdqrdTJ3vGT0OYMLUalcx
	 XQOqG7Mh3MYhQ8DNpbtp7FK3bBmJH3uLx+ziIscLftn5pxMoiopXo9FMxxKK8H8kTnQdL
	 Et65yl0QwI65HSbEm6qHEeM5k6l2vsVDbHKGiJrZZmSpevkpdN5Z4SgjvwQy2hZHckzQ0
	 UEdCz2H6o8Gc600C77cklQB5cD79lnpx7XlJ7Ku5mLAXn8VEtKSt5kSjX8RdkP9ZUN+dH
	 lYLQN3eZv4gyrB5j+mCFUv5eMHw1xYIHpSxQf0YVopXEVR3ILFyzdx+FOBP07PMWQqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=axktSpkMz8G9oKTbdKR+y7TQiCVf6bAQxEAR5q4VBnY=;
	b=GbUFsUxgsxJW68h5ll6B/tm/IX+hCO07J2fRqCIkm4H508vT7HRjDOJRYOZvTKVkXli+
	 ZSSvpmfXO3vyfvd+LujV7h24GPg46jK2utSmcLAB7UPV8EpsSV0+6UNyf67gYA7Am0U6e
	 mnQtoUDww1IrdlMtInha7cMQ5c7buxx5wEEfJ3enzo4SUUBtz2wnbTZ8qf8kvcWPtPQbq
	 RoaPjNkb/Ib4kdayntYNpQBJPrMtDAnyForJsYv4XFVhMKSRkz+AZMNYXjSxUHZt1YRM8
	 XAo5WJD5xPeVZ5itN2Do6SveT7K6GNhqIeTRZF7BMtS3sapjWPA9sN69rUAyOIsESlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRcqLL7U;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438EF607E931
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:11:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 438EF607E931
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wRcqLL7U
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35b2c599f43so336518eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793823066; x=1794427866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=axktSpkMz8G9oKTbdKR+y7TQiCVf6bAQxEAR5q4VBnY=;
        b=wRcqLL7UnZlWivP+CKpE9rBWEChFGjI1YRSbSTd9ANtjD+82gAqhe/ta6t5yr5L4xM
         xqOrgCBqDXHpftuCfyygFk6GzNU4n4LBxi6Kq1SXO7iKosDTINyRiXXKn4oDv2UFONQf
         u4/i/LyiL/5HYTaOGJHtngTjQvjrkc/cle6w2K1nlqbc1lyi45BPrzw5pK20Y+Az6Ku3
         mVwsdTrGC8tbwT5TRac3HR8k8alIMaOHvzoXtVg051Dm7H2M+r/uD0s9u68vGVvGD7yP
         Xi3FTaqcLyOSrDs1EwIk5GcWfRcppgUxx4ZE2oj96gSQ/pY8HP+54XWv2s+dVkZ0rdpJ
         UUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823066; x=1794427866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=axktSpkMz8G9oKTbdKR+y7TQiCVf6bAQxEAR5q4VBnY=;
        b=bIpYvOSR5WSLKnxQxbYd0cNhg/F0CR/uwCGOzABMa/dUZK07yt/W40lClTD5TyawZa
         1BhaiclJuXG6wEDA+g6tYBgvPtZljQIsN7qqLNvfx5iLQgmOIB+X6XvIfIZQ2Dfj0Kbh
         nAaexJwxSz9+lXHvtw0mlWWIX7pUp7SnCJhyqDz/VGvx+XB65ZxZW2CF5yrFVYwl8qAi
         c1FXBZwGL6hM0engYZRZinPczqj1qJsHgp37hZF/uzOw2e+FtK8FFj9hp6RsZGZf+gV3
         p5eEbJVc8XejYPQvcEv0TFyPdwIEH5xEoaUOqrqcAHaY4frfwiwvu5Cuss+VCILjuYOy
         KfwQ==
X-Forwarded-Encrypted: i=1; AKwUvByCaFzZ+pxiuhqi/juyeDTHgdFdawTy3Xvo7G0CDBt4HlFuNh2CHcXMDWyqCySxElcer1HWm7aUnIXCzg8=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n1LyXajru56101CmgA6JqL50Y+BO9R5OgraCrB40J2mQn43a/
	Xc+KsYdDwaHGelKh/zBha0FDs51yTdjQrJ2YlOXTFJzfXFadjIOlXTc=
X-Gm-Gg: AYBFou2lgULpjQvOihr05YVTFP2yEB4MvjnybwqSRa2zLvazGclXhv9x8MBvTVTQD66
	M0ODrRroxecQfwCjYBHQQS+y6kkKbqhjJTGjdS/blQHh8TItyUg431LUCEBxGjT5Sp29ikDjE5n
	uCQIT3unTrH35twdWw/+Rk7Eu1fR8GUhjT/sqLdFoJxXUcKbv9no2Nr8si6TOmokic0dpcALDM6
	E+WSxpOFoyF4R4ZePmwkAlhYS+TAvkyDnBgOlxdDpRvlT0j7fXWDKbumMK3KoEW9WJ08JZpaW3O
	orV0OEgvPq3cLp61DEIca2g5hU7pnbS8dc5+6UV6u3FwfcC4Wuj+MNcz9iSswAgnJT2mhwsONYK
	Y/5ld6trUOwAEQNNQRh1V5t/OOCwf89/GOaa/l3mZEgyhcQ7Fr/3Sh5Wb4RfL/FVKxRd2SegBKq
	yI9SlojzhV/y5F3xWHxr6sBD/+bf5DcURIwDXdniK44666lmkO5dl3EQiAk7MV4bHqGJJe4IOj2
	+hpnOHXIHzudoxYECYCnO2Od4OP4BD4a40KbVWjgh+PTow97uvK6FVIcoRt7AUjv9ptMeuJLPu1
	obhZj65kqu5Vb+qFf9ShKo5+68SCR5fVfIg6IOm7MQv+PotNRgFAHlJGZ4qy4M7f
X-Received: by 2002:a05:7301:2a95:b0:36c:9afe:fcd8 with SMTP id 5a478bee46e88-36c9afefe8dmr5613420eec.30.1793823066322;
        Wed, 04 Nov 2026 12:11:06 -0800 (PST)
Received: from at-Standard-PC-Q35-ICH9-2009 ([106.194.66.249])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm2731938eec.18.2026.11.04.12.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 12:11:05 -0800 (PST)
From: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
To: alexdeucher@gmail.com
Cc: airlied@gmail.com,
	alexander.deucher@amd.com,
	amd-gfx@lists.freedesktop.org,
	atharvatiwarilinuxdev@gmail.com,
	christian.koenig@amd.com,
	dri-devel@lists.freedesktop.org,
	harry.wentland@amd.com,
	linux-kernel@vger.kernel.org,
	simona@ffwll.ch,
	siqueira@igalia.com,
	sunpeng.li@amd.com
Subject: Re: [PATCH] drm/amd/amdgpu: Add 5K Support for iMac20,1 and iMac20,2
Date: Wed,  4 Nov 2026 15:10:57 -0500
Message-ID: <20261104201057.8395-1-atharvatiwarilinuxdev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <CADnq5_PjiWHEDzS5DJgB1wS72_tHp4Ju5Wwr0R0N5EK-i9fXfQ@mail.gmail.com>
References: <CADnq5_PjiWHEDzS5DJgB1wS72_tHp4Ju5Wwr0R0N5EK-i9fXfQ@mail.gmail.com>
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

> I think the rest of this can be simplified quite a bit.  I'd suggest
> rebasing this on the other 5K support patches and see how much of that
> code you can share.
> https://lists.freedesktop.org/archives/dri-devel/2026-November/610011.html

The code that i saw, dosent have the ability to change resolutions, and the code
it self, is basically completely different, for example writing 0 to 0x4F1 completely
kills 5K forever, you cant alive it again on iMac20,1 and the code does that.
