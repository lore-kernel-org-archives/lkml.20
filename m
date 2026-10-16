Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6518B49158D
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 12:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792154642; cv=none; b=eIdeylLTzzbg5rdLnE9RQa4rPy0OiFRYafvfLnAOn9dE7yycYrmHs/5V+8us28ZBb+jZuYiPt8+shOGLppMEmBgnjcbFoH6cOEFPnGHFgQNSHdlp4/eBFAQM1wzWO/O++rL4exKUgDKKCjCPq+YJugN88JCx+FQ6roX3KcyJbVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792154642; c=relaxed/simple;
	bh=VTMojNSXcb3NesLdltxRQHnw4PZSUY8+CCKODSKNacM=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=AboTRHjm5v4rU968DZPSh9AIQ5JihSM/3RqyvvvKOsg9k9OE48ExuzBFXA2QO25IhOMkpWTdvq4v73CjFRUTfyysOwE6JoS2xJ3MI36T3VXkJ0zO1DijbFsKjANXalX7NFmes8l3DMbyuwW//ouZaOkNA94+adGZ7wVRywRwM+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so9221159b6e.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 05:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792154639; x=1792759439;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=VTMojNSXcb3NesLdltxRQHnw4PZSUY8+CCKODSKNacM=;
        b=nAaEb0H1hm3oooU0WE20pVHGlSky/tEPhdqzVD/G8R50jg2H5vQB5SW7MqO5AtXUqt
         u8iJwBmzEcb/8ETsscjShjpxBVFPSBDAp6XPpwIAyUZUxTiQm4+B4I79V6C2p9a9v0SU
         qitv5rC7LCG3rXwqXT7Fr0hvUBHAWuZNgQDaSb78LN3hJWbom03YBy8l8WnjKqFPxVSo
         yOZBYh6ISML2XtE5me9wxdfQ5APEZwAeW5uSGq78uR8Le6/fHEJK4sp2Q3/TTEwthn0M
         sbOvDXSUiqVFfXbFInGI8nRqJ5y1D0yGyehIK2O7SV2h0qNJHtPqTWFxeTW0A4sQQ5xl
         PJZw==
X-Gm-Message-State: AFq9FYJ4PcTg+HYxjk1mubzVHf9MUK6l4UQc2TDO+206VSbTVwWTWxwG
	vAmoRLhOtihkXXrLzbBmIq2TAXHjTB5yhEhzse+MEvqXCn4xpTyn80vo9zMiOkBmVCgVVcUB5Uc
	6i1mE5ptcHp86XAz7DTOqe+TBPLUm8wYbMHun1qQUVtvXzQEGr5vh2p9O3lk=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1a08:b0:4d6:90f3:74a3 with SMTP id
 5614622812f47-50c582328eemr20183958b6e.46.1792154639345; Fri, 16 Oct 2026
 05:43:59 -0700 (PDT)
Date: Fri, 16 Oct 2026 05:43:59 -0700
In-Reply-To: <6a57ad78.9d83364e.246513.0004.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad21c0f.7514cce4.1ece07.0151.GAE@google.com>
Subject: Forwarded: [syzbot control] llc UAF on unpatched 2f2f7eeef8b0
From: syzbot <syzbot+44efda9647c52be29d9c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [syzbot control] llc UAF on unpatched 2f2f7eeef8b0
Author: miguelgarciaroman8@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
2f2f7eeef8b0a1a9b9ca998231419873ccae8d4e

Control run without a patch. The earlier patched test log showed
"Failed to bind: Device or resource busy"; I want to check whether the
stock reproducer reaches the bug on this exact commit.
