Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DAA140D588
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122907; cv=none; b=SVc4tuamDFDwZbmVfROW4H3FlvvRRV9tATaz9vPiKeh/zzVz+74POkwNbFNQgf2BRNJ9kPI4ErKq4LMKLA+/gLbQ7ZS9k2wr8ZFj12XZaanO5PyqCCOWb0UjS9KybRq4VEzKrhmqPIL4ssOW6T/1izrZIvLa0YVBGQxRyF8vn0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122907; c=relaxed/simple;
	bh=ZKEEiD16wKkBQjxmDmRAUzZxy57faOnn/iVbND/QIsk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YusmQ3GtFYjAxLVKu1OEfJFrAAVZYk4lbd686/lGAYY827ufwjPStcvZb74KvAYwLqZkwkafkrGf1OLkKEKTMNkhpMRf15iAkvB7AYdnZuXb/jv+pmziJoUFwPr80NYC5xNs5XbbQdYT3FTjJHwKblKDKNDgb+FHuNdryNW2QJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=hiEerPN8; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="hiEerPN8"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hh9sY0cKKzMlHB;
	Fri, 11 Sep 2026 12:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789122897; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZKEEiD16wKkBQjxmDmRAUzZxy57faOnn/iVbND/QIsk=;
	b=hiEerPN8mdqqrsx2qHOWOvFREe6NaSSh+iiKK1eFpYokR0Yc5WE2T3/iqQvKynpfQ9oVKr
	CNllmCrH8Rq0+opOAY9GD5vrGJJA9xm+MgZuDSUF1Je+L91J7aaW+4S9dbZycPfe5LmNZf
	5lVdSXQXfEGvDxo7V9FSHSjrfuCm9dtHjOuru+m3s3d1aNSA+blUZd1lyaBhjNt4RapOsA
	eEviFPoTeDjDoMs9/0coIRurGj9ptRA7iGJpm3SXY7FpIikZNN4POCUqFT7bxLLjzbefT4
	Yz9DYfW3FyUYfMXzxhSos3hLAnz3+/KIvUM0s1amYi4ik7s8G4njrAbdi1zWQg==
Message-ID: <54380f35297f069d7c3874c5239956125e923fca.camel@mailbox.org>
Subject: Re: [PATCH v3 0/3] drm/sched: Introduce more locking to entity
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Sep 2026 12:34:51 +0200
In-Reply-To: <23c88f50-1998-4de9-bbdb-3d15fd06d642@ursulin.net>
References: <20260910075942.2000338-2-phasta@kernel.org>
	 <23c88f50-1998-4de9-bbdb-3d15fd06d642@ursulin.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: tp1esos6apfrrw8kgkncr4ej4hi35bao
X-MBO-RS-ID: 40327136b90c505ca58

On Fri, 2026-09-11 at 09:19 +0100, Tvrtko Ursulin wrote:
> FWIW if you could review=20
> https://lore.kernel.org/dri-devel/20260907130527.52530-1-tvrtko.ursulin@i=
galia.com/=C2=A0
> you could drop the first two patches from your series. Extra benefit is=
=20
> that patch fixes a bug and has been tested by the user.

See the other thread; I'm not super-hard opposed, but if we can agree
on getting CFS to a non-experimental status by first improving
spsc_queue, then it would be nicer from the diff / git log perspective
to have these little patches as a preparational base-line for the spsc
rework :)

Greetings
Philipp
