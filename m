Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793019633;
	b=gj1/gXbLr1/p6ITKnP1yVhwj/tBg1qHsH3XtQIfp22+9hoouCevf6fjeEpjRss3aDwZO
	 zyRST4UeNmC5+spF+LHBLVlsak5KoKdBN3E6QItSmHMCutC1ezfEQWbDlELYF9FZr/Vj/
	 2nKhG8mPQJqYExydZ3gIV9LadRbN4tZ+0t+pSfatSwMVP/5CaseUtAxzYpib1z0Q2tkCd
	 TDNCOtTevR0UTEdSYbUYneyD/PbJe9Zp5sHNpxarI+mp4ey+Q7DFMERidpTlJ0jP0JKLi
	 d1zLEgf5dg64IiPWJF1I5WaUJf4UAoueMibCXFW86Sf7j0/rOuzxtKnlgKsfqegfBWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793019633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zLJZODPs6/AcsmUGJ3EUfqL0KbiNMrRgoMa/gA0Zygw=;
	b=afPQu4tIyX/rK68SacrqkHNPQM8xFVVpZdsow7H0Y5Q8jS8mjkT0Xc5oda9Gn/4KwmS9
	 karoT5KH50NjUBS3XwIvubz4mk4GQiFXnlmByk8ois6H/NXDa2oLEf0QZZFfKWwta2j2m
	 owM+DSTE320suYH8E+8ng/tlKe1SpHg5mRE/ryJiamWE+TpwcZf7lo9bkF0ji5ii+K0mh
	 TC0MT9UyiNc6ae1ab2vmkeZNZPYzbGR3N8VMU/jngj2akQzLOBUbiDH7burXogvn1VaN9
	 4OmOFch6vx6mcLXRL9KoVsZiGN190nAGONXYZShwmsjOd/4073JT1JNeC/PXHg51wWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQsKwI5u;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA59606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 13:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA59606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CQsKwI5u
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a070b3f44aso992337b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 06:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793019632; x=1793624432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zLJZODPs6/AcsmUGJ3EUfqL0KbiNMrRgoMa/gA0Zygw=;
        b=CQsKwI5unyG6LQn8Bn0Lb2XvJ7AgK+8wncRyRzg7YQa9m0F3N8c1xDljP7UhI0yrQp
         pvZ4ge3B1LAXH9CnjS0ASTRHSSGlrLRJPEaxyqZ0Wn6jF+tSCX02jki+YpF3z3HP5rTp
         mjKrzhDG/XCfWd2ZoMSnx3GtJzR1x8OeAO47jDP4lGFC2z9P91wBrau7WGaznru39K42
         spRDykj7BJ50NqJvuxg9EGNOcaOKhbkJ7Ja5Usy9t2NmHTD0wFSpMHk/s2gS+B5QG+Hv
         ptF5njh3bpCQ2N981tIjfL4GTcjfdNAouSfsfrHkzI9eiu92097fq1UDFgQtZfDCxbAK
         FIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793019632; x=1793624432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zLJZODPs6/AcsmUGJ3EUfqL0KbiNMrRgoMa/gA0Zygw=;
        b=HjNd0fa4aXVFwbaUZkky2/26mhP4LG9X0kl61XdCkxl8PA7YN+C2SN+lL59k0uibsL
         D/uXerUAAUAxuQA6jiT6kZBJcp/EvxAJh47ne8UPI6o7iTYVxbYqvfRGpOBZnkkiibGS
         ivwYOZOkdix28rdq3hJpoh2waBNKpAFSA9Dn7ZAne2CxCTowUJH2otFAq+WB8s4O8kfr
         WPVAVPM4gTe2w1+sSXDPL9daK5pHGsl3CBxhgvRd7Nqmqhj05qiuT7/cWznG4hwhffNT
         3RPViC6Nkw+LlMjwdsgbmhRbHowslpnUDijBi77mS7DieQMiFE2NHJGiDNQpIgPEM3VC
         md4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxNXOMuS5l44BBb4ZsvOObBMornucDs7h3UFGhvWf6O8uH2vMk/yFxspGz1JgTqKUpZ3EQJFpXAHudpD2c=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoMTIQnRCCk0k8yJskSWs8LNpv8vrUh/ngSNjryzvoO5xSc/9L
	XylopoRMGON1ZvXCmq03rap6g//BRpOphZE3aO4JBz6sIaS6c0GdguGn0EJAsgBky6U=
X-Gm-Gg: AYBFou1p/KphXUylBY7KGodnt7mBAo3BM1WLd9NOtgzljbHBUKuJUjRkW5gacwL9Gvg
	UwGcikD/fiG4NEdsSAs/R3zbErk6EdvawA3ru+HH5Dx5e/WX5u2rae0zHq9s3k+q3Mvr5Xy2CvS
	SecbRLOZ3TdXD4igP6llRp1q+alLrfx8sgK9k2hG9IeiliblLTw70yYjHiKFSsaPOLQKbW2/vo3
	vpID01Ku1uvPcvUwtW6cKGy4xTVN1bBRzk693Adl4zmypyOw1lwfQS1egOjtpdmO2Gyni+k7kuS
	VRTDLDAbG67qAsxXSq4IO/FZNioRb1yvrVa5JlDehceO2/vNnoNkthfsjKYaUE5U+jCf/nj/LeL
	PxdK4fojp6qelGV8nfJXus9cTLFQUvxrLgDeHy4djJsFL665ClMeSi1ttYmWRLhu2M4/lMkCXj8
	4CcIXsMBVgm2YIK3VrnkBFRpwQ5+SUL0SzjOo7yUGB+NCOGFg/O/vSq0rG+D2+CwklYd9poulpH
	mxbWeQLFZetcE9/QM26wmy0c/VHExbWHDxZTq+OlzOJoEi+AAdfYlzqpjNlwNrbZUVjN0KSPqkZ
	Hkvgi2Kt3Vkp4pLhUAJaJi4Tnle04VYYYmtCa9SmvVkL/Kf8FLOjdXjZrZaKn/M4BG/4Ygc4f5y
	+zGwA5tRutolPU3AwKVAUsRWfHZjaTAJyerZjRvm2ke0HDzXXYQ==
X-Received: by 2002:a05:6a00:4216:b0:89c:967a:a74a with SMTP id d2e1a72fcca58-8a367f0e8d0mr5283113b3a.22.1793019632272;
        Mon, 26 Oct 2026 06:00:32 -0700 (PDT)
Received: from EAIT-H54D9Q2FJQ.eait.uq.edu.au ([130.102.10.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d85e5csm1382887b3a.3.2026.10.26.06.00.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 06:00:31 -0700 (PDT)
From: Yu Zhang <yuz08559@gmail.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [BUG] nvmem: use-after-free of nvmem->layout in nvmem_layout_module_put() on provider teardown
Date: Mon, 26 Oct 2026 22:58:56 +1000
Message-ID: <20261026125856.73564-1-yuz08559@gmail.com>
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

Hi,

On nvmem provider teardown while a consumer still holds a cell handle,
nvmem_cell_put() dereferences a freed nvmem->layout - a use-after-free.
This looks like a regression from 87341c4dd5de ("nvmem: remove
duplicated reference counting").

Mechanism (drivers/nvmem/core.c + layouts.c, torvalds/master):

nvmem_unregister() frees the layout sub-device immediately:

    nvmem_unregister()                              core.c:1075
      ...
      nvmem_destroy_layout(nvmem);                  core.c:1088
        device_unregister(&nvmem->layout->dev);     layouts.c:205
      device_unregister(&nvmem->dev);               core.c:1091

nvmem_destroy_layout() does not clear nvmem->layout. The layout device's
only reference is its own and its parent is nvmem->dev (layouts.c:110),
so device_unregister() drops it to zero and nvmem_layout_release_device()
kfree()s the layout (layouts.c:84). nvmem->layout now dangles.

A consumer that still holds an nvmem_cell keeps nvmem->dev alive (the
cell took a device reference via nvmem_device_match()), so the nvmem
struct and its cell entries survive this. When the consumer later
releases the cell:

    nvmem_cell_put()                                core.c:1591
      nvmem_layout_module_put(nvmem);               core.c:1599
        if (nvmem->layout && nvmem->layout->dev.driver)   <-- UAF read
            module_put(nvmem->layout->dev.driver->owner);

nvmem->layout is non-NULL but freed, so nvmem->layout->dev.driver is read
from freed memory, followed by module_put() on a garbage owner.

Regression:
Before 87341c4dd5de, nvmem_destroy_layout() ran from the device-release
callback, i.e. only after the last reference (including consumers' cell
references) was dropped. That commit removed the kref and moved
nvmem_destroy_layout() into nvmem_unregister(), where it now runs
immediately regardless of outstanding cells. The companion SRCU change
gave nvmem->ops and the cell entries deferred/guarded teardown, but
nvmem->layout was left dereferenceable after free.

Reproduction (deterministic; needs a DT nvmem provider with a layout,
e.g. "fixed-layout", and a consumer holding a cell across provider
removal. From code inspection; no KASAN splat captured yet):
  1. provider binds and instantiates the layout device;
  2. consumer does devm_nvmem_cell_get() and keeps the cell;
  3. echo <provider> > .../unbind  -> nvmem_unregister() frees the
     layout; nvmem->layout dangles;
  4. echo <consumer> > .../unbind  -> devm release -> nvmem_cell_put()
     -> nvmem_layout_module_put() reads the freed nvmem->layout.

Note on fixing it:
The obvious "move nvmem_destroy_layout() into nvmem_release()" does not
work: the layout device's parent is nvmem->dev, so it holds a reference
on nvmem->dev, and nvmem_release() (the nvmem->dev release callback)
cannot run until the layout device is gone. A correct fix probably needs
the layout module reference decoupled from the layout device's lifetime
(e.g. caching the owner, or keeping the layout alive until all cells are
put). As this area was just reworked, I'm reporting rather than guessing
at the fix.

This is distinct from the recently discussed nvmem_cell_put() /
__nvmem_device_put() ordering (5b6b6fc49189 and the follow-up that was
rejected as a duplicate): those address the consumer's own put dropping
the last device reference, whereas here the layout is freed by the
provider's nvmem_unregister() while a consumer still holds a cell.

Thanks,
Yu Zhang
