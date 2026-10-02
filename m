Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E03C2D9797
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790953957; cv=none; b=r+AtnZcfdQ7yjDMqlmCEB9kBNrQjlHtpsTM+dTT6nrE6dRl5fionc8LU1ECnOwf4VToGcNm3B6Tqq7+D/rtYkNrgefhFttk3HXAAc4eF0Id1bUGCJrFoUf/Qq3++3aVjQ74TNrcftQ9bW1EpJiO7D/BwP9XsMBoADeMB7Bt7B+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790953957; c=relaxed/simple;
	bh=hC4EPjlPEt5WBToViIKxZXMD/KGTWdax5mCVx81HDwI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UOcG1/VReUq2UoVIMBpvsm3xN0ERqz0ooWuVa0abDCJf+LwKQ46NAEZtiBa5NQ244BKbyGxU7ajIvwPQPn6vYtHJ+E8+qPswMew0GsuMN18ZexND5CT7LWPQtJe0d7rNVUoJ0tXAJYWLig0EOn2h0+pcnHSkH93YFD3wrrPvgac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Y8DsSSGi; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Y8DsSSGi"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffbd83a92so121385e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:12:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790953953; x=1791558753; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GsOiqt9hI/nJ2zMyQzojs0Dnm1buX745VQ0o5+VWwvA=;
        b=Y8DsSSGiKfyk7k53iRKiwoxuh4Xh+2BMdttyoi6Yzk8IqHHFDiFccHIr3ZAwW7Fc3a
         sCtZxra7Ei2oRO23WD8d3rMebUrw16d5oZdF3nx5T5youhxfwQr11hD3I0ZmnTRHw/z0
         yHfLvrnPKNX5+uh1Nv08ATohfSGkNhkUhfxtp3tBWM2Z3VwO6C3eWyUkU3Bfb5dZ8D66
         G7So7SaoKRx3j1VT1YvnHrGrEUOZwzT6mvnJ+LUIGHXs83Pi8cwLuPTti4nLBEECuDOJ
         kRhmA3Mu6D7+0FHpYtV034B9p+Btl3aoKR6u9kE+p99YaJu9JJRkUEaCf4KhyGO2TH02
         C/Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790953953; x=1791558753;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GsOiqt9hI/nJ2zMyQzojs0Dnm1buX745VQ0o5+VWwvA=;
        b=wHxwAsYRhX223m8N2Gsj8WRzboB62NiNUJzx9T92crWYMVD29I0qiQhQ25Ar+/6I3x
         3DDr+DxN6Wcyl9PDnmAM9KBLtVTegLQCdBj7djYrpDBzPZcj45+vp+Ma+pckU4NO8W3C
         WXeLIjvqJ9iOF5zZF5x5803e05svreWYmB8YaZby0+CTnIW/XUAMNLkDuRscs0HMJU+q
         Riy7iqkotd8gJnvI07NnRBEeoMbgIbVCVsmeudF/LRG5zjs3QfxeqrZcSzJYXif5JWIB
         1lnjply1IVmKPZglkEB9M3MUNFWT4kW7vm9AHBVBT1yMHuVSrL9iJ6KYFUeU14ZSwMM9
         QXxw==
X-Forwarded-Encrypted: i=1; AKwUvBzoTlOGWiSgUPnUegb5nMPr7QgZvnKAkrgiuXI0b0OJLXQ66dZr7TQUi3LevezuR7bMV/tgZ1FjgleBGcU=@vger.kernel.org
X-Gm-Message-State: AFuF++muy19oFBB5lWraRhfbv83Az38VSI0EU5rJcKeT+T3yi7wgW+va
	emixUdBq7lvMX6h6MAsX75QnDdocxfD0Zo5n4Cr52dvvIp/AmFZYQdsys+Iv4nAJpen9oHVFq7b
	qWUfeUeA=
X-Gm-Gg: AYBFou1UFxv/fBlyj3Gor0TfEQTTLLrBhVPSXFcSUKdZgY6NYrBIsVo3p8UibQs7b/o
	jwGBlWr7JHs1o7U/yhkZo6f+uFWulo6tpDG+MZ9g2Mi/S2xkdgP/8iGotLX6yPBifOY9a9n/zhw
	yi6Bv/yfQ6S4JKQuaCIZq6WbloVD9LxOzbX5yN83Ik2ZMsCt5rfF+wV8MRpkXwz0yiUuTe0tKzc
	BGBbeymAJ6Pq3eu8i7OE93BRD7WW/2ML/eg4JZhoCkIOs1LB2cTIVv/dNIY9egTFH96xZvhPcQd
	Fm5QPqTZbqWJpcs45GWdY5JhTm0t1zJsXT1nyzUuneZ1fHxmugJpTMPZNIWL+0EUEa/qiQHb4/O
	rXgmmnhkmm0Xer3Ekw2ElFjbIvAGSfE7QbFGr7yGfk+gHCDOsAY5h22Eg3kvXXwOR/GgnajLOz1
	W187yWt+6aBeohOkg5LaNVaef8XijWRb5OWImdkZ+nGdI3Gd24lGlvxh5Ve+1UQavQlH7y8Rkk
X-Received: by 2002:a05:600c:474e:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-4a02759b67emr59520025e9.22.1790953953569;
        Fri, 02 Oct 2026 08:12:33 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03feed16bsm70162575e9.4.2026.10.02.08.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:12:33 -0700 (PDT)
Date: Fri, 2 Oct 2026 17:12:31 +0200
From: Petr Mladek <pmladek@suse.com>
To: David Engraf <david.engraf@sysgo.com>
Cc: tony.lindgren@linux.intel.com, rostedt@goodmis.org,
	john.ogness@linutronix.de, senozhatsky@chromium.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] printk: Remove console options before decoding the
 name
Message-ID: <ar_J31pBw8NlIClw@pathway.suse.cz>
References: <582e545e-52b3-4adf-9c93-446ad0fecc93@sysgo.com>
 <20260924070153.250783-2-david.engraf@sysgo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924070153.250783-2-david.engraf@sysgo.com>

On Thu 2026-09-24 10:00:57, David Engraf wrote:
> This fixes a regression when a console option includes ':'. Commit
> 7640f1a44eba ("printk: Add match_devname_and_update_preferred_console()")
> introduced console=DEVNAME:0.0 hardware style addressing by looking for a
> colon. If the colon is part of an option the name is handled as devname
> instead of ttyname.
> 
> Fix by handling the options first which will add a NULL terminator to the
> string and refactor idx handling to clean up the code (thanks to Petr
> Mladek).
> 
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

JFYI, the patch has been comitted into printk/linux.git,
branch for-7.4.

Note that I have updated the commit message as suggested by Tony, see
https://git.kernel.org/pub/scm/linux/kernel/git/printk/linux.git/commit/?id=b80fc54890d44cd35360ca122b72224fe78061bf

Best Regards,
Petr
