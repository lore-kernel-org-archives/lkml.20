Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793744785;
	b=MPN/H40QRV/E63z01f4r5F3PNZ3hryxvGfsPkM7G3SStzZlctOJktiha5BOcFw/mMAzr
	 Z6p/YiMXIRg+PfFBD/G2ICEuS4SL+XowF0R13vTvXTWgVt6VRpSoooagcEDJSUY/wduvi
	 6i5CUZWgyaSTBWquVYllNe8jrQXWtGVsgbkea/sSul/lLBlddsmRnfUdE38uGhqzCczWY
	 ojViXH8DBLnq56zDZwXotp4WD48EXm6vqHweFwuVCU4bfTU1V61LDYoee6KeVGpIXTe/i
	 oQP1jElgQ4bB4bkpyNs4LrGwOlXaIj1QGil45ZIA8hL9QBlDBRyUUtXoVS4JmMwd1Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793744785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=6B8/kguaSg2buIHgi80qhLVJe9NS42NHDxy6rcmAb7Q=;
	b=PtXlfyfs4oPtmH8+y3VOPcIRfXO2Mpe6gJmozvuKQIGURMIra3RrXF0ECCGSMrL8c7VW
	 hLK+O9K09WAe5L8LUrH+wESMmm+sELFjy1guppUGXGTyPXWqscz2scWYsJcXgsiwEabqu
	 OJkzoAHWM1hiv0m7ezU66fl41CsLq/a6rhyJGn6dBBbcpCcQbUcKysTZLPs4xU0PyEeFZ
	 rwvgGvw+PLua2vp2XmkOFP7f+QvD0iaRLHTS46n4tnOYGICFmPhyfTgt6GV0sF1iFuUHi
	 QVdbRMB8sKcscmDPtNI53k+WcEexMsjMoaqYnaUt1TMGO3E2357ForEJBdZKmlmbCmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKKvJtHq;
	arc=none smtp.remote-ip=209.85.167.178
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB0606EE8D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 22:26:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2DB0606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dKKvJtHq
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4c5d8c7f326so48162b6e.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744784; x=1794349584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6B8/kguaSg2buIHgi80qhLVJe9NS42NHDxy6rcmAb7Q=;
        b=dKKvJtHqdm+dQxArWG5tGxKUXakQohe4whh+UM5E2qaRZ1J7QSOeRNuNLDWDinX5Mx
         lQQZ7H8qQ4R82unXTabFMRowb/yFBo0l2/EmGQqhYmRvPI/+EWwwF1Aj7pkymA8foqX0
         KVODrDZ/s5scJCvp+Q5XBT/oAMbGAz5freabTv85aaA/PCxkoG0VwMuip7KhxDJYT4oo
         Al4baaX65eKEWob2gjxWTk+jiwgPaf5wMaldkqcxAJAASNvnJSBK8dDwxlGSzyKG/kp7
         c6JoJGR+S5phFX07DUxJTrVmvztBj9YllLtye7LHgx2E1CsyI+i0DGjlLrb4gKT7SQxy
         Qq3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744784; x=1794349584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6B8/kguaSg2buIHgi80qhLVJe9NS42NHDxy6rcmAb7Q=;
        b=ekdvVzUYxBr6H3aqLbA5MPYhOD8kDAfbnUELIO16TrGZ0nHQGQ6UDGIFNF8lWBNzi+
         P843y4FjqUQaKFvUuvg01F0EPcJSVoz1lPIE2lSPBp1LLD5Y3g4wOWSYv9BnkWN0mKB1
         Os9WAnLEuPPPVPg04vqISQKdzTNCwQf9ztD5xzzdrhvlRk5wgk7hdbOZjzc/HhGSKGyW
         jtjc6HfE3HevB9jE7NB7dPwsV/xAdC+wixQY9IDdCIU9ldIYAmXSe6/hiZmcmn+ORYeB
         AbwqpF0jt4xkEZKUzfiqoUBwpAwz4R7pARP4QG632jTj0mXKisdNSu7ojfTDFjzqVfF4
         wLsA==
X-Forwarded-Encrypted: i=1; AKwUvBy3bwPpTxY4u+WhKX9JryWHR/Kkm91feMeMPy2gk4Ox9PahUth06q+tl+6dFLvDrAtmVIRCgKmXX6hKZ4A=@vger.kernel.org
X-Gm-Message-State: APuU4Z9m0P70xEtgPAAWN98IWBkGwW15VxcqJY6Rspeq/IuWoBxdhmBi
	FsiVu+VCq8evopHMDIea/5zSef8yGZ5GijIZ+/gfmTWVSi4cpyWbv2rP
X-Gm-Gg: AYBFou0o6pipuVMsHSEljTDlm4kpS3ly65CjF1c0wMRjgh8ONXmeVQqAQFNXy3G7oDF
	aGRhMsCOxkXvZX5HnkhEwMHB3tjIlPamLFtWdFAydq8AVzzer76nW9WoKadX48EgMXm2ucMHe3O
	p5jd4da+NVf28PCaihQGTvlsvQZq17DSyNPEfdoB+grTwDXe18zQyF+qC409z9f/0rXdXDSROjO
	hd3MEx5G46uuk5JKnngBkAXBZWQPTUud9VOLOfoYCXsLUd+bwNIXmga4blOsWSycjijqayZkmjI
	NcnVit7h9/U/RSCLq/9fSPYSQOs+spVQcRM8TpJV7VrUMMO4GeP8Q6Y9T3g58225t7HxcWoYVZG
	ylSGq7p3UXnJknS0w6DEocJ+8HeUVo5Go/4w27Lg3PDYBUnZUZOA1iANLWHVR1aZAWw+c3zkfdN
	WF2rLkFJ8zFVwrdaILGogmXEWwUq8zhUlVvlSlL4PPvVD4YHTt1vcW1ArN5gsbyFkxgMSDzMvDN
	DUP3Ij0WjngTA2ovW2JqPGvHFXfa9PGhSVOkTdCv8PoqA+UccFhG4jMSmQE34h9dsLUXuMlyxK5
	yz6ztttGIZFubjXU9kSqBsNOdLmtlrGP6ZKnnCnPlcjGEjdfGEn5lzCW3jY2nUIhIBQnfvrs1+j
	n6/BCpP2r79HfmD/QbWKTq4mu4KYDVwvNLTLFwYyM8xYUa2WwL3DV7NK6IrKNvSNReapxANNjhE
	fyDtl79xrVmzStxQVhO+FvHv7uUT7OJ8gK5/HvU6tKQYAH6kQoDK8=
X-Received: by 2002:a05:6808:f12:b0:4f7:d324:bc5e with SMTP id 5614622812f47-5640de72cdfmr9730628b6e.58.1793744783949;
        Tue, 03 Nov 2026 14:26:23 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef58b1sm128435b6e.3.2026.11.03.14.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:26:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 15:26:09 -0700
Subject: [PATCH v6 07/10] dmaengine: dw: report residue for queued
 transfers
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
Message-Id: <20261103-submit-dw-dma-synchronize-v1-v6-7-2ee0c348224d@gmail.com>
References: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
In-Reply-To: <20261103-submit-dw-dma-synchronize-v1-v6-0-2ee0c348224d@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Dan Williams <djbw@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 dmaengine@vger.kernel.org, linux-serial@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

A submitted transfer may still be queued behind the active transaction.
dwc_find_desc() only searches the active list, so a status query reports
zero residue for the queued cookie even though none of its data has been
transferred.

Search the queue as well. The status getter already reports total_len for
a descriptor that is not the active transaction, giving queued transfers
their full remaining length.

Fixes: 3bfb1d20b547 ("dmaengine: Driver for the Synopsys DesignWare DMA controller")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/dw/core.c b/drivers/dma/dw/core.c
index 3cc8579f8829..c602ea01cb83 100644
--- a/drivers/dma/dw/core.c
+++ b/drivers/dma/dw/core.c
@@ -927,6 +927,10 @@ static struct dw_desc *dwc_find_desc(struct dw_dma_chan *dwc, dma_cookie_t c)
 		if (desc->txd.cookie == c)
 			return desc;
 
+	list_for_each_entry(desc, &dwc->queue, desc_node)
+		if (desc->txd.cookie == c)
+			return desc;
+
 	return NULL;
 }
 

-- 
2.53.0

