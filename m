Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D789E48B37E
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 13:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995668; cv=none; b=p30StjYH3ZHaNq5JVrVlhwyR7bRUZmHfQw0Ql5+wUEM2NNHKJjwWqisjIoP6Vr4psk3jgZdjeU8AaOjrg+XzMPYUQU7qLcX+jaYTaum7/Sgellnh7Vdi6PqgbEimlJ2rbp66ovF7QQqIuOdLLOn78GcrKl2x50KPLlOW9KmLnhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995668; c=relaxed/simple;
	bh=+UwjiZrchWMNmc9IYXnFU9yFxXs1bhtYuw6HbaPEMBo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LVIBVPDCahNah1ytsCQO7thY1COABsYzV5/0LkdBCyveoelCJ+sbaH+OZPmM2WqqQ1GVtIq4d3SPB4TU4FnYhjUhla8oY7TukXuqhadZA5MNptw33ta9LBmNSBQRRhgn48lUeaxICCyHYE5T2TyVvSe6EhhLiOZ1lf48/ef7vBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Xr1ZySUT; arc=none smtp.client-ip=109.224.244.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Xr1ZySUT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789995659; x=1790254859;
	bh=z9lx7/98NMh4Z1OM2zipNmgn2bDt5PWUnV9/wJKsrDU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Xr1ZySUTHdMyd/JhSA0Ee6xJwg80DvD77zS/Coti7uJNWesDzbj3rmPB6cCg0BrDh
	 EVB78TZvWG4N3ROrfkmvSkjG/+I17H+0S0cWiyLDYlxUPqSfNUkYURS/zEuzbZ5x4Z
	 7L2Bv572+5SBE5VUt1iWu8oOk66maZuHbs95z4P8yGAzx0TPc7uM/9Zwo9qFZxoiEa
	 m47Fv43Mlc2pn4Pdz+dQV700YVOA018c71WdKh/1HyCSlyiEPGvU9AycngPS8MZ1eA
	 qpy8fAy4I/HNnNIr49z2qyNPPtJp6Q+vCmT20gZHqa8pBFlrRVYP6RipyzK5128JtN
	 crXXq6kA1ZGpQ==
Date: Mon, 21 Sep 2026 13:00:53 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: ov13858: add horizontal and vertical flip controls
Message-ID: <20260921130046.80552-1-lsa.uz@pm.me>
In-Reply-To: <arEPu__kIs1SJbg5@kekkonen.localdomain>
References: <20260921082609.30830-1-lsa.uz@pm.me> <178998112223.1723501.7946524742858282804@ping.linuxembedded.co.uk> <CAPY8ntCLhQH+8nT4jGxnOEWNhnn3=ESPnkip-6Y=zfkaHP5gvw@mail.gmail.com> <arEPu__kIs1SJbg5@kekkonen.localdomain>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: a99a1ccaa8ce3360abb74f32e46771aaa89bc807
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

v2 is posted, as its own thread:

  https://lore.kernel.org/all/20260921124444.79396-1-lsa.uz@pm.me/

Sakari - it does not do the set_selection() part, and the changelog says
why at length. The short of it: ov13858 has no get_selection or
set_selection at all, so there is no crop rectangle for the flips to
move, and ov13b10 writes its window offsets register-side without
exposing one either. Glad to add selection support as its own patch if
you would like it here.

Kieran, Dave - everything you both raised is in v2.

Sergey

