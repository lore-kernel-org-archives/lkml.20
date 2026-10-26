Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793028141;
	b=U13mdXzB85tRBk7vq/CL6+scedj2hx2Uuo+Hd4Hy0j/cq0jIPwvUxZ7xdcvXazUrxVlB
	 hEOVGLEaW0x7/WyjdyxlFJ1ExkoltLuvpdHKhBOxVLJsO2w0hlr6zMPzPh6cMUCItM5oK
	 mdsvo0gSEteU5/+Bo2zxO3dYk+E54rxQG1PaRHW06UMGbX2KGxvIG4JbcYtHGbNhXpp04
	 LCcG0j2Yr7TQvmJTs7kD0OVWPuhsCwy/1HZz0hpnrdvyapfFvevBFxxMNxWB/BNP4UnZN
	 m2tKj69IkJ6cQHdk+Kqw/dufOjTWa34E8HCb9+cqELhgXPAImnEhRv+IGLS+2YIvpGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793028141;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
	b=EX+kfX6u6eGIjpmqFiBfVyVnhVgUH2iQZZR/33UIx4iyQZdEc97UDNWJVYgeca9cXiU2
	 b5b17Ut+lpps/mgbWXtQtDShCj1ck5ySxaunPN74Ip5msJgPNc1ip27YU/3aBnGgDQ1aD
	 SIp4pL7mTgEoRavWip0bCrV7GwjNgkUadbhlPwYz9I2Z/PUcD11eo2PtIjh/01ArEUvWV
	 Aenopl6glfX8/aXJtbyYK67GFBDKOUOC1JMIqD9NC032n1Hxf7cmHQoS9AZhH3Q+3XejB
	 1TPJqWTka+dfg0F/eILIKY/+mZJAiUZhoMO6sEB1hvBYJJ6gSvqD8XJf07Pyzl/l+VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04248606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04248606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4d2f0f77124so3997838b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:22:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793028140; x=1793632940;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Frm43ufNh8qqB/Bw6xfF1sMT8C8/aL6tF6RXXphvCaI=;
        b=Q05ECcemKD8iUl8br0LFAFG+SMJf1HIeex4brq9uAFW7BmqAWrhXasJKAfgHGnoovi
         xv2LOkTg9HMYALMdW1+HOXMECN9mPj3lGZn9fZVxezjXm2oL3gxfgCRWkdbPglLS1cL7
         ZAraN1k3ryfWEHACHdZb5A18gXJAFW2Wd6SFU4oDSOSx1uj1y1LrF30EYiMHEcm5yBHY
         5E7zAMyl+PNcp3z709ppwP9QBmdTVw5+MHp9bp+L5gBGEyBtrksV4DkeGx1Fd1jxDrUh
         2s3QAPHbVXzqJyGbNFef6HGK244kbcLqjqEObjp7U6rgXDY9tPdxlyAccrWwyjyEpBp9
         smlQ==
X-Forwarded-Encrypted: i=1; AKwUvBzP9bPW1ULrTUlX+D5MLALxVxZ3vc6ZIR+Y3g1E+7yw6PsbUYqbCPCwYvnXCRAZqAjxiIkv/NpTx8L2jwE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKD6gg8gV48bVK5CsPT1Vk7g7q9oDDIwHWuqf1EOOlcIUphEKu9
	gpc26MDPd5LvrAw2sEx+JnYVdZDN/THv21lUU8OdNDOCKa3qjNFfMgc1fWpfnELHvdq0Tt03d86
	u8HEhj12VL4z5UNIdr8HCcqgVtA33g82oaC8WEKpMRb8fPYXE5kTRgfBgDdc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fce:b0:4f5:20:d847 with SMTP id
 5614622812f47-55c0030cabamr5683856b6e.36.1793028139697; Mon, 26 Oct 2026
 08:22:19 -0700 (PDT)
Date: Mon, 26 Oct 2026 08:22:19 -0700
In-Reply-To: <00000000000034ae0f05e9f94c79@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adf702b.3a3d6196.2ecadf.000d.GAE@google.com>
Subject: Re: [syzbot] KASAN: use-after-free Read in jfs_lazycommit
From: syzbot <syzbot+885a4f3281b8d99c48d8@syzkaller.appspotmail.com>
To: dave.kleikamp@oracle.com, jfs-discussion@lists.sourceforge.net, 
	kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, qianqiang.liu@163.com, 
	shaggy@kernel.org, syzkaller-bugs@googlegroups.com, tristmd@gmail.com
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
From 7e1a0b91e9efa8bec40fc5397ba6c4e683d72df0 Mon Sep 17 00:00:00 2001

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=885a4f3281b8d99c48d8

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos
