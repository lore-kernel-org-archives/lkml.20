Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8C14CC26B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 18:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788806396; cv=none; b=mi4tvta0HPR1+xlyo6cvF3Kw2tgJCAjJyjDT8dvkjNzu0pVE3M/3GnJ5PZ6/F8oFLKZ2Men42/FEzmVZXNeleuGaHb8J8bwXuaXlG8ti09aSOOqzZJOy+iVb0QMLXdtVq5UyImQcDGoIyqUaXgH4RE9u4bgDMpLaYPK+Kangj6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788806396; c=relaxed/simple;
	bh=MCZnOTAXPYcO70rpe3t/5isXam3v/lFz//5KsYQgJ34=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=WYzZtlFHkAaT56ML09r5gpBbbYeXv/SXQoQbwUSW3iAFYFpiDRGKvkaLCxm2Mr+sZqZDWYgZNE+RXmUny+rh/nCJMtnm08hPfFoCaTghvXkVtoQwPGnM/XD67vCSOdTKAQXcdD+pwtor3P1mtbgP+3YkOw4CyS7OTW3BxIyH5B0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b34e02c466so4240067eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 11:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788806387; x=1789411187;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MCZnOTAXPYcO70rpe3t/5isXam3v/lFz//5KsYQgJ34=;
        b=E/O5H9dLsbhrmSM178kWZax0dhKHZQ7hBA9Iae+eBG+k3RDlcLhNFmZ0mkhIkucCgF
         3m+ptjZkkVxV7KVtVlvW6SJ39Fe5ilcHT06UtzcBbQanBfOX6rPaLb4CCRIY4ZzIHeZ3
         jStCHcai1t0fFngDpYMHlg317zqNT3PVG6tMn8TLC8knSaoDpEMWEbF7jG2/y5ylZJb8
         CTUKKAZ2Dmi7CQy5e5n3NpRH/f9JyeRcsabgmsHGq3yVNWyheQyNUPN/D+S95Z1glTPt
         kZ2X5UyCVkLWtruNTBgAYwimnhy3SbMD214quVFApWyk5DErgt45PDqyIBR2tjiD/LJC
         v7jg==
X-Gm-Message-State: AFuF++k03T4eXL3pXkJxlJHUbpgfq/YpBdQRmKlTGSFESgy3cHzeLN1I
	PfPxwFtadAz63/AU6rkzb8pqx0QW2q6FGljrvCV9IMDiAD9V1sfnfKCUh27XdEiPg9EhbKpB21P
	K55Yd6zzGpyeMP/ecioDH/4ufbKdbd8P2ruPU5HF1BGhGHwIYkuYux4PVDJw=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f034:b0:6b9:3295:76fe with SMTP id
 006d021491bc7-6b932957a7emr5099719eaf.8.1788806386843; Mon, 07 Sep 2026
 11:39:46 -0700 (PDT)
Date: Mon, 07 Sep 2026 11:39:46 -0700
In-Reply-To: <6a9443c1.a8e469d2.cbf3.5609.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9f04f2.2bb5a69c.24b23c.0009.GAE@google.com>
Subject: Forwarded: cx231xx: test I2C length fix on v7.3-rc2
From: syzbot <syzbot+ddccc0c0dbc0a38ffccb@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: cx231xx: test I2C length fix on v7.3-rc2
Author: jcperdomo100@gmail.com

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
df2908090cda368b01ff43709f51890076c56157
