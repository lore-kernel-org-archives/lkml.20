Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793759583;
	b=X4MfnPUumS6MPcctnNKMK/fZenhoitHtKJdXPlNRvLGC3YjqQNBOXcbNl9zuPwdcb6dI
	 PsQv3FdR0sDnUmI3AzMjEp27clvzBYqR+na1NQ68X2Z9NSM4LaOeIT4Z60Iky/KhvI4fF
	 fpSJRcivzUaITilsYVZepx0HVDkkOONLwT1M7i++1OisyzJBP2m863kvDWCvzufT91eVe
	 e2E5KesL3cg9R7xUet5/D2zgMVM1XFd2hzkekrS9qw9OZC6Lw2iQZgg3nNdjOTJOtG4hY
	 ldK8k+IES7clJBlBHDmAXz8GVYhrNLbJ7hQLOy3F8zga5m3JgCuHsf50NkRTIhwEI/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793759583;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=m/fiQwvRsckBioNPagh+isR8nYC+OvCHr28EC1k2Icg=;
	b=AG5qdds3xl53FyKCZIErtl9CKk+S11NY2qlcfLuB73QM4tETEqXoOIVY6FdTDZtHA8v3
	 rjeExXk3IdvaD2zItsj8l660KemsdvM/KyiGmeqeGW/FnbJihU80ll4PjASC9cjIfnBKG
	 uV2kQMLC7213PIyg/nbAdHMluga7QrQB7yVDSI/UTKLN6BYxYB8oFWq0HnaVpVJSL4+DG
	 NoLg1m3zIufK6OdbqhPBMfm/wHgL25wdQOBQrrMe3mnHDIfWqggU3ZDHSQZJ46Cc/iG8e
	 901ZxmhqPO8UV1OJ27u0OD3soLr0MwYDb+oMzyu7kS4VTkSN/eTfvf+H6SSKGXg/9FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C71606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 02:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15C71606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4cc89e86e9eso343529b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 18:33:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793759582; x=1794364382;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=m/fiQwvRsckBioNPagh+isR8nYC+OvCHr28EC1k2Icg=;
        b=VMu8Z3X+9QkCdKWmlZ5YFJUQmkukXBAvkFIGnZVzSM4g7C9BMeg4qubn1vti2JB76l
         iP3kP4uEr7y8WJTWCf4Y1dAg8ykhxzZxCH3AwEBXKkQpGgp/J9gCPjxFGVX2E3VpdG4K
         XiVbFKqnbMvrTdZf2p2YNhbCjYFqSDi6M+qL/R7FBHY0btBCjPuVTfNG/GNnTwEVuv2I
         ES5cYYb2UFvenENok4R/a37nFcwHbEX5IBYx68ZsK+ob4h22F6SyfkTTxSALIktAmfC2
         H5E1IM+KB05h/qU+joYfijJoEcpv61j+bcgndSB7l5vjXpyIFEaoeLxMDU1QcVGbBqQr
         PAng==
X-Forwarded-Encrypted: i=1; AKwUvBypfeJoolOjH8TaLqHyQF3uQ3wAlDvjGUseXhPgSTyWU4cK3nRsPMREazM7/m6zdKMM93vTv8THv2OmQZU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8yMrHoBKMIpa4q2ILaKqwIMxPCvoFrMKGO0qlws+sIyjS39TIN
	N30nI/H5oAqPPYMgx/3Dtsr+CXa0kCZ1UNreP0M+KLegdqhrbRAguzF2aHeazmGsAA/cVLx1izm
	z+UvIRnh248G+fbEMUbdtyQiMs4FzKv9tw3IMHa7x9Ceuu38czjBEUVdftbU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5390:b0:53c:71bd:e937 with SMTP id
 5614622812f47-5640ddb2d34mr10697604b6e.10.1793759582174; Tue, 03 Nov 2026
 18:33:02 -0800 (PST)
Date: Tue, 03 Nov 2026 18:33:02 -0800
In-Reply-To: <20261104023115.3828365-1-fei.yu@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aea995e.bf891901.a11b2.0000.GAE@google.com>
Subject: Re: [syzbot] [dri?] [mm?] WARNING in drm_syncobj_array_find
From: syzbot <syzbot+95416f957d84e858b377@syzkaller.appspotmail.com>
To: fei.yu@intel.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 131



Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=94cb1a71158c9027
dashboard link: https://syzkaller.appspot.com/bug?extid=95416f957d84e858b377
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=169ff4dd580000

