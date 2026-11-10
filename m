Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=34.2.82.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794346712;
	b=EOELytF0G6WaQH+CYfvxeXtT79EXuy8JDuZpfbpDhEVJNggjJli6BOMgiZu8kdYBjv2A
	 l2a22i4mWUZynEGDfDaIbrjt2Rq0sD1sv9+2w1rk9G0R9vlMtyw8waR2KM7p02U9Z7e8o
	 trMSIFjiHO1FcaPsBozpqpF60J/fJqfM6uqJUt3Yn3DkMsFshWqhQmKfBALVfOjHMNZaK
	 zEId8YgH4lLisIU5hnFko01pjqpflQzU5nb2KElYcseFlIKobjvMT+G6wZP1b1kAht3+V
	 YWIf7ELRotQawa1nHofz2GZBN0jMrICHpzYfA5z17H5xeqJ+w9drs9UpjZQ3q6SKYYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794346712;
	h=DMARC-Filter:DKIM-Signature:X-SONIC-DKIM-SIGN:X-YMail-OSG:X-Sonic-MF:
	 X-Sonic-ID:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 References;
	bh=3lfe9XJVUJqfZUNmYUWNzH3GfRtqf9Bz2S5w2J9v1J4=;
	b=Gpp56f2+Nak6CPy3sZIvMo/pRWb+Ixcpkoxi65ORj6B+Zny1Fo6+GONmeRu9UJVASr+V
	 mul3NusllA9eKFISf1vZb3JCrenDnqIn61MRtJEx8IfYfdwKmLpUinnZSRuVCZsI3Z0LK
	 MxKe+P7AF4FU+61QFqJYAg78c0xUdDoX6E6munCkrHseV3zkqVyOX0xVkrM8YMHMpc/R8
	 kyDDAfulyHMNA5szCNkilwfyt5fXwnUdHl0ccOQ69x/UeFtKGAYT6hY4eb/MG32fmoNNq
	 QmkJkPNAqmZzYKLCJcsX2KI+bWlHj7n1qgYZfEL1uL3yuEC7CQtyyZ+gVFPhgJS9Piw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=yahoo.pl;
	spf=pass smtp.mailfrom=yahoo.pl;
	dkim=pass header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=UGaDePJs;
	arc=none smtp.remote-ip=34.2.82.16
Received: from sonic.asd.mail.yahoo.com (sonic-euwe1-0017.asd.mail.yahoo.com [34.2.82.16])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492E1606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 21:38:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 492E1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yahoo.pl header.i=@yahoo.pl header.a=rsa-sha256 header.s=s2048 header.b=UGaDePJs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.pl; s=s2048; t=1794346709; bh=3lfe9XJVUJqfZUNmYUWNzH3GfRtqf9Bz2S5w2J9v1J4=; h=From:Date:Subject:To:Cc:References:From:Subject:Reply-To; b=UGaDePJs00KsuTOr3tIpzsh5+Rryq2fcaaM24As3xOr3w2cRIdLGJ+TbWdCQb7qjRaZuWl4jwWs/LrkSFsG3VxML4xPQcI8j3QgDdf2zq/+JFzytoA9MW5Bx/9W3Stf4sW1UQpncGTsXcqt+di5Ce0YsIYA17sx+XAzqJ9IDVbXoo2AyjokiH7lvVUPynKd1RFQnkcwsBtwPsN1CJE4q51xCApOf237i1pHPqTWEFdBFp1JIPPJwjEK9Y+8uHJ6zlFhOB+kDpZ3CQhe4PDv/IqMhqyT53FJ4/woDVknWOi0q3HKGemR8Dp1BasKzJ8OAIPDF/nj8N2pKA6bMcNs8nQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1794346709; bh=ddd213/xIuRaYTIRNw+4cj765E2PTX1AmQKuovn7ZSW=; h=X-Sonic-MF:From:Date:Subject:To:From:Subject; b=ZZ9ANuS7czr9vC+LjXvMWekfDvx3a+IpHwcWV633NXwLfkX9IHpTs0qce8vVis0I8RiFCkqrAudOF3cReFFZCKgz+WEGsYC8h8IVJebZWwRXUQZD+eVzKb+U/f8tIzdPYSVAp4Q7xpWDuKyENATPy1STVr8T440uNPoSUyieMzfWh/m1CJ3OJ0WoOvKyff7HfkVbDZM6ehpoXFq8+lF6CfXZDq/3INY5PVAlZjvMzm7m25GTNE5IgNGOCRNC5H9kQDlnkMKwvsYlrkpcltYo5Wl6l+kNW+M73Tr34jUpG2kxM3enCLIJB+eC0iiayvDdRVRYDMszl0PdNmQljx1aKw==
X-YMail-OSG: lLQV0pAVM1nQtL48amN6Sf3PTFLD1QK18EGj4HPMjHByvyHVv030EPVoE5y2U9P
 OGI.eGVs7_HW7W9NyRJbifUinH8mBpxHPlBHxY.Xy7iUDLgm.UA9C3zLoE0dg1M6BiAmArCgC60D
 Llr9yFnMjBPm9IJKrgKewAfGqLIYn2ruJVDgZdHrY_jnYJCV8DcayOM3jiSZV4b34nUWzbnoKUp1
 pJ9wC46HanqVVs9qKXk254DMNGQYKbE8RNS78btXbg740kmqYhqOQiweWpgvml_lwZoZpqEeJwdo
 _uC6.K2ayccPFC5bmPBdjKp5SCc7HfnP5ghHlhgrv9oXNM58qPR1miNrOgkM60RoBnOqddUGFv9K
 QAzSiqrfEAwahxopwHHTeDTpgfdNA_9KCLqZlSFRK9CR_RcL6sjptYYxYZuS5BGHzKvzv53efcmT
 Judl5_qKU3d5Mg5nybWy6_fPctqwVZERQMloSAjU8lNNUeW5JPmRA.hudGh0y8jUXC4O4mryFhaU
 FMDIB7idGKwp9o4AebVNq_yBn.X4PTUqDeXqy806a70wwap545IRaf_fRyvpphQe3QyQwWzOBz6t
 nWDJmuuVbHeF7iYPoFvpfI877w49BIOq..Gpe8eQoE36tgD78xktHkSHUXobHxBNSbDv8NKDiDpj
 oEf7ugAT0P0f3sLYPWTNPfIVZyzCGc9jtArWpDUtjZAg7n9QH0n2gB8inXSZ8Q7WACWX.KlK_dr9
 UOxddzPZt0Xw4rpOsXT1cwBIA0260eZYN5MS3zB4Vd9dlAv1Y3pTDwoKFVPFwD52X0OO8WlpF_T_
 5KifNj_fcJN7fI7N0.tVu_.DjhoVmUukz6TPiQ1F9qhgiL1dZnPzEHCpemHgxUYi0GYa_hhmvBGw
 KOwCsDnzYHsfWU0NtaJIkJXqs4nOIxDUoR1Z10Vxvj4E3rs9PMG4ZyQXXxCo3T5CiWi69Q54Zg.D
 Z9b.pYpwVrOMy.ZERpWqni43UNvJ48jSb7j9MO1Qq4eDj1y1IdckwRe05mmeOVbwwFjp_7oIwB1.
 Csx9MMYHbszjrgeL9ZFSx05qLPhzw.zECLgP..Hi9JxUjUXhGx86BFwzH6jsT6JnxvxHPS9OZHk9
 nSjsgW1JixqgnVVoKzR_OC3CeYDuhQ5P9Bk3StQdm7pLFhEK4UHE4R5Cjf7nLuuafblX7xdPfTn9
 6K_Rip4hmRvfNHdhu0bgdmUzGHuQ3_bf_5o.rDGfh7wRgvp294Ek3WFQ50an7ZQAOnL.KdQ85QAR
 yH9B9Tsg_0vZb41fxv9pMjbzCi7z5VTFc435PXBSPghWdn5ZodDInPWf6n2wTS.VLMFtCavyZw6d
 awlGZnDmomRRTC2GA2Ql1Ju1Z8NnuAsh4cvImL9Y6.sRMVD3RGAGpFD1DwZxBkXTZLMeT3wHQJOx
 rk3Efosdz5fKSLrngTW39kUYB8JkVLx2j5Mbv0eUXeDwBRzjM_dQ5Y0GA0bg9IiTsEO4FUJD81Y1
 SrUYGj8y._ki6jYWRrtX7tyeRRyLAebIebUXtkbOIiJ2aCArs4OcxaL1QQaDyELt2Lc7dFaDZ39m
 T.mrOweteyCgaxyKM6oPV62hh0kKkGk67qgu3HSj5FpnMtvBSVm_YZ5DSDW9curCCzevqIUjZbNa
 .V3OVQ.JC0tulwlgDbijoSZVCXspTzuiQ_SacAiaupBMje3OHKQRMnYchDQg8_GUWSJocSKqHDCK
 WpjsmcYhCJY0TOB0a6k3Mm_Drj_xDD2O5ZMbp202KX5l8mXDRYq6dC3gKZkMvXq7mEkvmL1sAxtE
 bNtN40H4kh7yUXnQb3sw6WCUi39H_WZ2YcUzhPcM7Pr3ONi3GvtKTvXc5BrbquGbZC_0_SbMy8WU
 G87u1C6iQbODA_MFYZuKKKr0tguk3YicOIjSik5hkjWbsO2h6d8Oxlp.mF6QY5OLwgaW88NsORGv
 t8tTmNV4a_PClYWFl05b7pB9mOwxGE2k3B.nRdVBnU_f2G2IGUhlDpnOEleYkOICE0BJ0GCCAvh7
 VMNyPxjHknNcpGEv6Ap9fC21O2ywKqc3TeAYmr7S_il.j82A-
X-Sonic-MF: <tomasz.unger@yahoo.pl>
X-Sonic-ID: dc14178d-7249-4e31-afcc-73bcccc1e5b8
Received: from sonic.gate.mail.ne1.yahoo.com by mail-asdoutdeli-p-cin-euwe1-prod-sonicconsumer-svc-103 with HTTP; Tue, 10 Nov 2026 21:38:29 +0000
Received: from dip99.lsn.ir2.yahoo.com ([87.248.99.108])
          by hello (SMTP) with SMTP ID 2a421b6be2aeaa0fde31ced0cdbc5213;
          Tue, 10 Nov 2026 21:38:26 +0000 (UTC)
From: Tomasz Unger <tomasz.unger@yahoo.pl>
Date: Tue, 10 Nov 2026 22:38:25 +0100
Subject: [PATCH] platform/raspberrypi: vchiq: Fix kernel-doc Return section
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
Message-Id: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac@yahoo.pl>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDQAxA0atI1gYmoi32KsWFZmJNC2Ob0UEQ7
 +60Xb7F/ztEMZUIt2IHk6RR55BBZQE89eEhqD4bKlddiMhh4kk/6CXhy8+MJstqAZuhb+uW/HV
 0DLl9m4y6/b737u+4Dk/h5TuD4zgB8y+JNXkAAAA=
X-Change-ID: 20261110-vchiq-dev-kdoc-return-5ba9491d7f0c
To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Tomasz Unger <tomasz.unger@yahoo.pl>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794346705; l=1419;
 i=tomasz.unger@yahoo.pl; s=20260311; h=from:subject:message-id;
 bh=U2NK5ps0z0iNnAb83TqN2kqEkdvH3JTkXiDpRRw1NEg=;
 b=qLvxmRBg++uSG7Uvc4UhIiTlIMQlQEvqzAhszBGUsyynmVkxEGVkFpmSPsCkeoZI7qjIMln6/
 m45tXNF5jdRA9m4JkqUQhc0qNukJxrolDXXudu1arbVsAhWrNtj5QuY
X-Developer-Key: i=tomasz.unger@yahoo.pl; a=ed25519;
 pk=EPPsO91uz/0J2cTQ6ol+dgxYaieEc9dKSXWUb51n46c=
References: <20261110-vchiq-dev-kdoc-return-v1-1-dac3e840bcac.ref@yahoo.pl>

scripts/kernel-doc -Wall reports that vchiq_register_chrdev() has no
description of its return value:

  Warning: drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:1341
  No description found for return value of 'vchiq_register_chrdev'

The comment does describe it, but in a free-form "Returns 0 on success
..." sentence that kernel-doc does not recognize. Convert it to a
"Return:" section.

No functional change.

Signed-off-by: Tomasz Unger <tomasz.unger@yahoo.pl>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c
index f1c9c0d4b96a..7dfeebbf34d3 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c
@@ -1336,7 +1336,7 @@ static struct miscdevice vchiq_miscdev = {
  *				device files in userspace.
  *	@parent:	The parent of the char device.
  *
- *	Returns 0 on success else returns the error code.
+ *	Return: 0 on success, or a negative error code on failure.
  */
 int vchiq_register_chrdev(struct device *parent)
 {

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261110-vchiq-dev-kdoc-return-5ba9491d7f0c

Best regards,
--  
Tomasz Unger <tomasz.unger@yahoo.pl>

