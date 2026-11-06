Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793968429;
	b=OC5jvPaLCCukLrIgvE/mPTdQXZ1BC/FbdIZ8ohaJvPvhBM2esM8uPju9PCUaVVDuZnky
	 6PQ152fK/TLcqo8IIij/vhHWbM/+9FgmC9V1lnhDXuhOrS9T9KIJdjSjZe9A/OppOq+Yv
	 5dPhIaWGftCNfWi6wAoD5u79OqgTvtXergPp5Fh8in8+jPr+Oe6e7VEpgm6c7lUsvxQ2m
	 +HLS/V9eVAoHB4CBWD9m7gmJPNmowo5jzLrRCaOjR3ECELRjM+gUQII8YZOFCEpvbS6kj
	 WtkJrJDlHv5wCJYrjzttGW8Y+BX5nB8sBjh07PlAqeGPlfeVkLlnTzWP13Wlx+q74+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793968429;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=vOuk4MEEMKLZz9SbU5bzBH5xfiLgItoR3reCPXp3778=;
	b=NgmJmIVmiak1N+5kisS7FrCy1NWx8ktcFC4n+fTVXKKnoOdmzP4UtSA1fhKRHDp3QlxB
	 yYB/bFj0227BRY9ooDVAnNT7SX0SEY2M4uOK+33lafzjHj+bOaPNyzAw5J096VKVqXNoS
	 g4EQqqG6eQtuT862ieDyhkXVCROJ1YykgmOgvoGl3SMUV0hd2GwEUXCS3+NVqEvRgIkt/
	 G20GBulMSk32bjU7ZDSfYTZeyUyIA9hH3H9jlCuAWlKV9EOm+36y2o/GhPYDh3TEnzx1m
	 GH+wunjE07bloEwBm7Lguy2x8TH0k18llWzxo5XcNsy1IkVVlwjqb+7u1Njzq+DP3dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE9606A333
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 12:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCE9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-5640a2d9708so601274b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 04:33:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793968428; x=1794573228;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOuk4MEEMKLZz9SbU5bzBH5xfiLgItoR3reCPXp3778=;
        b=0J2x3qdH9vPjvli0VJZgBSefkNwVVpFCy931BORCC1OHxQg4xSDLfbt2NGIKJmQ5PZ
         1z+kfrEGfdYOaT6gdcdmIiw8dgMyRouMrbWESU1OJRP9YffaETNGT9ypWDoJPtR4/LAf
         S38IdgGzTXHBx0CN/SYoLNiJ/Yn61EOpFVZaSUatggtqzrSZnQsd1+hHA6cYtVSm4ad/
         bHZ7Skf15vdxal6qDhDFNgP15siTqavDfX40LrNNd4N7BfgSep7dXA0EdKdltmRf/O84
         vQW0LXTVez5HtLVQFxE3kVkgD2fc05vQI1GZZPNNiusevWF/hi2ewUM01ngthdHZu1Lg
         kzAQ==
X-Forwarded-Encrypted: i=1; AKwUvBwzJQy87VCwEjx7gY7m7PkjPijdonxA/gaEU9exWb0H/Tt/t3VujGm2gJ0PyAzVL29gbA0/iiG+XZSOS/A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9cQDRaxEc7OKmwcHZWg4G8snnt90ln0qqSTAZeq/b4Ufabakqz
	P2EkpeLS54fj1hWadNDq5eK5e0LK/7xeDoXNSYiwcsTzUapGUbE1v+FUeDiPoNZ6cHLJhh2M9N/
	j6yu1PHeK+Q8vodkl2Ke95DYHOKVWGr7WhcWaErqe+ad9RXuDgs4nHgh4WpA=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2d6:b0:4c3:ebb:63d6 with SMTP id
 5614622812f47-567e11247c7mr1568823b6e.39.1793968428434; Fri, 06 Nov 2026
 04:33:48 -0800 (PST)
Date: Fri, 06 Nov 2026 04:33:48 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aedc92c.a716b02e.a4a62.0001.GAE@google.com>
Subject: [syzbot] Monthly btrfs report (Nov 2026)
From: syzbot <syzbot+liste224054b66e11f54d148@syzkaller.appspotmail.com>
To: dsterba@suse.com, linux-btrfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello btrfs maintainers/developers,

This is a 31-day syzbot report for the btrfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/btrfs

During the period, 2 new issues were detected and 1 were fixed.
In total, 31 issues are still open and 121 have already been fixed.
There are also 14 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  213     Yes   WARNING in btrfs_run_delayed_refs (2)
                   https://syzkaller.appspot.com/bug?extid=810ea5febd3b79bdd384
<2>  113     Yes   INFO: task hung in __alloc_workqueue (2)
                   https://syzkaller.appspot.com/bug?extid=ead9101689c4ca30dbe8
<3>  63      No    possible deadlock in kernfs_add_one
                   https://syzkaller.appspot.com/bug?extid=f50d605480fdec503770
<4>  19      No    WARNING in __btrfs_update_delayed_inode (4)
                   https://syzkaller.appspot.com/bug?extid=768687d6d7c96a124e24
<5>  17      Yes   WARNING in __add_block_group_free_space
                   https://syzkaller.appspot.com/bug?extid=6931616d57696102d8aa
<6>  17      Yes   WARNING in btrfs_add_to_free_space_tree (2)
                   https://syzkaller.appspot.com/bug?extid=554a2e08e4abc56984a9
<7>  7       No    kernel BUG in set_state_bits (2)
                   https://syzkaller.appspot.com/bug?extid=64579ad11e26758151bc
<8>  1463    Yes   WARNING in btrfs_chunk_alloc
                   https://syzkaller.appspot.com/bug?extid=e8e56d5d31d38b5b47e7
<9>  696     Yes   WARNING in btrfs_remove_chunk
                   https://syzkaller.appspot.com/bug?extid=e8582cc16881ec70a430
<10> 79      Yes   WARNING in btrfs_finish_one_ordered
                   https://syzkaller.appspot.com/bug?extid=6e54e639e7b934d64304

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
