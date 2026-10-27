Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793116564;
	b=5gJOdXqwe0nzlzb7hWVSUZYkxYi6MDcQUXlBPAImduk87+veIws340rCsB3CJ5T84sNB
	 2bTM0AWjT2GcuH2DoHLREgmMULbjCg52NkmHglNA7QwAZwGtOhYD7dr4SFANKpKucSXnc
	 TbYoTX4vm4yzjc8K1L4e8hP634qqpkkbxCsMg396gzBPiInBy0h+GBp9jgmwddYxgkEEk
	 5vK5vqqtIn9at0N/7K7//1zSCpZZGrl7tE2NCQ2SqXxUlLskh4VN3UgIPqThvBWk8NG5W
	 4W9vChgnDWA+8S3Exs3kTPFNZThFujQqs5cgX5XuYtU0q4yg5a29qWr43BehwVvcp4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793116564;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=89El1rV7/cds/q2zgUXroWN26U3zg9xH5QgWcCPmMes=;
	b=18he8wepbkM7O+bPnzm5kL+iVPWSpPySXkc4gaVFuugj0gzw2l/EiIyf6GnXSdNqvR5W
	 ePaDjRbftdXQwUVoqwkHPMnJP3gh0nldAqQzCDk91F7bj7u0DJxNngmboEVWTJMsA9/47
	 C1MqErRSclwSratJ7q6smF1Y1tACN8L+lRufLnSy/GMxeZsu4bYqF8ZtwnsfBpvXOJYqY
	 sBcGtODu6gAUEUClbjGsBucaDSzbFZdqc8k4EBSQyEaBuo4nPLoxamKBjQCawpR1+8j3m
	 yZXnTzA+bKbkxtHwfZta0QYLqb+aMJhvvvhQxrszmvQJqNrWq41TZAwOEpsHK8JpYkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.198
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5016B606A31B
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:56:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5016B606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4f4612a1a5cso1336165b6e.0
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 08:56:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793116562; x=1793721362;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=89El1rV7/cds/q2zgUXroWN26U3zg9xH5QgWcCPmMes=;
        b=0sko9/1tz+YcccKAAdvUjAOzpiNMhmyb3J/hGKy90UFqWIIA2MflnTKA181kZ683SW
         bAQfUimAM7UWSfPBmHWuO7zi2hJcColV+GTO3uQKiqZFO2UuisHNDNbbDKvyqvJWzKxN
         ZTeZY0ClZ/97qqibgh3TbCL4H16NO0GBTpw3yWnTm7NrWr+gnc2yaqkqrbl1eZKv0iIS
         8mB1S8nM4Xy3hkOplDITZ1fYx6kC834nweR1aWyJB94HY87ktkoX+8cZx4M+E2WqGJog
         tTvUDAJqANQwk99avN7qlnpmfCGXwxDTEnxH/hfnhlkQXgJ2zH8zVcm5Xddn0sunSJqL
         Juhg==
X-Forwarded-Encrypted: i=1; AKwUvBylSr1FW6cs7C8+gYASjt/LGAwu+kkR3xEYd3gO9XFSBH1fZOrfE1LzBZzxEURXBOjb1R/ML+ZlMgkcFVQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBzBy87kb7jEbw04TozfIu/VKAZS8RGqU5/85mFt4+GO0d1B5k
	q/8Uc7sspE+nw3aL81Ret8rIPUlwt4b016ycaFCgemmJC/vhgmDsTV/62aDJ43qJ8NFn3IdNcl5
	/1mSZANqVcANMLVSC7igyU354etDNIgRCfabdFz3+YBtuHNkyyzwCu0iY9Ak=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:179b:b0:4c5:38f1:80cf with SMTP id
 5614622812f47-55f7ef393a4mr1749334b6e.21.1793116562562; Tue, 27 Oct 2026
 08:56:02 -0700 (PDT)
Date: Tue, 27 Oct 2026 08:56:02 -0700
In-Reply-To: <6a81cb33.9ebadd4d.20b15e.0018.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0c992.768774f5.3237ab.0019.GAE@google.com>
Subject: Re: [syzbot] [udf?] WARNING in udf_map_block
From: syzbot <syzbot+de2fef01040748da6822@syzkaller.appspotmail.com>
To: golasch18@web.de, jack@suse.com, jack@suse.cz, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has bisected this issue to:

commit 62333e480d12ab186f89fe2725b372d12f72d5eb
Author: Jan Kara <jack@suse.cz>
Date:   Thu Jul 30 10:42:29 2026 +0000

    udf: Fix data loss when converting inline inodes to out of line

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1422482d580000
start commit:   d135ab453a74 Merge tag 'backlight-next-7.4' of git://git.k..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1622482d580000
console output: https://syzkaller.appspot.com/x/log.txt?x=1222482d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b990d88b41ee3220
dashboard link: https://syzkaller.appspot.com/bug?extid=de2fef01040748da6822
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=16c93721580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16146469580000

Reported-by: syzbot+de2fef01040748da6822@syzkaller.appspotmail.com
Fixes: 62333e480d12 ("udf: Fix data loss when converting inline inodes to out of line")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
