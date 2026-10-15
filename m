Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9F63E7159
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792036165; cv=none; b=Ik2D4XyI6c7ZcxZUvt2zrfrA12YTLWQjtpkVRVAChsNWL/alnL4xBlgj/WybMCg3piwKJ0lkIU0PqJ9142vlLtIisQXvI3en2Kvj/SYEkaLNEpKId3grNtNXv+lDRwxHtB0FxK92ey6eLu8+o/I6mQszvJ4NFvH9KspmaPTCayI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792036165; c=relaxed/simple;
	bh=Q+/PZ2OIQCBAov8P81cijscQ/AulPsSIC1Y/v7fM3Ok=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=YU8Kdn8+s6aWJ00Jh7GjSzIm0FtaIxwIJjAzGtqIcKj4PHrpGUT/cS24Nxvkt+FdLj9nfLtID3uXNSKce6+vBihxpxVbicQblBuzpW5v0X6BVqsnRCNOjaUWQsZGQZ+zuMr/C2r71pcFVBFNzFyaOFaEBhgZQ80z+gN2epB+/vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQmPhXUF; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQmPhXUF"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-93e441e14a1so79652185a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792036159; x=1792640959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENjx/dzeV7EHPywYmHzcSjy4huCWSW2biwgXvwcA4ko=;
        b=GQmPhXUFprhV/HboAKnb289K66V1IcHNyJWX9CmDOPDTRtuuRvYvD+6wP/Xujrkn/K
         xB7ppV33I+TZ0S1wtZXkXoDo+BZEBAvYpnEqvgcFNIbkgrbsdzgH5fL5ZjSbl0TCt2zu
         myhbfv/LW04zsMG47wIdGXzD0MHhTKJQuDZy7am+wqSVwQ4SxxZisy89VdL92P+z3ObP
         WuTbeSI8cea15xAWp5XXXD8V+U1l8vozuMVLnEzCj0DEWXSnlyfAWNVhDPugvgI1SPuJ
         UPy3eBah8bRwPxFFV6Kw8cNXELmeLSyFuYe7QA2VeG8cME4RfdL0DLJtBtOpV05Jz0yh
         xQtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792036159; x=1792640959;
        h=content-transfer-encoding:mime-version:content-type:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENjx/dzeV7EHPywYmHzcSjy4huCWSW2biwgXvwcA4ko=;
        b=ZdMrKP3tOELFsboXvmPZ57jCbe9vzIoOUPp1Ivc6n5t0XRcmwf0ia9yVdU8Z0jXU/t
         F0iUpUZWwbuMrQ8Pu+Opbr4Pu8zjy0N39sirn+yfuqXNVBzeZOUIN3DmvFEGN3JHQW65
         fhHNTVM4yUM1RpfNy1oTWwAPrJ5iR8eTu6WuKNTy95yjcIASbyqMX5i8MFnPiaFXoMmG
         0U+9fgQDfsTXen+AkUP6Y5WPIBcz0wl7wqM8m8hel2ghoRux+aHCYrdMJfUUaOcgTxRw
         1FPIotVtS+S8EJGsgto//rgbW33o4fY2n5HFwVLyGDoUPEayjH+6+flURK+EUU59VfoN
         ZEyA==
X-Forwarded-Encrypted: i=1; AKwUvBw4KiXqh6qanxsepHpAgOeMc9mn1v6H7hTXJ6jmD8HyQRwUGz9Zfi5zFDM+6cLHtN0rNZzyXOrd+q6ENr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwO3sGfaKZQ5EJUuMQeGk/8bu6eUvgRDKtFLbSpkRz85+YZNI0
	lvL7Z4UbnfUu+dAdILoY1HKEC8yOlJGa5WIyMs+m9vmaXG5uhjbrMIM=
X-Gm-Gg: AYBFou3emYbRauNfxfGOd4PcdLo89wHOn1nOOvpLeHjFPiPuM2AnJWDcW7Jgh3jc+eG
	/pzJlJ4cYk4WZHzKxlWOa8qtU97qcxhEf+3XJcezWT1TydXx9+nKPmhAP8M9Z7U9pxRlJK1OXbl
	ZNRq+/xpEzY2barjp2q/h3xL2pPUfp788+fuaUYIxNmgPO3u8LW1iS8ao5K64aXbnC7E9C7pTGw
	XvxtqkpBIv87wVbslMcf81Iw3nrsmy20n6wDzsTFHfyMYGhBN3cuvDg8zlikMsiF5omC29eL7wS
	GVjcvG2JqIJdhDDNKYTpPd4YRNYtV58QKj5iWCUGcvOh/+hHIqa4fA4FDH2mjX47jQcPT8CqrXW
	Piq2FpvKGk1NXy5pYWOF0zUYd+qMVD35fJNmdEuepp1Dp+4J+fYclGAdzk1qR4tqJqj6pQ7VI7Q
	pwr3vtWa9P7WNktpc2UNuoY4hNQRdwyEmgCMdxtrS80ovxVhyRgw5W29RL4WdBbYZfpzEphXsUA
	btfSjg9/nHelncAtsenVrTrvyoeQKIr5NPSkqAS2ql6cg4OVZ+eFvJuI8E2skMKhQyhFP4E05Lm
	arH6eA7nOjt5SxJ2EsGp9QyWoyZi
X-Received: by 2002:a05:620a:a0c1:10b0:93e:c12c:4415 with SMTP id af79cd13be357-93ec12c4ac9mr2095381285a.81.1792036159449;
        Wed, 14 Oct 2026 20:49:19 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97b3864dsm70540626d6.14.2026.10.14.20.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 20:49:18 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>,
	Vasileios Almpanis <vasilisalmpanis@gmail.com>
Subject: [PATCH 0/4] usb: gadget: pch_udc: order IRQ and descriptor lifetimes
Date: Wed, 14 Oct 2026 23:49:12 -0400
Message-ID: <20261015034916.2773248-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fixes are part of our ongoing research while reviewing kernel code.

Apply after the published probe-cleanup and VBUS-work patches:
https://lore.kernel.org/all/20260811-pch-v1-1-f79801c1cd91@gmail.com/
https://lore.kernel.org/all/CAGEsz8GQR2vJ8ddedaLg=Yq_RoeTxgoXTQ4-QS8mJpDXNn36qA@mail.gmail.com/

1. Drain works and release IRQ handlers before cleanup; establish a final
   controller interrupt mask after the PCI handler has finished.
2. Initialize DMA before IRQ registration; enable bus mastering afterwards.
3. Track successful EP0 mappings and return -EIO on mapping failure.
4. Return the EP0 data descriptor to its owning pool.

Compile-tested only.
