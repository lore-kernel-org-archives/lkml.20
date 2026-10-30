Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386379;
	b=bbWYeEmd3IWBSdmUZ7VMk/kJkV+8zbBoE577ACbQ5DGtv27XUH3QLgPciGrRYReltf/0
	 3ZitZjJuxmnxa5CDIWRu8hOfO8UAd0GnPgRJSTFITBezp4uD82kb8aFAiPtJ1D9jd/x0s
	 7p+x3zLzlfkyTWMPkA/gom6RAiwU9CcIwJjphrfgFv5nVQEuDhxkoTCGcqTVBGwditT1E
	 Y7ffyZpaBk7Gbx3US3ceecvxvGZdRskBROWFo2wO+ypiWeruO2DQ7pFowDzpdi1go8gud
	 5T1+p5D3D5/LyQvg1EqSubB4986WDHe+tqkDnjsr0Z1jKEz/iWzUd1PscZ7wl5HJVCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=6+OCqfxDbpq61xBuSuXpAVYprxq9Hm6R+j2C8z2vLPs=;
	b=nMC+jflVOll73qNKpsQ27wCwVEEj4WI33HZctdTuXvRhEVrf7OVfFk+1S9e48bzPhX5T
	 v5uO3E8d+ffn49G1cTj7ckCFYJs+7p0mYFj0DEcpYs0r6l95GTqV1StoK34hpXpOU9LFu
	 ItLcpc12sS/qksLaFxNWE0Ly8ZRU6eNuoN0E/tnwspmXBa+BEf/rYP0pY0x5Gr6jsHJzT
	 8f8sVC7qaGV6Givtn1tE5XyCEVO152CMS6dyns3vAYtY2mhSdLgrOGbYpqPSNUz4QOuQo
	 K7hI0fUDzyHG6k8Rd04JmN1mf6yZq6F39tKnA6tarqAAahWnEG7BcRsQkE9wtrqPNAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=purestorage.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=VMpQ3gLn;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35D5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:52:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F35D5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=purestorage.com header.i=@purestorage.com header.a=rsa-sha256 header.s=google2022 header.b=VMpQ3gLn
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33fb4680717so12299eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1793386378; x=1793991178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6+OCqfxDbpq61xBuSuXpAVYprxq9Hm6R+j2C8z2vLPs=;
        b=VMpQ3gLnbmNZS/AhD0mKpuirY8O1B1XvRS76F1aUy9Nunq5K37/v6ENucURXaEa1yo
         tu8WBk61f6ZPtp8Eiyj3tlNrTnymAWc7cDLIzJI9gFvFqqWq6+GrOr34BgHE6YD6Y6b1
         kvnxGLwj1sbClZmyNaJaQwEqdncwFozB7+Ugh/EHcp8/p0Q4FwDfeOjy1IG3xQj4g19w
         A3zJzZ9DLWRExZTOhYUxMnq/XIDwimTRV/LFzqaCLkQeqAiNuoLoRCVL5/efEMnZ/8kp
         eKg3A4M4In/6QdpIvwQIcVaYiO9H+pqWq81sOVsxS8prxjkVlv7xh333qkP54nA9kqGB
         QjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793386378; x=1793991178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6+OCqfxDbpq61xBuSuXpAVYprxq9Hm6R+j2C8z2vLPs=;
        b=ZJkavi/QElCyNwX9ekZ63ye4FHnNsKedknEOaEFYaXjthJRRj7A57II0/zEDUYu1/w
         /QELiTE3L3qq5hX/hiO1/QcH+lgyw7jslp3g1sXwvc3UteUpriIcPi4ZyasUIpOJnep5
         Nmkt97+S339J8MFCDEUTLcVxNcJDMr02a0hrGQ4t1hiE8EssYFqDbHXaWyLvNrWo42bP
         4BLzlJnn47a+yZmHtCfsc1KDTU5LGTLqHxM+abom7oqDtpsm2pyYrT52D1Uv5Iy9GX9w
         LZ/25cDqE528iaVLrQ8yv3+4bwhVOX+MNYVP+qgyuIMJykdcpSdl2W/sZ4rB7N8rOxYc
         7G0A==
X-Forwarded-Encrypted: i=1; AKwUvBxkD+xyxFDXTaqSfGr0btplILyxElY8zGu/H++7izSOIvKEMdDDl57njQBcCV9r2B+ATzKOslOja6pYHBY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8y28fkzCSmRMkDfMK4dV/dh90vHBFCLlG7+VjC0SbA/BqXekU
	SG+UEum0k8nswOL4JksAgXpXOHRjX3J9FH12+euGJfmdEiWOjDy7l/ZOsTFbFVUCOe8=
X-Gm-Gg: AYBFou1S6I2+egQ2VxnQduwfoIh5CH+oI8/HJGOBgviIQzwUxlYfS34KgzF5oDyIkMk
	624p2Y5IbeZ4UDB0hSX0uJ+dAgiGZViei4GpIQKrBXL+gHiV7y4M2u3zjaEaFjIiVnQS3lpYXs7
	x4QkU0Rr3QsESmdoZf4i5ibF5SvicS3lZ3tMoTV9eGLiKFz6bjZneyWm1maq0c3njTOwnQ+EkL9
	aKbdYM3DcQuVYPYtCSMkALk62jIlovijnEYZ40nO/pzJo1Z3frIdCg7Q1DAHrR6jwilGnqV9ijp
	ks801dWU57EfxYT68FKGa2g3CB2keuznpwacMmUoDeViP8NxSmYu4mq68tFClYkX4+nqWpFinyP
	5kqHtUcw/03B4cV1MarLrR9GeXe2Vcpux5a93jmLPvC/l7FRBpxieFAYm8SNbi7REvLYsYPYakp
	5q8qmrov5Zc9wqQVpCks4BC2DpzO0pDWNQOPfsPUhxo5yshFNXSYzbQIGGpVFgK5RILx0lMipby
	z2Tw8tjvZSFgX5aLNQVQw1D3bPyk8BERcW5SzCVBBxaDUOFkG6dvlMLXHe6EmTv0Qen8EiawsKZ
	3fp+HRwdtyxJyJoSKgWJSvmO5nkeKyqEovhOrd2UIFuz/5ADzJI=
X-Received: by 2002:a05:7300:e9d6:20b0:369:d779:bcb8 with SMTP id 5a478bee46e88-36a42059aa6mr4854512eec.0.1793386377812;
        Fri, 30 Oct 2026 11:52:57 -0700 (PDT)
Received: from medusa.lab.kspace.sh ([208.88.152.253])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm10419574eec.15.2026.10.30.11.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:52:57 -0700 (PDT)
Date: Fri, 30 Oct 2026 11:52:56 -0700
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
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 02/18] nvmet/debugfs: Export controller CIU and CIRN
 via debugfs
Message-ID: <20261030185256.GB122209-mkhalfella@purestorage.com>
References: <20260920182936.2317916-1-mkhalfella@purestorage.com>
 <20260920182936.2317916-3-mkhalfella@purestorage.com>
 <179241127352.3544975.2554197788837860779.b4-reply@b4>
 <20261019190106.GK2931-mkhalfella@purestorage.com>
 <a3852ed1-4b6d-44e7-b4de-bc1c6a3b635b@flourine.local>
 <20261021183859.GY2931-mkhalfella@purestorage.com>
 <69bf549b-5b03-45ed-a18f-799c6e0efca4@flourine.local>
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
In-Reply-To: <69bf549b-5b03-45ed-a18f-799c6e0efca4@flourine.local>

On Fri 2026-10-30 11:30:00 +0100, Daniel Wagner wrote:
> On Wed, Oct 21, 2026 at 11:38:59AM -0700, Mohamed Khalfella wrote:
> > Good to know that nvme-cli now parses these fields. That is said, the
> > sysfs and debugfs attributes are useful to have. Say the controller is
> > stuck in a state that it can not process an identify command.
> 
> Fair enough. I didn't consider this, in this case having the values can
> be helpful. Please add this info to the commit message.

Added a paragraph to the commit message documenting that.
