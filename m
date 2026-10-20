Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792512717;
	b=0hSvfiQ5NZae5RLzlOdpEfGRqNBBNtOnU6Ur7RJQNvi5CH55JhJcjtSny0rw6WOFFSkV
	 frxhPZW2hvh4w7f9VwILUEhcLjf5Wu18CysNdDKkemhulHHKumRL15a0y0TAHXhX+r+Cj
	 0gZpI6hQSaR0fk5OPMULuEJrwnjeHp3zSXVgFlC3yKOnm2rc3nKgoj1sFS0vbZRXG3NrZ
	 ziSUtGcCEZW/NgWW9vKN2exsYWwV1Y6a9jdlsrKYNJUyhMZC6+RIDmHM3GtGOg7B6wUZ+
	 5PRjloiW134+KKnwYKuKaffFAGHPoSE1iORmmz28Q3WaXU5boZ20hMoNt+D56dcQo8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792512717;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:In-Reply-To:References:Organization:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=0jjRi7coF+aCBcI0QNKS52WSm5QSybZCs56Aq01holQ=;
	b=klOBH6EdPwMBQA/VD7yO3jcahGzofX2lKCZeVWzgXkF3dh0VBHrO1vkPxLpgd05PzYcT
	 JDqoXXTOwD9TuYrBGqnFxji4fgaHZ1rTVD3z957f4fsmK4JkC1XbI0UiK+PjE6SX1FsGq
	 /acryTeB4iAtcQw2Poho9x/yWXputBeV2b0Nbif9iWAGqQdexF/qWom+a1yiwQREc6YaT
	 nVxLul7sWGCHsU/v8PPQ84Eqeq4g17R6Xyv5uWIMs5RZ3PslWp/NDZctA9MzPpqDJ7p+R
	 U1O5ROUPh7tTrU4dBm+r4MsTTUr5CkXTAG4tWuflvo2PLzWCEaYdhL47REj3NxinxVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HFo2P2Fd;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50050606A32D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:11:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50050606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=HFo2P2Fd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1792512709;
	bh=Q0MQtpNvKhTdiak4Qcjs/BaXrpGN3n3rOuZvvFZbMX4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=HFo2P2FdNEkweM8VltiK6p8zl6mdlrSK6sjVjVYkOlbJn3D/hopbhz/YlkTq2xHF9
	 g/ujnwmrqSYzF8kzghyKumW2ZEeml2ZlegvMqMJVUnNmtOCeZA4JKNK3xrOWLgtC7a
	 /QVj9z+SPlzyop10XY8jA6F7MIpXRDXX5DOqzTurecE0lZiOejTBV6MugW/DQgfO8t
	 HlGfc3Tzn7CQqsf483onpggiCHU/O1KXe/kGCy/vvoXwD5CZgBdVYWn1hlk235FGmy
	 0QsI+Q888ofsrEBcHtbLd4zZ7tN2EOyHNmaqyJxv/2+8qEBzle1H/Il15LGzUSG4Gp
	 OVG2OB/N0no9w==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 11E7F17E0048;
	Tue, 20 Oct 2026 18:11:49 +0200 (CEST)
Date: Tue, 20 Oct 2026 18:11:44 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Daniel Almeida
 <daniel.almeida@collabora.com>, Alice Ryhl <aliceryhl@google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Florent
 Tomasin <florent.tomasin@arm.com>, Paul Toadere <paul.toadere@arm.com>,
 Samuel Percival <samuel.percival@arm.com>
Subject: Re: [PATCH v4 05/12] drm/panthor: Add support for entering and
 exiting protected mode
Message-ID: <20261020181144.2c8aa6ff@fedora-21.home>
In-Reply-To: <20261012125940.3291951-6-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
	<20261012125940.3291951-6-ketil.johnsen@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 Oct 2026 14:59:33 +0200
Ketil Johnsen <ketil.johnsen@arm.com> wrote:

> +void panthor_mmu_protm_exit_event(struct panthor_device *ptdev)
> +{
> +	/* We left protected mode and scheduler is about to resume normal
> +	 * scheduling. Do the necessary cache operation so any page table
> +	 * updates we might have done during protm is correctly visible
> +	 * to the GPU.
> +	 */
> +	int ret;
> +
> +	guard(mutex)(&ptdev->mmu->as.slots_lock);
> +
> +	ptdev->mmu->as.delay_update_mask = 0;
> +
> +	if (!ptdev->mmu->as.delayed_update_mask)
> +		return;
> +
> +	ret = panthor_gpu_flush_caches(ptdev, CACHE_CLEAN | CACHE_INV,
> +				       CACHE_CLEAN | CACHE_INV, CACHE_INV);

I've been thinking about this a bit more, and I don't get why we need
to flush the caches here. If we assume that only one PROTM group is
resident when PROTM is entered, that means the other resident VMs are
idle until the other groups are resumed. My understanding is that we
have an automatic cache reset at the PROTM section boundaries to avoid
data leaks (invalidation of all caches), so why do we need an extra
flush here?

Tangentially to this, now that only one group is active in PROTM,
what's the benefit of keeping VMs on slot. Things don't get resumed
automatically, and I doubt the as_enable() is what takes time when
resuming the groups. If this new limitation stands (one group resident
when in PROTM), I'd rather simplify things to take advantage of this.


> +	if (ret)
> +		panthor_device_schedule_reset(ptdev);
> +}
