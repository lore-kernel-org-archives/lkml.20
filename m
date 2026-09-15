Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDC2227EBC
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 02:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439047; cv=none; b=fENJuHKJYHcMzXH0Ao0HVKJUED+KtbZSxvL49Ir3GvyILjxnr+oacPoiSqZdSGVtrBymIAm0TCoR4oYUuG9mCdWuvWhg+4UPlURcPHuKtOv8G3yddykJMCSOfVaVS+TqqMtiAHgLL5cXhT3OcXIJCKiqNy4AXPg3m5m1z0EO6dA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439047; c=relaxed/simple;
	bh=Muo41cDZriv9v3CXX9vekne8a7Iot/27Wc1yNyLDGWo=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MWCLfx7dqopyvGAsiyput4cnu0AJ3F/mAS9RP11tGhKMJxGagcmxwiip4dXDJgcrCXyIedXkSTii6kBWeEku1x+GKL0ecjkTaZ+lQkYYZP5EONlT5qkIEK4Tj9wFxHCfq29lmaterWgYcDq273j6dDqeJCEXP6BGjdZ4Gm0xBLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-47b7f5b898aso1961513fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 19:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789439044; x=1790043844;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=63GkWQaLmJ02I8JpkDNGlfqhX5X65D4nse5a+PZHFdU=;
        b=i2zYvFkpQK3K4m/86rpnYFmgmpZ1NiHmOUDdVb2FTzLPyktlvpCWjDmaRxeL7xtOtD
         Ok3xHjEWPrCnhglI82u4heYS/zZLWti0AU9rmIthuhMF9VrCaRlIXMEFUBateUsG/kgy
         mCHq0ZhOIzllgRXSKGcmVZVFVtC2bpSzjcJLzhddAe0OsbQ4yKXgJ+HSofGU819zmSRx
         G1qVD/M6WXTJVmHXHFcufV7nto9o1l6gnaP8Dh5HjhBCT7k1PVrpA0ppPAWM6jkr0Fx/
         mqDhPnIqskpt4DRjknF3/9AxW8pk9mDtXt9nPDk91x2Mk6qm/yRENzXcb2CLqc9cvRsZ
         YYsw==
X-Forwarded-Encrypted: i=1; AKwUvBxRsGyFzc41Q9fRl5mX+h43ZTqmRwBkFsbitmOe0lYqfFGnBFw2CxyERnwE4pqzzVvVDPQGrg8Hu3Ac1mU=@vger.kernel.org
X-Gm-Message-State: AFuF++mJ6n3g58jfPucjsj+BxZQqFkS6+KEw+1pCtJoaV5uAoViMNYt9
	76vVlJ91upJc60QiWROsTZ/RlpQS4ZBOeaYjaVrcrm7vm4sc5D1mV8zndfKB12Rrncge4cHhViX
	hP2NKP5MHv4CxhzfFfabC/rVG2fjXJ1KZi4LN6LJA/Ehqn+zM07D6gu5BD44=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a4a:e910:0:b0:6b0:589e:42f4 with SMTP id
 006d021491bc7-6c53f04b294mr3272575eaf.20.1789439044486; Mon, 14 Sep 2026
 19:24:04 -0700 (PDT)
Date: Mon, 14 Sep 2026 19:24:04 -0700
In-Reply-To: <6aa8a1ab.a90d8f20.1ab237.68a7SMTPIN_ADDED_BROKEN@gmr-mx.google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8ac44.f670cee1.72fc4.0023.GAE@google.com>
Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in v4l2_release (3)
From: syzbot <syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com>
To: jchuang26@m.fudan.edu.cn, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com
Tested-by: syzbot+34957180b0ed2581edaf@syzkaller.appspotmail.com

Tested on:

commit:         58785836 Merge tag 'nfsd-7.3-1' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13cf8df9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=34957180b0ed2581edaf
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17707df9580000

Note: testing is done by a robot and is best-effort only.
