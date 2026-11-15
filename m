Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794769130;
	b=rPpYyXLWxwcKT7oeiOdcLwN8en5P5Y7VULcVBzZH9UtyatDZzj07aITbjt5QLfu9ZE1B
	 cUQYuV2FiV8ytkZ1QTEXZNh95Ch706lgHa3qjW3bM9GyjRLt4Hyl1Ezd8NvKnCOCrzoUD
	 gTeIn0IDhVcb37k75K/s8n1Zm+1Z2ChX5DqRM3ZsrSTTxfnvW7xwWH/tjrAfW/QbdMBXL
	 tq0bAx52yGZUtlTUm9/YRev7LTONERMXaeHk97He+EwP5CQdKKxkC3BUMbksKokN7wqJu
	 1ifbl9MtbUKOhCzlB+TyOA/dGU+4gV3sSp9L5TP0FrMzWwZLLrPM5yji7hZZSI/kFpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794769130;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
	b=qcNcVBB0+XqpHamj4Dfwy+Qq/IEG7OPiVQTeBZugxDhcmrOojMFa+yK/ywIMbL5uXuQY
	 cc5rtEw4bvOCkGZm1OVcxZZOsARe/h50IlS07zVVYclH+vz9zaR2IwP25pYiqtsZ0LCak
	 CI7q7VE3hp5qmli2hVuCYF0saf481+1MQRM2l8UIIs5UT9OUW3G9PnuvPULBT/H4adifO
	 0CVJ14OxJWGhXCBf9yvYJirwHiL9nysdk7PMhPvMni6TytgMIvMT6dJeqnKwFtlfyeEhJ
	 rpNHirKCquGR7WPLzvv0djak76/9ZOQkWKqCglNo3ofr6nDj7i1KuXP4wA0PKZ0gwmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEoxaJhj;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C489606A885
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 18:58:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C489606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aEoxaJhj
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b3acec6677so3578824c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 10:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794769129; x=1795373929; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
        b=aEoxaJhjYDfx4ScZ7+L4NjQUNajI0PdG1J1JOxjZJT7LGTv4DBXLaKAi6WHOlabSKI
         I+khqWWi0Rgc+C9ZZrBNqqgshJBzZK0KAwQC5YVmVnh9u4Vlk2P20IQbVNRfaXi3M3nE
         hnCkU8zwdDKRtG5bNfEq7qFubwf2rlZusMF9UFsK3n/k6W3/ZvHzOuFKP/EmGzSA7I4a
         6D5ak1Ac8jPdEU9erARKpRgQrKjojKm2Q+A1V2KmquZZzHQWtuyITnPZGHWZUVU0XJtn
         fThLmy2Z7/wdFAhVI4fA9x/3y3xqobYCl7jfomPyUtkDLssdQa1vbYzHVpfnXCgcyNpo
         Brrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794769129; x=1795373929;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvKuisBW9st6dv4iYQYmdk7UUIHA5W7Ob6TCeUj4NB4=;
        b=Po19fFb3Yz2z3rCQLcs0cZS2zMtqBbT60ByslMq8XC82LuSN0N+0PGYBV1JQGUZ6L/
         aI40AgXP52m0XkrTjKKQTH7Hzn7dAyo5eaic7ru84yIqtgLr6eC9YFhQBbc5Ch6u+SKs
         wxBjYH7KdQE/XyDT5W+paZ6lhUWwJfHi6ONHaDF/9FSKIbMkknirGLo7YbtWtloOi1S+
         EJFDF0/6hZHPERx6lC6LDQu1jChx7ZWVyc1+sF/3/85fP+rYAjaua/8iSOvXquqV3ERm
         EBqjuP3xrPy+NfMu2YoDgBxAKup/6QoNq9zgnRoPGIghhh+eEAEJM3wnnypx3V2YCoN+
         KvoA==
X-Forwarded-Encrypted: i=1; AL+hErEdO0AKRM3ypcRyIFAhIIBJgXKTTM10Aqqpuw284BtJNDneqXjTcaHyKVgrpUhS9TbqjwFLJgiIu8mzCZ0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9kZMxhJ2kMNShCkr/nNJ6cx8mYcREQLCeEm71VYvvI/F6WWCWD
	wxG3ORNfpE3wVBNB75ncta+2pYE6T3BYa+yY6vhW7iRFID2njMuVbxdm
X-Gm-Gg: AYBFou1l3gQSCY8OygsKCz0+rmnUyV6TTC0THYbz9Y4YAai8BrrZN3KFzyaKUG3OD2M
	lPtAs7dVPIh85G2unCzn5/ec34deG9AJYmSJnnHK+jbZ24X6WWHmgKM5y6by4/oQCqMmYFI9m+D
	efEvsMKdo7nhBVw6vOK3r0wOlil3XsuMR+mKItdIVkE0W8dE53fbJtPfVa0X+AFmTVj+JVWuR7c
	6oThHD8Qa/DNEesQEdeKSZoQUbD1KU53Mc3ASk8Pc7NEbOm+B4zaXs1c9D/HdWC14Eorm/ofLB4
	QkO6hzFd8/ezQBcssg4jiqRtYCBn/V59m4et4r+QkSmS7NVYblrklVngUr6f/DnaS6UK+2VOAr0
	C98as7JWoZWQwZ3tfAKDdgPM8aLH4yr3W5c4mZFc04C7EyZBU1WOLcegkSNZBU9pN1rN7cPyYSE
	PlAJezdE1di47RYLa621BVajWbVCUCNn1jXCCYKbP2GZ7Gx1Dziyzrp/XK2cbD7FxPnY6M8kK+0
	wy0MduGJDcpW5n/6u5TW4UGzRf+CMf0XoI3X0CCMuAz75ghvF1tNeLQbWwgnsfSOAI3a6+vkqQB
	Aih+eJpIP6r+KnvYUFXKzEzezMDOn/oGbtDdW45/m74SRBCHZje3uQ==
X-Received: by 2002:a05:701b:450f:10b0:1b2:41af:c21c with SMTP id a92af1059eb24-1b503157396mr7939805c88.39.1794769129109;
        Sun, 15 Nov 2026 10:58:49 -0800 (PST)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5329ec87bsm82306c88.0.2026.11.15.10.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 10:58:48 -0800 (PST)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH wireless 0/2] wifi: brcmfmac: fwsignal: bound indices from firmware signals
Date: Mon, 16 Nov 2026 02:58:41 +0800
Message-Id: <20261115185843.64633-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
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

These patches add bounds checks for indices that the device sends in the
BCDC firmware signals. Patch 1 covers the AMPDU reorder indices. Patch 2
covers the interface index of MACDESC_ADD. On USB, brcmfmac parses these
signals with the default module parameters.

Both bugs were found with a static analysis tool that we develop. A
userspace harness that compiles the fwsignal.c functions unchanged
reproduces them under sanitizers. No hardware was available for testing.

Maoyi Xie (2):
  wifi: brcmfmac: fwsignal: bound the AMPDU reorder indices
  wifi: brcmfmac: fwsignal: bound the MACDESC_ADD interface index

 .../broadcom/brcm80211/brcmfmac/core.h        |  2 ++
 .../broadcom/brcm80211/brcmfmac/fwsignal.c    | 26 ++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

-- 
2.34.1

