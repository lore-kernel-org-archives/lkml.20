Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792546295;
	b=QPkY4Yw4ZYu6bix4EHY6wGls0XPXlG24msyBhUrRY9kOZLSIz0c04B0AcN5IUonNRaRw
	 EROhPqWNAN1aR/otJTwfCbp+SZJOooBoF8bywN9IDEJ8KusP5rSWNG0t654r+4TVeiCdP
	 Xx66vRdmVby/Z/4E2tWG1bJ+TnQjoy+PC+JWf+FZGxfUdXF+XF8GYO4raj2Mv//OExugz
	 ONygcCVXvbGR/fZZutlO1yJVbaR3c7BjwsnJ2SryNSopxfpbIzPj4f4ea/2EbnKTjjwwO
	 7yOjpRUuRBBFVFxxFs1eJmFZWki6WUscpl2yCVPAUYro7tu17Qi3IC+XeyMxTVbWQxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792546295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=1Oyr8CX2pbnGJ3Q3gjNqYHBW2ZoYGQd/yYe9ksgRu8M=;
	b=3R0FZbBD4F91mBkIdL8IwnmDlcz3tWFKiVPnwiDrbPpkcVqjD8cQ+0Ktx43DufIOUBc1
	 SFnkFU09zw5BFySrUAYcqs6rLSrsboekBPogsj13fWI85J5EbLrZI7tuTOf7EMsbVBAFC
	 4UVewt1wGyaBO5eo7MQ9MTznPw8M/F6X1olgXWE9NJHQuTFfwXGZIEmsQfd5m0jxLuZ7l
	 3jaQEU0C5H4TMbEKr8/S9jLEb5kW7pSbfOC/6U/Qg8l/mnbJZcmwvIKTn9q1BYVv9QM/q
	 n5rqoNzPp9XxBxiwnpjjKdaYKvxkjtgLVDcI0xzUmB4mvBab8GcTtBmkPRtWIIgErBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DCgAow+D;
	arc=none smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AE5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:31:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AE5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=DCgAow+D
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-35f036b17easo483593eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1792546294; x=1793151094; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1Oyr8CX2pbnGJ3Q3gjNqYHBW2ZoYGQd/yYe9ksgRu8M=;
        b=DCgAow+DTuKsAMSquP11aG5unXYCUwzB+p8ksyQ0i+RigRmPbcnLoabj7dujhZ5mUT
         FapHrB8YK8D2Pr1f2bfx81e2DFzR3OaN2hlVq3av6gI5kGBrDJhX7RtdYS1smVfrs9Nu
         IbqLtXx8Hm1ooWiiUhmlgvvmHH2L1WDM6cX3jk7xX9alir1oW5RU8DQq6mtW+t5EgbLn
         bclzu62thItdzOUvDTnN7RAz82vqWXSkY3L/ahkaHSol1gEnd7EDo7yz14/dY/2YrL0j
         aKSq3W9H0KN+dzEO9HdIxu/uspEtuCCGo46oyeRwkzDCjiAn9YWzF91XyPfOdH3xM+Oz
         JaPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792546294; x=1793151094;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1Oyr8CX2pbnGJ3Q3gjNqYHBW2ZoYGQd/yYe9ksgRu8M=;
        b=YyyHKg0fZynde/B+UrXU0cLh2WzIGNMdBwwhT5OztwSaj7qeaek1ssP5XKNdP7LYlz
         62NUhbBotcG/kDc5/yHr/HnlpXQ+WL+hFd5TZ07SvvpPsTcWWXQ5UyAqLBz4zXMxiT5K
         is7xOmqHzqZw/BALNi4iTIybc6eIzYJQFJezqHQ4aHCrmG2FSqx6uF5iMytRD85Y/Qr3
         A5h+iT8AnnWH9GQ9Gu85ClF/0Nkt1pjrEgvDXNLfhleIbSrdSWX4PCOoal8758DXex1K
         pOxGkxYmzxd5ET4+Uw4PBnsK89sxo2QNmC98VYvIp2O6GngCb1VRVdcGq7IYoHI0SvN0
         RSgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLrpIlklOGtfHFsexgde9fh2NN1RSwal6ScFiNiiYe5lJGSjpNYXLaZdtVoIpmsjeeoY4YNpXZTiTXoo0=@vger.kernel.org
X-Gm-Message-State: AFq9FYKrY03+Qucdhsd7kicOIi/SfYiHFfLpAWMN4B0u5G9DGPRk//jt
	aR25kJpLoeJQ79v9x/wq7ezuIYzkDa17Uub/jWWAdHYjn7qsgKpfaOF2cZCPtJzkQ/Q=
X-Gm-Gg: AYBFou11IpACneb649UEICuDS48SgLg+aNYIowAq6Fd/59uZJr0CjKOH60Ey0e8PBx/
	1/EK5pbj7LJ6ASTq0rNLJWXpDAkm723IsswJa7lTFYOKWcrq2IG6IYooT0t37THa4QKGjtUwzsa
	FtjPSzkDkGfanB8j57YnRQZKNqcKhbpn96MG5SOJgipXdEPkSx+Be0gsoot9xw/X5T31ZcwgLcQ
	uTod5lxLpzU7c73B7pW3Rw1vJvbvO4rQxng7jKs+ow5VVioKvKfZcvzliE93hj0xlGTlhZvBADj
	kwstH3T0wRsstI8U6yFcKThPubbr3NC5mqCEMu5PKGFjlM1fqOeNemnMK9fW44Dso+OLJIbPQ6Z
	o8RLnxo2KUyvqhCZyr7enq1+Irx5yGXijIhfc/n2jcZIw4zJUOAmGKn056cxAId/W5VUghXjD4u
	2G4uhQJMQr0qbVu4garp7I+aWiB/1ISTY0yMOjRGSeK3nLB21w1/SbGWPNrIo5BmJ2NPIJc0ait
	pEHLfj8ytC8FvdCaMgVbLTvEj09te89GSOcS/1UZ2bP1XllaXwvrYj8iMpTg4z49dT8U0/0XNE/
X-Received: by 2002:a05:693c:8807:20b0:351:207d:bff4 with SMTP id 5a478bee46e88-3674b525236mr1312379eec.4.1792546293260;
        Tue, 20 Oct 2026 18:31:33 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-3673b1d0ab7sm2567638eec.0.2026.10.20.18.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 18:31:32 -0700 (PDT)
Date: Tue, 20 Oct 2026 18:31:31 -0700
From: Mohamed Khalfella <mkhalfella@purestorage.com>
To: Daniel Wagner <dwagner@suse.de>
Cc: Keith Busch <kbusch@kernel.org>, Jens Axboe <axboe@kernel.dk>,
	Christoph Hellwig <hch@lst.de>, Sagi Grimberg <sagi@grimberg.me>,
	Justin Tee <justin.tee@broadcom.com>,
	Naresh Gottumukkala <nareshgottumukkala83@gmail.com>,
	Paul Ely <paul.ely@broadcom.com>, Hannes Reinecke <hare@kernel.org>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	James Smart <jsmart833426@gmail.com>,
	Randy Jennings <randyj@purestorage.com>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/18] nvme-fc: Use CCR to recover controller that
 hits an error
Message-ID: <20261021013131.GU2931-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-15-mkhalfella@purestorage.com>
 <32d5f56f-285e-43d8-b5a7-490492270e51@flourine.local>
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
In-Reply-To: <32d5f56f-285e-43d8-b5a7-490492270e51@flourine.local>

On Tue 2026-10-20 13:56:38 +0200, Daniel Wagner wrote:
> On Sun, Sep 20, 2026 at 11:28:12AM -0700, Mohamed Khalfella wrote:
> > +static void nvme_fc_fencing_work(struct work_struct *work)
> > +{
> > +	struct nvme_fc_ctrl *fc_ctrl =
> > +			container_of(work, struct nvme_fc_ctrl, fencing_work);
> > +	struct nvme_ctrl *ctrl = &fc_ctrl->ctrl;
> > +	unsigned long rem;
> > +
> > +	/*
> > +	 * Tear the association down now so the LLDD can finish unregistering
> > +	 * the remoteport/localport while the fencing this controller.
> > +	 */
> 
> 
> Maybe:
> 
>           /*
>            * Tear down the association before fencing starts. Fencing can take
>            * a long time and the LLDD can't finish unregistering the
>            * remoteport/localport until all associations on it are gone.
>            * Inflight requests are held and only completed once fencing has
>            * finished.
>            */
> ?

Yes, this is better. I updated the comment just like suggested above.
