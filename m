Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793895845;
	b=qpprrQbUyrVDosGT3kDlf7+hao/54FLAxjcVMP9/FPIx7lyqp1NF+eTeF6PY0xNkoHxi
	 1KBbDN2KfZYc5fLWZBvoQHXIAzcWiVFi98eqpZPNsMIAGNSCXuPjzHeO6NSSdIPpDhM2g
	 7cNApbOBk7mA13OK2WNp47nMm+39zem4VQRRPqrebr2aU+Oc20QOSUHaxfOxEw0B9Oeii
	 4aYbIQnSbtPf6ZeAM9TfhHoo5PaHuV4ofC8aPrpF/+KIw0ZMZVPl7Q/DT8g7LLTVAriAL
	 +ih6+qXUAZKY/2AZWgXRcqXVM5QxqtqU6SXNzJHIiuHeax5uYpqBk9bbiTzRh0C7pwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793895845;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=YfnetXFivmec/rd5vIT2qFZC+wX/EEPdyDtghpGsOik=;
	b=IKpmGr1ifGNWUWKi/M/CRpO04E984VoRuCi5MHI5qNbkxmGyyn5306KqHNEtZ++quFsH
	 9V93W9/s32+x0EvdyFucwoWFXoCNktzz4z8vWN3PnrdLjpJs4HBkI81d1F0AhLdxRBfDR
	 MjixlWptVPPaeEh8qndo3ekAceCotk+iSgitF2EO7+15M6VnlKwmReAZX+gtbeeYTlHk+
	 BwwWCSDNhh2LrrEIhDxMk2Mz1oLZTaZ2HFX7UBSJD1vpfoVkZ8OYQ6ex0p/GtQQXhzF0j
	 jrsUBJGqMTRI0UKrqOo1Ly7NlMiqYdeggx+/uMEq8mV0BttzKSW0LdhOYuL2KTk4rTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B71606A32E
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48B71606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4db3db8687fso3099438b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 08:24:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895844; x=1794500644;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YfnetXFivmec/rd5vIT2qFZC+wX/EEPdyDtghpGsOik=;
        b=GnZxjd/jQNYIodangFjKOSD7zNWUU5PAdmuT3ODl1Ut85+YpCQb3IoPqITbNNAN8L5
         4RyU4SYy5R9oOM/1QoPy9XohiCqKhBKrkSaUSZL8HzV7BIseyyJiah53q1RLOlE38oQN
         lCKqf4wFl2NV3SFY916b8az5tfii3OA8IJ8hsMDy4vrf+ed2Ga8kAW6ul91WbrPOZ/sJ
         i016cCpMfYpiNDx9lqk7EZjqvJIouKAOdcYv5JXHiB99GvFZ7sotMIoN9BEOa2n8Iblm
         Q/SC23iLpLKiwxr4lcYb8KQ8/s6si6j5r20VRejxpTgtNhciyOvMk6WdfJ4FurFQsUM9
         hCKg==
X-Forwarded-Encrypted: i=1; AKwUvBwCnjncyTpb6KeQxCH8tlkM7jC30z/hRs9I6+JSTz1ztcsKLqWb7o4oVeBmtG9nEzbKRBzg63vIDPSrWEY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9X/edLjhSqzKZHs6ITVANDM2+NlR0DZBKL/zoVcxwpUkaDUv1/
	/7RbI7wm102n31A8ZqKMm/ZwHq282BIvNKw+UryzDTFhzpOTgwPhFpw9fnXuXqKv33hY2fdBvKy
	HK5NJZOncW5GZ1cr4N0aeMy5MfFgbMxLxErwaweS6jLcBekz7dlPus40K4LQ=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1691:b0:4f1:7c39:8a7c with SMTP id
 5614622812f47-5640df628e8mr13696901b6e.62.1793895844241; Thu, 05 Nov 2026
 08:24:04 -0800 (PST)
Date: Thu, 05 Nov 2026 08:24:04 -0800
In-Reply-To: <20261105133255.10238-1-kartikey406@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aecada4.8ef7ab9f.218cc.0031.GAE@google.com>
Subject: Re: [syzbot] [rdma?] [f2fs?] memory leak in radix_tree_insert (3)
From: syzbot <syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com>
To: kartikey406@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com
Tested-by: syzbot+d60be66dd00b4490fa96@syzkaller.appspotmail.com

Tested on:

commit:         05441d69 Merge tag 'cocci-7.4-rc1' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=151b7c85580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4361b1bb937ae1c4
dashboard link: https://syzkaller.appspot.com/bug?extid=d60be66dd00b4490fa96
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=128dfc55580000

Note: testing is done by a robot and is best-effort only.
