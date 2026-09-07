Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BEEB1940B0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 04:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788755688; cv=none; b=pBe5b0fSHnBIGplPHl6mdACrdTIoJd+M0dmE1AxJAirYIqeMofUMmWlLLDbPQ3aSHq+7ZgqSkVK3S/VROil8+W/J0pJe7WMPHZiQ18Zrrpxejtvz9CCU6Ayk2OnnuHIxF9hJSL6XOGaBrxX9zSp2rh4Addn+3hNAeUCj4zBjorE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788755688; c=relaxed/simple;
	bh=GdvUFGkcyNhMFMrNYN8bYb2hd1xJawOJHifEqBfU6iw=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hak4l598Jw7wYoh82lcASz+dfu7Iimc4BpqChd8JzsMsVkXyMhqI8r3ne33eKHu1HPNwR5eW5ORiDncJtWw+pGdK0d1GkMHpHfQU69Ht2wmtacVUiuOLlAz2DgWwRMsaYWw+OLLCgzlRTE5CA/5Dmfi/jiVUj+vpURbrNsb9MbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-6a313ec13ceso3892079eaf.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 21:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788755686; x=1789360486;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GdvUFGkcyNhMFMrNYN8bYb2hd1xJawOJHifEqBfU6iw=;
        b=WtBOyxs9PscEFs3M2gl3BqFeQPjke1lqb7Jg/gKT0A4ti77I8VSLB9++J0a4HfTNcL
         fjYtpZ/T0zEOJ2BzvwF0hA0xZZXfCLRI8GcHonSCgRmSHhNofCb25eWZOP1qpl0adiT/
         mHmGZ/1i2ZBj4LqRtQPyukRfGZ1C4/sEjOlyANkTcr4k8qipZ9xOIihRJqJVJCbEEV3S
         UCmPwEclH9qcnw5Lt1vhLJk5fEsHiGCm1R5S81/21SSSC9qoa//wuPxBrXAToGXFaHZ/
         ic1KG/d7tqsu9gfWGNffw9T+3rp78TvdjHQ+3V9Pthjy/SCfkzxdBAPR3qnKeJsYxKbx
         Z0zg==
X-Gm-Message-State: AFuF++nhlVQafAIYgRTWS73mhaUTizi44RaH0eE7V21zsI/biBVnpjys
	RXNf1kMsfG2/pDACrXKc5ZEi5AMnV6HJ1a/mkAgnkME8ZjqKGp5ZTkYTWktN9cdvPbgelBO3auk
	0S/kQouV3lMMXZQxOr4Y5XG8Y2xxF7mXJSlFmeEriD6EWrspRWMAiGSu0LVs=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2208:b0:6a3:92f8:96ab with SMTP id
 006d021491bc7-6b6fbdc70femr19916284eaf.1.1788755686397; Sun, 06 Sep 2026
 21:34:46 -0700 (PDT)
Date: Sun, 06 Sep 2026 21:34:46 -0700
In-Reply-To: <6a82eac5.dbb3a75c.20434b.0055.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e3ee6.a6639fcc.23b8b0.0011.GAE@google.com>
Subject: Forwarded: [syzbot test] WARNING in usb_composite_setup_continue
From: syzbot <syzbot+a83a5a1ba9ff57935171@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [syzbot test] WARNING in usb_composite_setup_continue
Author: tkdkei@outlook.jp

Hi,

Please test the attached two-fix patch on the current USB testing branch.

The same reproducer exercises both usb_composite_setup_continue() and __fsg_is_set() during rapid configuration transitions.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

Thanks,
Keisuke Tsukuda
