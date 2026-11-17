Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794881837;
	b=4Qr6Cv3tbFrdVGPJjDZkZpAkTN21goDZKl3xTbBlJAfIW9KtObmeoXgzv0Yx6ZfDl9nR
	 NASB/YpbkW1sIyjehFvmeflSafZDqt9o/9WrVScfBJCMgLqBfI9iaBegA8MqEGE1PdhYb
	 VaYpW2If5w2t1wGP6rY569wAOutGw7uzDwIcVqxjbEeCLF7b7c14fEr8bx/JXOOmoKyNW
	 qW5CWzzhWzfO3a5pmYOzI1CUpIh57uoffOFlNjfrpbwBFeX5QLOSdQC4HRXxGi28KdKUi
	 mgnjChsVF7r3pTasSVll+HrTlkH72lXSjnF2eUQk8FmmkRyMCtwa1cNinVAbSIoTMsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794881837;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=e0nFLX3kmOFtLmTXd4F3aVcB+6sTaFXFNO+asoKn3JA=;
	b=3PgW0z+RNX/YOFtmPP6Lm8fFZr14fHnul1IkcGVgsIg6CFWduG+SX6Jt7VsPvHFvKJcU
	 7iW71WngKVMct2gDNYsQoAStekvmvT93EsbT132I2fQjGvkQ5BEjAkZiBKF5ITwV8hFkq
	 EGYhcwpiF97RPlBrVjPA+8Hti/fK+I37AkNFA8YmXPRSQqt4oDtDiuzDqe7l5BXgA++4A
	 /1Bka8kBIoMQjqfzlYYD4sSseUIVf74dpaIMAB/tZ+iHcM3Bgvugpa5oo3FOBZEysmded
	 rpTvJMCn0pRHaYGFH4heYSLkKRn5GOa/pDV4HxQoitunt8RoepxE1EG5cYoRBVxvF4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7YQBMkJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2115C606A333;
	Tue, 17 Nov 2026 02:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=i7YQBMkJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58F61F000C5;
	Tue, 17 Nov 2026 02:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794881836;
	bh=e0nFLX3kmOFtLmTXd4F3aVcB+6sTaFXFNO+asoKn3JA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=i7YQBMkJmtxEWd0fJ7GFx+gqgPsREc03S5UyeUvVjwEr8hPAlAN8lSuNSjxZ8cJki
	 yQVmbPeDDDtG9wNXEMA/+0pwgxvpAmfbwwBAAZZx6owXZ1YMtJuXG14QCXmiiLU9Gk
	 YoivBhBIY9N1PVaFuLVd+gzJsjNv33qN/Bik8Q0Grbf6e+UZMPvnyjUr8A73t1R9ts
	 J2m8d55yhQkKtOpZwel4XXiIqigxSVfAwJRSgC/gfwKfHdsulC4omCz98VKjw8IuGa
	 B058zZxF2ykQeSLXHA+veWENR2AJUhr1O20lOxo3UQ4LG+4M3ZhrZxvzRZV3SQ36mq
	 +ofYpwaUdrJ+w==
Date: Mon, 16 Nov 2026 18:17:15 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko
 <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Min Li
 <min.li@microchip.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek
 Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard
 Cochran <richardcochran@gmail.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, Grzegorz
 Nitka <grzegorz.nitka@intel.com>, Karol Kolacinski
 <karol.kolacinski@intel.com>, Saeed Mahameed <saeedm@nvidia.com>, Tariq
 Toukan <tariqt@nvidia.com>, Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v2 0/9] dpll: do not serialize driver callbacks
 under global dpll_lock
Message-ID: <20261116181715.6f7d7f09@kernel.org>
In-Reply-To: <de304923-783b-4533-8507-514a15b3556e@redhat.com>
References: <20261111164021.273409-1-ivecera@redhat.com>
	<de304923-783b-4533-8507-514a15b3556e@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 16 Nov 2026 09:24:39 +0100 Ivan Vecera wrote:
> v2 no longer applies to net-next since net was merged in. It conflicts
> with 7a3837929d04 ("dpll: notify about a reference sync pair only if it
> was added") in dpll_pin_ref_sync_pair_add(). Patches 3 and 4 fail on
> the same lines and the rest applies cleanly. After patch 4 the
> resolution is:

What makes you think we'd rebase your patches for you?
-- 
pw-bot: cr
