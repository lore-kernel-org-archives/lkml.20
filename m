Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7CD83655E9
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 03:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788405907; cv=none; b=TG1Wrqi9aexwEMKpoqW8wZT+40c0mWE6MfdqTBr76jkYgLHgjgUDcgYvLqXyunkqeYNU4tJ5HPSWSds9SnrcUexR5tiddamKMaum2zRVm/QqLILt3oTPYDGdrg93NEM5WcYnE3A6kB9ZhhTmLp1wNChQFhJQO7wdx07fDYyLMDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788405907; c=relaxed/simple;
	bh=HJZlayBHW3FUu13NUsbDqUXRAMsYrISwhTRpYT7vtZU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=O+1nAiZi+HJ8XLsUA0dVUblQo9MTIh1zuGMQA6XO1hXgUnnge0WZcw40Dgv32xKGRgy+50RfNiw6brO+Z9A/Q9QKsD17DGpVqgd5/apfsl3LITHNY05jMuJQRSygD77nOse/1FS9ZboBSMiGHdGrbfWzkRqwv5T6zBI94h+RHsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1b9376ed5so1820964eaf.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 20:25:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788405904; x=1789010704;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=87pp1lTM+lDldZ5sTpxwmboEtYFekNaLznqZjSam884=;
        b=etLvhpF+PfZKoOGum2iA2JRW+oBGC3T+x9nr4+8I8sVDpybzP8DZXVO23tvkb5LkKR
         ZEWYeEnQy/zjPVLOmT90/wJnDqwxv96uT2Pjm7/Hq6qABJlHpJh+3ylkh+e+17EkN0oG
         wHYw43eUMaGXJKEPXW8nxEMf+zpiTNVF9qQDEIcZfnMOc3g9leKChYRD+Q2gIPFmnPuK
         bWD2nBOdypfYQcY88BMT3iXpAlGlttWZ/Yr734mDqySCNWYOot69NEL4v+6WB0y+LYET
         2axfUqbzyKjabHB4uYpt0B0V40CXe6zWScO8/nJEzTEMM3ptx6TBsrEHwgMo5x6QsNgj
         M1jQ==
X-Gm-Message-State: AFuF++lVklRMmFpp/Uos/sjJzF7D9IJIL73kWoAJbXxEvKQpiY6EguES
	J0Gdsd0JI7VxQZgFrg49nnwR7k55lvlb2uGrAaC3S6PjZISC6eUXUM2W3PPsO1/TAKRjqM7HdiH
	qOpDmNTzRseu7zyVsTbyZGxO6JxnYGLvUjVwjk2F1CoEeNIKtVrRG/EaQgoY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:199a:b0:6b3:619f:25ce with SMTP id
 006d021491bc7-6b47eed806amr7621376eaf.30.1788405904542; Wed, 02 Sep 2026
 20:25:04 -0700 (PDT)
Date: Wed, 02 Sep 2026 20:25:04 -0700
In-Reply-To: <6a9087a4.4d659fcc.734b4.0013.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a98e890.94649fcc.25487e.0002.GAE@google.com>
Subject: Forwarded: 
From: syzbot <syzbot+473d7477c523b41d4046@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: 
Author: adrianox@gmail.com

#syz test
