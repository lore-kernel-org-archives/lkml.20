Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F91A348C77
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 12:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808853; cv=none; b=tUSc7mREJ/1YOux5uUmQOm/Eu1MQ4KSZL0PXFl1cA8aXV9oZn2LwXOFkqBnR4i3n0YI5uYIAvrKtw/y72+UWD9nfeZhI4syYqrCdXXnIlNTNVygjyU3Gar/W82I0KPxtANO1fqt60x/o2asoT6x5o5etOi2dhiGCTMlf8eKjjjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808853; c=relaxed/simple;
	bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=B2i7C0ZYW8lNLsEVqie4eyVttrbshaimjHI8oi30fIAzPMYMDqcwkFe6LmswEVY+ZuTsxMw6QKlFFUxWIRVNxcGXKdwXyfRJRCc6pZxhNF4WlUQvkHE2SADRCSEDpQErhFxMw/ToCiQyJalM68kc85URnWFKlsS7y58qsUvdVYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4db3db8687fso3185863b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 05:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808851; x=1792413651;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oUJ3RMDDNB2ivKAi05eH0inu4rlJLtX2H1bKRkH8Q9c=;
        b=zdG7OKvvW8x3WwsFvurI9VqsscA4964NCOes7eyLFjJA036uHNW+iHWVAB8BJ0E8CD
         +RblDYNKNZxvBcKPKeDndyOneJPy5Cc/9A6PCzS3uiOqgI1EdX2jjdbMImE6y1bwWVag
         7i2TIxxiNYd5hoi3yPuXRGXX0evQb7KaMFmjxDInxho2pv77megXscm18UFdVVySp+Ec
         BQ1JRBncy1HIGn6og3tweb93uWD32XBTczf71qNMT70JtJ7e0wfkSYyrlQCdOTnM//am
         NBe+bJEcB1BbAJzPAC+dLnffQiXEiqjYlBUcfQACsQ7cde1UJ4hwTenZNqJLJZ36huFG
         66MQ==
X-Gm-Message-State: AFq9FYKcvfQGSmhM9a2H0lJ6FIWWsVivlaakAH/CsxXRrAv35reP+xeB
	qY9rGS56tQ1Oz6Xyk8AdK0u9t/8br6xUK5vQxSt2qS8SYugfzvL7E8CwP+1dsdmg9SxHxKWeRcj
	QlPvXwlfCzquSH5oA/lsKEBzWk0Q0lb1pdvG4V3RdGGPusdaJwEIO4ZHQQMg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2445:b0:4f8:4a95:9b3b with SMTP id
 5614622812f47-50c5c6bd180mr7927154b6e.68.1791808851430; Mon, 12 Oct 2026
 05:40:51 -0700 (PDT)
Date: Mon, 12 Oct 2026 05:40:51 -0700
In-Reply-To: <688445fa.a00a0220.b12ec.0002.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accd553.8cdf6287.1eb53.0127.GAE@google.com>
Subject: Forwarded: #syz test
From: syzbot <syzbot+baad8fdbfa4129f93db6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: spannme41@gmail.com

#syz test
