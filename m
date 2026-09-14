Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A22335F5ED
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789359682; cv=none; b=OkF6SzwcSIfoXbSj5SfjOg7xSUxGlRoAYPr8M6BMa5/lm/C0z2IoZMhk3QEG2OpMZ1cQOR33uBM9oyKdkp5CYP1oKWTBHW5P23SGf8oGOuyjOnBjWAl7zvAcxl0XpOH+VCa9xM+VXPNKBd1W5yWm6pTE7TMpbJsK2ATIEh6etlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789359682; c=relaxed/simple;
	bh=YQW1snMUsXn3OKsXa0oe6Xbuy8FLufnL+1YbE6HDqQA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=nbbHQLKYWXAU5dvHqpcczKcrFFjcJNIB8/92goeEzRetTy2ssY1EigpQfCoAPC6HkjaYF0QyLOzGQoX3kCt2rXiQ6p1x+OzmQoYdP4qqPJy5FnSM8ZfbVxnLdlWcweI/I5nlpXeP8v3+k9CJGU30D7SrKQ1oB+vJWkvhg1+9jDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6c18e7d53b9so3371045eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:21:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789359680; x=1789964480;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YQW1snMUsXn3OKsXa0oe6Xbuy8FLufnL+1YbE6HDqQA=;
        b=imrhnDRuveXv5daSzYrG+Y8Ndq+2/oExWtVJdH5yxqlszHlliCpnpHbaLtDgWfU8ZS
         aAo7nNe64ZQJTUmoMKUk7mPdcBPcg7OZjyeZbWxYi1in6oj8u4Km+bitaabzh5/DjVoF
         /K0IaNy+IWA1mbqKSLjASz3fXXgXeskq9VPYsu+yFeh9ktb0Hi2CoIapMjodYTAsGN+r
         Y7tpRVuqe++N2XRxCeyAYlNDUXbyB+4ut4KVjckkP0r2sljb4RDh5GC5DI/SyB/VVKWM
         96BqQ9fs3oLuQbF8EhJrL75ve1jFO+TRPb8q2Oh84mMg5/zB9M1L4sJDXENJCz43y9dj
         r8VQ==
X-Gm-Message-State: AFuF++ku78FdOqf7jJdAUVQFNFvw66xWn7m7T8vp4xvD789mGy2PK3lY
	/M7YiCtd0pr06iVTft1o+2k9c+z/68crCH5mZLy3qPfOahJP97Ejs62sm18WJN4khgzuQQqvoUE
	Y+XBPcB+gjTyudZRUvZOcMPsOSMFiywyyseg+0SA1/Zw5DAiYXzW7bSsEVoE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1503:b0:6be:cf58:ad8e with SMTP id
 006d021491bc7-6c3cd2f012bmr1501366eaf.17.1789359680291; Sun, 13 Sep 2026
 21:21:20 -0700 (PDT)
Date: Sun, 13 Sep 2026 21:21:20 -0700
In-Reply-To: <6a74aa44.01d0871a.3a0d52.0028.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa77640.f81106d8.2ab401.003a.GAE@google.com>
Subject: Forwarded: [PATCH] configfs: unhash dentry before dropping the item
From: syzbot <syzbot+abd6a8dca0f2b7726060@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] configfs: unhash dentry before dropping the item
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 069f4aad347e1f3181639d2dfbadfae592df93e7

