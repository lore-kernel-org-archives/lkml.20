Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8A44FDE42
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 16:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788796891; cv=none; b=qfgM8z78ek2yh0y2OrhyXuQd3PO1Qz1kPSH+Vp8m4k9y6LS6UO9ItDH3x2p3L8F91w/ICcrHSoVb0cf/twEwNaYbRfhLCnV8vYNr/B/vX2PYGXcOFdNZm4m8fx1VB67HHtNBAu/AhiLNNl1Oca2qdoUYUClAuOg9Pl2E8M6+1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788796891; c=relaxed/simple;
	bh=ovy1i8amQoUyc5iZnCLhVu4yaJWco/8RqLMb2G6G24c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=ZSjp8H/SRXeYsNQf46FUVhhYSJL2Q0rJ9Vj14/+FKYzVQCMLa2FMLpdSt+fmaqoI4aGBmTeuxlcXF7uKzWJ0j99i00Eqv31EXg5XBOwvZWT1BSF2Vpxw2m9NdbLMXVR60WnxiZ8JdVWuFsHpjav5PIFDv5UqTalHwOpDu9y2pNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b28d9952a5so4556242b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 09:01:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788796889; x=1789401689;
        h=content-type:cc:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ovy1i8amQoUyc5iZnCLhVu4yaJWco/8RqLMb2G6G24c=;
        b=TD8qNl3egbX3AlEJK5XPXkV6afmyA60GhOfnEfB3gVDKWQlkUOmAyw14b2N5pUY5lF
         yPDCYb8f3mU/fkuzPZ/Vo4GPvsUxZ4LfJKV1fCKiOU27U1GmjYkDgfeM90ToqXf9hcfy
         7nWp4BY43yBTlH/VwClXDXduTK6ovQjooT8z4dL/GaM3mBKlINLDkkVR2QzWzo7hNL2R
         EusBcgUC54GdpJq7dEt+C7zp+zHBnAKltAsny7u3iEPt5qWkrl/eNTzdjIK+1XNA9ObY
         VNc2yhdKZ7WLCF0bMWRZVZVuAF+9a3VwqaGbQN6jsAU34lA1I4zRNRSdmXw7aa6e4zwS
         2Q7Q==
X-Forwarded-Encrypted: i=1; AKwUvBzFUKeuppo3zwx9G3n40GDtijutNvIC4cT5dbG0Payz9z5wYs0o6AeT/YeUcRLOhMXEoOekEFWpe5ppB+c=@vger.kernel.org
X-Gm-Message-State: AFuF++lvawDeEXbwjbX4C4rin3mpqWLGpPWy0Encbmi1DlJgvXxt9wBf
	teqYcklTUGaoG6HeVKgyBq89VD/Qg1Xn44oVh9v1/Z4+60oEccRkjoOeSqlchZbA5V0ELfvnUSY
	LfsT7rPkeZLTIW8WKCG1nUnzXHA7oKf+OVW6em51ZAzekoXBjF/N5KX5jUNg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4482:b0:4b3:7b31:8df7 with SMTP id
 5614622812f47-4b962733118mr13905744b6e.14.1788796889410; Mon, 07 Sep 2026
 09:01:29 -0700 (PDT)
Date: Mon, 07 Sep 2026 09:01:29 -0700
In-Reply-To: <CAKD4hN71q=7K-x2XepVArdCPAVXbddvCuBagtGEMqk9bsWuW_Q@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a9edfd9.f81106d8.4d30e.0001.GAE@google.com>
Subject: Re: [PATCH RFC] usbip: fix use-after-free in event handler during
 device teardown
From: syzbot <syzbot+31117fde582fe6a0cd62@syzkaller.appspotmail.com>
To: syedtayyabfarooq08@gmail.com
Cc: syedtayyabfarooq08@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

> #syz upstream

Can't upstream, this is final destination.

>
> Verified that the reproducer no longer triggers the bug using #syz test.
