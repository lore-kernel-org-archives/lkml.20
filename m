Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D333A5430
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 10:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792147357; cv=none; b=TeEi+wa5AZ77uEtFDfJ7bBRfWURKtd47Nc48/y9zlPUejVwF5BRV8KLxBHemO6NhNLF2tKsb9/c0q0DNOB/3YZ3a5aTjaev9jL2TENstiVRsXJzUibhXwkzkIXTHWx5JYOvWsrEIB3KCfRv8qWTac2LD4l9TypM1hV6xgjAuUY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792147357; c=relaxed/simple;
	bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EtJV3aMKkiAN+Uixj8LE0+mR82wD/dJDzv+qryuWVE3oa6KzG9UOWm+DK0UVEVDZ36vHPXzBz46kDZIRKRURKqrOvWVZKDBRI9Xo2SqsCJ1fLDWuuETLhOX2B81VVsVbPKlvo8T5ZemzZ9wmw/hBkBhjCNNXTS/hLha3LhU4YkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28dafb8e1so10250944b6e.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 03:42:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792147355; x=1792752155;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yi97y9iMsoBCBxaYlJ1ULX/5lb+Nve0EV39rznyVzm0=;
        b=QirSeZldZ0No7AlU2ZlOE7cBZmA5LGP/1nRuU++cNAJlgzEE5RaFkclkemUT7shMcx
         T46RktrI/jM1/vLFiqLJXaiY9g4w3cktevTRB4Z16JxHu6uCJ1ztceUCM5uNmBSU4Hlc
         LqRYETEgWLhGZAruf+YOGne7ZADPiDet+80T89Y+PMIsAoA6tWuSWa7YxXoZRXvpATqh
         1NE381Wh8YPBxEqr9bmXIqoUJ+ALY+GNqEEIl6OHpoWnDUk0zfEKFuM5dJwR6EOfIJ5I
         De2oa2S3mJ01qqAJBnvfin+WG349LRL+y87AbdQxZzMHFTq6kjwk50W75e1PE5Zn82Rb
         ZjkQ==
X-Gm-Message-State: AFq9FYLb8T6FvL4BO+4cKatPdAeS9FAq2o2SuQpXv3Fqmmyt3kbd2e8P
	R0Q14uIVfs6acj3mgppVVtdv7EPj/+vMinFUI6cjWJ8G6rTgNCito0RpVtqMEOKnQqs4CTw4/70
	YxGPkn155GusQl5TWZo7Ev61Kr/x6NexVU7mf/eN319KxmnGs1iwhybDs/Ns=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4fce:b0:4e5:c2b4:33a9 with SMTP id
 5614622812f47-50c53ca2ae1mr21030653b6e.46.1792147355571; Fri, 16 Oct 2026
 03:42:35 -0700 (PDT)
Date: Fri, 16 Oct 2026 03:42:35 -0700
In-Reply-To: <6a987197.9266084e.bf0d7.000d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad1ff9b.7514cce4.1ece07.014a.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git
 for-7.4/roccat
From: syzbot <syzbot+c492a9e154f81127551f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-7.4/roccat
