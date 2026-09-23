Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A42468C28
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 22:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790204052; cv=none; b=VamoyE/vYmGqFXD58CzFyMWUsIbQKx7JAfPsg1+BJF/a0tpB0U2ZvSqMi431xfUq98bQl4GpK7l3gS0cbbYDM7SUstlYtJwQYQT46bvb7M5LOxyC5TJKfisyEJS1PbONcYDQBtdvtg2mKp2P4qN7m45qqIauMOk7p/4HxLIcCwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790204052; c=relaxed/simple;
	bh=cpax/13k0jxkQdS7/A/IMz8DDLbIlyvkUqdfAGRN0Xc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iGgnAm9OynaUMaJYQDYoGEedqTzUT5Z8RqdznOt1AR/HmNSAQZquPtvijxsDl6VMI8GOKK/sLLP0ggUqgr8mKNiIaOhQTW9DfyNm7VplcxXuxrwz+1efMsWePaadiZGT41Vk2dQA4YCdWg0eRGHMOJWPW0O4hOaHyC6SuY1gvSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYiiLuGv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYiiLuGv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD201F000FF;
	Wed, 23 Sep 2026 22:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790204049;
	bh=cpax/13k0jxkQdS7/A/IMz8DDLbIlyvkUqdfAGRN0Xc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYiiLuGvstukngP8msMKYZXuDIplTIHYq4g75NWD3qcMZ8W6gFbfZeTbQajsP10w/
	 wtanWytSJ0RBLmG2/0YqNDt/DoEz8IqN4QhScpT0ro37i6GhZEenIMJPzeG4qVa12h
	 aHJjv5RpU9ucXK6i51V1C0nouwOcpGq/Cbqvw4VCVpptJnlB0rynvZz61v9a6GAOo9
	 1fQJ13yXCF2PIhXYCuDZhV8VCxhh8O8Tv7FQVa6xesTQiVDbNLQq1nnC9WgkpO93j/
	 XcAyKHpwcW+7BIyCuJgpAI/CR+efXFvzPWXZL2sF83/bqRmELqcvmXObLUvKO0nJ5H
	 2FoAuE9i8MC2A==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/6] shmem: add tmpfs_create_mount() to create tmpfs
 mounts internally
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Hildenbrand" <david@kernel.org>, "Alexander
 Graf" <graf@amazon.com>, "Lorenzo Stoakes" <ljs@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Pasha
 Tatashin" <pasha.tatashin@soleen.com>, "Baolin Wang" <baolin.wang@linux.alibaba.com>, "David
 Matlack" <dmatlack@google.com>, "Mike Rapoport" <rppt@kernel.org>, "Samiullah
 Khawaja" <skhawaja@google.com>, "Andrew Morton" <akpm@linux-foundation.org>
Cc: kexec@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260923224408.3745689-3-pratyush@kernel.org>
References: <20260923224408.3745689-1-pratyush@kernel.org>
 <20260923224408.3745689-3-pratyush@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 23 Sep 2026 22:54:08 +0000
Message-Id: <20260923225409.1DD201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

> From: "Pratyush Yadav (Google)" <pratyush@kernel.org>
>=20
> Upcoming commits will add support for preserving a tmpfs mount via LUO.
> While the retrieve logic can create the mount by constructing an options
> string from its preserved data, it is simpler to let it directly pass
> the parameters.
>=20
> tmpfs_create_mount() allows creating a mount with the specified
> max_blocks and mode. The function only takes max_blocks and mode for now
> because that is all the tmpfs preservation will use. All other values
> are left to their defaults.
>=20
> Signed-off-by: Pratyush Yadav (Google) <pratyush@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923224408.3745=
689-1-pratyush@kernel.org?part=3D2

