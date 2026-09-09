Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B935328C3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 10:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950967; cv=none; b=ovmTdD+Z0m4SYiOLlafHPEvww08g4DxyRM59h0xmJ3EyCbS/5XI5UjLNJ1vInzq1sutrDICMe06VKdwtcwTjXaAFRKpeVLqtak9zHrNwUCq0DYzbHYMz68k0aPuQz+s7K62Eo1clzixdc14xTlXI151PW2vtOHqBVCKXBVcgz7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950967; c=relaxed/simple;
	bh=mGTbmang64JjYEa8MhL2eBgNDeYF7cnKrLMsVDldpqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XV4USuhJlzNp0CecSQH2n9LdI/1FyqztjncVk+DDEh4cArCPEoRYJtbFSV8Nf3gjLvdtdvFTqAP4Ev5iLDBhOf74ri8CL2RC6Cqdi8FTlbzONLVEdJeAuzIvlAeSlKpNFqvmkqdxJBsBQ0//pVq52faiIxtv4vLet4Ub/jmXDlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIJqZ6IA; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIJqZ6IA"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cc48fe04342so2279646a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 03:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788950965; x=1789555765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wVde/0UXjeqgx2G6fnsoxLCBIhaGKDP8LoxgsoCSsBk=;
        b=LIJqZ6IAhPp9LipLxlPw6AhxQwbuubYcM4is3LdXMK5p+Eg86S2GwkF4BJCTKOwxNC
         9ZnLVspTQ/nIjzjRHW+sbke8/OzD7UYlxDR7+vRLVtvdXOJqyozcUhDaOJzOMfwe0one
         9xpjjyuLYmcElQcXJ3Ku+LMTp88pYcGn8xTpKcNpPtGXJi2TcbFbOtySX9hQhy9RHQA/
         r9W4M+Bvs2XloNeWDqqeWnLRtm6wxYoMSN0xIpqQyZ24yc/HuE32IZQwmfFsaYX7n905
         fRWtwfRGGD+GueSmhPQHJPvdF4MkqVP1h+ysexQkdH9HWlQsZM6fpBKsyW2SWi+Qnlut
         Gt/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788950965; x=1789555765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wVde/0UXjeqgx2G6fnsoxLCBIhaGKDP8LoxgsoCSsBk=;
        b=o4qEtCtt42be8XGDtGI9eMiNS+Sc/viwq9l47QLLgXD66tTqXCt/QRNJNIGVIRwrkw
         iNiYPNIkprKcIaCrpl5W1XMuBHZgOSR7gfPmTO2JK6FkwjRF6SiqV1hpI+ZUFBJ4S4yr
         3Hi90swO1KjgdeDbngQKniDi7TKwMX59pIlWyPFClDe126PMV8FbluZ1qQ8oKkp48qOR
         LU+OfXCzNXm9riHlpj19T0RQgPkHfb6Zeu9ur9J3dGUs7XuiqM3itgwj7UUs2zDIdXbY
         QLCa1XLG0po1BFR1ji+DVhnDioZ4kj/fSdlK3Ylmw91PrVRvqEfMToT1ajczdddG7XJz
         /JFg==
X-Forwarded-Encrypted: i=1; AKwUvBw6AGNxRJe470llW9OEJfNjMemluzLajFF+YWMaIldMbDqdzTF84ORHULDoBm3uxy6QNn0PNrdxobH7qw8=@vger.kernel.org
X-Gm-Message-State: AFuF++mFGVoNJ69zua64Y4OcOVhBoWT451HcLJI2vfiuCmg8zDD6m+Tu
	Guvo+wF9yqn1aiZXiMjJc2pYorxtFxO9UFzSmD23dTxS4jjw1o4hFwEu
X-Gm-Gg: AYBFou3OBMn4QOrbvZJNRJna2TDjM5WdKH0BCXRQpQMW3tTTQZLLyfAYX56QxUt+UkV
	6cgAJcWJRtXt0+WrtcfLShZ7r4C0XIC9Gzz5JFic2sx17K9DcntJNt/l27zoL476kF52UM3Xlrt
	icNa0SiMaPxamTHRe+8kEX9zFJSVbh/FVwEebmOvDqFDX3dr/s5PW/Le8449X+jD4sODhDGd8+4
	KHd2OLoCnCd3+xH5YZx6Lg4ij6YC+7NpG4n7OzWkyt9ztFDRz6SYsFu8CVYxtXhrjf3osbzWevO
	eL1hQs/yTb/w/2sn6EMp2WZ/coVU8yngyxYeM+abvuMIzgMpJSSFqtLl3cbXB2yB0kyGemOTanX
	7uHYmQni+DD9SGXytZuT5kiHZI98oPsfJhChUq4oh3TP9glbhNQMMANQzp78WqWCYWiKiA38hVc
	tfO3cXKPrA7cfDpxtGO6D/4wEMClLeA6A4O2gRRFavx/PRMccBS/kblCky4dQEmK62yCLIp0Tf+
	JIo+O61oZEQlnbdnIRx2Ofq
X-Received: by 2002:a05:6a21:114c:b0:3d1:e510:9052 with SMTP id adf61e73a8af0-3da39ee2689mr53748910637.7.1788950964701;
        Wed, 09 Sep 2026 03:49:24 -0700 (PDT)
Received: from LAPTOP-450UDG4J ([223.185.135.143])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3396e7e477csm12026723eec.29.2026.09.09.03.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:49:24 -0700 (PDT)
From: Yogesh Gaur <yogeshgaur.83@gmail.com>
To: Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Yogesh Gaur <yogeshgaur.83@gmail.com>
Subject: [PATCH 6/6] comedi: pcmuio: validate the IRQs supplied by userspace
Date: Wed,  9 Sep 2026 16:18:47 +0530
Message-ID: <20260909104848.1763-7-yogeshgaur.83@gmail.com>
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
it->options[1] is a number chosen by userspace. pcmuio passes it to
request_irq() without checking it first, which lets an interrupt owned by
another irqdomain -- a PCI device's IO-APIC GSI, for instance -- be
claimed for this board. When the owner of that interrupt is later
released the descriptor is freed while this driver's handler is still
installed on it.

Every interrupt this board can assert is a legacy ISA one, so the ISA
range is the right bound; it is also sufficient, because
mp_chip_data->isa_irq is set only by alloc_isa_irq_from_domain() and
mp_unmap_irq() returns early when it is set.

Bound the value before requesting it, as das16m1.c already does. An
out-of-range value is ignored rather than rejected, so the board still
attaches without interrupt support, exactly as it does today when
request_irq() fails.

This board takes two interrupts, one per ASIC, so options[1] and
options[2] both need the check. The existing options[2] == dev->irq case
is left alone: it covers both ASICs sharing one interrupt and neither
having one, and by then options[1] has already been validated.

Fixes: 6baef150380d ("Staging: comedi: add pcmmio and pcmuio drivers")
Assisted-by: LLM
Signed-off-by: Yogesh Gaur <yogeshgaur.83@gmail.com>
---
 drivers/comedi/drivers/pcmuio.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/comedi/drivers/pcmuio.c b/drivers/comedi/drivers/pcmuio.c
index d9995cbeecb6..da80bca0bb55 100644
--- a/drivers/comedi/drivers/pcmuio.c
+++ b/drivers/comedi/drivers/pcmuio.c
@@ -546,7 +546,8 @@ static int pcmuio_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 
 	pcmuio_reset(dev);
 
-	if (it->options[1]) {
+	/* only ISA interrupts are valid on this board */
+	if (it->options[1] >= 1 && it->options[1] <= 15) {
 		/* request the irq for the 1st asic */
 		ret = request_irq(it->options[1], pcmuio_interrupt, 0,
 				  dev->board_name, dev);
@@ -558,7 +559,7 @@ static int pcmuio_attach(struct comedi_device *dev, struct comedi_devconfig *it)
 		if (it->options[2] == dev->irq) {
 			/* the same irq (or none) is used by both asics */
 			devpriv->irq2 = it->options[2];
-		} else if (it->options[2]) {
+		} else if (it->options[2] >= 1 && it->options[2] <= 15) {
 			/* request the irq for the 2nd asic */
 			ret = request_irq(it->options[2], pcmuio_interrupt, 0,
 					  dev->board_name, dev);
-- 
2.55.0.windows.5

