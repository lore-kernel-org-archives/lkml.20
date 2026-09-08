Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89906379EC6
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850023; cv=none; b=b66sEgY38feOkPyMTvJwEn5Yq+yYGn7ocDYJFD96/zYQvBmbcUHnyt4BGK3zamVmRQcbm8ir3BIxchS/uHdFgaQL/3rE38yy3HEMy2PuAFr2nUMxYy7i9XyQmiCOBbro6or1w+gwF8pO+733TTgE8Uyh/uYX0ZyjCCJxqfNgPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850023; c=relaxed/simple;
	bh=Hj1U3immOaN88lF7o7m6DMA1mthOz1uggmwei7SAVdQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=lVQ2lX7hBS3idqCm7Vi54FDK4DYVNyAsxYDHBM9mLLPIo052YMFM8yYoct25yUGfu3ZfOCzkyQnxlODfL40QuwYcKCsm4CAFwoWnmLv5nrfdi9Pc1MOzLCMOPuOV9YiFg8YSIZe4cVmtSvUNQR+ub1mxYWBwEwctkj44f8vFBYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6bcff1b9fafso168990eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788850021; x=1789454821;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3RW50lH+F3MZcqoyTHclr60xplh/6XBgO9SGuOi6QFo=;
        b=f2a6BBvAKj+haxYDb8Yj4NdyMH54FJUhw9rDzKIMFzsxI6fHL5X8JHpU5fDPxA8U6+
         /VhXwCCNAVRGy8nhd+VWCUYVEDkecUWupTl1R1k8yi4Lov/B1/2cYhf1Y3rVwkwko2h8
         /goZ5yfsXBuKsYgMDLdJSIUXW3Zh4/QuTAjrtHzfOCHnN3PRRdISjK/cTNNHUaKr8vqx
         zUkcJJN18LDw967j7ibp6/8eYBSlwGCMBz4Z74ZrSf1uR9is0DcytPReil74R+vlgi9H
         nystXImn1SdfNPtl3OdZbw/NKMNM2cw/bHRCDGcXFCjOY9NuJ+CNNtepzRrsdE5SEq4a
         C+Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzgh7OTlwAwxgEbhceSbf4SJZ0h1hD+xhqbjPTdd/9g1kWRpOELTQ9O5ZWs9jAbSAwzL30Xhc2T8WLdYuU=@vger.kernel.org
X-Gm-Message-State: AFuF++mVgVt8aiu9/2Eo6Bn+anymIBico6QYfoq1ETBjXKp8TN8VQQbC
	2TMhv4uvmucQCv/KUx+ES8sjC9ow34+VUV/mNAmkTESzHpyoRYOcvgELxMFGz2dPqHk/JGKCC+G
	Z4JAjig3TS1l2nnkza6d5cjh1QN7GqpjXjjWu0idgxeWrwrlIM8ftidDACJo=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:198b:b0:6b3:52da:b343 with SMTP id
 006d021491bc7-6b6fd6d3467mr15247730eaf.28.1788850021544; Mon, 07 Sep 2026
 23:47:01 -0700 (PDT)
Date: Mon, 07 Sep 2026 23:47:01 -0700
In-Reply-To: <20260908141929.2110081-1-jie.wang@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9faf65.f81106d8.285f0a.0000.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in adsl_state_store
From: syzbot <syzbot+9b195c4f412ea5c4e56a@syzkaller.appspotmail.com>
To: jie.wang@intel.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+9b195c4f412ea5c4e56a@syzkaller.appspotmail.com
Tested-by: syzbot+9b195c4f412ea5c4e56a@syzkaller.appspotmail.com

Tested on:

commit:         28924df2 Merge tag 'perf-tools-fixes-for-v7.3-2026-09-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14921af9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=9b195c4f412ea5c4e56a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=15ed3af9580000

Note: testing is done by a robot and is best-effort only.
