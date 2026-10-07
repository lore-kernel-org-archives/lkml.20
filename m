Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE1C446C0B
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 18:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791396381; cv=none; b=Nnr/HP7fHiKspFcp0I9fb9ZZSACT89dj8VkHM+1GKLQNvie3bbNKdtYicOFFct/hfGfU8opfhWC1dlv93jPTUKzWZdb/LG28ejsmLSHwsM8H17Oyl36qAj3CZ7ZV2Oq/NvYWALcFDwp0lksyWNcq7SoSdhbwaScXm10sDziRzMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791396381; c=relaxed/simple;
	bh=Sx0iWT24noIvc9zUfA29KK8n9Itqonwx+VYZlkymQFQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Gockhy596BKVUFmdt0et62IBXPe4iuDEFWv+79hx00Ju9c6OnVsHya/DT2tYQ5EDy+gZ3Y26FaM46Pzj/XJUYSXSgwxCYYgBS6h+UWHUA0uSsIu2Pcfewyo8vBuTSbjIjUYEsFalXW4zN8XGukewoRZjCCjszL1bNzqHFMn0pfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4943ed99826so4542110fac.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 11:06:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791396379; x=1792001179;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Sx0iWT24noIvc9zUfA29KK8n9Itqonwx+VYZlkymQFQ=;
        b=OBgDAMjdR7ftj0LQmJm2mkzTSRNidT1iKa8f0Hwd26OvLzEHqdmuXbiVYmCH2NqvoS
         rvxsr2xmupL13sLPUU4/XocYq56yvn4ur3rpAUAt93vtcdFL19pxtOtJcMHD9Fw2ul0V
         c3LfGt6xr+7jCr+Lml1NWw7ucBHp9+Y/skRo2NdwJwIte+gAgp2W5NLu1xlBNbxDMKf4
         93631b17aw0T6CSpuBr0WCU97iqZ9JreIoMWOly3USALAqBFzAoTupa8SPA6LnOjYNSM
         CcmEDrl6++NK9W5foKEvA6+Wt85KmsUVjcS9fnuQFa9ywxk+9kU6HgVl9THilkRULkST
         NBSg==
X-Gm-Message-State: AFuF++ky2tXnuMpPO4pnN0UhOtt1FU4mmLxOxjZ2fJ41idvfPD0KfPuo
	91XjJOtr9OI3I9wkCRzQ+pNeceFa3WOnVMG+auLKKZLVAQN26o8Rsv7cej+pMmyWC3Ki8PDBYmT
	Hx3TBoPSOLzV62sgeSKOLAw07H7p7vka5bNfHRbrUAU9S5h9upT+EsLhvF7s=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6809:14e:10b0:4fc:5e91:5377 with SMTP id
 5614622812f47-4fc5e915710mr1879734b6e.59.1791396379002; Wed, 07 Oct 2026
 11:06:19 -0700 (PDT)
Date: Wed, 07 Oct 2026 11:06:18 -0700
In-Reply-To: <6ac3be67.34119e79.2f92f3.0035.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac68a1a.34119e79.8a1d6.0005.GAE@google.com>
Subject: Forwarded: KASAN: slab-out-of-bounds Write in utf32_to_utf8
From: syzbot <syzbot+a2748ba908c108e7e525@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: KASAN: slab-out-of-bounds Write in utf32_to_utf8
Author: j.bhargav.u@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
master
