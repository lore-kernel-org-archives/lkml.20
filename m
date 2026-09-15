Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B73207A20
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456815; cv=none; b=qIweSgq2vxhW19MaXDJDURsqB30n0UowbxqQvEHHMS4ip6IDtKZ2zfqrL7XcIe4gozWdvvAivH9XVotmtlbL8x7B2M7lng4HjxBKF3ORHTSf7gaq8SSr0y/A4VbIR8sUXyJGNBxiYUOgIJf10p1ED/9TX7yAyGbECI4EI529kbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456815; c=relaxed/simple;
	bh=B+wLRmdGG7/Y4tpo0/xjd90c1sLD7GxGhMrSYb6BXtE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Td98NqlfiqDXRoRRawDbIW4deHAuWrWLSyJHXacVdQb35eN46FTog16CSGhaZ12aR7JZonNcqEWDhXM5edJHxhRoli2wHDBiuedFAHyMjxbI2kZSjwZCJGKm9d98mRXz22NCQdi+/jGyFpWvo+fL24jjiaFBLPYOaUdzQaN1jIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=HLbHv5e4; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="HLbHv5e4"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4hkYLx5DpNzMlCF;
	Tue, 15 Sep 2026 09:20:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1789456809; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B+wLRmdGG7/Y4tpo0/xjd90c1sLD7GxGhMrSYb6BXtE=;
	b=HLbHv5e4/6Vz3z8UvudokdtnyWaTHKoEw4NzwIW8rky2bJiSaqreUSigia9MeWugDi0mQ2
	IYVLrSuPBgCL0lwIHweuOf4HPwgeeSPECDs2PJiEGM2253joBT26u0ilfkGe+xOz4jrINE
	cV1WL90PTT+uOj5GWZjKGbps0+N0SqTE9jfvRHF/DwPQqpkOVK7CSpxMZJUXw7ZmLZFyQJ
	O6TtVts4nFDk7NRC+MKv9DKlXcqwY/Rryv4VVba+ftgGGQWze4X6lW7YnNKbMArL7Ew52q
	cCNEFSK/OlNPic3Op8yO66qg9kV3yk61EvJKstovXmWB3eJAjmBzTKrGWFpirw==
Message-ID: <1fa1da9650fdd7cecb11195134d6fd0e1c3978df.camel@mailbox.org>
Subject: Re: [PATCH 2/2] drm/sched: document the RCU dependency
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: christian.koenig@amd.com, phasta@kernel.org, malhyuk97@gmail.com, 
	tursulin@ursulin.net, matthew.brost@intel.com, dakr@kernel.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	mdaenzer@redhat.com, alessio.belle@imgtec.com, luigi.santivetti@imgtec.com
Date: Tue, 15 Sep 2026 09:20:03 +0200
In-Reply-To: <20260914182740.1587-2-christian.koenig@amd.com>
References: <20260914182740.1587-1-christian.koenig@amd.com>
	 <20260914182740.1587-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a68fa6ec319ad5b96f2
X-MBO-RS-META: t5btidzie5mr3t5yspjddnxjkid8o4pm

On Mon, 2026-09-14 at 20:27 +0200, Christian K=C3=B6nig wrote:
> Tvrkos patches added RCU protection to the returned strings from

*Tvrtko ;)

Anyways, which patches? Better add a commit ID?

> get_timeline_name()/get_driver_name() callbacks of the dma_fence
> backends.
>=20
> This fixed use after free problems for a couple of drivers, but we never
> documented the consequences for the drm_sched_fence.
>=20
> Add a few words on the function documentation to note that we need an
> RCU grace period between signaling the last scheduler fence and

s/scheduler fence/hardware-fence

:D

> scheduler teardown.
>=20
> Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>

with the above:

Acked-by: Philipp Stanner <phasta@kernel.org>

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index 6cb6f95464938..f73c5141b4e5c 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1203,6 +1203,11 @@ static void drm_sched_cancel_remaining_jobs(struct=
 drm_gpu_scheduler *sched)
> =C2=A0 * is implemented, all jobs will be canceled through it and afterwa=
rds cleaned
> =C2=A0 * up through &struct drm_sched_backend_ops.free_job. If cancel_job=
 is not
> =C2=A0 * implemented, memory could leak.
> + *
> + * The user must wait one RCU grace period between signaling the last ha=
rdware-
> + * fence and calling this function because the timeline name returned by
> + * scheduler fences must stay valid until all readers have exited their =
RCU read
> + * side critical section.
> =C2=A0 */
> =C2=A0void drm_sched_fini(struct drm_gpu_scheduler *sched)
> =C2=A0{
