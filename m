Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACB3093C1
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789614939; cv=none; b=oTC4k+VQ2XXPM6I52bZgd9YLn4r8MsdMv1dDHXR6IIk6igMRlbI6aw6DcWu519voJraJ5ICn5sUgPrshvtTuxEX+Io3ZRNZjEyCxvILnR9jn36evrsw9GmiSpnz440qEi9i8i8K0wHL5z3HavjrzhDK6wfj8C6P/yid2pJFLJbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789614939; c=relaxed/simple;
	bh=zLxMPIWAXV8h7y4tJ94zoEuUJJB9f+sNCEKwyM2yibE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=dZ2t2LvjeczpMm22ELSy2DhxsexlKjS2yLNhoJhgf/K0YWJxe2WkISQ7lohdTWQs2ZFXgigbFvB0L6bGq/1geg/OibXCzjI33CCThNkHeTkKt/aZ32/6H2yItGmfQEAX2+/2flrIQBtbs/auV+zJxLbnTRACne8GiAlT504nKwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7f4e8568ccdso806561a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 20:15:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789614936; x=1790219736;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zLxMPIWAXV8h7y4tJ94zoEuUJJB9f+sNCEKwyM2yibE=;
        b=WW2aDi6e/St7qz2vlZqqDPqHzeJR0skYUSESYAD7nLqZbYy2EBcUEgpvIQSHLLaKGH
         FTOVRXAZFkTEgoQQFWFOW+8Nx6MfF7ZC90KNMO7jM1kwt9F3uIAsXREycHWa40AzV4mZ
         Q8dv6rft1W3pijimKEZBZgbBRnWBFCkTHMU644/8bODHg5OksZgQS0FGegkckEgCiJfm
         46ZNU4xVfZAoroSFD5yCqn8KQ0g4xijMqtib+Sj35rAtVogy4/6MGD8PzflIkHQstSb5
         vCpwUMi++3S747PF1+TazYPW2HkzP6FbzFqcdPJK3q13SOzYOZsGiWaWM4lKBcyrCidg
         W01g==
X-Gm-Message-State: AFuF++l16KxthjqI8qaoWG2UFTRyVY5aYC8hN2hgN47YOI1jODyFEkkc
	DfbThfmuxuWoS3ewvr11BYeechwB296wWSV+nGFChfQJl5FGZCDUewhfjRchZnvMK4mq/o2m6t9
	UB+5YZCxKJHucdafC0CmFx6X+92QZkqaiBPpACEXp/DV5vnYxTnw4kgbAMc8=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:55d2:10b0:6c2:f0f2:e3dc with SMTP id
 006d021491bc7-6c7d3df0737mr3729070eaf.33.1789614936534; Wed, 16 Sep 2026
 20:15:36 -0700 (PDT)
Date: Wed, 16 Sep 2026 20:15:36 -0700
In-Reply-To: <6aaabb70.86093f18.33004f.0003.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab5b58.87c06881.1db2b3.000a.GAE@google.com>
Subject: Forwarded: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
From: syzbot <syzbot+b9529ebe6a9394ddf825@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: KASAN: slab-out-of-bounds Read in ecryptfs_verify_auth_tok_from_key
Author: neganhat@gmail.com

#syz test: upstream master
