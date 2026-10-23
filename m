Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725299;
	b=4vfFbHXGd3X9EN3DeEz5vL4fLuNFjyVGDrAH9MivGrTR+i1OELEiklPwMgzJ99n9GN4o
	 MInGT5jV8ZC6NXCbcGQISHolmKr/jx7aoQYNTBu6Op/eG997xSB8EBBDY9lfFlZVr/mH5
	 LOUXT85NAD0TQAbt/Qc5yNHypthEoRVPRMcubdnbJBbcIyby8J2DUt3IMoDlD1RbVUWUh
	 j+zNLSYfZDqzWnXmZhaI+LdvZw6gCob+oaQy+DI9t1Q/po3NARaOyTBRKbKoHMzhQJRIc
	 pP2gXugVWWfa7wHV9Ew7dcZv68jsPs0zBbT07I/eLyLyoI9C1PENEwlJHkttXywgwAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725299;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
	b=ZmDqN69Q32DHGPwpAdXdBXDqn02+sA9wsglagK+4WbDbwtkZLPN9KSGr1bPD10vt7cco
	 kHqp9X+PMPgYC5MikFdpuw1Lk4qV24jIJm8Hi6mymDpUcLc1EaPRlHjGwn07uVHDx1NlS
	 w+AAOqs9gntgNqQeHS4jFScxq/7VTA/BQKREGTDOPlS4a6lr1LsbyoDR5YvZP0++N3SWC
	 yLeiuBvZQkmnCuzIR3E4jfeqcGyTfpe4BfT0h/jxPSPHakXPVN6JtJbN+N1OT6bvTEqJ3
	 t4w4kNcmD12qnNiH6osCZSH+Kwku0BcCeDvCs7jbOuokVqOayMIRESB3cNDFd4Ft3BQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CRVuB6t8;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4F3606A321
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:14:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4F3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CRVuB6t8
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8470d7d430fso147954a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725297; x=1793330097; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=CRVuB6t842ohZa4yXpdvYfpQQB+JZ8vtj27hDtwFjjfsa5UNrk86UJADeCMRsIjxqa
         w3B0jVWLPBZUayQWGSrcT2aVnDgXTItnaxgoVlpFR0TkgL78lUqWRpOcvw636S8Q09BG
         yR4yZSeT1NkERpWwOviqLHXzV3/8WJ67nFc+NIOzQ9INUQHzivATserbBlCItdspp0t9
         nYl1KBzbtHGGlRvN5XPXIpomcPCI9a2tQ9/MXBWOYl1Dwfw62iIR875KX9VjUuKyvNoY
         OiHfKDksxaJAduJszJFW28kswLh+IGB637b2ztelcdgk89wOHROuaxIiA5NcCXkKEzX5
         RhYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725297; x=1793330097;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pm5LxVvpIboHfA4NG+PJUVszg46D0jGE/bRr+E4n5SU=;
        b=uC4Cbsl4jJSe7zSSaQ4VQZwsPLua7kDWErPPRy8Q8HfUQJdTDfRbzrTuxNwquu73/c
         iW0075B90hdO1PiPGvk64Me5Rub7/zC9sJa4MM1V+hG/sj5AqRB0HmY3E1hkNjHGlMy3
         yyZScl2OvVXTUkG+s+LcwTeE4R44M0l8ILREXmzNwQABEew0NDGZvsW7FF6ghcwidK7k
         05vi8SnjYmEDB2GAzGvR+Y5X2khE6Dr0/iWZJZwHL2fpuIKlRKGw9VX1ZWYKATJzGbPO
         0CfZndXh8tBI57fhO40tNvfn8ywUzVj9wkyWCe68lZYI1YnEhi2V0+H3ITd6xAt0G+SS
         WUoA==
X-Forwarded-Encrypted: i=1; AKwUvBy98c1WRIVYbBZIsEambp1obROvDljpJ8+XOYp+/K8d3s0/8AOpH6Yr+Wp1Ve2iLltcZDEF+9eMKVrPukU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJm7ARgv6fn86kVRurpQo7BQF+f/B8eqXeiukF5q/HxG7AilOjS
	LaX9g0OKMC9rZJR+0sZpMIhEp6t6KPESQqlPv6JdYnhMmE0vUiFszYUw
X-Gm-Gg: AYBFou2mq97+WNjEsEwIVAbvUW0lyubxva8m4CdU2aByHWokTvTP3kAHFBfVopHb0hF
	eloZpuRaP2cTZLzAAFx1RyAfJfpEcqX+YAkkC+gVSNbCuqhDlbgJe6ItBi95ZO9jITpxtViuiiH
	M3R/Bd3Z6ksLh86JCMDT/nx8cvNw9ln7qnT+4BT5tjVv/6jcLh/H7L7/WM7hiw4e464a3Kzyq9Q
	/aL3QOHcZlI3a7zCxdb7hbpl42/l5qWMiuR1WyyWLz2QbD5vaZKc1iMYYfNtuuVfgPZ8Pyq48LS
	qvhM/kbvtAApwc/1oyr/kq3kR0FBWQnFH/32TP0PWicirURqLYqOQK/4xqlBrcP5A9POTgnleyi
	XHjwX3j59oMCxVViV1vUEshi9IKzGEPaDv7+ya3fpNcWpjjjCiueJImkyQ6iaOUfEgx8BjuYpQC
	JoMo75388Fg2iauJIZwL3P1hTg7z8zqhyNvmZMDE/s4GHJAn/fo8dqR3n5/EvBsMIYHv3mdybTX
	Yb3wUDqUTbIP98MHsS8cp/XpvVADT9wiOWsqEE6sFMSV7UPRHktuBzBL1s8kuKh71QNff38CCz1
	tWc5Wyv7V7tQECFLjaRGqutxeK/+oNUEoZDFcnVOH/0gKHPzVSfS1BFP0jd5Y8hsdLt8VX1WVub
	iMD60pOa/8ljc84PAu/+ZiP1A8FGQKThSGkfOAkmJxW64Ta9o5l/Gw56g02v3UpnkxGn4Tjk/yH
	9jBAY=
X-Received: by 2002:a05:6830:412a:b0:821:94d2:83cd with SMTP id 46e09a7af769-84fafc689dfmr760717a34.9.1792725297222;
        Thu, 22 Oct 2026 20:14:57 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:14:56 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/6] dmaengine: sun6i: fix interrupt routing and channel
 lifetime
Date: Thu, 22 Oct 2026 21:14:51 -0600
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WQy2oDMQxFf2XwugY/ZNnOr5QsbFlqXDrTdmYSA
 iH/XrfpJitxQfccoZvaeO28qcN0Uytf+tY/lxHsy6ToVJY31r2NrJxxaI1zejvXue9jLNh1m4v
 +6MJ7n1kvfN31xergyduQBBJYNThfK0u//jlej488IO9M+y/4f2Pl7/OQ7481VcvGmj7noTpMR
 SQwlhiFMJdIkI0DBAwZTLMJnGuR0D9kZafTuPkwNfQ5AUSEWIpptRoT6uA0wloyMoJjKQmfW4K
 RrKSWWmZjgQiDESd+YBKiA2/I1xjrcysF51JMTYCpgQxVJGl+vMz6kBm5hlQsizre7z+Uy8BEc
 wEAAA==
X-Change-ID: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.2

Correct interrupt routing and serialize physical-channel ownership across
allocation, completion, pause and termination. Keep paused virtual channels
off the allocator, drain completion callbacks before releasing resources,
and associate cyclic state with the descriptor that owns it.

The first patch carries Hongling Zeng's physical-channel indexing fix [0],
adapted to the configurable interrupt-bank size introduced for A733. The
second handles partially populated banks, including H3's twelve channels.
The remaining patches establish the ownership locking, pause bookkeeping,
callback retirement and per-descriptor cyclic state in that order.

Based on DMAengine next at aff5e6a77fc6, which includes A733 support, with
the posted IRQ-safe locking fix [1], channel pause-bit fix [2], and the
virt-dma synchronization helper from [3] applied first. The synchronization
patch uses that shared helper for the sun6i device_synchronize callback.

[0] https://lore.kernel.org/r/20260706064123.66035-1-zenghongling@kylinos.cn
[1] https://lore.kernel.org/r/20260926171049.841335-1-tien.nguyenminh@embeddedlinux.blog
[2] https://lore.kernel.org/r/20261021-submit-sun6i-dma-pause-bit-v1-v1-1-38d286b69dab@gmail.com
[3] https://lore.kernel.org/r/20261022-submit-mtk-uart-dma-synchronize-v1-v2-1-fdaef0e2edd6@gmail.com

Assisted-by: Codex:gpt-6-astra
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Hongling Zeng (1):
      dmaengine: sun6i: fix physical channel index in interrupt handler

James Hilliard (5):
      dmaengine: sun6i: handle the last partial interrupt bank
      dmaengine: sun6i: serialize channel reassignment with interrupt handling
      dmaengine: sun6i: track paused virtual channels
      dmaengine: sun6i: synchronize callbacks before releasing channel resources
      dmaengine: sun6i: keep cyclic state with the prepared descriptor

 drivers/dma/sun6i-dma.c | 153 ++++++++++++++++++++++++++++--------------------
 1 file changed, 89 insertions(+), 64 deletions(-)
---
base-commit: aff5e6a77fc69a7c490246465940d18422d7c631
change-id: 20261022-submit-sun6i-dma-lifetime-next-v1-53c3158f4841
prerequisite-patch-id: d6398447647aa0dbb005b5e6dc6ba96e642efa86
prerequisite-patch-id: f67c1f8d8d9e014cc650f2f37648662430c3b77b
prerequisite-patch-id: 8522878df4ecd4fb007cfd32611359e6eb58a1ef

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

