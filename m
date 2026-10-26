Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793055838;
	b=Et3YTn9ASbcKLziPIebE0CiplzSkKAXFO2+3wJ1QspSuPsCzYX+yP6LEivzTwMKIEYN+
	 eDdJvMFbESf93fY4+W3B0wyVJhM6htTEMhjFO3ayx8/xmByePP17gfORcPJdznHqSO2AE
	 O4hTsD9aSjS/hDkFkB9X6XVmbOlPkeuhRzrVCegm7/S8U2lTA3wDHln/TzPmABPWLqeCt
	 j4N79Y6VEuFg4a9m/Bme99LCPFPDvionLvFZ4BtVZ9AQsTncGUXZM0XYUkuRwDfqMwEYY
	 bdDMRvCZpQr46/H+pmC4u+5x9zV1IeR0VBvmCKIp67mP9uygPiRLBTbdvaq93YmuDUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
	b=XuJE5Cp5HbUQGe7qwRz9R5S9xFl/4LNXnbxIOi/yRsAby2stcKgK0oInwyPbAEkKk1SX
	 DZQ/z6kDPSgYI0wjyVEh7ZGC28SX3aYJTgXSy6amgEILnJLfYgrTAtaD59TCLv9ypwcYi
	 jJ8Z/UEDojEYyU0Dg/d3cKSBg/gKltH7SRzl3yeCoOmt8TgLWLdTJNs70Rktu96MXHOVU
	 iSRChdClBeCmmXQXugumk3nms4R0Kcz25eheFCxyz+NzID1VFRHvZapZG33klBSF3cgNQ
	 nr/4VApNrQmp+zVSfnRHQtnxdIJk4tF1yi6MpU7suelkxGB16Vxh+e98VjX72VvvS7w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZz9kKk4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE691606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 23:03:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE691606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jZz9kKk4
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98c7798ce74so948889241.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 16:03:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793055836; cv=none;
        d=google.com; s=arc-20260327;
        b=KCp71Vc3bUj6JNjcIjDY9yY5V03QRAnQCQ+qtHyxd970aqKv6nxjAMRfJpQ0UEeZO4
         opkixrwZVMdtpmzY5fuFWZniCEZukMQkYa+cxPFqOxRFC3fldMNVbqELoVNbbCcmfeH7
         cYROx7xSFkBBVpoUBqkyBfL1QQz0zJL+u/0ZrTTAT+Ex9uNqS6+Im5xBVIXslDn8LlIH
         YPkLWUmdU9nY8Z4XnwWnSxyJPEkXYFUzInH8AHdD/t+4nG61rH2m3QIii3LnpLs7bjRL
         OZYnUHDnUwOPlKxJCpYtonPfcIRWWWG6+zkEPpM9EaTB2WxrkTyfv6zL7E7g3Y0wp8fa
         RF9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        fh=0oFCqs07U3qFprLFyp3hX6hXp07pN8jCDFjqZzhlloI=;
        b=cmopxTkokgYhIBYW/ZtWiLnmJfaTRoDO//PnSDoR7AsqcmTlNpMhjuc4ughIlAGKh+
         bdZKeQFuAiIiQHneA21YYwPonqGiKASHTdjfuptGYL4nE/yh8Q/CladTw8DnBwGy3R2m
         NWbqw9MJfOUQCHaoITM80I6Y7e3TbYhxub7mzB+qOtP0w5wSzWbWUFfUU7qPzungq2Y8
         65MhWUjRX+CBdztD5XZTp/VinhLKyyavqDBiMoWxh8C32UkmA5pDeVxGCl6lG4bGtMsg
         xX6wWqOcUQfQB/JANROFmr7AdNALrPKCzvFKzYT8gsGuv+BEike5/M02fT7zpzoz3+S0
         +hZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793055836; x=1793660636; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        b=jZz9kKk4Hvx7975rPnqAOpG2BDDGbG1wGe+6j7dFUC1pE+0uZyJUkQ7Lfb9EPJOyVP
         d8/CXI3hG+x8KMP5QxUQMw3uLbSMqTYRFLn5VCUxPjjBs7GpFcYcsDMbD3z/23n4b48y
         kWNPUERCIWBMP5DU6GYkghTHqON34amEU9449mLGkyK2AW1QcSwzTYjulGoGUg1ni5nM
         k8K80+HFvSiibQBluYM65q9tHQaM9doEZPo8cxG0L8+VTWPMeH8QqSbVvXSAH+cynCB0
         UbYODQQgx7wnCP91P+TIQoFlFOttOQHCCSPt3J2a+/sv0MjzUKraHbZJ68RSZdK4wpjI
         lmPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055836; x=1793660636;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RPX+RWHDa83ciD85+v8NE/MCh3vpHSDKFtDo6LQXVqw=;
        b=mNdkC3BBWM8uyObcaP8AirahntOXd60U1CH2nUo08qcCcD2Pn9TujHoan1tzQqPr6G
         22CFS1bx6Wzjd+vZM8h2F7tTCkbCwJcRxEwEuYjyBYDypU2RFed4oFI/n2V7YD90mBo0
         X1es8KKE7KcvlZyAuBdgg6UrovjDCZl3sO2Bukgx45uZPL/ECsdFAVzoK5SnYlcTV00c
         rJ7sGBIGA2p9Rq7pMj8qRUAIMBnFG/shJ6/5PfuhoIM4Iht4Rd0YwfF7LLx+BPcZWgnr
         EygAASWk5NWC4H4e+qmeGqRnGj4fXZXuzgonEhDjbafA9FhHFX5JYxqhmsNiwpDvIu1q
         Hp0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxKSxbqo7gCEG+HCe+KhVNYTQnWx6PGmFE8/qjP/kFvtk5Qh26mK9E5hx6lwrwDJa2WP7Ky2VGLQK1zqNg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKSoYLxy4Q/JaYjnyNOpxuwhSusgSyUOXLr2es3WhO1RYjScwY
	NfSprBYdz5lK4L57ACPPBhkTOKzue5oQgdJt/NQbGN9npbSTHkAaDx5l2FC8jMWBdjHrYd0DOV+
	LGtAojAFyw0M1RGOneC0+0pHsANvgS+I=
X-Gm-Gg: AYBFou3eehKprhvBbyM0nKGImIOINHhA85KjAcvzLNh2reazaWMk7qWde5J/FOPdDGB
	H5+NOeK+5DUb7pzHfzq/PpyHD9t4g7UwqplUJLGO5sR8AfV9uRjRbzxUXLGeQqGhYbkAQhWOiZE
	ew6piUbkeDCj+wv5xWq58zBn4bNvoRnS0Es1L+TRPdoT8FbbTusUZqcVNbTSooh1Ua6WMSuwDQn
	gByA5KX4q7X0PbOZd2PiDkCfmKA8x7OPU3K1FSb7kA+7i5eHGBVkvtI9H3vUygI19rCE6FB3n7D
	+K6qi4IB6gCYYUdZH/zvvpiWz8XKv0ej0DlV6MasQENg3nK3GOLbicn2d0ouCCw5ZUbyL4i3C72
	+rQt0UxvYMRZy0t7MNyKuvwfxYVoQGydYp2dn7lx2ePF+uSAFyPxKskP35533WjOm8j8=
X-Received: by 2002:a05:6102:5049:b0:7c8:fb4e:a3b0 with SMTP id
 ada2fe7eead31-7ce5ccddc2fmr2242244137.12.1793055836538; Mon, 26 Oct 2026
 16:03:56 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022193853.670625-1-ansuelsmth@gmail.com> <at_arsis_PFKDFxb@zenone.zhora.eu>
In-Reply-To: <at_arsis_PFKDFxb@zenone.zhora.eu>
From: "Christian Marangi (Ansuel)" <ansuelsmth@gmail.com>
Date: Tue, 27 Oct 2026 00:03:43 +0100
X-Gm-Features: AclHuK9hoAjXwtHctYpz4oUv0zbqoQn_yeGbBI3iJDzHErUSMIyJMIBdwhVkFh8
Message-ID: <CA+_ehUwY2Z-qvrX5+sdZdrtpF-QtAozi7fHbV7Zz2cM-5UzPHA@mail.gmail.com>
Subject: Re: [PATCH RESEND] i2c: mt7621: fix copying uninitialized kernel
 stack with reduced page_len
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Stefan Roese <sr@denx.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Wolfram Sang <wsa@kernel.org>, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Il giorno lun 26 ott 2026 alle ore 23:59 Andi Shyti
<andi.shyti@kernel.org> ha scritto:
>
> On Thu, Oct 22, 2026 at 09:38:51PM +0200, Christian Marangi wrote:
> > When a page_len is less than 5 bytes in mtk_i2c_xfer, uninitialized kernel
> > stack data is copied and written to REG_SM0D1_REG. Equally on the read
> > part, an unnecessary read is done.
> >
> > Guard these extra copy/write and read for the page_len to fix leaking
> > uninitialized stack memory.
> >
> > Fixes: d04913ec5f89 ("i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C driver")
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
>
> BTW, this is not a RESEND, this is a V2 because the patch is
> completely different from the supposed first send.
>
> Next time, please version it properly and add the changelog.
>

I used the RESEND tag for this as the first submission was
completely wrong and didn't reflect the actual changes.

(file got mixed on saving and committing)

Had to be more clear and maybe just say ignore the previous patch?
(a v2 implied that i made changes to that patch but there weren't)

Anyway corner case... sorry won't happen again :(
