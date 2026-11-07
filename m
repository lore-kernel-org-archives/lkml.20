Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794011249;
	b=Rkz89GfMIIVsKtkJfdjpdp8rb+Ou+wc0vpGDK2LTx9Fffm62/TFV0gwULOpCZ9+mWS8o
	 A3cCLjAr9dVM/MeTW2e2tknHV4anG0ADC7n6/ArAEpfbYvCPwCWYl/wjrX3ihr1EXce6c
	 XNzpDMLCIMCHZbP/qHXAadUF7tqxUGbqlMDt8i5v8sJ/6SQvNCgMACSENOZs/rgPpZmKo
	 zKxMJAsZFoLSLPHF8B/bqoaZRoF0jJXMYHIMT60yxzCLD1RRofWMIcMD/OET3Uj9QdJv9
	 K4rTGNAbnpZ1/6sWDbUgmIMj2+k2iHRzQbc8cdUjkNF40NrDxF7gQjWT5OapUXWIpXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794011249;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
	b=otpx42ZeXD9bneEf1gvtIJjXBY/IMFqFpsweyIwGqDueXrjhl+iPjNCh5ln2K71Iue5V
	 p+O1wMrI+t2RlrvfipAmB9j8NeH4AJUyu/cSA/1nnZDUVAmQBcHCULEPUmMb2biF0gewd
	 MeU3V+AGihMxgheC06lLyVa1+LU/4wEeSSbOivbQiPtCVnQRKiCsfHhiCQ0D3HNaZVcmH
	 T5sjRpignUJEPipm0PtCVkQGi+/577mC+rmEoI7V76FDtee1ftslgnrw+Jy70U508CzXj
	 hW1OYtTdBNBmTObE2vQ1eWc4sGXtPw53GrZSi8EUbIDlZt696Q2VtzuWI4kAC3KdQ2A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NiHuWL40;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzZBVusC;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38CD0606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 00:27:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38CD0606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NiHuWL40;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=VzZBVusC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794011248;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
	b=NiHuWL40Di6gMCiQJjRXxpcluaIy2AvGzZ/zGt72FvRd6wnigMlk3V7oMW6S3O9+2HZII6
	1qv+FplDomG0VBx9KWAc3CL1fQ16JUW5IfVB+/Hv5aozAVK0xyeF29fN45QHu1q8Rak8zK
	Qvq4ZrMkJ3Q8jh69+1yRprwLF0i4JW8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-38-vBtSbm6BNUOOQlFWxaA9Lg-1; Fri, 06 Nov 2026 19:27:27 -0500
X-MC-Unique: vBtSbm6BNUOOQlFWxaA9Lg-1
X-Mimecast-MFC-AGG-ID: vBtSbm6BNUOOQlFWxaA9Lg_1794011246
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1e62510cso288271785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 16:27:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794011246; x=1794616046; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
        b=VzZBVusCaIfSJo9m2kCp9VBm7UYuZWBp+NOOYlJjmmWnoD5eAEPS2DIhO+i13wbOCY
         EEnpouyLBsOH96PbYXaNHIRa8cqSqo6YQA4pl9I9yJa118p1ebQvz+u38M1XR8VOTLIM
         zTB/auLnx/AroCnxF4cMjEhvTZ0pHnJCWbF1wJXTRqmhTkH6cjxLEbDdPII/vRuwd9ol
         PPT8tiEjpROBYccWTGJYE8wRvjeIjMFI4iOtK2ik3Zfc6FqmLtIVLEKmIcQ476VORDei
         ZyfbxsV7tnTzD5YL8LfrXwR+baDPSKhi2EBADLca9X/WzjjWu/lesDlkyLPf24yv20G2
         j0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794011246; x=1794616046;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ggPcQoF3sJG1GRBPHH5Ww0rZcBO2CUsFZ1xuXmUsbNk=;
        b=O1f+ylz5BbBCtfPMTotq4/JKMiheUveHfx34Qsb1HZwAbgAVOsJ7OYRcnHsWBaq8Ku
         bo5vZNltsDu8n3VQVKlgNUS2PG73CoYRVIaLrGPiPyJUY5FyZRVLXx4XracI4BhS1/NO
         fLnkm5ZK83N6Z0xMig0glS4ddE+pon53qg+HC8GgE5vU6W245vHhXTjIy5aWYdJEvcXl
         J9VtNUUOBD24k5gWpVnSCakPGTLLDgAdTj6sTcUMhGJO7qm60SFY0y76BSJY07ZB1Eip
         k2Nassjo/jqXYpRBwW0zuWXcsmUE1aMobBqSefV874I2TArInHb7giMoMqdd22q+pTMl
         igXw==
X-Forwarded-Encrypted: i=1; AKwUvBwrO6fe5c47e8N8Mf1nLAB3iSs3rO2fFx5z1NFHAj7YmmUMCiUHEWXsSfJbRSW5joC32J2eLUlga79f7jI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8GrLprItff6WnUFXQASK1OjW8EOxt/5Yx4bO7SvodV09bNaYMQ
	G51XDfN9VZtUZQl2JVvAyUQqYGCSWn1+HfaVMwhJWaYNIHhOYmCAEadF62B/3uoFHD3VX/97WWM
	PxAtC0oL1CtrEL8XLuRo4acZz+SfN5gz1Ptz0iQxW2B+G8AducFpw0OdxmtDUcXYu3g==
X-Gm-Gg: AYBFou3b1dIURuJkn/fkIU2xkoRQ7Yu5AkLVv7tC6aJeAoTsIq6p6Ey7JpGJcQoRJfX
	O157LJw2BFuo1eFwKU5v/cGALoDqhUfza/7JI6Atkasyu7GmSP3ACMZisVkyvOe+964uQP+BCe0
	vJsbOxKtHYy8c0o2+sjkyagL0pOWtAJtMuVjA6aib3nJFAbS4DsHVYgd3xFNeZpWpCJyXzx0U62
	WExMk/O1ddOogkr08JAuNDKaLHL1/68DX5hvYKM1GRN1hwi51N3AdLSKz9T5pCcSj1BsrAQCGj3
	t3aLHAxgm6jIZiJat1064L40sgV/6LjhEo2ybuD1AyifD5dkjz3niqDn9FCt3x+AOy9uKoqm9SI
	wN+mY1m17FG2bIXXaoWWyztMnlR4Ee23F7I9giVkpTg+saoEab/F0oq8fHOQpXt0EaXAT8uMkbJ
	xB/28qBVYnWHC2B68h
X-Received: by 2002:a05:620a:448b:b0:93f:2aa8:c549 with SMTP id af79cd13be357-945f34d7959mr663754185a.24.1794011246414;
        Fri, 06 Nov 2026 16:27:26 -0800 (PST)
X-Received: by 2002:a05:620a:448b:b0:93f:2aa8:c549 with SMTP id af79cd13be357-945f34d7959mr663752285a.24.1794011245960;
        Fri, 06 Nov 2026 16:27:25 -0800 (PST)
Received: from bmasney-x1.rmtuswv.csb ([69.43.42.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f5a97aa1sm254122985a.8.2026.11.06.16.27.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 16:27:25 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Subject: [PATCH 0/2] pinctrl: convert to subsys_platform_driver()
Date: Fri, 06 Nov 2026 19:27:11 -0500
Message-Id: <20261106-pinctrl-subsys-v1-0-f17582f32aaf@redhat.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMz3YLMvOSSohzd4tKk4spiXWMzwyQjo0STJEMDcyWgpoKi1LTMCrC
 B0bEQPlBlVmpyCcgUpdpaABlM8alyAAAA
X-Change-ID: 20261106-pinctrl-subsys-361b22a4b107
To: Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=kDTf9y+UELPGx2xKi0yx9abs7XbPUZFUrGvvsIFq3xk=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLeFWS8zkz9FG+99P0aIWcxOf2iTfV/omf/rJTnNKg4s
 HrjYr+lHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEyEz5CR4YhvbvWW+7wt17a9
 Ps5X883+oftzg5tb7ANmLF1StleC+zojw3rTg9s+/2XKuveeN/aHclh7dXVs91ymL4zpv29zKoV
 dZwAA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Reduce boilerplate code in these drivers and convert them over to use
the macro subsys_platform_driver().

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
Brian Masney (2):
      pinctrl: ingenic: convert to subsys_platform_driver_probe()
      pinctrl: intel: convert to subsys_platform_driver()

 drivers/pinctrl/intel/pinctrl-broxton.c      | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cedarfork.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-cherryview.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-denverton.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-geminilake.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-lynxpoint.c    | 12 +-----------
 drivers/pinctrl/intel/pinctrl-merrifield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-moorefield.c   | 12 +-----------
 drivers/pinctrl/intel/pinctrl-sunrisepoint.c | 12 +-----------
 drivers/pinctrl/pinctrl-ingenic.c            |  8 ++------
 10 files changed, 11 insertions(+), 105 deletions(-)
---
base-commit: ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
change-id: 20261106-pinctrl-subsys-361b22a4b107

Best regards,
--  
Brian Masney <bmasney@redhat.com>

