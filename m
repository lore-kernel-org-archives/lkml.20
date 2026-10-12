Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B64B4A9D59
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820385; cv=none; b=Hgj69akuNPwqM+EWviQZpnZWR7xzZzTiVdSliwrD7vihFButLgdEOQCwhiRIFjiwypddKp77SsTw9YXVv2xP3Q9SK3jqXJHHlYYTwd854SK3R3V/WXvYZ9NtH1hfwlwTwZ14kMKPBys4Ow+LZhjNBzIQ0yKZQ9doryR09ePLrWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820385; c=relaxed/simple;
	bh=Rnpnk35HRLC7lEyWttFVgnqQo+jhtTTnORPMoAfXqNE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=R3L6VwPo7s7iO0SihMkR6yr+rEhnn4VEPoLYNfv6f2zOOF1FKNwyWPPsMwMRfW3fOz/Z0TatPGonh/VZ+mbEwBDpkwBp0+hj4j9h8ZfCyRapK1i+Frue1NEnoIX0IRyUv37PRU/LaDi+Xp9jsE+Fnb9tx6q7SqJgjk2FLpEV/YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-448d51840c4so1950690fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:53:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820383; x=1792425183;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mdH3DOUIroQTWIfrwO6KKlOfgnPQCMMuT5Y1NL7uLYw=;
        b=1EA31Q2VT63+CRMUjivoy0rcg1H1OYx4qAWg8lJSN4S92hbT0ApOnJ/a/t+6stcRB5
         6+AZhEjMKUmuaz5zljaBOsGFuAU9Ef6y/hS5DAuQ5gv0cvB1LqG30DNNw6WW/mMGq2K6
         2yF2xrvteC7q5EgLTG63pn7SwKyKLBniyNq2OEewJxX8UD7s/cGrFrKgsNS4XHwyeAxN
         ZxPEI2Ha2DtadA8EeGR+H6xjRmlG6SjJmSKuJJEVaGpRZAdUL0j4IFVBwBm8yEWOmBHt
         X+ybZmUyz986HNbZzk31zLA8FXPrIV1DrXkCSTYUjPj/FZDy52jlI7z/+67ddIFRz+US
         ltCQ==
X-Gm-Message-State: AFq9FYKGiTuDpOWaJ5ZquFkWY6pDI7mvWs/do2czYds3DRF+c7PgmtJu
	xmEbNh007/2kikCfjpu7TLEx3VKDNevwmKfhi4BZb919Jk0AtnQPMjS5NHne05FpQd2Xkn2utiW
	Qa30BXwcAvBYDK2pOXwoe9H4+QbRd0Zi0zitCaA+NmM5Q1lP2Oen+hbdRAvA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc1:b0:4d6:92b3:5c85 with SMTP id
 5614622812f47-50c5870992amr8682282b6e.66.1791820383354; Mon, 12 Oct 2026
 08:53:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 08:53:03 -0700
In-Reply-To: <CAEfrx+B=uvopx-OEUb+hRhV-ygL0gDhHdTQTmjVJbAPjKEL+MQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd025f.a150a118.27e199.004e.GAE@google.com>
Subject: Re: [syzbot] [wireless?] INFO: rcu detected stall in rfkill_fop_release
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=859f36d9ccbeaa3e
dashboard link: https://syzkaller.appspot.com/bug?extid=baad8fdbfa4129f93db6
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13c711e0580000

