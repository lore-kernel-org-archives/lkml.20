Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 680BB3806DC
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 06:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789021504; cv=none; b=k00Q1tVzOsumP3C0UN1j0EWPbBwhAsXfp59kMB+apvtybaImNlO0EYaGrUbHhgsX/l64PCLl7CezDoj56ttgSN/4Wwpa8OkAof57hb7e466XVtj5IYP0A+OtquENtfKkKnQei02IAXl2UZpqPV9zsBaKpeEHpdAeEv3a6Q+pI1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789021504; c=relaxed/simple;
	bh=78RJ7T9d0qJKY3ApA45lkRGYgDQeSW6semVJR0wS9FQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pjB/sJKVeo5wkLOUgjSL7lXDVGgKGibilrQTzwmc/MaMl4Ku/DVPydewg9pdZuSS62gpzqcsuA/kePQXHFAd8y2OjfY5Coj1SaW9bmuvrYOOHWeML4HdsJsiV4zE29aC2bAyhjkFl140AA61jpO/OXFNbRXTtwcNTw2EGPUSVUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46dade0d7cdso6326224fac.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 23:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789021502; x=1789626302;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WQmyy2oQ8K8c+7nNuHLhusX2d6fFh5vuPRo/c8g3ql0=;
        b=XNofHeSPnklfeDTBuxPuOQjQk4V1fVtY/qcUXwR1VcebcyYHvOraCieVCjhTZsXNen
         BVrRicx4AaT0sKYqb+cuZqk+fiPb557NnzF6mUcWMSWeXHvKNQwZZZ7kM+WkP/GiyBlV
         m68peOiPAe3cePzPpOHlkjhtBBlpLUd9VA/kk9P7dKJgMkF398iKZB6lFr5Of/u4FhB3
         TzS9Wr+Ytyse3ROlmllMwnVFIkRNlrVcWA+mFqyDcHuRqAVD8F03K7gdA/+LHTAoTyWM
         SOCgGrFXDxdAhf+uakIFwRgtdhXBSERye94E0jcLnFquhYn492mOtqbZ71gnh/nZbWnI
         /0CQ==
X-Gm-Message-State: AFuF++lPKLYkP8vN/8jUgLetGqfJSatPI3ru0tcf3MWrm7igQYnz21v+
	Tiy5tCAhdhRKmPDk50V7n2CB4X9mDTThyRt5LzsyPOiMfscPEOugbl44VtMB6nCtI2mc8v4K5g4
	lPEprXI9oi1MR4LB/76ZtK0aX+non616Ck1FXE84fYkwTjXFVWLzaDqq+k2g=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca4:b0:6bd:f333:7b95 with SMTP id
 006d021491bc7-6bdf3338c8dmr6043413eaf.33.1789021502317; Wed, 09 Sep 2026
 23:25:02 -0700 (PDT)
Date: Wed, 09 Sep 2026 23:25:02 -0700
In-Reply-To: <20260910060923.11410-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa24d3e.f81106d8.2ab401.0008.GAE@google.com>
Subject: Re: [syzbot] [serial?] KASAN: slab-use-after-free Write in tty_init_dev
From: syzbot <syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com
Tested-by: syzbot+fe63e4d633540f230624@syzkaller.appspotmail.com

Tested on:

commit:         50d05c7c Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=122c8925580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=fe63e4d633540f230624
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=12b69ef9580000

Note: testing is done by a robot and is best-effort only.
