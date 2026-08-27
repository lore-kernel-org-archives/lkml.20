Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08982D7D47
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 05:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787808840; cv=none; b=k4kRsFITGl/k5CS58VsHWZSJzO1i7DQ73fBocIUw+s4KcsNHjiHAx/fJwblntiHW5Vmk5CmRtrc9Fspi27WUoCVzpIPS8T9BYyQnYxeX9oSQ1myYcjmf/y7SX1CJUsknFF0OhyV0lXNqSd/+/UP1Hp3bJgp6n+nHZzH/B3iO8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787808840; c=relaxed/simple;
	bh=NBc1rT5CCi+2emBDdoHbm7u+6opMlefYHErAyXgr7c0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lCSPe7iut4h+do9jC8npZUjcy4IVH2ewlGjfqIcPpk1CP7FgeNtiBTx75CBhyw//JgS9QVJyJM8/lm0QlUfm9BipftlWPOuEvlSxiU3uNrBaf1YNzVxF0S+gOenw1ictiWgdxuZIvsCQWV56AZ0//cBYEs9wjiIatyPjBRggXjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b37733badcso1728821b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 22:33:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787808837; x=1788413637;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBc1rT5CCi+2emBDdoHbm7u+6opMlefYHErAyXgr7c0=;
        b=ldaYiYHGfmOVteMONzkh+4kFLtshfIKM6qhJQ+oO2o4IR3k2cioB6hprjmY/blmgPZ
         cyiB0BF87+T3QIqnYZmfr1Q38qajtMWvrs7Ckn41HnO02fDHhvlyUpswctiZJrKr0dWI
         oBqRUAobqfSwTJ7QWkr4MfrGh/9vlMLMzyUibq6FGkRGv4VbNXnrMZf1RBwxsIzt7G4K
         nme5VYziaMtzV2VD6dkNgQVcHPLMFKzya92m89aBs/XXsgXOthQT8Qd6XwV9YLGw54h1
         TFL5F5lKhldsKZdElW0VOz/DqH2aw6r+7BgvqiSHbwulbwITcC4p2AtmQQV5aa7JF3Vm
         R/TA==
X-Gm-Message-State: AFuF++mgfb5/Jl6OfkILqXCZq1gdj9J4qhyax67hI2h6/ca3bcwKaD0e
	6SbFBOjq9k3f+gea+rc3NHQU3q1UzPtokcX+ZvzqNNCxfSRaBgpa/WhAacT3cer3qXI/HUV1ckg
	jq2EA9DxCP9QXkAzNqYVlvQKaF2XWhpncjuXFsKxj4iH/Q3mB3O0dgbyX9Ks=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:d46:b0:4b2:21e2:82c6 with SMTP id
 5614622812f47-4b366ae599dmr11892770b6e.10.1787808837412; Wed, 26 Aug 2026
 22:33:57 -0700 (PDT)
Date: Wed, 26 Aug 2026 22:33:57 -0700
In-Reply-To: <6a88e8f5.91706f20.16b6e3.02ac.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8fcc45.4d659fcc.734b4.000b.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 73e3f0710014fe6d4ed98cfc02292f6121db7558
From: syzbot <syzbot+489e907b2a026a6f5fa0@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 73e3f0710014fe6d4ed98cfc02292f6121db7558
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 73e3f0710014fe6d4ed98cfc02292f6121db7558
