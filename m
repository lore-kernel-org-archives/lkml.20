Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C3C5304A1
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791914585; cv=none; b=cieGmKi+N55jaQweDOmOw3PauaECM8hC6P+vNiqtqcXnP15VYTUh5+/x9UGkqqaVSuPLl3veD4fWoWvmmdvhNnvQA8PllZlbrSm85kdMs2hLBPTbnaMkSiXRdA0NAX8H9UFwWUB6OUzbyBA571E9jTx4u2847Kloa/qgn+mqVG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791914585; c=relaxed/simple;
	bh=ROJhZi2gwlIZuLbZZHPUQpNoE2ElcZ4BGo1KoyGWQdU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Li5SOVJCTokOuj9SZS8Sf7KvBERcuQ4QVflA4rH5SoLZFOaGMs58/nA0WVEG4+bK82hUKqUECWiy89zLAer2go9QkiPx5jzo3g94DB/azTCi4G+CXKd2k9Lx4MMPn8hltAt4UtCiqi0h7vDPihaH/5SeTVxp9fvabGHJl4kPB9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-827bc69f686so12294673a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791914582; x=1792519382;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Zek/EPZ9HE1cSizXza9nv42c+sGH6P6o57/NP4cOt3A=;
        b=laKrlyaD/QoypOjVOQky8BIYcNEvim1eRnpVIZSLl2p7PGVfkrAYhIqace38recQGu
         PmUcm93LDZ+aoU9YzLf8L5LUockeYwltfVCofPW3FoNUAjuCRIxRdx12OcSeR7aOkJYu
         QBHEFCX9mOkOaweoewDgI9eqsCYqQX1VE2pUvm8tBtUtoxJHpihzCJ5zEWanhGTRO1Jr
         L1WxXMt92G0Gorv0BvVTFakr8c/VTpfzurUbhRmglgEgJDgX9CVee6ROLMV+CGBHtSAM
         HLd3V7wQ+7E0d4WOb77MlmYT2mVKRGk+/f/sySMWc+Zy26wuUVsO8XwOIz+G6YbQpN4n
         N0yQ==
X-Gm-Message-State: AFq9FYKp4BUyG8KlDqK9xlMhVIM1fgHeyk0gKVuS9s1GSdeVawtsYFJS
	gDSrMIJwyiblV8jHVTZLPU56N0jAY+nD+CGJuI97jFhrIu8xG/tRwoulDhvFAq3TAYZf0VUAvnr
	zQXIMAzRX52QeRKVXrXia3xKii8yZAE3XdxRXH3TDvMJVj3dpcPe27TgjSPE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6905:b0:4f5:1b84:8cd3 with SMTP id
 5614622812f47-50b60e559d8mr10129612b6e.24.1791914582105; Tue, 13 Oct 2026
 11:03:02 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:03:02 -0700
In-Reply-To: <CAEfrx+DqRvMSCcRrP1Qkp8QKp6R+_MKSP1yc2HYbYBb1_PT76w@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ace7256.0e5b5d80.2c029c.06e0.GAE@google.com>
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
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10da523e580000

