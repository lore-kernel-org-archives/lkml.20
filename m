Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421974CDDEC
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954665; cv=none; b=HWcPCUBL3MnzUyamNtG8hS5SdOk+MgO5LkYuNkQPpufYkgg7EL2bkHe1/JD+rQ7SjmmGxUfXTsDSZ6LWM70bHjA6I/q6cGOsaENazOfBFq7ASOf3J5vji6QUxYNvhc9Tt5NTt5VzxiHMiptH044avDmQJHol1iru/6wtPhjaRYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954665; c=relaxed/simple;
	bh=9jfvm1dwxSfKgFiEToTNOoMQJo3zl5Aq58IqS/38hgY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=X0uqM2AIp47lKtynegbTFFIAINAd5d362/NNc90QRxtXKSdkuMziBUINHs/79WYAnMfAqLDbtRpcRgypdiD4uI1m6AuSUs+s9n1HO4wnrXDtwYDrxwO1UY6PVlAbJj5BW+Jj88xtJBIZR3uJaR4p3sTwY7aDi1t8KS9u1FO7qXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b1bc2e44e0so46856b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:24:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790954663; x=1791559463;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9jfvm1dwxSfKgFiEToTNOoMQJo3zl5Aq58IqS/38hgY=;
        b=OKlQRTfqJ6lOO9GMQ3ahOXxR9OI0M7VojV0v4FOS0ETt1FO7ke8H+XEbWFYc1wHW9h
         bc/V+ANpAFRViMkoD9wC8xekvmW6kotqdSPjiK/11+WA3sGzpWPR42BEx8QFDD5/+TWr
         OFDtcHhX6l/C3blAGON2QB8UnY2j8DCiE3ExOdtw4ZBArmvMIr5SqAG+O4G18DVms0Fr
         M3eVNawway1RGRdXm5KmYmMnaMmocR8ZhUfKpdGeZ6UuvtIDayFlugVaJlkZXAVdeIXk
         E4LlqG076uMuXPPBgyTROgCXhYFzfRWPhwP9sUeQixJar+oh3/F4ZHWCbhBUukiW0uiT
         oVqQ==
X-Gm-Message-State: AFuF++mK8foZZzQDhDVWsTR09/ZG3lRH49ad5k3WMS6efMarHoGvMRHD
	UGDMwQW5l6bPLH3ME3doWEFmkgdbl8HRnvwtCRhyY6VElLhYlJ8pH/vZLH1xHdWUi0PM9OsnvNo
	B3ejAkau5I/eR/oLu8Uj910BRppWjdMo6OlCiWb6QEBNvM4odaG1Cuoh1wtQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:16a4:b0:4cb:f21b:6f94 with SMTP id
 5614622812f47-4f52a159420mr2100711b6e.39.1790954662968; Fri, 02 Oct 2026
 08:24:22 -0700 (PDT)
Date: Fri, 02 Oct 2026 08:24:22 -0700
In-Reply-To: <6a396a65.52ae72c2.136ac7.0001.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6abfcca6.b50370da.302ea9.000c.GAE@google.com>
Subject: Forwarded: Re: [syzbot] WARNING in can_finish_ordered_extent
From: syzbot <syzbot+085adc3f91549d11066a@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [syzbot] WARNING in can_finish_ordered_extent
Author: adarshdas950@gmail.com

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
