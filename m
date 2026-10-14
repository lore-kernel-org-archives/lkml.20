Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3624A260F;
	Wed, 14 Oct 2026 09:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791970969; cv=none; b=RBaQ0Wxce7XU11LYWgAq6Qyj3klIvBlA4M10B+qci7zpIloTfSpIxCF4gX0xuLYZsv9IyptzB32UeeKl0GMaYqlYV6f5sBZu4EccJeR8y6LvSE38A6/GatdS+432byeTVWEbiSyb2oQ1KIADJLZh05ixP9KrpswY3CpPgoNj768=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791970969; c=relaxed/simple;
	bh=mznPpoQR+TX9Gb6VU9hkpVdsq9pjMLvujACx3Bar++s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y6WZt0BCzDHegEi77aPvxi4pjdmX5ASFNB1qTdDwV+lu5hroIn2nHGehAd4V8FtZPmUJJZDRz3dsdWn5Jwsl95o5iro7S5XOOQ02QeIIeieYDAlmt+hMDW4NsPmUAqGMSsRWxVhB/YsWXHJBK26fNnQQgTyi/CGXVums/xchrlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6tk/qRY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6tk/qRY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FE71F0089F;
	Wed, 14 Oct 2026 09:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791970968;
	bh=WRJ0kKX+qUQiEo09SQo98BdSeBq5k2bcrC2nZTSyaOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=j6tk/qRYxvqEmmRPCmcuRIlVkjwE//jShdwiY68mMo5nX5vgP1oAkDTSNVg3tp78o
	 a6IRNLT9lkw/0IyqMk9UoywkS6WZ51ngVzuZPNMuL91dbV8ALYEqTTQnwDYJBhwNbX
	 b+QyShT+jesGHQjTt7ozLujCHu39MChLCsBQ01HocAViG6S1948tqa6dk7ljlk49Iy
	 HuOnutzBPY5flW/RF2N1yKJTv/XquglzN0A5KfSOn9b7NoYxR205wzIqMNMCx5Mf32
	 brTpMRm4k457KeyltRyhTRtx+YqQTYKM7zekJG0/niYVjvzsw9lWDkG8UpzRJVtijw
	 GyYy4xas4TIWA==
Date: Wed, 14 Oct 2026 11:42:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zhentao Guo <zhentao.guo@amlogic.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v11 3/6] media: dt-bindings: Add Amlogic V4L2 video
 decoder
Message-ID: <20261014-notorious-pretty-wyvern-39ea3f@quoll>
References: <20261012-b4-s4-vdec-upstream-v11-0-25939f85ada5@amlogic.com>
 <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261012-b4-s4-vdec-upstream-v11-3-25939f85ada5@amlogic.com>

On Mon, Oct 12, 2026 at 03:06:12PM +0800, Zhentao Guo wrote:
> Add bindings for Amlogic hardware decoder accelerator.
> 
> Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
> ---
>  .../devicetree/bindings/media/amlogic,s4-vdec.yaml | 114 +++++++++++++++++++++
>  1 file changed, 114 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

