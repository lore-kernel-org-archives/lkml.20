Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793125071;
	b=uslqgrGTDiPfu4eBV71aTPzyaYo75h/LD9okgG2eByVX7VOr25IMpQ2/tTZXlrrirJlz
	 +ilUwaA2lzjown9gKvk2kH40bP8v6VQC5lQzCz0E2vs108nX8m5z4DG86gmFBcKVAWNIr
	 /IIs8AW1uIMGb5Qv/0hz1bvk9FOkidD/YO+F39Wlq1gXl8ZQOKiCyCFrDChLu5ph3i3DB
	 hCbEiCP416YCvw4V4sWo1ypBmSuVWDPqPXcHF059sDoFIHyIXCyx454UaE7zrj4UwmL0v
	 ti+N7tYdQZUpqssHgKcfOOBeheQiTjpMqez32KZpC3d5tuQY0e73RX3SEnSVFtCEpEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793125071;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=WfnZD24g2gdDcLADC8Y1lzpwL6/F0QAQfp4goK2tXFQ=;
	b=3rxhaPx78lhAiX8Y52FPebsmafrBcCTessdIHdbS/Tt4lxG2EAfoxXe6T5GPvLOL9PId
	 2n/GM7mdM06dRk/1IiI3Mok0GRdmgqW4xnLgOw2a/7iQ9aFASE0u1xDiXf0H5GWTA3BkJ
	 Z3u5L3QUkmJSIW0Dnr5gTG7qtmXFtjvHek8RNsou41B6+GELDZPGZR0qzkwEzBSsdqhek
	 3SYbRCiXtjwb3R8qqH9BoidPml1qE0W14CObEXeaFC3V4IW/yPcs4kyA8xwK+d4SPJogS
	 mIndBbme5QqgB7vLLTOFVYI6R5ZaKDY1LuZqOZOdTPb+enN1P4F0/CQ+hNJYHCr0KOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VmWnGCox;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8977606A322;
	Tue, 27 Oct 2026 18:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8977606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=VmWnGCox
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2D22E1A134F;
	Tue, 27 Oct 2026 18:17:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 00420603BD;
	Tue, 27 Oct 2026 18:17:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E77B210329083;
	Tue, 27 Oct 2026 19:17:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793125062; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=WfnZD24g2gdDcLADC8Y1lzpwL6/F0QAQfp4goK2tXFQ=;
	b=VmWnGCoxqadmsoL0mCv3fBFBAPW76ae7UqqzqY159Vbm4R71oKv1B9AvEe4YSs1YI6I9gI
	iUL2umcHY5YUcs1N7tpon6vIaPfi15VCWlrm4WNNCJOSMn9BSOKjxmQVORbbkzOtDeAPEr
	p04JY2sLVnbE4m+s5x3dLZAdTGlQaRF/K7V/cN+rXr+H4WoTS8RnBYIeZEjHrcT9p5pyrI
	7cfsTEDu+Y+K1L67VHlX+bboQIZPJZxZAagdTpapJMEjgGtbNEvaMkhAB7O48MXG1qiWDh
	9NVrAkhlbmngI1WCM9DdXhmJ6liNqoX1Hde1ldLkwCqTBkp9pRu5ssysjAEz0Q==
Date: Tue, 27 Oct 2026 19:17:38 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 linux-kernel@vger.kernel.org, Josef Bacik <josef@toxicpanda.com>, stable
 <stable@kernel.org>, Neill Kapron <nkapron@google.com>, Ijae Kim
 <ae878000@gmail.com>
Subject: Re: [PATCH 06/19] usb: gadget: snps_udc_plat: lock out the
 interrupt
Message-ID: <20261027191738.457acac9@bootlin.com>
In-Reply-To: <20261027-llm-usb-v1-6-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
	<20261027-llm-usb-v1-6-b9751ddb9c7c@linuxfoundation.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Greg,

On Tue, 27 Oct 2026 15:57:46 +0100
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> From: Josef Bacik <josef@toxicpanda.com>
> 
> stop_udc() is called from a work item, when the extcon device reports
> that the cable has been unplugged.  It takes udc->lock with interrupts
> enabled.  udc_irq(), the hard interrupt handler of the controller, takes
> the same lock.  If the controller raises an interrupt on the CPU which
> is in stop_udc(), and it is likely to have something to report when the
> cable is pulled, the handler spins on a lock which the interrupted work
> holds: the CPU is stuck.
> 
> Disable interrupts while the lock is held.  They are enabled again for
> the ->disconnect() callback of the gadget driver, for which the lock is
> dropped as before.
> 
> Fixes: 1b9f35adb0ff ("usb: gadget: udc: Add Synopsys UDC Platform driver")
> Cc: stable <stable@kernel.org>
> Cc: Neill Kapron <nkapron@google.com>
> Cc: Ijae Kim <ae878000@gmail.com>
> Cc: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/usb/gadget/udc/snps_udc_plat.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 

LGTM.

Reviewed-by: Herve Codina <herve.codina@bootlin.com>

Best regards,
Hervé
