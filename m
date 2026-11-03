Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680440;
	b=WjKuw/qM9G+qaZAens3A1jyFRmt0ARc+nLF3zCXdEyFsfWVKztTZ98o/aTklfWJ0yMSW
	 jJdQpnq2O5mgVH65slteuc4jNZVHlO4DbAPDcPJdngRCNNghRq+WmPBkAIkLb3C5CuB3y
	 xBh4rp6otWT+x1RPauzzHyWChTq/+Zcg1Fxqy4Hv2r6rt4yX5rv+rzriFEN5L70Mvi90o
	 /NLl+ESZYRU4zNsFDIhlLpKKlPuWWdgYVb2dJy3kKHF0nu3w70ggLkGZhsAxQizikcV87
	 JdczX813jbINFV5ESsoZROK1VtOJWTb3a6TaoZFLbABAc21vN8WNZHYjn1qYnfVFaCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680440;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=4tPs4mp2bvwQdRd4sbq6CaL9zCSxrf0L6Yrn8je4uH4=;
	b=yljTM7xFTmaE+Rzj3tZ1D6SrvllhF9uM3gpSVF3RXxrJYFSvot0ORVWn4YZRreaYcCoA
	 9aX9/Qeh5Jzz4hSaF6LUyAATmA9JKmecjyFwJ81QUBW8MMPkv9mpoWc0yYfGgJMJVD+pZ
	 K4dRGOnPLu9TxppDZWnQFBOX8IL5tOva4AWHVQ4Fwldi2ujkgiG1WY80o41ikBAR7Hhnr
	 AOH0okZpQ2EK85eZ91oknRPcpaqg0rgL6TjpZKQ5NxKJsLDJ6tPcT71xw+Lt4Ap2ZKjjr
	 UTAw8qMm6CuqKj/J+WCGWBlrASY1kZPgklayj8uHBgAaaVdXrLrdZoIKsBfXAlvdRlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8BFF606A32D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 04:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8BFF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-843cf077bf7so5094923a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 20:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680439; x=1794285239;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4tPs4mp2bvwQdRd4sbq6CaL9zCSxrf0L6Yrn8je4uH4=;
        b=PMrOscQeO9AladP+W2IZlXndo0xKZAtJfmRzzVt2BXeqTurTPz/aJuZ+QP4NbHkJ92
         0E6dWjuPl5ILWKZTgb6dnE2kttUXLQHBCbFGhkeaEb7byjg0PIBPDHUgeoBmcBfUFvau
         WKLq8iWZVaLAfZpsWWaQ0ruR205ORBwGKCS2TS0IYLfEATlNJxhq1UNJS8V7beTFlahu
         3CZq4IRpyNpzc+THfHkzFP+1mZJEgicqqNAzguD7KnbSDaymv2b1rsrMmhcYuZ+GT0h8
         2vLGsuGaExl+ElhssUWwu7BQ3eLDNu8//+wg9JwrUfZuFrd1EwYyUMwd4Bp/boOThnr7
         rC1w==
X-Forwarded-Encrypted: i=1; AKwUvBzyu5YIvKcbixubICYbCPZD3hIiwx4GHdRzoN8rhSzgMw5SVg5Aye70Eu/tiURiNL/oO0URzNcSADDW7Ys=@vger.kernel.org
X-Gm-Message-State: AFq9FYL9oi7BYZ8h0FJ687MD9GV7HNXyZLAIu7hMAY7lo16Xzljhn7rI
	GEzshnB2B9V4avivO+4LwHm4MATxT6uJG5Yi+v4+F4PtPMTbRMNoPOZAihmEimp1mRndSIh9q1l
	nb46q/yq29n34xqy15qVwOc8unBI0qgROdoivjJsqyXTALkVxtxBv8cK+/HA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1910:b0:4dc:1374:99ae with SMTP id
 5614622812f47-5640e033037mr9173554b6e.56.1793680438963; Mon, 02 Nov 2026
 20:33:58 -0800 (PST)
Date: Mon, 02 Nov 2026 20:33:58 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae96436.abb90550.19e2c9.0002.GAE@google.com>
Subject: [syzbot] Monthly netfilter report (Nov 2026)
From: syzbot <syzbot+list484d79b18bdec1b120a0@syzkaller.appspotmail.com>
To: fw@strlen.de, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, pablo@netfilter.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello netfilter maintainers/developers,

This is a 31-day syzbot report for the netfilter subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/netfilter

During the period, 1 new issues were detected and 0 were fixed.
In total, 13 issues are still open and 200 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 151     Yes   INFO: rcu detected stall in rescuer_thread (2)
                  https://syzkaller.appspot.com/bug?extid=d5f7a5097c24c7c2dbbb
<2> 7       Yes   INFO: task hung in nf_tables_valid_genid (3)
                  https://syzkaller.appspot.com/bug?extid=83439cb981624bd8d068
<3> 199     Yes   INFO: rcu detected stall in br_handle_frame (6)
                  https://syzkaller.appspot.com/bug?extid=f8850bc3986562f79619
<4> 132     Yes   INFO: task hung in nfnetlink_rcv_msg (5)
                  https://syzkaller.appspot.com/bug?extid=c4b20b80ee6a7a2f5012
<5> 98      No    WARNING in nf_conntrack_cleanup_net_list (2)
                  https://syzkaller.appspot.com/bug?extid=122256c3e2bf6ec9f928

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
