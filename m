Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4AC48A8BE
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 11:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791805984; cv=none; b=CBwUa8P2M58jO4CBFyqE9y7uPOnCohOMZlLbVlEN8Q+EET/bNtSG7b//1hdx82jSp3jbBmYoyD3x+Y2A3PtMEWojDWnvGYGCBecVCGM0tGibRzQaipJhFGK0maTzCKWLfaroUziZhFPsrPLpcoSbMZTn6Ez5o9hepx2igvFibjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791805984; c=relaxed/simple;
	bh=+SHWipGd4H47MSaik4gAQP7Y+avfWozi7ztwAe40We0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pfzZeOHRL2bnjcNHB8LNPcmrzIVaDIOuWGy2uxdHy+xeqaaWgD50T9oGT7Ty70RTBphqnh+LTbrHTbXYB346unQBAqp86BaDrymxP3cHcwVRdtzQ8E9Hyld1qWz6W+ZxeIIcXr8M+Zhi1swhxHIRslNsO6zFWveGW4tYiHPmNn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4fb73e868aaso2758645b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 04:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791805982; x=1792410782;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2mgAaehDukFfQNPxMZYRR8tyHju6aJWjsthN7d/mKa4=;
        b=pJDAZ/ojboiLoKn80tS+PGTiN6eq5hYDqbwUj7BWafF7bDmJ1Q0NLHZHMbW0OMsXmQ
         CQFW5PYpBSsdCBTyn4lKUUmvsOzWPpmKX9Vk8y9g5F81ZdlphjUm+0TRLPiTlwg1RiMZ
         Nr/Mbov165ZFRl7OwJYI+5hT1SUD5AKplXkczB9LL1jKuB697yO6wIQIn70Ir475d1PH
         Q4sAAEVlWTDrkxACS/9zIWmJ61EAfiJumwMcI/DPepvv4iv3YVIZwiWVgpgvB+ovrmw/
         G2ilH9iDGRNhzNaqBV/2DdZVe4AgaWLwi2aJ4ME98bE8oP25LyvsrpuRLrNKkXzL9xCb
         pIXw==
X-Gm-Message-State: AFq9FYK61OwVCog6hLEY7y3oLYIkRBgP8/oO7Ki2LCk5hkxp6gXussRq
	PxZgdftwv80+XD83L2HyEZ6iNhfLnomo6w6vseV72PlmrbcMKIyo+XT0lSPYLAX1izLwc7iCWxP
	fndUhvHAVAyjpnmxmOC/wWE2CwiuE8GLzX0IjLnfkhg8h1nS3XcixQhU5jUY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc4:b0:4fa:8d48:3a7c with SMTP id
 5614622812f47-50c5b46a0famr9001143b6e.56.1791805982553; Mon, 12 Oct 2026
 04:53:02 -0700 (PDT)
Date: Mon, 12 Oct 2026 04:53:02 -0700
In-Reply-To: <CAEfrx+Cb1ACQgH0ONDtLhuBk8wL+70G3Q2-ZWw4DAAj09+dnDg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accca1e.0e5b5d80.2c029c.0572.GAE@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13b350a5580000

