Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968430;
	b=WA+AGi5XpATCcoY+ApDA0KiYz7SUGcm6zpM3/zG6hTeSYn7Q08Ar8bThpKQGX++rF5nw
	 AmdkCo0K6r2M160eoBHeOUnV00eGY89hfUDA7AeOe8N+UtrPDOoN5snQIAUKcnRVQNEoH
	 eNgxaOHWkmPg6Wp5sQ7Qo0HHX5bN6XKxA0rogX3/seoTcZ5TrydSU3JEp7EXkL3w3Atgp
	 ruJDp2jRPjA+pAoozcR7MxP1mSZa1ChjDq8Np/MjSzwrLfUaxSO/3h94S3rTuDOVtVNOQ
	 gRnUGjcHVJaVUWaNO93GKPpuwqJDQEyVAWKcoa/QQ+wiJwdUAZX9orkNuTJal5sUZ5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968430;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=31zJHAipSlhPMGedMX5ynsYIkiuZ+8oMTFm3jTUaEqE=;
	b=RvDcKNX3lel0ndbGyTw70Yho3VUmSSagXSaS+mi96cMYfKh6Z3KZPlLwYssW/tgWUXEq
	 CUS5idA82hkEKwRiAReclR5U3dOByyyz045QcIdlpKy5NPmnjT8vG/It5b6wmKcWcrEoe
	 TEWeUamMvb66by6UGSLCGwVhS50llWliif/PJuAf4X/1iHWWU7eZ4TQ1BHile+W2vDELm
	 lOk0seX99TC6prLHlvlqO4f2j2w5PBaG1KHarT+augmex4m3QaczPu0lDVUNJcyOeeDXk
	 IcyEEWnz+ILgsDXuqXObeAjo9OjiYlMEnQbRDhen+1OPTtTbPRfmOIadMFju7kofViA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6023606D804
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6023606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-5641cd2cc13so560296b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968429; x=1794573229;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31zJHAipSlhPMGedMX5ynsYIkiuZ+8oMTFm3jTUaEqE=;
        b=ATKZqFXQ3/HChtV/2l7I3K7S4LM8hutIaOtAfCrmNYH7Dt7eBHJdIOQn7iNMA0ihCr
         zAsrF17AUMDRMMEGn8K8jb+OannpDKcq4HJip213lc5NapD60tZ6QiPg14aI3onRwi/F
         v9XSC2anGbrxrqr5pOjNOdwXoLeJC2EZB4/cT+MXLBmpbqmM2ON9uylffC8dpNQOTl/8
         BzdSNTQQm1oIFSQOvn124MGL5+YdkwA/OKRHLFrHnpUgQ2Aq47QwwfJfr7TrAMy6J8Ea
         0TB+3B5LRPWvVRgyEna6v/MDhOpRl2NUfoQLhjDIXiIQYwh5Mu+deQ9TXgVwRQ01Hdhn
         zWKQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpD8ZIRezVJh/81CtmjbLZR+ip4KpbiTrfQ2db7lWr6q9B6lM50sO4qU0KhF9WKt89mA57IouqST/MA/k=@vger.kernel.org
X-Gm-Message-State: APuU4Z+R8vRGjiI0B3oiZpzb63sqA41VisUMmOerFiD4kmMFP5wvXXQJ
	2qVHNbYPDXI/xzWLDcg4//Gl6xuTJTnnX+OQnTP9Bjx14fd9QJwqwOpXji4IYTuNYT/ew7aKCzu
	pc4wdu9pkCbzUH4GFTymwZLLVuej6eJtKpX5qvSMaVWqQv1Hhg55SMQfqZMc=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3ea:b0:55c:836:597e with SMTP id
 5614622812f47-567e14d6d1cmr1493728b6e.31.1793968428769; Fri, 06 Nov 2026
 04:33:48 -0800 (PST)
Date: Fri, 06 Nov 2026 04:33:48 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aedc92c.a716b02e.a4a62.0002.GAE@google.com>
Subject: [syzbot] Monthly hfs report (Nov 2026)
From: syzbot <syzbot+list1e64672c7831f2f46cc6@syzkaller.appspotmail.com>
To: frank.li@vivo.com, glaubitz@physik.fu-berlin.de, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	slava@dubeyko.com, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello hfs maintainers/developers,

This is a 31-day syzbot report for the hfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/hfs

During the period, 0 new issues were detected and 0 were fixed.
In total, 17 issues are still open and 42 have already been fixed.
There is also 1 low-priority issue.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 11662   Yes   WARNING in hfs_bnode_create
                  https://syzkaller.appspot.com/bug?extid=a19ca73b21fe8bc69101
<2> 8181    Yes   possible deadlock in hfs_find_init (2)
                  https://syzkaller.appspot.com/bug?extid=e390d66dda462b51fde1
<3> 1125    Yes   possible deadlock in hfsplus_find_init
                  https://syzkaller.appspot.com/bug?extid=f8ce6c197125ab9d72ce
<4> 6122    Yes   possible deadlock in hfs_extend_file (3)
                  https://syzkaller.appspot.com/bug?extid=2a62f58f1a4951a549bb
<5> 1895    Yes   KMSAN: uninit-value in hfsplus_rename_cat
                  https://syzkaller.appspot.com/bug?extid=93f4402297a457fc6895
<6> 1121    Yes   possible deadlock in hfsplus_file_extend (2)
                  https://syzkaller.appspot.com/bug?extid=4cba2fd444e9a16ae758

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
