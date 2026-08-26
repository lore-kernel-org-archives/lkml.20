Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 866A2448CE6
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787774246; cv=none; b=t99EpN/m54zsSN+Qe0x9NsnrVBz680Jxb1FWlR0kIY6ugpiM5zrFgUTZ+E64Us9Ib6e+63RnHLUpPDUE6zX6hCGc7T740HT1J+gqu9mBIJSmSrmh5PipGb+Xpd52uQXPfWsUlg5QFakbdpBgCUtep0/mSSmJ/UB6Vem/iYXiWao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787774246; c=relaxed/simple;
	bh=4X19XfvM6Sr071pmKdhk67nLUoeBqNA+M7NefrjfdAc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WYZbjQZsbxF3ofxQL3HSowfSbtS5Q6KvWeEV+y+m6M4BlJHeJRMkb2dh8ZlAUQRX6ngxUPO7dDaD5jk3mZw6QOtJYy4SSrHkEQnCv3EHKrrZ+zHB0ZAle6CJwWaU8Qzqsd9X40biDfGNgf2/S5choZAmycJE1OQic1NJITmvHLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f1da5e5b06so2678003a34.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 12:57:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787774241; x=1788379041;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4X19XfvM6Sr071pmKdhk67nLUoeBqNA+M7NefrjfdAc=;
        b=WYJM54nuqov2aBFBgcS1Qip+qdCA9tFb4Ibrmc/Jo3p/McP4KhchDnbFsmSO3O6r8o
         P6vxA/5Kx5iUPqJ+HzX4NwIkhJEwcgI3t4z43mJzugEpYwS10Gh2NIA8bz3zhgZwj6nG
         iLQXgZxLum+hghN+y5yCKGLvc2unu4fbBYNyiGL3OAXYljuusXMGdP08VTC1PhPA5P9W
         ENIjXrhr+eLGstU+wDciDOqEY0yFKKopiAlQgwoxbvnrmKn/kWtu9jauuNCLxh6zTDC3
         BD4f7HZ9ttYVb9JPhXtMa865Lt+Fifpan9dFA9DqhTanR3x/RJFN2Av8EDLsLPldIktB
         9AMA==
X-Gm-Message-State: AFuF++lp/5uMVq4/+NBeCSJLjEqfe7Z9d1sFilpkUokU2iXF0McA3Dq1
	hQm6ze0eMFzUYkljCQbXZUzSF8O2PDEfHNvnWPBGv7LEz5iwacx0nAB8im8o6saWkmUwrg/Xi59
	wgOgt9SybOpzUSDdU8bdTMWX33gg8QV5pQ0c6JCkbyetT+qoLx+N0rH/J0QE=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:3417:10b0:6b1:4cb:39ec with SMTP id
 006d021491bc7-6b1a03cdb91mr7145588eaf.12.1787774241139; Wed, 26 Aug 2026
 12:57:21 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:57:21 -0700
In-Reply-To: <6a42da14.b42ede87.8e801.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f4521.50659fcc.60cd.0006.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [gfs2?] general protection fault in _find_first_zero_bit
From: syzbot <syzbot+cb79de2cc8b76fbf474f@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] [gfs2?] general protection fault in _find_first_zero_bit
Author: agruenba@redhat.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2.git
44c58550b3fcd425350bc4983d6c56fa128ffa0d

