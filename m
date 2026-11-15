Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794760630;
	b=g1VGKxsNwRXYJSQ0Qu2EQqYNA/ESb7uQjwcCagfFq5i5GSJ95yzCTP2AHR3SnVGoe9DW
	 67cpfAxhTuayn1BjZESQxETVjVC3qmy+n4x+oyTbSNfPOtI6zp/pSDijaLKMclBAqUrDu
	 i75c/F4sXA0oe8gQt3IClKzYf9gdWcrDYo9RT6yxasdDL2yJ2xTkL3BCq8sF87pAQlKjH
	 yvitnrDUU1Eo186aVNJZ2zcER0Pu2IZmjbjIqFr0PvI0t10TDzA97TC6hZG463aQGhx7w
	 BKRCYYaatPlSmCJzcf0vQsLXlslUvtKzdA1Z845vwsQS1quRhZ5sATqgGvLjsnEk7IQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794760630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZU+p4ofgPxq+3pu0c9wGGRnEdXlbL2hkMu9Am+hIyHg=;
	b=lt/eSL3Mlt3plpFAcwXUvuacyIhyzNUCWT1kcvDx0imd8IF3P+Af9nquv5LPb3fe7VDh
	 7Xtwxl8mZUROr4bV16iTDJ02RtCmP/yvbg5wHRNfJ5uHIR1oILoXmXxXHnqWS2exyMWbe
	 CFVh+5K1zAlAPY78fTX26oC5pbkKLa4foHGnX1D0fLPcC4ZH7LgXx0HXek1wvpngEzwbd
	 gPw2GhneC3cSw6Bns/CAU2lawDa0bc6acorTWdIR4t8jNzLd6yw9iIT+/ch4Psj+zrjiU
	 exwN5sEN+tRUkEdTvWIYxEzM4tGl8ymIUMERZbMF3e/tO+H0bbxeiSxOidyNCpZ2SFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0bTNG2g;
	arc=none smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F43D606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 16:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0F43D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H0bTNG2g
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b3acec6677so3495703c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 08:37:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794760629; x=1795365429; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZU+p4ofgPxq+3pu0c9wGGRnEdXlbL2hkMu9Am+hIyHg=;
        b=H0bTNG2gDEZzAHPBlDa4XrlwRON3ziZuDLgNS28y1qY3cMeouwQsKxEGewtaSGsGUP
         Jc5HVB1F1HK69nBIamv5eylgtZV63Gis5A9eocEGVQDT/MdW+8ZJryjpyPuuMQBRJDaT
         sLTrYgAUw3P2yYFSfI560buiWco5gI3pAzGZw8HL5plcABzVE1KMhPMtZv+TeP5/Hp/+
         dvvU1krvM/NqXCoy5N0vyqMrOfwOfv9gUr5JMjM+2DIIUGRM/BDepGexKNGHkeTBCcCZ
         nRUP9dot7y4diFLLTiCZs01tmRtnX332puMZ+wNvh/coAKCYLjo812p9gNmUtqD7Tm+5
         Md+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794760629; x=1795365429;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZU+p4ofgPxq+3pu0c9wGGRnEdXlbL2hkMu9Am+hIyHg=;
        b=Z5XqA4s6s6i+UYGUrf5mc4ldT4YetF8G4bslVqWQ4pA5nkz/9F48KF27tkroM1yZsl
         RKAxp3/JNZ1IX/BbUa713FnvjcwEq9Q3Ku/5bOrZbxxST6UY40aLsAWmKqzfXjDY5CE4
         e6m/ZKlWio9O+XauAkeagADuhtuVmwN/kmADP0gv4FR6wrSQrN6IUaY/JPgYrJg2CaNK
         luQ7iDCV1b2n0HcfYK11uU5bcK5qtXlYXy5KopK1vL/qFwCeIdSqpM//JDMdGBQI3nuh
         uE44G9NBSlqm7bPeLS886zu0d93Hw3ykQTJPRzaUR4u3VYRfhcTRcyqGNsoSCgOqafli
         sFNg==
X-Forwarded-Encrypted: i=1; AL+hErFQP3pN0Wr131oO0bfv6Pi2pWHn3cIk8qSTwde28fQxFPpoY0G3bah7WRRXO7UngrEQGWHv3WJcQMTy7co=@vger.kernel.org
X-Gm-Message-State: APuU4Z9MpVNE+7SQs6goy/Dri7oO1VCRpCMszVlLIg9mRH+lV+9itHWo
	tPNGTG0kjt7PNSS9X9WHj8LDwpic5C7asrZ20fvHiX2WEYUQGT3stsTA
X-Gm-Gg: AYBFou0lEWSLCIpf3MXjjf2qt3pTgwPyYlVVkjf5KFQ/FCx65Un8cV2WKRynh8uCv+3
	z3cgIdkJMV6mVPmOrnPEs2VcFCnY1ivvZbq8XyKLG9YjeIvPenFYMreauI5SrLYWujDVTx0SUrp
	VlTHDTsG6dhi2J6MW8FKeM3R3Qvwu3d8622I4Ex3NClsX1RpjgQRRSZOqfZFF/hW8WfF4Sg63lx
	+Svyu9ktED2hjU5jmq2cpqQA3Qg0STelHHESpf5WSqOlsQ6Zh0fd25e5QhOn102Eq/TLwHclmTX
	gmG32Bk9dtg4SUG4fQeyqzJb2xZFM6AJ4/KN1wBfLawdksGmAYcLlzw4y0xocM90FSw+2wfC/EY
	E08B0aL41eyVR8v+AIM37f1uJXUWG2CjassnRyRLQ8sb+n+MpdN2FYO5+/lVZtho+5cw1W9Qivi
	es9yU64a7kR2F8VIODawJn9OORqwJcvUO1KZiW7+F37Z4g9ShuCtJVc3xWnhRoV/NXNYPMg65va
	r/w5DfGyZ2kaOejsRpIJyr21VPwfHCQVgOl9EFwUpRt7JKQOWY9YDt0bmrKqphe/hGJCWVBMmeH
	5L6EOsuLXqEpXinow9bQvq8/c4ppJnFEO+8T9h/C/c9X65fatEh4U3o6rHxR5+cLcRCS
X-Received: by 2002:a05:7022:b0c4:b0:176:2095:1ac4 with SMTP id a92af1059eb24-1b5030f291fmr6853776c88.18.1794760629009;
        Sun, 15 Nov 2026 08:37:09 -0800 (PST)
Received: from youngkk-vm.localdomain (67.216.200.102.16clouds.com. [67.216.200.102])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm24178729c88.11.2026.11.15.08.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 08:37:08 -0800 (PST)
From: Cheng Yongkang <teel4res@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [BUG] usb: core: wBytesPerInterval checked with unsanitized bMaxBurst
Date: Sun, 15 Nov 2026 08:37:01 -0800
Message-Id: <20261115163701.226491-1-teel4res@gmail.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg, Alan,

I hit a corner case in usb_parse_ss_endpoint_companion(). It needs a
SuperSpeed device with an invalid bMaxBurst or Mult, so it may not be
worth fixing.

usb_parse_ss_endpoint_companion() clamps bMaxBurst to 15 and the isoc
Mult to 3 in ep->ss_ep_comp, but then computes max_tx for the
wBytesPerInterval check from the original descriptor. The stored
wBytesPerInterval can then be larger than the clamped endpoint can
carry.

With wMaxPacketSize=1024, bMaxBurst=16, Mult=1 and
wBytesPerInterval=65535, bMaxBurst becomes 15 but wBytesPerInterval
is set to 17408 instead of 16384. usb_submit_urb() uses the clamped
values and rejects isoc frames above 16384, while
usb_endpoint_max_periodic_payload() returns 17408, which xHCI also
uses as the Max ESIT Payload.

On v7.3 with a virtual SuperSpeed device over USB/IP, the kernel
logged "setting to 17408", and 16385- and 17000-byte isoc frames
failed with -EMSGSIZE. I only tested the bMaxBurst case; the Mult
case follows from the same code. The code is unchanged in
next-20261113.

Using ep->ss_ep_comp in the max_tx calculation fixes it:

  -		max_tx = (desc->bMaxBurst + 1) *
  -			(USB_SS_MULT(desc->bmAttributes)) *
  +		max_tx = (ep->ss_ep_comp.bMaxBurst + 1) *
  +			(USB_SS_MULT(ep->ss_ep_comp.bmAttributes)) *
   			usb_endpoint_maxp(&ep->desc);
   	else if (usb_endpoint_xfer_int(&ep->desc))
   		max_tx = usb_endpoint_maxp(&ep->desc) *
  -			(desc->bMaxBurst + 1);
  +			(ep->ss_ep_comp.bMaxBurst + 1);

I can send a patch if you want one.

Thanks,
Cheng Yongkang
