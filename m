Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793017813;
	b=X8sd0fDoHgtpqAwqiSq9TiMpwvAymZjUEwyA4gQZ2tL9Tkk7/FGU3Q6mAxF7CwCMc0yq
	 4rdoM1AqHZ17PuU8txWVqyxqUf/5Hn2kt0rr1OdRtdsnp+il2ku49mzEU9JwlXLRiFt2g
	 pxOthHPd5cmbSFxHLgwsupGrZ2seXsA1vrX08XEVNU5Pt/gIW8wLk8nfygCbrR9bKKPo0
	 0KTKdU2mbEOMdYOzJwz7DLUdheBrrB+CFA0Y4igwPhpniy3qRGU/Qd+eeBcM56GFQ3z4n
	 iAKtiMO+ssnrtEhhdCt+01o9KpDi5v4sAIuj4cBCIM0iuoK7tomoSG0TQNMs5azWkRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793017813;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=gHOSHCbWzzwTv8atS9Djug1pDeKW/mya7plRbGWddq0=;
	b=S4IroOXaGBEAl1RQ+iXf8+Q6m0BvZ6V70jYKmhaa4bmIeSWw1e5qzTSeyhpWdg0hq1n7
	 b40YWCE4KHzGFFIJuWaKfs2XYB36he239MbubmCtEeJ9GfLF53MIuD3Cg0Xnv1vw7HYx4
	 D3OyPLeohM7Wz4eKMj5U+TWhHure/Knacg86/k9rs5YBxqjb7KX57AjK1a1L0+zonb/tB
	 dh9Nq56up1OUBoi42ydWIZg+kqUpr25M9nYXgq4k7iV/J09aW+QkoNYBoRSY+gObKMYaL
	 yFfSBKG0u/yP6A3scR+nQDv6zA3roylsbDAU7tsTHuCV02kTwUnaENPu1B4069iZJdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=EMD5LOTt;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0614606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:30:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0614606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=EMD5LOTt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793017811; x=1793277011;
	bh=gHOSHCbWzzwTv8atS9Djug1pDeKW/mya7plRbGWddq0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=EMD5LOTt0k2J6Yf3gA3uorBHP54K9TPdye6Ajuwu7ILjkE8NPE3fRAD7/0fkI09ho
	 UlEQPbB+l59szPP9HiFud7uK14TWomIa2xL7iRKHSa6PwO2KsvZh12+6AGuvS4KVZW
	 qhBnLoJz5AxsUn6/WL8KOpXNh6qKUWEjAQb1YgZy2++/IJ7TtPS6YiiYqlgyydJwnm
	 J5CDFA58A77MRyboE1LN7NlLySE+M2ywUEvir3vjxVWoGcFM6z4cF4rB4sjTJ8JKt+
	 ZWA1ajmwIi6Xd9RO5GEwb2ueOtxQouLnOUYBU6BmU8oHlAkVjzSEJ0g47Xhmn0pQR+
	 LKA6hHPtgCdAg==
Date: Mon, 26 Oct 2026 12:30:07 +0000
To: Takashi Iwai <tiwai@suse.com>
From: x8svc <enscrpt@pm.me>
Cc: Jaroslav Kysela <perex@perex.cz>, Clemens Ladisch <clemens@ladisch.de>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] ALSA: usb-audio, ua101: oversized packet copies overrun PCM ring buffers
Message-ID: <20261026122855.283-1-enscrpt@pm.me>
In-Reply-To: <87tsm86fzy.wl-tiwai@suse.de>
References: <20261026001003.1067-1-enscrpt@pm.me> <87tsm86fzy.wl-tiwai@suse.de>
Feedback-ID: 48393780:user:proton
X-Pm-Message-ID: 06e3dec0b85e9b2b78f23146beca5f32f0476319
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
Content-Transfer-Encoding: quoted-printable

Takashi,

Thanks for the review.

x8svc is my standing identity, not a name picked for this one patch. The sa=
me
name signs every commit I push and is the account behind my public GitHub
work; I expect to keep using it for any future kernel submissions too.

Both patches already carry matching From and Signed-off-by lines
(x8svc <enscrpt@pm.me>), so unless there's something more specific you need
to treat it as a known identity, I'd rather not resubmit for no reason. Let
me know if that's enough, or what else you need.

Thanks,
x8svc

