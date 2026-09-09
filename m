Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C82533593
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950964; cv=none; b=rGTXEfDbFLK6wFWgcQehBtVefKNwPuqljSeCk2io5GH/VarRqPO8cM+8GVE3OaPTqvrPa7tjUL7tC8Xt+Hqui1CKsBBcLRBxO6a6irPxRoLaSxZnl3A9vtg+SCy5XmX1YH9I07LkV85UJWVjdKoFi8aXTMNemDV2/xYI6shpQ1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950964; c=relaxed/simple;
	bh=CpjLaJJjD8vhLCsAVTtlUMrtov9by2/IVfsnz7WVKuE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETUgfH+QUX1imDT8/ZuBS+zF/ElUkosMW9BhWDcDjMEteZIYdSuvPmFcT57CCkBV1shobg2v8ME3hztUi/1pN9sEw6U1xycG9vbP0LD1JQyfoiQvE3ra4oePjjWFqLQGQtSx9NH0GA4AA0T6TNxYKYapxyXNlqQPZfWmtJM1Ikk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=USI14LO8; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="USI14LO8"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8520161fdb9so5713672b3a.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950961; x=1789555761; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7NhZSXmEgRftQ8I2EcEI/sFWG4uZBvif+OlTpOSwU0=;
        b=USI14LO85HYD4h4yKdGROOAtgOYz7uMwD1GY+gwSPRTEV7RF3o5SaJKis2jYf6EUr1
         DsdMQaYH2Kz+ZN7PZFbFrFP2TjI56Hvq6/X8yf8qmzJjZ9YhCuaFo49ke/QzSfUPCuok
         bxGgFJn7x+00W9yWhN3rMMIrAvCux/W4PAvL35v2mkVzFak2G96ub5QG3YhPQNU/N195
         CaWfx+jLlPZ2k0as/N+Nr83eXgIGECpS9vHpHdFMZWnLaEk1r9tNoJVosM0+eph5//ZT
         wYiBMXlsBSJL+RszS+jGHL7Y2jYhijF3oUQ+nriRSKxZLw37dOgCVnr2We0pM5UmwyA4
         r4sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950961; x=1789555761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7NhZSXmEgRftQ8I2EcEI/sFWG4uZBvif+OlTpOSwU0=;
        b=XEu6ArchJBpgjHPrgNiaqQbtYD8PnsMdfZcyrVa8+xeBdQSaBrTEZzrfFczjRs+Vre
         sheIW4ulK969TlKynRvxspFSgBxIDBZ9yWofjNXSPgUIehNI1rVYB+74DH3eTjHjeITx
         WC0utYBO2BHa2ZA2kccMtXX8Y6EEsZxv/09mQGJwOkZ9ECM+mYQLT7WEGpPx2+3TPuwW
         QZ3Z/SVAwnQkGwilhfJgroigHIFwSo0UeX4g7OzpLRq0xOkVp21f+V9kjBgmW6liFQHl
         orw0LCvbXXyoaqc7QhKkazh1od174gUFJdOgKdbD8kMXZcJ7PfwXFTYs8mtH/HCFYF9E
         aLJA==
X-Forwarded-Encrypted: i=1; AKwUvByA5vaETDTF1xbMpvDwQCYfAW6xXL/74oe1k04mJPw+2Rt2DeX/ZtH1QKCOaZCT2+qmSFp39kktROjlXnA=@vger.kernel.org
X-Gm-Message-State: AFuF++k3ooF8ECp992vjUMAVbkZUGW1+xs3mWl8SX8JQe5CQn5FIgcWN
	wyn75o6+cp0lffqbDApVF7XBQF00KUW8zyeYPVclqrPIKk3h3BtEusx0
X-Gm-Gg: AYBFou3G6djnboTDRV2SWEZmNMd2/Sm+Le+BEgVQsKAiREbAbxYODSmsYozQ12olOj5
	NvGqtO1EJTxPB19g7BjI2boSfjqN78DZQ4FgJ1pht1NWoTCZa50+Lbmd3jqtnUSW2UvZDWDrW2A
	xnG9DlaeZTDFrLPBIpMtAP9AXT7rcHW5XY+2qw/XlfPqIdNXTvxqoDI8G1FfmbJ5ktLm6NYrRkH
	UQcBA732+9rhZhMp8fztLgXBhepf7dx02fRu8oW8yXWpeZlM0rd2IULmiWg8P6dATBxlJL9Dgpk
	Km8UgQJwOEG11UrrCNFFbWdgUMSboQApMiaRvJTh9z/OIW6oT2E3vDMu7bctDXo4eN1mmPBtWwY
	/WFQRPqqSJKMPVd/EiZewpNc6DXGq1tPuVizn+Vxxq1kdq+fh8CZCHSdWzJAth+n14086dbJjqb
	ni5rnbLTjxgt0OOIQuiN1zm4TtaML+17UHGeVXsFjnPTmsb9vWkGwBxp/rDWwewzVxGUbNOD6JB
	4qUd7acSJ8MqOsKx4KSLdRi
X-Received: by 2002:a05:6a21:3943:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3da3a0aa8cbmr57062584637.18.1788950961428;
        Wed, 09 Sep 2026 03:49:21 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm12026723eec.29.2026.09.09.03.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:49:21 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>
Subject: [PATCH 5/6] comedi: pcmmio: validate the IRQ supplied by userspace
Date: Wed,  9 Sep 2026 16:18:46 +0530
Message-ID: <20260909104848.1763-6-yogeshgaur.83@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
References: <20260909104848.1763-1-yogeshgaur.83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

comedi boards are configured through the COMEDI_DEVCONFIG ioctl, so
it->options[1] is a number chosen by userspace. pcmmio passes it to
request_irq() without checking it first, which lets an interrupt owned by
another irqdomain -- a PCI device's IO-APIC GSI, for instance -- be
claimed for this board. When the owner of that interrupt is later
released the descriptor is freed while this driver's handler is still
installed on it.

The board's interrupt is routed in software rather than jumpered, and the
driver notes that "any IRQ from 1-15 is OK", so the ISA range is exactly
the right bound.

Bound the value before requesting it, as das16m1.c already does. An
out-of-range value is ignored rather than rejected, so the board still
attaches without interrupt support, exactly as it does today when
request_irq() fails.

Fixes: 6baef150380d ("Staging: comedi: add pcmmio and pcmuio drivers")
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/comedi/drivers/pcmmio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/comedi/drivers/pcmmio.c b/drivers/comedi/drivers/pcmmio.c
index f42b7343b4e4..afe2bda91659 100644
--- a/drivers/comedi/drivers/pcmmio.c
+++ b/drivers/comedi/drivers/pcmmio.c
@@ -684,7 +684,8 @@ static int pcmmio_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 
 	pcmmio_reset(dev);
 
-	if (it->options[1]) {
+	/* the irq is configured in software, so any ISA irq is OK */
+	if (it->options[1] >= 1 && it->options[1] <= 15) {
 		ret = request_irq(it->options[1], interrupt_pcmmio, 0,
 				  dev->board_name, dev);
 		if (ret == 0) {
-- 
2.55.0.windows.5

