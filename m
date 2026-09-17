Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B304F4020
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 17:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664585; cv=none; b=EEkqQYFnTG2/nTfSXFo0vAKmPkk+OpBSaLL2E9AoPUEpt3/Cjc6k0zwojVr++0B83/TiJATfI7++vCETrjUPcRBiScwvhA7HaNrYzQ5VUnh22lfCipZl0dSeY7k/tqcAFrWT1GbQ1sPFAke2DnIAmNJslrueHeAjucmTCZoUbeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664585; c=relaxed/simple;
	bh=NRvITaiiXWptC1uzBHoNdNFCcd17g8eB2pEy+LpkE0Y=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=qIWl64JThG8twie2KPzqxQ5bZrUIu35/LZ8FaEu4pgRnvtIut3f6QkzAW8fJmip+HKT3HH68pN9y9tjIj7qB3lk/UXgQHivm0P/hWs/IGF21V1Ll2/OlQS5d++Yq35Y5GUgk1ArAA/k+2gnOdg2k7mJteAZ82MehmIBsIE+KW78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6bfcf73dcd5so1443302eaf.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:03:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664583; x=1790269383;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4LsF6bMl2dTJE/GRevkIDI0w+xVPSjZ07+ObQQb07lE=;
        b=DF7b2azE62k0QzqCgXD6oML05oUwef8gd5cKSZh2+S4N+zJiQYBFn59Au+OEiAXnxh
         R2asgjUthA4yfm3P1SIdDGEcCEKavNdCtZzd5uZnqi95RLNXGOQLGSdQEb5MVoTKzM36
         KbQ8QXi8nKPTAeuxt2O5UJj5365hHBtqJi0QZ+oq8EoRQ7BFNfyKCb46tKY0DxXpLH5y
         t1hEFTuC3xtRq2SWOJtxDyTbWJ7KuZNgmT2VkttAuIdWX/jGDQExCvcys1Lh/M/SjU9z
         y62kA0/9tHsDHdgNC6eEeaGBrY/fGH/M7Z4TGC8rHBCa7/UvMnzvWWjusd23H1eSB13k
         H0GQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/ZPTzD1hT3J4Oqek9dEcOEA6heIo5LMmaTLLxwrJu71puQU6d4HLewSNRUaZhgZOTpUsu5at5X+T74bs=@vger.kernel.org
X-Gm-Message-State: AFuF++k41AGRJDdIADVYCI82Z3MUEyc/eM2/FAamPjcSRWaR8kswcRFl
	e7nG65Ha9xn3lghD3XzuWB0Zmk3pbjoNBaTq9hHqgabhfJRNDIX54wJO2ldZnfwSP4WNwNCX9+4
	VT8ihsccN59cr5ykLFuGSY64GCPuKpBv2o8JXO9UXpD2gLki50NB8NnSRueQ=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca7:b0:6b7:8415:d779 with SMTP id
 006d021491bc7-6c7d27deccemr6769728eaf.36.1789664582946; Thu, 17 Sep 2026
 10:03:02 -0700 (PDT)
Date: Thu, 17 Sep 2026 10:03:02 -0700
In-Reply-To: <20260917164835.99153-1-adarshdas950@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aac1d46.b398a7c9.1f86be.0020.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
From: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
To: adarshdas950@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com
Tested-by: syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a7d8c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=17ef1bf9580000

Note: testing is done by a robot and is best-effort only.
