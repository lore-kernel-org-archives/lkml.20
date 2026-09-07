Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD7140243B
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764372; cv=none; b=h//C4WanQaNGcmsjJxRNNaKo2xQL0ZY6SVWb3EaK9QBsv+nmmvfkIJVN25wQ6o8exFNFceU8ZQ6cB++39kqj1m9re45NbVEuXMP9ZYwnzv28O195JNC8cKz6fhOMtpubGiyXEu5DwK1Z/31uAaikk/6bVTgE+i4xX8vrRmJMDAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764372; c=relaxed/simple;
	bh=ac3nW1sTK8h5uV1jYJF9R89yh1fwc488qMiWQHiY8+4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=cqgrEFlo0AYH2yEe7pcVyL3Uw2OLtaMBoYjIK6xkjV2iD4aSg7XGUra5LZnuOkfmi0vypvfUvkYYJRQB3WOtf+r6Qpsv9qFsAqCLELRAQOAzs2+Tjebsk4zWqd/zx6BPSxEnMe+ee3n51A+5aMzxSeaFj1f9CyG0rixgaccjhjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-6b1a3f01d2aso4406947eaf.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:59:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764369; x=1789369169;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ac3nW1sTK8h5uV1jYJF9R89yh1fwc488qMiWQHiY8+4=;
        b=odL/rlOSeeOIxzaegA2a5gA6dViUacAYlShD77/1/3qDTpwN6YcgFGXwNq6bbCVvNa
         rMvRyiAl6PQIkXY7dwwQDT52Q80oNUiBbIAnWn1ntKSmVVV/oU8iFQaLYGyqWIuJcbq/
         AQ/HyGgnyczxI1OLYOLJQG9LyFQOCo8F32IqNpSWop0M+UmVjO7a0yHrC9T34alBVzIX
         32fywWpcu+VA37M41mlYW7FlTEKL4ukdAVuOLfauvi3JC/qANu4dQlGavpfChtO1RKCR
         U1zOjbY+ftPRgBknYr7dNcZc2ulHI2GQhTSVE04vjjT4pfV32rCLxT1nsDgUylJQRpzp
         9BjQ==
X-Gm-Message-State: AFuF++mTBwrMPp3omreZtzCMOGCvnGw0DSHZ7554FaMJsJaRT7PnGxXp
	aY4J0o6kRjPd7Nw4Hpfa7xKXIIy9rX7K4Zh+oExxOy20jmqydwKFgQat50uQont9hEu5W6RQlOL
	KkXCxtxiL6SbPUFxn7dXRLF67890uafRtZPmSv8kSw1E8zeU3e0KTGlYf1R0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:221c:b0:6b7:46fc:1ca with SMTP id
 006d021491bc7-6b746fc0324mr11291304eaf.41.1788764369322; Sun, 06 Sep 2026
 23:59:29 -0700 (PDT)
Date: Sun, 06 Sep 2026 23:59:29 -0700
In-Reply-To: <6a82eac5.dbb3a75c.20434b.0055.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9e60d1.4a487d73.3c8564.002c.GAE@google.com>
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

Please test the attached targeted two-fix patch on the current USB testing branch.

This version limits the f_mass_storage change to fsg_setup(), preserving fsg_is_set() diagnostics in other internal paths.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing

Thanks,
Keisuke Tsukuda
