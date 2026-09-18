Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879E62D837C
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 00:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789691333; cv=none; b=u6LxY4aGu+w8JlhI0rGjyE9fWtqLwkf6GOqZgsGYNNDzzCQyhLFceDDMOpnpbZrWmWNVgXoyKqEDJHb5o4tNJnd6/+o2RmcOqG3jC8yjgEj3q6vEpkHEHqTJtIeMRIHRZyK4mbt69booVpOs0d+rbnjvqIxdr7E4vUog3PheVM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789691333; c=relaxed/simple;
	bh=CZyUKeUjL3VbbEuUgq55Wv+PmZoa3E5pWDjbtphAiMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rD5BZClUC2CmMkheLKxbcukVxqE+7ymeKuOfR3kCHrPDUDWJdxaZ/nS0uQYgC4CZenpSnx5d6PF4adFwA00TABnKc5/9qZTqKRqBEepnjQLhzLehvO74VsItXFjRHQYazEUlPWdh3/IR+noG8ExG2an630tTCa9YJ7VF10NOtKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M47w4V8O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M47w4V8O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F13C1F000FF;
	Fri, 18 Sep 2026 00:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789691326;
	bh=CZyUKeUjL3VbbEuUgq55Wv+PmZoa3E5pWDjbtphAiMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M47w4V8O1MJwov/K8stC0BWLy8Xd0XiFdkCxmRliNYgCEVr89aeb0ZJ/fJ7oeIJlz
	 RGDTB5ikI75dsYAMQ8KU077OumjB63isA59L3wlr396rJIhEwyHz+GUYVS/YEu97H+
	 EZ2JXAkKMa5ejpkR3I/9B5H15Yt776sC/4b/5MqLC/Osa+3GphfLlxJuby2xsuSqOz
	 SGMAqgkuvalFE+/Dw7OTWGqxoy+fr2JAeGyYQAqLirHOWZSGqZSZk1iehgaQ89IwQB
	 oExv03YOfmyEfXlE3N0K8DGcmnNiN/lvF3Avcc6AGD1m7K8W0Mm9DYIOoDMrPXj4a8
	 GWyZrlUiHsUSQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] memblock: use binary search to locate candidate
 regions
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tarun Sahu" <tarunsahu@google.com>, "Andrew Morton" <akpm@linux-foundation.org>, dmatlack@google.com, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Mike Rapoport" <rppt@kernel.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, "Pratyush Yadav" <pratyush@kernel.org>, dev.jain@arm.com, linux-kernel@vger.kernel.org
In-Reply-To: <20260918002239.4024231-2-tarunsahu@google.com>
References: <20260918002239.4024231-1-tarunsahu@google.com>
 <20260918002239.4024231-2-tarunsahu@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 00:28:45 +0000
Message-Id: <20260918002846.3F13C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> Use binary search (memblock_bsearch_start) in memblock_add_range() and
> memblock_isolate_range() to locate candidate regions instead of linearly
> scanning from index 0.
>=20
> Under heavy memory fragmentation (such as KHO page preservation registeri=
ng
> hundreds of thousands of disjoint folios), scanning from index 0 on every
> insertion and isolation results in O(N^2) complexity, causing boot-time
> memory retrieval to take several minutes (~268s for 393k pages).
>=20
> Using binary search reduces the worst-case complexity to O(N log N)
> (and O(N) for sequential appends), cutting KHO memory retrieval time
> from ~268s to ~50ms.
>=20
> memblock_search() open codes the same binary search, so reimplement it on
> top of the new helper.
>=20
> Signed-off-by: Tarun Sahu <tarunsahu@google.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918002239.4024=
231-1-tarunsahu@google.com?part=3D2

