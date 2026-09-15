Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B004078E4
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 03:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789442649; cv=none; b=rifUEp4YlQbCjvhAJGzfY0SPLvRJScG5giczTOOVFYmItko0r5iXSKqWWPnuhoNS3hzS+aVX2byJWKADL8escHT+lFgqBFOXFwgnf6x1AFQf/BH5QcRwSSNEikYFBwf/TvKW52Ice5wF3dSNOxQkms5soS6WKonB7w08u1vtS+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789442649; c=relaxed/simple;
	bh=nP1ivZrQtJKxfRIkTgECdI3qJHDVOnruVeb5oNuZ8aw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uDpjXqGmZvuyDS1OD+g6vftoH5n6lorG5J3H/Bq5X6XyxEo+fba9/5zaMNh1xrD9d2n+H/bBV15GL1LhTEv0aYaS7G2zJ8Mw8PwgMErqB+O56Id2+9joKlWtxbrY2phVxXLm8bX5QvbUD26+0d8Yjygg4NC/5SAE7iIG17ozz20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6a17dafd042so5129006eaf.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 20:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789442642; x=1790047442;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=432JvPLfin6DOHa4P1kmbu7XsKudcyYC9eE777TyPrM=;
        b=WBZ5DF1/Ytx3cxej6gbxZbvLTIn2WjLUMUAoTHkAL0vQwlPJc4bRF3ZaaTOiLQbw8k
         ZBV6cTzdD0JQqABxsN8gF2LIs1L3WUOPW75oz5PuuAy9CPsxrFE331cw2wuFmj8TxfyV
         77M9axvfWaLvqSEtORR1jB1pzhhFa5LD+PmGEIYpNYsMSMV33Gtho/CATYBjDOh5qOeD
         9Z7m21yVw9Qust7lDK0tyoFuebhz7lvBciLNMraFI80T7qTIms3bPANxMkZ2E8sFEb5A
         MBCiHWnoDmQmf+sWdWicDvDFZRbuvYoBo26s5hNsf6V8/yKodc9xbluxvir5y2uFLprI
         KZcg==
X-Forwarded-Encrypted: i=1; AKwUvBxzU6UIS/MEMwubb2Abrs6uvdvDK7iizoz5SG3VLnB8z9UyaOyJorZtK7I4oufoV4n/xvNU9FmGodOjKsQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mL21Kxly1cLqLyDvpZDyW2b/UcRJ5f1og9rMJAti0pZkfcGhON
	gW3DqHI2qg4jkLrVZ0CxXEUc36CbcvidNN4FpAtWJffOGNaB3p58cgJrstBp80FwWcl8MUUPOp/
	a3CwcD+wgT9Skho4B+1Hs/jX0/I9XixsdvnPdrs2AcS8ZnXAT/cMc3Yqyxu0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:81c5:b0:6ac:b178:97f9 with SMTP id
 006d021491bc7-6c541d501a2mr5541226eaf.31.1789442642136; Mon, 14 Sep 2026
 20:24:02 -0700 (PDT)
Date: Mon, 14 Sep 2026 20:24:02 -0700
In-Reply-To: <20260915020601.899434-1-eadavis@sina.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8ba52.4c28b7d0.c1bba.002e.GAE@google.com>
Subject: Re: [syzbot] [kernel?] BUG: unable to handle kernel paging request in write_comp_data
From: syzbot <syzbot+237f670105a254a230d4@syzkaller.appspotmail.com>
To: eadavis@sina.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+237f670105a254a230d4@syzkaller.appspotmail.com
Tested-by: syzbot+237f670105a254a230d4@syzkaller.appspotmail.com

Tested on:

commit:         704340f1 Merge tag 'x86_urgent_for_7.3-rc4' of git://g..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=113a48c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=237f670105a254a230d4
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=13587df9580000

Note: testing is done by a robot and is best-effort only.
