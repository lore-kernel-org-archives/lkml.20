Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794489624;
	b=1MbHtxlB3/vyNtePELYoO8l+iQFhLZNTpNNQS+dmKKRddUaaGzmcxMSaKZIOTSLUd0l6
	 jfldBps0LkQRC5JpJoid9qLVGlKK/Npb/mvG7Lozm/bi8YhycONhcr8qqqdwyXpAH9SF0
	 fyXLVPd6Rto0LP48gghvl4IWC4mm4bdQFqZJccGFGJDs9/E56J1F5b9dCMgWYGShfXlSj
	 AdNnzQkzek3ikqz7Cv5fYxNAcVMcC49UYOLzARLD4YoB49ZiazjEOkQLQ6cK2kaL0wNFj
	 wjlWcuidHuqBkdF95jcWL8d4Q4AHAqpfm6BOs8igo4kHnY4ElDgCgBkELaHgn2VVBsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794489624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
	b=m7xQljAO+dDj4AZiynEtoOPSerRsdnCIQnz1X6x+Um4fxDjTIRL/E9B+b3NhKCptsjTI
	 Y8W/J0SO2b3NTUwIJ9BpIxDRvfvab2HGVcyyRvsR077mVMWwI5fWpZtIB2l86XIsN6zET
	 PSr1bNYdovQj8ijTM0sNfK+4qSUthHphxn2KNayf/Qx9jHejnvIFK+n3yot6gRNoDzrMA
	 jiTIY2StbHAyn81fBGRZ7QL/GdRDDRFcvrfRSHumXaZ29bSx4OykcFRQutjcS4Ul3Pwl7
	 133sCeD7NcRpwzN/k9mZcQmbwdD5xqH5Z6s/TXENNT6qnDviV1Q9/5IlHlcpSJYty6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDMxJkF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuDT8Dsz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABAB606A335
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AABAB606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RTDMxJkF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YuDT8Dsz
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC99Fb34149279
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=; b=RTDMxJkF508Dh42y
	BaoG1QT6krm5io92kTIWgovSydZvkRbbYWPAylkUMdx52dharX1koMAVwtZ8+VeZ
	tTRuOg2fyUhzQwuoHPinJzOnAjKIgfZQe0eqIYiwp2LgsDb29upW5LCIcEuQwhB4
	6O5XBOmxtOjBdzSJvmmbseT34r9CvVjI7luek1oKTBU7L26D68Li2d7kHtOhi7gn
	87EbdNi97UAlPilkGjWSj+bK/8BkXN1WA6E0qQg//+AIQaZ0TzmQcSeYcBEUEEt8
	fMl79a7n4O43kEZoHcECn50f0r2uCx2VhHXdtwBAb9xy4+DPDBtGjH7RFjyD01NN
	i+qfTA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvxc63j41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 13:20:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so895155285a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 05:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794489622; x=1795094422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
        b=YuDT8DszZktF+6YImAgvTDcPerggXEmGrCWFRa1hYA/1RuPHq35dAt2d9Rx5mdhtZj
         mn8vx/vnXvj+dsHv6l+Q7dy1fx9YHfnGfvMAF/eHEKC1evUg4ScudvvCjlbYOpjuY43n
         i5BPkgqzKQG5OtmgPEDURMLIngIevLpgdrtLq6XXIMnUqQJGyGBZVMQk/xnGvQnmR9UG
         oP/3Lde5g4FnTR91hKlbrBtJnXxzYCezPStaHdCNSb9/mBhaza1kuhhGCB/aeLufFJk4
         y9VSsyLeODJKnho0uLfCZXm9F5m3NksCq7XN7/PzVa/8efqYUw3SIO2C8QpZhYDBC9j0
         5YsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794489622; x=1795094422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sOHdKOtYrE6ti1WsC9g6oDfDHzcpc2yHQ0W/WOvdgbE=;
        b=P8Sjr7ZGKj5d7w5N5V9P2peaU+iqvdcscWqhwwSMFTs6KEtcPRUJqvchD42Z3nUsko
         uGK8LP5MUDLlBIt7HjykjReGY6jzIf/ve0Z1dT1yS6ECYXoTHX0QmKvZgwIKro+mAZM1
         OfrVs1VLigliquOTEBAcSWTJ8L3pM+rljZWnIxxji7MtvlqjKSYIJyFSoE4LTbXEFklf
         0rAHUswbqJmubuqvEogKeVOacOT98XtJghIEOug1hzbRhatXpeL0nf6ckHSHH1OVv4CL
         KEwjRpGgJ22woRUalNY2FxvSZl2MizbpBdmVvvjuG92ul0rcXubodA/Zp8JjBJ8Y8V1u
         jjBQ==
X-Forwarded-Encrypted: i=1; AL+hErEmGyIghG2i4f5tFESvDwon9hu69wN3RtP7LDkH66l4E0+wjpMD5xRfreOkfT3IRyBUVHaKmpk5SiSGDvI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dzMY68owm5rYqG8qKiGEltezkoonDeVE0Z8DZWu6dtSnyeokF
	phD8ZRElprO2ohskJlS5BfD9Buq5+GO2fHyDb2QPoUC0R+fEno8HXtCVIFD+evSIVovWWHdLNAR
	HR/qMW4QK06sAJsi6dC4f9G534MDaeO8Oycv0weL/Ni+hthSvGlXVvdcJcOscfjwSEqM=
X-Gm-Gg: AYBFou2BbEp3+vwoTZKhJ9D54GtoGAPvqWcP0MLcSPsPDpX+2xk2mdKKaAyzJDGIwZ8
	0aWrUrKqAsrZ4RfdnEIf5QsDfCSbB0DtpyjyuajbYgZLLOiCMsxcYuruj6LX/vK90dFAgA1Jgk9
	SEplN+kD++JSdbfmGZe46y6UC4Ae6GCuw1VS0IMQP51qIHrrdk6dhRRkEH5EjBbXDcjdVn1ZM8Z
	VseJjhyz9yI1wnjD6VRiWgmh7jbHiALbb3opPGPxAnGGMZ73cS+eVXjiaT3lUpaSC3/gW/QW2Yn
	8oM62I6fe2l2d2p+vX8XFyWf4os5sTP7JQachD1UDa02g/anKaNY+NORfsMz+u7osnDAnyI8S16
	1VgoBXg9AIwgoj4bCJh1S35heY1/vjO7Oazk4bbb0CgR8yYcIZuE1A3M8WEOx6XzJGLMZAX90rV
	LkFFI9KR73ujbtPlqcXFEkzf55zz3Y8kzMiVz0dxJfAj/D9yZZu4PkwgFHQlNuhzM=
X-Received: by 2002:a05:620a:8018:b0:93f:4921:6965 with SMTP id af79cd13be357-947b00b3c2amr815414885a.61.1794489621859;
        Thu, 12 Nov 2026 05:20:21 -0800 (PST)
X-Received: by 2002:a05:620a:8018:b0:93f:4921:6965 with SMTP id af79cd13be357-947b00b3c2amr815410785a.61.1794489621347;
        Thu, 12 Nov 2026 05:20:21 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498369a495csm16744366f8f.55.2026.11.12.05.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:20:17 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 14:20:08 +0100
Subject: [PATCH v12 1/2] crypto: qce - Only register algos if the user
 really wants it
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
Message-Id: <20261112-qce-fixes-broken-label-v12-1-7b5b9c7083ed@oss.qualcomm.com>
References: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fixes-broken-label-v12-0-7b5b9c7083ed@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Russell King <linux@armlinux.org.uk>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Birk Skyum <birk.skyum@pm.me>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2262;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uNWdf7JMTPD50Oq4Q34RGGw6aCVGFgeAIRGofUpNzcU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9b0JlqMlRyBVpFc0kBTJiSqRQUy68ErqMNtxR
 wWCrVcf9EuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavW9CQAKCRAFnS7L/zaE
 w6arEACorZuR3+d3VjlfFgy8L0TymbxxLQjd/fjA019WVhb2ONi1ho9cV/b7XiBgidpiNufnH67
 bvQBcnu867YgJe1vsh4hc0DBLnCufY66fk5SePylcV6oAirKwoHY4/kG9KpnhDj1oTOwnA4IFhs
 K/fzmC9PoPAN51Xa7rg+oltR/p5rp5uqBBnOyZvd+ZsEVnFvfA/zIMcHzXs3wdgCsI/nTMWzGS9
 leSaSR5m6f89F/pUDDl0oO6jjKrFhTG1CbGwkgAmTRo7nfuG2cqMoh2i3iGY8iEL+EkmbH2WAG/
 /Dp9ffP3b07xP8jHS0FHDOqFLvsaVc6nGKWkhxhsVQU4lLzTwn1AT7sNUlgKROfI/tZ7iD+3VFD
 sSR8klidK+ywgzSP5dyUzOvkjMOmRirQbYT0rlaSCe8HhWDSRz9rt5eGEQIP+NbZCV8IjgMIm2q
 6vU5KKIpbQweuGP1PPQDMAjlFWLQpxwftmSUB+Q65KwaUjX7lov0hO04rtNkrq0Krwvch2sUVXN
 9Kshp07fgmVrz/O6dujFwyfGJPie48+kMzD6rzGOIRGaqZ10xc7YW12IUooa6SZScHdaIOtAM01
 YBUOiwoWw4Va1FwqOYSVkGCHvLGUfLs291wqvCDlt05OFwrWugQfTiflKAHs4wEDFDTv/ZmgDFU
 0ThVkge3KjgRyYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: -oufEzbOLIYD4UHBnBan319v-nRdtAEy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfXzu8N8d8xJc7Z
 EbDp3rZoW+T8VEXh6UWj4/hhFn2o8Grm1E/9uZjaBKfhwcekoBMwWIt5dEdPnc03ztq2QypxG2t
 brHj3mFOMyjeZyGz0nKjf0JPT3llT31SkrC21VtYH4nhPkDNs6feC9lsfY2G34jqbPPKF/fWIpn
 l3Wb4YRAT3N+3zR0C9auD7/KIHKon0Q0EQE9ibvD48nNE0wKlrwTk3wKSu/4gVpInlsHVpzLxgG
 oKg3jsp2wOL515+wlF42/5G3meWU/azbCHEdJtdIu4U8eFfEakd0cbLdERrRW8/0oGIrTFlQRvI
 zDraL9WMzbZkfedcGx3obFLnZqejEii8g00DrNsokyO8env5AHbEb2x6uUxdCbOIolyjfWH/Z5Q
 9LdrmUQ8N6BVTkjDjr1WvKhiqh5/GjWYISTRe3zPf2n5ZJBA7B8si5H/CzSvSiy5bZdlnmVRaN7
 rHIxeWVNxFjIDDQ8j+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MyBTYWx0ZWRfXwCYufE8HtJRn
 sytiI7Y/kbxD4/jbjfhWk8/idhKvBRLEenstY4oqpzSXoybC1JuaknMoiSDL6d4TRdccfUyPBF7
 +RV5/RLA4qUpZqdZR1zNm5qcC+mhzcc=
X-Proofpoint-GUID: -oufEzbOLIYD4UHBnBan319v-nRdtAEy
X-Authority-Analysis: v=2.4 cv=O/ysLx9W c=1 sm=1 tr=0 ts=6af5bd16 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=XywcRVADl8Xu_msC9vwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120053

This driver's crypto algorithms still have a few issues that need
addressing which don't currently trigger any self-test failures. For
that reason: don't register the algorithms unless the user really wants
it.

Add a module parameter to the QCE driver that by default causes the
driver to *not* register the crypto algorithms. It will only be one if
the user explicitly passes the do_register_algos argument as true.

The power-management part of the driver is kept as is to allow scaling
down of interconnects gating of clocks by runtime PM.

Cc: stable@vger.kernel.org
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Tested-by: Birk Skyum <birk.skyum@pm.me> # X1E80100, Lenovo Yoga Slim 7x
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/crypto/qce/core.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/crypto/qce/core.c b/drivers/crypto/qce/core.c
index a009c791417b707c5d4e98fc30111863dd8809fa..ddb4df3d227f801e566422491b488c5fcb777717 100644
--- a/drivers/crypto/qce/core.c
+++ b/drivers/crypto/qce/core.c
@@ -10,6 +10,7 @@
 #include <linux/interconnect.h>
 #include <linux/interrupt.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
@@ -22,6 +23,10 @@
 #include "sha.h"
 #include "aead.h"
 
+static bool do_register_algos;
+module_param(do_register_algos, bool, 0444);
+MODULE_PARM_DESC(do_register_algos, "Enable registering the crypto algorithms.");
+
 #define QCE_QUEUE_LENGTH	1
 
 #define QCE_DEFAULT_MEM_BANDWIDTH	393600
@@ -259,9 +264,11 @@ static int qce_crypto_probe(struct platform_device *pdev)
 	qce->async_req_enqueue = qce_async_request_enqueue;
 	qce->async_req_done = qce_async_request_done;
 
-	ret = devm_qce_register_algs(qce);
-	if (ret)
-		return ret;
+	if (do_register_algos) {
+		ret = devm_qce_register_algs(qce);
+		if (ret)
+			return ret;
+	}
 
 	/* Configure autosuspend after successful init */
 	pm_runtime_set_autosuspend_delay(dev, 100);

-- 
2.47.3

