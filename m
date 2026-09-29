Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D14F4078E6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 06:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790662415; cv=none; b=pXV5s5OPt88TeeXMQ5S7DcCH7vICIjJzsIsNaIBZH1teRoDJJI+znh1uUywUXlFfSqWMWqjP0tcQpg6NFuzLZQd7hcEvPBBNiM/piMi9eYVZYPJVhJGg5VuYyha+vBKQjcoJZfXzbCsE9GcR6u+NnN3/q6cUV7cXef8q5QAkW/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790662415; c=relaxed/simple;
	bh=bcH5AWD3DFrSfHSrHunXKck0oCD+JZnpRaXIcwOtD+Q=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GOQYIs6G4Rc+JCMDgqlrv8q3P636+X7aJpR6Hzgwq9HkVjwIaH1CD5xozCiTIlH1aZf/92QjRHMh0BiqBOQSmnokH+3dpkUeSx/QXhVe0HkJMfBe44SQWDQBk95DTywXxKXRkjFMbysIxWuoSxIuFQrV2mCPh4Ye1tmrAmHzM7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-809f1af7992so9799021a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 23:13:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790662413; x=1791267213;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bcH5AWD3DFrSfHSrHunXKck0oCD+JZnpRaXIcwOtD+Q=;
        b=d1AncsgBxGqiGtHiwO+pqgdLNzBfH2KNbvnO0VDhuW9ekSjydwYwJY/j150rxKYsyh
         GoVDRSnHopgPppRZXl+kmB8NmfGxP1huzYzzEL7CPbNsiTju0Bfc88KObgHrKrH27XCP
         /ehTvXgliHEQqsoa+NlLoul0iBVQ7u0cNp2Sozg65tlCQ3IHVGVObVktP38CBWjAYYr9
         D70lTOGwcN2umKj0cO/OWsESNdI4sX2nRdxthoUYyTtx197SgXZZYDgxq69yDZM2S1Ce
         iOGjbPW7UfOJVujAHPHGzCH/Law16D6r3L0HGnNQo9p36xPLDKeUKIriODE5P9nAPIse
         eZAA==
X-Gm-Message-State: AFuF++nMovvbQJZpuGx4+Chp8sGFJT+/BnHSBu0ESrEeLoWr9jwIk191
	7Hhzxj+tRPD6RoAjjp7MZLsLLG392BPzlh/+szjwNR0OTx1uTGJrUeu/pNfU/qYaJM4gl5qa8Qg
	mz/2FEUIrxyh+F+Ni+JKeUQU64F81Rf3FcAqIZp7ve9e8KeMDFRmb1PvnJ7Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:23c1:b0:4d6:90f4:48b8 with SMTP id
 5614622812f47-4d72ef5b458mr17850488b6e.58.1790662412965; Mon, 28 Sep 2026
 23:13:32 -0700 (PDT)
Date: Mon, 28 Sep 2026 23:13:32 -0700
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abb570c.69bd487b.a6f8c.000e.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
