Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B8D3BD659
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 09:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789981384; cv=none; b=JmYNu7ADEgq9f334C2ZpUWophhiffofT1Jy5X5RwugYxquQAECXWyFNObbob85wG7t3+zpbdwOCmmkucH4ogfgvi11Wz7WMscZDuRR+JTRZKjReDzBnlB7IDfZH/NpcPNk4MAZmYDss1iLrLtxQ6m5bo7ik6/Aln/T3DKSirvRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789981384; c=relaxed/simple;
	bh=RHmss5sAZlKIkOmdBAmKkXHhPEkg0BxU+QVvCmb4Qps=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=htpGtyZKdLMll47qOMGWHFagNaL8H21RRTAYOr80mHPBpyxe1ISJkwNDLP3h7k97Gd33hi4W5MKdWum2JiHmMNEcXMVRgD75Kx303eHIfWrtMFO1hAAyxag/Q88wClSLoN54c5sWyAkA9uRNcPDkrO48C4CmbKa2TY0TnT01jac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-448d51840c4so3023476fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 02:03:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789981382; x=1790586182;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5JJ4bQWUkIWVABenRZMStxNKhwXm1JvlhHPyX1aQLsI=;
        b=MCQg1h9RSsgA/zslwMxq5Jo9CFfBd2wE+9csO+timTFRlr04sQ+IiETQBkuHrWAksV
         UndcBdMz4t9ZIYRbnbfue5HKZYl5v2M1w5Y3GtNZXII79DKyqfB5XVmZsM1uNHwa5VJX
         sl4o6NfhrGiyXyD32jFJLcV7z/CN5djpzEty/wVNvg7PRG8nypZuNurU/TTAgs8t7skk
         9uaeDCdWh19aYApMP/bFNgkmtzTuMMnihA9+JpftdQZ2aU4VQpS6sIGbZUAbcOIWU3Iq
         IXnmajCLoeAjyE8Ld5BytkwFL2NIDyAK4K523nP3em3D/uGUNYTvacCW44i1jJzg6++H
         QZ9Q==
X-Forwarded-Encrypted: i=1; AKwUvByYZ+Tgnfgx71Gn3qbqOu4iAS3ifPXLp1LpykjrigiZkpLTptozotsZ7bStd6IzAHdUY305qIxlcwm1ruk=@vger.kernel.org
X-Gm-Message-State: AFuF++k4f/95EOVuYeMgWKxj5bGIarliBkYEJW15YWzXjNxPw9I/bBj5
	lkz5gXnyhwOGe9qeA00lAH8QWUpMHPV/+OOIy1NUCireNZj0vrFywEHAQjNV/a61kz10BPqIxZx
	51Vh6D+rrCPv/gDi5eeyF0PuZEVmgPNre1lIuwwZGtPkrfQhShW0eYh/gS2E=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4c0e:b0:6b0:19bc:fd14 with SMTP id
 006d021491bc7-6ca9c05bddbmr8724020eaf.32.1789981381953; Mon, 21 Sep 2026
 02:03:01 -0700 (PDT)
Date: Mon, 21 Sep 2026 02:03:01 -0700
In-Reply-To: <20260921163445.3968563-1-jie.wang@intel.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab0f2c5.71f81b7d.15fa6d.0028.GAE@google.com>
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

commit:         93f51579 Linux 7.3-rc4
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15a3b005580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7d012d9c67977ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=9b195c4f412ea5c4e56a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=135d1005580000

Note: testing is done by a robot and is best-effort only.
