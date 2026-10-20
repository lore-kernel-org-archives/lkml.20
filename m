Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461183;
	b=PjRpRDUv++Z6f09wUQNvNq2d1tWUOQRehFNxMs8qOaFw7Db6BbYmfksmgHoo58eWd3Eq
	 26EofnE3DNetJMc9/wUGpWBA7VvEdBhjFZjTLXNqDSLcyZ2f/y4W3ZHERBrs0UW35ZDzt
	 AXmAhLi6x4nFbF6HlDqkv1ZnlAkXeI/23CggIdGiex2h/oEnKDKshKIue2BjQKrfaudtq
	 x74pZkNRpoip+IWRpBvf7+6yORwl7Czk0JY/wZUempGYLQpCY8p0y+Fqyi5KVIg94oJ4V
	 oq9EvjC5vxGBxhT0lNi00BeBOwVO7XVTvR87Pyjd8BAqZT0RaUZhNbDrCTHDINfhJdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461183;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type:Content-Transfer-Encoding;
	bh=rFy/QZ14ELOMSpG9fm9KMVSYzO1uxocyU43xGQiUCak=;
	b=RgRD0h3tEaVi+CpTMJe/JuWzQlJ8uQ5o9jRbSOcqluKLRaB/EH8FmLzYPvcJnzUShmcS
	 pVM//FYRwLWQ6Fb6z/oj3OjMG1iTGnc434nFpl42m4w+iihLq2N9wkQZ5Vlq+HPfMAw3c
	 pu0HlArA0vgRNbvx5gaWr6hAvLupwlb1j16Oq+2n1jL5oHT4v0VUJtJtba79pdZezvpoR
	 HifXnatRHxh0sshvPd71PP8YBj10sCWEHApXTCsP9VltoRcymmc2dtXtrW22iJ0GK20Ks
	 UJ5cBgjl5/cwqXMjhaCrcBiCakjLsmVtOWBSnY7nf7U+QRGC7I4hvEBwdVGqPTE6KZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36245606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 01:53:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36245606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4dc57e2a3f2so4293698b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 18:53:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461182; x=1793065982;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rFy/QZ14ELOMSpG9fm9KMVSYzO1uxocyU43xGQiUCak=;
        b=Del7UWII0HgZ0xHqF1aEMlBCNRntwGJVEvXO1JrydciCy2/O83CvWPE+tlXJ+R7b7y
         2RbPbvL6N98rn/sSNHwxH8T+YXbpW8gyHATueSBsvF3HoOWIZ1W6Ea2uoDLiwXdZG9Wn
         i5oSwS2xtTVeekAUfblq/ePqm5blznxdrA1H3ULNGiiDHs2yLjdJbQ0ZhbHGzhGDM58R
         XSTAIwy8e4AMdPDFv7saq/MYbJM7KH8ajgWlChonM4NQadap0EGhEh54AO5zWmQN/oTy
         dwHY13xhgwZ0hyPalnoEfs2/I8ggiDI2S+GvpUswjMT2/7nM8o1uC63uyUA2ja8F+W1f
         y6yg==
X-Forwarded-Encrypted: i=1; AKwUvBwjj1I2zgFSwZODQutn2imULjDUyBKlPCe16wzUlcYiKWJaFg1vC73Tql6pCPntqR9TQD/qrTaIr7GngY4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI2D2m3z9tx33mytCzeqMjh7TOmGXpdcK0h74jIVk3kpk0jp1w8
	i+nJTerug21M6i1lq4LpvZcswBwY/dGV+IRGxXDJFeldjjisMpwRDdQUnYBd1N2T5t2suG0+ZT/
	zfWqHtI6FS6mEwo8+GwKP599OH8j+tnrtUXPqAoCwuBQoyv6IN58Ai7ophro=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6809:2d6:10b0:53d:55e9:246e with SMTP id
 5614622812f47-53d55e92b33mr5042655b6e.61.1792461182181; Mon, 19 Oct 2026
 18:53:02 -0700 (PDT)
Date: Mon, 19 Oct 2026 18:53:02 -0700
In-Reply-To: <20261020004942.859-1-hdanton@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad6c97e.b5bd089a.6b57.0084.GAE@google.com>
Subject: Re: [syzbot] [x25?] possible deadlock in lapb_data_received
From: syzbot <syzbot+059a2795ad4cff2a2695@syzkaller.appspotmail.com>
To: hdanton@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/gi=
t/bpf/bpf-next.git on commit 2c7935600733: failed to run ["git" "-c" "core.=
hooksPath=3D/dev/null" "fetch" "--force" "--tags" "6060cd5886450a3d46976587=
e85235c829a76ccf"]: exit status 128


Tested on:

commit:         [unknown=20
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.=
git 2c7935600733
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D964a8fc052e56fe=
5
dashboard link: https://syzkaller.appspot.com/bug?extid=3D059a2795ad4cff2a2=
695
compiler:      =20
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D15662e7f9800=
00

