Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0323548F84B
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791820986; cv=none; b=MDNp0cNNA0ujQuGgSa8XZgIXHJX3805fkGbe0FjBWrpmZpHynqoDMF0dyREw7JNgGDc/Z2xiYzO92HZojEENJEWGdESCURRa0ZibCkZQehq2DTogyit+J7m7+Pf/ym8TWyznuQq+ybdfH7G7Oc9adGcof8wswblOkbx4Nm5wQt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791820986; c=relaxed/simple;
	bh=me7EKvowE1uBRKQoFtAig8Xu4fYCeKhhLKqyLBAE6ks=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OFAztPfPcRZxB880r4iSFft6PmdCOTMsDtC5ors8DC6NWhjxIIICHL3N9ce7fCbXHXL9E9/hWOYdc3XojpC+/3ePuEJkGZ0q3YKzl8IQwHMzWuImUJeXsMBhmK38YaCAMlCexGH1mWKPsrNXSGsJyqmQnpYfNVEUS1X/RkijdMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab4f652f9bso1824249b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:03:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791820984; x=1792425784;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uphG7ivy/k/8shfp0sIjgeovEfZudLanralBluckbDY=;
        b=yChxXL68xqK3HxsUoLvv266zIJPWNo2880KsrhL9Pxy1ksPqU7W4YLrbEp5H1/kBND
         R7xJqHrGDDu1nQhIAWfpSjM9sqas0qVZKGzmdRUWOsvq5PhIhhCD/B2nveTMHoa3rB8B
         QhTHkFY31NbOaiWNCLuLeg236oikC6yJuwhBkdn0o6Nl7zWo6avcFFh4JS+h8NvchC3u
         yOxD62bg9gLWIgQrIOQNS3lOj+475/lhnIPi0MYkwM8Col94xBqrb1dHt56yxDbWHDlX
         2Fp1EZAAo65BSIbijZstGwAajNxWjFTdpAynN1FUws+2t3zMwukvY5FcTZ3XQs/rqvFM
         alIg==
X-Gm-Message-State: AFq9FYIRm8sXVXcyQOHVnbCqZQtcvtQT6LrTlnjHhd2DIi9Ougk19q3J
	lHbMCDpNe+wYCyv1B4PLKgDbJb5ptcuMwrHVhsWfkJcyOZtlP12+KY3Z85yLtmPah5KViZwJ1DJ
	YJWB3dfn3n7YWrqfUwhCFjEqNayipiYwjUqpBr0O6CDRhjvYNA4DGn87Uu/s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4495:b0:4d6:9293:9bc3 with SMTP id
 5614622812f47-50c592a3a14mr7852186b6e.61.1791820983876; Mon, 12 Oct 2026
 09:03:03 -0700 (PDT)
Date: Mon, 12 Oct 2026 09:03:03 -0700
In-Reply-To: <CAEfrx+Aqwnw24za-2dro-3nUmbUsnsSkqA614NTPSqHVsm3gZA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acd04b7.8cdf6287.1eb53.012d.GAE@google.com>
Subject: Re: [syzbot] KCSAN: data-race in __se_sys_inotify_add_watch / fsnotify_handle_inode_event
From: syzbot <syzbot+181b8b439f5207144b16@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, spannme41@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

init/main.c:14:2: error: ASDF


Tested on:

commit:         24a19b95 Linux 7.3-rc7
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea1e6d8de13bab08
dashboard link: https://syzkaller.appspot.com/bug?extid=181b8b439f5207144b16
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15f6a9c9580000

