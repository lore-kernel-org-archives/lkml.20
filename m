Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794686759;
	b=OK+oleFno339msLJBOmCwyJ4ZDUxc9xCbtYJhgU9OxaYqLnNMtS0FDtyVqznZPTnBfIW
	 y/theT0+dAsK71R0w/rtFE3ZrBCahU3ZiNRcdwwuEkQazi4CgG7rkImIlm/dEe98FCFe7
	 3kW60nMHaoCuG5zFGB+SRWEUfgvUAxHDpiI/yyZrb0IUM4YNEKy5a6ot2sX/OMsUNvYDH
	 CHsy2B+7kt02eTc+2B6MdolmREyLV3WwphenAeD8nrMKnw0+FuBbHprTj+yoQoQeST9eo
	 XIL+ybtMjmGFd+mfKPzMXjx0ilQGO7YN8/+D2KnEB33lI70ZPPbtYEv8erZZ63zxcXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794686759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
	b=H3NPO5zFMaBOPCjnyEvoO67WIoq9eISnjYzRzKQmUknQoAfMZ16N9KCh0HejWjQj6mzZ
	 x3HBzO1UXxJVlqe3mZ3mw88zmc8TUJuErpfA4G+B+aA70BlBRXwd9KgimmR4yASlX/if5
	 NnqckNGNafPbOe2AhcFnFuZHuNsUXIBF7STPaCQDLFTfFLHQhXbzIyku0SmqruHuwZLq2
	 SURNuR+YX4Bh4e+rhOGQb3tFfMagDpl+PO/P4ikkwHkY1xAb+ZWSPbD+SzXhuEmpOPQAo
	 LFFRfJEfPTC5Npk+qPXq0sKQq99FXPv5yazFh07hqp0F+8sr+h0snDO+wwNuJQoFZDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP;
	arc=none smtp.remote-ip=209.85.216.43
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A84D606A8B9
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 20:05:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2A84D606A8B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=t4xxtvlP
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso1127818a91.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794686758; x=1795291558; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=t4xxtvlP4RAICjpBIWPIkESb6EJJVOcRd9+LEytv251d1ZQsfD2pYblwETMOf/zroc
         BDzAo5elUgpAiRA0oYEfExHYSjjGywxztBxThvGs665InMbo4S8LytfXKr2B4Cw2IX6x
         hCl30XcWjOl3zGKKK0Vny1KN9lt2zjyLiPz3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794686758; x=1795291558;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cEK0v6G1yB2cz/8630PKsjvi8Z78P9QyctaIU0ylRW4=;
        b=Hb5Xt9RcWGbzy5ZmGLO/VzitpNadJ28aN5t87DI0ftmdT+zt8GTxADf4Jnx9vOphUy
         w8iLHrVDOdl+GTjOUwSLfHBZVYnAXh1KYbdt6y0flXSg+67AOIgxvNk240PyEsj9yUZU
         w9IWYdZM0Veq+lgw2Z8CKyQK9dX+MzhUZGh+dsY34p0BjpjPxrBSOjW4XTZ2AOgEr3W8
         jASV9ABSotri3tWHUpQNNOIRuwGQqQqI22JR3TKcMEsUUuEYvIcEbSLtUB+d6TLGGUot
         VQa2vcMpI/4uia932F4muXaexwKvbyihTRYxDkiE19B+64t0w6A8zdCVQPtX0m304QHJ
         ag7A==
X-Forwarded-Encrypted: i=1; AL+hErGI+udbv1cT7AJ2zaffOhz6arpdWjgbwfAYep4zqY4UP8/udqQirl9Kjl3xUUPvMuyae63A0WIG7DF9ErE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+vk3aMUU8oRzbIZuqEcI25AdKp7dx0wq6Dx1FntgFhUVQIq0Cb
	q2JFTva3uBNbYTAt9zWhfDKUPi5KvyeYLYboZxKuZcN2G5XHJKleiztzN2z06u0iUZg=
X-Gm-Gg: AYBFou1R437H9altpkd5/ihL+PwMX5G9MrKIYePgRRCvAJ9yUR5XcAZEofSrA5s163H
	s0ZkANsosSnymxhbRP0E3A6EO0YyBtZTcrDXFUAW83miqsPSQHN9qSlTDMHi7sonWy/q4A4xMPM
	nSmznCNZhr/ot0eUXc2tlo9m3FYpCNc/uRjWKrN7y7XUOn1Ff9KuagTC0quRlyZq9wNMR1hpXDm
	xU5lggxxREDqJ2/o+QYaOXkfnyjue4zHoN4SbOUtEBYOl/brjmaWNzBOlUfhfu/e6l/lyS0Hq7f
	wPzLDXmCmGSOj2Ak4333dynTGOVNrR30PUgUDCTUMO2eKm7TkJXdlz9PXxyzL/MX+KFAqHpUlFa
	+OFwE5hkOp766IGZq45d9mBFmdl/Y+ftvtt/5y5bwZhBSuQeF3b9GyS9v3v5WXa3Ow/S09DGIp2
	rKqefQ60kXgr+LVVd9tGv0/Po4HspoPAk2VQs7sxprBhVNLKAdF5fkqXtPrhwDNAN5s75xGaJ3X
	sXenyWzmxoxDeisVGGjUIM4uGPJJzj5HBI4mNkV4Bi48spsHg+HLb739nZ3zI8b31YTCV4y2W3v
	mJfNkWJj0Rw5zwO11YSrGb2laYF3+xXrsvpgnb39HGlKgAt2Jj+yDo5tRXTBmkZ6hASSIA5NiMM
	9AH3AG4DSMwb/b3AHJYTK1aLHFYt8e9HGL+nj0nAHTDMmviO98PAQd0YZa6m45NM6OzdX6MouyG
	EZ/9YGmD5hcfUbQzNhacbzQnN0DbU+eKFHS89VP0etnSKx0ONv/1o/Uw/K
X-Received: by 2002:a17:90b:3b8a:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b1b0b5f2c1mr6192503a91.52.1794686758572;
        Sat, 14 Nov 2026 12:05:58 -0800 (PST)
Received: from [172.22.0.2] ([64.16.22.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b266d873sm4654869a91.1.2026.11.14.12.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 12:05:57 -0800 (PST)
Date: Sat, 14 Nov 2026 12:05:55 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>,
	Chris Mason <mason@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
	Christoph Hellwig <hch@lst.de>, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	linux-scsi@vger.kernel.org, target-devel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-mm@kvack.org, bpf@vger.kernel.org,
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org,
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	fuse-devel@lists.linux.dev, linux-efi@vger.kernel.org,
	xen-devel@lists.xenproject.org, ocfs2-devel@lists.linux.dev,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-usb@vger.kernel.org, Amir Goldstein <amir73il@gmail.com>,
	linux-erofs@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	Alexander Mikhalitsyn <alex@amutable.com>
Subject: Re: [PATCH RFC v2 17/42] securityfs: use fc_init_pseudo()
In-Reply-To: <20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
References: <20261114-work-loop-pseudo-v2-0-98639a2286fb@kernel.org>
	<20261114-work-loop-pseudo-v2-17-98639a2286fb@kernel.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114120555.cbfaf8ab8a92fb25@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Christian Brauner writes:
>AppArmor puts a .null device node into securityfs but only ever opens
>it via dentry_open() which doesn't care about SB_I_NODEV.

Not a big deal, but userspace can see that node too, as
/sys/kernel/security/apparmor/.null. Opening it by path works in current
kernels and fails with EACCES after this patch. Now, I don't know of
anything that does that, but selinuxfs gets SB_I_NODEV cleared again in
the next patch for the same kind of node, so I think we should do the
same thing here. If not, it would be good to have a line in the
changelog saying that opening it by path is meant to stop working.

Once that's fixed, please feel free to add:

Reviewed-by: Chris Down <chris@chrisdown.name>
