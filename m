Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3A84418EC
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154008; cv=none; b=PVqqzTg2Ob+oZZ6yhSAj49KkjKq3us/jpDAnDsbD2tmPZP5mJVH8eI8Hoa7mLb1cbpmJ+D7bTj4xVFHoxNEMdZ0kScW+FI801G+DFOHj79YjHAbvQ6VfiX3ZK/c/9vrLH7tDzO5C1JzITwAmEwnRX13iQ6/90izAZZU7JhFtIVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154008; c=relaxed/simple;
	bh=FbzAJg9KFAd0XK3d8yi6dKFFaejwIzukaaxckgS1/bE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+NIpy5qC7/qSARFi1XVfAJU5t6ho2zG5lBJt6nJGdWu6gnwzaIyuO3pwuDz6OuXTGsbVtWNvA1LzavxBIhR604BCCzMYekbLNQSYFPxy8tgRF2GueDkMm2hwK2XuUX/kser275glBF1h45vwgnql+CfxR9Wu3EyLYLrFf/nB+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XGiDAO5T; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XGiDAO5T"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49fbca514f8so434115e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 02:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790154005; x=1790758805; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FbzAJg9KFAd0XK3d8yi6dKFFaejwIzukaaxckgS1/bE=;
        b=XGiDAO5T3VB4VxzckdDQR8drzNPy8VUTKQ+f1233xydwegKk1rtJEIcsTazkzOOlKC
         xi6oZoSYw9UfIc/T+thufhiQBzzO6Q76hpw3RegMp2nWam0hKVL/0RLhBnUk6OVZER1S
         jA9h2x8yfXrq5VkiObRzKOZbxsHW5WvlAwYTYVy4EfAk9coNl/Ptub/eiyRdvMhySdtG
         gJ1QJAj8f45YEoLFg3Acyq7LR5MVJyl7i+AshWJ0nGDAwIVem0SycDE/dj36lccggXPq
         9shf6deNF/S+lhtqS5SZj/XjihuxSpbcwtR2oLYOEPcTLo/1YtSy2DGT2uvxoIjRVAaj
         P6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790154005; x=1790758805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FbzAJg9KFAd0XK3d8yi6dKFFaejwIzukaaxckgS1/bE=;
        b=cVJwT6WELSXKltPaM22UXbMneojhe5AND+LV7Mvapn29CdMyY4iwL3724VshIY+n/x
         2TGeMTJUM3WdKgyb25lVdCQfVouDAWEH4e6h0dtkMJUYcByW5z+z+fvgT7JHsYgyt2sj
         Phb3lVi1qOvxzD0YDUoRBaqU+OQovUkobFq9pn8ICP9pyU5plW8L2GlXUcZFC/RwOMkw
         FcXCxb51a6QpV4PythQoovdP55apS6uBYMMq7kEYvyYvhiJb8PmMip9S1cV3ph20Oz90
         o6sO0WYrfpIpeK9wdyED7/uZ6AzbZa3o9cgm0Kny5icqibc+MQrPPGF5SJqiToYa0104
         9Ibw==
X-Forwarded-Encrypted: i=1; AKwUvBw7ebcnjxgBSWhX1xCQ4NlsCIeLkKK8MNYxToDTusU17RNWQXNse866Fd89hFhdnnsjIRH1FxwB6mh/Ixk=@vger.kernel.org
X-Gm-Message-State: AFuF++nKn9PaJ664r8UnXLjEHVCVxDADoXVl5yF6QyhtqY2WIM2oWn/7
	Z60EaIF3s0RhRUq26/AI5e5Qr3PR7oATEWJxbYbVKSAnlFC44qHb5wmG
X-Gm-Gg: AYBFou0RgYeNi4KNIqlT7RWB2Rw6vXhJZqKP3RQj3Kvem++fXpMAE1hyLiZhYKTJBZf
	2QPPqz8tHrOWjsSnJTXi+fMcG0ycxpQMQiaT62RF09DmDAh6ZhfR5dm6YGC8b/0ahSbApZ211Jd
	DTbtJZsI1q71cVIP0ErQWV/LRnp245Bi62VMDVcBD6eoQapW8L88hb1qRLnqEUajyCjRi4EHcmK
	tDPhE3X4rR3+T8ZHDc9ojaJp+mOOJYhEmNZjzZgNah5NtJvlRKv0UH4x6awFCl4bNRiXPvnRd8X
	YIAXhloqXVGQVJDpkZCYwVy+0qHc7RLR9rN8mUIJBjFEwYg3GSp3v1fHsuXnQZM3w9u9Vo8voyS
	mpTlaw3HwrQFTVzw2C3BoCJrW+bDJJ/HAyjtlKSBqGAwYNZ2g0BHgcfUDyQH5YjuUNl9DwEZZnZ
	KXOJ2rCbI/eXCGRBCLmf3yUSkX4vf3LXW5vOJxLWHoYatTc0a5uPMtUm/biQ3gISz8zzPpEgOPn
	YxJ2tHD8uj8pSCkvwDGmVgIEcfhBEAu9NmLD5HQuYdigg4KVE+1wt0nkD02sRv7
X-Received: by 2002:a05:600c:4f86:b0:49e:6683:d227 with SMTP id 5b1f17b1804b1-49fdec5dc40mr23139865e9.0.1790154004654;
        Wed, 23 Sep 2026 02:00:04 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B8F4500D949869966507951.dsl.pool.telekom.hu. [2001:4c4e:1b8f:4500:d949:8699:6650:7951])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fde197466sm56190915e9.7.2026.09.23.02.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 02:00:04 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-phy@lists.infradead.org,
	kernel@collabora.com
Subject: Re: [PATCH 5/5] usb: dwc3: rockchip: fix USB-C reconnect in gadget mode
Date: Wed, 23 Sep 2026 10:59:41 +0200
Message-ID: <20260923085941.16418-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <arMyLlcFKgtlwW_T@vbox>
References: <20260915-b4-rockchip-dwc3-rockchip-glue-v1-0-763bb546824e@collabora.com> <20260915-b4-rockchip-dwc3-rockchip-glue-v1-5-763bb546824e@collabora.com> <arMyLlcFKgtlwW_T@vbox>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Sep 23, 2026 at 01:58:19AM +0000, Thinh Nguyen wrote:
> Acked-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>

Hi Sebastian,

a heads-up before v2, now that this patch has an Ack: the build issue
I reported in [1] is still open. With dwc3 host-only and USB_GADGET
either disabled, or a module while the glue is built in, the build
fails with usb_udc_vbus_handler undefined. The dwc->gadget test in
dwc3_rockchip_vbus_handler() is a runtime one, so the call is always
compiled in, and include/linux/usb/gadget.h has no stub for it.

No new build was run; the result is the one from [1]. An LLM assistant
helped draft this mail.

[1] https://lore.kernel.org/all/20260918091032.15593-1-royalnet026@gmail.com/

Igor
