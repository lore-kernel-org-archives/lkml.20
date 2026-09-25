Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08224D0CC7
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361668; cv=pass; b=ES6Fpx1C/Jpv0P8nG3nbO5wgQspgUSUbeBrd+BKCP1ywGttImnoH4hnxvvPoIICUNkKaHP7kzCeSG/QncWCNHusvNQ0tAlEUzncofSKocVQzyjN9mY4aPjd8B7ysw49RBfpzIqmbCAojSwWMLzZiQTH4fRJ1Iwbmt503OY9pa18=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361668; c=relaxed/simple;
	bh=cL1tlCa6jM/ci/rkuMQUF27PfSf78/QFN4J20M5SZcw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=AuDAV4wHDrC8CiUcDY9BRsZX9UaqiyfE6eq53p1opwaUqyJGKdTW57GJbjhbrLWO+e6PR96wwB314A0zSKRaeejpJ728KSZi8Ca9PaZPRq3pruuWGh9Li4p4ZDEUeamzDIJwO16x05mDv4rZOs4Rb2VAQhFCzn2CL2Fx7SDedvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ka+IyBej; arc=pass smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ka+IyBej"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6aa1da63791so1870669a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:41:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790361665; cv=none;
        d=google.com; s=arc-20260327;
        b=pvcucLfLVBGnnF/N+W13TCLRoqM26bzYuFRhAoPZNgA9zjYb6t/Kcgo/OFgNJ0F9Ul
         4SkV+f6T+yb+qTiFVNZS1qKct8QiDTcxzaLI7loBoZOUY/K9iwkD9WZoUoQoRX0ekmlX
         B3zwcADbRA0gGr5ENLvVMLLjmSRlxIPZ/JXg9rYlQ3ef0HNRfcApFfQT+vyqPzQc0+OI
         GiuRr23Skg5SUzfC2dscVkas7uiSF7UQrGfqXlkjn3+IW25aPBT1ArMXx8kO5R3dV8vz
         iH0ldHwg1ORyrrsplKAOcKDIcDnhTEgAjAWmOHzFr13u8NIAFFbyg+1pMvBxoQMHGk2T
         RwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=YRA6perxvKfWBMzKUqDXlzBQE/bhcqeABbzCGxoVUKY=;
        fh=piDJ4XmQ61o+j4NSNZ+vU1jUBKpSm3n+G5G3LAyeKS8=;
        b=coUCD5miGrLZ+iflAlHY23cYxXt/BpXPCHX1yayLd5pOa0M5RMgB2cB9ksMSskyTSQ
         nOH3d6mxUQ9slAnm84emTxhIfkgOPPTBQPqYpTkXNE7DF62BiIhol/bEuqLQjWhWN/6P
         CE+/iq4XedhsQCRNUP+/038e1uwlzTQlLbIG8REqkPwfSiyvPr525f7WfKWQS6LA+AM4
         nVzpliA6410xHG8LhuEOvaMt9DxebA6VKFUHM92lQdJSzdOENksxAUBMqgc+GRcNpr2H
         4tDZLgr/xeQ+nDWvd+7dGCe+5m/X8fVetYT9PDp868ZflXJ4r7n/JZ4RYm8tQqD83is4
         dsOA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361665; x=1790966465; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YRA6perxvKfWBMzKUqDXlzBQE/bhcqeABbzCGxoVUKY=;
        b=Ka+IyBejgCk2bFs6c8xQWsSjm86UOePWfzA3lob1tobFGUl7ki12p3i8VjY+fDnEEf
         7Q1huwgDNNev4iDOtDHf39EwlQO2ROSxC1hayocw/RAArmdrkHb++Hvarz50QlTqYC7Q
         7/KlJVvvMVK+ll1dPT2VuxWkSihYfCtZtmR15YHeLT3C06MQMEnTtTAYJY0PgVi7pRKQ
         5NPVbCOuaebBdyX6m6fLI9sQGwZlQVfFyekoPJRB/imxP9dSMA2Q9xnddPiziWKnuXg8
         ubQA2g8gwrZwzUY2qkokBnlh/Qdv0WFyRR81PryXxqlMvfNrND8MVjVyGgElQFRgw2DM
         +PPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361665; x=1790966465;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YRA6perxvKfWBMzKUqDXlzBQE/bhcqeABbzCGxoVUKY=;
        b=l8EO/tLcEUlop8uGYIwyZpXl6vIaeEpZ8BGdSPBGbhLct2uiFcis+VPOLmeHhUjxaM
         fFmKYZTpdrAHMJEBxXATHqZpxvi2xCSQ4RtuZH2PehUQvTlgClw6QZ1t9SYKnEikAqSa
         68TFj09pP4Rr6ErbjzYVtMsVkXcbHMI9sOMlIrBcrKclxog0hnRf6mtx4/cOG4fKHOnQ
         Spgupixc6UFUYI3QbaODpGrkLwUSYEGEuRN0qGATvm2oLwfJDho1O86ZrvhrC7uYnTGf
         vjPKvvZKa8YOjOgZjMqOPmREdSEm0UKUN9+OjOlTZIbcFkXaXV8WvB0ir44tMbebz0tU
         Fg/Q==
X-Forwarded-Encrypted: i=1; AKwUvBxyBr0I/CBTvf2OGnzsb31cnjKAx+6wmbu1unuAT0BzBUfBExbb3vskZOoygjELzdm7Klrs/HWmclagNJg=@vger.kernel.org
X-Gm-Message-State: AFuF++ks8rXVu6QIHjjktk+eslab793tFWCh++73kQbuDlXbQGBdAr7f
	3rigXnP1wtFu9MYqGS73R4K8K13T0YknqubDJawVIxQzzaNnY1BvrKgwUNSpNLo1QDos1XvL+pf
	PTskeKYToP0/fXOD5G5TRIBgeyrkacA==
X-Gm-Gg: AYBFou2VhtbRBGZmG31EOkCUBbAwh7Q5IiY7bWqzU8OjHCfdI2rTRyqsXkiKpdNyF7w
	t1vwdZxYFPXayTmaq35cWs9Ik+STDMbPxQrKf+khbG0lrSfC61hbBVlhq1XJhkYVASNk2br2nC+
	yDbkLL9SZqprnXb+TggXLiSHlx80rCjubXu/Kg33WIQQ0oBuZ1dV62c5SJKxU71Vqb8POW1WMc7
	G7Ov1lhj8RO55a0Yf1XHdrZFyOB75BWzE5YeqH/h9TQVuGCQ3huA8PqXWNxAb1NQ/x4amtiA8fD
	jOfdgmDv/RfEJw+lMye8ZC3GSb3ki19T200nKQftHTR/m5VFmk/1LliGrLjFlzliBxVm8uhK0tT
	ciXkNnsIlWMkwJt6Jt72XPQHPj/q6anzx8OZPDWfZQJycyNJ3CUMM9m1lV+E3AsuOE9CgQCCSBA
	Q=
X-Received: by 2002:a05:6402:4395:b0:6aa:a328:5179 with SMTP id
 4fb4d7f45d1cf-6aac8ed1fc0mr5053304a12.9.1790361664525; Fri, 25 Sep 2026
 11:41:04 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 11:41:01 -0700
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Fri, 25 Sep 2026 13:40:21 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Myeonghun Pak <mhun512@gmail.com>
Date: Fri, 25 Sep 2026 11:41:01 -0700
X-Gm-Features: AclHuK8EO0nk_ovuHYZ2MiM2V_OO_n8lIvu_WfCVj09L4gss1xu1pphbhqJqk4w
Message-ID: <CAGEsz8Hurq=5MJXLD5uA-+uPJdMp55auATafawac1_3mpv65PA@mail.gmail.com>
Subject: [PATCH v3 0/2] media: amphion: fix VPU core lifetime during teardown
To: Ming Qian <ming.qian@nxp.com>, Ming Qian <ming.qian@oss.nxp.com>, 
	Zhou Peng <eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Myeonghun Pak <mhun512@gmail.com>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Ijae Kim <ae878000@gmail.com>
Content-Type: text/plain; charset="UTF-8"

vpu_core_unregister() releases the message FIFO buffer and VPU reference
before draining queued message work. An open video instance can also keep
a pointer to devm-allocated core state while sysfs unbind removes the core
or its parent.

The first patch drains message work before releasing core state. The
second prevents manual unbind on both platform drivers and warns if core
removal encounters a live instance.

Changes in v3:
- Resend with intact diff headers after the v2 mail submission wrapped
  the diff --git lines. No code changes.

Changes in v2:
- Move vpu_core_put_vpu() after the work drain.
- Keep runtime PM and mailbox teardown unchanged.
- Address sysfs unbind in a separate patch.

Myeonghun Pak (2):
  media: amphion: drain message work before releasing core state
  media: amphion: prevent unbind while video instances are open

 drivers/media/platform/amphion/vpu_core.c | 18 +++++++++++-------
 drivers/media/platform/amphion/vpu_drv.c  |  1 +
 2 files changed, 12 insertions(+), 7 deletions(-)


base-commit: 4efa625593e1e9c76346232413997556dea1d89f
-- 
2.53.0
