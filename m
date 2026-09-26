Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5AD3ABDA4
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 09:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790414990; cv=none; b=oHtRqek8ZGoi1aDbON89LhFSdYxFQOh1A8SlkFvudmR7mS0JpbmMlreZI86BdE5303Zu+mFAfY+BGjbunhKMUq6b7MFHXrVxCk84Lj8fXRv70xRbBJ2MXPGBK7n/kvU82HiP79nymCBmjaAGkbo0q6iy6i60lItBw2xQEC9PkPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790414990; c=relaxed/simple;
	bh=crboOxvrJ8lPbqxWIICzX00men9f9+ZB4s2xBH/JEm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TDFOdPA/IbOZ1nV9qqQNzHT4vlHwTwfC1SPuEOgy9hZ+pzcKuCtIBHxREEE+bt+cCfwyWQTPLYmM1tb//QkXMedaJDqNkHdvIsWSR9dv/GdwbXua/riA7nTvWGJs3Y6jDuG9IoiKay04WybK+FCZSNBhQodFD78eCnFl0qQs2VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MkJMrAH6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MkJMrAH6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D311F000FF;
	Sat, 26 Sep 2026 09:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790414989;
	bh=crboOxvrJ8lPbqxWIICzX00men9f9+ZB4s2xBH/JEm0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MkJMrAH6xEt8MuQePzaeyrvnwAl+wKF6FcLv8A20eC9plGEce3O1epmIsMmNDn5HW
	 mOCiZkCvwX7EmXeMmedV/azMVpo1Z0VBupX+HLvk/cM9uCAKqndOI26sexDbR3z94W
	 t6B0UgcrCzFGrohptYFe+0OHcoCrqwN7sUdjO/pVmIsU5tLRJpx4CHVOhx3cDZZOqs
	 t3SuWXug9kvVE5w30nBv0l789F6wATP1/VMYOwOsnL8Uaw3KWAVhAnV8OjsoBEBDZu
	 Ktu6dTqAxchupgFxxkLjpzTWIh909uR32z5iQm9JCxn+0Ux3PErPF/OiefFzYOmSN6
	 3uaHrPk7EsRtw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] memblock: drop for_each_memblock_type() and open
 code its users
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tarun Sahu" <tarunsahu@google.com>, "Andrew Morton" <akpm@linux-foundation.org>, dmatlack@google.com, "Mike
 Rapoport" <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>
Cc: kexec@lists.infradead.org, dev.jain@arm.com, "Pratyush Yadav" <pratyush@kernel.org>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260926092448.4090401-1-tarunsahu@google.com>
References: <20260926092448.4090401-1-tarunsahu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 09:29:48 +0000
Message-Id: <20260926092948.90D311F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> for_each_memblock_type() always starts the iteration at index 0 and its
> body is a trivial 'for' loop, so it hides very little. It also gets in
> the way of iterating from an arbitrary index, which the next patch
> needs.
>=20
> Remove the macro and open code its three users: memblock_add_range(),
> memblock_isolate_range() and memblock_dump(). While at it, move the
> region pointer into the loop body scope.
>=20
> No functional change.
>=20
> Reviewed-by: Pratyush Yadav <pratyush@kernel.org>
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260926092448.4090=
401-1-tarunsahu@google.com?part=3D1

