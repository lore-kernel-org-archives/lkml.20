Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862CA3932F7
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 03:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753338; cv=none; b=deAIYFAg8PzZn/blO3YhVmjpWxLJhxG7OMLqWY9v/bfguCfPms78WTBhwwKOBDxx5nmxhlIIlf62PWpzMMYAh36o1dbU2SHLq09j4IRbDJmjWjSUma+MyJ01U1elg45NFO+h+vqwBZTMMRpAViqIDgczPgukypWXno8NYudIfrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753338; c=relaxed/simple;
	bh=TXMX3gZ2Ry3+JMhvNVK1jEM9EGZYzDPdqIYV7qXcLF8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=VBzCN/aYJ7jFlMhl7kkY25cUUPExkthEMaZukueP3QtftW/7Irf1oRNS+dKF+v/8ZRzE0Bf3j612R2Csi6URyyZI5M5vh1tbYT472jl520j+bMaXsfduV7Z9c2Q93+gnOa2yels5WaOWr7IsQ7m+nZPfuYfN7MMH06BeNiddwk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso3368197b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 20:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753335; x=1789358135;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TXMX3gZ2Ry3+JMhvNVK1jEM9EGZYzDPdqIYV7qXcLF8=;
        b=MVGEomIhqNKYtf9T5+NnuLbY6WY4YZiinn/oWDx0QqqoF2EwqUeTRk8SzYiSDAQnqE
         ITRF2fmdWbihYPgNFRO5J1xG5fgNuRslB8Yv7VAcIh7/E8h4xNAOJhaWycb7ldxODZbg
         eu5gHsixFMnqANv9c+KUOK3I2wFk0BcLeuiQqoG+C63lvOlHYgREu6cmjFqFqwluAok3
         8gXoWBUS37vg3Fs0D9SYQuSRRCe63Bzwqx97EE/3XCyWGmSdJahWFYbLVa8zwozwMm+d
         87j9Ku6iidVW4hM84y7i5W7lps0N/wsnfjyczqFx82WWy7Ub7t2DQoWhB5OkPjTPocvf
         RTgg==
X-Gm-Message-State: AFuF++nFFqNBpLys/SQMK/zsXGqUmKQiHQ8+lFOTaR2kRN5k3LFm8upF
	SgmTX1vu7myorKFlrL+tvHgQxqB4Wb/Mk4c4RZN2W42h4eTe/IMMCtFJ4UvUSbc6dvdgum9LZ4C
	iPosiowOqm6ngJpixkbrtGNEApf0Q8EHxBQJzwNxZu93lDxCbCP5ur0V1Llg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1890:b0:6b1:c40d:635c with SMTP id
 006d021491bc7-6b6fb8d5a72mr13295114eaf.15.1788753335524; Sun, 06 Sep 2026
 20:55:35 -0700 (PDT)
Date: Sun, 06 Sep 2026 20:55:35 -0700
In-Reply-To: <6a82eac5.dbb3a75c.20434b.0055.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e35b7.a5e650b3.26d8a.0026.GAE@google.com>
Subject: Forwarded: [syzbot test] WARNING in usb_composite_setup_continue
From: syzbot <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [syzbot test] WARNING in usb_composite_setup_continue
Author: tkdkei@outlook.jp

Hello,

The baseline test stopped first at WARNING in __fsg_is_set. Please test the attached f_mass_storage patch so we can determine whether the original WARNING in usb_composite_setup_continue still reproduces on the current USB testing branch.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

Thanks,
Keisuke Tsukuda
