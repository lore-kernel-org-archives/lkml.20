Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793942936;
	b=VmJ/W4zgbh5Uhfpv/SBSW9Ti4a7HbY8AObbUE7Bnl6Jz2ABvcqAOK1K5hDvEa4jem/XK
	 LDkZhm69c13DoJAjPxz7tz0/7lgQWaWV101nr4y8ioLdytRpu7gbNLlsgMVFzOwCSPCMZ
	 M+3qPyqPyDR9zgkKJw7r2aofaVXtQbjcJyS/0R3nMsHrUy2jWWhQiSHv2kHm5AvES++Va
	 4vvfYsBFqEyl4fasPDtYj1f+1DS6/8khy3Gou6NQC4n1FGe7VtZWNwKVEGvMzFc9cc2yk
	 CzQNO54RXJxSr2DZgOX/rf9kHWm8phgmt7/1zviLGZ5r6T5TJ03AMVQNDfVRTtrkspg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793942936;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+1RwEVzo4=;
	b=b+tOAjb+Mw5bAVW99HeVNqXNWtqsZ09RUyoUiilBEkUhOAsrEd/TOexArRc6PXyebMbh
	 +ugKMkykkWuUM8ZHF94zjmyN622dBytVCUdbAinBRzZpqDACygsX1vV9NkQYkAHpdsdxV
	 tc28wgA+0ulS0lJrdtOy4T8DnwVoW+fTQhh4OSjNvSHr0u753wh9f68swYgCO4N77i0Vl
	 GHQehv8CGNCnOR7Zgmciy72kx7cFOMISAMtJ6BsRvzcxv/PyaTCg2WH71ujWsmuRStuui
	 1P3uh6HP5HIePlm3jxeXWxLUIMSHrGW3aELcwTtTa2sc90r+IouuDF08FoOTcL4MbEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVflznw+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyeLIgsF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DA0606A31B
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 05:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40DA0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVflznw+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GyeLIgsF
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A641LMB2473913
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 05:28:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+
	1RwEVzo4=; b=WVflznw+6zv2/im0jXwmEAoahuZz7wzaQdN39eKFWnSvDNKFNtX
	bek9DV43UfAp5fVpDyfWjuPmKMiFJLQYE6YFn/CB26Zree/1sNqzv9tCp4ZUwsXJ
	2wixA8ydE7bZxsd/zoSEoaaviaSelNbiPfqBY25HiBl1LdaxymvQN4C7zxGhGDCb
	OCDn0HHhSz11Logi734Xa6ldSgl7KWce3C305u0rQfr/cKHw5CkoldJJKDuSxoYA
	sYJH1YXsdxrEpwSaEUGSRyXWEoCeDv2NOZ1K5VLmaNcA168n/a6an/ZBPNWtMJM/
	ykAwUomWdgvG6uruS0C5ZZx3CDWH1TfRp4g==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa134b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 05:28:54 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b2fd5fba2eso2930307b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 21:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793942934; x=1794547734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+1RwEVzo4=;
        b=GyeLIgsF3MUXa7l4/CtB/t/GI4+bkOLJ/7sGOUuHB4vxtbTqeH2iYD04az0krm2vym
         ArC+u/mh6WqPHPHTDNBPIfJBLdQ7hTxrvUiFYsArjX9+Z79zhFYJkct4szicyD7Eos77
         +ykrjYfQoNKIIDkFPF6brlZmUE8DF3b+hyTMUBD2QXAFKQfQeN7JE9rTPgF3UY7mI/gT
         jpq4b1TqE3yOq63frPC8H31BGrg5sDb0CB4i4sVGIwJv5RRU/i38Nd55ScD8qgmhictK
         uXmo4tZLH2I7a1GNm8DWdmFdv3x0xrfcKh4afo47UoLPDaUmlGGXrejASAMp+GJ0luXm
         6d/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793942934; x=1794547734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNTx4etPaEhvGUcB4SmE/6iw99RDwa/608+1RwEVzo4=;
        b=cWbZ8K2ZGVeh21WbbEb66CrDDpFkQAKJPdXdzdBqzVwe5W4eFQ1GOalqNPIQ0dwEUP
         qM25X2/5VTBZUWICaQsT5Zdj0tJ3QeK2YuL8berGHp+SnJMkukB4qS5Y3eWVuFQ1pPQU
         ttBLJOea5XtPit6dLJgjG4njYymx/uqTsbKiwIlXJUI7Mx6IJqAbCbMtuHGwk3Uwd6NK
         cyeiNNwRDZ7XXhmP43SyRv1qy/9gB7S1g0wCxz68gJHLv8j/81WnTCICuD/7j19jtAO0
         IEnhnY42t9bKkx4Qp/Y9uIKUpAPHPu5vIyxYlHXHUtN7mTCIaM81QgrDNzpF4dOKivyK
         l7CA==
X-Forwarded-Encrypted: i=1; AL+hErE0D8PFpQ6Fi5+9vwKn2rajyycjTq4Tlfxkaep05+kfSVGWWxJ4MzzghjZ4nUHg9H+htsKWim/j85qPAS8=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mJ72MTVYbDiJvTLOFkiqQZPK7qo8m3hzuquNIn3ms+z+21Om/
	XllPQov1Kh48GL//KsMfbgKQQzEMa04fHJIqfVK777H5sHawk19qCb+kpYiW+jz56iQNezsEhWh
	4s3JIMSl41HUKHl5Lj5pW9zHA2Hs71EQDB40Jeu/03feKeqWmz09bFQI/ndYPTeEkv2iUXJJROK
	0=
X-Gm-Gg: AYBFou1ktWJvdOJJsKAixqG/hbNrrthzVDI6HlLdua94jitYeECbQR+fp7a2FJw8EO0
	HQx45QE982QnYx30KTzAr1n5X285UU2BYIj+30Kgw9u2EO+aFDC0MiLnEJaN8GIPbnRm3nP96Ya
	IFSpG7zzAZZoln/y9wWqo0oK1UzIf4+Px5nstnD4Aw9P95pgCiSn1/RLXuWr779j7pHQUiujoUI
	eczWMPrtt0/+YoXGzZnRruA90u+s5TGO/z/8By+ulny1I617hGDAOkvVJvvQb9fCQS5tcAH7555
	PqOgKMdKG5y4nN812BXCdzE1PlzxtLLO3za6ckBP4Eyv3qUHz/TE+4ZUEBhuMEqwPlEH8ChMWjG
	Sm7ATPiqhwibPL0FzDSZpISJNebvgisWHw7HZWEJeoJ3OIImbop+Acc4tnCfClOAQKLS+jCF7JQ
	R9v5umtN4NtEMMsx0LQ9yUrTYLyi1okz0TyA==
X-Received: by 2002:a05:690c:c114:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b3419b2f37mr6654417b3.49.1793942933588;
        Thu, 05 Nov 2026 21:28:53 -0800 (PST)
X-Received: by 2002:a05:690c:c114:b0:8ae:b617:7138 with SMTP id 00721157ae682-8b3419b2f37mr6654317b3.49.1793942933134;
        Thu, 05 Nov 2026 21:28:53 -0800 (PST)
Received: from x2e.lan (108-208-224-205.lightspeed.gnbonc.sbcglobal.net. [108.208.224.205])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b33f3c9730sm12366057b3.0.2026.11.05.21.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:28:52 -0800 (PST)
From: Tyler Baker <tyler.baker@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: shared: drop the parent check for reset-gpio devices
Date: Fri,  6 Nov 2026 00:28:50 -0500
Message-ID: <20261106052851.2741296-1-tyler.baker@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
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
X-Proofpoint-GUID: RIZ0W3uZ6C0WBvO19NRwDw0B23pngwlP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfXxXr4ZXcJL9k8
 hQHjRNlWafDMSUT2u2PnryajkgiEPy6LXM97DsS5tCWz3mu0MeSPk4ExccAWtnr8I0n8MeiitJG
 LvffI/ysd1wzp80apAEm2NyA31Xy2kMWND6Sjt147TgUqG2Ag4qX4To790FM7i5Nt+cVR/atgca
 lVPpLssOXeOByoUUhhuOieOQA/kxm6GhLmuQ8UdUl823zIaP5ROWERzWeNsBA91LoIChMa/Mpak
 XyzhjiFHhg0xhgfYvcSVV0qoHz5fEQHx2nSAksx8nWcZ3uv+Ww38BuqttqW6PyRwtJHfHdKtLgX
 mQFtKeu09lqUglSnNPxam420arpeutVssFTvuqNKapAXqBY3l50nzHS9+5SqzFvlT7JXoN+e1Gh
 phATqLZpXBQLFoC15shIgLGbJlmvBZQJR47vuwPe7klM2W6u1FMYMnWpgpqzFUtItGa/2lcckcS
 5iM61Dmq3UEX/RYAwlQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAyMSBTYWx0ZWRfX6SJdwM4kRBoH
 wH2A5/YcNp79zVxM4PNbdgL2w+ziMa4NeM+vKw0GsMAk7Gx1g4hnXPSth8SfV9eOPVsUw2xSisN
 4isPq4Gi87HuD35gwzCoFjQMkgT1YAA=
X-Proofpoint-ORIG-GUID: RIZ0W3uZ6C0WBvO19NRwDw0B23pngwlP
X-Authority-Analysis: v=2.4 cv=CaKdd7rl c=1 sm=1 tr=0 ts=6aed6596 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=PFxtTy0squD/fJwW5Be2sw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uwsICcM7I-BenEOJ4eAA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_01,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060021

gpio_shared_dev_is_reset_gpio() requires the reset-gpio device's parent
to carry the GPIO chip's fwnode. Once the reset core parents that device
to the GPIO controller instead, this fails on controllers with a
gpio_chip and fwnode per bank, so their shared reset lines are no longer
matched.

The check is redundant: only devices compatible with "reset-gpio" get
here, and their reset-gpios reference must already name the chip's
fwnode. Drop it.

Signed-off-by: Tyler Baker <tyler.baker@oss.qualcomm.com>
---
On top of Abel's "reset: gpio: Parent the reset-gpio device to the GPIO
controller":
https://lore.kernel.org/r/20261026-b4-reset-gpio-parent-to-gpio-controller-v1-1-11549e6ea930@oss.qualcomm.com

 drivers/gpio/gpiolib-shared.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 8c9ac9d933049..91d91c78fe55d 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -362,22 +362,13 @@ static bool gpio_shared_dev_is_reset_gpio(struct device *consumer,
 {
 	struct fwnode_handle *reset_fwnode = dev_fwnode(consumer);
 	struct fwnode_reference_args ref_args, aux_args;
-	struct device *parent = consumer->parent;
 	struct gpio_shared_ref *real_ref;
 	bool match;
 	int ret;
 
 	lockdep_assert_held(&ref->lock);
 
-	/* The reset-gpio device must have a parent AND a firmware node. */
-	if (!parent || !reset_fwnode)
-		return false;
-
-	/*
-	 * Parent of the reset-gpio auxiliary device is the GPIO chip whose
-	 * fwnode we stored in the entry structure.
-	 */
-	if (!device_match_fwnode(parent, entry->fwnode))
+	if (!reset_fwnode)
 		return false;
 
 	/*
-- 
2.47.3

