Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC42A48E0DD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949974; cv=none; b=nmO8xaCrrZMmGL/BAwzvsbMUCn4CfF8FMmkSrNoNNUDVAceh5rJ2dY0gVJpTo+OcY8pAWe2YnAuytmj2BERMijS1sJJkyyCv5yjDfE35/Pa3uswLLh0xGC56Nz62lLWw1ipjhri6HmUoc0oYHLhXAfwdQpIRMyajItGfwxXEmkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949974; c=relaxed/simple;
	bh=1or08Cl/oOQml/DEZq6dmSOvYX9gsw/HGxWMpfSXX6Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=o9ikeeoGTRcvYN0wWJ0YZ8hDlbGjASOD6/otvqf8Nor5+xHrcMHOLoJCH0rHutJTUI1xdxLq5pIl67K5ND4edOBmcHWom+yy9jCOdnOLf+v/qmR0Qj/vg6iHTlGfdjYcOMJeGgRNfMjHtp04pNhk12S1oxRqEYntZgrhJr3ufgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gw5YFqsC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gw5YFqsC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D3CB1F00A3D;
	Wed,  9 Sep 2026 10:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788949973;
	bh=1or08Cl/oOQml/DEZq6dmSOvYX9gsw/HGxWMpfSXX6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Gw5YFqsCgsVuhLTgR0h6VYOggGKAcT14+oSd7ei90H1dAejVV9s0danJX9+quVwTB
	 +fLTVYXsHgCSPtgK7AkvvV5lvHgAAtTJo8Q2ZC45MHuITQvFXMh1bHC3pKm7iFStdG
	 PPJralRhoTcnn2kMhF3HS3JvUV6WR8OnBrJHrOmTK5ovyKnIqty971wel1zbpM1MbM
	 9l3rpsYNklfsm59yn6ioYACXXteQAGGC0pj/vCjqrVbrnWAlDbZ02xK9RpQSfvtmZs
	 JqoCLFxemaD/yD8cLis6c8WV5Ek+mLWh0bW/PbXKh0ohbTPWS3EmvGbLOEco3nm/AE
	 w9nCmhYJ4N4OA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] kho: docs: fix scratch_phys debugfs cross-reference
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>, "Mike Rapoport" <rppt@kernel.org>, "Kamalesh
 Babulal" <kamalesh.babulal@oracle.com>, "Alexander Graf" <graf@amazon.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>
Cc: linux-mm@kvack.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260909103001.2423403-1-kamalesh.babulal@oracle.com>
References: <20260909103001.2423403-1-kamalesh.babulal@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 10:32:52 +0000
Message-Id: <20260909103253.0D3CB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> The scratch_phys documentation incorrectly tells users to use it
> together with scratch_phys. It should refer to scratch_len, which
> provides the length of each scratch region.
>=20
> Signed-off-by: Kamalesh Babulal <kamalesh.babulal@oracle.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909103001.2423=
403-1-kamalesh.babulal@oracle.com?part=3D1

