Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F6B286A5
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 19:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791486761; cv=none; b=qql7OmsisauEa4MZwcvEBiNc0s0w2NWYZzd61PoP27hg1hV38xMA4sdBKF42W6Yb5c2UrhMW05K4gKoqPSiu/Gpxroqrj1LDe4Sg3AlncjE6WupbqpSZHS7ZBRXuq5BMaRVD1kv9XlZniqZdf5nDT2DeArH+P2hWEBt6c6UNDE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791486761; c=relaxed/simple;
	bh=imD318uYbaR4I8GkThDrvvtTnqtl46+qes0QsXa8DAo=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FHfo5v9EXFoyO+kPG/F1RrelrNkJPMnveP5VFbY9I74OT+Heg2rjCPZ0B0YvYi30p4RK5wk5aJXwYXhcaktLzoIit3t5WIiThTOK4V/81GMHUYfkfqiTQBgN8X7DiZL6KGoZe0d9LWx6m7LuSaZv/OcghaOPRp4eidJ4f373VAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnKRpahR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnKRpahR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B78B21F000FF;
	Thu,  8 Oct 2026 19:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791486760;
	bh=imD318uYbaR4I8GkThDrvvtTnqtl46+qes0QsXa8DAo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PnKRpahRAs+fCtPQqncrSuQSpAwUK3VFsokdhvscClzl2W+rCLWdn+MQfKgjpJm5z
	 e5B29u7tHEzbtCCN5Gg9E937UIKqJtUjNs5lPBa8N3UIgn38tPpINJHT1wnGzunjRL
	 QF1DOUumYsRMStJDTuSK5uKzqspKyN/3Ory2AKsVoauj5uvAPwidSGEDxYTZ9UxtH9
	 bfp2OTL6sN2qZX2NrIRiHCyPT1lu2QlVosFVqcW43mkAAWvuhzsDrXX41RdVku2Ltx
	 sUQfuwqyHCsDFzxcTMTQDkLl9oi9UXyRdpYpIosHfUgBqhTjHZO5+D+AphwNLm48aM
	 569ZCvB0szQfA==
Message-ID: <sashiko-outbox-164503@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] memblock: drop for_each_memblock_type() and open
 code its users
Reply-To: sashiko-reviews@lists.linux.dev
To: dmatlack@google.com, "Tarun Sahu" <tarunsahu@google.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Andrew Morton" <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261008190828.3221718-1-tarunsahu@google.com>
References: <20261008190828.3221718-1-tarunsahu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 19:12:39 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008190828.3221=
718-1-tarunsahu@google.com?part=3D1

