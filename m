Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95E21FB1
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 02:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788574085; cv=none; b=ImxnN6ni6/rF97j2BxnGOROoeA+oyCO3iByOZifoM4FW7hSTT0FXyg6F6ME1kBDicNuCIO46xk+CXEG9jKv3iEL5GY1u6c53HVKyWS22AMb0nknhcg7Qqy02xQpI0ya+5VyNmO4BCLYt0TL7kY5VNBJGxd1uVWEaTi7eMcdf0m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788574085; c=relaxed/simple;
	bh=ovVPpq/kYluHMXr2ph1FJChcIx3U5JmdSrPW7n6+Ilg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=elSwy+x2ytFFNmuzUqq41FJiCEL8WbmvnLZDFtd2gm/NtAypjd64ThgZMHnF+rIbSz7/6DI1s7/ysJ/WMNesrUFM3pX9tZrrKUivzqXoGdxmCJusG6giABM4LAIc+j0YAp6QFKh8gA6zgud88iP39u+MdmBHDP7q0rR+8aKa970=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b19eab8bso1169543eaf.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 19:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788574082; x=1789178882;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=n8CZBMatS72kX0jdGd3gI98Wrz+jCcOZOUXKESRwR08=;
        b=c676Ll8syOS+mOuPZeo+RZ3/pzrLhQi0vhw8HfHRicNM0ch+RODMDVuW3L/KTMmfR6
         eHLYN+xdCC/isGcVZAx6wo4xbY8tJ/xb5cu38V/vg9NKNsx6U+QhR4xAtx/o8DZ1b7b6
         uGCj3PmZvD9K/w8fqN9CW0j8gYAIyOHnoGM1UwzH8aTMYkqlRaqy8MN7tspuuRiIVRS4
         XhQttG4tigLgh37C/asD+8jWN1YsXZckHmjMJ1BpiEJXI711pKkGfh/smAFDjk1QzIbg
         mYxPdbFvnhO57iLYudA4UlDrlOwGPqCM310oOmxgpAXKNE/9wI8tWJGGTaS7JtRppBBn
         Gd7g==
X-Forwarded-Encrypted: i=1; AKwUvBxcDYrzdZV+Bnq3UmztgXiHGZpkmYz5gtE/xBworMK2Qe9BT/NIo3xgDr6FtD57iaW8SJdbiczH5jhHjX4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFNMEr80mnz7ANY7GSVwuFnNUj4y4rwoOiW8BsHktKaItqHLNl
	5FlrfYp0Xi68F6zBkJJFI7UQOIbMsgXQyKoJaKLej1mVlDDUihnItJpIQ/zUBSQ76EaMIUzoE8G
	PwPtQkJIvDcKTFuj/OdzTzbSkhlM12+ZAQna9vbT4xJeoHz+F0lt9EMatc3c=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:991:b0:6b1:c679:7117 with SMTP id
 006d021491bc7-6b6faee2795mr6922320eaf.4.1788574082688; Fri, 04 Sep 2026
 19:08:02 -0700 (PDT)
Date: Fri, 04 Sep 2026 19:08:02 -0700
In-Reply-To: <20260905003317.18035-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9b7982.04649fcc.10325f.0006.GAE@google.com>
Subject: Re: [syzbot] [bpf?] WARNING in bpf_mark_chain_precision
From: syzbot <syzbot+7b47f87674e9a1569110@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: patch failed: kernel/bpf/verifier.c:10886
error: kernel/bpf/verifier.c: patch does not apply



Tested on:

commit:         b75a000f Merge branch 'bpf-add-missing-precision-propa..
git tree:       bpf
kernel config:  https://syzkaller.appspot.com/x/.config?x=13dd96f4206498c4
dashboard link: https://syzkaller.appspot.com/bug?extid=7b47f87674e9a1569110
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1774e125580000

