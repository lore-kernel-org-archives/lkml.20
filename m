Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.79.88.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793776825;
	b=X5E9XLZyHOYRFT5i6JiFbX5UND9i5DZrN4cedSCw49h0BzZqms/ZEysyMzRTaIvrYkgh
	 +J7YwaMqaaI5ABPiYvMaI9b5V6H/1e4RITSB4OYAvckwLDjZpFZN2rHY44zC4dFFF+d2/
	 ErKVBdPGh/tTUFUJi0Ds0jHOZkUycl8ruJXvp5pzxee/w7GVCbyyhKYkzj/ZxPdMq6HVa
	 bT9W1YOEOHQhB5mfpvobeeYS4sn7gnDFM0NIQdQ41bfbf3rpMqbqoYiFNklPdeuqKoIJa
	 U7EJKi0qSz0aKtaVnD/0EjEhvEla7ZS1nrKdwHjnuHUb1NQHyMZ3eIHxIkU3PWHLcdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793776825;
	h=DMARC-Filter:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:MIME-Version:Content-Type;
	bh=fuuQ1qYN3qm3M/bA+/sXyGSe3bL9LUEYjIg2hSq6M9A=;
	b=vo07NlR1xGBF3E0o2PRE77Hsp0N//BoRLbRhooHYZfUXSly7B5MVuUgaUVsDOh8aX8Y8
	 Xzqgv5gYm+4EHTE0J/3CkQvW0U73NmW2byeZQK4z3b33OXc+KmkuC57lZMU+Ea++tYIjZ
	 dlUVczcvwPgszbQKRac9rwbjlt3PVcDAJFKvqKkZMU/kqE9OJif3uU/PtUsLrGQ+QcBRb
	 vaN9G0TsVWqRUaMqiKVicKOnt+A/X2+XuTVHznVCmW4WVx9aUkAvz2JNszS0xDaSzdzFt
	 WiDiCmUU2ofXdwi8baSKUaz4SPH04LJbMiQ9ZIKNxJPzS+2f/N1O0m3RRUD3fPDveSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lwn.net;
	spf=pass smtp.mailfrom=lwn.net;
	dkim=pass header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=sQJcK+6i;
	arc=none smtp.remote-ip=45.79.88.28
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEA606D815;
	Wed,  4 Nov 2026 07:20:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93CEA606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=sQJcK+6i
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net B091B4091C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1793776818; bh=fuuQ1qYN3qm3M/bA+/sXyGSe3bL9LUEYjIg2hSq6M9A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=sQJcK+6iOfE2CczgpByQzFM/DwUFlS3m7p7bAl0MHDEU/C/x1vzM0KvdmpzF+cxsi
	 lnVoM4BHFjsZ9+8wJjaNMamdMyKfhkoUJCCTGnS28484jqfTZsBzzqJt2dC3z+xkNG
	 D1DyQJZaCtj6nNoqYYGuxqHxm+pnevggfu7ROqsjUINl+QtB8UFfUSp/KT+YSMn44g
	 FrOIODy0Lr6Tjajz+GshW8suT5wRYYWRYdPARjKam2ozPJrhBp+muRpBbduUaA5jEU
	 eMu+YpuiJdG5QV3Wfv5AD/BY1OcJa+dVbOioZ30pqAmqjidauVLyD4tVG03a0Zwf/8
	 aXgFVEvMxB/sQ==
Received: from localhost (mdns.lwn.net [45.79.72.68])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id B091B4091C;
	Wed,  4 Nov 2026 07:20:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Weijie Yuan <kernel@wyuan.org>, Dongliang Mu <dzm91@hust.edu.cn>
Cc: Weijie Yuan <wy@wyuan.org>, Alex Shi <alexs@kernel.org>, Yanteng Si
 <si.yanteng@linux.dev>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: How to attempt to gradually eliminate the compilation output?
In-Reply-To: <aurU4uKyIUBl9-CJ@wyuan.org>
References: <aurU4uKyIUBl9-CJ@wyuan.org>
Date: Wed, 04 Nov 2026 00:20:14 -0700
Message-ID: <87y0b99i6p.fsf@trenco.lwn.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Weijie Yuan <kernel@wyuan.org> writes:

> Recently I've sent several patches to fix warnings.  But since I am not
> familiar with the actual codes of theirs, I'm not confident enough to
> touch some parts, but only the most obvious ones.
>
> Since this is a goal that Jon has spent years for, I'm wondering if it's
> possible to periodically send out some email notifications, which will
> use the file paths from the compiled output to find the recipients and
> kindly ask them to to deal with these annoying outputs? Perhaps we could
> use a script to do this.?

I think that nagging others to fix warnings is not going to make anybody
happy.  The best we can do in that regard is to try to prevent the
addition of new ones.  Beyond that, it is far better to send a patch
than a request for somebody else to make one.  If nothing else, an
incorrect patch is usually the best way to get somebody else to create a
correct one :)

Thanks,

jon
