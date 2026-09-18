Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4354B1B5E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 12:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789733152; cv=none; b=aMHcOGWHDFAiMs4vjafvm8pQxgv+aTewoZebtgfsTgCIJ86SozBXzv5PKLzitjDur+8ulBkPUprXIEwu+KYX3ZDx2I0Cmphr0ptqJss54NiOAMao9mqNo46iKgxuQ/TIWnhV3ANOFwpodlwcECkKKvo19OK7EntZp2Av6wmL6uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789733152; c=relaxed/simple;
	bh=SJpW0PtXmb9FW3yVhHBs0x0523L+W9SCTa3BvVAUO8w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ODtUOs7GDh23CLHyxRSB+4KMS/LEhBY6RWqnUViUp28Kgwf1bUfSQSAHiAIYvHNZGX6MKB+jLFdlVW8muyvW4+scHTYJj+90gMbcKclgL+MA6JJ5wFq87D6M4cGvpG8KKFF6JBw/elL9qmca+O0OzcOM1ZkGaiJQD86dSSbKUX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jfaJsR80; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jfaJsR80"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789733147;
	bh=SJpW0PtXmb9FW3yVhHBs0x0523L+W9SCTa3BvVAUO8w=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jfaJsR80oPXiFx39MR/8lWMje9nMuOv2CWtksOWus48+a6HIO6z91esvkipYtvHjY
	 aRxn4rzgSUC+guM6w5Rn6yXgCerbAOeZZyv1Rd8q4kOmnV7k7CfR4vTZl+Hb/Vegh8
	 8/12h9oIVFRrdRHK0c6VOAarpQyUyglSfwNsUHYjApmT20VFMYDqCbGfz2BPfKila4
	 Q4IIglZrwf5yKp8COLf+BTS0SsWDxPV65C60w2LcfU/aYM8308nSsGGNKvsQGe7afw
	 UPnd0yUr3441D1lGWJ+a9exf6+ZSeKFnWtMdqHCM/tg5sAbrM/SLh0qtNzdjpdgeH+
	 VRzKIItbr/ARA==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FEFD17E090C;
	Fri, 18 Sep 2026 14:05:46 +0200 (CEST)
Date: Fri, 18 Sep 2026 14:05:38 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Florent
 Tomasin <florent.tomasin@arm.com>
Subject: Re: [PATCH v3 2/6] drm/panthor: Minor scheduler refactoring
Message-ID: <20260918140538.6a42247d@fedora-21.home>
In-Reply-To: <20260911114014.79139-3-ketil.johnsen@arm.com>
References: <20260911114014.79139-1-ketil.johnsen@arm.com>
	<20260911114014.79139-3-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 11 Sep 2026 13:40:10 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> +
> +static int
> +tick_ctx_schedule_group(struct panthor_scheduler *sched,
> +			struct panthor_csg_slots_upd_ctx *upd_ctx,
> +			struct panthor_group *group,
> +			int csg_id, int csg_prio)
> +{
> +	struct panthor_device *ptdev = sched->ptdev;
> +	struct panthor_fw_csg_iface *csg_iface =
> +		panthor_fw_get_csg_iface(ptdev, csg_id);
> +	int ret;
> +
> +	ret = group_bind_locked(group, csg_id);
> +	if (ret)
> +		return ret;
> +
> +	csg_slot_prog_locked(ptdev, csg_id, csg_prio);

Since we're there, let's check the value returned by
csg_slot_prog_locked() too.

> +
> +	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
> +				group->state == PANTHOR_CS_GROUP_SUSPENDED ?
> +					CSG_STATE_RESUME : CSG_STATE_START,
> +				CSG_STATE_MASK);
> +	csgs_upd_ctx_queue_reqs(ptdev, upd_ctx, csg_id,
> +				csg_iface->output->ack ^ CSG_ENDPOINT_CONFIG,
> +				CSG_ENDPOINT_CONFIG);
> +
> +	return 0;
> +}

