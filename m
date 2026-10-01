Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE6F48423A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790861288; cv=none; b=TXWFtzNb/AG4az3drD8tqAg2AZm645wxUgLL71s+b5lNvK0GsFi9/befLR1DE3nZ/g6gNTwhfgazb/4el/SUYp8btBPGR4oKQWh+V5OPvYfgvdqn40N7s29OHP0rEacYEtbOiTzgADQEwyNULruQSAFg8oTFQIDJhWu1NO3zgHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790861288; c=relaxed/simple;
	bh=0qq8oCV2BwBfJa/uaAFfiCThhaiEr4Wxr9Goqf3oQeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vm3IJ3aeggiyj5pjY6Cj12z1c4S+fqgbP0/ZIF20U4jo5jhRmv4vQgLz6Vzz0KkNhpgMTKG4Uid26t0oMkKPqoFUuu351+725WFAaawOhq9aj/zx4QoPxLBIJkvk3e54Z7uSUEcc2In667GdT+dO1gDha5NPLcQ2drvN8AwCWhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilOfVBdg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilOfVBdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D501F000FF;
	Thu,  1 Oct 2026 13:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790861286;
	bh=0qq8oCV2BwBfJa/uaAFfiCThhaiEr4Wxr9Goqf3oQeo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilOfVBdgPzPbenny4hzW1i6fVi6K/wirHM3QC9Xi0TBzGdIkdP1Ca2F4x9tcgIH1Q
	 n1IGd3S4yQXoImH8d26P9hFoqUC2X6TDO5wWCW7GObGUUtCGHAH8I255t9d46CMAV9
	 4Vj4JQHWbK0t3Eaifb2df4oR5rb85E5hGHcvb1b3v6JwN8d5l437S0YM4uqdnRPbDY
	 0VC7Sh1pSGOiYiJfUhPr/zUtjMyNJUaV5ZOwWpgSXtgoWJBgubxIjEErLLgdGI/TtB
	 /mtmPmmcdqi6ALgjA9Ki2i/bjOMMYsvIayCPfVIiwyndVuEMHBkAJgJOFqdo/itaVA
	 GQgoP9NxM5hLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] kexec: Add helper to report an active kexec
 reboot
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mike Rapoport" <rppt@kernel.org>, "Shradha Gupta" <shradhagupta@linux.microsoft.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Baoquan He" <baoquan.he@linux.dev>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Kees Cook" <kees@kernel.org>, "Mark Brown" <broonie@kernel.org>, linux-kernel@vger.kernel.org, kexec@lists.infradead.org
In-Reply-To: <20261001132147.1703600-1-shradhagupta@linux.microsoft.com>
References: <20261001132128.1703511-1-shradhagupta@linux.microsoft.com>
 <20261001132147.1703600-1-shradhagupta@linux.microsoft.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 01 Oct 2026 13:28:06 +0000
Message-Id: <20261001132806.91D501F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> A shutdown callback in a loadable module may need to distinguish a
> kexec reboot from a normal restart, halt, or poweroff. The Hyper-V
> VMBus driver needs this distinction when moving its kexec cleanup into
> a common syscore shutdown callback.
>=20
> Add kexec_is_in_progress() and export it to GPL modules so the callback
> can remain guarded when VMBus is built as a module. Provide a false
> inline implementation when CONFIG_KEXEC_CORE is disabled.
>=20
> The helper reports only the normal kexec reboot path. Crash kexec and
> preserve-context kexec do not set this state.
>=20
> Signed-off-by: Shradha Gupta <shradhagupta@linux.microsoft.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261001132128.1703=
511-1-shradhagupta@linux.microsoft.com?part=3D1

