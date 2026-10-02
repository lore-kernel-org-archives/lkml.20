Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9499B496D36
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790946417; cv=none; b=NWhv9AvJwx1zldITwqFTUCWDyP/IkFve4muPCkm5PSXqXhiK1qMCyW6ltiuHwntN3imRK9CjkhCkJFwH+VRwrPnTOlRnlHE9QSGiJZNtsVFuQqoyOouqEqd2IQWOcNoFYA6MxiPe/K44OGQMwhDloCUcJaIZ00BG5w3vy6eE1KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790946417; c=relaxed/simple;
	bh=DrRJCNnlBCc5Zdz3q/62BVO3EKb/tzRwU5u5YBaJs9Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=iI5CH2OtnbRpxgzdgnKn6IMfk7oiFHWP7I2I/mt/bhswJeGGez2cNnwIZ6AMmsFBOTLyaZEks5np6iNx0Zj9DntPwR1jsuCSLY7RkXfxc3+Jh2Au+SzjjJa/IzFdjoms/Z+uBD84pIV+ahKmQ1fK0ljAoESMQoq8tATtnkzkEK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-8210034ccc0so4705198a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:06:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790946400; x=1791551200;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DrRJCNnlBCc5Zdz3q/62BVO3EKb/tzRwU5u5YBaJs9Y=;
        b=heasFuOA/NXsw23cyWQ3Fw8dZ541253Jhf6/gWM4nNy1TGxri89DScyG+OkinCI5Hj
         LQNcSCKFUAyrgkEkyGfpabxCrys2kXdL/vumSHnBOhy+DhijzVytBld3LwhzGMRCePo/
         2K64tqmkVJZcaApPBpnrUD7exeZNBjGPCr+rIuIrYlZX9Y5U8abbDRx4Bft9W6qpaP1C
         PiM5FbwSTOdBRuVIwIdDxAWClD3HQwoknFQmgwgUWzGC3zJqYyoNvHZ/6Pwg8Rzo4YaF
         sIDh1OLqqAe3wYDNhSdgcJKmZ3p9wouIwQxmTfpy2tqHB+CMZmALmTWj4JnxW9uLco2D
         Ufng==
X-Gm-Message-State: AFuF++n9jXkIWycwpTDSvTnvUYUm1AEGkGH6+Hw1i1UuKPqUIVkXMSdJ
	wqwm/jocO7igbK+QlHhh7f6SJ+qmZnQBfVQ/mPNMYQP8hSD24/iEtjMCK9P591JbL8yQXfex9/j
	r4a5+4/SXxvToXtL7u4b+gCKZx9h0/3L22JBlG6wJhglW3bhgtqPfw0xcQGs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1993:b0:4d6:9335:d533 with SMTP id
 5614622812f47-4f52ab91601mr2037440b6e.64.1790946400048; Fri, 02 Oct 2026
 06:06:40 -0700 (PDT)
Date: Fri, 02 Oct 2026 06:06:40 -0700
In-Reply-To: <67710fe1.050a0220.226966.00be.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfac60.eb639fcc.2b981.000b.GAE@google.com>
Subject: Forwarded: Re: [syzbot] [usb?] [usb-storage?] WARNING in usb_stor_msg_common/usb_submit_urb
From: syzbot <syzbot+73c662df6e55838c6ac6@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [usb?] [usb-storage?] WARNING in usb_stor_msg_common/usb_submit_urb
Author: cloudflare.ddos21@gmail.com

#syz fix: usb-storage: ene_ub6250: fix race between scan work and probe
