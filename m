Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C49D433041
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798332; cv=none; b=N0N11y0L+YHIMjkotL+OODCm1d/0vVflL31CQhdcPRu8jQVYPd79ejEWxXFtvfy6onHJN/AECQcK8+ms6g+hQ2ANMnC2DTP6G/VLivsSVH+zmRhgqWYn1al/8IhDcPVXFuelZQXpUiEy37lqcqTy8vovU07hxl6X5xRDGjwKLHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798332; c=relaxed/simple;
	bh=K4bnBECbctC1YPIzEHSaSwCfd1ev/vrlFp8vWpJ6o9c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Bi+9oIfrBPQOsTZUxPwPE3USkUcWaI/18oKBP1GNwCjBSZqJYbmeemrKNPVHD32c13pJ5H9hwiTzwoOuw3e+so3D4Sn8FE66pNCvwgbjp5jAc96J3R4l0Q18dal/qVqSmmt5FuC12+B2l2PwYIKNgtGDRgHCkZWNXaiQsFr3IaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-809f1af7992so4250849a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798330; x=1792403130;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=K4bnBECbctC1YPIzEHSaSwCfd1ev/vrlFp8vWpJ6o9c=;
        b=GzIb/hSraL5iQKbAfPtoj2ykaPUm9+YE+zSiBdHQqrYKz5wZtZAWWSL9/eGD6tU/22
         TWeqlL6b5J/3uI7z1dfiLV/EjEALrbWjea6d8yPmvyzUcwLV4ndX4hiy6AinDFcZA8kM
         9FpqwkwPF3mSy4kgfdYztepU+C1Y7KhsmaUqaWkicNIn3KVtz9emk/Ng/Mic9Ix7GoiJ
         3QCI0oo5pdxRWY+FCfSprKC/99GMIlegAHrj91G3qZKIply3pRToyqfPYh4BS9UAK89i
         R/xrY8pozEt8CwOZVYF9QdDYyJb+Q+F3+3FJTy3pnbtVMY0A9fBDmC56reaEprNrMG1c
         kTyA==
X-Gm-Message-State: AFq9FYJWgVwHfpMCl85nsX+aDytcPMWGSRfgHejDKPsOHZuxiDjJe/uW
	4yjyZBmNMFE9wKbbuw+U23hsZdp1Rm/RFvzVZfUDnmEVRLI1Lp5X/qQqlvCm6x/dXk3z+5V5byT
	MM6Pu8ru1XZo6Yus7Rx3UxFr0w3KVLLJjoWkoGXB8gJQHp0ENjaYF77tYXLI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:50a0:b0:4d6:90f4:48b4 with SMTP id
 5614622812f47-50c56bf8928mr9716706b6e.54.1791798329975; Mon, 12 Oct 2026
 02:45:29 -0700 (PDT)
Date: Mon, 12 Oct 2026 02:45:29 -0700
In-Reply-To: <6a84384d.ae6ddae5.3da009.0000.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6accac39.a150a118.27e199.0046.GAE@google.com>
Subject: Forwarded: [syzbot test] mac802154: Cancel scan work synchronously
 during hardware teardown
From: syzbot <syzbot+19cbce4cc656ecd4febc@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: [syzbot test] mac802154: Cancel scan work synchronously during hardware teardown
Author: aryanarora.w1@gmail.com

#syz test: https://github.com/aryanA101a/linux.git syzbot-pib-baseline
