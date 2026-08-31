Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1603E4C75
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170606; cv=none; b=Unmg6NmaOUQ5yvZks77ZWsssRFz4NF4x67MVxOFqaX9325CLRwmPDWzwrwUAasZv2HxyYIiLCaotVpLRYXEPs7b0SAmaQNJu7Z3KLUuM2oupVKNn/KcGZfLwFQIA9n2mEFPfCglZcgJqRdD0G+/Gd7SGFko0LOMS/FwRzj97sK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170606; c=relaxed/simple;
	bh=HJUjgjLKUltqJLaAP/yQhI3qZzDW+UMFeZDrgrwXyfw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=agguLnH5dX1IKCof60f451TuDyaPKg8krb5l9BVKe20eXzwPS6QspIsLu53bCYeOIGkIQr+YQiE1B+sBjh+Ys+1h16Hy0yecw0n6bkb7J44VTpDLllOMX4OIiRF1lokoyTV0FoaJvrMXmtlprBWJ/zaB2YV/O3HOlQ62ZcTrjnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4959c49e054so2495631b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:03:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170603; x=1788775403;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UG5M/MVKJaGzFJC9XpM6F86kond21uIR+mxWTgAcwIs=;
        b=D0WvVv7pAeR0/L6xDjOvLpLNYGyVdQzsqSIsX3BkQfer/4cOeS+vSmOoL2bRYKWZaq
         ruFgHtx/hArPa2JjsNNF0caZbfIqeL1FcRa3JhyRW4P4vfOkUKSqnlbUlQGsDw2Wj0dA
         9ZnlbnrJTT766YQ3p6iuzHezAtP890z6RQv3Ebcj88w9qfkTbweV824Eg9XT9tKsDRoc
         zpmaVfmyQgsREbeKX5EypE5vkXpHmjrAG1ugnMMfn7T/Lk9ohpWL9bw1Guhbu0PCtHFr
         y6+Iyfi2vmVZ/m+iPdy3UVfOrUjCb6Q3vKckehlW8Ed9KJ2UqMY7RtPK9fUDzzWR6P+8
         bFKg==
X-Gm-Message-State: AFuF++kk0q4BKbFNOdoSmf7imsEwa3quHhwEgqB3bMnh/1zQCcFY+9aL
	Iz//tZaFUCsaTs950toANgicixP24yDNTLeVCLCEsI3lLRdRQzny+enVKcOTzA0rx3MKOwDfZ9A
	aZkgqrIEaG825lPUlfydcZ70zPoKKQNeHWlVb8ibtyKoSXP6mbBr56lHv5+U=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:f0b:b0:4ab:318c:6b38 with SMTP id
 5614622812f47-4b397f71712mr25359688b6e.1.1788170603731; Mon, 31 Aug 2026
 03:03:23 -0700 (PDT)
Date: Mon, 31 Aug 2026 03:03:23 -0700
In-Reply-To: <6a8edc9c.4d659fcc.734b4.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a95516b.a8e469d2.cbf3.5616.GAE@google.com>
Subject: Forwarded: 
From: syzbot <syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: joshua.crofts1@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/ master
