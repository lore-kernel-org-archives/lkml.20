Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADE25908DB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789061926; cv=none; b=asrITpcs+w1L335xKYhyaE4+GFQ4Pt9F5gTe25lskOItV045luN4QjIIf1S5HCVx5O5hN15bwQcfYBGZISL0BbciC2z6UQee5L5UyH9heHZssb/SnssIkaxPdOe23zng9XFx0PsK9JruHkPvYAjZGQFx9IZazlzlrKRk9MEpvUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789061926; c=relaxed/simple;
	bh=JUYxAj4HnarvzsP+eubGIWnHw0kdeifpIluNpTBfJ7Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LN8ystTiWLoJqJ0HmcVRjQcFiTqTXUu9KR4t4oyxeGBZfcUNQHvsN5bppSyrMdYcRzriPorCfVm7VuiYa3o3QYYeAu26cXFU/q6+ivZeHlunw60agDfG6jalo1Lik9GeTQEToLSu767LWmekiiTcM44pKxz2uidAhqzI1vhW3q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFytRu4F; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFytRu4F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16D831F000FF;
	Thu, 10 Sep 2026 17:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789061914;
	bh=JUYxAj4HnarvzsP+eubGIWnHw0kdeifpIluNpTBfJ7Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dFytRu4FsCW1KcbAT4M/jjQmFi0i9VtqGmHByi7GwG0edq2iIDIQVRlYkPd9JzHtE
	 IaFcYBc3AeTj2fNGpdmo98ROUVR8Bb2GtvSzQzqwce3MYnvD2OUM8B533QBPrrcVb0
	 g/0G5nZdOC36N5fWWS60rShMqaCSGCDhdgtiauoTIvWRH00VfmGpu2Jh2DxzPI0ki5
	 3Kw3gvHN6hr0/HkyaczumZcQodz39vd2c0V46qCHBXkFzcW7+Xmzx4CIhD0Sq5XLxu
	 GvwdvJHPmOmlusXQp3dWTVP3D/EuEVdyaHGmzDV6z7+a0Qp5ZoUHHHFwEUamGX9BY2
	 g4Rv+W4jQIiyw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/1] liveupdate: luo_file: Add documentation for
 dependencies
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mike Rapoport" <rppt@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Samiullah Khawaja" <skhawaja@google.com>, "Alexander
 Graf" <graf@amazon.com>
Cc: tarunsahu@google.com, "open list" <linux-kernel@vger.kernel.org>, "David
 Matlack" <dmatlack@google.com>, kexec@lists.infradead.org,
 =?utf-8?b?b3BlbiBsaXN0OktFWEVDIEhBTkRPVkVSIChLSE8p?= <linux-mm@kvack.org>
In-Reply-To: <20260910173659.1945246-2-skhawaja@google.com>
References: <20260910173659.1945246-1-skhawaja@google.com>
 <20260910173659.1945246-2-skhawaja@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 17:38:33 +0000
Message-Id: <20260910173834.16D831F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Add documentation for dependencies between FDs preserved by file
> handlers. This supplements the previously added
> liveupdate_get_token_outgoing() and liveupdate_get_file_incoming()
> internal APIs to allow file handlers to resolve dependencies.
>=20
> Signed-off-by: Samiullah Khawaja <skhawaja@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910173659.1945=
246-2-skhawaja@google.com?part=3D1

