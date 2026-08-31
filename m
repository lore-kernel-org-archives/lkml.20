Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F0D4AA3EF
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788189217; cv=none; b=Nr9e0BlqxQzuOQKaIDdHwgjja4bEaUXZpNN/w/QDV5vyO15342mI8JbT3+0lF+qUWLXb1VCLQCCawMaVII+KxH2zSHWDEN2gZ+rWKFtTotUObZCLZKPTgSPqMct1f56VwpXygAnB9Ui+4igGa2oo5hllhjzzyrLxNa7CMGDLn+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788189217; c=relaxed/simple;
	bh=QmzjOMvAGe5EUV9TfLYpYcSWajjrdD09LcDHk6HQaQQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GhRz4W4qW0ARoa/E7AWUBWPyEZmVp1ss3PTEPMi9ZPFlUA5EdlCNKJhb1wxkJ/odbVet8cpOyhfinexeVaLoEhqGsuSDu3fkdg/9pPPI+K0yqomte1LJJUK81tlNxyWNC/U4OIdo2AtSJa/BgtIo40/R6wBs7hFIKjTrQiphBAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oDy6sf71; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oDy6sf71"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84e04df8c46so3850316b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 08:13:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788189216; x=1788794016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1HVZ0sMwY5VGl0utt0N4y+S5aIM3f5C/jq8p4GsPHw8=;
        b=oDy6sf718+xH2v3shD5YLkSAL2ZKaZKA7ig/xQL/CEHlh9oFR+V5ulmXEHbc6aUOkU
         eNE1oNeX9GRLCPVZh/SDh+gRUGf+xB9Mj0k+2JXtxlunpPsaFDzcV/S4lA+5z25sg0fO
         zkQgQ88yIrXQqX7DUAPmX2e9eQKae558c0r3uEIGioEjtneOafKRkFImksUnx3SKAjwX
         RHglbLcsSiphLydHId+u2FYkZGIdcY6kfEqjrplxc7N2OvPJp390RnGcNFVbSzMd7Ec3
         WZm58J1u3L6GIc5VMkTMAaK4+lpAx4WGlXKro8MTJFkkZSzwFrHQ9jUm+pHc1Tdp9ssc
         3MZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788189216; x=1788794016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1HVZ0sMwY5VGl0utt0N4y+S5aIM3f5C/jq8p4GsPHw8=;
        b=XYdQUXn5ax/Njnmz6VMdgJ9+q364x0tdyVnFC20offlMxEGgc3DNXnhaVEGI6BhPFq
         pCGqKtcqiBgVPiOnbogS03E8kZw9UmafekSWXpSaj/VFSxO9eMvGhrjwP18O8SfFyHIj
         xGGFW2QgCnTldeWcT2zmZwL/F8eSUEfxFIsSv/KGZpHGLNDn/XNwCuvpLg8UC48nm3Zg
         sRTuwhK9WI6PN0EDv6J8FhYqV8d/o7/We9OshGQtUKr8vH1OB2KZo8jximUhsfrotmgY
         zcyV3BjlIftrEilVFDhQBBx7uuwDNO8eKuTRS95dgA7S8lsTmyzi7wXHxLRiXvLTLu8v
         cPNA==
X-Forwarded-Encrypted: i=1; AHgh+RqZeoKoz0902McqsKBeMDZZKOvyRmOZ71BbRgj/y0HbywAPisrQKJlsPVjUBcFKmhJOTq1TR4QCvzkKbxU=@vger.kernel.org
X-Gm-Message-State: AFuF++kV2HbJmtEpCaYxc+h0smBgLceeH/u90Gg17OvJ3luFRAculp7M
	4zcrZa+2zOxWjBnGj5sX0ywX1k8yxChNZ/thrdFxrXxiO9l8j2ohUTRCI8iuHeZ2
X-Gm-Gg: AR+sD11g3SxB7piflpbmBNCALgq72d16OxsuS6K5++2FA5C1ZF3fMKw/WCvYhwviU/P
	G9rKqCUbsdCZq9sK8kJ08t1xeRxENcrg4+IHtva/EvYZ2vF6q02tAoUN+0V9QOOFPCoYTr1vHox
	jRZLrUR43/1LPJ4PEurfLCC6Sl9kTq+ACnyuvRy6L8roRCVxGRaPpL6RI1HGAaHGmpOyxXpUj/3
	CrRemIRcK6aAW7VZh0b5KveKhN7sdu23w2NxRjMNHSytA+pQOq7seaIkQ9RIrnceyvtpMCCmOMA
	GtKLmr17jc0BaUTC0J9Kp5MiB2xQT1FFuEI/NIrr9v6PmmO4fD8XIU+PSpFlixNThzV801lUy5B
	rOwFHc0xNQnM53to/k7Me+R3vHAEPpzB+xX4OKnuTgfrEUnhioR9HVnavrJtFWlgaN13sBFz36r
	rh27wYdQN/mlrNV7be1WYDwtOW4fbbQWcOOAGL7df7gndm9y9Q8jk9UyDtDqGGk1Vo2KsmJJn/t
	Hg=
X-Received: by 2002:a05:6a00:17a5:b0:851:c2a6:172f with SMTP id d2e1a72fcca58-85628790cedmr41629163b3a.7.1788189215805;
        Mon, 31 Aug 2026 08:13:35 -0700 (PDT)
Received: from localhost.localdomain ([47.100.192.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569ff73a9asm3887764b3a.27.2026.08.31.08.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:13:35 -0700 (PDT)
From: Yang Wen <anmuxixixi@gmail.com>
To: chizhiling@163.com
Cc: anmuxixixi@gmail.com,
	exfat@lists.linux.dev,
	linkinjeon@kernel.org,
	linux-kernel@vger.kernel.org,
	sj1557.seo@samsung.com,
	yuezhang.mo@sony.com
Subject: Re: [PATCH] exfat: speed up file creation in large directories
Date: Mon, 31 Aug 2026 23:13:18 +0800
Message-Id: <20260831151318.1238209-1-anmuxixixi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cabf4253-1d07-410c-8714-062317c9967f@163.com>
References: <cabf4253-1d07-410c-8714-062317c9967f@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Zhiling,

On 31 Aug 2026 09:10:32, Chi Zhiling wrote:

> The exfat_free_inode() could be called in softirq context, see 
> destroy_inode() in fs/inode.c, which calls free_inode() via call_rcu(),
> 
> so you can't call exfat_name_filter_free() from exfat_free_inode(). It 
> should be moved to exfat_evict_inode(), otherwise LOCKDEP will report a 
> warning.

Thanks for pointing this out. You are right that ->free_inode() may be
called from an RCU callback in softirq context.

I moved exfat_name_filter_free() from exfat_free_inode() to
exfat_evict_inode().

Thanks.
