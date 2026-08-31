Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2E93E00A1
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788170193; cv=none; b=g8yEJ4XXYHQD4GO2t1cVSdggr35RwLjt/9Kvz2xKIErSt9XNE7Hz3LYmum4plSizriJ3ov0kIrQmeHqUoQzl0gqPhDTVAg03eTcizN5zauhzIA0/4zx7gRO5H7Py5A+P8UYCtDinQ1pUtNvmaBoTeariB02C52CLtTgCny1hjB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788170193; c=relaxed/simple;
	bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=mVigxU3TdfXiCkTiknWCDYnE+2Bo95DYZmGfFido2LTXSeCiwYfa3ehRxDfPTFOOi5SSwDyyVcYe7VI7qhttGxdAICfgo6Egv32Cuvf098CsJitgCZavJG7TfW4L6HJcWR5380Q2K02pTUvstDUgiJ3Lm6qDUmeUsAYB7Z1fbag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9fc6dc091so2238117a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:56:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788170190; x=1788774990;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FocYRFooe2PHD6829AxmHF6BCLLKXg+c84HLUZ9o35c=;
        b=ji0RhmQiR/gRc7rB83DNMGx6IBYLcGSGG6rxKLhTXRaViXZejTzVhIA7WlQFGOmIcI
         FesxK6RCHoOS9KfQXlP+JKrH+xnYccDobYSnjfwuxnRSlm5lR0rCB45j1VoTgrLAkmIW
         JQKnqJ8zRPNoW70/t+EVMZkRzFeJhz/62O3Eo16zWCNI41dLRwmfEGxPgiNEE09Mf5PX
         ztM9kIkCiVeA8p+n0NLC/+SpALluOVskkoxVqxslWeUnHskPm/TBo/H0yNQkidQ/Wh0y
         bhnOldnI4CeMvpU90pMn0lo3fFTbTvRKWxqnu7NKsyGTWL3mVMwvCHw0z2o4bchygwNv
         YNsw==
X-Forwarded-Encrypted: i=1; AHgh+Rq4gSRsVvBVOYA6ITLN78P3fuDEuTHF/VjFsSuy7omOb2X+cSPsLFh7vNlzrVeaK84ftDqmKASzuP/sQwo=@vger.kernel.org
X-Gm-Message-State: AFuF++k0y2ONYzQXb2SMUwehpAgqii61bqlMMzuDj43R81TB2UbfMlYq
	XMsanPR6LZKnGP+DciWamh8793NCUiu8G20EKE4SXI+sH0YKxFaCu2ZksFZDtWxDdmYyA5h34E7
	WXXoHvDa2Cpogr+JarVDG1GIgUUJpSE3FpewuMnugokVJmH7wICYQLHt5Kxg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:180d:b0:6b0:589e:42f4 with SMTP id
 006d021491bc7-6b1c66b745cmr22016480eaf.20.1788170190250; Mon, 31 Aug 2026
 02:56:30 -0700 (PDT)
Date: Mon, 31 Aug 2026 02:56:30 -0700
In-Reply-To: <20260831115627.00000df5@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a954fce.4d659fcc.734b4.0047.GAE@google.com>
Subject: Re: 
From: syzbot <syzbot+59d5e6a8ed04e6a000c8@syzkaller.appspotmail.com>
To: joshua.crofts1@gmail.com
Cc: joshua.crofts1@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz test

"" does not look like a valid git branch or commit.

