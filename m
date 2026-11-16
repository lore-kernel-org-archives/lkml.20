Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865201;
	b=dIgS1kTj6KIYr6KZ0NpbyvqzQs8sxvLzgrBs7OBTM9TrOD9OU0gn5E+8zpaUXGqjeLhL
	 AwbLrtrAnFp+355KeX0kGDdiSeoGYcqkLobtXLOljjbttgzWnFRtX81i8hrK0mMJGIA/1
	 2pu3+DGhCApHyVLWdR2o2UQop2I1T6+wTXBSS6Cjqw4GvSC3TuxEiokkaUuQy67njneSS
	 Wa8GZK/vn33moKscIj/Yz3Qb1bx729oZTaOnox2Ow8aBT6uxUhLYnmCg51T9qXUfsdaT7
	 ogl7+MH/ynHL6MfhE4gAXk478qXnc3qLd+l4ugE7Xo36e2ZelbpAoQYcME+qPXyi9Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865201;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=w7gJaq0U2XA1qzZik/lkoh6ncUAk4PKRnqK8WDeKiB8=;
	b=WBdBV26CQi/bKQDcBmR3/2Y7Yk+W9c4HRpAbSbGy+u3PSZL0aJmWNf0Tk3lma6cNDTb/
	 dtstoBZMkeWKPKv5NWNDYI0OQZGdr+KOQr/Ke7IgwMZtbNobjZ5T51fncQKwqXInL3XNi
	 HDNvh4c9QkjshTS/eCo1RF/8QqWKcTPWybhjJLGiu7NXV/3qvpsiVv3VD9jbcAPEXm0zf
	 FLMtMZQHlGiBsHa0bsrHRZ4TkNuYiXL+kTjQlHlDYHK05hBnYzaHfFrHKrjTI3dsDECht
	 ReuOqiCBUNQl/qpjzwdH5WrY4QMl3wkIn8Vqcb9Ycq+yr2F84KvAjrQixijKhSKtL6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OfiTwHv0;
	arc=none smtp.remote-ip=209.85.221.227
Received: from mail-vk1-f227.google.com (mail-vk1-f227.google.com [209.85.221.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A0606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B37A0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=OfiTwHv0
Received: by mail-vk1-f227.google.com with SMTP id 71dfb90a1353d-5ee27c9eec0so1047375e0c.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:40:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794865200; x=1795470000;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=w7gJaq0U2XA1qzZik/lkoh6ncUAk4PKRnqK8WDeKiB8=;
        b=Lb3AbV5IUfltYQSe8dpUOmgxed1Q8rXalDU/2W141bKPqMp13d4iTLj+vuJMo/v+hw
         l+C5zJjSsOVbgz7H/hwglMAZqVGdqHDG8AnpX52IFM1THuMVbAnWAxXf2FUKLQZOuIpT
         +Co/gykvddKUduF5jPjl2GCbpBNIw9k2b/tZMPecx8NUK+vJ9kgR13+/MYYVhYCxijVB
         J5HvoQupjAxQDV7ebBsU/8Ayc7uYQwUfq6L+campd2awOTGCX7+QSuZeyor4Auzckl5b
         x2XzmnqUuQ48kN6aRPkrqy5dG4rYqhBCQgtZR4/eTBLVTVi+39i3UkawotnpNIRZcVRp
         gSHw==
X-Forwarded-Encrypted: i=1; AL+hErF+3JoM+3Za1sGnmlqEC4wwQzD5YcNv8CO/2/G8/n2UMgKA/FKR76vu35AxJ31XcahIhNoafRnkUYb391E=@vger.kernel.org
X-Gm-Message-State: APuU4Z9fw/Vv4xnLGPeFxMYSw4b81VMVuZQ+06Z6QSE0CIXUbNJQmaSb
	ZPzL+7onKfSdB8to2u2U4bOu5nhI9wiwQTUsXNsyO2ktkxDfXFqawHXxXf4ALK7tV4kIjF2aY4P
	XyuCclO1QvMxitX7fzc2P3qdchRPZeOnUkcgYHiwIgb8TbxOGNtsltLcq9MzWFWqTLdWYyuh4ZS
	IrHfQKfTHpBHH4mdOg1gw2el5TcPKV7YG+wgpOPJhF80Wq49yeZ0VoN5OcKPKV6nrVuzAq0cnN9
	ga5udMACXj5+NYi
X-Gm-Gg: AYBFou23YY9o4YTHxP9QSie1rvZJ0njYky/kmwwVyrZFceN/vAd4xw8SzvMbkpAeuiY
	3GFAiHreJuEyqjqecCZFZzPAINrvUMyGm44d/SY8O2sC4QOxsUieQBNt12QklmFJZNwegrgcnco
	q6l5N7/TznAc7ncVFYy48/bMaulwg3xw3ryb5Rnzss462FSepy0MNZG0w9KLxbg6NPHI8URZAob
	2g9b5xW0vGnK0g9xkovppk4RLWPMLN1/48TU+tebIXCGvk9D08fQGuL296dUSRQtlU/tTExWdMG
	rrL2gSHwFw4x1mwAVFs52e5a+hdMl2ysmO7+z5KDMRRSENbaujJUIJDagZnE7FI8WZAcuSN2UhB
	GTeJaWM+aZ3oRGeL34dynkI1bnuj3aq2D4zsLtCGVJcMTsdDqVYhP8s5d0HGo6zenaYBfbkbZv9
	jgl4ed3Cs08ZQcgnPERwkKOAXRkVEotFb3O4o=
X-Received: by 2002:a05:6102:a48:b0:7b2:508e:3d57 with SMTP id ada2fe7eead31-7d64d474eebmr3672752137.4.1794865199611;
        Mon, 16 Nov 2026 13:39:59 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e338490a1sm109908241.10.2026.11.16.13.39.59
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 13:39:59 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so6054880eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794865198; x=1795469998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=w7gJaq0U2XA1qzZik/lkoh6ncUAk4PKRnqK8WDeKiB8=;
        b=OfiTwHv09sh6rhbJPVu2ueNCsptY5o8ucg5p+xewGRsJC8AJxwMsLdDzo4L2sX9vr/
         PqpC77F8uU4ScfZlOgfzJzKqX9UDwXpY91TDCUf9TeSfFGPd+LstFU9i/s3mW9++zYFm
         DckumJmMtsy5E8Q+m4fSe8ZyAELEvcHlrqnq8=
X-Forwarded-Encrypted: i=1; AL+hErEmgczqUOeoOGZhWrtHHusiSGPDfZO2G6EPnfUDjOpfCWMFFyHoEAgpP2IssXQpKY5BGzEafsDTiZ/YQvU=@vger.kernel.org
X-Received: by 2002:a05:7300:2204:b0:367:185e:867a with SMTP id 5a478bee46e88-379679df9d9mr17264094eec.38.1794865185902;
        Mon, 16 Nov 2026 13:39:45 -0800 (PST)
X-Received: by 2002:a05:7300:2204:b0:367:185e:867a with SMTP id 5a478bee46e88-379679df9d9mr17264030eec.38.1794865184515;
        Mon, 16 Nov 2026 13:39:44 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm37780089eec.15.2026.11.16.13.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:39:43 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Jaeyeong Lee <finpiler@protonmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/vmwgfx: Erase the detached resource entry on resource release
Date: Mon, 16 Nov 2026 16:39:41 -0500
Message-ID: <179485275604.3430538.5664968222788399295@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260725143859.797134-1-finpiler@protonmail.com>
References: <20260725143859.797134-1-finpiler@protonmail.com>
Content-Type: text/plain; charset="utf-8"
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Thank you. I rebased it, dropped the v7.2-rc4 analysis note from the
commit message and applied it to drm-misc-fixes.

z
