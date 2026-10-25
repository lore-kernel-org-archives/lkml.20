Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792931607;
	b=3HjV358QyOp9GRd3yVYXO5/h6Pbbg1+w+fGd2DYm2npJS2gwC7v+u8ekbK9C7V1imuGj
	 XRbUFZMwJxMRNpmIKgRv2CeIVjrRh4Jahm2/NGHw0deFyMd/5F4HOUXwMPUtN0LhO71ip
	 /+Ax8kRfXeR0DLHe3tLJedqpukScBtsn016ghBEpPcq+YgVJZJoVh7xhgtuJdI67rkpGt
	 Te8yG/ThKbDeX3i2uqJhIt4Msti4MK610Ra6M/oVclvvPP0obXlyI9SR4Rnxlhn94xp8y
	 psWgZIEATWYsZk0tJhkdJvm8RDRXSMqnaCyTJGKGpcVCtWISOmTsxKE1ErDSx+UCMQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792931607;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=kVBzGFtNCTUSDocuvH1j5E27S8HzPs9e8Kt49P7lnhQ=;
	b=QbTExjW8AybIwi+bZmofXLU9I/fGT/snFvSVh9xfVzGz4Cmle838gSFVvv3/y1wVssJa
	 BveCMgf29EUVmRElDzHkYB664dwdS/yP9OHJ4jRr7COam7WkbWA7LN0DHdtj2YnsVsRMf
	 FcuCPELrjiXQ05WmAL096VMeEHWvysIq+dqJ8XU9R0hNFyxoam18BK6XC3bTJpWB24zVI
	 w71yuI0vZpJnJeHi1aQdpH3Fqpe7CWbZ8PHNGYF3pdVWcJDtMbc109xP9hoKX4wp9Pj9F
	 YHPP6ZbiNgA8OMLZpESrn20c5EpY9EKl+ReNwDoFl5GOE5PeHVaiVWjLLi0ij+Bb83w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.71
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AD7606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:33:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1AD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-8468290b866so3576288a34.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792931606; x=1793536406;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kVBzGFtNCTUSDocuvH1j5E27S8HzPs9e8Kt49P7lnhQ=;
        b=Z/nmAR5Xa3k1t93hkwwHVEijhDCrPz3Ig90JPWcCEd/Hjuz2F26Vt7Pp2U1Xy3PjTn
         pk8M9Gbg/fKjChvH1cfUyZRwhTMmWqwSRnpykno+YaNJ1BU0vw5Bn/1vSEbqZFWunbjc
         nGueOwu29+ZlWZ4cc4FOTpPJcvZxaPuGayUeGtcNtzM3uQ8+7LtUAlbV7xHQe6tKUsO+
         yZvh5UG6XvS6X5knPz+d19jGvn2fKPQXCeVcOhP7EsSA/MxXeyTiZPL6oc+1mUaaCcc2
         ZAq0xHpiNBXxpVFrRqUgTB/6v3o5+mb+rhlUczF8QP/tQd/zTgfQMc2JN6RaSOJ2kTkk
         CfCw==
X-Forwarded-Encrypted: i=1; AKwUvBz8Up9WNXYFW02nHM9m+2DXWFqLT5/XaeHLpsWOnH+4nyG3jcLFv99ZYE6EfRh0KFkk2QNAH5J1lproxlc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSGv0r6z0KSf/a+f4tqX5NQclPDRXRHwb7MgkEoMa3uSDhTedJ
	eDGHtasdJ9Aoef5z2AMGiBw1cwt2dhMqydFMUIRP/5vM32kHXPcwgosQwqioew/3W6nZtTuhDED
	Sr+UUGM5WtrVm7mz6HE/+CteTkNpxQEBvO8zyNv3cbL10Is+1W2Wa7kLUTyU=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4f06:b0:549:572c:fd42 with SMTP id
 5614622812f47-55c0031b091mr2010500b6e.47.1792931605841; Sun, 25 Oct 2026
 05:33:25 -0700 (PDT)
Date: Sun, 25 Oct 2026 05:33:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6addf715.67317f00.38c4bc.0080.GAE@google.com>
Subject: [syzbot] Monthly input report (Oct 2026)
From: syzbot <syzbot+list4c580c10329f11ac634c@syzkaller.appspotmail.com>
To: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello input maintainers/developers,

This is a 31-day syzbot report for the input subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/input

During the period, 3 new issues were detected and 3 were fixed.
In total, 32 issues are still open and 70 have already been fixed.
There are also 3 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 1516    Yes   KASAN: slab-out-of-bounds Read in mcp2221_raw_event (2)
                  https://syzkaller.appspot.com/bug?extid=1018672fe70298606e5f
<2> 873     Yes   WARNING: ODEBUG bug in corsair_remove
                  https://syzkaller.appspot.com/bug?extid=0a031a76585d1c7e737d
<3> 368     Yes   possible deadlock in __kernfs_remove (3)
                  https://syzkaller.appspot.com/bug?extid=1075f6dc93f398c1857e
<4> 42      Yes   INFO: task hung in devres_release_group (2)
                  https://syzkaller.appspot.com/bug?extid=d789904ff97c2f3dac88
<5> 28      Yes   INFO: task hung in __input_unregister_device (5)
                  https://syzkaller.appspot.com/bug?extid=78e2288f58b881ed3c45
<6> 12      No    KASAN: slab-use-after-free Read in k90_backlight_work
                  https://syzkaller.appspot.com/bug?extid=abcedffc9201f2bb66c2
<7> 2       Yes   memory leak in __usbhid_submit_report (2)
                  https://syzkaller.appspot.com/bug?extid=e2c057ea576d2644e2be

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
