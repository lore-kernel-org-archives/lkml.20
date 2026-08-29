Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C6345ED6
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 06:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787985630; cv=none; b=BNpVA4dMA8CVJ8McD5Qdik3YN8e3mou0TXD9YyFVy41WokELEAsmq25pQXPXSDA2eFL1lJs7yFSDKUicCb7j46T/OPUW/sCggv+O7nJbCvvVrZ7uqZiFENr7eYuH4nS5h5PbXf/AUnn00MjdK628yVkKZaxFciWaZqL4skaqq1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787985630; c=relaxed/simple;
	bh=Sseqr9v2u+9IdH1ncKFIbfqzrLnecsZu0AT53ZZPrpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cvau7Hywq3MLsEV046+kw9MvbpsemEhymozkptgLgqzdZJJqgwQxQNtcqGogXiRb+608rCVsdXDzpALUty+fNgL/pN9yPGI4WB9C9ua7a9QJ7zSBkB0qbY1Ra2Ntpq3AIR8p9q869GHb495P7xMAN+VXQvQu4mkbxvuvx/IwzDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LNBTOLFE; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LNBTOLFE"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso4586115e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 23:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787985627; x=1788590427; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DWtTAQIr3GS9yNff27bhqyvWbMb6qON5ieBsdlpRi8=;
        b=LNBTOLFEbiwrsvcDZDDskP24HzHsQqRF+6dC15Ly8gIOnen95xVLjtVzO7RLuRaNji
         jE+esUyT3qlDyefgbN/4GMlR65ERoYeYxbUN1GdPWO/9iTqYsJazXGHw1rfDEhfcsbpY
         L3CreqWr9S1uu5S+NiF42jS/hdxgltbVOMpaLIlhImS4+e13s3Pm0ZN9B1AyKLbwUD9a
         5GKkK4ibhd9QbMt/lN66esjdIZCWOq8wCDwlfn83gaQJMVZCDlrUpDuauYlXqu9tbUoj
         KC+5m5mtUSFxMTotJAN2jMpGkN1w8MViYc7UezXTN9ycWTpNCKMhkqIiQNSDTPUVNQqX
         JHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787985627; x=1788590427;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DWtTAQIr3GS9yNff27bhqyvWbMb6qON5ieBsdlpRi8=;
        b=QqC2uojUKnAXz1V2Be/EwsjPGibc+9dkG3Mvi8UxIXg+CBDGW+FYMX86ctsyVcCiWD
         UIU6edpksvDLGVyBMrbNQkKrYOWNxNOA88lZ2yJnbuyvLTkqFo9xn/lrBITV+TfQBJgz
         uZ2HTcdQKtDrNSMyIzwPI46HCJY6xk22Y3Y/CNOAlNOCxYzb2lTLVbSBV9+iybIfiEeO
         B0Xl8mQQgsND0C7puO33LcpSsYz0cZoNnPYl5Hdcf7z8jvSOGWn/kYZAg5qyGR/8m6ZH
         imVGnEJAjAoVtZLi9bwLeKIXXbS68wn/heTUy23btKCNNcJtWCdBh+YrKLoD3hA0uIum
         GR8A==
X-Forwarded-Encrypted: i=1; AHgh+RqQXMIdSdsjDAI+14DRRJF8Rs/eAJ8JM5SXRKWHr0uPx1tuUtlwETuEwzna+nl+s+peNV8gYbBxAltAjPE=@vger.kernel.org
X-Gm-Message-State: AFuF++m5oPqblaaJfurVngfctIzCGWojTtV4URhmw77mRWhBgrx0I2BO
	VRZDDzhpAOORgquF8SB4iAzpMwkO0saaTDmrkWoqpVUinWJu+eMcRbbt
X-Gm-Gg: AR+sD116ObPiEfMhUzHwFizAM9uwxlEAfgEiHWV1+Csz8aYpw88t6gI9XVopbCfRGdE
	FTkDpmmbXIIp345c9X8/beI7nyjK9u9bMJWwIEInQ6oQ0MuGfbZ9sKmm6SN9hx+nSu0WSOZt4eU
	x07j3V9tyN7SNb1WZWuQabhED8cc0idQqAw53Ftw9/+Ag+bT2frZkhvYqo8sBuosKqh3n77VftM
	L+bBR0a6b8xQOIqXihwzs0E4o01th2mstBCGJ7bhVgSltzekXGuHqkpX37teFKwyvTcNW8h4VsS
	Uhssd8ixxsrwYVHA3tqy9VmBZr6OMHeqfftHuKkYUKdHPUAPQQELpUVIY2ApPLwraLJg38Qxpn5
	3mCH3DMeXeSBHvYMARj4Jcry4mtmytpFU/FEClSS1POTM7AFk4eNMDq+kqHu3GU8N3gZJXdOXj0
	ov0Xkz6JqyDQ5EsVoRHwDDsO9pETVBykZ8aeQyKCjF/XIrgR1n49gGzPjfURtgmup75w2KpeWQl
	6dJyUmTfxhETXopb3VDgQxfmBF5ZFlRmAw/iTceWlg=
X-Received: by 2002:a05:600c:c170:b0:499:afe2:e4d0 with SMTP id 5b1f17b1804b1-49b91c2930dmr196281065e9.8.1787985626920;
        Fri, 28 Aug 2026 23:40:26 -0700 (PDT)
Received: from localhost (brnt-04-b2-v4wan-170138-cust2432.vm7.cable.virginm.net. [94.175.9.129])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b94dc103dsm99954485e9.1.2026.08.28.23.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 23:40:26 -0700 (PDT)
Date: Sat, 29 Aug 2026 07:40:25 +0100
From: Stafford Horne <shorne@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux OpenRISC <linux-openrisc@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [GIT PULL] OpenRISC 7.3 updates
Message-ID: <apJ-2fH66_goKXF0@antec>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Linus,

Please consider for pull,

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  https://github.com/openrisc/linux.git tags/for-linus

for you to fetch changes up to 78004e9a87f240df03e2f73120d291763c32e0a7:

  openrisc: fix arbitrary kernel memory access via or1k_atomic syscall (2026-08-29 07:32:26 +0100)

----------------------------------------------------------------
OpenRISC 7.3 updates

One small item and one bug fix.

 * The bug fix is to fix an unchecked access in our or1k_atomic syscall,
   I am debating if we should just deprecate this as there is minimal
   need for it.

----------------------------------------------------------------
Ali Ahmet Memis (1):
      openrisc: fix arbitrary kernel memory access via or1k_atomic syscall

Julia Lawall (1):
      openrisc: drop unneeded semicolon

 arch/openrisc/kernel/entry.S | 43 +++++++++++++++++++++++++++++++++++++++----
 arch/openrisc/mm/tlb.c       |  4 ++--
 2 files changed, 41 insertions(+), 6 deletions(-)
