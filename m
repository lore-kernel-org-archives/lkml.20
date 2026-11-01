Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793524324;
	b=lffE46qV0hIha3FxgpqgyoQq8CCgLLUm24yKnGUKCMnWSr8TRcvkLPROKUp3MkUcJThK
	 4fthV0m6C7kfsdmmsKuFP7wAt2pV6g+7PuvowrOIJZF8/eNGKyTNMcyFclOc6wahcQ1p3
	 nP4ZQxYjsiqclApJ/7R0TvRA4dqrO1T1VSXReUqiQprivPKbgEluwXKcJJcUeozp6l/rF
	 rZVtqjwdbk2bnYC57mysUTM73RX4lhSZPNdodTsI204b6i1zy4w0AzPlGGo1chHJVLBnJ
	 CJ5uv2KA92LNnUYrpXuCf08J880ggnDfTPZz7yY15kGKdqAQBdcsAFY7B1AO3g4zTgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793524324;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=B4jYGvBjrkkRPEzGAwhU8lHH1H2le5DfdgmQdfjw784=;
	b=Gt7C5s2iCkEAPyl/2bhsMmU5eEyUtU/CZ+DT2yHfLMlt6+1yA8CfxdGYubHiqo+CXZxY
	 gXtMgrL2yn8EUzr+/ww/eGbYWDrEYV3c+qrMU7ayr3TLqnErTmGg7vapaKSb7PAIO51Xd
	 k9gxPAw/Z0YvW0wI1cS3YFk5pQch7n8SjSr/7T5AocS4r1TxxDogT92VU7qCMborREZuz
	 mXavAHIouTIF2tb9Mvv4rYbzLmNi7m+y1xdk2GiIYpKL9Oyvmedzt2biNBGn/KZLfTHGz
	 M/GAvbETpGu2knuvhB0qa7PkdazsFkdWUi+8AV/i7sKV6PiMeXgvoTn9jHToirBVYVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BE7606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 09:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BE7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8468290b866so3069054a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 01:12:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793524323; x=1794129123;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B4jYGvBjrkkRPEzGAwhU8lHH1H2le5DfdgmQdfjw784=;
        b=L4tD1uZfWPe+XQNnVHmSWZ1pbS0PGBO9wL+bCJxomaR+fxMxorEbbebGgHqykjiVTx
         76gw49w6PXwS9zprWWmw2uU/P/4wI357r+KIpwN0dVRXJEz1krwlmnqx5qaeua5WTkqE
         SIL2Pguh76rrzjojpUnMaC/5aYFe1O2o8+oXMh2okwRLAKLm6cNIaqpp0/3HIW4lu6DL
         qGYG6BsJtLurzmxoeJSM7ZMOf8BG5+mPIFWjcdc7gMp9W+3yXTn6y7ydUO2Nrf0zMY2a
         Mpvl/Q+R+XZs9lwnrktJgwslMLuThHVP+f0/lnueFRjlVxDOP1Ed3+JYKkDdYCyP5X0g
         j1ZQ==
X-Gm-Message-State: AFq9FYKWDmPPC57lguF5H6T2kio8IYQljlaRtk1i79+mmiVdhe2yx2rW
	dDL5A9Stbw++3mxXdaOiJxF5MieCzOLIxF0mK0x74JD8W/O0+tQ04khtLwuYjct154IAxzlm43w
	Z7BzbZiNELNx0lDaBvBTSgO4EtWlVqojtC6MXOeJ48Rmh6nqEFoAJE1k5UoI=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:16a6:b0:4cb:f21c:a79f with SMTP id
 5614622812f47-5640df8d97bmr4407253b6e.39.1793524323227; Sun, 01 Nov 2026
 01:12:03 -0800 (PST)
Date: Sun, 01 Nov 2026 01:12:03 -0800
In-Reply-To: <20261101083427.1241563-1-skalpesh942@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae70263.2ce51036.253fae.0002.GAE@google.com>
Subject: Re: [syzbot] [wpan?] general protection fault in ieee802154_llsec_dump_table
 (2)
From: syzbot <syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, skalpesh942@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com
Tested-by: syzbot+9ea34da5ca6100593c90@syzkaller.appspotmail.com

Tested on:

commit:         cbbddb6b Merge tag 'power-utilities-2026.10.31' of git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12cf4959580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=37ec6334ca3b8e94
dashboard link: https://syzkaller.appspot.com/bug?extid=9ea34da5ca6100593c90
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=135ff981580000

Note: testing is done by a robot and is best-effort only.
