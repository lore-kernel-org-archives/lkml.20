Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.250.60.165
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792769074;
	b=tdEF58T8zwBf+RWBrLPL5IjVBIILc1y3gqzezht5dosd1yduXTumXKhSG55ggTIPGK+v
	 5eoAe2I2xXgAgckZni0nqEW5z6oXCug8z6ZZP3HVld8hV1H/OVbofDmXOKrqZaSqjgjwu
	 qXPmYwgrf/0FCqlJx6m98pXv7NZeftXRlh+TqdFzPA/1oAsYpBr5SNy6FGMqXM+eVD/sA
	 WluU4dEjbuCJzzGIBG2yyzD8U9BH5QEwx5d7zU/Kd4AAF33X+4PKBA08MjpnKNPJ5Ol8F
	 cHtAlAg5Qmd6SIDA8Z8BT9PNieJ6ssJC2vW61BYzp/kD1bHxRqraQExSUSXcr10bmCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769074;
	h=DMARC-Filter:Received:Received:X-Yandex-Fwd:DKIM-Signature:From:To:
	 Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=npNmIRcmiTbe8TUN5oF9hqxjSAu4kad9SSf+fBhKItc=;
	b=XnRaTn2naXdg4K0c7sXBMO//n3SRW3HdBrrP0YAgPgZ8jLFvcSZcQ8W0uATf9FxtSlVr
	 fTSfmmTr5C0G9AXPLrlKbSJHIyYhMktZI2cUlN1xx73W4bjhExCFA3u3Mbyai1048IBXA
	 y2HZPORTn248fq7GiJAprCNEik/cFDBk+VyNzE/eeLAlUIjPXjpqyUrgVzX8RSav9JIT7
	 40BFuqo1D7CKST1ZiBW5u1n9xsHsgGRk6O2PAPm2YbokpgnKNRHfKDuMjl34KSYMo5lvx
	 DzaP9R+U6qxfO18+vRUP7sWa1aIpL/p2Uf5RSnm1AtJQz9FrVKWX6RyHESRL51gE+kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yandex.com;
	spf=pass smtp.mailfrom=yandex.com;
	dkim=pass header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=xggIpMTA;
	arc=none smtp.remote-ip=51.250.60.165
Received: from forward105d.mail.yandex.net (forward105d.mail.yandex.net [51.250.60.165])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814F606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:24:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9814F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=xggIpMTA
Received: from mail-nwsmtp-smtp-production-main-12.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-12.yp-c.yandex.net)
	by forward105d.mail.yandex.net (postfix) with ESMTPS id 0BAF1100072;
	Fri, 23 Oct 2026 18:24:23 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-12 with ESMTPSA id GOf0WQDdMGk0-GJ7eC45D;
	Fri, 23 Oct 2026 18:24:22 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1792769062; bh=npNmIRcmiTbe8TUN5oF9hqxjSAu4kad9SSf+fBhKItc=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=xggIpMTA+9QrK39kLs7DqFcL5iYULlATGWKi98PgdVpdYgPrmPLPir8A8G6pkJ8Un
	 5M/QmsPEK0gy1ppY3dmt40uWJA8BlZTgkWbA0Sa8nCK5G2S6fL6q6HIeEkXpSSlrcS
	 KJAU7XSU4cbsIPqsgLcHZfBty9I5cDoaeqY96kr0=
Authentication-Results: mail-nwsmtp-smtp-production-main-12; dkim=pass header.i=@yandex.com
From: Alex <xnderv@yandex.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	xnderv@yandex.com
Subject: Re: [PATCH] drm/nouveau: idle the channel before destroying an engine object via abi16
Date: Fri, 23 Oct 2026 18:23:31 +0300
Message-ID: <20261023152332.9420-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023144219.46478-1-xnderv@yandex.com>
References: <20261023144219.46478-1-xnderv@yandex.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On the Sashiko AI review of this patch:

> Can calling nouveau_channel_idle(obj->chan->chan) here race with jobs
> running on obj->chan->sched when VM_BIND is enabled?

Thanks, the race is real.

Legacy PUSHBUF submissions take cli->mutex (nouveau_abi16_get()), so they
are serialized with nouveau_abi16_ioctl_del(), which is why the Chromium
case was fixed by the plain nouveau_channel_idle().  With VM_BIND the
EXEC jobs are pushed from the scheduler workqueue without cli->mutex, so
emitting a fence from the ioctl could indeed race with
nouveau_exec_job_run(), and jobs still queued in the entity would not be
covered by the fence at all.

v2 (sent as a reply to this thread) waits for the channel's scheduler to
drain first -- the same job-list wait nouveau_sched_fini() already does,
factored out as nouveau_sched_wait_idle() -- and then idles the channel.
New EXEC submissions cannot sneak in meanwhile because the EXEC ioctl
also holds cli->mutex.

Alex
