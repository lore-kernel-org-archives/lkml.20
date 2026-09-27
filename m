Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001C23101B6
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790495405; cv=none; b=qPnR1Be0FuqoASs4C5372P45AjWy0GuJWi11Bex9EW0nrL8hOiSbP2o4w2SHYDFvIbTv0s9VaMx/ZQKYBFEDkZxZL+zXFTL84t1P9d5dhkClHJKQ5D02h/hxmd+pU8lbNpIP8044un70rdJEkHdRb/hBmcFNatR6ikPYiqyceSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790495405; c=relaxed/simple;
	bh=MjheHG2ZPVtU7pbRctnGkpXFX0Twh1nIRjTFrpGW26c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JVki6JmWVmv0UaUbt+sds+FmAqN/FIjz03YrosJEbvDnMKHkZFShLokXyCk1nWoezHW9SY7QPSc6QS5zy3qQUA2h6vkiNVt9z0iMpEHZQgsfbrG09V6UClvr7q9Onc+Wrovjf6LHii1fsg0HJYq+smQCgZSNJlUhgSJKONJRQT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8076c66efc6so3579358a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 00:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790495403; x=1791100203;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=707h2dOKet9Xzu5ZNoTuhg7nlxwDzTukl3D9vbYvzfc=;
        b=ry/LjwovDp9Ux2oBE0YL6PmoJqZJ47CIDp4UUR0H9DzofeAn6j+mH2SASWD8L8D/BZ
         5ywjXfhGQ27pmXknCljT6rKmeZlaLi36tCkzmct+Jaze7gNRcGKxaiN7dYx5ZQGeisc0
         L4/cmcY+yYOceLVKz4IwyG2Pjt/rV8cfZm4yIrh8RpZnCszwsqUFTFPW599+g4Fdx09B
         xDfsrjRimelCdIzwT1i+/b9fxzxZVBMhtVUVWLY1oI9nFD4e257Tzk0nEBXsPj1n4mlP
         qAyLJd91v1qu7UFWGot/CfpToxGvmWwKEWr7HoGCOAJOfIHv9V2X+z1f2C3f6WfGTQkf
         0J3Q==
X-Forwarded-Encrypted: i=1; AKwUvByj6QrF+C5RxWNkzWnZIlZFZ3gm/mFvp1GMm6OkTft1nC97vkwUcu+wxlNbgtFPDfpHVRjKbTQy2vSd88g=@vger.kernel.org
X-Gm-Message-State: AFuF++nQB8Gcc+GAWldkVakddL4ZEFQfak3KyIE/hbt1wC14PhmkCERs
	xk8Gm4R1qdt3Ry47Easf+3g6RECqzIx9K0F1JSHYn2wxqLm44k9PYx7z6E8aT4HeaB/q2/9SSFX
	ppqeAbMnsqbch3nDco6icAW6+X8sVWjOnhTlOc7QvalI1VQ9qYvEhYWWp7rs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1706:b0:4d6:93c3:1af0 with SMTP id
 5614622812f47-4d72b845689mr11247450b6e.59.1790495403073; Sun, 27 Sep 2026
 00:50:03 -0700 (PDT)
Date: Sun, 27 Sep 2026 00:50:03 -0700
In-Reply-To: <arjJwc6yl3RkOTRK@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab8caab.e548f532.1ca396.0038.GAE@google.com>
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_destroy_all_connections
 (2)
From: syzbot <syzbot+89001660f14fb7684c83@syzkaller.appspotmail.com>
To: azpijr@gmail.com, davem@davemloft.net, dhowells@redhat.com, 
	edumazet@google.com, horms@kernel.org, kuba@kernel.org, 
	linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org, 
	marc.dionne@auristor.com, netdev@vger.kernel.org, pabeni@redhat.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 25



Tested on:

commit:         a7bfaba4 ipv6: fix prefix route expiry in modify_prefi..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=89001660f14fb7684c83
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17705315580000

