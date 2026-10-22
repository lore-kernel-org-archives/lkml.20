Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792698504;
	b=gVh6ZXqkmNUR+svGWPNBV+AihK9ad/JmQw4L6dquDfbTqKDHS1aJmkq+9qzvk1iVHkQI
	 wDxEqTjkafkic8XfP449lebsSnlUyxNtnThQJD7BWegJ3y/QkcEtfFBVJoTH/0vfs9CDv
	 ZGCFuCmsOihKoT7Bagup220A8L/dkZDo8nTFywBkbRj5mbYh3fdBPv1ClOwXcMW4d3wul
	 1uFtPNOQhNGyN7+Tm5YkeOl+6tvkW6589aOYbdSAiXwFvBiS0Hm6+OpZsxDUV6MsYOBTo
	 dv1QrA3BEO4OR3RnzqKVrGyJSdmQe9g9F/uY3h3X3nOORfqXTUTuYLyt4BpY7dvE+/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792698504;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
	b=SUsVjnzORfpFh9X5gb8jkrG0nP9aFZ7MYxJfx6SocUYqsRuOGwXxzmpiUwK+P3xLjHOE
	 2SaAS2T8VEaXkSIfLLPDAeQX37C62Jx/2aBJkzlgZc41VWOoK5GTQebcskawqND8uY/f2
	 SC2kp2ZAajL2fMJrB/dOlcrARYhNsfDuN31A6mnlO44SaXT4qJQhKbbMgjfnj3Dp7jC7s
	 5jpartk1lGWIUWzOibCUrATRjHPThVYihVJQWH7thXfPe6Y1N0Oh+nkPJVn43E8qbCmdF
	 81aZnI96rkiigkke9QvxKJEwCrY17DHs/jBYJB4N0bmNu2dYQlvSWCGpebKTeV8B+rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.200
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA122606A322
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 19:48:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA122606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4c55ba309c2so331668b6e.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 12:48:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792698503; x=1793303303;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SOc/V947bqgPfUt+7TNkBZnano1Ny2EIvdcRrWgekSI=;
        b=S+8jyRzmMvDlxxvjJwRia7aiznNtQznK5X0KMIIikLtJpFaDsKm05OL8Oy6FoVhKPY
         gv/kMkrsYFZyLaetK10rNMB0plN9MVslApgtOJu2il2eu1YljvQ1Zzt4E93Vb3S7UEau
         XmpDg81576P17KmZUvWIQ3fSr3dYYqjf/qtnYT+vGuVerVZL69odaCYODgMj/pQQFqs/
         v7kpbVesJ6AHuvh93/e1TkfrQAJofHmXEn+/eIZJQ3g095FyT/+SgQPnr7tZnX17eAIk
         gFGdIJNNYO9OWQtxjUuhhmjKoJIOokjeT6m5jdDWGsTHVWDx5VfcTz5CkMhndrOqLGNs
         xlOA==
X-Forwarded-Encrypted: i=1; AKwUvBySRoHPQ8Fl1EQeLvEPJo6zuTDiUQEg1nnC5ty+rPe2FcGBe5OK2vjZ7TugC/eJzqkbiXKA+t1BWZ1u4TU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjCZp0psolE0uvfwheOombB7Kz4oCxTpiOXu6ZZ9p/9NA4C0k1
	i1CAaDUcmLbqXa4LnTP6VUsDzsTEgI5HcH6BgS1oNt33thPBUVAFOKZntq3crc3EMvwMAa2emMj
	O+jmDe/a3FCgq1VbS1MxGkYpd9DJq5tGC9p0aiaspeTtrFNrukc0Sw/26qE0=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1822:b0:4b9:a8ac:484 with SMTP id
 5614622812f47-55be865e457mr59813b6e.34.1792698502857; Thu, 22 Oct 2026
 12:48:22 -0700 (PDT)
Date: Thu, 22 Oct 2026 12:48:22 -0700
In-Reply-To: <6a2c4b8f.be3f099c.2836ae.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ada6886.d1c214cc.659fa.00df.GAE@google.com>
Subject: Re: [syzbot] WARNING in update_curr_idle
From: syzbot <syzbot+e671c2192fed8645642e@syzkaller.appspotmail.com>
To: bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	linux-kernel@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	syzkaller-bugs@googlegroups.com, tglx@kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

This bug is marked as fixed by commit:
c095741713d1 sched/fair: Fix newidle vs core-sched

But I can't find it in the tested trees[1] for more than 90 days.
Is it a correct commit? Please update it by replying:

#syz fix: exact-commit-title

Until then the bug is still considered open and new crashes with
the same signature are ignored.

Kernel: Linux
Dashboard link: https://syzkaller.appspot.com/bug?extid=e671c2192fed8645642e

---
[1] I expect the commit to be present in:

1. for-kernelci branch of
git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git

2. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git

3. master branch of
git://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf.git

4. main branch of
git://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git

The full list of 11 trees can be found at
https://syzkaller.appspot.com/upstream/repos
