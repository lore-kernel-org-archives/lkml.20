Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F64D4A261A
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791642429; cv=none; b=Jj/UaKL/KSIE2DPIQf9Pf2Znt4RghKrulnwYSUU1lcLA5RcmtNo1uwHC7m+ysC9TkghHQonMcWZraIYr7sOtMgmHodvUiGw7YRvUbqRCPf3TuKacfrsjiNqW7VVQPhwoL42+TDUv5roF+ueSUGPAr0ELUsQKEvO1D0+2Tu0NBgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791642429; c=relaxed/simple;
	bh=bT8QZiVKXnYQ1wriTXXN1fbxkqu2uho/BMV65qvCwEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCbS3eCAVGl5xTeHUXhxqbumuitePWhsJ7jTPPBnNQhLRnqkWdQsiq52d1qQG6Xj6Inm1aWJg9Fk5dWVgLOlmjNqKSwtow50QhN5P3D9UcMXbkMOXHPcv139qZ2aVxVToXv0Hy3tO7UeSw18eLn7ug4kjTpWOxMpzazlwh6YoEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gEoKpKIo; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gEoKpKIo"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5dc2dc6d3fdso226941e0c.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791642425; x=1792247225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bT8QZiVKXnYQ1wriTXXN1fbxkqu2uho/BMV65qvCwEk=;
        b=gEoKpKIoGGA3vHhqVW4cqXARBXA8+KfdFA4u8/d6JgqidrYeMtRJjmbHoOr8iMKDKw
         jDW9BC67krz5fBAkfp2H3tbwMwIEPI1aYe6QXUowOwWfFzanOVnyFgCI+eY7K7AURPuE
         dB9yrWP5ECUUlRq2vsmke06X5ixwPdkaXYb4dSQhUxBrh6aFEPEhXTWRTRqYl9q3fqOy
         m4xoVORcUAjCrF1TOmjYP9t6Z8D053sAMIbGjMUkreIMDoN08/6O+IkyN9UR/2rp9upH
         rO+Ga5E7Yut92CY85DpWL+L9BpfhQ9c8RnEsrsrmq/tW0FSnzySaqHpAiF63hInRyEPn
         aSbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791642425; x=1792247225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bT8QZiVKXnYQ1wriTXXN1fbxkqu2uho/BMV65qvCwEk=;
        b=hpIb2lP4W0EZNTwpMTyPkvMvQWfzi9V4vYUnYwEaom2NS3oik+oSCa2B7PrlQME536
         dQcm/BSL4TnKNTgMy6lPlQJQrBeR+zA92ZDN/h+fpmIlkYEFf2DNadjsCezg+YaT07h7
         ERbgaIxk0lkSQRtZPEvsNV2VLsAvvKm85tV0xsYh06+uzc9UlkCm4vYdItidKChff+lq
         c+rucp7LbiKDaJW5tTuys1zUKYLABvhnwZs982w6XgYx6bjz3Md4U5m7Y57kZU7lYlN9
         TgBoxS44BbB4k4d6pE6KTq8PfVQUQvO94yOLeNgyJoHwla+pnUk9i2tEOih0PJFwueR7
         wt2w==
X-Forwarded-Encrypted: i=1; AKwUvByYyX0EFU6hvtZ0QcHqd4UkzbWNdI4Fsy07+NAfpimuEh1bwGIvsgCbwTLaLerTPlr9Jhc9bpJ0GZWZ76A=@vger.kernel.org
X-Gm-Message-State: AFq9FYK5CFPl1K7Tt3CVToVHGqD7E7/wjJTJ/+Na10u/CrrtsDweJYgg
	X6wTfFrv+KddNMeKm/95Or3XCl+JXcvZYStyKi2J8b9OKP+4fDzsortT
X-Gm-Gg: AYBFou2s9BLtC7mLDOiN9478iBVV4YV0TW5mv3XC7rXyjT4/RffZXR6uQKc2Q900gxi
	gKRJeQrol9XhePC72PI0j9V5i8CzJRjfrmrbPXz7w6CA9SdKtNTst5crAx5A91uyZQm9c40aLWR
	YAGpz35VxQkTZveeK65F8rRI9i3uR1kFYTMB8N3raVBNJqlUzuZVbIO2WRU9u3DNXPk/6vFeb8y
	ayZcblmQIeHAR/3DxHW+8UdioACfbJZT2hMmwTVXVtGQ5zuM9spG4EkIpq21dKjWtSEw55ugRtv
	pPgEatX8+3odqEzKVSUMWo/XEF2p2HsszAOgk6pt/YVqNnOu+rBjbtKTDSxRCz482NZr0XDM6ve
	H2bIunWdiBB/JUHbGEqZ6+qjLvqEEbQqH+XZ+dCE2Tktwd6GFY6Jy9syQDVURJJxhYOMtgOHfMR
	VzVjNWFUqJPYQiT2uph/wtNwTAE37t57OjOn+OwPg94l1XnbgcyXjYhaxl+scXC1JUC0IIPRzwA
	pU=
X-Received: by 2002:a05:6122:4f84:b0:5c9:a60d:3278 with SMTP id 71dfb90a1353d-5e91f4d0880mr1648232e0c.12.1791642425058;
        Sat, 10 Oct 2026 07:27:05 -0700 (PDT)
Received: from beelink.. ([187.13.210.57])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5e91cb292a5sm3982216e0c.7.2026.10.10.07.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 07:27:04 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: Kuen-Han Tsai <khtsai@google.com>
Cc: Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Faqiang Zhu <faqiang.zhu@nxp.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: gadget: u_ether: Fix NULL pointer deref in debug logging
Date: Sat, 10 Oct 2026 11:26:29 -0300
Message-ID: <20261010142650.2664739-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
References: <20260923-u-ether-gadget-npe-v1-1-ff466c55ecc0@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 03:58:35PM +0800, Kuen-Han Tsai wrote:
> Replace the composite.h logging macros in u_ether.c with the standard
> netdev_*() helpers. Because dev->net remains valid for the entire
> lifetime of struct eth_dev and netdev_printk() natively handles
> unparented network devices [...]

Confirmed against mainline. The DBG()/VDBG()/ERROR()/INFO() macros in
<linux/usb/composite.h> expand to dev_*(&(d)->gadget->dev, ...), so each
use in u_ether.c dereferences dev->gadget; once unbind clears it, logging
on the surviving net_device faults, as in the eth_stop() path you show.

The conversion is complete and safe. u_ether.c has 26 such macro uses (18
DBG, 3 VDBG, 1 ERROR, 4 INFO; no WARNING), and the patch converts all 26
one-to-one to the matching netdev_*(dev->net, ...). dev->net is the
net_device whose private area holds the eth_dev (netdev_priv); it is set
at creation and freed together with it via free_netdev(), so it is valid
wherever dev is. The remaining &g->dev logging in the setup paths uses
the local gadget argument, and the dev->gadget->dev access in
eth_get_drvinfo() is not a logging macro and is outside this change's
scope, so nothing is left logging through a stale dev->gadget.

Reviewed-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
