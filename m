Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D0FB4963DB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 17:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787850141; cv=none; b=WYSrSyCR2cKrZHDqn4K9z3hJyztBXSzf+ZyBmIF1gE6O2y374mjL6ZIuPJzLjmEspDoqXX1Z2m84uujUHsvDdYsvoV7NTfE3fZ1aKoiYDUmf5itRJ9etZLQjaRBlHpeXLpi9QLIEVV1oc4QCGqputo5Tp9K/z0/khJ1cQBzmXGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787850141; c=relaxed/simple;
	bh=NBc1rT5CCi+2emBDdoHbm7u+6opMlefYHErAyXgr7c0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=FSrt9aP88TM6cyDEPAkz/PbsA9bUkuU8Cc6JAVgJuKQVo9BidMUMrs+5kSQAzPUsO9DItafq+h2HXhc0z8jAy+LZGyawPG/QR2TMgpmrbJg83FNxyMW9vyFfyxiGLBxVwd9rckhMY3uyxeZVsJxTMJO++o8sykoptxVnH1s5W74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4ad778bacbeso273576b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 10:02:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787850130; x=1788454930;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NBc1rT5CCi+2emBDdoHbm7u+6opMlefYHErAyXgr7c0=;
        b=qNz4+OUITenf/bb6+un4m6ygec3iO7fPNNi8n2gosvznaVMym/MiZZpA5Hlyvde03O
         5d6ycNdf3elaTy1TBsllJwMJzHCqyv8ApcpOM2OOLmswfEPewX7yaL/GXmaqCUKytT7O
         ikjl+rRqTYrNcPjx7w8ApcEqB6T/2Zm33G2QbrxBdGk/ovajkUzgQAQz0KrSCcwT3knV
         OZJgvofvYXRMLgbfZxvctGn6Lmow/IJr+LXJVC5kWxDNR9Wa3FHuLDsj0nS7Pc2Gxkel
         JQ8bS5iYpdItlYcEosdgNkLrnQP7K3LDrZJSJYH0h3ZG8xWzO3aLl9znHKFTkFMysRpz
         ki2Q==
X-Gm-Message-State: AFuF++kvkQup3Iz/l87gZFoml6cOX6hF/4CKh0YXEJjOPNsc92NRUXmE
	WjMg83VI6WXbQ6nFn7XT4CqbLAhiVDCxYk5l3/bXPOJvLDD1V4aFzuwergqAJHlJTnFEt4RTTFD
	ecS4M1jFWnm37Xz4gRp+MYekNXrEIsCpTygA8eMuqZfcH2TX4ni/4cLMHtEk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a24:b0:495:e997:528d with SMTP id
 5614622812f47-4b397f69f82mr242808b6e.3.1787850130190; Thu, 27 Aug 2026
 10:02:10 -0700 (PDT)
Date: Thu, 27 Aug 2026 10:02:10 -0700
In-Reply-To: <6a88e8f5.91706f20.16b6e3.02ac.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a906d92.1d9ded08.62e62.00d4.GAE@google.com>
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
