Received: from mta1.migadu.com (out-151.mta1.migadu.com [95.215.58.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A682414407
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 06:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790058697; cv=none; b=DhDpNwcrax1z1ZH/om2wkd87d2t2zCaH+/fZjaS9r4ML8t4TH9lzgX2rDgx/UhnFOazTsXjoDZ1mirIC+7aLI9IPHns9TJVJTHzlBi83LlHPAHlkWrnCmedCTbHBduVljaWKy6bzuqDjRSdGmSE7Pi31Kafyf4Lde2TAeqx6Eak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790058697; c=relaxed/simple;
	bh=WT7L+yjgB0IaOTyJkUQuzdzCWldIgXpJyxmwqVKairA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PmPw2cqWZ+4c6/+8rbXx50zU4wMeJYhIwfT29mqs0Y0Gufs9MaacAJA22PligmW8NCnpMYJDxJ707sk3ExXgDU0atDBzVRnRkuXiqle4jgBAPSoLCL2vNyCOe5OvhTr85ZBxUllzEYyKNd/Us4q3c/6z5iT4qa6mttsr4tsvJuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oAYNnPDU; arc=none smtp.client-ip=95.215.58.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oAYNnPDU"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WT7L+yjgB0IaOTyJkUQuzdzCWldIgXpJyxmwqVKairA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790058691; v=1; x=1790663491;
 b=oAYNnPDU7g0bbd9sOTRK7kokZ2fvrpFZqzEdH3h5e7FRO/fpmVq5lUutgC0S8Yp40F13w1Pa
 x6WaMn7qZFo3YIXySL9Tvw4umgM7wc7qYeOGHhUwQ7vb32qbdVCmu/335unQTcQ63D34f28E8no
 eMHM7CG+OFz4076/tOpFUv+o=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta10.migadu.com with ESMTPS id 3d5eaa6d3b009fbe;
	Tue, 22 Sep 2026 06:31:31 +0000
X-Mizu-Trace-ID: 3d5eaa6d3b009fbe
X-Migadu-Flow: FLOW_OUT
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.700.51.1.1\))
Subject: Re: [PATCH 2/2] mm/memcg: migrate per-node hugetlb lruvec stat
 together with hugetlb folio
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <arIEfJXYpspgX4-G@localhost.localdomain>
Date: Tue, 22 Sep 2026 14:31:14 +0800
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>,
 Hongfu Li <hongfu.li@linux.dev>,
 Oscar Salvador <osalvador@suse.de>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Shakeel Butt <shakeel.butt@linux.dev>,
 Michal Hocko <mhocko@suse.com>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Nhat Pham <nphamcs@gmail.com>,
 Chris Down <chris@chrisdown.name>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org,
 Hongfu Li <lihongfu@kylinos.cn>,
 stable@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <D086B92E-13A8-48A7-97B6-CD671EE22033@linux.dev>
References: <arIAyyjYcCKHFmyD@localhost.localdomain>
 <20260922042054.3264663-1-joshua.hahnjy@gmail.com>
 <arIEfJXYpspgX4-G@localhost.localdomain>
To: "Oscar Salvador (SUSE)" <osalvador@kernel.org>
X-Mailer: Apple Mail (2.3864.700.51.1.1)



> On Sep 22, 2026, at 12:30, Oscar Salvador (SUSE) =
<osalvador@kernel.org> wrote:
>=20
> On Mon, Sep 21, 2026 at 09:20:53PM -0700, Joshua Hahn wrote:
>> On Tue, 22 Sep 2026 06:15:07 +0200 "Oscar Salvador (SUSE)" =
<osalvador@kernel.org> wrote:
>=20
>>> Why do we need the whole thing to be embraced by rcu?
>>=20
>> Hi Oscar,
>=20
> Hi Joshua,
>=20
>>=20
>> I believe it's because now getting the memcg from the objcg requires
>> an RCU lock to make sure it doesn't get removed while we work on the
>> memcg. I think this is since Qi Zheng's "Eliminate Dying Memory
>> Cgroup" series.
>=20
> Yes, I understood that obj_cgroup_memcg might need the rcu-dance, but =
I was
> unsure about the mod_memcg_lruvec_state() calls.

The caller needs to make sure the liveness of lruvec, in which case,
lruvec is from memcg, so rcu lock is needed here.

Thanks,
Muchun

>=20
>=20
> --=20
> Oscar Salvador
> SUSE Labs

