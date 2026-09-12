Received: from mail-244106.protonmail.ch (mail-244106.protonmail.ch [109.224.244.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB44356A0D
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789200209; cv=none; b=FsKLhP/SguVeuzqQM2kJC7/XLvUDc8zfIMy8S55iSHQWPGbK7NklJaPuY8+h8uX/FPKDbKEWVjJHMVkj43SmGa5h7jaN/ysVVNIa5bctO1Je98OmUzjwX3eGr+1fF5URwxfsH4JDIw0h5yfZ7PQMDr0/iWiGAmE72wLgTjy7ta0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789200209; c=relaxed/simple;
	bh=teKekUbsLbZTfK8cipzX7J8A+wZqme4cswd/NEqv9mc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X1+2jcb6B3Mqh3jKiwSTHT6PhinXwl587LDDfVtlL9JJTba6i0H1hbhUYQfcno3NUGERB4RrMEo9AC43AsfbXlNsQR8Z+muEZ50kOdfeJcj4Yud+N+WCwJUj/3KjmTiCbsj+voA+sfGKit1ft11f9Wn/QmfTrA4yC1F9p5Co+i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=kPovIeMB; arc=none smtp.client-ip=109.224.244.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="kPovIeMB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1789200205; x=1789459405;
	bh=kK7CQgC17BZEaNS8D1YaLCnpNWJ1hulzqUvU7kaLBmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=kPovIeMBW5V9/JqworP/bg79xmmgxWyhBUFtnle7WSBVUZM7q3jwb6GYoJzT8TtDd
	 s8RkVjbch/6YD67SWKkC1MlZIuu37TWSWE4+UFSBnM+e+LzD0yq+uogpUos4OEkpIV
	 YRNRg+WAuMXp1a72SH4yrVq4IYq1UdaN5DcgIBsBXoqfc+zUAmPLK5m8JAt8Fi52wb
	 /igTf/rhVSyZzKkTTNuLOaiXRIpdlPy1GpA7rxEBPzYGkS1uRjH5CxKQiu5NCwE5D0
	 2Y+wPMeU7oGPdjnDxlcS5JSy54UJ/R7XhQvY9/46jt/J2U1F+jEIQejLx2cldjPivE
	 +5O7TrUHdXflw==
X-Pm-Submission-Id: 4hhkSB3vgqz2ScN7
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH 2/2] drm/tyr: unplug the GPU when reset fails
Date: Sat, 12 Sep 2026 11:03:17 +0300
Message-ID: <20260912080321.78104-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <62D24E3D-0956-402E-8451-24FADC8D357D@collabora.com>
References: <20260823-tyr-gpu-unplug-b4-v1-0-e99c07d4c785@onurozkan.dev> <20260823-tyr-gpu-unplug-b4-v1-2-e99c07d4c785@onurozkan.dev> <62D24E3D-0956-402E-8451-24FADC8D357D@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 26 Aug 2026 11:05:39 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> Hi Onur,=0D
> =0D
> I have nothing against this patch, but as with anything touching Revocabl=
e, I'd=0D
> rather get Danilo's opinion here regarding revoke() and the Arc in the re=
gistration.=0D
> =0D
> Otherwise LGTM.=0D
> =0D
> -- Daniel=0D
=0D
Before implementing this, I asked for Danilo's opinion so I believe there=0D
shouldn't be significant issues with the approach from his perspective.=0D
=0D
But yeah, it would be great to get his feedback on the complete design.=0D
=0D
	Onur=0D
