Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A02463B77
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787761392; cv=none; b=YFatdOGWVjmBmXkNXvP+2CAF09ASlHXKodAiEANqE3lZdacGjOLRAFCzPIUTZ4QSEqdeyxBmFuLi4s6FvXd5VqGygoR5rcrDNVUNP8C3c/DuEEqFuYgxqHIQITrQ4GXsRnKOeU4Yuoz32rs/TG9TWT0e9naHN6b7ON7gQHeAtks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787761392; c=relaxed/simple;
	bh=Rbcbod/JW7aysjxUualHjOxHgiVbGhCTTgqNv9T4CM0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=msugP+drxrusygpUmD/wVM4rRuwlUnPTB2THJtgJP+9TZ+ivZ4UDw+zJgBoWRFLHo9Y0JQ1pf07bbX0H6kdrlzzO61WpiE3q846oQ2eWUeAx5PGKDBuxDBUaraMzfVUCyySzSMnrqdmI20Oj++rpZoffAKM+WEsse6qyaFGXr9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-7f4071ad0d0so2081242a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787761387; x=1788366187;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Rbcbod/JW7aysjxUualHjOxHgiVbGhCTTgqNv9T4CM0=;
        b=HvVqZuCX7GDbIezY4TbEKUWzTjW5Qiu6lCi8eD7Oa6UC3mFT4duvc3GYn9+FtBql+y
         7HYckUyVJoqeCVvc0jzviG6F9AYfo/jkcnIOifSEhI20hvybkXPwb/on6LIOhIC2rkSv
         tcxF4BFT5i4+GnNzy3Fc7BJuC8ySXCUcqk3/ahO5ROF1KcqZox/9Kf7xfXq4Zg9EYNWr
         z0Uy7eRPhR3PZOHAR+G57Gh30AQSilPidSPVb+5nQdKzZT+X9K83nj3umJSKHkARKXoO
         0gqX14cu44K352FlpPKbfi70CQVll8Pj88eJnUeQ8tcROkDSXBHjc5N5imQlfWpD0KUz
         GBfA==
X-Gm-Message-State: AFuF++kH8lZoO5FfoU2eWt77ZZ2gWUAIOcyQGLFgVuSeooalwlD93kKh
	CsPG1hlVwbDCPZgvzGWAnzFa5WEzMnNLHCvvrDx5r95imXfiPcwrzAdyrHInZu1iLFPxPDMdGaB
	ZslRhYrmwzYtTuIm2sVe0g8AFwWeISXJSvPfiJsFTcLRBuwcG3YZ4ZtFUUuE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:5702:20b0:6b1:89ff:8a1a with SMTP id
 006d021491bc7-6b1a03674b9mr6180332eaf.3.1787761386717; Wed, 26 Aug 2026
 09:23:06 -0700 (PDT)
Date: Wed, 26 Aug 2026 09:23:06 -0700
In-Reply-To: <6a42da14.b42ede87.8e801.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f12ea.27659fcc.2ceef7.0004.GAE@google.com>
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
fba8cadb541578a301ae03ec0441405546828153

