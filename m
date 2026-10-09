Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0924274B4A
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 00:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791506477; cv=none; b=sKGxW90o2QCQj68lOrflxqMWKuIg/rFVAkOu58Iu9HqvlRXsHFveprlaZMiDvMuX+gLXhwvtDtnhfq93e2Tmj1IVSzHmR88P5izE/vese1RCjg6gm9q77WWGMUHO83y8gBgigDjov98WQZkWx8onwOKBZzYkWnSX4Qd7MMy0yS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791506477; c=relaxed/simple;
	bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P6C7wtpiq/hnq6ic3b9u/x7wrSlOf2Lud7XOp/AkC49+QsuxX4Y6Ux/L5KJ7dDjQn4gwdugsNQMiq8yInQ2DRJGlH4Y0TQ9hJcTVdTHiUoIeo/TwuLjptTws11C33b2Obc1wIOGQ646Ub/1OXky9CPuYSNzWdNYFzpNDl8Pvcbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-47a8fd3b0e3so6324082fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 17:41:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791506475; x=1792111275;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fHKEKHdPjoZhYVJRZoCAKKckDq3mCm+7VXF61UEPMbE=;
        b=2KSs3872CRrIFi0rrDZpG125swMCvR5dUBuY0UShdmSz72G4E2altCKXPdX5SE2lx5
         VAaDVjIEio8roPFm9O9NBx7J/Y0zAVxO6o4yQACVWEVy5aS/0OJPvGkmntOBlvqCx1io
         Vk4OPddj+dENWwXez83XVUp+QhQ55nlWSLOpG1o1uDvA8NDDJ1Eh7oSopoJFe2QhI3Ru
         WLGAV7mOlmyP+l4pG/Q+/x7xvvGyZgQxyiu42j+7nRZOScC2GVs2VD/h9pulOIdbcmUy
         N57WXOLY2CUTO7p2AzSoCvGkFq3YGYNHEi+M0Wle1DHz9lCs/Va1+Kyr6TzSeBbhzFuv
         oqtA==
X-Forwarded-Encrypted: i=1; AKwUvBzlm3DdfI3mXgkNSMXwwHG/ZMf43UrrvX1yGmp5J6oLwGzkKS8pvOeG9Inl0HIIeI3QzXxJYe0CmtjrNLA=@vger.kernel.org
X-Gm-Message-State: AFuF++mm+YJxgNkAVidYrPU6+NohQsYP4OCYzFi0wSHB4pm7YRYB+FSa
	JzKKXwst7iu7Zl7yugnAe2KCLuKpibKnovv2pePcf+gTVwDiIs5hukMdmCzyNSMBIAw1vtXrKTE
	wSQfsMJQateKwYT5p+DY47r1QN3Xcdh3ZrVOmjSQW35FW60MZkKOWZy92aYY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11d1:b0:4d6:90f4:48b1 with SMTP id
 5614622812f47-50c54efba5bmr272487b6e.51.1791506474831; Thu, 08 Oct 2026
 17:41:14 -0700 (PDT)
Date: Thu, 08 Oct 2026 17:41:14 -0700
In-Reply-To: <67cc8235.050a0220.24a339.0096.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac8382a.8cdf6287.1eb53.003f.GAE@google.com>
Subject: Re: [moderation] KCSAN: data-race in free_pid / zap_pid_ns_processes (7)
From: syzbot <syzbot+adcaa842b762a1762e7d@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, axboe@kernel.dk, bodonnel@redhat.com, 
	brauner@kernel.org, david@redhat.com, djwong@kernel.org, frederic@kernel.org, 
	jiayuan.chen@linux.dev, joel.granados@kernel.org, liam.howlett@oracle.com, 
	linux-kernel@vger.kernel.org, lorenzo.stoakes@oracle.com, mjguzik@gmail.com, 
	mkoutny@suse.com, mrpre@163.com, oleg@redhat.com, richard.weiyang@gmail.com, 
	surenb@google.com, syzkaller-upstream-moderation@googlegroups.com, 
	viro@zeniv.linux.org.uk, wei.liu@kernel.org
Content-Type: text/plain; charset="UTF-8"

Auto-closing this bug as obsolete.
Crashes did not happen for a while, no reproducer and no activity.
