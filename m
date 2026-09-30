Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE243DFC74
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790770453; cv=none; b=Nav1cOpVH59ZZHHU4b7kRdmjzPjUrpkAt0Ss1iKwn7bMZdEjWeZQ+evkAoAIuq0VoD1Vd3KEUWsXIEaAY0bmmcmPIzKlUJVr2CycEtx1oK+MBWkTlaDXMDO56gasWcvax8rTns2HUVLysIMWxxg4QFSrgzaqPcGZ1T6U7Y94LNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790770453; c=relaxed/simple;
	bh=fHgbHRNzEnFUlP31YxzqtwDqio/CYy4seWxnYnXWxyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L0aptgasRk6jOqeFcNxK4A9pKa9Fyk4QNCmJrLA8k19ltOOC6UYaM98fHu9mY6oIY+I7gzgHJKUpnPBc4lHxGNsKfFhSbuVnf/LdwSKp1y+Y7b4aA5SUY482u8C4hOPiKqaS63OpfDU/1YBHFLDbsIRdl8xMuuxhScZkvf1X4RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XzvkGeU7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XzvkGeU7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5C51F000FF;
	Wed, 30 Sep 2026 12:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790770451;
	bh=fHgbHRNzEnFUlP31YxzqtwDqio/CYy4seWxnYnXWxyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XzvkGeU7bV2t80zI5BtErxLjoC/e8vILDiqkw8Flj+ezG9Q21+NZBsQkqrinoZ1yp
	 8VOcHtRDdIbf62K49d7u+5/nCP0ccE5cDJQP9pgqt9aHMa97N5myDpkxNYplH9Vc+C
	 exckcUyF2GPf/3q7toZa46E4CZV7U8PbYKxd+rTOW1PRR+PgRihvg2TDQDsEoGk+Bs
	 hTT/g3Yj2Q+S9lGPSk5TFMCb3O7H0so3NTWCn+ltm3rY4oLiZKK7FkWwUKc5gTzwV7
	 uKQrMweHSQa4O57IV+LeTuy2f3Ih6S6BzFO5r5cXXna2U9EGnXTTVowg4C+JNPLcal
	 bYXTHZGzAuoqw==
Date: Wed, 30 Sep 2026 13:14:06 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: =?utf-8?B?67CV7YOc7ISgL+y7tO2TqO2EsMK3QUntlZnrtoA=?= <ts930@dgu.ac.kr>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
	Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mm/mlock: fix zero-length request normalization and
 integer overflows
Message-ID: <arz82IHw4MqGTb6l@gremlin>
References: <179066531783.50175.13377521828379196177@dgu.ac.kr>
 <3a95d0e5-7969-4b0d-988a-ead62b06b6f5@kernel.org>
 <art6x0XpWcT2aUyy@gremlin>
 <CAFPGN2jPGhcWVqa3k16RWMaMR3TwKyhFbYYF4D3L6L85T8E96g@mail.gmail.com>
 <7d120555-0c31-474f-893b-e5ee3466ead4@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d120555-0c31-474f-893b-e5ee3466ead4@kernel.org>

On Wed, Sep 30, 2026 at 01:43:05PM +0200, David Hildenbrand (Arm) wrote:
> On 9/29/26 11:39, 박태선/컴퓨터·AI학부 wrote:
> > Understood, and thank you for the feedback.
> >
> > I sincerely apologize for the poor code quality and flawed helper
> > design. I will be much more careful with commenting and ensure future
> > contributions strictly adhere to kernel guidelines.
> >
> > I will drop this patch.

...

> The CI seems to complain about test failures:
...
>
> So is this patch doing more harm than good?

As above, I think the submitter has decided to drop this patch?

>
> --
> Cheers,
>
> David

--
Cheers, Lorenzo
