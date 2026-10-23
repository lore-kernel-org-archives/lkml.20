Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792745546;
	b=Fmn8oEfSWeGbWDivo7Q/vuDxH/OfKe/7oyuaRGAh4X5F0hq33JEQ/5jGF57wY/rLRcPo
	 MvFW2k5ZbM1eYrJRtfL9GPQktO/HzYBpqSFt4/LOvhY3axcMzLiF76KSqmTeuZD29J1lY
	 /5UL/Kb+2ptjEwxHToleMHWNCFvDrksXVlqEXEI2v1mVsed6WVmsBv1XrVnu4yiT30R7j
	 fSnFkbMw01RPm0fIrR4MuxTNQMG7VwNpxTXg3FR+3WRAPcBX4HI8DaXSa8w8yI2Ihwkem
	 OCbg8YazY+sNmO4P59UvTrqsVWCtpbrYDE1OAvd/hWiXtGmPvzNYAnM3qvuUjvLYFjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792745546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=R/8Zv848a8hRoPLHdMl3RbNkJ4bhA2vElNSJgcwLr3s=;
	b=U//kEo+GIyV1qLrJRwP2h21rQsJLvf57xf9jOrHDxn3Uhr1QystZHfozYUrKZxh7qfTm
	 KRTYsWqUIO9xRV1wxEc+eoqTw2ipNJWhcgLS51UozDBJbtkeW8bZGN2dk03wlzTHVpDp2
	 RxlgcJqccoqU6PKb8FZ5PrEdSsyzo4WWRR4qWaq7QE7vWvF+NboXZgRKWNK1QFZ9j+BjG
	 mdCYSuMNOgO5ThEgFEIvhw7f4kQ14FB9lZKTVrgK7F6xcEb+fEhCG/7CyOchR2CCxr2zi
	 HgWRJToY4cgGdYhFFsZa0MPszOge7O/NwaiyLa9k6eXRbLVQEoeNZOd3A+xUsBENaow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.169
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com [209.85.221.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD595606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD595606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-5e948e56af3so295373e0c.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 01:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792745537; x=1793350337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/8Zv848a8hRoPLHdMl3RbNkJ4bhA2vElNSJgcwLr3s=;
        b=b794n8jOAWH5iX4yhQJeZAkspRlVV6rPZkzS34VVSeonqi4e0BeXI5dO6v2cDrgiqe
         ADqHcEE9JJmFEtGNLUr7WqNj2kSDngGXAPHRJbLMYAQMZkQKzy1qaDzLidtUP2veJOwA
         FgNQCx+CvY5+VRJuwuxFXDlKG5ahgKTj6LxN236h2tUDornn/T725efEYumX/BUF86Sk
         ejVeEgXDgGsK29Ji+sXVoTQlAsTNDAUZRn0RE3ET6jcOe4j3LbZJGvHqdgM3/HOCBnvc
         Grjbb65NOTiyw6/YX6kNrQBzHnnLpadVz073mioIeDxJsf+y6V4ruyrFS1nTrrBuP4hf
         BEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792745537; x=1793350337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/8Zv848a8hRoPLHdMl3RbNkJ4bhA2vElNSJgcwLr3s=;
        b=Zvn0zXN+k596amxWiD43HvRTNAfDrjbjWNEuOxXbcxseVh9GTNEwhUZWQiPkba/CPB
         5QyV1O/KmY8RcDxOCNEZaaTUpt59nPZMpNfqYFhXuypPIxgZRfxhgIkqmm7/4WyA+EPQ
         LiunuSQBg0gaVFmxya6Hwes4RahcHL9w703q7H9fp9tjSEEa2y9NKQb/rTy+kX3kPSxE
         bJkAeNdPbqZgvc5UzE03r7hizHuhxi4VgPFAmxPoRsUfvc1q/44teki+4xT/q3MBuRvL
         WqkqqElsxDLUMVkOMVlUWKzAQfrC3rKHpcrIYB5w29mCxayKR/ij5HcvPnj2zGw948Ws
         9ToQ==
X-Forwarded-Encrypted: i=1; AKwUvBy6Wlr4D2cNMMRhkD4ye7dtGtdrI4znrYTiucdmRWc9AKyAL8Qaj8OPfeo26UHO96oN4qfH+DdS+90CHO4=@vger.kernel.org
X-Gm-Message-State: AFq9FYInzNMwFr9h/I6y+aOb6Dr5PCnz71AOtz4EcRuKFOJRHwkPCSTd
	MnCRclx9cFfkurXjruT5/G50AgB/IT5yPFciS/ErEB4DcVCX6ueWn9RDWs92wF0I
X-Gm-Gg: AYBFou0QM1hBr3THu+Y/0bGNLC5jhi39567jBuYtLnTTBlEL8kguge9u2gU12VlPnri
	9VX11ahb17eJJs0oXhPc+fyQPWJfJnjKdamDMxSSk6pqpFVGQvNXxaivt89oxpkf/xTetzRbWNx
	UMlVzMKyOciBB61rvy2rzgJZiKccHHE1jDRcwUx1S3XSPdbY6X5pMa5U+s4dU8ivYMR8/Xe7mgq
	Oe5S7+d+KjDViIt0unI/A0aFm85CgI3CkATnITANJUBa+3sRrHVnspoqharYq9W1G/1ZTjIXNLT
	DJSKN5gTK/rzsjq5Dgx3fqOH5sB4Pn1XkakO0SGiUzBH95OeJcbmoPOVJ8rZ33vns04uJsbq7Wp
	aDWq9riUGV9y5YsJiCy1ef9T506sTYkoMM7cxB0KcMPqpgftCaxkQ0IUkoXr3ufHk6RzGsbDSRD
	J4+87laym5kIme1/MLvd9dsDAavwRtaU8Qbewarmk4nFTTobAMpjZvLsycvQgmIREG6egIzULsZ
	hM//WTaG1ijUkjf3Q6MDcQKqlddWO6Gft1IB+4f1VvWn1aAdEb44v3hqRIMSbKe2Im3dtwUKi7q
	Hx9rEXcK9zaYrG2/tnGN
X-Received: by 2002:a05:6122:1d8f:b0:5eb:2a6e:d3a7 with SMTP id 71dfb90a1353d-5ec14a86dbcmr444614e0c.12.1792745536678;
        Fri, 23 Oct 2026 01:52:16 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec13ed874asm1728551e0c.9.2026.10.23.01.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 01:52:16 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: Re: [PATCH] staging: axis-fifo: Fix three real issues
Date: Fri, 23 Oct 2026 05:52:00 -0300
Message-ID: <20261023085200.5206-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <2026102337-headroom-shun-9d45@gregkh>
References: <20261022215349.87471-1-breno3011alves@gmail.com> <2026102337-headroom-shun-9d45@gregkh>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Greg,

You are right, and I apologize for the noise.  No tool told me this -
it was my own reasoning.  I had the (outdated) impression that passing
an ERR_PTR parent from debugfs_create_dir() to debugfs_create_file()
would trigger a WARN in the debugfs core.  That was true years ago, but
modern debugfs handles ERR_PTR parents gracefully, and I should have
verified the claim on a CONFIG_DEBUG_FS=n kernel before sending the
patch.

The other two changes are independent of that assumption:

  - the -EINVAL -> -ENOBUFS change in axis_fifo_read(), which changes
    the errno returned when the user buffer is smaller than the
    available data;

  - the removal of the unused 'struct resource *r_mem' local.

If either of those is worth keeping, I can resend with just those two.
If the whole patch looks like churn, please let me know and I will drop
it.

Sorry again,
Breno
