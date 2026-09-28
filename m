Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D62D277C88
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 02:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790563564; cv=none; b=ue/2TYVvBOnu6PBmEiH3Nxvku9ZXdU2T7TTfpIgtwCjuP7cz2dleRM+5M8I/57oP9slhzVGg88EVy0P7Qn11cyO8Ynx7wPEjeyPKS4OrVs++T4B59XJI8M+qN5f4UyRaKeMcozydsbQ9y05Boc5WeGWJfl0/JBed8SpiHlStCTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790563564; c=relaxed/simple;
	bh=jVM/WUgWhG1uZQ7j5lJlgK4ITXZlLGHuLXqKKdb8fmI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rEfatwDedmmLmo2ah0Uy/MQdactrMqwjevSDfmwc531tyf+/SV6oYpmbzJ86U6jYuCo66CuHI9aC7T6w/1BMIYpH9bjnOYCSCxsmx/CWPq3HHbMeSSbJPq5j4jan5dZ0T/j7+5VXqd4QvRiCFWAkBQQlP/FpY4Jck5EwkAQxupw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dc57e2a3f2so3960463b6e.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 19:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790563562; x=1791168362;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KEjZWj0/UGizB89rWwOqMQP0H4tlp/0JKdIjlJ63mpE=;
        b=Txu06bN+ty8QJ9CRYHMZLE5kMJpf0SNDFm5LHtdLz0z6Rix7KyogXv+UGkaZlVFrq7
         lXGk4fNSfPdAGlW8aMZAO69PHKqM8+Bc7uHDMTS9quMF9Y1/8+LQO+FRytW3rfCN3qeH
         ueWRn2k1G6N/QGTD2sBTNLN/IQbE/tapJ7DrENl2QvwNkiJP9oXPmCQcIyRM/lS3A8KL
         dkr1jk0EjzodwUXNvfxnIEo0Pxx/eFcPHVtm7bcwhAdR0c3CT8el09pYS2HHSdZmbXt9
         6lUwB/6MoZN1yx8DEyrPA8DaKZ6ebsk9IHcF2k3nhZhZsc6O78TuBZQvSK7W5JcRc7p6
         A99A==
X-Forwarded-Encrypted: i=1; AKwUvBwZ6wGzYsfxy/PqR8b+h2uAeqo6a5VgxHOsyf/GipaNOrpC4nPHP+Hz/qBwvzLAq7HhPYzciMbQdEb31lY=@vger.kernel.org
X-Gm-Message-State: AFuF++n/ZyQBrl3sIYuR+AuTBaU6W7NDTLo8lcp/klVhC1ZavFTej9MD
	28rXAiYyMVIEm6vvdKxOlr6J0tucPBunBb2agfzbSfq4nLnGbp5ffvzXbzek0jfLT510Mqp7alB
	I1qzhibFuBcd6Nw/4/eK9ImFp+DtMshmETW0O+ggfZMh7xiWOJJbeV2ihCxE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1782:b0:4b9:e65b:8c36 with SMTP id
 5614622812f47-4d72aa5b90cmr13432759b6e.36.1790563562303; Sun, 27 Sep 2026
 19:46:02 -0700 (PDT)
Date: Sun, 27 Sep 2026 19:46:02 -0700
In-Reply-To: <20260928022549.181870-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab9d4ea.e548f532.1ca396.0043.GAE@google.com>
Subject: Re: [syzbot] [net?] [afs?] kernel BUG in rxrpc_purge_client_connections
From: syzbot <syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com
Tested-by: syzbot+e2f5927fc701355ef101@syzkaller.appspotmail.com

Tested on:

commit:         f0100363 Merge tag 'xfs-fixes-7.3-rc5' of gitolite.ker..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12654ac9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=e2f5927fc701355ef101
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=130cb605580000

Note: testing is done by a robot and is best-effort only.
