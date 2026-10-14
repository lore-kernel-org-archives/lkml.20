Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795934F5E0B
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 11:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976542; cv=none; b=rPllc+PLUOA3bLAR7XsSLsVIfgBezmv4t1xM8LQroLCi2r56O/TfPoWwV0oAvHxTPBLAfJg2v6wntBTKGpT4QRf9T+9b0ZhQdkY7/ArICknkGy01JBA0w5yC2nG/oK/Ycw8tajbjk6Wj1MlTvtAB41B0hdyCKdjjz5UOH9XB22s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976542; c=relaxed/simple;
	bh=j6XmnRPFaTc417Vced2hGEhxNBqNTBJnc+n3ZEzyvK0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=PjFLfEWOm/1cKy1qOmO2qSQWgZcVprNbx8NsWqxW6x4DdFw3SGL8vFFIRDW6R5f+gSAw/EHIf9/erhy0KaR+dF8uPn+Rf3L/L+lls5zDikGL2HuYhpyASiehkFBrt8uZlpDQBYhTA0dD9Pcb8B9GjYuGm6sqUq0Df6o3Mmthomo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4f2040e10d8so4084109b6e.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 04:15:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976540; x=1792581340;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j6XmnRPFaTc417Vced2hGEhxNBqNTBJnc+n3ZEzyvK0=;
        b=krqRJUR3vJy3nGjcGRn6zk10EChpHrQoJmzW3TlKZ2QT3OJx/lmXEUloIsiWTt3Yxq
         Mzu9Jv1GKIR42JbHVoi9rCdmnaY6vQuePc6yD0j6XpsgAXfQjl3doIymS3zEycSB3BwW
         HDRkdrHedyXN76FwCieDSGbPwY/TRh/9seNNNI4lMV3gAPpfHpykTVbPCqYMsG5zmf7w
         ehXpYsCVHyKsrAbnQNvEwIl8IQ/EjtPU6xsngnyZerxY9Qii0R+oUktPbfOYinQTYoO/
         vQcDJY4YtpwpxFCH4A8cFWyWrsS7JIMMSzhBUEE+7teTbzqrvGsIPkvNtrlSOBwY0aAl
         df3Q==
X-Gm-Message-State: AFq9FYLb7+HNoyUVx5HYRYgQEe4xE/t+i1NfwpDM4jIj2LL2gd37065d
	piju3wnVlqd1ozfUjpLO4njIr+OGtQm4NT7RLnEUaRDHuAdCLypvQBFsRpn5kQQOH3eT/rQ6YQU
	S/JBZ0RYGvRTIZq8fx1XuuOPaIXtle6/Kahpnb76lkaV0V8R2EioQHZWOY0w=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a2:b0:4f9:6758:8139 with SMTP id
 5614622812f47-50c4ed3ce6amr19332487b6e.14.1791976540396; Wed, 14 Oct 2026
 04:15:40 -0700 (PDT)
Date: Wed, 14 Oct 2026 04:15:40 -0700
In-Reply-To: <6acad256.a150a118.27e199.0030.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6acf645c.38256f13.2006af.0115.GAE@google.com>
Subject: Forwarded: inconsistent lock state in x25_kill_by_neigh (2)
From: syzbot <syzbot+300375dfd44665f063a6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: inconsistent lock state in x25_kill_by_neigh (2)
Author: neganhat@gmail.com

#syz test: upstream 24a19b953e2a
