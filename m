Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB373AA19B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 02:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788490753; cv=none; b=c7MBBEuqkXGY43ElhI1bN6UkjFX5OG1Et2Cvs0aRSjAC/wKVWDu7UPKafqFdjIb2bw3DbtSlRt5nW3ycM6+RsjYtJq2LHPegLrhmyw9FhVmo8Dt2pGm2LGHweMDc/4JJUq1fOSde3VL+zI4B2vqi5KSx0DFw5aWMpnrKQ4BP/OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788490753; c=relaxed/simple;
	bh=P3KGJqvLDVQEGw1qKiFatH8JZpCFUTHLvw8aN5u+gYM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n+t1nu3Qa8AcJUNEQMrXlw3rzk0LKCYzXaDqKXr44JqkHRBFyUxCHBl6Jd+nO/IiUaGHXFa0xPqw9VBOhG/46TzGi4kMVEzp8BUCZh7bFLU4YLhJGqGiMik1Gc1AU2vHPw4i9Eg+4fVza5TCmHn7YxkADmHKdp5htkxyxbMI+t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sBqHiJDd; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rathodpriyank.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sBqHiJDd"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso724766a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 19:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788490752; x=1789095552; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3KGJqvLDVQEGw1qKiFatH8JZpCFUTHLvw8aN5u+gYM=;
        b=sBqHiJDdKVIO0hTeivgkpF4DwsbAQSasR8LFgpAk8JcbyD0EJX3TEOhXmk9vIyvu1O
         UiCdupVTGl9/dvSy9SO0b6lXbGqTMMItwlT6I/aBjdvUqYxHtW6IdNGzABYjmTTztWR+
         soUb9OjWP5GOZLAmqc4pagHsJKpGT345KvIudX9di3ZMjCE+3whY6bPs3x5ftBwHNBGn
         kfyxlNKoswj1CCBnxcEE239uYWiBoKqLnpXuQ4AdA6zIqqaAVnkCqjvrzq8AR+6rF5BK
         Nbpvn5AEa7jGeYhtgKALDOmM2MW/lG8ZDVQJiRIJTY1Z65WRoTp2pOSKfllZXcpUIT8G
         KH5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788490752; x=1789095552;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3KGJqvLDVQEGw1qKiFatH8JZpCFUTHLvw8aN5u+gYM=;
        b=GvMVKk97yPju9YB0z9qLfzSTSGJWlz8n2kou/sm297X6tePcp+s74auYL9gWQfZUmr
         Ydwm7N/8go8VqJ49Le5DIa9A1rSFxmj4gSeo/xft/P/kRef9lycwuZsZM3zkyoojfB0r
         h13ivXvUdHxAuLh2BtOZcKj2NhJY+rG7Q3zhDYGJqJLOK72VGpT71a2TnJ81eR5+DKZc
         OrNnnk8f/IO7AyQDV+PcgHSlUn4+psK8LlIWsP+ZP+G1g3KnjqxHuRtKq5UdHtW5dwpY
         qbzTGzKmgb5wU6HDBDVTVVP5KvV+iFePMkqvsb2kkS0+4/E1GcFcW8n95Sh7cu6nbX2D
         0idQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3AUPZPBX/66TQMybtgLRvTxewGQlz9rzxX8OZIJ/mqHMmlD4ZeUU87ffJg23SxJRgBjJrSiDDrNPLwHw=@vger.kernel.org
X-Gm-Message-State: AFuF++lDQAztP/Y+Ij8Q5r8xL4oKoGtmyO8EeHoczUdFTp1zLnBwQ7KR
	np3+sc9WEeb0Le3zJJD3gPZ0hhLKR0cd9RmKeAtPxyU8O284NDl+3w0mWpucFFPG82Hnrh/RIlW
	fVEjYn+GRAmL1gHY6g46mGlFKURLs97WzWA==
X-Received: from pgbm1-n1.prod.google.com ([2002:a05:6a02:6181:10b0:c85:6deb:ee45])
 (user=rathodpriyank job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6300:6708:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3da3a00565emr4270762637.16.1788490751460;
 Thu, 03 Sep 2026 19:59:11 -0700 (PDT)
Date: Fri,  4 Sep 2026 02:59:11 +0000
In-Reply-To: <20260803-b4-fix-aer-memleaks-v2-0-fd199b0171fd@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260803-b4-fix-aer-memleaks-v2-0-fd199b0171fd@google.com>
X-Mailer: git-send-email 2.55.0.1003.g10538fe699-goog
Message-ID: <20260904025911.3960034-1-rathodpriyank@google.com>
Subject: Re: [PATCH v2 0/2] PCI/AER: Fix ghes_estatus_pool memory leaks in
 error handling
From: Priyank Rathod <rathodpriyank@google.com>
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, "Oliver O'Halloran" <oohall@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Priyank Rathod <rathodpriyank@google.com>
Content-Type: text/plain; charset="UTF-8"

Hi Bjorn, Mahesh, Oliver,

Gentle ping on this 2-patch series fixing two memory leaks in PCIe AER error
handling (ghes_estatus_pool exhaustion on kfifo overflow and when pci_dev
is missing).

The series has been reviewed clean by Sashiko AI and compiles with W=1
(0 errors, 0 warnings). Could you please take a look when you have a chance?

Patchwork: https://patchwork.kernel.org/project/linux-pci/list/?series=1139683

Thanks,
Priyank
