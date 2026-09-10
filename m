Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBB6376481
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 11:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789038282; cv=none; b=TrAMppKEYBmw6xdKXHuiN6R43s6YGuRj+ijvcfDqtgGpZtQOFXf/AaVSBWxeBgtoeEkjna6Fko9sltFHYmT9Pprf9GqXnlptYMFqHZmmRjhfRbedhsrG+FMkaMj/x+LsOy3oGUDFUDKyyoEiUpXZrME6A2K27mEePvqBaPg1huM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789038282; c=relaxed/simple;
	bh=3q++fkQISw/DqZy/79hTcf7bnPSwjh/Vc1ryjSPvQTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T1vFnWPzb0j9G9ksJEPqsCYhxTPFSlHyajIUiSiaQfaTd54Wlq1zSRncny+W3fxWS5eC8T9k7NknWuDEtNMFw3WbPvYu6jHJPxTE6ANjwQyK1Tgp+JHNctOkZgut72JZhxofoQ/Vpm/EoFrPHmQy9JiH1xMMenS55YviQW4ts7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hZkMbrL6; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hZkMbrL6"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hgZZC3897zMlK1;
	Thu, 10 Sep 2026 13:04:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789038275; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3q++fkQISw/DqZy/79hTcf7bnPSwjh/Vc1ryjSPvQTA=;
	b=hZkMbrL6XtJaJoOnMcljhximRCiwm8CN4oRKxPI4Hn24Dc2a+jSPEyh8sOfquutCczPYNM
	KNmj5MO2fuZTmocR+JNC1gf+viriG4PIOqs2gUpQmkyO244fUmMZEib/ilU8R5KtQk0/mg
	4rCnmFq52cbbAp7wPS7WyKfExRY/DKvBcgtsgTENfyzZf5GLPIDjOsVjE2eOBZwqf5t+Bp
	uO2bUudrtVlSrsLO2d0H/YrgIMDWc56s0f1YRxrIp0Z7rkj89dcrPjhdzSfSslAyeq+9CS
	h2noU0RwqW/137XRuycN1pJvVGmOl02newBNdJoXz2d8jrxF3uTLZsKtlVnrEw==
Message-ID: <f47c44133a976532c0831816f776a879dbf3963a.camel@mailbox.org>
Subject: Re: drm/sched: run queues freed before the TDR that
 drm_sched_fini() waits for
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, phasta@kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Luben Tuikov	
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 13:04:31 +0200
In-Reply-To: <20260910095053.727808-1-donggeunyoo.kernel@gmail.com>
References: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com>
	 <6f52dcbb040b8ba796b56311e9a77465d111c868.camel@mailbox.org>
	 <df7b0d1e-5a74-445b-90fe-fae30cee4cb3@amd.com>
	 <20260910084408.703333-1-donggeunyoo.kernel@gmail.com>
	 <608f03824420323f9c9d3bc29cfeb0bed714074e.camel@mailbox.org>
	 <20260910095053.727808-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: aoxdbofbsfs93fjuw48jj3qxog3659q9
X-MBO-RS-ID: f6a14d98396b2592022

On Thu, 2026-09-10 at 18:50 +0900, Donggeun Yoo wrote:
> On 9/10/26 10:51, Philipp Stanner wrote:
> > Which KUnit test case exactly?
>=20
> A local one. It is not in the tree - I wrote it for this, which is why yo=
u
> could not find it. I should have said that explicitly.

OK. For the future please provide the reproducer somehow, for example
through a repo link.

>=20
> It is a mock scheduler whose run_job() returns a hardware fence that is
> never signaled,

Alright, so as we agreed on that's then not a bug fix relevant for
upstream.

>=20
> Right, that's what my patch does: drm_sched_wqueue_stop(), then
> cancel_delayed_work_sync(&sched->work_tdr), then the frees. The report is
> gone and nothing else in the suite fails.
>=20
> As you say, that is closer to a cleanup - or to making the teardown order
> state its intent - than to a fix. Do you still want the reordering patch?

I think it's a good idea. I'd move the deallocations above the related
kfree at the bottom.


What would be more valuable, though, would be a hint in the docu that
the hardware fences must have been signaled before drm_sched_fini() is
called. I thought we had sth like that, but apparently we don't.

@Christian: Could you address this here [1]?


Thanks
P.


[1] https://lore.kernel.org/dri-devel/20260909131808.2201-3-christian.koeni=
g@amd.com/
