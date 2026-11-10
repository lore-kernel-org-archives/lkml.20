Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794348543;
	b=gUyDa88Vd4eYmHrMFxut8STTHbUoVmM3qdYfwyrOHpitUy7JHIdp61WeskACbZ7QASID
	 C3Oy4+YIGWPyhelhF9SbVNh5Z8V9RzeJK5hrjumJ7sDQ2/JXzVL1y6EgE9lT3RwIUj/fM
	 PhraNfCM1ZxyZJIF8Fhl3qs9sMSsPz3o67gS//2KgojurCk0LUfbMc3eMLqBbKm/VoBN4
	 KHvvTzeyMp93UEEvsOsDyOUSlrJtfSvnlKYO+w2ogBnb5B0KU+fOhUopEOnm1rNJQXMAi
	 N8R1zosvYDJ7kueHA9JOjRefHqbVKdraYeuVu1upL70TT4mQwNSri0gwrfVgL0AukLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794348543;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=+MbWvT9ZFZC+NlKEH6aYAcQTwkSEA+7/LJ3LY94jKOE=;
	b=fo66BqUZWGI8s1OiWlkYQIxfQddjAeF8cAM9xkR0IDOhQjiqwK3V2mh/g59WVYI36NpP
	 zpfoNhs7r8JFsR31YD1U2wi5SCvmUDUQZdy/dhiok9dJWIVdtGdTRTgj8lva+sVXp4MhI
	 u1oi9cdHYteGU9/53RYDIJZb9tNbohHubc6EgR6JcsQ1+ySXnuJB5mzoWOryod6wlSxUO
	 IR74gPN0fpM0At3CnZyQE3qa4ogx2rgvmyEY91LnUxfo5PtKecD7+shbUcwckLlM1s/wh
	 vYzkFBkcb94XO5QhR7gUAo/dOreEDNKyYMnbW4sACSFHUdgJA2jcaFIwXJofogzXqsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A3660A260A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 22:09:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42A3660A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so3077194b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 14:09:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794348542; x=1794953342;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+MbWvT9ZFZC+NlKEH6aYAcQTwkSEA+7/LJ3LY94jKOE=;
        b=eDrHEkToaj39ERnTHkfwTkk2FXOCQ+GzeVuotjJonqtwl9B0CNdBTy9OijjBO1FUIK
         WbWqJk+JjCx5BV5alHVIMermW6t/xmVUtkOquQVL56M8zDa8IkTiRtE4/Adp703AyIbk
         ObWwxJEjp/Ut0UQOQac+AgUAjYLHzLyOXllnMOvv9kjV4cXGV/t27W0ixngWT4Mq8Lkx
         ujpHuwgj/uNkqRusGpBf6VyNXiRgft3Tr/ADNX2GhCJP3ENd7VF3t41IXvmKT2AaOle6
         fHKm396WLMqxxVigF1heGEzbNGCLPxspaszNLDWUSyuVq1KZsGPb842JLE2VZ0etGUQM
         UTwg==
X-Gm-Message-State: APuU4Z8Z2gdmxMDD/cRxTs+4l6pppA4sDAkzm5LDQK7/DAdb3B7plZc4
	X4dJ6ASwPD+Z2B9uSR/8HfshK2INJIWNrb3t2fMXdngg/okI0RvXKLLM9Vap5iOvwE4fn3MMJVE
	EDLDt/f6Rvh31ivMLUHLr7q+bbtn3jiYjCL7mPQ7IiFWWTegkqsVy6brjsqc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1520:b0:4f1:7cd5:8e0b with SMTP id
 5614622812f47-56b968d6c42mr306990b6e.22.1794348542251; Tue, 10 Nov 2026
 14:09:02 -0800 (PST)
Date: Tue, 10 Nov 2026 14:09:02 -0800
In-Reply-To: <CAO7_G+w-YoXKa7uTPZgu8JK=zvVOigzOjewNu=kZMZvGTxh8Jw@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af395fe.ebcfa7c9.2cf3f4.0089.GAE@google.com>
Subject: Re: [syzbot] [block?] BUG: unable to handle kernel paging request in blk_mq_complete_request_remote
From: syzbot <syzbot+2e3bf0bd49acd9b21d4b@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, nenkov2004@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to checkout kernel repo git://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git on commit 58c1eb84e97701c583605ba2fd553b69afba2245: fa=
iled to run ["git" "-c" "core.hooksPath=3D/dev/null" "fetch" "--force" "--t=
ags" "f569e972c8e9057ee9c286220c83a480ebf30cc5" "58c1eb84e97701c583605ba2fd=
553b69afba2245"]: exit status 128


Tested on:

commit:         [unknown=20
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linu=
x.git 58c1eb84e97701c583605ba2fd553b69afba2245
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da58b6b4d667e7a6=
1
dashboard link: https://syzkaller.appspot.com/bug?extid=3D2e3bf0bd49acd9b21=
d4b
compiler:      =20
userspace arch: arm64
patch:          https://syzkaller.appspot.com/x/patch.diff?x=3D15a7b1fd5800=
00

