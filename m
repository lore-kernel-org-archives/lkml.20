Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 491237E0E4
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 00:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788827457; cv=none; b=ay08KqE9MpJr48sNKr2glDaHmAy7BK24y/9vhISgsO56erFfaHYSgdeIZEXlidEFsN+Y4soaO0TZolwca7VqVSUwPWt6JOgzEJFoMWigit6Wzyd+xpmkDnSFZpHlKlo0fSpWOkeDavvIloJPApJpLLU6AIo/X/osIO8+GS1XPm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788827457; c=relaxed/simple;
	bh=y+46E9JeT04g3AYfqqOVfFUGX60+OVDg4IVbBTkBVng=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=q+Fguv2fpf/VzpsukIXTRafclHPqhaH1SLwzjvekd5sJh56dvM7LqLeTQK/pilBBlPuVa//K9IifgyyES5fHsPX4We1XZBQcd6EUrpCUuBXdXv88GSMUhOzFb1fsB5RtsexXAXcdmzutj4FZR5O8kPa0guxjSHAdBzL+ufHeIBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-469debb527fso2755983fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 17:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788827455; x=1789432255;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y+46E9JeT04g3AYfqqOVfFUGX60+OVDg4IVbBTkBVng=;
        b=sgu7kJnAZ1SQd/wjeGMAmktRdMdchmpmfJ1G2wJa7FwzAFf4dHm+I4rpmlfz5b8VEA
         Ybveb3vssBbuMcBehojoN+xChNk+cUlJuSIrGg1UhSmOBLe6WnfGQPuPSE9E1tEVJg3M
         ZIRNwLYYn8diRgEDmer2rL9iWkv43sXSUlSl2BU5z+shmbNuvkDbbaggO9nr7bc0UqZG
         6u2NUItUxIudjaUz0lPQvSGoH6dQOUThHEWjprnBm9qgNZyTFRtRTTeVng1urjEDdeZf
         dQ3iyCgP8iRfVAFMBLpN3WD7JbwX5cF1EM7i5fXQsfGA/PXcLioA2hJiUjKZs5GM69EQ
         os1g==
X-Gm-Message-State: AFuF++m/zZl8P4VNGgw7BjGGzNoz4DSWxgWfwxGYlVNduM9GxKTBpnGp
	mXccaR9R9IG9I9EsFtGLheQUVK2Y74LxqZAaY6Y9/sq+edcDwcxPCr13Taxx8mc4btb4VmjCOZI
	EhzRnEElvHtKyHvn8G13mjK1Mv8cYvhSGqZwOdc9pcVq33wvEqxGAp3GtTEU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:168f:b0:6b0:4199:3cc4 with SMTP id
 006d021491bc7-6b6fea84e5dmr20067358eaf.27.1788827455252; Mon, 07 Sep 2026
 17:30:55 -0700 (PDT)
Date: Mon, 07 Sep 2026 17:30:55 -0700
In-Reply-To: <6a9443c1.a8e469d2.cbf3.5609.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f573f.6e6c5f9e.28f11f.0000.GAE@google.com>
Subject: Forwarded: cx231xx: retry I2C length fix test on v7.3-rc2
From: syzbot <syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: cx231xx: retry I2C length fix test on v7.3-rc2
Author: jcperdomo100@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
df2908090cda368b01ff43709f51890076c56157
