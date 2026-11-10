Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794312845;
	b=PpkwHdyPFseSXOyZ0fFtWHQDg/ouUWQx2nL5kbb1lSO+QLa67kcQ1dSdNWdVsJ8SxsrK
	 Wv76VLoqItZG+WFYeVroO1EcSwwBOgJcuhNp+VB0vxCev8G4RkkmDHJ0NGjrqRfdYOWeX
	 9ebb11P4IVdOnvX5RY/frQid247/UEAN39t6+MHmTG5RDq63jYj0UVWIZP5qKg/mvmtGq
	 tMDrCckrJosJEw4kro7e7t4+VOLocQw7O1GY7xJ90Bby66SLHFIC+aIgtTSb6klftp6rQ
	 DM/qgmebCGv4o48FYSJ8d9jOpOCz0zxR6kIVmS+2RzY3Yy44FXXZmHZB89AbMpoOnCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794312845;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:In-Reply-To:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=9XQf049qlMr5l+2AJNntOVaRI7j8tgv5qMJR7B8HYEk=;
	b=o4VeJWqcHN28WnZnwVAagsmRcCKfKOTv7wkM/+ZMzaKJN8tXfS6EFGlsTFwYJCfA7rep
	 r8s5x876zsixAg9eMGbYo5BC6IPzJzaAIUbnvUVztLgITAGpfcwPg8TPhcKbANyGBf/lK
	 JCmyz/2zQaofCosidFn3iaWa5sGQbQjKQuLkKKHxazBRxJmUXRRGxXLE/306i4bGycLAK
	 0SapzSBskW3IM3AP/9U27wk5rnW5tbFIwAWkInQmC2hIPerhXbVWXHMKmStRJfb0aWvVD
	 LpA6o+lFvRtYnCcxF8ZMFWiMAKRIF8nxXE8HKgEIuKi5e9ArFDOhL7csK+Q1GhWBgvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.161.71
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B32606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 12:14:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5B32606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-719112c89f1so76221eaf.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 04:14:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794312844; x=1794917644;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9XQf049qlMr5l+2AJNntOVaRI7j8tgv5qMJR7B8HYEk=;
        b=y/az77jrb87+Sn6y/MHDlD6blkdhW43fWI/a1ZsqKjO5WVEDyTgNHdVN/EVd1vVPsN
         isReftsnTqSTvSuRa1oxLP8iNselrDosQj9zFICXSanZxZh9a7KopurdT27sLTsEqeR6
         hmqM5qh/ykchLhhc8zIRYRHyl7P+2fLM5ryODORwToPl4E172jyOpuWNBbIvrFBF4N2+
         vagEobgRHAxEIk/119tHlrvClQ3XYKarWEtVGVGayC0X61Hd4Wu05mbg5gLCj0tN2tKx
         2+TebEMJxXJlqb55kHp6gHSzkkSMu5zpMz/Yex3K0uIXXuPDLJINaVKbWz1Uh3qAZ6NJ
         uoPA==
X-Forwarded-Encrypted: i=1; AL+hErH52vEGMxSqa4ahpuDAUhP+BBXjBAucTQZWdTnIn6oZk9Q0E08BzYfz59piVrPBAfb+xHweg3ES06cMuPo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2juy9Hj5+PaVkLcRy1K7UiVaAdWaSFlJJT36WDnf+F3QKBChk
	MDe8zJE8JHN5exoMYjBagki7IfOqLaAZdOtTKwB+vWIFAc4CkvTl1/LbMwIcoDy4DfwQltTKbWP
	GbLC7Ym+2MANgEMb9/Ce/5hHZPBfamQFKcQQzqoK/HnsVzqFf7Q5lLVm+u3c=
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c1f3:b0:567:e9b5:37b6 with SMTP id
 5614622812f47-5683ce042f1mr1853184b6e.41.1794312843853; Tue, 10 Nov 2026
 04:14:03 -0800 (PST)
Date: Tue, 10 Nov 2026 04:14:03 -0800
In-Reply-To: <CACbwGuToY751Z2gkHGVFE+r=NDObep3X9YrgMq8BZz5DOKZreA@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af30a8b.3aeedea3.3c289c.0040.GAE@google.com>
Subject: Re: [syzbot] [driver-core?] INFO: task hung in usb_set_configuration
From: syzbot <syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com>
To: gbughunter8@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot tried to test the proposed patch but the build/boot failed:

owned.c:1: error: VRP_SYZBOT_DOCKER_HOSTMOUNT_IMPACT


Tested on:

commit:         e7a52de5 add one-shot owned Docker host-mount impact c..
git tree:       https://storage.googleapis.com/vrp-syzbot-rce-842629920185-1108/bare-repo-docker-hostmount-1110-e7a52de
kernel config:  https://syzkaller.appspot.com/x/.config?x=8bdeea7ee6735f91
dashboard link: https://syzkaller.appspot.com/bug?extid=c22bb42560ec86726aba
compiler:       

Note: no patches were applied.
