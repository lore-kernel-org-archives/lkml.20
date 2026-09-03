Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59285478D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 06:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788418510; cv=none; b=qMwaMDJMSvo2mDQLA5pCuuOmbmiSUVlu4WwlhowvbpUp/nTMRN+DxTAfjLyTD+kFCp/2SMDv5GgPqG7J6M72id1J9TilQ0vqZWtZ62GRDaj0yUF6Y5ZEHq72dZEt9VJF0xp37KYefHCM9ItRrKVQ53UV3xsKeXtSzAFNRAtHJ4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788418510; c=relaxed/simple;
	bh=No1cHkDz8JoE48rAylEYShi15Y5Fa7Rj8vRDeEt13nQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=DqUIoTQspJXw5uSVO+jkvv5Z7sMgkiFQGlcNEMjymG185Jj6jq72UNiB5PeQKzOPLQ8icmgsJzskawON8pUDoMfBFa6jVtTnFhzyBHN2em+RXiYXRmSjErPNoQnwSFpNbI1Ewm77pZkYIP49m3g2PLAIoEfa1Oz/p5FDeYS7/Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b37733badcso2664876b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 23:55:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788418506; x=1789023306;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SE+ZuHQS6fXZHug+4iltSFb/rTmBoti6wlPJg5ueiv8=;
        b=VW0uYsPYC5XYGgZX9nUh1l3uTx/crLIG5jcH6nlmQm9W17DzJja/jjLuBgLw0r7GQi
         4rPxt/UbzWlgKQMf7tCkQycX6BKiVUORZodjjDn8Fni0SpcCMKqT5MVrIJifgWEui1vl
         fhooB4VT5aJpL6uBpve955PKA/wKtJFdrLO42b9q+LiE7rs9QggLfhZt+286XIG0ajyb
         gChAUGiFMrhftGas5QlKiglSlwPBvcsDRDVkEsu3EXKTkRNRkLXErcZ97xRXZEoRwFsm
         GPrwCE1Deniu3l1crgRW6pML09aV4s2hyJqos8BM5ZkQE/gYRRLgiAAS8pldtnRfaeYP
         gHnw==
X-Forwarded-Encrypted: i=1; AKwUvBx0OUeJumBT4FPXW7NUE8mn1iCJk/ByGscK2BcMGEuZvwewnKiNVZcVQ8spAT/10edmn7860sPkjto6P6Y=@vger.kernel.org
X-Gm-Message-State: AFuF++kOJgrq/cImnAEz9yL/bqpsKVEzXh01bqpKoDzK4w1Hyh+ThJag
	2oKIFLBpqV01f+rns3fS8slB6P5wKVrtHQFC2qFRBvCpNbmeOpHj5ZNAmHsvV+DHpjZtwKh/HFW
	wSyKY6FlvJkYltPY4LomOY44Mhv5pC24bt/gi4e0QgAP0Au7r0sFnAWeOVNc=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de3:b0:6b1:c181:9386 with SMTP id
 006d021491bc7-6b47efeea96mr8387817eaf.29.1788418506127; Wed, 02 Sep 2026
 23:55:06 -0700 (PDT)
Date: Wed, 02 Sep 2026 23:55:06 -0700
In-Reply-To: <CAEe5be69a2xT7z7pn8c9Fqex2u2VJTn-3jsuZn7ZcVeiuEBsYQ@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9919ca.0b659fcc.16ebfd.0001.GAE@google.com>
Subject: Re: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: khiemtranzo532001@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

failed to apply patch:
error: corrupt patch at line 6



Tested on:

commit:         940de590 Merge tag 'hardening-v7.3-rc2' of git://git.k..
git tree:       upstream
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17551f79580000

