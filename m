Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67B23812DB
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792183253; cv=none; b=jDcSdOeJTWTGhoGIw/C68tsPeKo5ULvU4waqKWXvt332AhxaFWthH0bl1w/FtUe+QU88JLjVHoTu+2zFYD2KViFXykmHJyi77Fe5H5ON8xcqOB7XCdLfosuhkscgq3DI+F+Zf1jdmpnzSILqKa226wWXHCIQO80AD/DRFxcpBHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792183253; c=relaxed/simple;
	bh=EbXuIcapOckvrhisdI0LwUYArV24KA9oHp8GR5qT4sw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W243a1BnK5YUT1ZVFDJ1S0pepxvnha+6knEvOTNf3bjlqaBlSkzzCDRCap7CCu4IlRvcnk3kHP1XXQmYzxjVNgFV167xtWtdk1HQ/k18VgjOBot8cAG5I9H0GIJKPw6B6Frkyt7w6RN8a+wT6pBSNPvRMWBBsyp5CGuYg5K8xBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83c2311eb1dso472846a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 13:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792183251; x=1792788051;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+wbdAwo+7qJ0XrWe1hwdAcCaLfod3fa2dlmdOVaQYFI=;
        b=yigqHJDG3zwidP5jrx05lpTKmb2UTAsktVSheQRgsBQlbhzGU2Qub57GFHTmyO/v6P
         soVbfRxLQpVRXN+qZqIBjVNl4zvCqmYa2fFOxWl+150lQVtPCSFdUGkktmYg3m9rj2Dj
         rdl/M1Sm8UXzujQT15wZhxKeNJX+7FZshp9kcUk1Nxm6NusoKv9nxMrOTrSgDUDeg/Ai
         QgYPWpRbzgM7A13tagYoUwALGM+D6EGBivSGFEBzTPCy/9oQw4Edqn5i2miTlnWuepq7
         VLXkSQyd10pnHj7bm6zl6We/3KQyJbg206gc3qOj+PcRZuzBcob3Y9wxogE7uPqGDLYJ
         8Xfw==
X-Gm-Message-State: AFq9FYJ086xzfWvxSFYYYYhszfCdssmjuUKhs3QL6bW+tsYGby+qhJcL
	CHMunptLTzCHkgdNGaYt5w0vuZsTjN0XCUkUq8Z0ZEkYyFCcde4mW7l2hx+0I9xZYNsmzyacZqJ
	BRiyCRpmFL91tmiKGbRAx1wi+tAc3DTyuOzDJfchX9MK51g/linreMyEANlE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c49:b0:4f5:c4b9:dbfa with SMTP id
 5614622812f47-53cd0372bf4mr659953b6e.48.1792183250856; Fri, 16 Oct 2026
 13:40:50 -0700 (PDT)
Date: Fri, 16 Oct 2026 13:40:50 -0700
In-Reply-To: <6ad26b97.7952420f.283480.034d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad28bd2.7952420f.283480.0351.GAE@google.com>
Subject: Forwarded: [syzbot] test patch for general protection fault in input_ff_flush
From: syzbot <syzbot+788733b16e87faa63deb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [syzbot] test patch for general protection fault in input_ff_flush
Author: matheus.aalmeida@inf.ufrgs.br

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 
master
