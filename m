Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194178;
	b=0V3SELZMDpuaQQVOcrEDwvD70+KdgCAj3iI1I2Z7ReZIMDxHq+nkiq5nyoRWFncNUXx7
	 CjeAaKV0ElhXPhbAhTLhZ1XdLDuuO4+E0NjKNGRSOmaaLzebJIJdblb0wqu2NPtshlwJ0
	 5auAQBVTVkjL4IUNYyZI/Wsd+5ccBauvDv4gT3zZrToi/cmTlPU57mIA2bEWXmYHZQ+vx
	 QjRcq9gZrMrwtph3YkupzH0raps91XdnAUmCd8vcXpgciFjtHS3wUzFNH7IbpIyrCa2lJ
	 HTCNbCbqUdDhXj+oVLiax3bJomzdcJm4wraOTa8MYT1tvkfCAS9FX4rxm8uS0oap1GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194178;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=WRCagZ5jqKW99bTwvx5X00mCCmLJZB+rkM2+fIEkLb4=;
	b=rPr7G+BJ/TD1X5u9RqrrbO3HLABqWL3Bj6vUMDDHTNP44TvDvZxV1wwz0CWncnlQ9Xxk
	 RS/yiP2etzObYgIBAeTAEtGVOe8O94yP0JetDt4/ptoB1ozpxSooiIPGkAuWXP281gnpu
	 RoCEgm0HCKcrHzas159/P+z2HA9nlhjXmldabT2UUSixN3yqvOHc/GdUzjkwowjGM1tNX
	 wbEsNxrGA8pygtAW10+iIQ1ECqqRIKec0UWCfHeuRgErr2bnMTjk1HVuMJqiQgGE0U/FN
	 gZQeTtjBIUc2Ctzg70/kOKb8lYPCKeFdO52AnMxiqLJaiEtGtOAw+JVLcQzhp9vNhsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="WC/TQE/H";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5F1606A31A;
	Wed, 28 Oct 2026 13:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WC/TQE/H
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0FF1F01825;
	Wed, 28 Oct 2026 13:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793194178;
	bh=WRCagZ5jqKW99bTwvx5X00mCCmLJZB+rkM2+fIEkLb4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WC/TQE/H/DCnW9420fCXBifmRx2hDwJJSI90sVnQ6w/hmH/UY3MxQtMAu0eim04Zd
	 VXzTmt0eLMspyKXQdKjPY17fs88ELQ53lGUOYYwaU4lRqcSS+fFrxHdFpK70OQxfuQ
	 Owr+z7a7WJUp5acSwsC6C5JfHXJJ9N0PulzYw6oItcLIIVj8SQQ6VAK/dQILmI6SFU
	 2B+n3mMGgqXZmmw2N6ZLyvEwqYIxVzsSA6UbkGLEhWxmE0g5SD+Tg9KBDYfhaOE7fq
	 kebnpJeAkZgu0ljFO0h7DkAk0iWeDMfrSh0J4Pa5XjwLr3loaHkmRUAh9THI5f4KNM
	 Ca0z0HfANrbdA==
Date: Wed, 28 Oct 2026 14:29:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: i2c: add Giantec GT9764 camera
 lens actuator
Message-ID: <20261028-acrid-calm-bustard-0cfe4d@quoll>
References: <20261027051048.213177-1-xiaqinghuan@mail.ustc.edu.cn>
 <20261027051048.213177-2-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261027051048.213177-2-xiaqinghuan@mail.ustc.edu.cn>

On Tue, Oct 27, 2026 at 01:10:47PM +0800, Qianhui Xu wrote:
> Add DT binding for the Giantec GT9764 I2C lens actuator. It provides a
> 10-bit position DAC and module-dependent advanced actuator control (AAC)
> parameters.
> 
> Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
>  MAINTAINERS                                        |    6 ++
>  .../bindings/media/i2c/giantec,gt9764.yaml         |   71 ++++++++++++++++++++

I don't understand why we need this. Where is any user of that?

Best regards,
Krzysztof

