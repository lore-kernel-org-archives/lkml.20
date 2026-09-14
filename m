Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DC6D46D544
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 16:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789402298; cv=none; b=We6FhK2IdJ/VnKerWJ6c+nZkrNJh6yO1hs/b1iGA8yL4gYOOIRPkqgXbPcQ2pcAw2AGzCZF5TmGazhPUUYhnh/sL7u7xQ+vyl26HpmJFYE3CPwQIb4krqEmYIjLhgG/wfCTo+FXtaZtpByKzqFqoMQNlCscPYKDZMU//kBWeuuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789402298; c=relaxed/simple;
	bh=WfMNuIBGLCoCqhNcMOy6gzcxk2JxD7if2PlSrtkj3qc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cYNXOz6aI0FsSOENNjqHJxH0fQOU69RuFJUKK17PK9quj1rwzHeQsOnPucr+f1it3RzQjiFhLAxR9RSMU2yT3dHa/BW9XjcYydcRNnF2bFhabYAs2UFao2ok9vcyM1Itrtv+jg2Ce0RfatD/+paqwO6RExRMxwMT8VZsFkBWoVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=Eebbc4/+; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="Eebbc4/+"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hk9BX60WSzKm6k;
	Mon, 14 Sep 2026 18:11:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789402292; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WfMNuIBGLCoCqhNcMOy6gzcxk2JxD7if2PlSrtkj3qc=;
	b=Eebbc4/+vT0xel+2RkOmpPeEQOBHHActyL5FdHQCXm/pUOKg9JInHy/tefc96Lfcy7x30Q
	L9/pz7gBQEZxSN2L9NxUrgGm0Bmid5gC1VLd7uqAS18iNZ3xYp5IVM0NYdyOt9w7zXs9Zb
	dHzS4GuQgjyrXZAXj1YOJM5ep5nHk9tNZ6axTjVpmAGwbn2AcW2dPC6lZiI1rnGnd144t4
	HrVwLJ4gYzPpdUW5DlLTmMF+8zfOn9o2i4DISkFliUobZ3tP3RQs+6/820wtboi93ZHKIS
	67L+rxrEbpCP7Xn7pqXiW3GUj7kFUDr8wRMXer7dpZ3RwOqhgMaQDxPQh78HNA==
Message-ID: <3eb314e4fa5e55675cac54cd43999d549f945368.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: Remove forgotten header
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Matthew Brost
 <matthew.brost@intel.com>,  Danilo Krummrich	 <dakr@kernel.org>, Christian
 =?ISO-8859-1?Q?K=F6nig?=	 <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst	 <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Mon, 14 Sep 2026 18:11:28 +0200
In-Reply-To: <20260625104903.1713213-2-phasta@kernel.org>
References: <20260625104903.1713213-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: zfa5eayat5bs9jw9jhyjgbnx9niqdjnb
X-MBO-RS-ID: 26cb2e40f312526b947

On Thu, 2026-06-25 at 12:49 +0200, Philipp Stanner wrote:
> sched_main.c still contains the spsc queue header, which is not needed
> anymore in that file.
>=20
> Remove the surplus header import.
>=20
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Can someone review this?

P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 1 -
> =C2=A01 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index d2ca01b31ee4..9446b08fff1c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -77,7 +77,6 @@
> =C2=A0#include <drm/drm_gem.h>
> =C2=A0#include <drm/drm_syncobj.h>
> =C2=A0#include <drm/gpu_scheduler.h>
> -#include <drm/spsc_queue.h>
> =C2=A0
> =C2=A0#include "sched_internal.h"
> =C2=A0
