Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5457D447808
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 14:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789913466; cv=none; b=qBuSOcXvxzHmeJDnVSze+Nggy+dsU9Hbox1Dh6bp9dTLznPhhjiWJFGKrIILEQ+e5ouidoShFfdcoqT3SmrKhzMjbFW1hjrA6OA2z8n+QGyc3qsOjBhSReQITtTmTc1oVu/W53vWtd8azO+Fj/T1Yc/ajOQKzLlwwjAWMckRWKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789913466; c=relaxed/simple;
	bh=WXrqZeQkSQzmJavb3Tvl9Oq/xsTepgtW4OBLL+NZO1Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=fkPmz5LIEDTYwPk7ruUmclEZemo+7K0xVHCkEtSArS+K+2CIJrAOafcGifa7iWlZtLC5C5kJFFvNOx5CSbncKDICWm+pgWTcVjEV6wPILz7iaoUv0CHPRZ3CfAaTvFPzDbYXp8ylhPAmgCyQGWwZd4n3kdQGqTOco+7vrY9xPJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4519ef1babeso2623204fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 07:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789913462; x=1790518262;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=S4OruaKR48FOxLsZqE+N3BJ1IaPQageAxEBHATOzcbY=;
        b=1e9V0erFJllGoDsHtwuReahhJf+TvFbJBaXZBxzu7wbKcB8z59YSAXHV+zWZv5YR5+
         EV54wOUSWfJIDzKZ1EDWVMS490TIgFf29E3wef/gsIIIHkXayXMNGoWh69fZBbVNTN/l
         0Lk4PS+PuWQxVrS+V9QOtrLfBzI/t84D5DlpILibE9L5n/aMxvgGdQfGQXHqur3+CZ6E
         Cr5HqvTBAaVCTRvSl/0TqjPMyQ7Y99F+wfeB2S5wBaSCpv3BWgYTdI8N6qGrmMp74Imi
         FrwHlo7terQKDrvjZDySwpphonbZ9hDKoDylzFlYGaFdRv/CQYK0TeT/ief4Dn+QjQ3f
         s0cQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkL66eZOK9pLS+Y1XyMr7A+KbWTgO98sb/5izrBoLdxeAjE4hIZm3Cq2qWI3iUsZICK8DkYA5ZkqPoYZg=@vger.kernel.org
X-Gm-Message-State: AFuF++lvU2bbp0+q38M5mrWaP8d96MntHVdx56kyY293NEyvB1m592Rb
	nURdGePRajehDoxduzRHH9MfErJfyLTrATH7P9Sc2z56JI/OkySvG4e0L/pcKZlByjO+gmeHFJZ
	AVuvrN8AidTs+L3EEa+4pfsfj2YdySZmElYkUYlVfJm7aBQCCozM/BXjqvJ0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c8e:b0:6b1:4b76:1c18 with SMTP id
 006d021491bc7-6ca9aa4282emr6948871eaf.24.1789913462631; Sun, 20 Sep 2026
 07:11:02 -0700 (PDT)
Date: Sun, 20 Sep 2026 07:11:02 -0700
In-Reply-To: <20260920140946.18520-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafe976.3179f8cd.1e36b2.0011.GAE@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=161d1525580000

