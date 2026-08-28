Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB783A5431
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787890442; cv=pass; b=a8al6ertALxoulH7bIduAoA+Q3UNNwsylCSy0+ElCYUOhCoR+lNQARcbZAtAQDxB1oXgr0ADh5XdsJb3RyyuDMENTMJ8bnDaZZ5hyS5gNNJssNTXlw0I/DD4iNLNpylk1fUQ+IUwkC0u7X3lkViF3cKNzRZgOCBceaSW20VnxTI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787890442; c=relaxed/simple;
	bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZduRP6DQq3IZ5ofy9iW9u7l8vOIbW8sdBLSzmNhAoKF3p2ERoOrC/1vvxl8LqLr3gbD8TDkCyeJ4VBHc72UqSEDPwhW4z9eW6Vqhp3aCzfs28Y8rSLPK+CCs3zi6NEZ+d9V/RZ4bjI6XKQP3zDAWK2xJPETNJ+eh+RePEQY0s/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ad2NgdEf; arc=pass smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ad2NgdEf"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cc1c3c90074so456250a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:14:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787890440; cv=none;
        d=google.com; s=arc-20260327;
        b=A8R4uIE6jETcLT9vabijPqCenmpjtjlQDBb22Jhh59E0RpGsKOhYuEWnBhvsm8IW29
         lw5thdS4GAbHgSLSvlWO07SDSSLVX5W7U20DWKabb4jdvEzqUKrM0TMUBWiz+C1C8DuY
         NXzMPZdCE90o6p9uKYz9JinEC7qkdInR/6N7LpYNyOmzU++06yJka2u+cO8fmi9ifOFs
         W18SC28j2W+l4oy/RIiz+zCWXQhl2TpgTOvDzEVk6iZtAg4D+5p3xm7uxtglIIowN6Fa
         LcNqN/0vhh0lVxtKymvH1OvDWXiRCxNnfRDcrb3BKQD6QMNuh5NbYKa4qzXjLgJB/pxQ
         HSkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        fh=kFgASdvJAOWfWHav512etUYUAWMmukdsHQWKSiuYR/E=;
        b=pWmB6z66R5QRnyGOy6B+7iz9Uy0ZJiPTVFJdWjJcfr4X7ZdcQK0IF/NfjUeIB3fhNN
         N1fEnLjCgnJaxKhXHowWCTGtUuzjaaVDxO6UmOk/SM08GbXjLJbG09cNaKKMp2qPa9ro
         hRcP4SlzlpsUGTinq78JCTg/VKzT03E8fqfTEluOVHaEOER2ifgZFsV9Iy26D/PD46kn
         kIhgf23h3dZFthqo0pjMRyc2vsS2dFz5DnqvhECleZ7GiaVPLC2DTDZIRG8O/kKRiQ/H
         14FJCpfrGlnm3O6UXXuY0pBdjOw9EWiCaXdRtYynGj+EkgecPNk+YaA0VN3Vn5Kalhhh
         hfYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787890440; x=1788495240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=ad2NgdEf0LxTCrhk8j9GAcFRGuRXP0EONajiE1t8sBSTjGPoBp9Ar69YoznBnJqZ98
         DX+InWQu0FHYqL7pLQL/vSNCpzgOKk8yymC0NzKchyR7c9Q6R2IFPvq0B9RyKjbyuzG6
         ysWCsHVKEFz50xE9MiPHvtWwsAeWpiS8zH3nVNHa88RKyEfSRqxpXBUyKTGaC5Cs1tpg
         icI59xxQrTFf+etbFvGcvCOGMf36w2WM1nlyrosfVGAgTvIhIcMlHO5EYtbZe8RyjXJK
         KO6UrwXZ9wd1aGANnik81tFbi5dlmNp5pgGZ+cYijcdcTgQ10X3AhrQSZa6j23RSCqIM
         tNzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787890440; x=1788495240;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAwpBFNZhlk+iUoQ0SaXUDwsH3Pa5MlZJTjzptBryTM=;
        b=MJr1YYwhxkq2cubqidEjGfqMzAwfhf/ALXyx/tPEx6Km85jDDUmMywBXR8P2w6gU1T
         HwyLqwcb+fpzRA9TTqiqSKQG0qB7Wa9pG+efkgxyjCIeLx32cDUJ1oluaGqrBAXdivXY
         nRyp8ZfFfMhdQ1UP5yqQ2Vig9PZEvTy7NjiuJAcD2hTEfcpD8Dcj9S4wcacapFI8RK/+
         k4soXwaM2PmZrN3lWTKjg3qp3oh1/lAXUl9rcqP1yfoX3SFWlNrNk8hj1a+WBilxUeem
         EMryQUpXbLOXLDBJnFpqIhXZwVhLMDgUmfAGvHFJ8xFQj48FFbYcvkVdFYIHgi+8TvuK
         2fpg==
X-Forwarded-Encrypted: i=1; AHgh+RqWmHwuh/wZZkTPgdJLCRLNQGtShVAXgci0zK9Ify2Kuobth7BlsfU4tgXXu/ce6g22qrT1SXs3AkCbfg4=@vger.kernel.org
X-Gm-Message-State: AFuF++kK9yfM2lHMTMoNlQoohcdd4/SlWJEDMIKP52xfIQPaaUzCyxK+
	PpYiJGzUX3uVBl/pswZmC/T72eJu8v0xE7vy3bJT3i41zuXrV86iXyEIJd+u+kMh61IoCpWMWVD
	H76D0HCnJkruqJShXRdKrgBRpPt3YuBg=
X-Gm-Gg: AR+sD12IH2w2SKbaP6qpgJh1bFhs+8rlNgaALekMh4BlM6LMGXShhHxz54e0fqKoN+r
	5EmjlBS/cbhYQaq1hkDMZlllcyeP4Us+tOPf88DF/xY1QNPfoEhcHvLs6e96Fce+JZ01SQclHRt
	Tq29WauMH7lb/KbpJ7v3RUj7lcS0fyg/JMczH8UTgMIT1+xi9GfPkQtHj52ljXclA0wbPCHISc7
	4Fv15l4rvG2+lMjQD0jcPjLimN5nw2LitcK6r5jhQBgJMTe3aW4x4FNPGbMKAPoVQ3yOTmPdqkq
	2gcXN3nj4LSp157jp5qEOoAEiM4GlGNaNELGP+6goXxJhkY4mDnniZG/QyREU2bsI52p9WXtx73
	IrdA7U+RSrjJHr3d+X/0gJnFpqLXjaXQOd+GePty/OZx0wC54aeauC+N+
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id
 98e67ed59e1d1-396d0ed0023mr8931366a91.6.1787890440156; Thu, 27 Aug 2026
 21:14:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821122928.41343-1-phucduc.bui@gmail.com> <20260821122928.41343-3-phucduc.bui@gmail.com>
 <47c14ad6-0311-467b-907c-517ff5044438@intel.com> <CAABR9nHyDL8=EiSi+_GBpHM0xLZraH8az+HRXQWudG=1hLZ7qQ@mail.gmail.com>
 <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
In-Reply-To: <98b11d2d-8157-4c1b-8562-42ff11cdff60@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 28 Aug 2026 11:13:48 +0700
X-Gm-Features: AcwNN1VmqsU00XHb8qwR9ukL54h8LR35XqmovAAS6AwR9_5yGXPiNF5RdG4pFBY
Message-ID: <CAABR9nG=CNwVPcqqDE96JWsFYiJN7pBP0Daz9wi4DvYoGiz2Dw@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] ASoC: mediatek: mt8183: Fix APLL enable error handling
To: Mark Brown <broonie@kernel.org>
Cc: Cezary Rojewski <cezary.rojewski@intel.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mark, Cezary.

Thank you for your feedback.

>
> > To be honest, after looking at the code for other MediaTek SoCs, I foun=
d quite
> > a few logic issues and inconsistent clock handling. This, along with
> > the git log history,
> > makes me wonder whether these code paths were ever properly tested on
> > real hardware.
> > Therefore, I have stopped at mt8186 for now.
>
> There's a lot of code there with shaky error handling; probably the
> default case works but things blow up relatively easily on error.

If you think these code paths are generally functional on real hardware and
the main issue is the shaky error handling,
I=E2=80=99m happy to continue reviewing the remaining SoCs.

I=E2=80=99ll also apply Cezary=E2=80=99s review comments regarding the cloc=
k handling in
the mux disable path and returning directly from apllx_mux_setting()
instead of using a goto label, and incorporate these changes into the
next patches.

There are also quite a few uppercase goto labels.
I think this cleanup can be addressed separately later.

Best regards,
Phuc
