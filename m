Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C83E2F8EAC
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 00:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787790305; cv=none; b=nSaF/W2l+5vJYVI38wmfFR+OKQc4j3eJTxEN55mEFbJXM8/UdEsMfpSE02RUNxZW7/0gzJvWEtRbuz8/ZiMKfz+fU5xg8O9DIWJ3teVYojgvDQZnNNlm2DOsTDJnwuduvcD69hl9LA85MQlDxeqjWzvGqoOv+tmWrdX/Njof2AM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787790305; c=relaxed/simple;
	bh=+t4U70GIW6NDmnWMvECxp+8oXtm+HO+jNlxHAE7A3Ug=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=emJQomr3hvRdrs8sRjqveOD8XjWmUULR43Mx5YscboxYn51RyTSDfDxzZImyy4qL4sCSqJ1dozdDrHBx8ibM/UOWkfkWCl8H1O1i0Zfdtv1sLHeJtRNxUDAFhzJ+hj9y9XgFmozjN8xUQ7x+/2Pj6wIB+4PLoQrh0YZs6MZ2br8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2f2b8d88fso178782b6e.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 17:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787790303; x=1788395103;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qzntTdZUw0SEDYvIi7eh2pwnpHIOPHK2jHvKlPJqkh0=;
        b=Qz8ib5SPXxkc2g7MRtkBflhNm6RX+FlRrV18aHTOU0rRVMLw+7Q5ywQm66I8G3Wxvc
         MSAmb6xyNdG7P99YMBuixj2muhGuKeSwXVLU6bOsDFhtSKtDy1v8Efg5FdD6qcV4Sd9F
         fcGL5xOG2SRvpXOLHbwQaTnHW07yyxFKdbSlDQj08KpckAhGVpjEnYL6SJ1ygtEYQjIq
         o+e075KDRyhIB8e1aATNWjMch3w2G2PmPMF2yYCVPmQNZtzbj7YAhNQ3C2xaw7dycVsI
         4jBDztTSp/CSjKkR5ewdDfms2OLdOVzLIcljuRyE5iSU7czq7OyJQ2Z4KpGtJXpPuile
         71GA==
X-Forwarded-Encrypted: i=1; AHgh+Rpde1/MSRxrVPQpVJEgLppQMqsw1MTW8ArRX/yFLNKSoEBe1ilGi+YL9OX/1A/xN1P7T1VYHTShza/vJfs=@vger.kernel.org
X-Gm-Message-State: AFuF++kRv8a4Hv3uzzdmaWZkiK1mdPf2ilb5XPBVvpgc0uRq5zgI3oJ7
	azI+4DoZRywEpO/l3p91A/dkoJiWCDAZp6GpVFWlJt2mrX9FNVYFVs1y6MCjJmOpGSkWRbsQjwp
	2j/7p61T1qMYX8JkpygXWYBs3ogqsd3wakG/uufAYEq+QtNGRsTrW7e6cOE0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a4:b0:4b2:8dbe:b596 with SMTP id
 5614622812f47-4b3668b9b23mr10658226b6e.2.1787790303610; Wed, 26 Aug 2026
 17:25:03 -0700 (PDT)
Date: Wed, 26 Aug 2026 17:25:03 -0700
In-Reply-To: <CAHc6FU65VFmh_wOZcx=A80UFQbfuKSXNCeZPV26LrRJ+xbVhBA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f83df.1d9ded08.62e62.00be.GAE@google.com>
Subject: Re: [syzbot] [gfs2?] general protection fault in _find_first_zero_bit
From: syzbot <syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com>
To: agruenba@redhat.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com
Tested-by: syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com

Tested on:

commit:         44c58550 gfs2: Validate metadata inode types and link ..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
console output: https://syzkaller.appspot.com/x/log.txt?x=103f3415580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f8dd02b32fb43dc7
dashboard link: https://syzkaller.appspot.com/bug?extid=cb79de2cc8b76fbf474f
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.
