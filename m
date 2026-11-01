Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793534154;
	b=vBtLbsXaUdU2bSghVFQLYrylcp4lH8Dei8DBABOfWbE75QEqH6viLAEpMn353HXqYW37
	 AfRAVwRzDeuRrBWuPair1tSK3BiGDlwKYmyaCQodozxUmmtwJ6PELM+ZxyJrvC23Sa4/g
	 zfRNrkodYKVMfIhBaNGMGzt3LKFXGPJUtTTps0xFHW2MjfrZ/BDvXJwgQ1OYxnbr9o7oA
	 hJfqtZ3Qd/NINd1ETsdeK02dX1v+GPCkE/rmCCH3HGG1dFHokl86JQIM8ribrGZxNvoV9
	 nwgGFUJfNhBS7Qbmk4iAJpdGEEVGOjns6UCZaNsfr1kSAkG2/k7MnkymWASQGPP2DLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793534154;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
	b=Z/+Gmqn8x5hpy/7pNjOAsDdwRvQYQ7CKIhZMJ42UYorJwPKnHFBExWeibANyGyRV+KXY
	 PEB2Ny3fKn0eZlS4c10yjElBM3RqAKXL2kx/46KEPfH7BnH47VLV6L+4lQ1IdHWypY5hp
	 Rjjvzqjl21anONXOzsK7E2kr6Hy9BHi0+n6FEhLABKFrjGZSwI2vNtGJWIILa8KKMaH/M
	 CQetQajlLZTxQA8ZAwZaYUGPBqNJcaoPkdjnp4nPr5yrFuJXZlZ7Pi26wenCpMyDrfHGY
	 obZZLhe88paKDoSZw92hS81p/uXuOE2CRdv9UD0O2sfbn/xtN+tF9DD+JXtHMUmoz8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02773606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:55:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02773606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4eb0b989f0eso3210671b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 03:55:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793534153; x=1794138953;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
        b=EnlFks+Bs4UY5pi9aMcf9WtX+n1fvTam14Wvg1oUjSHBF5mXvQz1aY87KQSgjFYVIn
         n7MvncA5+B+ORkw6cgq+2JNlkHoJtWak8gAj+rMYWVFEgIQD5049s8eu229akHMfW+hJ
         O8jMrnA83wkuJhpJAdOYKoZycul8Jame9B0l4DSq/GECxcHSlWffex7mFnvhvIcDL+cp
         nHYrlqlU254IFvI3CWpEdlPfVba9hFkJ16N+Zo1tFNLFd4DArar3Jkk50k7crHr6CzlG
         3u1tLqtTZwWXn67ZFBmPUam+njZ6JW4rYwYC8HAJk+rjsbt/mVsq8cczYkH0phD/AkAX
         12nA==
X-Forwarded-Encrypted: i=1; AKwUvBx3Wopf9fV+s9pS5cNn+ie1ads7t4izt+bxfo34hbf+Y2X2k6OnTJeQ8xRMU+asMBp0t9BMdCbQRQ2BRz4=@vger.kernel.org
X-Gm-Message-State: AFq9FYLKmEhN154Qql6smmeFCFWpwuawThrjFGCz1zD0YkTiPX4EvXeQ
	7keuumCbBB7pA9oM0VTGUcK5Muxeb3ULf9sdxVVhMscea2eonq8FCtMFH6A1G0/lKE/LSGeCrpH
	SCpYZaHkrSjzVGYInmqosgY5sdT0KmoW3s6dm32AFtu2cDaJ7/xW184gZGaU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bd6:b0:52b:d800:e1cc with SMTP id
 5614622812f47-563efb37b20mr4939933b6e.30.1793534152985; Sun, 01 Nov 2026
 03:55:52 -0800 (PST)
Date: Sun, 01 Nov 2026 03:55:52 -0800
In-Reply-To: <CAGUpAY=3_5hBauecT8Lgo+CTRnxzUxm3iBE9mkU=YotnaG87iQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae728c8.7fe51036.1ecf7.0022.GAE@google.com>
Subject: Re: kernel BUG in sysfs_break_active_protection
From: syzbot <syzbot+dcad997ed2b5bd95cc5e@syzkaller.appspotmail.com>
To: sajal2005gupta@gmail.com
Cc: sajal2005gupta@gmail.com, syzkaller-bugs@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

