Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DB5EACD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 00:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788914845; cv=none; b=DBl1nl8pOICUeQxcGBQZ2dCvzsYH2DoyOQwB/OyqgW9QqQzaMx+fd3vYNxnsALT3t053dRA3iQ1W9u+tfm7SphD4SEwBVWY20G8cE5R8AnTeGqZv8jCesicBSqIDBbx2DmfrU0F6jdkr+67a6mhMRD2jVUwunHGRnEuQ/86DhP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788914845; c=relaxed/simple;
	bh=dHx3R7Rt9XHGk2xg3nZrHN0CgPQeIe8aRMMQ3cvQVWU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZT6sjj4pfgJcukjLDCL04/VPJZ3TX5K9a3ZwrOHInzwfTAK6RE0fq/tiPiZ568ytsgjTa5/+lSJpkYw+wCLzCL8X6zQUe5rSoKe9MnAxJjYlJjNhynecgwej029aHDJwWa9OsI8KLtZ1qfMUxjZOhKI3MLdRgdVIzYK8x2fEHl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G8rtxluI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G8rtxluI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ED531F00A3D;
	Wed,  9 Sep 2026 00:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788914844;
	bh=dHx3R7Rt9XHGk2xg3nZrHN0CgPQeIe8aRMMQ3cvQVWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G8rtxluIO2w4CzoYHSSOKL3edTpbvQUpDVKnMZmAcFCphujLLnTe8UG148v5xKHS7
	 8zED6TooSXQ9Dl/R7H1U1eeaZ8bDxVd8PpojXc2oMjDjYgGuL2wdCQFeGGwFT2ysqG
	 4i1X3eIgVaHGtpHv7UaNdirJL9yA4xIizZE9AYnj1UiMTEM0wOnl4vAOfGTh1zL5ZX
	 yYmUvbnYxQUO8gkpApWJtT1O7PDZERgUKqhDtm5IOcj8aISNQm94eDR+D668TeIbXL
	 UvzUwcppEBgeoTCley4IWoU2pZtzFlx18RMWgCJmyrZS+hoEHinI7q5dMrvh6LBkqr
	 UW9bMPoDk/KBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/9] crash_dump: Only use kexec_dprintk during the
 kexec_file_load syscall
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coiby Xu" <coiby.xu@gmail.com>
Cc: "Andrew Morton" <akpm@linux-foundation.org>, "Jinjie Ruan" <ruanjinjie@huawei.com>, "open
 list" <linux-kernel@vger.kernel.org>, "Sourabh Jain" <sourabhjain@linux.ibm.com>, kexec@lists.infradead.org, "Dave
 Young" <ruirui.yang@linux.dev>, "Baoquan He" <baoquan.he@linux.dev>, linux-arm-kernel@lists.infradead.org, "Mike
 Rapoport" <rppt@kernel.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Will
 Deacon" <will@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>
In-Reply-To: <20260909003657.1570544-6-coiby.xu@gmail.com>
References: <20260909003657.1570544-1-coiby.xu@gmail.com>
 <20260909003657.1570544-6-coiby.xu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 09 Sep 2026 00:47:23 +0000
Message-Id: <20260909004723.7ED531F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> kexec_dprintk will only be activated by "kexec -d" during
> kexec_file_load syscall. So use pr_* outside of this syscall.
>=20
> Fixes: 9ebfa8dcaea7 ("crash_dump: reuse saved dm crypt keys for CPU/memor=
y hot-plugging")
> Fixes: 62f17d9df692 ("crash_dump: retrieve dm crypt keys in kdump kernel")
> Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> Signed-off-by: Coiby Xu <coiby.xu@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909003657.1570=
544-1-coiby.xu@gmail.com?part=3D5

