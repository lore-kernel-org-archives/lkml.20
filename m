Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5242A3B8950
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789987967; cv=none; b=Vau+CdJJqYwkIfMHfCw4jCGZucSmjpJjBEPDDV4fXnPlxtgrgYMaLYBBEcPzVLGjJgzD+6dQkc2EyKuTWiGVapXgEQLmE0r6agfuQQ4IoZRpacQP0l2vaEqR9t61uNzGwPrbr5zVn4uZ2u9cAn9wFzx6iMs0EGT+n8kkxagCnj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789987967; c=relaxed/simple;
	bh=3paPf3xvSBd+3IGy7fGmdzP572lcWRjJ/IP0IXUgrqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPQpQdQ8q62cwGxIqHUoUm6u37GgV58l4rxuyPZgMlj8QX5+3UzwMwtMnKksMjWs7DRXsbadF1eR9WbWFCcEKcKu8A+XeAMR9XSZLt3k6Vehpf6uWVmn712zITGpBWxvZS/OQMNuPKsxv1kaa/03mjSMeuZHOYfUbdBVHs1zO5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFMutsMg; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFMutsMg"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d91c22d27dso15811615ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789987965; x=1790592765; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3paPf3xvSBd+3IGy7fGmdzP572lcWRjJ/IP0IXUgrqE=;
        b=RFMutsMg74wvmacskFeKYPWaXp41QWi5NmKvl78XAVopYsgrH+A78qMPBrRKQo+VnP
         5zTceVG36RyKuAN1GBjDZqQ0kqNxoqBhkc8TbfnLKPxN7ydUDDERAmh3lkoxcPAfmAfx
         yZ0+A6o7+0z3C/oV7eR4gS7VNbuNJU6TSdu4g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789987965; x=1790592765;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3paPf3xvSBd+3IGy7fGmdzP572lcWRjJ/IP0IXUgrqE=;
        b=CWLfHblHkXdf2zAOKyALnJoDW8yZNGf6IbzO5kc8XudEaeSy8LdkNj7iH2yFNFg2TQ
         HTuGQDDftpVw+C0N1TVOQ7fYjz19E0a2CGtXhlN8HJRFcRirnsfs/nOATou4Ab+eYpsn
         884s9xhIL2INKA33nIPGmEu+wEKIZ+DTIjUzDQKwnHRNHEThuA3l8W0LKxohIW3TO01K
         GM5j910iEF2RNVoUxDhSqbKEXb3qIf6aHUexqnQDEYaq4nXgFnUPcUFnf1yixxjIzxik
         RFky5hE1AJ+xDTMecFZOIx3yCXFDmI/DtD7sbrNkcTmz0icJCbFpnREBYoQCXj+j8HfC
         55gA==
X-Forwarded-Encrypted: i=1; AKwUvBy+nJaBL++uDN55ZK2ucGKsZ3t1rtK1/Dv5ovk5Gvv6usipKqjOfWVOe8BvCcFzlKOQJu94phdb2lblfXU=@vger.kernel.org
X-Gm-Message-State: AFuF++kN+TvMtGJf+WYAxwxKFHCC6r5+hCtSdu/l5S6g1F9nn8nDd3Gk
	kgM/jhFLyplYwoc1HiKDTXKSqWD+/FFY2QIIfW1ICchiu7MuCkTWNy8axEDXS1rxxrSus+V/Ep+
	O2hA=
X-Gm-Gg: AYBFou1lPrV/TTEDOnrY6pEX2/WBIK4VXHFSy7FcNA3p4blI13T9Rm5/G9uIOYjU0b5
	bB4MRQEFqkZgh4MdA/tSB2y9cDyOS5BxS0U1ZBwvokF8wnGnlFqJ+tbXu5ENWuAn8o+19bG31CB
	H52bGrSkYkzSyDOsf0gliaPueC8P5nJZN4EEEfLkxcZpLLVe7ogg8c12uW6Qme2RkcIS8trUobo
	9amJtZXOaSiQktD4AyJKZscQI6egRx0lo6tIKA0RZFwkYVgdbWibwf2Fup/H7cQYPjrdVirlghO
	gVX2QIbaJBeBXjfT7GqA+OLVESXcQA+/Kazyp1aNaSkha12L9u/f8uY+HsCdEhBqIhI8ztHAbWf
	JBg4v7Le7KhJ9kuyXPDXFYHWUZjNswuJf/KqIn6ghaZ9t40OcIZz7srqIzsHiz8713MyUB8EJhn
	BskqCNjr3oE0lrjXJeRbczsrbg6qlDp9Nl37b3RWidady7dlnUjLgEO8rA6LvaFibVYzW20Xnbl
	kZO5oV5wzMsRNtARoTq2pqI3+SB2odyq7WGpQ==
X-Received: by 2002:a17:903:1446:b0:2dd:c100:4b7a with SMTP id d9443c01a7336-2ddc1005ecbmr91003595ad.49.1789987965532;
        Mon, 21 Sep 2026 03:52:45 -0700 (PDT)
Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com. [74.125.227.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d7115sm31615595ad.66.2026.09.21.03.52.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 03:52:44 -0700 (PDT)
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so2115989a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:52:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw0d5JTVWKV/cJplPLXexRl8kP5lpS7EAQY5STNtGSN5xJMhHvcAH4xSh8SK+n4BseFLNVnYFNJ7Szoees=@vger.kernel.org
X-Received: by 2002:a17:90b:2b43:b0:39e:1ff0:331b with SMTP id
 98e67ed59e1d1-39e54d37ad0mr14497597a91.2.1789987963836; Mon, 21 Sep 2026
 03:52:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260917212951.558283-1-henry.paradiz@gmail.com>
 <CANiDSCsoLGGewmpV6cL=wgkMh3qx=5dU_mVWUi_NaBdfZp+hPQ@mail.gmail.com> <CAMfFSnDa-nGr-mxzuK9FibOCJGFFCBjB_HiLBwGJ3btuFR=WVw@mail.gmail.com>
In-Reply-To: <CAMfFSnDa-nGr-mxzuK9FibOCJGFFCBjB_HiLBwGJ3btuFR=WVw@mail.gmail.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 21 Sep 2026 12:52:30 +0200
X-Gmail-Original-Message-ID: <CANiDSCuUBCbiE-8Pteo=fpjT8AK9WN_s6AcR-8K43da3inteXw@mail.gmail.com>
X-Gm-Features: AcwNN1UxJhqCvpukKhOiZnjWcRIkoMQomDv89By3KXFXhyvcJ1jkAhkv8gCkMx8
Message-ID: <CANiDSCuUBCbiE-8Pteo=fpjT8AK9WN_s6AcR-8K43da3inteXw@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: add capture quirks for 1e4e:7102
To: Henry Paradiz <henry.paradiz@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Henry

Thanks for the extra info. I still do not get why the device keeps
suspending if you have the UVC_QUIRK_DISABLE_AUTOSUSPEND. Are you sure
that you do not have some kind of daemon in the system doing any kind
of aggressive powersaving?

If setting power/control=on fixes your issue... maybe you could
configure udev to set it for you ?

Regards!
