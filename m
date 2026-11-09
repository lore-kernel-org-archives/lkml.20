Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253277;
	b=oWf70zCjhviHoJ5rq9ylHP7JnPo+RbqlJdPia529tIfccsBt8pwAZqq2pG59cxf61ZPg
	 IHfBlw77UcWDlaLKKyqjfF1wDRCAF+/P3Kk/v9xvZjByg7l3sEe6stsnsHO+NWhnw3DHg
	 TA4z97aPEXbztB+QsMdN0P5h1RodCUJqjMn3b2gJVgR7jWOO6Q1bHYL1LT7Nyx34llLh4
	 gPApeXsP/aP6zRq6Xe/+GPVif5rfk4U8l2qKRNhxlrBUEjReS8M+HL6LprsNOD4G4Zpbc
	 ftahrJFh7VXNA9Xb9FjJD88euFG2NWHNqNqrdNxDApGfR/E+1s96HwHInoOuBvfvHbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=yQjiec7Yk01SvEkjgAhJ90ZgzbE++iwGitcjYLcR7rI=;
	b=jFNVlaI+9s26feape6vtepbAiHuCKPjh8zFuCxv99PTe9g4H9INF5iAzRD99bfPK7Fuk
	 g35fXIH6n+aQW2btHKkmLmQUI+pnCcZ0Nr8hDjSoviZs+gcRiR56qNeFtESkSn7E4lSug
	 Awc4KcwoiBSmK9i231daktRmh64y1kYPPWo7SZblGt/cNgUZ0GjgxDwyznvmU2ezwQnYk
	 BAYEM+CT2Mgo+86Vp1gEbog+2PQv5SujnCLc4GhBP2Llj+ysHDY5WeL4wV5UHM110RBod
	 GgxaA1PR70fqyJJxm3OLEX0fzoEWbdgGOjr9IpYjPI+gxOw9PDWOWgwrcDRKuJH0RJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHx9cHMo;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C66C60A2600
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C66C60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CHx9cHMo
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49134c8509fso1085448f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794253275; x=1794858075; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yQjiec7Yk01SvEkjgAhJ90ZgzbE++iwGitcjYLcR7rI=;
        b=CHx9cHMomXbnCsSj+UiJItapWX9vFnpCT1p0VMVK/bL5PS5GdudbBpqgkUKbhsareI
         xHwFmjvmsbybfdHgC0kfR4/aHdnaQjQraU4c2tYmw16cpgHP7ClBCvK4Bir1d4wlx1d9
         ewrb/Psj2DyOaQPWCTN47ZoAEClJzvOpfEAAH1vV+BlA/Ww20f9nFUiyzGREjd7lDCTw
         10DlTEMQT/SLqPaLCqgemQmhzsiXeMjaXQwo6r53KTVfDq3gFtUT76OEaWAJ2rSbK5yd
         OUyaaEW5TVkUuE3BC+lroKggd9h9e6+b4GXhcTbnJyBUd09CXNlu2E2AYA2Rv6sQQY75
         IHuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794253275; x=1794858075;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yQjiec7Yk01SvEkjgAhJ90ZgzbE++iwGitcjYLcR7rI=;
        b=vDfhnEq9XD/FghZgAwAf8fT1KrkRLeszhlBqW09Pyo65n1SF14CF8b0XvliwhNJECL
         mg1OeFiaP0OWMFqF2Z4uLhK6OKae0I08UL2VJIHspi8JC6PjTCDVyWqVlehZjTDk27yq
         5rTF9XMODZmRC7MiX5sNfUp0S6DlPw3EzDjNP4rZ8PDSDBdJW1tsg1pOV9QcfC0Zzio4
         x3VXa5CX6dba0VCG4FhOuH3jeVHlwRbayAGR/KflkvBiDPFgAakwkInMlJbU8wkudJA0
         h+tAemLm0j50xyUFbG/bODOPs5dKfdQAwz56AJGS+M7CpMqSnbLLnyP5BwWSKXS7Kg97
         OYbg==
X-Forwarded-Encrypted: i=1; AL+hErFg02dPPncAb+KuKE3FYHUq+lrsFZHr2PUplokxBKn1tjgwhh/zqWT7w4MZlTDy9vUgUXhTDR7ems1nffg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/OC/X3DbDWx7GZAr4WNYSfmWygLeyaHA2PiO6UhZ+/CX714qMb
	7aF1Z+EOs122pGLffECdoEOzNIY4sWaVb3Iqbn2rxfMZbXyQD6B+T2qWtY5dCQ==
X-Gm-Gg: AYBFou1RVTW9yQmN1D0U8bPbtSMPqjWHN+6BStNx6YPQUUMjlRX+zXxUdpCr6iMxw7E
	IoZfD3gQr+cE2fJ53J0+ZHL5Q0KwHNFATNQZKbLx4pm2iwto45S5gf6omHwydnbZczAQyrGgKVv
	7SHim39BSwQPViQgnmVEOQxkg/2tVTBBsfCs/sBdxH1jIcP0EL4+W0O2dJd7Y+ZcH+BlpDbanGS
	DskMHyIsNYd9YiVy18nd7lZXtTwIcpL1dzOzgOjvpzRgnH45xG4YQXTAYW7mrMJzciVFDeI/Yw+
	LpwtC5AY8Y50JCa6UgeAQNNMgAkVDI4noFNBYHiiWmlYYnYe3o+hqGiS7Ih+PTJli2oIoQNwyQl
	2iMIZk/K6XuKVKfnInkmC75lez1UFdkTcgNYosr3SekM2vAMiTjYUghQwMEueCdns9P7yisyO+S
	SBnch0Faw6yH3xmgAKW2gqfMnhG7trtIjsCcIg4zXlJnbhGm/QNzHJ9p9vc94b8yHMsQB7lKHM6
	DpTUQJhh8FF2wJllvRbuTDuCoX+gWplwCGCRIp9imWZlzall+Zw+whM/4+yFCJXdi+AUtuWukLp
	FDmnk01Uw4ufstiLqazbd4h4HxbARnELlbfS8oZCaBnSNqwA3h4/XC1JNlcZ2Wmfwv/f3kgTI4R
	Kpsk=
X-Received: by 2002:a5d:588a:0:b0:48c:4442:54e with SMTP id ffacd0b85a97d-4982f87455dmr967797f8f.30.1794253274651;
        Mon, 09 Nov 2026 11:41:14 -0800 (PST)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-49836b8eb11sm714822f8f.57.2026.11.09.11.41.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 11:41:14 -0800 (PST)
From: Gabor Juhos <j4g8y7@gmail.com>
Subject: [PATCH 0/7] spi: spi-qpic-snand: use generic code from the
 'qpic_common' module
Date: Mon, 09 Nov 2026 20:41:01 +0100
Message-Id: <20261109-qpic-snand-use-common-functions-v1-0-1e8601e2db84@gmail.com>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/03O0WrDMAwF0F8Jfp7Ach03ya+UPsiK3Blap7GTd
 lDy73PWwfZ4BfcevVSRHKWooXmpLI9Y4pRqwI9G8Seli0Aca1ZGG4fadDDfI0NJlEZYiwBPt9u
 UIKyJl1otgMZjF/hIKK2qK/csIX79CKfzO2eZ1wot7+OfMzS7ontj/iu1DSWmy1X4CVlovE4Mb
 LnrvT24PrTDw+yQp9934jI0lrpAJNQfWy/YsncH56xjPVp2ISAbRO2J1HnbvgFuQHtHBAEAAA=
 =
X-Change-ID: 20261028-qpic-snand-use-common-functions-12b18fc7a1e5
To: Mark Brown <broonie@kernel.org>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, 
 Sricharan Ramabadhran <quic_srichara@quicinc.com>, 
 Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
 linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3

Since commit cfae2182fa7b ("mtd: rawnand: qcom: move common code to the
'qpic_common' module"), the 'qpic_common' module provides several generic
functions which can be utilized from the 'spi-qpic-snand' driver instead
of the locally implemented code.

This series converts the driver to use the common code to reduce code
duplication.

In order to make review easier, there are separate patches for each
functions and another one for reusing the 'qcom_nandc_read_stats'
structure.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Gabor Juhos (7):
      spi: spi-qpic-snand: use the common qcom_nandc_check_flash_errors() function
      spi: spi-qpic-snand: use the common qcom_nandc_config_page_read() function
      spi: spi-qpic-snand: use the common qcom_nandc_config_page_write() function
      spi: spi-qpic-snand: use the common qcom_nandc_config_cw_write() function
      spi: spi-qpic-snand: use the common qcom_nandc_set_read_loc_first() function
      spi: spi-qpic-snand: use the common qcom_nandc_set_read_loc_last() function
      spi: spi-qpic-snand: use the common 'qcom_nandc_read_stats' structure

 drivers/spi/spi-qpic-snand.c | 137 ++++++++-----------------------------------
 1 file changed, 24 insertions(+), 113 deletions(-)
---
base-commit: 4a8faaea975be15cb636646c0d4c6ff1c2110baa
change-id: 20261028-qpic-snand-use-common-functions-12b18fc7a1e5
prerequisite-change-id: 20260922-qpic-snand-fix-singlecw-readloc-c4c89b4369f5:v2
prerequisite-patch-id: 7f8a48bccb2e3c8de950bbddacfefe052cea50b8

Best regards,
-- 
Gabor Juhos <j4g8y7@gmail.com>

