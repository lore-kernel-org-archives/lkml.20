Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793952244;
	b=YhnoHyf5ovpOFW5hNms6405wGulQunl/2HRCTfPE3/Aa5+u6KjSVMNseu7p5i+AH0EXV
	 JgG53jFMqCdMpjWxinv7uy1bN4eUXJwNMMpDL2R7u0DpmbWZ0uQWz20wxrV3DJOczUSF+
	 HSaMDqMTbQCBEADwQbaJu8zZX9/sjGw4LFAG4ogGXR0QZja7RxQjW0Cb0xahOt/MlXchQ
	 UOXWrmKePbnQkN866TiObInrAEEr2DEa3zVfuVoE9jTepnkvUECD2sN2EC9bkG786iCWA
	 PLoHG8kGaGfNSoUVHxIBcE3mAVB44xlOFFrZ+0yM/9JDPN1ptThzlWONEliOmFHNl7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793952244;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=fYCgRQYSjg14gcNXBhIdgEbphKj9EGhfzt2Z5SmUYn4=;
	b=WqDclKJcQcDeXFcLkwuxkdyHEoVVeQTMzSswGnvfndvgDuljZb7CPBNy072IR3IMrlwA
	 fi+VWsPtRWVEWOVN1Fcuou/pyBAeShkIhTzaarZ/K4foa2cLYZKLzKqdr5D/GvTNJgYBW
	 jtzyshCGYfAgPLdwbznhBxXeRksDQ8J1WcFdrNKvDJTeQRUfJxSE9v/xJsPf/WdVzVY3g
	 lDdtGYSv3w0MLbuefsrlta6IPz0Bwx6BU0iWqQUbwPGcdNEXvIdXoqV/OmLUWXP3zndWF
	 yM5kYKVUFYK87mwAE7YRi9PrYekrFkDJrCBdsd5j/Gg4IhhEpjbWwZdJQSP3002Te6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.160.69
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D818606A329
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 08:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D818606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4a72bcd6599so267407fac.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 00:04:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793952243; x=1794557043;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fYCgRQYSjg14gcNXBhIdgEbphKj9EGhfzt2Z5SmUYn4=;
        b=MFpMijjpKgShmLYQgXv1GAzVUzD/n660yLT4hMh8YeoaxK7a0NmHgC03XL5I5Uls0y
         GiwIr9LVzhVL/JKvHfKy7tqTs9mCD0EWiTDr7o5M8gc9EfTbxAD0hop2NfNikicRQotN
         wwj11Uz1nfaF/FLiIrNhyPNlbxOjTfqS/bH5MdFt3173ytiAnNLjrhzbTyDvL490MFnx
         0/YyYQSjql9eFiKq6gAv07NqZGUD7Zvmw4bh2ADwYTm8iI+1DWd2xxifx/6+zSbd6j6v
         cWkrB6rUzW26BdpnODwauZjzEk3wufxowZLHI1RoC+ZQrjk1sxiCBWwkIehE60YWuLUJ
         Fucg==
X-Gm-Message-State: APuU4Z/GDkrzWSCLqU40YYaldLglPKOeH3RiIBOiZPKKTkrIf5PhwqxZ
	2KENJB4qChxNWSax6JF2xAqd68KSriPEHE5WN+oYsuPdTMksMeEBu7LsmsmfnLqbUvpiz4x4MRP
	qVgFS9irBeMMymEFiiHwFoksSEuK8VXhbKl1mAyzzAgkT67+Qbu/dh4jemso=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:199f:b0:4f0:1b0b:4dae with SMTP id
 5614622812f47-567e14c6fdemr1400438b6e.20.1793952243225; Fri, 06 Nov 2026
 00:04:03 -0800 (PST)
Date: Fri, 06 Nov 2026 00:04:03 -0800
In-Reply-To: <179395008747.3200.5715234787512897721@cmss.chinamobile.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aed89f3.dede2635.b849c.0001.GAE@google.com>
Subject: Re: [syzbot] [netfilter?] WARNING in xt_dnat_target_v2
From: syzbot <syzbot+2e819f6641708bb6ab9d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	xujiahao@cmss.chinamobile.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git/master: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "675adff2843877c2da27b36b2517f827bc9915ea" "master"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net.git master
kernel config:  https://syzkaller.appspot.com/x/.config?x=d30e1495ee3ac817
dashboard link: https://syzkaller.appspot.com/bug?extid=2e819f6641708bb6ab9d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=16d96369580000

