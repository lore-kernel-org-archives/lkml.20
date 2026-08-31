Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D86028686
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 03:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788148207; cv=none; b=shnNSQaJfyKHwPd9i5lL01NaGDAm4Q+jIC8qnCJ8HcmpUmG6Qav+UO1qgdRYjOkHIVEKhieXC3E3mMMAhjUrXencgZ5dmExKzH0/spfgeOWQF4BfhmfdFaxxZl+2n1BF6SASsq/BN9IFi5m9mpq/XeyShGnj1K+ltnhlB6TpfBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788148207; c=relaxed/simple;
	bh=jOdS/HV7WwSa5Ptct08Ttf2QIUoerOH3a8Ty5L/pKC4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BnJRkREmytOypOu5Vb2sVWAjoHr/BCmLfcZXgfOM3nv4dgJLCz15Cl0Gn2t3BcehEf7Vci5sgR3rENBUAC+4uKKdQRDtT7A6nyeWoa5E+LBzh7k85Ja/1o4g1iMK9PwF5IdYnHoiA3ZsBl9i5QwLZnwvmNqhYmB2DfeRRy+QUqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f36427abfdso3965221a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 20:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788148202; x=1788753002;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RGCT6aQm8aeZEUJ1GXMx2H1TiFBUhO1+WRgCr6TRRKg=;
        b=LmREjqCjhX3TsKLw7WSki9O/t4/Z3vxNvxp26+EFrLqziBwJSIRrtkaevyFDb3dC/p
         4GNsH/udpe8v4mvar1UvAtF+cGZkCX55IXTnwlY7GO2yALQ8iALZweX9/9HUZTSe/9Kd
         CTtGWTOpM3hwiwiisEPjSX6kQFLrPveTNAIueEf9NaxRYNOJagoidXuks9tK+2RKwmAF
         Q1shPkbhga0tQbWctauXZyVLwKU7MAFGo8Od9YsFa7xZDyVZhGkoebtnm0IGmOHjipll
         N4eO5M6dojACihl/9VumR0UWlJ5X/3M69Yk3VahnDzpYOz8l3T3FxuSuHzpoPpu2Cu3O
         uIng==
X-Gm-Message-State: AFuF++ke6GkoxCj1h8//meKbRH/XFBWrau1AY68sDeqI6Ua/COZF2P8U
	gjMExfSqD7eWlBQtO1pO8suayC4Iqa+eBlvDQQNAi6omBoLzAFkHe5BhLEd0/pseA1zK83ZBLal
	f1BaPGqceypMII6IzjFgbKlDLcef+1bOQir9G9jq9yyGoV023LjXBSXRucgc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:a085:b0:6a1:4507:3544 with SMTP id
 006d021491bc7-6b1c66a71b8mr19327423eaf.28.1788148202635; Sun, 30 Aug 2026
 20:50:02 -0700 (PDT)
Date: Sun, 30 Aug 2026 20:50:02 -0700
In-Reply-To: <96064883-7d31-4ba9-b849-bc29f734afcan@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a94f9ea.4d659fcc.734b4.0042.GAE@google.com>
Subject: Re: [syzbot] [block?] [cgroups?] possible deadlock in blkg_conf_prep
From: syzbot <syzbot+144a1c0e22e53a08ef5a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
	tao1.yu@intel.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
lost connection to test machine



Tested on:

commit:         74b69790 blk-cgroup: use GFP_NOIO for radix tree prelo..
git tree:       https://github.com/yutao-intel/linux.git fix-linux-next-block-blk-cgroups
console output: https://syzkaller.appspot.com/x/log.txt?x=1781ec15580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=144a1c0e22e53a08ef5a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Note: no patches were applied.
