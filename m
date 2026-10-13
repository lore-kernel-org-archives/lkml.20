Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC56480DC3;
	Tue, 13 Oct 2026 06:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791872581; cv=none; b=e5MXRUIHmIZP72ukLeSf8inQkrQUjQkNkLyMhWmwZ/LGGEZZCB+v3Yp9BVv9/5HrAVL35dw2s0aEKJKhm1vlmol0sOcMsrVTvNxWwNVd/deC8kgC3143jaeQEdBXK/52v4fknrf1sl8JLxPZjHxDgfn88+JAZdPw5YRcGU8rEzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791872581; c=relaxed/simple;
	bh=M18z2Fjbvjnn0jKCjcOWvFzuFUA7E4xrf3Elym3Wris=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NRGTud/uvpQwpJTuAIl35eHswqVWMc5po6+seez5DetmPjqlxCANMyczxtFO/Ny8DaTnTXQm0gbCUjqrjNwwqtw61PteDuTjSVS22+Vygu0IdnOh8MZnMFahvehBVzlDzMhYiGjfHo7oROOJFZK9CwOQIq+bh9AvKe1eYjg88js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nBDO0w8x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nBDO0w8x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ABA91F000FF;
	Tue, 13 Oct 2026 06:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791872580;
	bh=JJ0oyISEaTfz13X5k2iZOPHBVuGDEMpWu7JIn4YIr1Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nBDO0w8xcGM39dDJFS2y5vaV4abJogmnWNQePrjSP8haYzlVyewvL1fE9lSb160GQ
	 yB9VUV6zLC3Mn3jrF+p+O9sTqxWZSfWD9jh+eDA/VGpNkd6RuLOa3HWtUIuOg6WpXv
	 6oIDKIv+xNkgpgqlukc68YaOaA4Yp3ZPym175uogNGHublijoeVfSpKABq0IFhyyMt
	 jrHn16MKA51Qul6oztlwfXrVhdqygJfRNDToasH4KBiiZbt1CSo54ePzOgnCf6YHqV
	 oVPkWYoeLzKwcJC5FivQJYgktGr3dYxRlfvMlJKm/YFSA6USyr3XApq0hNP4flmL7X
	 PPBQvcvweTmTw==
Date: Tue, 13 Oct 2026 08:22:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, linux-media@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/6] media: dt-bindings: qcom-kaanapali-iris: Add
 kaanapali video codec binding
Message-ID: <20261013-adept-aardvark-of-respect-0e98e0@quoll>
References: <20261001-kaanapali-iris-v4-0-642f9ac5e699@oss.qualcomm.com>
 <20261001-kaanapali-iris-v4-2-642f9ac5e699@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001-kaanapali-iris-v4-2-642f9ac5e699@oss.qualcomm.com>

On Thu, Oct 01, 2026 at 08:47:22PM +0530, Vikash Garodia wrote:
> Kaanapali SOC brings in the new generation of video IP i.e iris4. When
> compared to previous generation, iris3x, it has,
> - separate power domains for stream and pixel processing hardware blocks
>   (bse and vpp).
> - additional power domain for apv codec.
> - power domains for individual pipes (VPPx).
> - different clocks and reset lines.

Subject, typo in prefix. It's "qcom,kaanapali-iris"

Unfortunately patchset does not apply - tries to get multiple
dependencies.

Overall looks ok, thus please send after dependencies get merged into
next.

Best regards,
Krzysztof

