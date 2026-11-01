Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793517409;
	b=eo6w4IQqeEVKShmhsQtE/OehvuGlXw91Grs1OFH16IADpjEUAB1MEt/FhS+d0A1iuB2L
	 dLGtyS49Wu5oVmL44U6bVCsBfiD1x4Bo30K8AyTY1fXXAkgZuXEfeCif++KpaYe1vrB7+
	 Zz7GJp8fPMG8gGQjAe/x2CXsCrGsVfmJ4sRkzJZKG1Fy7H3MrMuSkaVgjydZ3sfIIXOw5
	 53UFTmzgJJM5EWgl1O7M6H1r/bGvbh57vlVlPWlshL4/4/7hpWWCgXcx5ANSlObHRDPoQ
	 56moDjHZ9alqYHGEOqa0+jBOXG48sCBtGGFM6ghnyKxNWv0QwLqJVDmcSopIxID4GmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793517409;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:In-Reply-To:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
	b=otQ54w+6LHjc7piYr3LP4cFNiXuJsFE60VDnFKOjXSdN71jpEa4CRyAE/C/JkSigUuoq
	 NbBM6gy+wwNrH7lkbl5fJJoTPWDKqTCLVKLykfyktV/LQCskkQYMpi5jiI6C5nPF99dXO
	 wYpYBqkxUZhuOeklwVcAtnaDE22cswHxrigTWrSwgR7CDg36KdJZL52MWQpx8Y9iXhUUz
	 ImJcrv8hfQKUoBluPe4d8lg6doIDhUQAB8QXkqYq3wxlMY7CH64M+CroQ8Bo32/cGhked
	 5zfFbPPjeAXR89JkFj57x0u1YufYM8EC/DlnJagnHDopjHfWnyghCHFuYObB0W//6DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D369B606A324
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 07:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D369B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4fb73e868aaso3433281b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 00:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793517408; x=1794122208;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mYvfifkh2cRh4ADWZM91A6IieNu1Ui2i8vEHoXTtKBg=;
        b=WJGWsn29Prgg1AXSn19tkuO+ELeI0OkvX6474F6RlGrHz99lgsEcecg+tiO0OHcHL1
         6guuFk9dBO52Rf7OGU2Q5QVnvxNyQMRcSGX//kH19kpoWP2BD+u20SW5NugN2NWnRBej
         a1JGmEFoFBMvoxVSQnYhO2pvQvO6CWmngD63cvW1iD6KDM/h2yDMng+46VjzXmKjOXQY
         MYkUN+bOFT3WWbRcsLXEaV1h4ltxWxwvAW4m+CU318K5cLDHsbWODQaxv2NRpJFXM3UL
         ub7goYaS/gjoWHaNLgdC6EtSeBCpaJp6fTK49xdwLU/vO3KKaBhP6EI7OKeUSRG1HI1s
         n47A==
X-Gm-Message-State: AFq9FYI7necanuNcrY5+loZ3zgdu+otLKTS0cmIX5iflGlit0NNWDkLH
	5g14hKi7rUVzxnVWQEuZKaaryJ/N54qREqz9i99/wIN6Kfyo3N08+GuELJK+Km5VDcqUMlcGSss
	zj2NHYARBKzNXrByto2XdFhWZHCZpCKv/Kk9zR16/PvvUE40JZXzOuBS+Udg=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c48:b0:4f4:d7:b16d with SMTP id
 5614622812f47-5640de8713amr4420838b6e.60.1793517407906; Sun, 01 Nov 2026
 00:16:47 -0700 (PDT)
Date: Sun, 01 Nov 2026 00:16:47 -0700
In-Reply-To: <6a830720.dbb3a75c.20434b.005b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae6e75f.67782f90.13afb0.0055.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
From: syzbot <syzbot+39a2135de1558208d3b3@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Read in check_tty_count
Author: varun.singh10011@gmail.com

#syz test
