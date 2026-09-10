Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897915448B8
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 17:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059779; cv=none; b=V/z2JdX75RCL90GnKcYv4x4tJg9X/d25l5IkTePtlsF4Lnsw7i/oyG6Io/1u6PTb/s1XOzK7ZUXEWygZDjIJw7uROvCyb92F26YZmCkhG5io+yS6cHw7U64Rh3KK/2rVPYm2fycLG3CKRsfi4bdzfqPlP+2Rtgs4SzjE93UgUs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059779; c=relaxed/simple;
	bh=A0KPtnFQ1vfX2RynlOiiidHOi21u5RBLRx+fGFeMeAw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qVjok9vdqd4Omxo/+jTktJNvoHQ0/KwpmKQuxyyV/iO8gpmmybvms7phLrVwcogxvdzjdkh5M5xtdITQQ8vl1l4Z8iwiZgpRxBKc83Fe5/Liag2YLeY2Xk9v7E1tpuEHNmkMlat7PQ8w3JzwNbaq2A0BnKGwbyYo+FhT+YeWNFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2fb8f0df0so32967b6e.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 10:02:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059763; x=1789664563;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=A0KPtnFQ1vfX2RynlOiiidHOi21u5RBLRx+fGFeMeAw=;
        b=YZ/3DkpTxV1NAVKfkhxLwOa7AdaXtGg+ZMrA2HJD4fJYf1385QlJpWhrnwjIwnLjLo
         cnESWtESe5eeqIcJvIZ53WFOXewVO4In7yNDNdfS3aAn4DVmDbxxTw0sM6tmOfLXdPsF
         vRijdSDGTuE7f+Ic3HPvbpREq+l8JGY7XIVg5r+ARTY9nvsBQ0e2RmnfSnRzWgORNZY8
         RpvfFay+J9KD/sUMdSl9BPb3tBpZ1DeVY4d6vi5bwl84fdz9UKNX4jgMgn3SqqlUUWP9
         HzRPGFfgfpjaqk1kEQbAbNTSQL7L//2wJC1peP3HXAPWsrNtLY8mdqSwM00yF0ntwheQ
         SvVA==
X-Gm-Message-State: AFuF++lmPV95PM6psRDwJmhFfFZNqc+YogxbutHT3SgOp7ZG+4g2oMpg
	UBgL3TWN0dkl1qKOGJcLELhvuAWgVoXOofiWsKHLc0o2rBoHO1K8Q3EEDI2B98+4oGyq75AbmLh
	/c6sHfq5HgxsBP6kuHvz0qehwO0HfGjckJ70q8PMNbROskw1cBdYTOPwSyl0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b85:b0:4b9:e5fa:8913 with SMTP id
 5614622812f47-4b9e5fa8f5amr21499972b6e.38.1789059763600; Thu, 10 Sep 2026
 10:02:43 -0700 (PDT)
Date: Thu, 10 Sep 2026 10:02:43 -0700
In-Reply-To: <6a8725d5.4d75e56a.c9a88.0043.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa2e2b3.6e6c5f9e.28f11f.0037.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 50d05c7c76c96b90462f24debacca971d2e86713
From: syzbot <syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c96b90462f24debacca971d2e86713
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c96b90462f24debacca971d2e86713
