Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0304439A066
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 03:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889060; cv=none; b=KUYQDt1n85L2Rk/8hb5PrNnsZSNlmXJpIaIz0cBBuR/sxHOhmQCVt3GUvDrZVNYNVtB1wMN8jXMH2XOAqJMbnrty0+W56tMC77whRAxxOH4IIiuRpMKHV6zmzOCLN2msV4lB+plzVRIMMi6vmyuScgeaKpnx42sXOWasXGaLrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889060; c=relaxed/simple;
	bh=yrD9iOqDSB+oA90GXdxJg3QYf9+2okRVN+yypqMaCMw=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=njH9yKap1IVkZqQAk1NDrqW7F4+1df8wB/1MV4I5JZ5GmTRpKeO+c1zvRIW6IOzXQE5+98/wIc4jpP7zOf/ujZK6KykZ3DNaHGqWhWD8liAMrot4eZVj2lcqhWlghcmaxy+typ5qL10NzZDKhjEl3Pkro+l7rbXqunFDFjVJIpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tNg+gNHB; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tNg+gNHB"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38759bcd877so512509a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 20:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787889055; x=1788493855; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2wKk+vB+goqKaLt0KMnxh7usyJz614ylfhLbmhKrkpw=;
        b=tNg+gNHBwrm6Czb7+1YXA7m/VPYRAJfjrLQwWkwPI7/WMsAJcUyj+YZhe8fdsNmVMe
         bDHttCaPNPeym2foe73qBZMQdhm57Mk0Nc8rspwNXOEGBTf+lt5O9fvsGonUSxd0UobP
         Q9+p/ImuF3DQ/hjk6CNUVToESB/iaaVxCsT59Os5MzALpoAILPbIdrcmz4hN5TAIY/A4
         nsRCPv+TsZIpAsvTWCzVOYAeUdM792+u0QLg9izbIwJHZJdoB2Z5xEs2Y8sJPIG+QFJC
         HIJBq4DV8CxAaXcxjZsEdV+DZwfzCMQ6aq2TBnmDw1IQB7F6VDImJuVI9b2u1NeT0CYU
         qMyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889055; x=1788493855;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2wKk+vB+goqKaLt0KMnxh7usyJz614ylfhLbmhKrkpw=;
        b=POX5HE4CTdKZ59pUad/aShfQ8KtZP//CKU41xcsupOWhRlPsJXuWVRvYnGS6PtO0QH
         YsjeE/W4Mye3wCShaJ5sz9T8IGICVtwAvuTGoP5ua1Df0R4S+x2oh2+xhxJgIwfqbbgI
         97+coPPrUD/lJkeu0qrCtqLO1c4hsbr8NBIvwIRLKz0ZA01KDUM6ZJlDlKro877oFG2h
         Qcba7puOUN+HCK8lPX1UAGo24UUXVia4vAIpz41jBR2nFWYsknnLljF8BbiOxufpc13V
         PlNT62QwKe4mz6AAXNZQGWX3eFKM7fryDCJLuuSuZarKZXniAamBJlBbHjbySPIznkAI
         dTfg==
X-Forwarded-Encrypted: i=1; AHgh+Rpj028CQWilq2UANebRoImK1PLhRRdn8SyRreL0JUOzwArAmMgs9fYkwjy0Eax9vPm0QmymAL0+3N2K/zY=@vger.kernel.org
X-Gm-Message-State: AFuF++l4brUrHiV5UDHO3y8KjY2EjXjm3C95s5Ayok0WnbkLeYbRlIGQ
	MSqCfkcVP09PdVOHLNRiNvtW5CDJ8Pjqc5Hv0fXO/eI4d8Ms1vYfLzph
X-Gm-Gg: AR+sD11+Abx/gbPdhzCVy9idflu3Y97QbXRb2hMkC4pWhclCVrDoanH2eAlAbADFjDD
	5Bx1fdT6Kp8AP3ACwSsQ0gDlB7fO1qDs1EBcG+bV9vWFRiBSM541LLYUi8SUOLOdXj9cD+iW3CV
	mya8SfE4RR9k/7oT4e7/N6wHzxOOfMR8TkRiJ3xSNn+ibLYU1edCm3xkSLdhHdrn8Pfo8Xt7wGb
	7nQqS98wEX+k1lC48m3RXb6dylU0yKb2Sy2aiumEFTqpLKvNzJHMiZ2WGUy6qI23weDjDVxcn+Q
	VjRa74haynRfOhIBgGpj1roqv9xhNO+Kr2eZambxfV/nJsnFLkZ3w5lQMPUyVst38MPZ0W8Q8Y0
	8VAHlxuaXNFRpEIu7f2qAB/4IjJHqIKPg7C7lBtZemq1yTpvwc54ghccU/KwQQwwAy7tC51j9rZ
	BcMFdjMwZ2V9SEDUHU2jJN3ad0iSsDg1y28Zm3IDqdDZdBVUJXaBTDQQQK9AY19OgQuA==
X-Received: by 2002:a17:90b:5284:b0:396:4dfb:5890 with SMTP id 98e67ed59e1d1-396d0e5bbc0mr8463160a91.2.1787889055213;
        Thu, 27 Aug 2026 20:50:55 -0700 (PDT)
Received: from [127.0.0.2] ([73.222.46.22])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0e0e67dsm1659184c88.15.2026.08.27.20.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 3/3] binfmt_misc: document the field delimiter
From: Farid Zakaria <farid.m.zakaria@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>, 
 Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
 linux-doc@vger.kernel.org, Farid Zakaria <farid.m.zakaria@gmail.com>
In-Reply-To: <20260826-work-binfmt_misc-delim-v1-3-43618adf8599@kernel.org>
References: <20260826-work-binfmt_misc-delim-v1-0-43618adf8599@kernel.org>
 <20260826-work-binfmt_misc-delim-v1-3-43618adf8599@kernel.org>
Date: Thu, 27 Aug 2026 20:50:28 -0700
Message-Id: <178788902862.3236768.2911438482058639296.b4-review@b4>
X-Mailer: b4 0.15.2

On Wed, 26 Aug 2026 17:55:48 +0200, Christian Brauner <brauner@kernel.org> wrote:
> Document the field delimiter.

Reviewed-by: Farid Zakaria <farid.m.zakaria@gmail.com>

-- 
Farid Zakaria <farid.m.zakaria@gmail.com>
