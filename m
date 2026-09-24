Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3377446AEF2
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:09:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790244587; cv=none; b=etNT/UKOW2sNMIxofOFMFaduDAxrA9gO3CvrormyDeEjg6P4Pl6KWH7d4/QDx8CopSTyxdZSvLb6wAmPRG1D5peeAYL4D2QzDJljAleoOUy9ooM+pfYVzl/Qh7VA2gqLDIWRfw5Pzry7S44FdhETlxTdvqKnVjlk4PpOyQuf0aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790244587; c=relaxed/simple;
	bh=jILoZbJ+my7bWI2B+7FewLVJxay0NSGO5ePWDhd1TUo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jiAkI07g+PtHrjC30Zpjn3+cMSD4KvZkNcNJM9IOPvuBXsx46Gr+6l2ZLrDCWws3ZawRHjGkkiYrvDBu0BmloZXMCBxL1GH9ObkmqxlSwo81RJOtvVC+ZayE54F8aP3opl1YltoHbyuxJDFLdfADyA8XJ4X8WHaxgQgWEE2MUC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hLU3PI0U; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hLU3PI0U"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-39b910bdf2eso982898a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790244568; x=1790849368; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xbp5TiM82eBTMnFo2jw9yYRLjU2bFsj3L5CkfeZk11g=;
        b=hLU3PI0UZx/UePX/X8ApS2mzKuRxbMnuRfaeVoQCnIp7I7igkUCVFhN/uee02EQrF0
         vA5zKmHqKn7f7ObhV33kYpeaYoG514EeaSH1NoDtnALX55hVPGPE3CNEWTwSrZ5kMMPi
         5B0En1IUJEYPn0Nxi90eC54n74ijMJuI6IiH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790244568; x=1790849368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xbp5TiM82eBTMnFo2jw9yYRLjU2bFsj3L5CkfeZk11g=;
        b=i0yA31I6SBvx6f2i67YcBLxyLDy6GKh2I1/rDO2Qq5Bu3iXbc3WRIt4qlyOma6Jw94
         g2Q+hLBtKrTav+hOS31tMTG7Esu/1GXtubq2gM6lp0jSbNCDIW+rXdy3kQfMlF/7ijDw
         jVI6boUCP7EKq4cBMyfse5yw/TnPljcG7Sfg68+L6J544cEJM944vEZXIGclK1+eQsus
         dreO7LWsUEnaLvhwc9d2tFYaAqw6yPP+7p7TKuvZZOpQjirFKNoovAdLRhGfaeSQaCjq
         kBDuViDk1iLmoIgbxsH4H36gB9HKScOaXcrwpkJPKN9gBRkOtsvNmzm5EM/W1vXK0RIG
         tF9w==
X-Forwarded-Encrypted: i=1; AKwUvByU3MLyKmE1WCUWZnGbvb9qMp1+WRsKl/l/iI/2KzOtkqN7VIBzat1oy26EFL0H5/oZaVID9a2DtkZaIRo=@vger.kernel.org
X-Gm-Message-State: AFuF++mVHcV+uSn6ah99LW64vRtdqB3qcwCsc/IQu/7D63GnN8bH69oP
	T29VYEPOSF1dO/MF+p/cNmNLFlp5m2S2gcZp45w+imnPawhx7CdgPxHrvTp71HOQlg==
X-Gm-Gg: AYBFou0T/7SkCgIPwxz3+kGCTRJdPsVdLbXkpkyx0iLf1Oe+RZLH4t4s3r3letV+nqa
	NHrTXmcM750MvLFWVK1+vZmMQy1tZsVaSGjd6DT3gxtRvuhXFd/n7+E0PvsTiuXHVW3d7rcyKV1
	g16tpAgWTZzeY8hC5aQMKK/XIvTdAe+Cv/LAnyzNd1vvhtte6Dz/aZDlgYKyVwJx5hac1zW0yPd
	UY1aGCbdlqsf0DpGpClSlQedBDF76dT7eGVnrDaRioeCOGTSKo+FHoVNc2AYROsj5gDliJlgVHP
	tl+AR01m6KSPH5l3EVbV6ZLc+llpTM7RhB81pP7HWypNOhlHzaGb2HmVtOHkLGEo6Alqrivsj5r
	cGzpU0nXQyRLd3peSKqllijH6/4FN9Qxg7aEIkz989XSNDvYQMGDT5YIBwAZGgVzzKK3fNDU3Ho
	Mw7UKO0BncGdAw5yKeDyqTkNAZMOKVoGd+Gz0AMYsFLM0A59/UFQ+u4tdM89ee9e5GNV5lEq+ls
	PuvvkKvk8TciVyFSo6UB4CAYJhPTjhpWVefoA==
X-Received: by 2002:a17:90a:e50:b0:3a0:9aa4:f9fd with SMTP id 98e67ed59e1d1-3a09aa51430mr1029898a91.12.1790244563742;
        Thu, 24 Sep 2026 03:09:23 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:564:f2fc:acc1:e4c8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a082872cfasm3159170a91.2.2026.09.24.03.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:09:23 -0700 (PDT)
Date: Thu, 24 Sep 2026 19:09:19 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: syzbot <syzbot+fb23651a7efbea8868ed@syzkaller.appspotmail.com>
Cc: axboe@kernel.dk, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, minchan@kernel.org, senozhatsky@chromium.org, 
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [block?] WARNING: zero-size vmalloc in disksize_store
Message-ID: <arT1HxFd0q8Kdz47@google.com>
References: <6ab152fc.71f81b7d.15fa6d.0031.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6ab152fc.71f81b7d.15fa6d.0031.GAE@google.com>

On (26/09/21 08:53), syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    73ae59e97596 Merge tag 'erofs-for-7.3-rc1-2' of git://git...
> git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
> console output: https://syzkaller.appspot.com/x/log.txt?x=11d5d525580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=c35e49327a11721f
> dashboard link: https://syzkaller.appspot.com/bug?extid=fb23651a7efbea8868ed
> compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=175514c9580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=123b1005580000

#syz fix: zram: switch to unsigned long indexing
