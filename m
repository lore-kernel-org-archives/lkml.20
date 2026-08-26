Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5F4541DEE5
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787750324; cv=none; b=Dkrqaj6IkwEv4pRiR5BDIe8lac1Hd49LlgQpJHP1wdownt7OrZfC3u0HaoKoYlYwOlBy/x6gsHuUFMHXzNIetkuJAItDULjVumoW++6zwyIHiw3g/kcLhJkj2AGvO8E0oFDPeMetpG/7IImY/DVRPDrQiXdb+zgR3pHqWp+TkVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787750324; c=relaxed/simple;
	bh=MTB7pJBlmUsv7tYzQMCJhEGiVaG53YcUDLdn/t+4bQo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BOR38iPzvYFRZhZte91x3DEVBtZ/+oxyo6KfOs2QgQ+xk8EtIvXDyEAC8ZnLroTnm6+MOd86r8ku9CrDM4OeCANAxuXBzYw3UdCPqREsvCmoBM2RNY75nfEGng2ynTscNa9UkJvlKNe3Vp2pma02cvJoO3nTbkoRgM2imNy0Ea8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-48e5de5a23cso1658926b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 06:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787750319; x=1788355119;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MTB7pJBlmUsv7tYzQMCJhEGiVaG53YcUDLdn/t+4bQo=;
        b=OBr5lQ0yycQMB2gBW5/OlZeJaNa66/deFrhEnHk6LlNk/x1Py+P8l5ek3BlI3x1SNq
         OyqhuVHfPm32g0z7yUm5RXEiRLiIes51O+d2be8F7YJfdgXEJsq1l+nOXv17Nk4pnf0M
         0ee2lYQEh0PblnjnsZfYhYHBKzcmHJYSpitbcCpYln14A7jIVBLL4rJOf/nb13ZYxvYQ
         zT5A4v1SNisLySEdqYKveI9bxfaecspLjHisvvdc03mceQO2PbWsSAVifYt0oo3/0TPp
         fssOOxYNMszvx6EnMV4JRwOE7eyGaM3ooqpmZzwnk2gF1M4CFcuPwiOU/qshXu8QNgO5
         npWQ==
X-Gm-Message-State: AFuF++nrPBKp/q6q2rCx7YS0pVd7BDZKAStRiu8u0OkIoaYF01nMx4F8
	lkKInV4JznPiYTnNInS9urCZOMDxGMDWWbAq+zjMQZ6iGkLlP9nAWPqbpQGCadFLMEkTrV+zT7U
	dn6VvF2bEepyC9MxF8XTJoA2YwDA9g+ScxpdK63D5A2IGA0KwpV6RXyoQtlc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3209:b0:495:fb79:7712 with SMTP id
 5614622812f47-4b3663697a9mr7786830b6e.0.1787750319029; Wed, 26 Aug 2026
 06:18:39 -0700 (PDT)
Date: Wed, 26 Aug 2026 06:18:39 -0700
In-Reply-To: <6a42da14.b42ede87.8e801.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8ee7af.1d9ded08.62e62.00ae.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [gfs2?] general protection fault in _find_first_zero_bit
From: syzbot <syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [gfs2?] general protection fault in _find_first_zero_bit
Author: agruenba@redhat.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
8ea0df125ae60482ca908512b180002fdb210cee

