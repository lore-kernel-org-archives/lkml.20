Received: from mail-4397.protonmail.ch (mail-4397.protonmail.ch [185.70.43.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB3A1A76BB
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 00:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792281807; cv=none; b=NuRWP3hRFieRlbG9luVsg5m7wiQhg22nSlGSv020Om3re1DrU2sfALpKFlrg62B1hb9jsYY15Z3uimgn9kjpmgmZvs/aAW/CcstXRP+Q/Yf/+KSeamyKtCa3iSzdRq8qlr8u6laGqa+Os3gltc54ZlTG8MsnXWM+kFDEbCqNHHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792281807; c=relaxed/simple;
	bh=mBE43DAP2gWzEbdVKdrSbqyMGcc+0ZNMTo8hjO8x18o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ip5y+M4jPE1+hMlUsARGuNmsrQ9LjUlSoEVZ3bVoMJFpFJwxhz3/VrAlTQ0r+yTNusRXD93A//KTHgNgz86qyZnXQidrupZldroncSn0zoH4mkWkq5ukw3OPQPFlTN61YwBLWm+5faJTAMejZbPYDiuRVbaPV10qZdBs57pTWBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it; spf=pass smtp.mailfrom=vaga.pv.it; dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b=bZsAyDHD; arc=none smtp.client-ip=185.70.43.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vaga.pv.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vaga.pv.it header.i=@vaga.pv.it header.b="bZsAyDHD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaga.pv.it;
	s=protonmail; t=1792281793; x=1792540993;
	bh=mBE43DAP2gWzEbdVKdrSbqyMGcc+0ZNMTo8hjO8x18o=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bZsAyDHDvIFbOtfDlwbaG6I+2sp4SicF6OnQqb0YTMx/VofF2OAhGcmYkCzyqG2hs
	 VV2yVbf3og15Hlr1B5JFt0naA/hD+7jheP5SI/cho99kwOdVk5d+16gQCyYBNa9+NF
	 nls/Yi7TJvYaytATPjDlth9MI2wTESoIKpd6xxBgHCOvN3+ceQ5EU/HedJBriX/W6M
	 bzFbbrO5hgF4Cgw3Tg9WdMnbhYzl0JicyaTk4lVneCSmLIcMaM2D1FURghMTJ7deIS
	 UVgC7091SFMluSCVA2qZ/oEhX56PFzsqqPbXDBQnIUi4+khWSHIFuyjceZR1NYoU0e
	 sEeZ+o/DDr+og==
Date: Sun, 18 Oct 2026 00:03:06 +0000
To: Daniel Pereira <danielmaraboo@gmail.com>
From: Federico Vaga <federico.vaga@vaga.pv.it>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, Weijie Yuan <wy@wyuan.org>, Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, Avadhut Naik <avadhut.naik@amd.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] docs: doc-guide: add a guide for translators
Message-ID: <qthsqsh7gvelar6fpquej4x2qqho6ltttuwdv3bytxvkpis2r3@hbnhxep5sxx2>
In-Reply-To: <20261015125644.12908-2-danielmaraboo@gmail.com>
References: <20261015125644.12908-1-danielmaraboo@gmail.com> <20261015125644.12908-2-danielmaraboo@gmail.com>
Feedback-ID: 124726690:user:proton
X-Pm-Message-ID: 539314bcf95eebd7952222cd7b0dc9efecb06008
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

thank you for this effort, allow me one comment. The following chapters are
somehow repeating what already written in other documents (doc-guide, proce=
ss).
Everyone should follow the process and the documentation guide, there shoul=
d not be
the need to repeat "how to write documentation" and "how to send patches".

>+Building and checking your work
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>+Build the documentation
>+-----------------------
>+Look at the result
>+------------------
>+Run checkpatch
>+--------------
>+Sending the patch
>+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>+Recipients
>+----------
>+Sending
>+-------
>+New versions
>+------------

--=20
Federico Vaga

