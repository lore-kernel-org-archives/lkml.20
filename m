Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E4C343883
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846519; cv=none; b=FMJBrZfbgg3a9dQu73bLTCt4fJA8XKeyUDpaGDJuLBycOnyBmdYVXDcNYe8OuIfSjGWJGk9DUzZknvE53lnsuK0Ko35JqdSsD1CtJLmRFgpXBkI0vo0HapIP5FuofsncrSZi0/4E689JCp6YacyK/OxcxnMAioU3rwT7FaR6SnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846519; c=relaxed/simple;
	bh=YRnZBWvvoL3gZ0b5c66VN59LYucaM/WJXc9j8W0cOFA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=G+ePiIjx5Q1h19mQyPEcJ37ykFOg15u8UP6327cFX2F+l8LP22fQzrRJ2tMLxFvqekR1QNEXM/oSHk7sJ9ilTeHZm/PbNYXiAly2K/yoNKbVeN5F3G9BM5XQ7IScghidnogDiz8ch0ErOvWieanJ/nOiQmimAlDUFwI2t3XM9D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JhdlDXaY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JhdlDXaY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so16659755e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791846515; x=1792451315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJ9Nma4YZ09TsegjNcwlomId4OFLBG68tURqtwyiYzk=;
        b=JhdlDXaYZ1nwnrnYIvW9maoRK4NPXm+NxTySvBLFx6ytNBe4+cRErJEU0S9QJYJggg
         m7Uv6ydXjzTKPqTF+Kqy4tAbWTpWgDQy8ENJuGQcA9hiH7GIy5lfQz6s2Sa8ZD21WiyR
         7R8sheCd4oecSW5Gt1VZS7XDUxemKDTiLpZMHojWlDqZnTHR1T+HqAXuwBY9vZJxG7Rb
         hQm4flRiV2pAOqNZuS+oeGWnlQKEGZfOn/u/l7V8C6Zly7frn+F+fvAKpwar3S4uFsS8
         kFlRtib/0TR3bVoBNLjCU5IWp/kOGR6iqB81SDln7vxY4J63UcGjYNoaXJGyIBdAMqQI
         JLVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846515; x=1792451315;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AJ9Nma4YZ09TsegjNcwlomId4OFLBG68tURqtwyiYzk=;
        b=lVs5q07oQ8CQzoLVACbaH8DnMts+DhHY80a/4m6TA30fBTc2dliEHxcb/6yz+P5i3P
         nbq5q4yC+n/U90Ivi7RU2FisascB2GEkI9ZJ1eiRaa+PD4yUJh10QG95VVPdSBJsp6lz
         +wrI3N4uIDEnj/qOnPWIcc37K7ziZuVfipSnB2KQu3wcgHASjzr7xTswGoBlfer5Ie9q
         6ZH+fnrm+VJz44m62cCz5Uh4iuj1wVN2FQmSDFpOsgGFDh1+3O1z2UsnOsSSpV1ob6gA
         jdptNCRC8hmEQa26cDvG/HGrHS4HfXewo+EESDGGmSQM3ke0ythyLIJZyn0ZmfYyed/h
         bbYg==
X-Forwarded-Encrypted: i=1; AKwUvBzLs5quDvpIRV9J5fNXXOKpe0z98QqXbvr7EhTrkOr3G4x1rFfiwgWgfgTd+33Yz6R8rdhW1l+OpkSSHIY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJNvszi8STpOUJkf+mgEP4j7zts3gq784X5WOBJV7fKLDyQMj7p
	NUfiUHvu5FETWckPMsqd/dddf0wdy7aTSdv+vyr0j7n23mBlQDFvlsM7
X-Gm-Gg: AYBFou3Em26o/TVsVlLFiYWkbyY3Ay77w3oOp7jcXjqTTZNt7gyjE2zFBD7V9JHu+Se
	YJwl2eAKU9Eo8XiCO+VMfntOkzBgHNi/DGkop7ESnq9/SLrBv5t373J6cJAbok76YjIbChrRcoQ
	g6/0PF5xHDrREO1+LQYNatpq3MCk0HwGJGOcrKxE9BrA5BXK7kJpw5xLdQPse30kXxz+ATPXvzZ
	PfGmNEGe9EMDGagxx1wpYKkZqbiQ/xycC+Mp5+VbVXaLhW749NRMsC+FPVw1WLU20ldx2RlAqD6
	dTB1/pXkca6YLkSQ6TMnA+4aGiDkK0J5B5rl9iKTgGNgvdUhj0HUbJ2LopSU8aL+b+Fxcys6PSc
	L8UebY6nXI5pOR5Wu63pubbcarNu35uLesg/6Nr9lRan/Qw22ozdsIrWVPlApGxPb/KEXeu0ibc
	HTLze0nfC9pAyZlmQRT27KffRG0iWM2/X4tArjJdAxuiswyZI9p7r8H2xwCUxSdAj3prbbdI0ln
	ov3FSVGlZBgGJQ3FuRMug==
X-Received: by 2002:a05:600c:4ecd:b0:4a1:96cd:2f60 with SMTP id 5b1f17b1804b1-4a19ecf4c20mr85630695e9.3.1791846515354;
        Mon, 12 Oct 2026 16:08:35 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm1873928f8f.19.2026.10.12.16.08.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:08:33 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH 0/4] media: atomisp: remove the circbuf library
Date: Mon, 12 Oct 2026 23:07:49 +0000
Message-ID: <20261012230754.1914517-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thanks to Andy for suggesting, in review of my earlier typedef
patch [1], that I look at converting the custom circbuf code to
circ_buf or kfifo.

While looking into it, it turned out that the circbuf API is only
used by the local queue path, and ia_css_queue_local_init() has no
callers, so that path is unused. The remote queues only need the
descriptor and element layout shared with the SP firmware and a few
small helpers.

So this series removes the unused local path, moves those few pieces
into ia_css_queue_comm.h and drops base/circbuf/. Please let me know
if you would prefer a different approach and I will rework it.

Patch 3 only moves code, apart from dropping OP___assert(), so I did
not touch the existing style issues there.

Compile-tested only, as I don't have the hardware.

This supersedes the typedef patch [1].

[1] https://lore.kernel.org/all/20260918214132.1135549-1-vladurares@gmail.com/

Rareș-Mihai Vladu (4):
  media: atomisp: sh_css_mipi: include assert_support.h directly
  media: atomisp: queue: remove unused local queue support
  media: atomisp: queue: move circbuf types and helpers to queue_comm.h
  media: atomisp: remove unused circbuf library

 drivers/staging/media/atomisp/Makefile        |   2 -
 .../base/circbuf/interface/ia_css_circbuf.h   | 363 ------------------
 .../circbuf/interface/ia_css_circbuf_comm.h   |  56 ---
 .../circbuf/interface/ia_css_circbuf_desc.h   | 160 --------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 312 ---------------
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       | 139 ++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     | 112 +-----
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   4 +-
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 .../staging/media/atomisp/pci/sh_css_mipi.c   |   1 +
 12 files changed, 148 insertions(+), 1033 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_comm.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf_desc.h
 delete mode 100644 drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c

-- 
2.43.0

