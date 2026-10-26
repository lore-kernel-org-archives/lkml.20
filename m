Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.119
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006727;
	b=c7E6DC4gk3TJGHVGbxQifj7xupctiUPqHoN7KNn+FhktTC1JTsUdEodpbmsbAjk/YIg7
	 J7NjX4EfJdL2ghsuMctN28pf9esLUSIdwyM56Ump6+Tfyg1JXmzfCf0Lh6aWz3ke/GGMc
	 i2HgS6L7e9VYywT4GgsTNgly7Zr0lsmnQBk+XDW5uzdfFjWzIyAMg4RYT4/HroP5QKbEw
	 8Xr0OzM1ptT0cay+VQPMIWCNtNQs8QQgM4yLOBxTzbTLGpzh3Ayd33TjIh8qXml67tW5e
	 VYLre+2FYB9E5SjV0TSV7woVOg3uZEtV9jxfDd/IlLkSmNkTxbFvYYeCXxdY2wMKDVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006727;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=neal1959JqgEWou8sGoT1vgWhum0hw9FeMKlI6YLU5c=;
	b=tLNkvpyps0yKpW3eGQ7jBh8hImlrmTZQ/VS3DcEJjvEsSeDfYzeaF/4f3gD8YpptrcTa
	 vtoQ2sGhVgrvUVTOEXJi18+Ke1VWMNHYg58E02sCAffvSrQInnEA/W6aEbDGp4ZF6DYrX
	 62/jLlVzZ3WpagPg1swJP17wzO9EiN2Arv8GjskPQFP6mf/KTQnsRIgzNlOmsUqEnM49H
	 9XnK+79BdZO4R0665puwFanjsW+fFnXJzJmmUBkuPuEUjEQXQh9p+MwnHQrQe6DwV0UB1
	 C1ttp2LllkixElN3XTSto1irEZz/wzb2b3U0z3QSwk+gooDpf3GdEuq3+yO1WZITQYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxsw.ie;
	spf=pass smtp.mailfrom=nxsw.ie;
	dkim=pass header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=J9tfiFXB;
	arc=none smtp.remote-ip=109.224.244.119
Received: from mail-244119.protonmail.ch (mail-244119.protonmail.ch [109.224.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96883606A31B;
	Mon, 26 Oct 2026 09:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96883606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxsw.ie
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxsw.ie header.i=@nxsw.ie header.a=rsa-sha256 header.s=protonmail2 header.b=J9tfiFXB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxsw.ie;
	s=protonmail2; t=1793006723; x=1793265923;
	bh=neal1959JqgEWou8sGoT1vgWhum0hw9FeMKlI6YLU5c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=J9tfiFXBdHnS9yXgU6FBFY1bjpHOJP/cTWUV/Z03uGDF4BZMXjebFI3y58WKFjVDG
	 PtSWTqGpTZta8ZEcnC5akkI37V3H942KHRZh6qtOxX4Mg0OHfmnQ9De+Aqtxa06cG0
	 okEwQC0PMCvRZiaJgN9k2LgslCsAOajwN+NBgDg5ViWgKRXroqVq8TGr5RbqdNpz+n
	 7NLo7nv8Mp3KQLWI29wsSSjzL7/gQv3CUC2tDUGbBW/sI9GTgyJn5vzZxPN9UY0969
	 saXbRRQaEvqOfyYAip2mamg3TzKVVOXlSqROp7/fgVIom5N7HEh9W8SmpA2j74W57i
	 aljsMp2lRtkFQ==
Date: Mon, 26 Oct 2026 09:25:19 +0000
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Bryan O'Donoghue <bod.linux@nxsw.ie>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Loic Poulain <loic.poulain@oss.qualcomm.com>, Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>, linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Message-ID: <35facf70-8693-4d7a-8d00-b884078f0a99@nxsw.ie>
In-Reply-To: <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-7-atanas.filipov@oss.qualcomm.com>
Feedback-ID: 136405006:user:proton
X-Pm-Message-ID: a1ae12a058cef00e2bf4f9a74eeec8a01593b2a5
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

On 24/10/2026 10:40, Atanas Filipov wrote:
> The SM8250 VFE resources list both the camera NoC AXI RCG,
> camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
> are never applied, since vfe_match_clock_names() does not match that
> name, and they list 480 MHz, which the RCG does not support. The
> camnoc_axi branch has no rates, so the camera NoC runs from XO and two
> concurrent streams stall.
>=20
> Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
> its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
> camnoc_axi branch, whose rate the VFE sets through the parent. The four
> VFEs share its source through a clock domain, so it runs at the highest
> rate requested by the running VFEs.
>=20
> Signed-off-by: Atanas Filipov<atanas.filipov@oss.qualcomm.com>

I suggested bundling in clk_set_rate_range() to this patch but I believe=20
it would be more productively and correctly done as a wholesale=20
replacement of patch #4.

The point of your patch#4 was to fix the framework, which should be done=20
I agree as a standalone patch - not mushed in here.

---
bod

