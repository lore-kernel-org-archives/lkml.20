Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910825;
	b=faRqDjwpPIOnd3QBOahnSLxC/nN+skv+D48rZCiwibpOX1JYTzJ9PtijTjwiOkQu5AIo
	 zT4CmkvDVPfRk+vJWTCikiKzQMces0mzMu1Rgt9qfV/tAVAvGwR0C/5F3Z1sN1oTfFgDe
	 90DKZhkQzRWFhtODij1NZSfV/ijF6JLuJ3++j4E31ky0PV0XNrpReYtvcdYV3zWWORcxo
	 qjHIW6XxVu03iMhEUumJVeEmll81yKp3JslypNwewDcr72hEp9+fx3u5gskLDHNRs1Lnd
	 gDyobWMhnttCbKZYcFZ2WF48JbKVns3LwSkZCSopvMRQjPrehZMV9RbCDbG+iQUZFWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910825;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=AooaoAilJ+hgjnSAd1rqqNaAAjXN6UUVw/jzA7syHSc=;
	b=bM6VwPtHxWzCpLTlNCLxN24qFZHuF2RGg487Fv/gG+3N50TulFZ2KS2wsbnHlHct5USh
	 /n24pru2Mz3LaQkm5EwUKNQ83zAG/t99O46fQ4p3623VSxrTRpJD2fdbjlb1IKvGuRE/e
	 TnGlIFnQ4obvP/0Gmkheq2F9rpQswgz3LjKHg4yRYfIc8Yqd1n3kRyxaVrpAwOECV8UB1
	 CjRkgtNbDo5/N1aXI53ViFWoEdcA/Htpat+C+UFF6uV9UJ0ByU1PTfW5bxPkeBic104/E
	 V/SInrm+C5xSb0rU+aMfmpBK6bfTFVjoHFAjGpXgS49o+hugoYHuYRyGgSNtlMrePCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA5606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:33:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19EA5606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-851f7cdfaefso1863054a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:33:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910824; x=1794515624;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AooaoAilJ+hgjnSAd1rqqNaAAjXN6UUVw/jzA7syHSc=;
        b=s5uPPbRvBQeluy1mfYiHVjQVAFcvEYMYj4ZnswrsuCnaNAnM6h/SI8omwgTe3uggcp
         8mcrkECpVoZ4J9axl8BeQeAJoTrAZhqwBErOfU/CRIRe45gJkxpX1KEQpcfoFetSBQrz
         j7Ckr+No2UXM1xMiAfPvf/4caNfHFEBO8mxMrY7CplTJ1Go6v0euX4EHLEJV0tTdrMNk
         kibMM/KO/WV6lw10YNS9tGt4xQEpV6RpMTlkeUwbeSAHPb+j5Lsr5ZFoW1hRC+xaUaYk
         zgd/U4uLYYe6voyCU3ecY6jheXCCJEoP4ge7R690mn18O6VsGvUNNI7z57RIASIVf3rQ
         0xnw==
X-Forwarded-Encrypted: i=1; AKwUvBzE+IF9C4zrdpMDNFDJzEJ4v8UF8BQnvcn5h2MdtlukyEg/ryrHVGPvTcKxiUwcKOq8jMuUCPNgOuN2ZbQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8F2Vm4378dDq5QJP5UNYN2p2UjAr5oKSxlc2sbGVO5Ac8SrSzH
	C14ct5M3cEt6rDLef1qiEto88nJkdGiEbI0+FcDZQmBEkNoUr9H44unLJ3HSrMi+9tbJp5UvFi/
	8hsMuATJl5z3oQHlug8GYWVX93fEUw5XxVvRzbn9jrzdPBQXymgD70ZoHfcw=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f61:b0:4c4:a240:9c3a with SMTP id
 5614622812f47-567e0993ebcmr356219b6e.4.1793910824203; Thu, 05 Nov 2026
 12:33:44 -0800 (PST)
Date: Thu, 05 Nov 2026 12:33:44 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aece828.ae8774f5.3905c1.0000.GAE@google.com>
Subject: [syzbot] Monthly greybus report (Nov 2026)
From: syzbot <syzbot+list4050b078885043dc999b@syzkaller.appspotmail.com>
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello greybus maintainers/developers,

This is a 31-day syzbot report for the greybus subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/greybus

During the period, 3 new issues were detected and 0 were fixed.
In total, 4 issues are still open.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 233     Yes   KASAN: slab-out-of-bounds Write in gb_operation_message_alloc
                  https://syzkaller.appspot.com/bug?extid=2fd6aefc361af86911d5
<2> 119     Yes   WARNING: ODEBUG bug in gb_operation_put
                  https://syzkaller.appspot.com/bug?extid=61464b62b688791cc24c
<3> 40      Yes   WARNING: ODEBUG bug in gb_operation_sync_timeout
                  https://syzkaller.appspot.com/bug?extid=a2e50fb40695811c2dab

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
