Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793932887;
	b=III5eiptKmzCZ6xi+WCJVORT5tA/bUyTPXaES3HYhCaF+HOgHg0lo8ftVuvf2bs03mA1
	 ny3bYbO/VWvVGbgYIazfPJQKyC0u1+o3PdhQsEybXeuOmvFGInO71fj6hJ2vW0ALljPvE
	 alGDUNUOtt1+guOKos758Sf5By/Xw/gh/vGdVrd1FwR554MQ53vRGFdCYMp4EkInUYnYA
	 IAEzt5Zw1hQpJAny9pzGPYQX1nxmcl0fPCkq+gXYHLAz7b0HohOWwKrw0BpUafBK6ZzhL
	 SdkmK7DVf8NlkBjA90HNNrsIfo3NTmiNmIqi71pWr1BMFPz37KZhW2tVIY7Nc2VgtRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793932887;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=SbgHBhEj2YwMxqBB4IHjOewAxZ62fsFAVAzcUtikC4w=;
	b=mLph5k1LYpDQ2+1SA8hyBe4sxvG9xEy+cmcHoM5d1hhQ+wiZJS9O6VaQ+YtX+gawqDJH
	 fAHcO+P+vtWIhvqHiUJjOAS0rqPdcYXjX6jkb2GjGc1UiVna3BhxZaNXHpXv9bQeY+kmb
	 6e/pwidM9DYVS/KyVHQP3tOHlsqyIyJLUGwYUMSylgLFQH0KF9R8dRpCYFAzvrt5x2kgl
	 S/IIgcQCE+op4bGG9msc0q082K9HIn0/6uM2+zik6Mwki6Eso6K5PzpIijyPntsKsnD4q
	 toLmQdlbzwpRVnqJ9Ua+wQRE2bxNVt0J+GeXXsiJzamkjb034JIttjeABnJcWiSvmZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrlJoCt6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7525606A31B;
	Fri,  6 Nov 2026 02:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LrlJoCt6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97D021F0089F;
	Fri,  6 Nov 2026 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793932886;
	bh=SbgHBhEj2YwMxqBB4IHjOewAxZ62fsFAVAzcUtikC4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LrlJoCt6Dua0wOIYbJ/3SvYtQZ+ccvIocnQYDU4zuscD+ofED0ZKQhueaUINgKeba
	 UdxCrOQJmpVXpCeBTE/FxZXggGO9jNejdnf+SPH3/C2BY1vNEKLS3zgxBUI6+5Nb/l
	 t47qmuq9yCZy/ETmmnVGBIzK9WL77N24wsVK1JsfwrsEJ/If2mF5NGK12gUR85tD/O
	 WtZfmGSd9R++filO4QfBLGC0Zy9JCXXj2v0lbc4x7cYNcu/TaZ4gsDUoQZYNWRqzBz
	 RKGuj1NJNKBO/VFDY4FITbDIW2HDzux6v5rYcbL00o70h449NhgAfIW/JDByR5sjgQ
	 Dzrv4Sfp3RdKw==
Date: Fri, 6 Nov 2026 02:41:23 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Yige Jiang <yigejiang86@gmail.com>
Cc: chrome-platform@lists.linux.dev, Benson Leung <bleung@chromium.org>,
	linux-kernel@vger.kernel.org, Nick Crews <ncrews@chromium.org>
Subject: Re: [PATCH v2] platform/chrome: wilco_ec: Fix device reference leak
 on open failure
Message-ID: <au0-Uz1NsgFP0788@google.com>
References: <20261105074709.55016-1-yigejiang86@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105074709.55016-1-yigejiang86@gmail.com>

On Thu, Nov 05, 2026 at 03:47:09PM +0800, Yige Jiang wrote:
> telem_open() takes a reference to dev_data->dev before allocating
> the session. If that allocation fails, it returns -ENOMEM without
> dropping the reference. Since release is not called after a failed
> open, the device data remains pinned after removal.
> 
> Take the device reference only after the session allocation succeeds,
> so that a failed open does not leave an unbalanced reference. The
> successful open path remains balanced by telem_release().
>
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: wilco_ec: Fix device reference leak on open failure
      commit: 80436896141ecca950125dec3f320b7aacc5038a

Thanks!
