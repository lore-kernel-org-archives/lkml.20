Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DC3CA4B6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 08:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030329; cv=none; b=eTsekdSasm+7dPSivRDTUoZ0pHF6pbpzrBLzV32gjP/8Hcl+tQk1dqJHdat3K49cOZcwf/N0hwmmxYlJCdstDU7AfOf4/C7O26N+QtqR5PpUKb1rAR+6mlYGHO1lpJLhfAw+s6miCTntxc/l0fzzGMP0bSlD2N3SyAkjJ/byayc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030329; c=relaxed/simple;
	bh=FX2cFaHch8amRDc3UqW68hr3WD9WI3VSFQDVtgOwqrM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XnurJhb7GjFlFOR/bnLA9ZR0KrqgoVTmi6lN6uSeNMOv5iSp9rbtqg0vURUSjic0KeQeU5xvMdRrz2uPg6w3M3+LnlIeUy1AVIfw1GBG7GQcCDHulSrppaj1/4m+u+WdypF0P6I9H0YRBjSgyXr9ujC79mzSi3f+WzUYQHJP9z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=uFNhIYU2; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="uFNhIYU2"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4hgWdC6J6jzMlGp;
	Thu, 10 Sep 2026 10:51:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789030319; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FX2cFaHch8amRDc3UqW68hr3WD9WI3VSFQDVtgOwqrM=;
	b=uFNhIYU2YFabjGfb7xmKDdNA+ZXXGo15RPXKgtUUi9z3CWkc2Dn/+Zw703YGib3ZiMQ3C7
	dYZXU4RnTr0ZcGbhFd5L0oztN1QMr0yl+fOyootHI+cQDGs6iEIlOjrDVsL/U5bjf6StNJ
	4A8scFYcEFIKF6uqsclb3m2621EmNJJ8eKiA5HPrsaqbpWd9doDKW+pXD1aVBGoJ7UPnlr
	Bvt6E3gP0iwaLVIVHATjknv9ng0TLOJ/uCnH+gP1/NsH7soos/6FasI/dmMTHnkjEGPIUZ
	YKTxAUuKAIO9mNIsi4Sb9tjmNxKH85c5GImfNOXI7NFk7dXXdCFqywTV37WErQ==
Message-ID: <608f03824420323f9c9d3bc29cfeb0bed714074e.camel@mailbox.org>
Subject: Re: drm/sched: run queues freed before the TDR that
 drm_sched_fini() waits for
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Donggeun Yoo <donggeunyoo.kernel@gmail.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?=
	 <christian.koenig@amd.com>, phasta@kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Luben Tuikov	
 <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Date: Thu, 10 Sep 2026 10:51:55 +0200
In-Reply-To: <20260910084408.703333-1-donggeunyoo.kernel@gmail.com>
References: <20260910054605.634135-1-donggeunyoo.kernel@gmail.com>
	 <6f52dcbb040b8ba796b56311e9a77465d111c868.camel@mailbox.org>
	 <df7b0d1e-5a74-445b-90fe-fae30cee4cb3@amd.com>
	 <20260910084408.703333-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-META: jxeqag5trg4hyy7kc7891ys68f6a66x5
X-MBO-RS-ID: e605a9458ce16b4baf2

On Thu, 2026-09-10 at 17:44 +0900, Donggeun Yoo wrote:
> On 9/10/26 09:32, Christian K=C3=B6nig wrote:
>=20
> work_tdr is queued on sched->timeout_wq and is only canceled by the
> cancel_delayed_work_sync() below the loop, so a timeout handler can still
> be running while the run queues are freed.

It is not as obvious to me as it is to you why you think that the
timeout handler is exploding.

> On how I got there: the KUnit case never signals the hardware fence, whic=
h

Which KUnit test case exactly?

I kindly asked you to provide more details about how and where the bug
occurs. Can you post a longer stacktrace and also run
scrips/decode_stacktrace.sh on it?

> is what keeps the handler inside timedout_job() while drm_sched_fini() ru=
ns.
> That breaks the rule that all run_job() fences are signaled before
> drm_sched_fini(), so a correct driver should not reach this, and I have n=
o
> reproducer that does not cheat that way. The same caveat is in the patch.

If the bug only exists because someone does not signal all hardware-
fences (that's what we call the ones returned from run_job()), then I
tend to think that this is not a scheduler bug.

Maybe a kunit test bug that should be fixed.

Though for robustness reasons we _could_ nevertheless stop the timeout
work item before releasing other resources. But that's just a best-
effort nice-to-have change, since the change making a difference would
mean that there are life time violations with ordering issues anyways.


P.
