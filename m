Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792702595;
	b=0oKKiHbKkdsfucYmvLj3r+SCAlcyx1gcOk4ouWIsHwlZl2A7y5iohtAiwso5nJvyYToJ
	 D3ICrpL/DcaDlAKQnBOzY1pj8i0VeOgU+ZtcrGIcFanWWLVLDPKGCiywoxB/TfFlDWF6q
	 nMnfewixrs+q+CJOoeWzYo3ziaRwcg7GW8jnk9rteiHBqk0Gva7Ebp23eJEJguWI5rUvo
	 PL+8MFBPTIcHFqFi3BSvU+aB+mnFd3zm7T4woEfXYOvZvdx75pnuyYC0sqIQkV4gsXs99
	 z2w0qZMjtbYj0bjalOeO9v5IoaBwo6ZDTkDit95jyrMrz1Ez/Qaj3g+QRNSN23PNUPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792702595;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kGFZJGUkeBJFJ6wJfw7tiF4PZexQdk3G6J9EfpcHRsA=;
	b=K3/+OZwY3lLv6N31sJjoRy1E03McixiZEdGFy8mges2Sak9whQkxF6ZtO2aAfvWR4kct
	 H8OtO7NJLDV9Zj8+u4kGuEEswrHMJRJbg28NgLbs7dsTCDCix9G/R6cdZswGKMUS8/yj/
	 ZwGhCaX6wXBHm8hwV6unmbQQDIq3zXku/xCU7wf2G+tL3j4HfIIQaeVr68JoS0nFLkCVe
	 o8TbK39K8OIoYjTtmQphF6RcNKioQjW4IEhL38lPs/KuFi4bVn5exfJiefCAVe69Qj18V
	 B3MRF/GDihyjXYBPsSvuOglmYhF2mDx/0mu3qD8Z+M+miPwE+KlSjApyOeKCwfyvklA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ca6g6POx;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F44606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:56:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90F44606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ca6g6POx
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a1e34ecb02so1396175e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792702594; x=1793307394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kGFZJGUkeBJFJ6wJfw7tiF4PZexQdk3G6J9EfpcHRsA=;
        b=Ca6g6POxZb6qQwDnJdcJokgEXMTAz1Gl3EXHXFPtFsUx7anJqMogEB0Ss8gSBY1bZ3
         +b0aNL/mURUd1xGZ+q4GYSf31H5MJkmclzZZvQ0rW+RQVss5mmIYZ1SFQx42QVQHJVVS
         MjJbasoV7J70gAWEfHc8qrLiVz0sRwZCrt7l1HOQm1fZPuTRwC6uLG1roG8xvZ0JuEQp
         BpxaLfW9B9AgTdmIDF6gN93Jo1qwd9zY43TjVTE1Yq0QFqZF+h9JovXJ2dhd38p/CmxY
         YxhGebmVRK15icGR3mJnkl7+3LVq1ybdMzgxXMhLGtuASyAksPZLiBPaTLmYQ6Q2PtrT
         5Luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792702594; x=1793307394;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kGFZJGUkeBJFJ6wJfw7tiF4PZexQdk3G6J9EfpcHRsA=;
        b=LwTWM3Vd3REFarZekdy2TRSD8fijRLZuIsVCq7T4uDXUwE10yLxTxxcQGxJvobGMIB
         NstHN4u8ppP4cBpKYjTYz2X6/2q96yjDvlKgBQ7ckz0+tXII1oYXbU+jC+y/Qy8S19Yw
         rRWl+uoX9+yLAm5GeU4FjSFL0KpggoH1brAPW0vMzqeTcVtz2QtWIuZ2M1Ow2lx5AGx0
         ADHzHrp+DnvZLz0LEkS0lEI6S19MK1ZulLgXoaewshOAIYxoWNG3VO/eT82gzUE8JVYV
         28t3J7aTM646dbbKsPUW+Fxp2TIPsqK26IYGdb4eISPpPdf0cn8g6R3TF1mCOAUtmQfW
         LEqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5hSA8V3gNCUT2KCxpwHGCrzrxTgzCWkWpPGh0nH9GF77II0JftnRkbDiEoR7J97QI1o1vgPKXkJDRvtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKTvuY4GRQH64rrCyPB4JwhqjbqthKmmBQrDrAsA5KRA0LBCZl4
	Kvfdh4SoYzgxcqnwTn880hyfBAoTZrCgj3uoKCeR0PwlUj351tEc5W9H
X-Gm-Gg: AYBFou3xU6/XZ95WMdiDcapC23Mj1IaRdmbHbUGCBJZ5+LO70r9nQU5A+Iac58LGKqL
	WM9HKA6HqGXjefhJQ+iG8ehiRLZEUrLF7Jv5uIf+cKZnT/HYN69+YjitIvj+85QfwAVURvT8gLr
	/cGhTYqV21/Ad+pvIAFndfN5NaEbYIeuMrhl8WT5oU2vy8bEtlEuiGmJQuREWmhAtiVJNxzNSVv
	elToZXJ9mU6ecFpg+r+83QSUBrPgcAp5h1gO2vEkIm0S+WnExTqf6eFj0p/Awu5N9hhSAEBj0EK
	arYxoPiiKQjZj109RObvsOIQ515Ff2FZn+jgtsO6FCCd8niy0IS810XWVtimOYv1dmLuVEtBoBf
	+sYJLY9+u6Rm8BSCFXJTtMnus93ANZonNj0leYGRe3IdT9pJ3bzl+ro6j9X+afnKn2tiw9/VcZz
	5gVDZEzjWCOrsX7eBdeZrE939sqPEJYfLuQnksNOtBxIAg5bnzobz6PH0kGNEvFQQ1N+lr6Z1bh
	tXl2ugOSZ1hcgwnIQ/flWzeVxhmTIgM2Dhhk6k6811BUFfju3EwfUHG/UcWmk4L/yO3Vg+rWuh5
	FomOpqUfhnxCcsszlsA02/S0HDZmCwDLospoP+nsPX0W/fjlZYSixltkVfmm
X-Received: by 2002:a05:600c:46c9:b0:4a1:d36f:1ba0 with SMTP id 5b1f17b1804b1-4a211f371bbmr3488455e9.35.1792702593749;
        Thu, 22 Oct 2026 13:56:33 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48e38025c67sm394006f8f.20.2026.10.22.13.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:56:33 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH 0/2] clk: en7523: full clk_hw + set_rate for en7581
Date: Thu, 22 Oct 2026 22:55:32 +0200
Message-ID: <20261022205535.688352-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
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

This simple patch convert the en7523 clk for EN7581
to full clk and adds the .set_rate OPs.

Needed mostly to configure MDC clk rate.

This will be also implemented by AN7583 since they share the
same exact implementation.

Christian Marangi (2):
  clk: en7523: convert to full clk_hw implementation for en7581
  clk: en7523: add support for .set_rate for en7581

 drivers/clk/clk-en7523.c | 222 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 198 insertions(+), 24 deletions(-)

-- 
2.55.0

