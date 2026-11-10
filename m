Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794339076;
	b=skxlqrVHf5aZpOHPdRTwTLeLUkPAgDGOV4NdOraz4FmFdOIsYcyGktWiCI7DhvXdRmGf
	 P6fu+EfNf7QeAMdrAkW7lnyCBSZVVq3CyaOjDnE/Rfa5Nu9sQ1K6vNs6ffjxgS/JvP/Ic
	 Dw9FtlfMxUCnm/2B3tyImR9AZ9jqADpcZRJTMW5UcxdS6Dq6KV3nv2zRWyt+eZvnXdRMz
	 Wql7DFbc5/XeHCZPn3BoFBpVxlWJrnVo93+xzkzFJdmO2D7pzRyPFGATBxgIU9JFjDrwf
	 izHaYCup59rYdqA0BUc+UKVufHrx5B6bM/c03/gLtFqir+gf2P8zbbIQ2Ep/cXy4oFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794339076;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=v03e9Y03TCTAkAvci/8PC8X7VD3txoGBmM2Y7VpeMIE=;
	b=Pp/jfixGfVc5r9Qezh11p6vFnFRT08IK6A1tASns9UaxgSxtD3F/6GYLhLQN0yDaxf6l
	 ASFl+K5PvshjS5mr9QNdY4wLI5H7AUzt5smNE8EZqzFw4jBQM7GZklZ+MdJO2eCOb9Zxm
	 XO/ZFJu7WYL2xcqx41QCk/6zv6GF6u9DbVbwI342xJE0x8VesU4Za4gz3LsgnZiLygaQg
	 Rv0bX3FENc6ygn1pUICgjqsfYkbD5Jed1tIZtS6ToIklCul4uCIIBQvEsdzLkQ5rLoHsu
	 qmzQD3B8s7O9iQPieqLftLosebLYFZA3wm0DjsYUurHTSF3yJQkFq86SmHJoIjfcw7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=pass header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=HdezrP3u;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ihs84QX2;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD29606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:31:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BD29606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=HdezrP3u;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Ihs84QX2
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 5BEA61D00298
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:31:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 10 Nov 2026 14:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1794339068; x=
	1794425468; bh=v03e9Y03TCTAkAvci/8PC8X7VD3txoGBmM2Y7VpeMIE=; b=H
	dezrP3uFOzaBbwW6Ego1tbYbzvAe0I7ekXaqqeIJak52WN7Sh74ZLdn5cMe7kpCN
	ca8+SKinjojeyahQENreiVALLKSid26J5HjX+Mv0tr+r+zVZymqb30EEFgCA21Zj
	MZLNaHeMQuR/WqXICKsirAU5OA907RiJwFTGiJqbT7q1UW1L0EEhJHCW3kWixBqW
	OpJYN+NYC+QzaJhgN8mhdZY8wog4MyAmfFi14i45PodwrkO4UEsPqbNPtCAiBrPK
	7h04MnU/i1liwwJbP9C4qvhzmnN+Npt8ff6GcyPbQUy81fGKSlft6rtGMvr7um4P
	kgKZbsMyCXiMM7iXDU/dA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794339068; x=1794425468; bh=v
	03e9Y03TCTAkAvci/8PC8X7VD3txoGBmM2Y7VpeMIE=; b=Ihs84QX29h/gxJhFu
	WxtDkmWm10fdzVkU/vHi9enYgbBP2jq6vDBm9+pmmpTG8ylHxv+9TgbRjxKpV6Q3
	zTDLfd9kA9H3a6pMeXAq9+RJEnVMvY2G6yByEbl/ivyr8KQYxE7XNqTw2kmFaeNh
	DdRn3LYfn5VjNMSm1v64Z+aesCTx9poSzAPpj5QPN839F+4sAsoF6mgNl+LTib3u
	UPlKyeic1yQR/9Vu0h8NDb+0ECYyonkMrCaDtBwXCt7kv4yzA07jk/5tT3NgBrCp
	Xeu8AcsDI8Fs2JLSfZ1QaEHbDwjBUEbwcb72HHpbKHZKg9429y5x05S6b9Wow5gs
	LUofQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794339068; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:u1gWt3V8fk/9sZ7N8GfzV25d6hIbPoir15snRx8J0lp8V0x
	Je2pfHlswwXtOaPk7SP6NlF/LaUniCr+x0M6MiHdLkUR2Hquglh1wxjGiELQxKGw
	N6klteWyy1MAVP3hWSbsza7dUGvogkR9f1IL+SzLFDiczi7Z5aO+wvxEUXWC+Pdk
	OpUAcbp/TgpV0Mt0nnq6fpwaj17d9iQzJOGFAr+WofU/Zzdkr+a5Y2rK/H5JqQvZ
	HmgyINlspqoK+vJcrQWRpFXlEuvKuJzWc7oXQkHRtFaqI4N4dbkbn2e3NCgXxLa9
	1AF6OqtVkynQfNeznkdTAjc1gIGgudIB5O6VbaA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:MAJ9DqFnDeSq70XNulQ6ZtRPOgcYsxs2eX/baM6PlZI=:v03e9Y03TCTAkAvci/8PC8X7VD3txoGBmM2Y7VpeMIE=;
X-ME-Sender: <xms:_HDzaumnvnU24hp5y0Vh8PkY5D4dGqLhNJlTnEwOFhEdmOzmcayMPQ>
    <xme:_HDzao7VSXYadpPxo2zesqDx0usG9PeLh6TsV4IMOm2MBULB3OMzZWLxr8Jzj_fRz
    AJB2Kx1lJHsrrfDt5yskHY7TRuHl0zD8JXWvhja2mWzLYiS8pYwzWM>
X-ME-Received: <xmr:_HDzanRZUxKDFxvw5kMD6n06tsYKqPUGZxV8TTTCb89mxp4b4HNGGQuJXe-MFe9a>
X-ME-Proxy-Cause: dmFkZTFMeJeww1ENRAMLr95NPIDKq1Ih4yfW4uN7X/Y1stIPZFHR4+JaX2YuW0S+cxsHv9
    sv3MxakxEf+rP/GyryRvnt7z79clzwe3xEamKCrWfJG6rPX/iB72O3dvmBglFpXB5H9Vhx
    WuGL/MMY6lpktrXZhpEcLS0JVQjSbwhxcYcPGigkKqOGJUINLSes3PRTGjXcZHFnc+Oyey
    K1zvPf2qJhi/3hDixgre65FZul7xMH7hJXANtv57+BLIGrVhzp5vOvy3cxNujD9TJciwUy
    xLiGyFEE55n/B4tr+fB9E9N1Iy9QXDaJEojjqIDR1roi0ZK8CgyF8CUmm2jNPO3eeP6Gs2
    PWt08khz2cY9Zgn4cF02e9zSV5tvpeichBCj8EnBUQIjG6rZInrJcW7dhC93uMx/x5Wa3F
    iNUuBFunr2KLmQzbQZnSHTR4JUyMzXjlCvEBltwEON/3B/WRHkOa5dDIBjpKCqgoRWwjXg
    Z+yn3GOgmc/kMA5djQb3GexYuen3bhAcYD9aKf07wXqXkCgOEg+nxFSvT5AQzTYrz6dtpM
    VHujIz9WR6Bd8ixopl/vrfJ+XuA9s6NBWWVf60f4XwahVRvzZCNkK4Wa/TfYGC89GPZnft
    QV6BxmCBTCvEjAHXf/BS9ydY9bzuOtshZwL8pWI+p2j5G/f/vEWIOjNrXgLQ
X-ME-Proxy: <xmx:_HDzauzFzZeHLTDqtfFN6yCL1XwIZ_8OwDda1yfJHIOfaLOyw20rsg>
    <xmx:_HDzanq2vzPMljd90zOsbCeCsn9w3wC1j5LJvQTswlfrfIBBX4WNmQ>
    <xmx:_HDzap1efA1y3Gnbw3k4e8YF93hmdmW2MDvCXaWtQmOkUKTWMGamDA>
    <xmx:_HDzavwYLGMWAHpkd4gisPz5SjOZphccL7n-2ZEfGSlipxgrdOrZFg>
    <xmx:_HDzageRxP64uxRoSs7wDNYux7rxZDyn8rA9QZm81jbcjvlQcZJ_ZpYa>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 14:31:07 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: mike.michalo@gmail.com
Cc: linkinjeon@kernel.org,
	senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	ematsumiya@suse.de,
	hyc.lee@gmail.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH v4 2/6] ksmbd: sign with the negotiated SMB 3.1.1 signing algorithm
Date: Tue, 10 Nov 2026 13:30:59 -0600
Message-ID: <20261110193059.3200468-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261110165834.28162-3-mike.michalo@gmail.com>
References: <20261110165834.28162-1-mike.michalo@gmail.com> <20261110165834.28162-3-mike.michalo@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michail,

On Tue, Nov 10, 2026 at 04:58:30PM +0000, Michail Andreas Michalopoulos wrote:
> Since connections of the same session can now use different
> algorithms, each signing key also has to be used with the algorithm it
> was created for. The session signing key belongs to the connection
> that set up the session, and MS-SMB2 3.3.5.5 requires a binding
> request on a new channel to be verified with it. Store that
> connection's algorithm in the session and use it together with the
> session key, while channel keys keep using their own connection's
> algorithm.

I don't think the spec ties the algorithm to the key. MS-SMB2 3.1.4.1
and 3.1.5.1 use Connection.SigningAlgorithmId, the algorithm of the
connection the message travels on. That holds for a binding request
too. The key is Session.SigningKey, but the algorithm is the one the
new connection negotiated.

The two algorithms also cannot differ for a client that follows the
spec. When it opens another connection to a server it is already
connected to, it offers only the algorithm it negotiated before
(3.2.4.2.2.2). ksmbd supports that algorithm, so it picks it again.

So sess->signing_algorithm looks unnecessary. Where the two could
differ, with a client that offers a different list on the new
connection, the patch verifies the binding request with the old
connection's algorithm, while the client signs it with the new one's.
Taking the algorithm from the connection, as the spec does, would
avoid that and the extra field.

Thanks,
Ian
