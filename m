Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793007176;
	b=s/Hbn+8Col6ZzW7+yI5y1Q8+uMwGvQcdkndmscKzUUEC2bqbd5PdDPEL9vor97ApWK+T
	 +f1JImPEMEfR4PBIgeW2Hs9HWW0t9ET7NEoJg82iPuFCJXcpD9xq1DAupXcYXJ9drXWoo
	 FXjosRf62RCN13E9thj+aLLTHFlL5PER6fBCZZ9cx+9/43KIGIEiwGTyJ3cAUApT/bDml
	 PO7ExLNIeihF+n0lUWwNNJq6EQZaJiLA7/bCbVojpDndALcp2P1y5EB8zUsBEtO26+ZRu
	 OM/omSnHcndI13ewauaoz9MfQJpkVW93HBoR5DF4hQOja/ggLfyMwtiEzThqeTWG45g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007176;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
	b=cedrVr1IfV/sJnN7mYuBksjZt2u1h0oXeOky+i4IQSv8hr8mmOatAmwOrnMADSMyff4I
	 PdZkXR5MRacU6f0/RaeKt5AjzobPmLE3e6+sr/DmEvFITMLM7uG7CoacOQ4GSAltrjlOb
	 R9936ay3AjQiXvcycPp7eGqZD7u6+3w40zJLYrSiPlgviKB8AJJgwYsJeusaPgj48Ju2u
	 6vGtAcOwnWINJCEaOTa3Ne5fpZfcAJHE29PAjFhloYuvenSJ2x9Pv86ljDvxTn9zD++hh
	 okBuOfKo0sd54UKzUl37aauJr7Dhwba8NbH74KILrc37J6I+GEgI7HtmcwP0hG55gTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=axzs74Wg;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.161.49
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2565D606A323
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 09:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2565D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=axzs74Wg
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6ddef424972so1577839eaf.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 02:32:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793007175; cv=none;
        d=google.com; s=arc-20260327;
        b=IIdRFOhAxYN+DaqAnGQUDHqegUhXvAPIx8eJbnwlb28PqUPEOoNbDsarflIuacFDAy
         BwdbLgpXqvLVg1SYD7mNrPZvSk2BHGlQGTMm5tSlggvk1zvYLBzWHgrcyybASLA28OhD
         xW7FIFcAJqwWC/9frNSLyCl49Q8zIX3uYFDDINijFbgW+Lvivb6HVML77w6D8ZymF0DV
         6+NwYo3suG+lsrhLZU6fyKO+VhHOwMaeOHgK4dsQqpCW7sjYi+d8rtdaR8nNG5uq5sWq
         kymY2z/WTxOjzcmczc5meIzOBwmcS0qnjyECcXnpUCdv4h/Q1ZoyCaY3YNsC/PIfbedT
         YSvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
        fh=1n8giNFFrUvMuOX05pn7QtaliqkAIErlPzb1IKjL/HQ=;
        b=JuoPtjgsw1FmmkTptVSfUtReuoivXPLVy0eIpXTtDwWlNmLoWBE0xzSLBzUxt8xZkY
         MRWWp7+1Q7RiPuCwXbudL7bp1hzOQUSxdh7wKMyv0XJ8FL8PH0wF9Kg+ID+/ImRHJruW
         CAAC5R+4Fe7mFrODb+7OCvK4Kkz3kIfM/LA/L1BgTngcv2oYomaN4vq8cO2Y7pRo7USY
         Suel/iFfCb+zWurtAWGFUOto73CT30ykkmT6SWlxXs/YIbfvvUT2YiUL0QQ1CVn1sBbP
         deKIPPqO9c1g6jk0xVsQCWrrouWOFm69YMM8Y4Q+X0TZbn8NXNZ0oDNrJpcw/A5p/tK2
         4ZGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793007175; x=1793611975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
        b=axzs74WgATN7HBSH7xkmswDiDnyz2G9wP+K4kFPOIokR6D/ILNhrhyydPLv+EyrnyF
         MPCM8EAceQ3/wjSyBQP91B7lU3RsCzVaqldJLL1eEEj8dfakXpOsWGXYvTdNxMveKmuR
         PstCf0bPnDFPuJOJHnnbe7UxSd7sgYPSDrky0p477ZIB0AyLEzYq8Gb6WYyfzwz0unes
         We1NDOzGoafdGglp3x96/Rpwr02JAtdc9B0wDHtXnZg1tuHEXWTAyjAnxwEfST6IW44e
         f7ktgVC0n69HNu2nV5fGkEfBku9c7fDUnYXuwq2qwltHEFAUNzAJ8lzBRe68+BY1AvoZ
         Y9Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793007175; x=1793611975;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q6uMsTxs9DnFToK/y/1eGhUA0bzycwdopukAlnns2fM=;
        b=xoblxbvNxy9BOyzLsJx+T/5d55BVTJiChiXdAzv96SPH2110FDkovmlfbMoTGxEkcm
         +AlUANzSHVjeRe95WnaO9rieEuFqPM9uHDe2jma7svglXIAsZojEDm5Cf/24PPpovD1V
         7+q++rvCJBv5mzcSRdtKSRcTaDsK4Mx8+MWEEb0eEX3rkwGGC3G0pDO94RedYuoBaCQo
         c5MnXDbrBIXJTuyhha89EtQfVJKFfcf6B3GPgGWBO+I2mzXpktEwavzIHD9TQIsa/KGq
         dDo/YHTj45WhQmmmO6iPMXEl/T4GlaMg8JYnIah89dJ12X4sKTwO6SAoU1kvKiES4byw
         D2BA==
X-Forwarded-Encrypted: i=1; AKwUvBwyg5+HyPZz9R4yoMgqHoYt/sdYVK9oPxF0yXtz0kdUI2z/H55dUpJQPCKYkEttzwPfxkLbeVqR1J82jJE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIIHMZOR41AWLJchUfJMaQZ4Yi+Yxn/n6ssBR7ln/7nRDlC+QX6
	4Csz3fJl4wDFduj+juE5tRCrY5ydoYj1FisDHaAqfi6R9oT+wsvurKHR2klxVSK4gUELQ//58N/
	vz5P2KcrDLn/6hXR5HfVAa4Eftp1/6PU=
X-Gm-Gg: AYBFou22fr95cSf9ZHF73attCpOjNUsPUat9XmOb7B6XgSp5nv5vL8kbAlwr/WGGn/R
	glgD4oZWSqwLgwOifcqIjGVO2cw36l/8rq1uPePgoDCc5SZjraRnw3D7B4922/KX95MFICkSHOu
	zECgA2xsnUQnA0RWj7SoTqmCM58K1HQLU0k2v4qt0PSahL6Yke2YraAPymRgRVLa60oAx8YX7cU
	lPoE+eVNKaZ5lBVr6bf8AFAEDhf8cXxi6/c4oNgU1FEp87mdW+PwwiPrN+yeVdMCtaZNnjC/Xxk
	mIQVYjf3SOnICea6GgsIWGG4yD1nm4n6+PZll93ZKH4KDAIcrz2ThuGYa+VFFBhJW/DpBQzSpfQ
	kI/rV+zrfjfwPzD6JqlrZBueQXQnmwaCVgsaeA2L+8pYQJLRTyqN7VJh161OMgfIR7XMB3Ck=
X-Received: by 2002:a05:6820:1c84:b0:70e:d5d:8712 with SMTP id
 006d021491bc7-70e0d6cd311mr1154315eaf.70.1793007175058; Mon, 26 Oct 2026
 02:32:55 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026081832.60570-1-himanshu.bakshi478@gmail.com> <at8cAMm6psyWsqbe@ashevche-desk.local>
In-Reply-To: <at8cAMm6psyWsqbe@ashevche-desk.local>
From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Date: Mon, 26 Oct 2026 15:02:43 +0530
X-Gm-Features: AclHuK9WK4Yy6vI4OA679g4Ynf2HPB3VI2XldS6LVlec7p2KSdSehO3JF_dOaiM
Message-ID: <CAGLmz9+0DoWZtmLjUq-8X85p+DrCXKazsGtN-QOccK++d+YGrQ@mail.gmail.com>
Subject: Re: [PATCH] staging: fbtft: Remove unused macro
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com, 
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Mon, Oct 26, 2026 at 2:53=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:

> > removed. After compiling the driver, there are no undefined macro
> > issues.
>
> > Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> > ---
>
> It doesn't say how you tested this, though.

I believe there is no need for test since its a macro deletion and there is
no call for fbtft_init_dbg() which should be apparent from the kernel
and driver being compiled successfully...

Thanks and regards,
Himanshu Bakshi
