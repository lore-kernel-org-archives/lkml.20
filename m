Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21ADC429022
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074672; cv=none; b=JYRZTsGjxtFJhaEZFn26Xv+vwT09P2vnL+YHqmmEAZBm480PamiNf7EdihDAVhz7D19JfONKIrbzPbrDfXMP31GIUcMwy8HPIW8AKFiBSqTYR5PzX+3OyOMwlrPhAuq4xRqxYakgVAEo5NEsUdZCq2u55LbiH47dExSuJyPYY7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074672; c=relaxed/simple;
	bh=enmt8FG/cxYih/k+ubLHRG4xG0025u8DJnps72TF1aU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=V7GEJmFZ2pUmP0tBeQ23kykaizk7pi6eWo0vLQLY8AB9SnAfU1D4/kEjnI4gxIRPs/AyIAflX3kNvm7J4bKVgvTE4POrpzrdnEiI7ZaCcoyWxuz5qBfMvvjuf49L3OPtD/W+GktxSivr6DRJ5Y/szrF0Y3nrtT2FW4vfyxQAUdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e99ff505c2so300752a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:11:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074662; x=1789679462;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=M6KEMlEqOL4DJOUievTJvLx5KH1DvxTzQUf5ox0EooE=;
        b=HWhfDHE3GvJvU7PRfwIvmBwPjRrIgJvLaZWB7O/LVJXHa4ddcUSez6j9hPvCJyZ+V0
         SKziKBX330RyV3wrlZlOqeuJSlbbA0Xiwy2kocWp0UfkoZuWfVTYNZ2a3AqJL9gBtzRB
         YmBt+eZpzcOFwyqzPMQKdep5JrIJh3FnWNQYpL6pC7kp3f0DSYqB3fDZV1HSDXC67DTa
         Ss7v/UmykEgEPqzyIDXEblzTwtkm5xlAvmoysRvMUUssFi4zJhS08fkLh4GvGKOG+z2D
         4JoWXKiE9/4Zpye41jc/pBV1KMZeEAKFyIG62UL+ZE/W1AeTnH1Gvk4iuX8hY3b5mZ9d
         ZNEA==
X-Forwarded-Encrypted: i=1; AKwUvBzX9WNRP2mR8U+hsPp2Xl7PuCcbGBSXIlAoLSAk6JKtL30l33UCPTjFQjlXzyO18vH4ZGYpBJ7+v3FDoks=@vger.kernel.org
X-Gm-Message-State: AFuF++kKzdCP1QtBtLp8R3wDWkQXW+PIlCYIpPwmBBPhsrNLhH01Xd2x
	miCLyZQcSLxDDOlbd5vWNHK/rrgnvGpj99NT4m1lrMCPpXmFKKGQYAZcz+oEgEEvX06cHfiS+dP
	uL2+jdpVXT+xPhttRpcFecw+XprSu2f7enFXOkXhCThQ4sOVEgXoPNHEErUY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:6ae7:b0:6be:4eb3:e1c6 with SMTP id
 006d021491bc7-6c0bbfdf631mr881398eaf.19.1789074662179; Thu, 10 Sep 2026
 14:11:02 -0700 (PDT)
Date: Thu, 10 Sep 2026 14:11:02 -0700
In-Reply-To: <5bee3cb4-984a-4e6d-9a5b-5d3d29db037b@yandex.ru>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa31ce6.f81106d8.2ab401.0015.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in
 __vb2_queue_cancel (2)
From: syzbot <syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com>
To: dmantipov@yandex.ru, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
Tested-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=137fc1f9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=19560cab9a915237
dashboard link: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=111b8925580000

Note: testing is done by a robot and is best-effort only.
