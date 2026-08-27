Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CB127CCE0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803378; cv=none; b=EIYTZCugs9qDPwja1Zot+kWyLWOesQsb+OekpkGVMorKC90fnCVnIc00+6jeSOkNp/NGFshkrNeLIoz6pzpJazYjSQJNkN22eKa1l4V+p+t08Wvgm8G8oDhIZ7hYRmuw8sp7+QNow6Kjg/QZiubG5Xl8f/Muv07mbib+l6KEqsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803378; c=relaxed/simple;
	bh=eXd83mU0DRhOPBcUnx/U3XfjG0BwFyxeO8U4P/40eOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BaYoHrvyGuLOAjuuXOD7klF40XMfoT2hwvNsyEAPZDo7XA0hyC0+8wynW3xSNPftST0JtY6bhs8xF0A65d4mkmNKcwBzKRW64fZR55MeXOiyKI1f7ggQBA7MLysGfHQCeN82Gj35fo4zQ90VUqZsq0kReXGh/4mdaH6gmH/uvIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LYZczxJx; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LYZczxJx"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493b966dd74so8112055e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787803374; x=1788408174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eXd83mU0DRhOPBcUnx/U3XfjG0BwFyxeO8U4P/40eOI=;
        b=LYZczxJxUUGY9C85zTs21q2apnvBUeMhcq2x3s1BlL66bB7oa+DdPeLyXxmadQdPdZ
         UmU8Gq9xBUhXuZjgzuzGrOv+Tk5VvUl4nBrlUfbdaKcoA/uXt3zJ8jI+AcVoulmkGnxA
         QykogpSb4q+O+o8gkErbrOJHF2OchH3Cv7BhZDr9TeBcAoPKptLaLkfuH0YPOjfXtPhR
         0FOelpjl8iFOFBOse1DGP2nMwi3ZNV0bMMQb44VgFFXMWB5xgZS9LE9GG3aB+zkBclyS
         9nw9AO7A+hZcS2NTDE/XFR+2blDKo/ifVw0oL1GQo7Dql8UcpgWjfAEgrSpeoM+FEaLn
         /TyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803374; x=1788408174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eXd83mU0DRhOPBcUnx/U3XfjG0BwFyxeO8U4P/40eOI=;
        b=VVsjVJUllHTI29MWvVzvQdQLVsj5eiK4ZLkFt9uEhrMhLVPFBc6EGgPjM+a9aYOD6l
         SUDIW49jjz/q5VZXgORaZhqEGU3HogGc17MiA3v/A8yUeLuprvtzHYSsqniLh63DzQ15
         E2scpIGFFvaK/1rdWqKHGXBuut3PiEziAU6Y7Lldy54dnjLlXfg89hq4IAkUX90/0MbG
         H/tMIchNkrHbByXNn5mnu821oviHEgZTBB4S6qXFF8DBKfF0dIqbb+jjPNEcMOjTFQU7
         UDRlKwGIYyciOIo4Cjk7rKBk0y3TYcDMjrxVXwUmK0373Aafw++8F5oAzXKY0YWSCPIu
         EFoA==
X-Forwarded-Encrypted: i=1; AHgh+RqiE75WE7qR1rbP+2A5wlhUTk6tTOGyc1CDFEYMWkxFu6NdUzCeOxA9j8ic204DH+T8xgwPrKyD9RiOTXs=@vger.kernel.org
X-Gm-Message-State: AFuF++nFo/UKADuFNwdGV4Cv7lP6CroTLY8juZ1h51P++XDLxhy0NakQ
	TJsqTHz530LyFxj+jNeym+uUeJroUqPrv3kwbhtEiIJ3WYrIIPk07Pam
X-Gm-Gg: AR+sD12WfvXWivYccAVLCNhYybwGTnenJ/wCU2FwCFWCLOTAe8s0hDclboMgwotjzvX
	KgJqIP4qmDsT1NlX5BGzgb1NfEhrBW28l6PKfH74SWkByZoc8Z0bYo0/get5Oyr+BEa8odV5RST
	RoN6888zr2mXwZ7Q07+WvF1NcEo5q2Jva27qo2X4p2WYM4ihdOSsO6SiDcDhnWwk+aIhklftSW9
	xOgByhs+8hOzvST0BDvxQX1bIdqLqt4Mk5npmGsCMGq5OTdXQyggoSoeACfDFdiKkK1h5QUGiSK
	Ztv3U/sSX418WLi2uAAeb6m3ejEdIKVfA0bi7q4LQ3VttHNcRPJ6M8oOmuKbD04ubGXNhjrZ5ic
	G34ac9pUJJjUYFRHacSJHhFTWtk855MDgVITMZCrlhu4WvFKUiwxbmZ77P775cdRRiNh+0gUXjt
	HvWXrfTFOA9MVv24v7k1eXU0JmSD654dOuFUYkr89eWgLIdD/lR3mC8zALgh6EZMwXTYANwBo8P
	CKixwV1tAfmiFcgUlFPwz7/Muph1XxXi342wrUM8XgjUNbjz02JUa0bH8NBI+dQYJUABjJbmSMj
	2XFeriZrh8MwlTLgLs+fmO02UZ6dIbBGMw==
X-Received: by 2002:a05:600c:3112:b0:499:db6e:40a5 with SMTP id 5b1f17b1804b1-499dc6fba17mr110628085e9.4.1787803374232;
        Wed, 26 Aug 2026 21:02:54 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-154-097.95.114.pool.telefonica.de. [95.114.154.97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499dd5721a0sm43485315e9.4.2026.08.26.21.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 21:02:53 -0700 (PDT)
Date: Thu, 27 Aug 2026 06:02:22 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Miklos Szeredi <miklos@szeredi.hu>, fuse-devel@lists.linux.dev
Cc: Joanne Koong <joannelkoong@gmail.com>, 
	Jingbo Xu <jefflexu@linux.alibaba.com>, "Darrick J. Wong" <djwong@kernel.org>, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] fuse: fix GCC 8 build with CONFIG_PROFILE_ALL_BRANCHES
Message-ID: <ao-2iab_bHH5ZFlU@gmail.com>
References: <20260811195733.38489-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811195733.38489-1-kmehltretter@gmail.com>

On Tue, Aug 11, 2026 at 09:57:33PM +0100, Karl Mehltretter wrote:
> Fixes: 25307ca50b815 ("fuse: simplify logic in fuse_notify_store() and fuse_retrieve()")
> Cc: stable@vger.kernel.org # v7.1
> Assisted-by: Codex:gpt-5.6-sol
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>

Just a friendly ping in case this got missed.

Thanks,
Karl
