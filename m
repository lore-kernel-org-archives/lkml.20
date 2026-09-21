Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9774CEE47
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 18:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790016474; cv=none; b=Ap8rFYHh8tzAMyj1gh4moVIi5HpUPsDTJ3Lg/gBSWnLsqHP8njSd4qO1JWB8pRhk2nbkdhgfVIevKVA+22EYFy1iv7gH5xgg5Z9Bin6/WcDjsOL0WnTQMzxwKjcnJJc6u0UoSr354poaKbtO+LssopqDtHam21surx1cN27zJfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790016474; c=relaxed/simple;
	bh=OlViH/mKLqResLQvZhJ/ir+drLOf2g0Hor5oPIMQuoA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Bwbb0+OaAU3gQRf3saMmcVeSShJail6ai0aa2NbGCnOY94WsTQQvtCWSB6ZST7saN7yvmXSmzVQ0ctmuZhserUZtCKb3o0WorM7ZTQv8DH0GcdFAs2LwcXA+uSQ0dtAZo0KyZax/07gHKYHFYjZTWCMFtClUOYUab3F43tBtRWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4519ef1babeso3898612fac.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 11:47:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790016471; x=1790621271;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gWuR9+t+u+i4XSSsnUX2MmPcJSj85k7+RQDQYDUOTY=;
        b=xtDkAhsyd5FNRpVAeZhKTNRPHb3fSkiN1t63IUgfL20YCPvOtv87SLofej8XsKIxvx
         fCzYxx/vjoLlkiypmd2VDdyyEeyhFHm/eQbIKIRlnaGFU5iGvAuLKmKv096eoKACuiW8
         4HC7E2JeLtlG9Gm+K1Jc0NS/0MZ86UxApvows09H1PG6Ce2acPjb4hvWlyd0GUPbrPzh
         V/jnrgMRNzDLQmMJl5SP4kkUx98Yc/BvxdMdJqqjyWbv2yKnd0SnDgnikZYB4d3m2YvE
         QZySijGzLeHpjr4kSTteF0N4LYIpxBxu3bPEFvCyGOBjSz/dN6mOMvCScQmmOyG3ivCB
         ciOg==
X-Gm-Message-State: AFuF++l+J3PH65n/rFX48dOiISHx1JOaoLhKOt6O5VESilTXN/g/aDfz
	lkhDCAMFup2HXg8mxHvYHQtDC/RhGn7A5XQ+a5U+nq6XZI995NGGDrAv2zQ2fhZrZyxggkmCRDO
	1Jiu3ywyM5JcDaBoXLFir/gtcohMBDXouHAs/Ihe39Rzgx6ye2JPXQlPP7/Y=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:208b:b0:6bd:5506:aadc with SMTP id
 006d021491bc7-6ca9c058e28mr10626138eaf.35.1790016471634; Mon, 21 Sep 2026
 11:47:51 -0700 (PDT)
Date: Mon, 21 Sep 2026 11:47:51 -0700
In-Reply-To: <6aa86682.f81106d8.2ab401.0056.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab17bd7.3179f8cd.1e36b2.0024.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [block?] WARNING: suspicious RCU usage in
 mas_start (2)
From: syzbot <syzbot+b48868c46e62c1c4cb2c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [block?] WARNING: suspicious RCU usage in mas_start (2)
Author: paolobertinetti200f4@proton.me

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

diff --git a/drivers/block/ublk_drv.c b/drivers/block/ublk_drv.c
index 66eb55e71..7a64745e1 100644
--- a/drivers/block/ublk_drv.c
+++ b/drivers/block/ublk_drv.c
@@ -5628,6 +5628,8 @@ static bool ublk_try_buf_match(struct ublk_device *ub,
 	unsigned long expected_offset = 0;
 	bool first = true;
 
+	guard(rcu)();
+
 	rq_for_each_bvec(bv, rq, iter) {
 		unsigned long pfn = page_to_pfn(bv.bv_page);
 		unsigned long end_pfn = pfn +

base-commit: 93f51579e7df248780214094418f205253383cc5

