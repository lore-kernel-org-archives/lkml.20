Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA93046AA6F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 08:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790930707; cv=none; b=G5/0ISi3TLJBvecF3ETLUyYC8w4a69+LxNdgRqme80VcWjN25KRhTjKMYfMEnibmgTeMrE9UgrYHbaHAozlfT2ruce28rimeACD5Hr2DFhZYhXDLEPNbAy9njBaWhjnU8qwrCIB/WpHawWgY/CbedbOKMTpzpfomipDZIkJPDzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790930707; c=relaxed/simple;
	bh=ENnhNzACXqJXbdnxRbc/+kJrgVhHFGRuxllVQK3NYU0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FXeJtY56hCVQKkqA8LlsWCyE95rwpQCQDaZoj0o3jEHzlEtubqg2P0BAVU4n5aHxRLiEuUjQZ5LnfPPiPLb3WGRsKIyrQyteAX3On+PNiZUeu0Adyyt9oyO9xluD0C5ZJnXTXzHmOx9cwnamW8rG3NNpwAE7DdXYtkqhGQ62+6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so3109083b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 01:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790930700; x=1791535500;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ENnhNzACXqJXbdnxRbc/+kJrgVhHFGRuxllVQK3NYU0=;
        b=RsmWuPleuRyM550X9naFVJxTRWkKTV+5nRI5gNg3BrzGY4/MpQpJXBcX/hDbU7cH+6
         ZCQf2MxfoZPAVnNEQbSKLO6/YEcmq+DMfpBmCxVXa2ljH0fugUGDZEsZTsqSbpcPSGcQ
         H6UVF/U0Zg/mDo7xYJ5LkL2/wc7wkAvM5jJCHRWxUWBWzBLFbyYSKo+hIHcZiiQiq9CO
         EAv13HLvWasLlYJUAscFBdY155A6XWhAfThFz48neJf25r1Ay24NA7S4UfektS+JyV2Y
         MgYlvsYopQW5C9rMu/b8W/X81/7pbXAnrgN8xTdzXxpXfPBffzZ3ADMiyX0LW6ZCEdv1
         dwRw==
X-Gm-Message-State: AFuF++nOHtnKFrSVewW1NdmfcCiHzCEaCmVhEtm5fUKrJgK170El6fzQ
	7YvukucKRj/IQzeRZuZE0p04REbgqzdTeHKJLTTjyTSAGgLHLqDAAMjqRfxentkrhy9YmQosHqc
	tO0RXlX6xbAWYINE5Whs02nco/tfRUPhwniiXrT9HpEZqng6KujvcQlKucN0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:448c:b0:4f3:68d6:f131 with SMTP id
 5614622812f47-4f526a4ca24mr1318828b6e.2.1790930700077; Fri, 02 Oct 2026
 01:45:00 -0700 (PDT)
Date: Fri, 02 Oct 2026 01:45:00 -0700
In-Reply-To: <6a88e8f5.91706f20.16b6e3.02ac.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abf6f0c.eb639fcc.2b981.0009.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
From: syzbot <syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
