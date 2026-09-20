Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167163DDB03
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 11:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789902845; cv=none; b=GMlI8APa2Ja5Xmw7oSGoLRA5BDxYuBZvpftlj8unBUsG1f7BFRDmt0u60fSI2r2Q6laDuWBVL9ur+wuEXUb57304pFaHBvqflBFD+DrFrqrlHvEpoTW+v1CbWyLDkynZ/hiPlg+bEwYaWoVf5D+pEEKeKSFW1s+puLBNX+KYwqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789902845; c=relaxed/simple;
	bh=182GDO4SIgkpjfoJ/LC8VuVHEyaZE9516QzYKCvW5ok=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=D7op/Dm91ryIY9g2Qtw73L3UfWNGArWtPXeMpSAatZRfdWP1qP9Bhaa8ycF+HurIVz7Ytq9r/6i88bvSUwug3Q9Ri7JNjfQ4+Xmf8dvgw34lEGMc+iW8m3H3B21yfj0PX56W9WUOjSUSMcfYmgOgJUYWQ2ZHKdtj+x0gVQc0/Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f8931a803cso2132849a34.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:14:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789902843; x=1790507643;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ADsLxJ+h+7JwDVM+3D0grmFjJtx70BD6bsvBXmIkXsg=;
        b=A/Old/Lfj0iU033z9522UyHjxnp3e/Y2TIF5DylyT32j11wI4zUtq+CZEaDyghvAuh
         +bKRQYnc/nd/q7f3CglKwk8/nOL/bRV5cbaJOftspz/G63hiSOb59rfle7LKyor3zO+V
         4ZteTTx+wU1T92/ILtgvsBjZvYfSkGrbLGuk/9P05XheOoIbvwbZeZVCZE+JUHdpYrB4
         NL3xLBQr8L7VES+QyONG3H680O1JLmzIiLIOVBVfx97sk6nkoM68Q5lTKuF9Ah3L+x2L
         1e+MZl+QzL+s/mgb9KH3ladjJCDj4xUiK0N8/gcVbMwG7zrZ/WWE/txj9gQx8/LiOmAp
         zGQA==
X-Forwarded-Encrypted: i=1; AKwUvBz2FjZWDQVvLg6+WflyfgVtIJbi7NhBFfiWvQCIK2fKm23hjqUjQkqGoAfnrq6YIPt6wh3gMwpgcpMm0zE=@vger.kernel.org
X-Gm-Message-State: AFuF++n1lu8MYvySW3KsfcdW/cTeFu0MG6ZIHzMJ9DP+G/gR4Uv25eiR
	Zn3CNWN9NltfEGBGBMdCCczbJAzW+aD67FItyoxFSTYMIWogai00B3DtIiUzzHOwpTqrVWC6rG1
	dHTfOenHXRJt2e1UHfZGjDfPZr6k+sYlEaVHw7PHpbPC/BNAC6EFLBqpSGvk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1891:b0:6cd:3fdc:a934 with SMTP id
 006d021491bc7-6cd3fecc3fbmr4221959eaf.81.1789902842996; Sun, 20 Sep 2026
 04:14:02 -0700 (PDT)
Date: Sun, 20 Sep 2026 04:14:02 -0700
In-Reply-To: <20260920110110.75714-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aafbffa.71f81b7d.15fa6d.0017.GAE@google.com>
Subject: Re: [syzbot] [ntfs3?] WARNING in ntfs_evict_inode
From: syzbot <syzbot+3db654d91b471c4d7a7d@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git on commit 518e5b794c06: failed to run ["git" "-c" "cor=
e.hooksPath=3D/dev/null" "fetch" "--force" "--tags" "f569e972c8e9057ee9c286=
220c83a480ebf30cc5"]: exit status 128


Tested on:

commit:         [unknown=20
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git 518e5b794c06
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Db454dc6b1b7acd3=
0
dashboard link: https://syzkaller.appspot.com/bug?extid=3D3db654d91b471c4d7=
a7d
compiler:      =20
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D107e39155800=
00

