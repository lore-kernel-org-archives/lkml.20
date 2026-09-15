Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2885A2FC893
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789434277; cv=none; b=pBacwf9s2F5zpjAYYn/YNmHbRFcVHZDfNlL4DJbjBIyyWnYMsMXNEPFRVMGcF374hs/VTUhfuDTynkrHGa223N6EyfLXF15CyF+/Os+8ArnGTAdTZvPV4fK/7ITtPRrebCCXchXwv6dnwrp8W4t39c91h276bK3LDXvys3seesg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789434277; c=relaxed/simple;
	bh=XtFWOjAsvoRjnsnISmN2wy46HkfLdVZ5riRgkIpNj1w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uv0eYOoVGJtThuLf5phTLWqrF5/qBiEXWk3tNn1ox5TwEcWqA1j1pQwVtXLcAYDmEVoqA1XsHToVRl69GTzNJQ648wX0bOq2hdfxmcvlv5sLCYEOMTGmr1xkTHYivRp9gZ+9NuN4RAcqeRvWGd2KfTmekAudCaopwE/x5R5iaj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XBIQw+em; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XBIQw+em"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-530de0bab75so30825371cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789434275; x=1790039075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+EJ+DL4v8rPAjl13J3qL+WXNCO4o+Twy0SZVgoN/JHk=;
        b=XBIQw+em9jCNuY3ve7MzpmFKuERzdbxP6wC9RHv3StiX7X48EQRwW6mtsKQpPH5s8i
         jPVDjPIxk/qKLy4zx0G+sAY5WXttYRBhlcsSkOv3zNjCnCvptFgKpBrnLSogzkEjzs+M
         kCdd3vXKU8NUImx85Ut8tdCMh52gQcp32AP5kwpStvOQrx5ESLdLl+s/Hk1qfq2ssHxS
         c+WEuadKYxEsiHQttYOVr4bCytEHvxrmu7tnJyBScUxF6QRI1uah6driq4srUOxDyCFG
         ntvwUK/nJfpfDXRwLQIUNnL30x55G74BZPmJZsfeH1WXKC0F6oQ9me/sxtUzyMwQ0oGk
         cPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789434275; x=1790039075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+EJ+DL4v8rPAjl13J3qL+WXNCO4o+Twy0SZVgoN/JHk=;
        b=Wr3apc/LRFPkdPOT7Piv8QVJ01c8DI51BgFm0+0JVEFmA4molS5QHiNxrvJBqiTCVe
         yivcl4xXnDR7L/jIIjLt+o57wm7XaUYYKUNcBmBALSX3i1swnwKHVznAuLG4HcHCSt4c
         apyu8mse+L0CrAwQcmBZgJmUw5WxtR+ke2Pvbh6XaDI06vhM2ArT9SjJPJYmNYKXxGOx
         /H7qAkjINNHI/br+p5DnuTcbuhY1M85T2saZU91h6rv0IKItTSPjJHmkln8XvluL1w/C
         1shdZHS8MuSVn/dE14lb4PXqmL/pA1DI3C0004QKv+sY30/hGjRndGk3c4QIv+CDhsnv
         jn5A==
X-Forwarded-Encrypted: i=1; AKwUvBzohdlsyP8BDL+cjFY3PFVECbZEwvNQSOXmksHSJlPgJVmiPuQ478YbMq3EfEbtlk1g4+U0Fh1a24S1D9g=@vger.kernel.org
X-Gm-Message-State: AFuF++k5Z1Hm/rQVxy1N8L+T19ad8sGi7OKhun4gb2MWdlF1dSYd5dtQ
	it4bwloWajATaqmqncrufbrfc/qfZv/eGLLn+L60FSQ65RpOafwvJvM=
X-Gm-Gg: AYBFou3QrdzxDYW1Yr/11m/u+WpHBbph/9I0620XVIwQFn2yZm5Du6GCHgiA+l2fNBx
	VE7IdYQz/ze+RfoByb7H1VNstvi56cFXVaVXNp5DehKGM1PB8ijnUyO0FAS8kJTqDZG6aa9cUwa
	H6Kz4D7UxsXIX/bXQJoAx7YS1M17CPdSFVaOfo8vKqEsBbd/20CRhqbUhnnpSM8aD8F1ih1xhj0
	52Xx5cEtGZ4RzFMvbXPSPPl71s8V4cqKaAwQJG+K8u8sLWU0uwx4rRtE8HTYQcsAkHdIxmqFRgx
	Js4mt+Z6qRmVxft4CMYiHIuqkZNcfpWc8nSSIHFc09anVkmcyp8MGEhrOd/npkSw0tAZbfPbjSW
	PV13jr+sjy7C0jMYgRlQkI8n10Vm/p/84DuTWQ+ETEYdcpi+13R+zTPJK4KIX9wm8r6e2aYGj97
	dMUZOqlhh6mqXyuWO2cu7GYt4XGPUqZ20b33y3099uLOSbEX/IznU1Poxdm5s08FJUsvkqPo+zf
	TH5tFjpYAMA/hk/PFgPboLNXv78AN7WLZTdg0kCol1DCjFkT7kvMqQkQ348sTnny3XHuQSykQ2o
	LTwNOTblldQyp7MiX2mXT9xI+aCif/TnPsTUR+0NZ98RdUj5WP3/3nyXWdVr97t40VQs0A==
X-Received: by 2002:a05:622a:587:b0:530:f60d:2225 with SMTP id d75a77b69052e-5310cf700e4mr71705701cf.25.1789434274975;
        Mon, 14 Sep 2026 18:04:34 -0700 (PDT)
Received: from 6e-wmo5420-02.ad.psu.edu.net (6e-wmo5420-02.ad.psu.edu. [104.39.213.233])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca460a32sm114730831cf.9.2026.09.14.18.04.33
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Sep 2026 18:04:34 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: linux-parport@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] parport: pc: balance PCI enable on cleanup
Date: Mon, 14 Sep 2026 21:04:26 -0400
Message-ID: <20260915010426.53563-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PCI card probe enables the device without disabling it on later
failure or removal. Use pcim_enable_device() to release the enable
reference after the registered ports have been torn down.

The early return for already-probed onboard Super-I/O devices remains
unchanged and does not acquire a managed enable reference.

The imbalance is already present in the initial Git import.

This issue was identified during our ongoing static-analysis research
while reviewing kernel code.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/parport/parport_pc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/parport/parport_pc.c b/drivers/parport/parport_pc.c
--- a/drivers/parport/parport_pc.c
+++ b/drivers/parport/parport_pc.c
@@ -2888,7 +2888,7 @@
 	/* This is a PCI card */
 	i -= last_sio;
 	count = 0;
-	err = pci_enable_device(dev);
+	err = pcim_enable_device(dev);
 	if (err)
 		return err;
 
