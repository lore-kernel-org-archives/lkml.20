Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793674810;
	b=n6fhujzG9qNKQwgXDbXo8hiq3AlCPYDAqIwXncwnYiSZM9E46NcvynYUieQW43ra6kiv
	 CbimK8/fC8JxjpW7yi6068SgKTDWSuJAZgPPo36kG4RSvbAXz8PPtOZj+gakfI5pWm24w
	 jcb6o2uIIkjr8OlqG52L/vndF2/FD4KqMdo4femi+Suz8/PNPpDGyRtDWTc38Y5QPcJe/
	 aPabtj+/BbgUnlyflWI8TSIC2dcoXD55IpuZN/GGU2kq2lNzVor1RNpqSGzYg3WFwIxkC
	 6qsLTI0aujjf48uObrj4FF2xRPSiJNKAAEiKLzRlD98M9V3VVQwvt6KeZbuMlNrNHEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793674810;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BgLwcZn61ih57sV4mcujs+yidc+9TU/TtuEVhbrlO6c=;
	b=1T9ys6tqe8W6UwfKVx0xlleFzPZbAnz0YF2stykd6nQ/TbGXHJ3+aPq179akWGNC6DeN
	 43tsvAltGq37WSRJxGFWYZS44gzSWxgkuTy1TTuQtgUDkZ8F83gmOOwxatSj1UABwmvYV
	 Ev/RX3Iq0h2Goz7miwzDt7oEptatOFobi7RRkznAz2xB91ldhwsAIy7HZQ8DRaP8zjrUs
	 vW6mX1IGCLcpm+IEZe+nspgntneY7ZhWvyNO0iyUwjd2GtVtCJ1R6gTWlB104CSz81luu
	 JVsLGSoM9ArPBu5PxFeodn9Xbzuamn3mZTOejwgswAcqn+il0Ung0G+wvxRH9P3/+CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=juviNdZe;
	arc=none smtp.remote-ip=115.124.28.217
Received: from out28-217.mail.aliyun.com (out28-217.mail.aliyun.com [115.124.28.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0453606A32D;
	Tue,  3 Nov 2026 03:00:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0453606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=juviNdZe
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793674800; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=BgLwcZn61ih57sV4mcujs+yidc+9TU/TtuEVhbrlO6c=;
	b=juviNdZe2sYT/lEfer5BX+6PEdSh5dG3PKtUFbbQADCNbC12hSNuNcAE0Ghd+gKXpZ2/rlBzC640RrmUbsCGKkUiLdZAc0/XAX2BnSVTdFlOwtp1O65OTcaJtHXxslI+Jp4rTvICloL2W1VsuW9On4O81xzYi4bm7KY8oh6Thz8=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.09663631|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_alarm|0.0300368-0.00105806-0.968905;FP=16406961698666919003|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=8;RT=8;SR=0;TI=SMTPD_---.jvH1Dsa_1793674799;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jvH1Dsa_1793674799 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 03 Nov 2026 10:59:59 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Andrey Konovalov <andreyknvl@gmail.com>,
	Gopi Krishna Menon <krishnagopi487@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Felipe Balbi <balbi@kernel.org>,
	Guanglei Zhu <zhugl3@xiaopeng.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: raw_gadget: fix dangling ep->desc on enable failure
Date: Tue,  3 Nov 2026 10:59:58 +0800
Message-ID: <20261103025959.4007679-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <2026102733-cameo-upturned-bf2a@gregkh>
References: <20261027032332.1945140-1-liuc63@xiaopeng.com> <2026102733-cameo-upturned-bf2a@gregkh>
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

On Tue, Oct 27, 2026 at 06:58:44AM +0100, Greg KH wrote:
> How was this found and tested?

By code audit of the raw-gadget endpoint ownership, not from a crash report
or a fuzzer.

Reaching the failing path from userspace is straightforward.
usb_gadget_ep_match_desc() does not look at bDescriptorType, but dummy_hcd's
dummy_enable() does and rejects anything that is not USB_DT_ENDPOINT with
-EINVAL. So a single USB_RAW_IOCTL_EP_ENABLE with an otherwise valid
descriptor (0x81, bulk, 512 bytes, i.e. ep1in-bulk at high speed) and
bDescriptorType = 0 makes usb_ep_enable() fail and drops us into out_free:

  raw-gadget.0 gadget.0: fail, usb_ep_enable returned -22

one line before kfree(desc), with ep->ep->desc still pointing at it.

Tested on mainline with CONFIG_USB_RAW_GADGET=y, CONFIG_USB_DUMMY_HCD=y and
KASAN, userspace side running in a QEMU guest: the descriptor gets freed and
ep->ep->desc keeps the stale value.

I could not find any in-tree reader of that pointer along this path, though.
usb_ep_enable() only reads a descriptor assigned right before it,
raw_process_ep_io() and the halt/wedge ioctls return early on the endpoint
state, and dummy_hcd keeps its own private descriptor pointer which
dummy_disable() clears, so the value left behind is only the core struct
usb_ep.desc. So a stock kernel stays silent under KASAN: as of today this is
a latent dangling reference, not a reachable crash. Reading the pointer from
a temporary probe patch (not part of the submission) right after the kfree()
gives:

  BUG: KASAN: slab-use-after-free in raw_ioctl
  Read of size 1 at 0xffff88800a7425a0 by task repro/71
  ...
  Allocated by task 71:
    memdup_user+0x26/0x80
    raw_ioctl+0xbfb/0x1ea0
  Freed by task 71:
    kfree+0x189/0x3b0
    raw_ioctl+0x1648/0x1ea0

and with the patch applied there is nothing left to read.

What makes it worth fixing anyway is that the stale pointer outlives the
file descriptor: a UDC's struct usb_ep is owned by the UDC, not by
raw_gadget, so the dangling value survives dev_free() and is still there for
whichever gadget driver binds that UDC next. The core keeps the opposite
invariant elsewhere -- usb_ep_autoconfig_ss() sets ep->desc = NULL,
composite.c assigns _ep->desc before enabling, and f_fs reads ep->ep->desc.

thanks,
