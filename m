Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792795670;
	b=It5acLJIo/7pSE8g4B6VbPw/SjNwtb99dLUmuFBp2s4jgavlp49Jb3u2GE30nfWS3xuG
	 4kJyGpi8kDXPp/lKKLxIyK00+GPG7OsUr3pakUbTTH3XKk5o0Zj+h4sdA/y0Yd93I85vA
	 YN6BbJ30YaOr8AdtDaplD7oAf1YDPg8S6Tnp/gI2pYSUf0WUzkkrEyS38UgT32/p+ordr
	 6urK40D7vRw+NPH23YnDI4LUGEt7Ab5g/sddh9cxeXv3skXLttn9iafPzsxF+oG30wOQa
	 fp4fhzX7mfnhUB1LuxbqWyT+oEvzJqXRwOxGLQrGpDw+B5Plqs8o9uKHPt4A7v7UOcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792795670;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=8yA8pzC09OthcjSV+5j+RAsWByRh9zkzbIUKM5Wq9L8=;
	b=KC68OuCPEDzxWMe9/WRRgkhhIcQcBq60aUK6jxuXdnuT6231Mzm05Gb1OkKpyB4hnFDU
	 aXYzuiq4WXmSwMVpH7nZK2tjyIotYz9SEtX3pjHGZdjoDUAkHvagSjek9Ammdz7h6mmhW
	 v2wANbwfL2RcRAMdvjHEiEcbYGi1eWgH4Fuh7bkSiiGjg23V6wv5RLNW9YC5fvFJ9SMFE
	 nlnBWJpspg8jr7eZhu+1h8gM9eck2IHtIG3zrwd7Yj1clFwQmdWzLVBub6pC7i/50ZmL7
	 CaTFEdTx2rUUd//TuJKs5pby1aEf2PayD8WOerdCv8xP0mEEH5Wze/hxj96U6jR3Ngw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhxLb6eG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546B1606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 22:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nhxLb6eG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E41771F01825;
	Fri, 23 Oct 2026 22:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792795670;
	bh=8yA8pzC09OthcjSV+5j+RAsWByRh9zkzbIUKM5Wq9L8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nhxLb6eGgpV2joxLw1rvC53hdHGq019sDwM0MUcUyl03NNpY2KOsajWznvpxNiIU8
	 nkSAboGLAYFXMt1/IX6z16NFIHUpZ83jWXwH6LKFc62p2Hrwr72rNcxgmToKxYV0V5
	 Q0g8vWgaMgx90AXqpABgJ8tacBPuFVlZa/2voYRQrh3OGbct5juBycOl+N7NlislMa
	 0G9jpzHX1F6f+dd2l6wuQCPugLsYAqDBQfkIuXQXP9pjxv5SD7fg0FfMz++XGwMrch
	 D5PRWNjxwAaDnlBCISyAO+fEMdemUuSxGS2Q2i3R6AHXs2BXv1S/ccfsfkXOLv+Gi5
	 Y3cj+nKG+qmAw==
Date: Fri, 23 Oct 2026 16:47:48 -0600
From: Keith Busch <kbusch@kernel.org>
To: Qing Zhang <diasyzhangqing@gmail.com>
Cc: linux-nvme@lists.infradead.org, hch@lst.de, sagi@grimberg.me,
	kch@nvidia.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvmet: protect nvmet_ports_list with nvmet_config_sem
Message-ID: <atvkFA4c70s1uJaA@kbusch-mbp>
References: <179275538809.275862.8334230595898232727@tencent.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <179275538809.275862.8334230595898232727@tencent.com>

On Fri, Oct 23, 2026 at 07:36:28PM +0800, Qing Zhang wrote:
> >From 554233f4165842a0a104896c30ed4d2e89c11931 Mon Sep 17 00:00:00 2001
> From: Qing Zhang <diasyzhang@tencent.com>
> Date: Fri, 23 Oct 2026 19:29:28 +0800
> Subject: [PATCH] nvmet: protect nvmet_ports_list with nvmet_config_sem
> 
> Readers of nvmet_ports_list (e.g. nvmet_subsys_disc_changed()) hold
> nvmet_config_sem and assert it via lockdep.  The writers --
> nvmet_ports_make() and nvmet_port_release() -- do not take the lock;
> they rely on the parent directory's VFS inode lock for serialization,
> which is an implementation detail of configfs and not a guaranteed
> contract.  Align the writers with the lock the readers already require.
> 
> Also move list_add() in nvmet_ports_make() to after the port is fully
> initialized: the old position published the port on the global list
> before INIT_LIST_HEAD(&port->subsystems), so a concurrent reader
> could traverse uninitialized list heads.
> 
> flush_workqueue() in nvmet_port_release() stays outside the semaphore
> to avoid a lock dependency on nvmet_wq.

Thanks, applied to nvme-7.4.
