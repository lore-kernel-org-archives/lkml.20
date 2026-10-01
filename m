Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A5637269A
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 11:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790854856; cv=none; b=eqqkGCM51ExtvCC8MaFeip+89KL7DB+qe10tJqlodu04AyNponaGnFT5h3BD5xAh23WoFVKSuNL7K0MRYT7R4jB/CPYn7YADcTwNKYklKQmDzsDlvRFPge5rN8skvnF/ZjLIki6ZR2LJF9/g0G3sb7QxpWYfreZcCoiwOI2UVTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790854856; c=relaxed/simple;
	bh=0kCWHCasu7RMGmkkoVjDl7uimnRli0Y4vj8pZCm+WQ0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=USh/5knGFd/nPCKWdonPr2u0XO8UzTFQGaSYYGfr1G5eEHGz1EB1p7mgT8PkfBZb2TVgrlIvv+FAliQGeAjjESFcqluaPay5HmEf1Xsw9tAWQOtnjxavsVv6NUbjc0spbmdScqRT6wa5mMdKFOCLgI/iFkS87VOsEaYW5Iuxjn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-81dc8e2a180so5498747a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 04:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790854854; x=1791459654;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0kCWHCasu7RMGmkkoVjDl7uimnRli0Y4vj8pZCm+WQ0=;
        b=ZFDFAh3F19Q8YaIfHKlJEtA1RWwn04OQSLTluyKfty+ishZOfWLAbNObOCnmy7GUcl
         E0OwzUhWGLvh/3gpz/WqufQYA5c5E1k8FGK5v2k9ES3BUmUiEW/QSJbhV1CdyHKRCIbs
         75D3lqm0CQ0dmWJP2rxcPVLnSiMyXcf1q6yXfHUmzD02/nJqFjJW3cBSLB0JePuKGzOj
         MEf1DT5qpp7vnYxOXnNIQWGuDlfgPGBW3JlpnzE3zzqMxhh28EeiNgi5ms2o0s95k/bL
         xvaqD/8y6C9Ga2tgNx04d4vfYJs0joiFyO+teKAKtvc8GBfZ7npG/E3wHGWKQw26uOqv
         K+Ow==
X-Gm-Message-State: AFuF++mErVz2u++5rCJvDUSkIQl7BkbTWz7hj6EY7swIFBqKX6UW9gLQ
	kOcDb7A3pA4u0S6dKAm6sQ9wDA0SVJ/KHOSJi31qiH4QCCc9aZGyAtNXBYr7k6oELARx0vC3psi
	wdE6Jayf44DIjQKFHalsV5cItCjbyz0CUjQPJIXLR6bpUz4GWG5w7/FWOB/A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a0a:b0:4e9:7d56:846f with SMTP id
 5614622812f47-4f1b93784a7mr4405013b6e.41.1790854854239; Thu, 01 Oct 2026
 04:40:54 -0700 (PDT)
Date: Thu, 01 Oct 2026 04:40:54 -0700
In-Reply-To: <6abd61ab.9eb00033.20dcce.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abe46c6.092aa46d.14d54.0002.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 551c722f40809618230001baccf219193e22fc5a
From: syzbot <syzbot+3df044e20e6ff1fb3cf5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 551c722f40809618230001baccf219193e22fc5a
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 551c722f40809618230001baccf219193e22fc5a
