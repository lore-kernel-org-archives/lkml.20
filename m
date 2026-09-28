Received: from mail-pj2-f40.google.com (mail-pj2-f40.google.com [74.125.227.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066CA3115B8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790573584; cv=none; b=oFy2vuqMPxuc4SIbTLl4tuRUD0e/oSZFWTwc7IvraiJ1+ET9WzckbloP5b8hhSqHR0xq+UnvPut4cEvl4JeznamBd812+iumKzi/H+vttvdszIxSPRI17WM4yn6xqyILxKJeHTLOeN5Fs+xCzjfns/JVETm0VoVrXDpxgs6OIvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790573584; c=relaxed/simple;
	bh=aJtKhPA8Ii89k5Bn+ANeNGZlEn8xfbMvKK5TkqbdCFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dHXYM1jsWoP0TQh5QK7Zltxlhsd6M02Z1yfqvXyblSRplJtlQTcAHmwb2LwBjPDxn1skpmKFIWInbpbSaz0dcT17PlS3k6eOgv1ZLLgn3+45kCOX/EC0QAC2IduiQOSxaFpsBiqW/tsORwplMNLrwK1lg4KyavztOHfZa47ZqU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SRQx/u9L; arc=none smtp.client-ip=74.125.227.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SRQx/u9L"
Received: by mail-pj2-f40.google.com with SMTP id 98e67ed59e1d1-3a0dc47fee0so683243a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790573582; x=1791178382; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aJtKhPA8Ii89k5Bn+ANeNGZlEn8xfbMvKK5TkqbdCFo=;
        b=SRQx/u9LwsgONKwh2yNpAE/GYyxErVeBKHdSMymnX5H1lKnrXiWnUGN20hhECZq1hx
         kJPyOawDx8eVETyp7qLWXtp4hfmsvgZw+mLkmJZr4V3tRX4BYHAZrZFvny80qHN0tO5O
         drUmNpOXEVzY+qxDRRvZoDs8WR1UJNL7LYaEhTBh2+Om1dz3Rqnb1dHZ7v3WTet2Ybg+
         yg0fD5CWvFODWMiacqRDVXXEE2YWfDkgeVafl2rKsgdYvr45vh5k8FWWuUip2GdRQgvP
         Erws6yoHMyLH78Nh1keS0OXgHU3oTQrxVDwFUZRnE4dOE+ciWVdme7reGmZzWcYJJpAl
         4ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790573582; x=1791178382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aJtKhPA8Ii89k5Bn+ANeNGZlEn8xfbMvKK5TkqbdCFo=;
        b=H66d9JDD92KdhbGJ0BFfK9r9ZzZ+4FbaLCMydxRW1b7PqjddbGqrXqzcTFg/cTib+7
         gxijCRuC826ZynYRiMu/89S/upXBPeWHs3oK4OzaogbQFv7aK8ZO8ZxX7hZT1531yJDM
         2lNNUO4WjJx/ogGT+iBHW00tA/ihM3TuQX4yEcx2SnmIVkNj4a7GmgFPKvgPWJdnOAT4
         elluA2vONXnNQNS0cPmx5+ogCWO8yUEUq1yxZMKnocHJX4t7uiGT5rMCGODQKnETQksl
         relsNZi+y73wWAwJwwsfcwopf8iUlno7UZmtP9jWgY6LKab+N0I4EoigoPWGm+KPiBT6
         nZ2g==
X-Forwarded-Encrypted: i=1; AKwUvBzFSGcDw4yaw6sZytPJWaMMXf2sgZIeelifwv5jPwioOzwomKSTj0/j5hLAVBQZ1j3k+kg/9zrM5Mny2Xk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKt07CMVVENiLtNgfXdhkXFN43epVGFz6yGw/oetROVXi4xndFq
	AEd0PwicCIF8P2HbS/bljA+F7z7exxJ8KhQwDhrBft4jjUkvcuvXXlAkQXK1rCA=
X-Gm-Gg: AYBFou01cQs49WZDRVR7FQzZpT2NvnUTzrWOcFZKo7Foj3WLlN2NyY4Rl/OTAY2VPWt
	cJA0oH+IZ3aUK+qEhG7TTM6XelsN9haVnHNFeBVUKnyb5cQ4jvA3UDlPr3DpflJ+KLrB/NXRkbf
	XQl+ehzwlIaiWPg5LXyPVhc2EsKjcsGQ3goPUoETJncVLuqoZimWygjltI/KX+VOYZ4bK5iYq02
	HrwYgtFxhc0+hgXfLUelCJYjQ/1J0WUhhUOs89fatmgbR2AwvzSFZ0ap30nQ0juxdM+TFR86k1v
	Jkn5lLzDbV4LDBgml/OQ+VOBM1x9cAS8eh0ipDs412GtgdnbEfCfmogzKeH0rbURAyNyGjmwRPf
	OOr8Swsd6aTE4W4IZPGLzKiFIeNxU/ohGR4X3yjrdklBZM2qwvXcTPhs3nh7PFMdEpuHuWfyOVU
	VIdDQM9t2xvpkD06GMvI14Riny2dBhvykMZsHCmr8upFjyNCCxchJSyD4HcpkWWdzjz76ZWPYRr
	61p7ocMdlx4pK80Z3CnXaOyMFY=
X-Received: by 2002:a17:90b:440b:b0:3a0:b540:c00e with SMTP id 98e67ed59e1d1-3a0b540ccf2mr7945136a91.40.1790573582298;
        Sun, 27 Sep 2026 22:33:02 -0700 (PDT)
Received: from ydg-Zenbook-14-UM3406GA ([2001:2d8:712c:b4ae:f935:9398:3170:36f6])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec711sm25046924a91.6.2026.09.27.22.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 22:33:01 -0700 (PDT)
From: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
To: Alistair <alistair@alistair23.me>,
	bhelgaas@google.com
Cc: Donggeun Yoo <donggeunyoo.kernel@gmail.com>,
	jic23@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI/DOE: Fix double free of a duplicate feature's sysfs name
Date: Mon, 28 Sep 2026 14:32:56 +0900
Message-ID: <20260928053256.742182-1-donggeunyoo.kernel@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <c4cdeb880a6eb8368c4fdc8de58f3b0bc6c753fa.camel@alistair23.me>
References: <20260928035035.252394-1-donggeunyoo.kernel@gmail.com> <c4cdeb880a6eb8368c4fdc8de58f3b0bc6c753fa.camel@alistair23.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 28 Sep 2026 15:19:32 +1000, Alistair wrote:
> On Mon, 2026-09-28 at 12:50 +0900, Donggeun Yoo wrote:
> > Leave the name to pci_doe_sysfs_feature_remove(), which already frees
> > it for every entry.
>
> What about adding a NULL check in pci_doe_sysfs_feature_remove()
> instead? Seems silly to keep duplicate but unused names allocated until
> teardown.

That works too, and I considered it. I went with dropping the kfree()
because freeing them in one place seemed reasonable, and I thought the
cost was small.

If there are no other views in a day or so, I'll send a v2 your way.

Thanks for the review!

Donggeun
