Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FBB238886B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 07:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940555; cv=none; b=fEEwMIu6udipGyp5w31tEkuwayFYAdJkWCliTVKYyayp9q8IN1R5qyRsTqEpdDBTZA5qMo9bWn4bQBHQS0EWTD6FyVCE15qi+5He1zHpMvcOG2+gYnI4r3KDOrL+SBbcoY3L3rkGYRVAFdGsrnjyQJLEC8YLNE2V0dUn7AmdQoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940555; c=relaxed/simple;
	bh=uzWjEF3Y/+POUbo0/oHWUn1lZJuW/vcA5xGPl105Tis=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HTupikytobUdD0ZyrjV59DRD5/VvEnKdiUp5Johj0KiWSssL6DRGlCp5OuNqZRFJOQ21U8zzoBp7lzPA3MYUK+35EaqpUyvx2lCTnDxKpFLryd6lyxtPRjKECA2TD8n4NgbV+qZfPj1WfBnoUDVnjVpDv0tEdVAJKJSI/JJomVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=UOFcV+Hr; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="UOFcV+Hr"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hftQr35lTzMlHP;
	Wed, 09 Sep 2026 09:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1788940548; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uzWjEF3Y/+POUbo0/oHWUn1lZJuW/vcA5xGPl105Tis=;
	b=UOFcV+Hr/8Es2aWxRrZdMiWgcBrvjhi3CVkE9EeaSqJ7yrm6wgbgDuLsaCDqLZSFhwplUW
	gne7wLwE2K1Rpjin/A1zAKuiOxtU4MhSs2ouxVf9RMeiAzfeeq9PEdzhziSia/ggC0kT34
	uVdFyokGBPfz6IIZS3WensfuivXHko6ZCqxw4dfBadzu4ClcK/J4K6vY9q2KJNGeyCAi+p
	MZACsVzCKKiBqNffvuKW1ehKhNnc58Q5rPDg5yrDZKGnizyzMIaS/QDDIyFYg/OntTg1Di
	jA/hizvPUVT1w4F2UUJHllbr1btUz04ot/cO9GYyY9mj6b9ikRYNcTRHdkrmLw==
Message-ID: <8b6fd69a00e844b391850b4041e399c10084c378.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: drop the unused entity argument from
 drm_sched_fence_alloc()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Matthew Brost	
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner	 <phasta@kernel.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Wed, 09 Sep 2026 09:55:45 +0200
In-Reply-To: <20260909005112.278538-1-donggeunyoo.kernel@gmail.com>
References: <20260909005112.278538-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: 80f9cd215699884db75
X-MBO-RS-META: ahg5b41gttgdcf141xgh59utwo8t7bqk

On Wed, 2026-09-09 at 09:51 +0900, Donggeun Yoo wrote:
> drm_sched_fence_alloc() takes a struct drm_sched_entity *entity but
> never uses it. Its only use, fence->sched =3D entity->rq->sched, moved
> into drm_sched_fence_init() by commit dbe48d030b28 ("drm/sched: Split
> drm_sched_job_init"), which separated fence allocation in
> drm_sched_job_init() from arming in drm_sched_job_arm(). The deref
> belongs at arm: drm_sched_job_arm() selects the run-queue via
> drm_sched_entity_select_rq(), so for an entity with more than one
> scheduler, entity->rq need not yet point at the scheduler the job lands
> on. Reading it at allocation time could bind the fence to the wrong
> scheduler.

I think that paragraph is a bit overkill ;)

Especially the last sentence reads a bit like you're addressing a bug,
but it's just about removing an unused parameter.

I think saying "In commit dbe48d030b28 ("=E2=80=A6 =E2=80=A6 it was forgott=
en to remove
a now unused function argument" is enough. Who's interested in details
can then look at the commit.

>=20
> Drop the argument. The sole caller still passes the entity to
> drm_sched_fence_init() at arm time, so behavior is unchanged. This also
> removes the parameter-name mismatch between the declaration (s_entity)
> and the definition (entity).

This paragraph is good.


P.
