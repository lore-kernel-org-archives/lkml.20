Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793478672;
	b=m4myhp0LiajMsHDwARshgfcP9a23XMseUgW/UxWEx9LoSx3mLjt4dGa3YrUMZf/cTC+7
	 9oZr1yscAZK5HMaKizJ8YxsC6qPWYVlqJofed5Kpu3meM44NtYOBbHyQldqyKzQpMK4/3
	 5AGuUM7oxkoKBfuJyr/g5/4ISmVEFXUBgQ9VgLhE8LdyEQ5ShQr3fBbS4cUqgx2fVO3vb
	 S9/Zn+pyZXZBksUWpZ6Vyhc3MqCrN06LATJZ/kbi5gTwbxbnKF3cIINX69Tik4wX1Q+QJ
	 P9nz15EmSXt/ordnj4Bu2upL1JmJfxEqL1/JCxcUo68yY0KdQUIZf6tl92kD8sEboyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793478672;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=omvjLSNmL9Y4+XmWNzxh4xct/6+W8OtCOiU2fFjEVpY=;
	b=0Y6ZKtjC1YEvLKKzmHgyqT4Qxnqa6/wDWA8f0z8i9g1Ltax/6e2jWlTJRmlRgJMc8IVN
	 KBfRU7zoC3m8h7WRzwHblszVt9zUUobTwWninSDk30ZrAdKhihb5dE1d+dIep8spZfBm1
	 6bhqSIzN70laT9Yb+5nLQkdMnKBvBixG2+5f/OSerORR9kwYOY2qceqLMp9mJYlc8mw+G
	 nSvR4WiTCvQSvtKYcVUXGrL8P0Lal3Rfh8to4ADPqlosMRVg/oJ5hiL3WOIwG0g7SeSFv
	 yp5k09Z1J/TXr1kKtQjkyiby7qNCFYM8gqREL6EVk3estVeW4OVamvyPhXDO2jV7kiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OPHxzFgv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206EA606A31F;
	Sat, 31 Oct 2026 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=OPHxzFgv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99C291F000C1;
	Sat, 31 Oct 2026 20:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793478671;
	bh=omvjLSNmL9Y4+XmWNzxh4xct/6+W8OtCOiU2fFjEVpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OPHxzFgvW/UtDbOk5nxiQxgyIu4G/w3fBrywGjnwuNBbzLBAKB4/5m9R0pwrpq1AI
	 6swuKVE7yTNaFmY+vp2fgI6Wqo/Kw79rfDFL6111O1GovvG5qbj+JygzoF7r2wcDTN
	 37gQulVlnHJJho1fmJgn6TaSJ65+CT7Yp/hsP1P8=
Date: Sat, 31 Oct 2026 21:30:01 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: octeon: remove unused
 cvmx_pko_get_base_queue_per_core() stub
Message-ID: <2026103151-sliced-showoff-9b0b@gregkh>
References: <20261031160902.2540710-1-vladurares@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261031160902.2540710-1-vladurares@gmail.com>

On Sat, Oct 31, 2026 at 04:09:02PM +0000, Rareș-Mihai Vladu wrote:
> cvmx_pko_get_base_queue_per_core() is not used by the driver, so its
> stub for COMPILE_TEST builds is never called. Remove it.
> 
> Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>

How was this found and tested?
