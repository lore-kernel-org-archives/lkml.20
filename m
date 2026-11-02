Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793645939;
	b=hni6ilLscnilL3dkjW6sKgOOcNfivVOE2TJTH/WPdBh6ogpIcpxBPoya0m3rpR0ViVbA
	 7RTSOn/Ncd34ENXOvOYw9lc9Bwyh4Cw3wBmRVEX+eNr8Y2VyYnXGeKQF6i/M+cc/AZFHh
	 26UjaQCtm4seGFv9kHgwUd80QqPnnSP5nh/LxMT6M99nFQghxgBvaMFXiKk52sYpLly/x
	 UwbaHwSHfC3JIrXGsPgmYqUfWhN5WIdNp5zv7pjS+jPoy296W++Bq17aGFItWVE95G9tB
	 cb56NcUrmyspQXZ3mrPXDQE4qyTpN0fYvZCeVe0UwWY1sax1Dj17raUYmGZ3TYeh7yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793645939;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
	b=hmUplu5gq4QHCZfryxDl/cZ4+Go0eRgBkMpUARHOYzHTpBCSOcYI+bl6Xo8YWD9714ga
	 z/5bSC27r+QJCYwOJlQpFMkM4gJXw348/mGzuJ3Xsst+bMh08lMyIPltnoN316gz1JMaG
	 NermF+mRUu6CtYgyB3jjyGscjFD048q3WMD98N+kk0haLKGCyF3zt4r5R/4AbGel90yM5
	 K3Iab6XuqFLAmi0/BQuL1i0Gcg0EiYJj9K4O1gwuSIVZ8VHzzoD38MHJRFS80pfBF0P7g
	 zg/YZN6MCo/g0rW6pMIqeyOrD6BGYXQWJtJBXYzlbn/W8yD3oaOp6GfBKLfY4qrPJ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PozYLQ4w;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE58606A324
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 18:58:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BBE58606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--almasrymina.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PozYLQ4w
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a190c53a3so4522439eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 10:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793645938; x=1794250738; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
        b=PozYLQ4wJ91rva5JAu8n7V3l3TRDv+1xTlmu1F5D33tEMCR3nJEayW+q/9H0EOctz+
         TfaRyKv5C/bbE8DeFK6+i3wBa0qp+pQZcxEeQ4XpZDijoqoiYdBKMgde0/0nwXs7dS1E
         h2mmTx0ujLGzkGXIv4fph/lIoMxttNu0BT8zNdggyCPDidxiGeCh8VCmIWaQ5UoiK9M5
         9mDPDUnqV3q5suWt0EGAy2i56UXwy3KlDoUmS6pG9716ehk9wUTcilc0uiQoTz4vkdNP
         ts4y9t3PqFDZgAbUc5tbQ7Q4zevugRIZLPqimSAhyPDLATEGDCjCZI5vfBxkpBln3N7r
         zHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793645938; x=1794250738;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbysLIrexph35LgjM0FGUGuc+zi/f3zUiCq428yT1Rk=;
        b=vL0ZPOG6twKDX/C8au6Ly79KP1DYdz78U99qplxPx3iRX13Bj9PQOsDb0skifLN0+M
         F/KI6qm9kSCONiQum/J7BdxaQYXNS08Q50CaJqchLi7uXqCG9b+zJ+xtxPuSkQdQtvnS
         FW9W9mLGFQ+n+OohKRFIDg4gsTPPgmg+T/O9lY6P2gNqfp/R3/n/HT8jsGG2HKk5L8KM
         v95XF4xb8s1ut4LVeE2jwzgnnSydz+Lvyba7tDllrNo0JaB7+fFDBwd+0g9BDmnHsVqG
         ipVCkrY5eHy/bEIDjT5v1bVn8VeP+94yrb1RbggsIDsHnGCAypfJotcEpwT6XeU3o43O
         VvVw==
X-Forwarded-Encrypted: i=1; AKwUvBxSX22li8IzWGDkXuQ9fUKJGz3+pzuUeN/cG1lFLssGNnuMsDFW9OnJ+mjzcFSa3zY6W7PTFV83azmwnog=@vger.kernel.org
X-Gm-Message-State: APuU4Z98hZXiIxa6Ujsxa/MRUUyZ7g+FgnFDlOT47nDN8XI2eNZVo8po
	lR/uGK+Supr5tEEn0YSYuSbgYrSygPTkF1zPtZRENJWRjsrqsC9cfsqC8YLN6mqkCFufXLs6LjM
	1nOPVENWY9I+mujSPSK+LF7Bb0Q==
X-Received: from dyjo24.prod.google.com ([2002:a05:7300:3398:b0:359:198a:8046])
 (user=almasrymina job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7301:4d12:b0:369:dc59:7a6f with SMTP id 5a478bee46e88-36a422042d2mr15472016eec.1.1793645937269;
 Mon, 02 Nov 2026 10:58:57 -0800 (PST)
Date: Mon,  2 Nov 2026 18:58:56 +0000
In-Reply-To: <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org> <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261102185856.1824792-1-almasrymina@google.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
From: Mina Almasry <almasrymina@google.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Mina Almasry <almasrymina@google.com>, netdev-bot+sashiko@kernel.org, 
	netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, sdf@fomichev.me, kaiyuanz@google.com, 
	kuba@kernel.org, bobbyeshleman@meta.com, asml.silence@gmail.com, 
	dw@davidwei.uk, ap420073@gmail.com, davem@davemloft.net, edumazet@kernel.org, 
	horms@kernel.org, shuah@kernel.org, sumit.semwal@linaro.org, 
	christian.koenig@amd.com, phasta@kernel.org, andrew+netdev@lunn.ch, 
	sdf.kernel@gmail.com, hawk@kernel.org, ilias.apalodimas@linaro.org, 
	daniel@iogearbox.net, razor@blackwall.org, tariqt@nvidia.com, 
	kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
>
> On 11/2/26 00:16, Mina Almasry wrote:
> > On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
> >>
> >> - [High] The dma_dev use-after-free this patch says it fixes can still
> >>    happen for RX bindings made on a virtual device that leases queues,...
> >>
> >
> > I know about the issues with leased devices. That needs a bit of a
> > rework, which I have done locally, and would like to send out as a
> > follow up fix.
> Will such follow-up rework the code touched by  current patch/series?
> how much? I'm under the impression that at least the fix for the issue
> reported here would be quite overlapping.
>
> /P

I pushed the follow-up branch on top of v5 here so you can see the exact diff:
https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease-bind-map-dev
(commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-dev)

There is some overlap (~55 lines of v5 touched across a 6-patch +262/-99
follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, passes
the net_device explicitly to net_devmem_lock_dev(), factors out
net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue_leasee()
skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().

I kept it separate only to keep this net fix smaller and easier to review,
since the lease issue is pre-existing. Happy to either land v5 first and send
those 6 patches right after, or fold them into a v6 if you prefer avoiding the
churn.

-- 
Thanks,
Mina
