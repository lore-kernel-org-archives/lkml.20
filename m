Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C5D258EF9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:17:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789384675; cv=none; b=ktSaWjhVsjqlWxyUATXy4wlHnF55qSICFLun841Kh9o60I2PFEKVIsV5QWo8zi65DELFH8X3XTPZBmH0mDABmRmEzYlJZfrSb0TbWyF7I0eaDI1q/fc6jqzu+ks6D03qxozUJF/zsv9z7tKyIxRy4pxbjtDY6HJ/p8/s3/3Hdsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789384675; c=relaxed/simple;
	bh=F0LU4dKftkAMtyCZikrm2OSiLfnTZG2MynzIoMZYl78=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=pN60qZ93hZd9V0/VSwtogbiv6xRX90XL85a6WmYFrzRYccW9KY0n/tTQ/f0f0txzFDhn1Nn4QQjPhO4hGXLsJAIfR5TZrhl+Pn0/pe19z8mM/t7/eKacpKfygx3C3KBIjsh+ehve2elRH+sIVt9UGq3m4K7qG1Iq+z2riH6XGSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b3962f71e7so4390043b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:17:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789384673; x=1789989473;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=F0LU4dKftkAMtyCZikrm2OSiLfnTZG2MynzIoMZYl78=;
        b=MusRU5Jkbp2aPXKScI6QWjquoLT4tzkliX88sHFO3VSL3FK0oVMV5T/wvJ2Luww30x
         ehE4maWT+469jkbxYqU86zJECgPhUQKzI6pgmQ1n5gI2jF9jvCwuXCaR/qmrx9dN8pTt
         7tAB/OtO4d6qgDTqcGXIZnjPuZKwv8EIXwRmYKM3sdHi0JmrwGe3JDHPs+3NVFUGX/kl
         uA7id7RTIbiXmsxmbtsm3AiPwdUp7t0Ea9PlDIsDkpNr3Id4KkDHpaEpoSMs+C+5mIkf
         uE049fye+wsLgfAQS4FpAMD3plcC7QpFh+EQLL9Ua35Q26QRSwNIHmHN0fxAujf/q28u
         us/w==
X-Gm-Message-State: AFuF++lcsA/QpexufEOvVwFlHSELTEqlDJJUxTEFfLlFwRmb0e/6UbVs
	8BAssy2HoZijtgTKZuc88a45/ODnk0fWc0BUm7uM0Gg5W/HPTuD9hvijiGAENQVuoGV9AVGbkRD
	Ux5oXNov3oV4Gwtt+7Rpk8MrFI8tfcofCJyoaw7I9+sYDjOrpm/meYgJd9EU=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3c45:b0:4b1:b9f1:e893 with SMTP id
 5614622812f47-4c7b33dffdamr1069433b6e.3.1789384672882; Mon, 14 Sep 2026
 04:17:52 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:17:52 -0700
In-Reply-To: <6a8fd9c8.50659fcc.60cd.000e.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7d7e0.4c28b7d0.c1bba.001a.GAE@google.com>
Subject: Forwarded: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
From: syzbot <syzbot+d632e93ffcd1452bc61e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: #syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
Author: dmantipov@yandex.ru

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 704340f1cd0dcef829eb62f5b48ae95a2ce17bdf
