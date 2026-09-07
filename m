Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2474E80CC
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788789545; cv=none; b=m7A75S5aSA07aJz963JbEuDfTslH4kuWdp4LChk3sypUq3M0EXjxBPMgjgLk1w5txyOiz8FUJMLDZZKEwnyKuPWObAizQcEMbfQbrtfvxNcedjgpUt672VJr8ILD0N0WdcsrFEA0H9TzI+S5UeJWDmIuDC2Gv7IKulRBzijyG8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788789545; c=relaxed/simple;
	bh=kmKThaLX3hgUCJI7hU3bLC8ag5DDFResFbzR9m7HTRk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W2MNCmOzGi4rigYlYMlRkwL6WjQgZylkP3rDPNkHjfv0Bsxg0Dded8ValB4GAGAzZLZ4lXcQ4tMCm9qaLcRKKhFlYhP+Y/tSg8qdpJYZuIsx4y9QvL05zoCSmFw7J1J1+czWzLS6xulnEej5yPQ4kz1v/dyOdXBTKua060CfbBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1bf511988so4757926eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 06:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788789542; x=1789394342;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zBFY4bEkAsZ2tPUBZkWrMbqhBhM47UJEH7WIW8wP6AM=;
        b=shFqtuo9fvvW2uyDxRvXlxxz+bpaT75kGzrjvT6JveOKOLc5C+6ki4FXkzauhwNDfl
         1opnejHdsq7cYrMAk9vLcCcPQvWr2BRcS/HhyB8i0fo8PAfAA5IB8y3tMLpB614TWkdU
         td4Cueoi+lFEShzcdxWkueaIgWe5ROrsAhobVGG233/YQCuqwYnKnSqXGRB69Kpivvlw
         pO+BN9i6WlYOGEf4/nA29rH7+pks44DfkRoBNqQs++XRiLlZBOR4CKWXnKskLAPqqXw6
         5SeuldDfjo9R6onvTHSMt7/jt6VPQtcyjh7joU52qmNM5kkYbcrI0GZiBUZydEPH++gF
         Wocg==
X-Gm-Message-State: AFuF++lBUl44JOWGJIqcC8EPmLD7yhrtHGdF2G+vodGymyl6q/Q01/v0
	S84C/XVQBavPE8PUgGiNduw9bKbFlBgvxswQKa14Q0Uy4PeJ1kx7W8Caa5zV6Nx5Tsvz1GJGUkv
	KuNZr8kH1quQg0BI6Psc/Onp7OfJvJQp1qtwh3dmK+r3VZoF3d3OV21QfIyQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:560b:b0:6ba:3635:800f with SMTP id
 006d021491bc7-6ba36359ff2mr2352389eaf.69.1788789542244; Mon, 07 Sep 2026
 06:59:02 -0700 (PDT)
Date: Mon, 07 Sep 2026 06:59:02 -0700
In-Reply-To: <20260907135724.3777-1-syedtayyabfarooq08@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9ec326.2bb5a69c.24b23c.0002.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in vhci_shutdown_connection
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syedtayyabfarooq08@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 3



Tested on:

commit:         df290809 Linux 7.3-rc2
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=31117fde582fe6a0cd62
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1055e749580000

