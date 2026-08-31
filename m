Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940937F730
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 19:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788206086; cv=pass; b=rBwXS95hgWWgPeADs04eKWKECLfRlmb5ltTwyLwMXI7GpFVjExura8sIOiyVlo3LAdQwQQ+SYOwlH9MM/jg02GW7HQCaAqBOXYh16IkokpotRbfQNsRNsRhg5PBgobgpaAxVeDNTvBDvkAcAbAEGIzaw/l/C+rrpJUgmp5hzzhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788206086; c=relaxed/simple;
	bh=+vxCOoBvQKdVqFqRYns1+6RMpaZQVpPY0ezVOH7CkKs=;
	h=MIME-Version:In-Reply-To:References:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tzyw/tVWVKGI0BDGLjtCrpukLZYEz+Ff/AqMgY9y0sNWfm9RW+mB2FbdxxcCMlq1VQuTLlW453lClGpzaejNbSPnMa1InPqJfpmwkwABw/xjIxRAh3wXidZl7FwawXvQgpzOqjO3lRTBcR8dsf2MfJLCEtQaYuBVcbhlQJv9dfg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qbaRv2Bl; arc=pass smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qbaRv2Bl"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4a451915d8aso60973b6e.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 12:54:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788206084; cv=none;
        d=google.com; s=arc-20260327;
        b=sXbfileYMfaPtY1GPluYoJOif7TqRqbxGD3GRwBXlr76+HLOntiv11zetM6tJMtBZo
         yH4HI7/XeMzzp5ObN+Dpm7/IbQtnZ6A6OvAZvnsf5z3cLkm7ncx+4+np7WVG9XMKVDMU
         44FZxA6PhzqL9XRvcrUhjPX8/srKwutcCRin18Qn2Z/GUD+SIeC5VnWU4R7aECne6TSZ
         5k63VKQTBbCCPkrG45EwDSqB1R7AVz1osp0sQq95Kb1is9kCP5lKc242sjNNfxq83F/u
         X9zy+KR+U4hFKpLj7ZB/NPBSTUJg9E8XNerXwNhCwGdDp3x1mEA0rlWuF4Omc4qs/Tcq
         WRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=+vxCOoBvQKdVqFqRYns1+6RMpaZQVpPY0ezVOH7CkKs=;
        fh=xjR4mMAnKzjAfEkHa8owFF0IBeI5snTND57bG69eyiE=;
        b=Hmu3KnfeABHYUuaqAMWqPzOBvq21YliGsuhnxXE5g8o38AW6gQZModaLaU2rQlPN4h
         cDVPnM7DEB0uY+a9VBZDwbcV4Z9UW7VBoNJhbr0pLon59oDChHoxjs2bdj5xWFmdTjBc
         KKDUB4rG6RqeZQC7siIoImny5N/xap+IYmteJvhze3yLzQlY5nMJwGckrE/UR3LYatag
         XmuAACcHig8Gi3Pv6vnkMcUB4nT2+Wuw73JR3ScvY32cmSmdn6i5EFFEuP3tG0wGXuFU
         K5OmOYH5OrZG9b7kSOwhTZ27kTAU9ORDRPEydvnl4BQ2F/JxiPNQeVvRBEihKZE2gXOb
         k1jA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788206084; x=1788810884; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+vxCOoBvQKdVqFqRYns1+6RMpaZQVpPY0ezVOH7CkKs=;
        b=qbaRv2Bl7If3vIcFikYdZ30jmkjpwFq+lylihpg1dp3PChABqXpTofdvKcp5nslCE5
         xnkVsL9Q8jPVDntlLiCWCh8cnk2tTXpXZmta4u5ZC7nfr0kPc+UxyPHd/ZcDlWpETzgt
         7H6C/+q95NLZb0wlMKEVyJxjsjT0S3vAeYuSViTCWdr5/JksJEAx63Uw+utXKhJhX9cV
         FEr39kTQkarHU3KLyhJxVzvG+cKlRIBhqIP/WG7m7ViV8BQer8RVy1uxHO9YNrL7nB5r
         hrgzXZbBW2SsAlTSOj6grYR0581pRDpIaiV34Jj5bsRyneweqsQYahQGpl+Va8Jhw33Q
         tMgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788206084; x=1788810884;
        h=content-type:cc:to:subject:message-id:date:from:references
         :in-reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+vxCOoBvQKdVqFqRYns1+6RMpaZQVpPY0ezVOH7CkKs=;
        b=TyVUy+Sus4AocZdRXtiPl/7xFPAUpkpZDdsB05l0CcgG29QXlm8NNR+d2sc8zSOcRr
         Na+9CFo+sT73zJ9+hYyimF8miwcAwZj3oYdyJyZKH+kp8qZ0XjmHcda48Szmc7t5cwO6
         FU96a8GxUD7Rt85s0clpuWoAIiQTTEuMLoa/zzmNZAtm5GeBSrARwEVjYCbP68atrWmA
         Qb3zS5TxLF5eymQdLPQ9PVynVbEB2EuEOqcDqJnBTjkxFCK8lPfy6sdQ4KliLD/9ySDz
         9a2smtJMYZjO1cqv3K2WrtQ9AsxUwA9YKjamJOYr6gUBfd+T7DogyG4epzbROqSazFop
         wH2Q==
X-Forwarded-Encrypted: i=1; AHgh+RqpZ5eqOCtE/v4dl7W85dDzI0mKoYXazushSonHE0fkiVHtAngHdjmOMq0jVvBgiudlVLyewEYW7IDfQ6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++mxhGzP3LiMHVriiVEdPbtDdnuyQaZGyu0pQReafW6jwzLksK6z
	xNypVrJIkK7yeZhxDYhgLmurt7ytWxWY8H/tFKgj4lZtWG/fJGN2wvOh0n/lr6/dGYogxRsZ5C6
	BOi1i+K0t/onBXxAUCSndVlkYxtXC1mWm1WbWaA0=
X-Gm-Gg: AR+sD10vzGviFngwceiA8j83lzeS1mXjJgD4ysIO7UqInzi0w44MrhStwktMAGT4qHx
	F+jQKx7jUMbsvCPFQn/Uo99KOtdYOozIbjkRV0KueTZJ2bV07L7SwJvbsROI/J8MvJCMhycKT7B
	E02tP3hju+sBXvnb+0Vwlj5iQZCWnije5IiG4arsXHGdO4IuRUIa+VuTOGAcFdu5EwlTreOB80f
	BkfMpCYeuRZZNd7Jk5BQ89YQcrMMOzpTd1Z4zOQeaptotLVU2BcZsshgr/FBhRy64IvCA64EGjN
	MIy6zRY5T+sENyiQuSGiPuZ8hrG26ZbINaJ21XaGo/j/3q/oJwzQK21jPcLk4Hd14fhjy57BVwr
	2r6++25bcXLNZblEnO5rr+CZa
X-Received: by 2002:a05:6808:15a1:b0:4b2:8e24:799 with SMTP id
 5614622812f47-4b39832064amr27707262b6e.17.1788206083778; Mon, 31 Aug 2026
 12:54:43 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 12:54:43 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Mon, 31 Aug 2026 12:54:43 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <apLOXaWFZ8ueIEAm@google.com>
References: <apLOXaWFZ8ueIEAm@google.com>
From: Maurizio Casciano <mauriziocasciano7@gmail.com>
Date: Mon, 31 Aug 2026 12:54:43 -0700
X-Gm-Features: AcwNN1WYmwScQQ-E8__J5Z0hveXA-w3_zLjxbl_iackDpkTfBKU5rR8Vf_KpjDw
Message-ID: <CAO7O_xi_egv9oa6ZSWgka6B9nExHeR2qTdix5g7QMcwqNxDA0Q@mail.gmail.com>
Subject: Re: [PATCH] Input: drv260x - switch to using fsleep()
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Dmitry,

I tested this patch unchanged on a Lenovo Yoga Book YB1-X91L with
both onboard TI DRV2604 devices (ACPI DRV2604:00 and DRV2604:01).

The test kernel was built from commit
e5e85128bb7ce1bda7cfd7055be9821ac42b8108 and reported
7.2.0-yogabook-20260831-202310. The validation covered:

- 20 open/upload/close cycles on each device;
- strong and weak FF_RUMBLE effects on both devices;
- three s2idle suspend/resume cycles;
- repeated FF_RUMBLE playback on both devices after every resume.

All operations completed successfully, and the kernel log contained no
drv260x, I2C, regulator, or workqueue errors related to these devices.

Tested-by: Maurizio Casciano <mauriziocasciano7@gmail.com>

With Best Regards,
Maurizio Casciano
