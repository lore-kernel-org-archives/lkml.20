Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9D03C10A0
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789122212; cv=none; b=TR1sNATmzK9WYvN2qBbzMf6P/lIA+eeZQBMFtXpbNyiXsteLoHfOJqXewpkPWmGbEe+0LzIBJLeCHyTrc3T+GLEMlEXUpRAGjzEdUWie/opxoraC4AOgT17IfWTb1iogApixIrc1ObkQlc36i6nD+7SlU4lzCOHjS9gxaTCA9jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789122212; c=relaxed/simple;
	bh=d7bRn909F0O75J0JCRlQMKvdgnMRHkjqNPagjSylQQo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQ5GYJAZ8b9dnjHGDt7nr4iXX04UmXnr5It6pijRoRMg4QSb624ODLlFyBopZbtxusKZAaWm3SEzzkPMap5J2xITxg+Wk5juPqJcayM1ASV3zzjL55fctG+TXl/wbjllchA9x/3az8DON0sWRNwIWlrMCBmnTGZKhZh9Gq8qW40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=bu+onYEY; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="bu+onYEY"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hh9cG42d3zMlKN;
	Fri, 11 Sep 2026 12:23:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789122206; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=d7bRn909F0O75J0JCRlQMKvdgnMRHkjqNPagjSylQQo=;
	b=bu+onYEY/W7aKDmlmti/rVoLfxLGmqSofgTGmMyORsN/6L1JNx36gWVzUtO4+WdQksOaLa
	cc3Pzg+qdoRoAutqUeC8PHLQTMetsrm0e8H8P+1ixnw74eb+CmmcMvZDkdU1i/zpIiHlc6
	Wksx/bfVls5AkbDJPDY1w78G0ocyyxHNXJWquzHG8OOY9MDDeD+DDCJmTXo8TU1t/5IFVm
	/hoX1w/R1BsLW1LUjqYIspoZR7V7TThsjm52rtNeak1T+IrI8qFMZ0eIVNmHnjsr4v9uDH
	75b/PEiYFwt6kfhK0yBoF7lL7S1B3ISfR/ATbDimDizs08LzfAsvu1y8Fi8FPA==
Message-ID: <3e85567b68c1f11319fe8c318e6f8ca096af24ed.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Drop the unused entity argument from
 drm_sched_fence_alloc()
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Matthew Brost	
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, Philipp
 Stanner	 <phasta@kernel.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri, 11 Sep 2026 12:23:23 +0200
In-Reply-To: <20260910054537.633952-1-donggeunyoo.kernel@gmail.com>
References: <20260910054537.633952-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: gbdfoupfmamj7a7jrak1y91qofhkkgrk
X-MBO-RS-ID: c841f1253c71db065c3

On Thu, 2026-09-10 at 14:45 +0900, Donggeun Yoo wrote:
> In commit dbe48d030b28 ("drm/sched: Split drm_sched_job_init") the only
> use of the entity argument of drm_sched_fence_alloc(), fence->sched =3D
> entity->rq->sched, moved into drm_sched_fence_init(), and the now unused
> argument was left behind.
>=20
> Drop the argument. The sole caller still passes the entity to
> drm_sched_fence_init() at arm time, so behavior is unchanged. This also
> removes the parameter-name mismatch between the declaration (s_entity)
> and the definition (entity).
>=20
> Signed-off-by: Donggeun Yoo <donggeunyoo.kernel@gmail.com>
> Assisted-by: Claude:claude-fable-5

Pushed to drm-misc-next

Thx
P.
