Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809361;
	b=PvSQu+geTuzlT5EoMttEp4ZyTLZFWxavVOcd6a3JFJ8PKoQ9NWgFX9dx3NITJT2D26kB
	 7CD2caYwujVInOBebhicnOzEmdTYcGgwIA7ECNgdCnTYCoKO8vvlM3gTpNzo1DI096td/
	 fjyFiWCjJHjWrcKyfBZQWYG28FFyOXDDRQnfaNno+JAS4khap2xM9h/yogQj0LEhvv7+3
	 JasggQ7kL8/7GBLNsa0ZxgMYehB4juQ/cPOesewXRqLECP3zTrGhSCYZpOjSnTOISuZDP
	 rJgc4CCKME/ozOo1N2jSAZzBy/IhzmItTHl8OIJGxvcrg20K7Bhu1OFh26YBD2JgVcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809361;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=T7cJbpg0mZrBdKFY2KdKIefURH8yPh7R0JwZrrE54Sw=;
	b=V40kADp4s8IxEXKguXvnYpnWmZw++svk8TSdeWj0tfQU7EBDp/w8WvDJUB44JxTbI1P1
	 aOeNe0Lwx1wmZEJlIwbaFHZ6Hn/sqkv7xiP6U9cZJ7NhF6xPD1o4vIovjZLF/rvs2dlZv
	 z5X9Gyn6wBW+EZktd11QaLblcz2lk+w7YlyHo2caQPodKMjXyuREVVcJWDWIC8k2NQ0b3
	 0hwniycmsNRRlv8BakEuffcKTZ3/Z/YZJPE2PcSoxbtcyhb6dVFJA42XSLt7g0OYAQ9o0
	 6RyiwMwKe97e6e4Y6BUfOoUvG/wyNJOjUV6Ch9MRUutZx3StvL5NydhlBLeIHQyT+AA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ks3044wK;
	arc=none smtp.remote-ip=117.135.210.2
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 393DE606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:35:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 393DE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Ks3044wK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=T7cJbpg0mZrBdKFY2KdKIefURH8yPh7R0JwZrrE54Sw=;
	b=Ks3044wK0/rr6NVpTbwaj/1wyi1rm/2lWBjuL+ofS+XUWA7jPZSzhUlUSpkvF0
	GxZn7BXAeF0Mx2t9YOjrupisQa9pB25lcu2Vu1AKy1EWEE7p1DKs6VGuASWt+Pll
	5K4/DlAt+pKWdYLw/70rfQulueieC2v2TA9TQVhceuaFE=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnLzJZGdxqA9VzCQ--.54169S2;
	Sat, 24 Oct 2026 10:35:06 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: rahul@summations.net,
	anup@brainfault.org
Cc: tglx@kernel.org,
	radu@rendec.net,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	hppiscas@163.com
Subject: Re: [PATCH] irqchip/riscv-rpmi-sysmsi: Validate system MSI indices
Date: Sat, 24 Oct 2026 10:35:05 +0800
Message-ID: <caplitmus-rv.reply.20261024.sysmsi.405bf889a4ab4be898f95a2cbeb6f0f2@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
References: <20260718040000.006.d6f39b01-caplitmus-rv@iscas.ac.cn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnLzJZGdxqA9VzCQ--.54169S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfUnhL0UUUUU
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7Rou9mrcGVq-4gAA3H

Hi Rahul, Anup,

A brief follow-up on this patch.

I rechecked mainline at 17bb0e2f6c80. The DT translation still does not
reject system MSI IDs at or above nr_irqs. Wired-MSI allocation uses
MSI_ANY_INDEX for the descriptor and stores the hardware ID in its cookie,
so the descriptor limit does not validate that hardware ID.

Would it be appropriate to reject out-of-range firmware IDs here? Please
let me know if any changes are needed to the patch.

Thanks,
Pengpeng

