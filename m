Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C971C3D73;
	Wed,  9 Sep 2026 00:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914332; cv=none; b=kiYP3pYBYtrx7n222FAa2Cu/mqwefMWQb9sIZHGUkvm0MYn+6+/tq3b95sZmZlnYfqzOg/qLjbrPpFq8wcppACRjimV3s9w7Z8lP3940SpR+kV6AdU8BFvhUsyCyzwrG4LzNliN4YaKXza11E7ZoY9oG6v01Mr+MKOS68G4EX4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914332; c=relaxed/simple;
	bh=hR6AzeipmBNfow8mYwPAoPhp3cQitUb8cZO/RDd6r7E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oyf7tQIEMdBOdXJ+X5nlSWsL6TpLDil5bXrvSlKK5tDwsEm8+pJ2dFDW74+Y1BmLHbXBaCuCx4ZPl68Am8J5clOn2U3/9Sdx7vWKABSWITwVBl8kv8CsFYfN8F7XIA8GG5TT+IvCwW4Oa+zCqULhT6q2B4yw26Z2t0pS/IfsT6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqnnaihL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqnnaihL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D791E1F00A3A;
	Wed,  9 Sep 2026 00:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788914331;
	bh=hR6AzeipmBNfow8mYwPAoPhp3cQitUb8cZO/RDd6r7E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XqnnaihLeqlAAgNthOwQ8qW5VX2A9G7ziPHbje7fECJa6JOHn5Uoyj1VqzV0pxV8A
	 bYe9bqTZ9RNyxavVNmoodZI2H2ftdy5egU3oXjyvyUXJQbPSEB6YsOu7M0qFr0KUHw
	 gFwWRoNeHrd8O7GHLZHAxsh48/9w6pqZG9VjIcqQ/o9/AyV+zzcYtD0z6Em8THcqFd
	 1qkLTLbbUAOxDlwL8qEONCJilGJF14DRPuf87Tj9HInslKMrfTqD15LEzVhAH9jurE
	 wJYaYaDLeixv5Lyj5IxgBRn7+L/rVXtkOmIt2/DPz31UBDpD+pkD0PBX2LX0ZBkVQ7
	 jHVBb9FQavdXw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 9/9] Documentation: kdump: Add arm64 and ppc64le to
 encrypted dump target support list
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coiby Xu" <coiby.xu@gmail.com>
Cc: "Baoquan He" <baoquan.he@linux.dev>, "Jinjie Ruan" <ruanjinjie@huawei.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, =?utf-8?b?b3BlbiBsaXN0OkRPQ1VNRU5UQVRJT04=?= <linux-doc@vger.kernel.org>, "Dave
 Young" <ruirui.yang@linux.dev>, "Randy Dunlap" <rdunlap@infradead.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Jonathan Corbet" <corbet@lwn.net>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Will Deacon" <will@kernel.org>, kexec@lists.infradead.org, "open
 list" <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org, "Sourabh
 Jain" <sourabhjain@linux.ibm.com>, "Shuah Khan" <skhan@linuxfoundation.org>,
 =?utf-8?b?Um9iIEhlcnJpbmcgKEFybSk=?= <robh@kernel.org>, "Mike Rapoport" <rppt@kernel.org>
In-Reply-To: <20260909003657.1570544-10-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-10-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 00:38:50 +0000
Message-Id: <20260909003850.D791E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> The encrypted dump target support is now extended to arm64 and ppc64le.
>=20
> Fixes: e3a84be1ec2f ("arm64,ppc64le/kdump: pass dm-crypt keys to kdump ke=
rnel")
> Reported-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909003657.1570=
544-1-coiby.xu@gmail.com?part=3D9

