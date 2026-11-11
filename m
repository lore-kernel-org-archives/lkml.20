Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411740;
	b=KClaDRPp3n8mod9yrsh0cgx7imh9cr/5m240+OE7DFMmlzTehpwXGTluSFScc1kxJC+z
	 gFM2FrWk0ZUqb4KL6eEii7V5dUL1l/JfWiy1h2VK+OyHSbenPxesKK9cDvHjnJDmjbIxH
	 FG/M2BBhWMrzlGRBlWsgnpif5fuSfqCS5LeBlfhfsatwNjIoPkXdlwDGx9PhizY8EzaSL
	 wiHP9CSpuKaCgEEix26Pz8UU3+EJgtku85QXyOxCoweK6szHJpb5dhKfHvzmIQATv0PIs
	 EFfYTZyus1tCqYfjcAtHBY+Mb0ecLd5n68gPquKS9aEEbcUUN7RoZ5wOZSgjIt+vLTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411740;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=55523svmexvSY7ISojcfJAbEFh3XScXusXNa0tYPa+4=;
	b=S+px8V4JHxfCpQ3t2m7/ryHIiSSP2vdFHtR3zbB0EKP17EQgejDC3ODnVZ5+kjB/yQ3s
	 gXcdnD+bMPDinQNvH/MoaxtpXtQg7TRkeaCvxVgKm9V8GsuNmrWzruEG0q9FSgSile/sb
	 VDcLQnZ3UZT6RXtd47+B8BrxY4e+TFs34KApblIu8jXaEpXXoqsAgFnfLOuMYIrcmYDSd
	 6zbb7O/OMEvYpPTtK+t7T9p6V483sDPrHOpi9S1AsKY8meCBAd51lBazXatQBjMo1A45V
	 8QtVR0IUbV4iu15JblKM7h5EfiCqym+JSH+WOC+oenQDYM9cltTbjTNRgVOfanMdtlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC667606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 15:42:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC667606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4dc57e2a3f2so4586541b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:42:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411739; x=1795016539;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=55523svmexvSY7ISojcfJAbEFh3XScXusXNa0tYPa+4=;
        b=Uq4eDpZlEynLeejvPkGC0bGK8lJc8VS/CH9gxlp9POJrqySTl/KMznXRQWkOG8nGYs
         d/JAzSuJ8CJxxTLUkL+l3zy8CFKtHd2t70LXpZbb4IBZl5zJLJfA1Bao4k2RuEDB2Xvw
         ebUiz6z6Pi1r9XdsY9nnlxKU/04r7HTsgyhFF1glKz/3Agv36gPdm6hRKJbSOg/upvHz
         6/hLh6PFiMFsA6hnBChSfipTrLUGMDyIFEnf4RlnYNlDD1YiErA0PyOEcXNtCGW/wqTZ
         QxwemJ8ibEOyXUhRMKE/PCza4hlRXgX3Gsp0hJu7Nxu/8dTb3TmBb7fbKp8BtyztN8pU
         U/Qw==
X-Forwarded-Encrypted: i=1; AL+hErENbGAl0ZnebNgZJXFJ0mMRZqGp5yXgignB6h/Yk+F4gkUEzSJrS6x69UgQXNp90UV+vTOdLBJfbX+an+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/dlXX3NFL4Q5BeRHawmmNnpOdGAdnuyydsB2Wk/xg/ryfrleeY
	NgdOQOtUYvTmUafZDZN6okGGwwPELzwKb9U3awF3udPUYUzpEYCHcojotOD+ggdZFZE1EuQQM1T
	LxThuRYrb2ZFg74LlV4Z4+QBjUTUJdt1g662yyyQiQt8/+LAM80vrRjuA9aY=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5390:b0:56a:bf02:e4aa with SMTP id
 5614622812f47-56b962afbd2mr1832944b6e.23.1794411738752; Wed, 11 Nov 2026
 07:42:18 -0800 (PST)
Date: Wed, 11 Nov 2026 07:42:18 -0800
In-Reply-To: <CAL7=yXUUqtzewFAhvwb5bBxZLGh4MaC18HnL5ie6Tc=u5YsNcw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af48cda.c8b90550.1efb23.0002.GAE@google.com>
Subject: Re: [syzbot] [usb?] [input?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gcloudvrptester@gmail.com
Cc: gcloudvrptester@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test:

Patch testing via #syz test is temporarily disabled.
See https://github.com/google/syzkaller/issues/8122 for details.

> https://storage.googleapis.com/vrp-syzbot-owned-fixture-811055272945-1108/bare-repo-gke-host-788b3a4c
> b61851517d657b9231da00ffa062407f5fbbc62f
