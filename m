Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793172004;
	b=uZkwmRxFqBABCrGT713ZnBtErN+SK2+l5NTz4Cqan1Z9UA9KwTFJZBTk46kEoIyYsdKf
	 GHZNt4qK/saQbOKBTV2XTvsIkfSCkpNzzsXJeAeXANZu1KLfeGBtqCmqY5D/Fprxb5tYY
	 0iqX9kQGzCktEQTdflb3cHkH+DamLrOHWEVd2/0K8BHz6QcOwm5XfeV0moch/4WioF2v5
	 9SNvl/df3NdmGDxrlfgE1vyVKo8LlgPjpOGyEuvU1Tl9E1umfz1dZpIA8RigAvMY7r181
	 DEx9z04ZxEqXulTbARlInnxtJqfZTUfct4pSiLNgCPOaXpf8wHH+WTggS59h1A1sWlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793172004;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=FfpjIJUEphlcNWG/BGCKVitAlfUvGdxIY2/K6Ri9l9M=;
	b=xLFKWEwq/e3vEJsid+YmrxOgRbJ2WvTujHQipEH41or+GrfkTyFQaMI1Fbh7AHeBUX7X
	 tZ5y4yCDXsuP3wVo2brk6eG6vOKKkuRBzF5GgYCQIkUVTagqesc8HTH8yzLbZ3uflq+rL
	 wSnni56EQOqtlEVL3fTSrcrje4pTF/wBTyYXXfIbDHURm+wsBj+g+0LwzgrG0TxkiL2l9
	 xEYujyE1KY0vBn6+G7d/hczP1WBOjXFbt47hllMG+QwdLXlL0xD9ynq7SxaIiIy2lVb9H
	 RQN4Pf8QHE48woB2Dqvx9qZizk6Fhg6n4YX0jLXRnxnYpKht8h883XpjJ3jBJuZaOiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 050BD606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 07:20:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 050BD606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37620eb73so1281286b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 00:20:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793172003; x=1793776803;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FfpjIJUEphlcNWG/BGCKVitAlfUvGdxIY2/K6Ri9l9M=;
        b=ohgcVrvQGgHqKiOPospMq1NYWUpUza64FBHpgrg6/72iG+AWFiXYLZcqKUAfjg2MLK
         QM7sj/I4mF6EeTBNEhYkzXat0SlZTW5kf7bKTQCx9lMxkTdf5zpXe0XPSo4LZlU2V3B3
         V2Fg+NjfvcjgZ6/OplIsfK9IQKdIdmC5JpH34Ai179+IrMNcPF6sZc0g82LUmrTGAhCM
         4z3ZpAWzjDdYTNrnToNFDAvPAF0UCL84DBbigdQwL5f34gk/qWCmH2nEjx/fx+rZzbi5
         bcP7+TEsqPnwxcfvU+w3h6X31uDnzri+zvlY7WivM5P8AP4mZLyqYHwlEyK4BkVFwAc/
         D/Yw==
X-Forwarded-Encrypted: i=1; AKwUvBxXe38OWJ2aCHkQ4M3gDtjiMWlcuQ+qx8w4DbVykktq/xNbQSoFa/QESjXwARNuDzh2dOOZYNX5WUJUgUM=@vger.kernel.org
X-Gm-Message-State: AFq9FYL5hE/blQ6fEqpJ5gHxwzfcRSdIZwtoU3XsPNKEW1aI06M4gOKa
	ds5F30Zl5t2b6GF+VW6q4sK7dBYCZ2OqPED4KyQ9wU5n6zKHiWispKD4qpFStaOPBUfhpyJbbWi
	dRvFMciw8mnEMKuSL20D+bEsAsYLQGx+cCZFgiumBuod9TsIaYU3PFbCcwX0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1985:b0:4d6:92b3:c1b7 with SMTP id
 5614622812f47-56384398ba3mr884250b6e.58.1793172002931; Wed, 28 Oct 2026
 00:20:02 -0700 (PDT)
Date: Wed, 28 Oct 2026 00:20:02 -0700
In-Reply-To: <20261028034820.267112-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae1a222.403b7334.342f87.001c.GAE@google.com>
Subject: Re: [syzbot] kernel BUG in remove_inode_hugepages (2)
From: syzbot <syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com
Tested-by: syzbot+2fcec0eca7f4cade53b2@syzkaller.appspotmail.com

Tested on:

commit:         9ba46df3 Merge tag 'bitmap-for-v7.4-rc1' of https://gi..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=156e070d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=968c4ca981edd5f
dashboard link: https://syzkaller.appspot.com/bug?extid=2fcec0eca7f4cade53b2
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=170e9629580000

Note: testing is done by a robot and is best-effort only.
