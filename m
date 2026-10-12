Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A4A39184F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 10:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791801866; cv=none; b=ke6uFZGpo3rTghH/1jsbSoAD03nXkO1rS+Nm3JFsmS3T60gKsWc3nrxMd19dofhKFJtoUQD6nw78+luSbvcUDVqtoXsAk3rHM+ac01klJdn+JruJez5lgTkHrBQDQnDKvEhfdzd+aMmQCAAHvD8uUFoDROdYywwZasq8RUjKa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791801866; c=relaxed/simple;
	bh=FB7lhZ8XoAEiQtPdtUo/UCVKXTyoW+r+rJ3suLoIW6A=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=YYTSPvCU7pLIdfIWLTGKWSaKtl9qGlmcetrhserSr4Jj4qSlctgHUodG1eDQLZutq5nLVGgQXePb4M2tapbGfZJIqK1b+bw681ravTjsvaPJRWaRhXaDDG82W+4gzK46xD42To02dnhhgq9qpZExPFAaabvl0ne1EtZG2Sk9eZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-82285c64cacso2915869a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 03:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791801863; x=1792406663;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FB7lhZ8XoAEiQtPdtUo/UCVKXTyoW+r+rJ3suLoIW6A=;
        b=BNwSOEk8SM9hriBCT5Iad+6o5T+x7V1xGPdUrGjMGaGEZwn58GX3ZRSKdcMOmnHNoW
         kPJvRyMKTv7sZh3gqgkGPKKG4Uj9fMsmi4N1uUquBkSaBOR9SX+dTWBZQnN1Zxe7/UEZ
         XFRqkYyxykQMrwvOm4cPcUzObYIw+Q8K3f21Vr0TbqVdEBKgauiHL0pUpVbSiyv1fTg8
         eSxRmIlTMT2r65yaqPy6+pX/RrJ/Pv1CZYwCiHmV+qi1xTRrNfpDG0aW5ayPZzqVSz3e
         jfpU1b67R++r0kDDIClqzW6dxtUK3O45BiRgKbHQikWzLZ32cd0h9tO0BbgEI3YeUPBv
         up9A==
X-Gm-Message-State: AFq9FYKc3AOvlLFZZ2TKxsAT/1KDapPhq6WRyK4r6+Nv65Ny3u/JPhVV
	EIYTFcsttHNIjCi06rO/wLUYTivAgvvFsZh8U41RSdb18rTi1yyhSyC5MOnnxEGJXT6+Iy5XeIk
	vtiRiSjHMe4SMjJmqvjyTP3qy7LuSaNUo0jA06gUgt85ubNpKRek5yNfvXWI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:190b:b0:4f8:4ec9:b170 with SMTP id
 5614622812f47-50c415de52amr10495284b6e.2.1791801863777; Mon, 12 Oct 2026
 03:44:23 -0700 (PDT)
Date: Mon, 12 Oct 2026 03:44:23 -0700
In-Reply-To: <6a9919ac.94649fcc.25487e.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accba07.0e5b5d80.2c029c.056f.GAE@google.com>
Subject: Forwarded: #syz test
From: syzbot <syzbot+6835d5c11145e4f77057@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test
Author: spannme41@gmail.com

#syz test

diff --git a/init/main.c b/init/main.c
--- a/init/main.c
+++ b/init/main.c
@@ -10,7 +10,8 @@
*/

#define DEBUG /* Enable initcall_debug */
+#error ASDF

#include <linux/types.h>
#include <linux/export.h>
#include <linux/extable.h>
