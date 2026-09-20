Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 287642BE034
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913286; cv=none; b=M2qZECI9/9URwaVbsX/MBz/bTxihV++HiDeJCZ1N2SmfncTZB7UFfuT4jvdnN1XsrMb3ykiD4yXGqz7S5gJ0Pjr0eWoVjSHs1leAXlCavIsu7QKmB6Y3+Q76QJILQ6qlVHejFR/SyN3Glj2vlMAeMSngpd0KR9LETF3juqzirI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913286; c=relaxed/simple;
	bh=bZfT5tXkUXct/WBTrC1+Jazz4MIrHQV/ziQBAz2/EhU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PzhgR4MFChZCM4iAGj/ERvLl+1BLhGMs0lZlvSNZF6riAhZP1lTjqkoQ+Li84uJ0d/+joL1xtgp2MmjP3dZh9Iy1epUFYX+Def89MZhAz6UdpoYJp5mZd8lLhWLtyTpmLd4rVPs1U5hThxTm+RlIM4Vl84Re+kN9cN9c8YONfxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-467c2c754f8so1814516fac.3
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:08:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789913284; x=1790518084;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zrEYuumKyc62VKG1b7mEWWuIT5AdF3XlbmxgQrDtNHo=;
        b=XwTU7ONQiDvGgZzxRvpS+9A87ZsGZQX0QImpSXnCuZ0Dtqf5aH227Qd4QLCJiXmitC
         C1lveHb4eFseH3wjk/DNfwuYwnAYJyEGScx8YOFeHJGRqdDmaKLhF62ufUw93SkqHnaH
         o3KCrPchXwtDDzFgnA5hD40YIRkibrDSuHYURnKix6cEVEPM8CSJBRoVGmAkDC7XZFPj
         bnHMcoGnyFZEJUnOG1affg/JKGLbioCi3O26LEnq7Pl0oDbgUpQQNuGgnhCJv2og21fd
         mz8VESUjsXn/c7OnxJ1q9MU7KWv/n8ak9Sg+WeK+akm/TjG77F5mPwtWBrq5LajiGZIg
         omRw==
X-Forwarded-Encrypted: i=1; AKwUvBwdrYTduLLSdQj04pGC8sekILLktXh83LTwtOCj1xN//SKtjak1jMqvLLRREtGgdFKEhJqdpOI6JXHvwl0=@vger.kernel.org
X-Gm-Message-State: AFuF++lKV99Hw0H5pb86s+071sD03ACm/Q0gcQbGT/Pa+2C1ULJtuTGY
	nePYreoHHUp6oKeqjZWaByhfI0oVjwGm2/BhR4FyknlZNllSRFhHe3QjDU9lTq202co8JzgrKyN
	ksfaSkbnG6CjxGm/tgHmmWrhqep3E0oljbBeqyBiu9bMb7JSOstz/npAOoCA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2015:b0:6b7:8396:f3c7 with SMTP id
 006d021491bc7-6ca9c0589e5mr6960404eaf.41.1789913283921; Sun, 20 Sep 2026
 07:08:03 -0700 (PDT)
Date: Sun, 20 Sep 2026 07:08:03 -0700
In-Reply-To: <20260920140624.18480-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafe8c3.71f81b7d.15fa6d.0018.GAE@google.com>
Subject: Re: [syzbot] KASAN: slab-use-after-free Read in fcloop_rport_lsrqst_work
From: syzbot <syzbot+77955102efac681ec73b@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/master: failed to run ["git" "-c" "core.hooksPath=/dev/null" "fetch" "--force" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "master"]: exit status 128


Tested on:

commit:         [unknown 
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=77955102efac681ec73b
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1535c005580000

