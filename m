Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AAD227FD43
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789364930; cv=none; b=p7lFiDsGzFB+X6dr5aZGmjSL4/AkzAm5xSRgi8Njcbq+1keaqdkBkHRHZmTbI41bZN7E5ml7IlAU5SBUiNm3bXKgLLDV9gVTp11qhVW2WMWIfT7Be1SdCIxUb0VX9AnbsPqlDwZ86rBLsNuI9/tWc21ojh0+hdSuC6e3vicqxkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789364930; c=relaxed/simple;
	bh=pJFOGhonoIIRcnmCQFwqfAW/XOwMT8ozgAu5rAyOFTA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PXZWh8s7VPZWIJ8fmxZBZdBI10c6zpAeLerwYvCBh0k9XO+OnAELDB75QWAcknYl12fw+Wv8dk4avzlKBtxS8tzO5nFA7C4tB0/ND3ZnzRxmGQqa718fc7ok9no3dnonm6OipBYarOjqrODJRK+nxBCPJSVtAHQkoGUHhgXV/Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6bdc0e8af81so2937593eaf.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 22:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789364926; x=1789969726;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pJFOGhonoIIRcnmCQFwqfAW/XOwMT8ozgAu5rAyOFTA=;
        b=i0C58nqSFb17YN19R4L2AdRYkC/bELj10mTNeviXFfbCIc7hY9ZWpgGbZnTL3JgIsd
         xwX1K4otMNVeRn4I8jpAVioIoDWAgIHiPjFqI31j6cW4LG2tobnvniWDimCYSQV2eN7F
         vrFlfLU5zI4y6Saamf8TvLB5eLETwFLsKOLxCvyXpamYrxQgCFPPu2k5k7IHwTezPG5Z
         BdiaPexXPvf/TmYVlwINQNNCv46P1axIoLeMN4G//OYiUl7bwMnFfFw2hhEDRvZ2t2n2
         e8nHxwBGzoWq54pW+MQqARisxzWfHQJs16X8RtQDPdhNmKB5IZwR+1Szl8UYve3pDZ5O
         oAyQ==
X-Gm-Message-State: AFuF++mbSXcJlLMg08YnPHycpBRDtftClSlhhMeyAw6AgKFvNpNwCtK9
	9WvlzTiZuiwaZCi0TX6ddbSDSr43n9nEHyFvxUA/hfLCIpHifEMDoiERd56H4c21TcUycjeSiuJ
	ibhmcKS7j1dndQ5bIKpWx0NM9iAYOKG/funrIr0slEolwVM96g8ciP5IVlew=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1609:b0:6c1:1734:2ec9 with SMTP id
 006d021491bc7-6c541a46da1mr724709eaf.28.1789364926544; Sun, 13 Sep 2026
 22:48:46 -0700 (PDT)
Date: Sun, 13 Sep 2026 22:48:46 -0700
In-Reply-To: <6a6d4178.13bfb6d0.1ecdd5.0256.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa78abe.f81106d8.2ab401.003f.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+92f5bf49bf4ac75223ca@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 762137ff748fa0c920f82ce718163691cb02f907

