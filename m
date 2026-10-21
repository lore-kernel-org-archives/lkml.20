Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792569993;
	b=xATVG89y6yf91s4iGo3g+q6SSsyfflsKWuu9dRMvPf1gUG1p33MYIvnY4/jzm8Ab0gEI
	 qza7rKp/LxMjFtIMOKvSTQfaggrRnO7XTZnUo8iNFXB8Sg2gR8Uobt2nrGxNllbPVsTN8
	 1jdnrdJM2azWtm8/NjYbSk1qhLRYd0er/iVZ+kel9a8+7qS/nONTsx4NZZ0gkXb5Xh7mp
	 xcmhVDj6wmQIfj/vLA3kv8lBt0+ZBl3PYwPKiH1UlQ9dXAliKr293fKwSlai3W+GNkafY
	 2JeUM0k2vnqhdRZPzZ+GdHrsC2Pr1ViA75B0fq7pCJKBQBocTL+iaqvd/EPYc30yTKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569993;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=/jC6vQFivhwMpErjXcXOX3Zbpget8c0SQOKSF+SwGuo=;
	b=1YAfJguzFw+bQ7EVLw0MCnYjlPeSVC4L58bEqLc7QKpW7ph4/OBEuUGvcH0xTV7ZkHXu
	 uLYEBqUL7XkVqlXeFvouc/4ZJ20qJUc4acfia7JSsh9sRhpAQPxnnz3eFYndpQXodPdNG
	 o4QWfRh1E4aUAw269DfBQtmf1SHlonh++eS5t0JseV2hYRjbhiNwt1DkuLTSbg+ziUdj/
	 wcFFQ33MDFsQs4Dy/rDbgYxHiLqaDGqkw4F1H+oTTxo9bFxk+kJEoX60ziJVIIoLYVrx0
	 nZ4al0tTAKTEkAA2w76/Z8t5Xk1yNsWDe5kJO5LG9drTzr4Ov0sK8dmgaMZo0rtm+9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=v92k63df;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75CC606A329;
	Wed, 21 Oct 2026 08:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=v92k63df
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12041F000CA;
	Wed, 21 Oct 2026 08:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792569992;
	bh=/jC6vQFivhwMpErjXcXOX3Zbpget8c0SQOKSF+SwGuo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=v92k63dfXFlpBhqMTtNGPog51I+JXi+HLc6Obyu5dDhki5j71xFUtJTtBltSxCn+a
	 9BxLq3RXpx99WfRNkIKl0e6v/8Ka/Ilo4x0Id7ubWM/sDFBiWgViZLDvxMYV5tI+V0
	 W8xDTRaq6eL9Qbi4riIjrTDaUp4S1u6AMxclxD9A=
Date: Wed, 21 Oct 2026 10:04:18 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: LiuJunyuan <2058432396@qq.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: vme_user: delete driver
Message-ID: <2026102147-eloquence-chef-80c6@gregkh>
References: <tencent_6DFC9819B65A274390D9E2A01B3C1C9D160A@qq.com>
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
In-Reply-To: <tencent_6DFC9819B65A274390D9E2A01B3C1C9D160A@qq.com>

<resend with proper cc:, ugh, email is hard some mornings...>

On Wed, Oct 21, 2026 at 03:50:05PM +0800, LiuJunyuan wrote:
> The staging VME userspace drivers are orphaned and Greg KH requested a
> patch to remove them instead of continuing to fix staging-only issues.
> 
> Remove the driver, its documentation, Kconfig and Makefile entries, the
> VME MAINTAINERS section, and stale VME options from the powerpc 86xx
> config.
> 
> Signed-off-by: LiuJunyuan <2058432396@qq.com>

Thanks for this, I'll queue it up after my current round of -rc1 merge
request is merged into Linus's tree.

greg k-h
