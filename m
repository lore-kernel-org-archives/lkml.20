Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D8622D3225
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792322165; cv=none; b=AbCXKD4rtAHm4N87d9y/jkFUkVc0iL7g5fHKhPJpd36/j2LzJ9UVeo+WfGyeiwsm73mmLyhWVL2/W1aQW2e/LymUU4U4V7JuT4ZZNuSIXOOrSKCYCOwNGDzLwKKFuTk2G/BSDJ0sZpnbzSc/O8RScj3HnI8cX/f8NGb2ZsGRIKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792322165; c=relaxed/simple;
	bh=PpfjXeo7I/Er36q7GiaiRzMru2Alt2oWUwOqCFLVvbE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EHlwjGHv0BGCaS3sdTVCYUclCjrk7nH/zTY+gOQ4gKSWQpS7Bxb7JlRyqm4NqSwWVlJpAjFlGlhhUcdwJd4PM6n8H433Eo4/f0LRSuv5sFChYhtz7m1Kzqd0u56WLoxyfrVpuZAJVPaZXXDmB82Tmo2eRjMCqpVqnIcNQ2283oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81447a16061so3208178a34.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:16:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792322163; x=1792926963;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FfCa7tYlj2HWOjlCT+CqFgyGStedNRUnK06rrqIQWr8=;
        b=P+fCaN+CvOnqRU66QQCkC54/QTey24iMhFnwIsTTY4V7Q6mqCe1Ad35Z18btVy9OYH
         RGWbBNaubzncsY+CPHUJuhb4UB+PViCpYhns0Gj/uTEh61oN48JPGgylmpq4S9c/r1c2
         RlG8mhmRo7bC4Hlr24mtqzjPmxBDCj2N/kjSHMRIbr9JzcBGG2y2pFEyaJtaQ/x1Dvoc
         NlFvX06g5SbHTu1gYr3xWFrBZ3/jkvrxP4M+5HtMNNxSTMBZqFxAf15YhSI+Dqeu4wph
         mB0/2CuUGrSBEG7/0gZwJmLwiLtru6nfNZGzDB3HzIgRBvYtRuktQJGnG/UX66f0O7lZ
         symg==
X-Forwarded-Encrypted: i=1; AKwUvBw2FmdXMbxVBHV3+0s+p4exAX4W5YvIjF9gc6K//O37P9yGLXa0u0FDYurDmscIlPiXBsTjsF8/mTzezkw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKpIUZNZh75KdDGsRswtsGPq445hbEzOd+e/PzmWIlehxpTS9V5
	DS2dAail1f3Ynqy14Kv7O1zeARRsFxKlZd3aIKYBNYXr7pYRKU6svQf9J6bgffhZoOvOvRCsLki
	OpkiHU7bJh0pSWYm2+uQmMzX1VxwJw5uM7u8uiC6wmqMuVe0CWoqOjwheU8g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3509:b0:4d6:93c3:3e8e with SMTP id
 5614622812f47-53cd8320030mr3333768b6e.65.1792322163475; Sun, 18 Oct 2026
 04:16:03 -0700 (PDT)
Date: Sun, 18 Oct 2026 04:16:03 -0700
In-Reply-To: <20261018104200.7908-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad4aa73.7f4e89eb.3d59aa.00b1.GAE@google.com>
Subject: Re: [syzbot] [nfs?] KASAN: slab-out-of-bounds Read in nfsd
From: syzbot <syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com
Tested-by: syzbot+561b859d032c8bf2fb53@syzkaller.appspotmail.com

Tested on:

commit:         32c52ec8 x86/insn-eval: Fix shadowed segment index in ..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=116a4895580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b38d39c45202f4fa
dashboard link: https://syzkaller.appspot.com/bug?extid=561b859d032c8bf2fb53
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1579b4e1580000

Note: testing is done by a robot and is best-effort only.
