Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356DA371880
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791539255; cv=none; b=BguP6ArT+E+RC/5kNrco48KdUnxMCyLM/N1vzKsFn4MEvs0x+RLrl4wt6rYJjVTSzD1AXrAXaQubJrCCD7+rSNEx1q4d/ksYEY/cvz03KjyO0kdSNqxpNgEhMiUQsYwME6lRk4MiQVdlfEFQe7nUUV6Uo822WyoDr4bfJY717H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791539255; c=relaxed/simple;
	bh=s3u5T5breAgT2P8lcRxXYdcTlv5dNJi6cEZM9dWPzaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D4babD68rBzUqS1DoneKagWNBXfHlYy7VpCYPo7EjcSGArdnM35fmU27M0mT/m4EJQQ9DahU22a2KJuvmu7Ic2GK68AsZAIFmr+vPBXsGr7wMS2D/hHzne5Gm1qKsmGczZ47PpRenGzt0vSZvtrZxNClxArBNhc9czYnT3cDtYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ROIzAcse; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ROIzAcse"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d560775ca2so20031115ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791539253; x=1792144053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=ROIzAcseGrjMoxr/xoada8bo9s/fwhtQrFFAcMnV/duOCYtX1MOrqXn+Fy7vpM8Am2
         g5EUcw4yyFgyWJmMu4CWL57cfmmlN8oOmzQCYzjUc3H66QOQTtJbsAzFkZFs2jm1H3Vd
         LU4BuLviIgpRf92drasxGswbTNm8lHeZFDu3wNoi2Bo/7PUZ6iAa/aZVhMHLFGlZ6CEC
         PQ+bGzI/V0F2x8MiSH/nLkI0MMQfw6vssD4J46jtixB4xLcXX1ocV++htrFomCvoDWnH
         hQJAqWHRFSftg4nm6voWXTvVxRiI4u/Z9NRHLoQb/EC8/8ubjJLWU0sjb2rZqOFniquB
         F0fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539253; x=1792144053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=owqjwJWBuPvcpm2AwPuIEABZT8Ua6Ztz/UXZ6nA+qF0=;
        b=1WUR49mmugoQJ9pMqvkDDNnPuElcLloY9n6we2oBVg5aA9F7bJz2EaESAMeLPFQPkP
         NOg33+ONyUlk04hBgU87fl8c2AdypvFBpRLhjoQJ7MQN/0gPFdGmJK9Z2D996qnQGB9q
         jqHAHTJWQbvYt5D8wu/hwwh/1PYEiuZXQoJ3S+nhoiyRn5L7O8Ser71jUpXrla/BDjhi
         iS5DAgKocEtD9RRT0WJEGf2dnpv8fgv7lmzNt+mT8cDT8kgAOYRYaDI9Ig9jOUjvvea2
         ily21g1GraF4uqs7/Nyfy56DSLA1wrCwTnbRT2PU374C+6Gq5mHIstFZEF2i1w71iRKI
         RFBA==
X-Forwarded-Encrypted: i=1; AKwUvBxW4uGGHXeBJ8PtXtClYFIomP8snVvDU/McJg8N631vxN732uytn0RQfN9uCzw42HmP9swJyC+R1YOUBII=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0AQRvX/5yKF62Y7Z5SVXQV29fy8gTdC4RKxfsHwhgNlp8YhYx
	xZS1LDyevf8yCFjkXXMbOTfMsc7d/x7knVf3FRqWJFBTQnfukK+0EtqT
X-Gm-Gg: AYBFou0+wRihw+mzQPdutEF8Qun1ZlEimnQaFFvsyQiNNOJ8uBxc9OXWGsE+TSVPqET
	9IbUizQFBIFew/oXbiib5B7V6tqn/szN0TZ1yHbok00VgZFPCp/EniK970u9KnUG9JAO5leV5Mq
	d6sYD6HYwJk3sJLe1NEhQhdll4YtCCYqo2AAQuvkpPdAnSaz9zZZNOOk9SViEVCpfbdswqAWGXG
	GkJq22i5il6JtycB+6Z/ko5QRtRa7sIQaqotLqC1y+sSfYxL6i5pNB/+1ZnQDtKnTojTjXk/O1t
	CoyJZI3P4unFBK/kiZaZcpD9daBaVUZ5TqOLcRgzbNZUJO8rV/EtA4aHonaOovF0y29eDsSY6B4
	1nVRccwIF+IJl7WJjOkE3pkve/1xqcHJk7lCWG6lsBKH5KWwVMIVGFS5yA3h6n5I8H6gTdNuGzV
	RbGkJ604OFCuxD9+ord/soYJStC4Wz+iaxlt0hrfq/y5B/pY4NBdLR6rZ52iVSc9cLh6bA
X-Received: by 2002:a17:902:ec84:b0:2e5:d2db:bf57 with SMTP id d9443c01a7336-2e842d03028mr11541545ad.49.1791539253450;
        Fri, 09 Oct 2026 02:47:33 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8421b298dsm5963035ad.33.2026.10.09.02.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:47:32 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yao Zi <me@ziyao.cc>,
	Andrei Lalaev <andrey.lalaev@gmail.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Do not reserve memory for coprocessor FW
Date: Fri,  9 Oct 2026 17:47:06 +0800
Message-ID: <179153921383.259252.13110307622319000120.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
References: <20260921-sophgo-remove-coprocessor-node-v1-0-ace29446b327@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Mon, 21 Sep 2026 17:08:58 +0200, Andrei Lalaev wrote:
> Milk-V Duo and Duo-256M reserve a region for coprocessor FW at
> the end of RAM. It is not correct because:
>   - FSBL can be configured to load FW into a different region
>   - if no firmware is loaded, the reserved memory is wasted
> 
> As explained in [1, 2], FSBL should reserve the region at runtime.
> 
> [...]

Applied to for-next, thanks!

[1/2] riscv: dts: sophgo: cv1800b-milkv-duo: drop reserved memory node
      https://github.com/sophgo/linux/commit/6645398c46219e97fd153ae6188ae86c493d2d6a
[2/2] riscv: dts: sophgo: sg2002-milkv-duo256m: drop reserved memory node
      https://github.com/sophgo/linux/commit/60e4cafd30908e7d8cdfdb4fa1a74dabed9f47b5

Thanks,
Inochi

