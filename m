Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D82A392C32
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788771838; cv=none; b=MMPa6ndr5/l6oJ56Vu19cFsUQJHNndpoZ1yVSV/XW2b5bI2NRYvdqd+BBcOEcVGoPs/vUGcNP6A7mVVRxW94nidDbbcFdtWQ/2Ri3GlzDpjKQhLolSjL4vWQfheBFGS7zobGEnFJBis4AttFrKW7LrCHpiByuBekmijUGc1b6s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788771838; c=relaxed/simple;
	bh=HdkmwakBT+yKQLFDKMqA4ZThE5+CAO5nZoICqfRp2MA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=D2YrRrMfuPDel5JBLTgoSUjGF+jQZWL2NAzkhme+FTNmqGxou8DMHqYpPTqAa8352MuCdbUVCOFOshVN5NTquWVPB2S6kk3ttQRDlVAjK4EFaA1YTwyfds/VD2oUzlys4Ijahe7sz4MwnzKeMZKSzWZN5wMc15y5helo6kzXeRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d9952a5so4160432b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:03:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788771836; x=1789376636;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=6ASXXRjkJNDzi40Xr6lmT/1490UVRie/XYZdnqEz5wY=;
        b=Q0KTJB5uxwWpxtf/dxvYkv/IPxBtpErXTGiELni3DA3nOUH2Ydce0KuWbd9b17vPLq
         NZywkST47ga8QDH2lJX5zC1c+/Pr/oFfL5OpjBwdtolis0Jt4KeODZaoz5VwOio1KOXl
         pau5GPxW5CiVEU6zFnyIerpOrFbFLQaMymQk2mfJ1wCqgbLho/7+WdM0+4UOEpds9OIz
         HWt9mySNMiKmYgqK6vuA3s2wGdN7+GiZFhRVHNM4JF4MOJYEDmEAQFYYjO1am1AAmcPn
         e8IfJBjAacpEfkDIRRf9MJdMdr4t+RSeGRf1Fzivf7XHgOJZ0ywhoK1QeZVWBXyPFNU+
         MlhA==
X-Gm-Message-State: AFuF++kFwA+bVVCElvYh9UBOUV1zMvwiUe6RuDmRsqtHV+FXkvnVqrNT
	m/Xd/qy/7da2ueVVYSx88j1c/nJKrduT3cg87P13L6b2eISjQLLAV/AN1lLq7MorcE/cO6r6FDl
	LSAzayVCYGpxCPFe5w7yDKyqYsrnsPCJkC3sh/h2Z/NImWEyHwR1/kXfvUYU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:8606:b0:4bc:fbd4:2a43 with SMTP id
 5614622812f47-4bcfbd467c3mr2164646b6e.41.1788771836551; Mon, 07 Sep 2026
 02:03:56 -0700 (PDT)
Date: Mon, 07 Sep 2026 02:03:56 -0700
In-Reply-To: <6a88012e.dbb3a75c.13dd47.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e7dfc.a6639fcc.23b8b0.0012.GAE@google.com>
Subject: Forwarded: 
From: syzbot <syzbot+1a01783ea233350598b5@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: 
Author: nogikh@google.com

See the discussion at
https://lore.kernel.org/all/6a88012e.dbb3a75c.13dd47.0007.GAE@google.com/T/

#syz invalid
