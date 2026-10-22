Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792636541;
	b=fWyDmMX4hHdc7xT/XrDwo3ChyZrX0/8jfM9Qvj8gZ3GCE/Wq9H9isMBSivMBx8yNuu3H
	 uHze5PztZ0ocSQBqz0kfD2oXy5s7Jk3yrl9L03C/CVlpYk8xcuvwomEHXBaR1Fwv3SspY
	 jZ45oWXD5iqlplDMj4lV9W4aaQ8kAMF96vdHgZ+BhzxuuNt3aieJKd64V9bySSPamjI56
	 5Fw11GrfzevKWz9vI2NWCPIq+HMiHmsmaGF2r9w2aRZk5KOMbjXS1UWiUNBNpq63Jpm2H
	 veujQESB4ANXVrTj3TmH2rnA8YaJsvwSGG6+3ZTSAZnDaCiIh4FmtpQK8UR2unCSAsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792636541;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTrlEemvdT8=;
	b=nRFOpTlje6mhTOmAffBdPweNVFXyVtDeWPN7AufzwBupGchr4l71N5ECLVLC+hR2zqhM
	 yhvX+M4wRj9q9+Cm4yR1jMG1E/Mwy/xW/Yd9D31g5svlvj+8k4yic67siIQ5m3oDE8Q5A
	 IUcIcpOIQYJiO3fEa+2a+DnojSDmSiyozrk6GcBNgNuwg8YmtovLi7mdx0XnklQAlTKks
	 ymOzo7BsjFaydJaRzLNh1UkK4p+TyHHaLIDZTX/tVwyEU9VtjZ5RCdcpL/TAfOzh5Tg8q
	 BaSAWktvNRjM2KeIEGdBVueuslHdeOfpqQgV2cn5kLMfpgYAZfyPDQHcIa7US78xM6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QImXKpdC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoagpPVH;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BC1606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4BC1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QImXKpdC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LoagpPVH
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1iR6f1303336
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTr
	lEemvdT8=; b=QImXKpdCrXGRkby/CbBI+KGvwR3+OwrAqV3tQTc0WwvTDuK1mtx
	bs7yZk8X7crznyMYlwX6DVULxm8mOJfNJLz7RmJ3LBCksK+KweXyDVbhzLrrTHyu
	eYVOA8OYF5IFDPOonEMA89Zp8xS98EjS2jxPpTkCixBCl3e7wPsijPuVOOCdzeuH
	UZSZ7EKsEw/jND4wHfyyxN/zail/Oyy9n2fA4R47/86CXcrIrlGfg4Uj1LUBJp+u
	ol4QrBPwHI95XqV2VzXUF8vczV3xdBURclzvchpYnuNawEQ6843Nk0UluHUGicOg
	DV0OObVCcc3RvQK/ULLGg2P59u1r/XQ6fgg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bra1j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 02:35:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ad98380ccfso1316222a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 19:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792636538; x=1793241338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTrlEemvdT8=;
        b=LoagpPVHbQEtuYoF6gG09z0hAqAAWgV1xjoLdIc7xpd5kAYek5I7n8BMyZkf1vT/IT
         52PT29VbPXQi0fVqGkNxf+sy+mnQDJbcEMynjmfba9+jfL1PY4/gulsW6Snmv4+pBF9Z
         XTx5B6aUcJV30EkW7/FLVU+rHCgrjz5SWvIDfn5VmNlqq7t6w8zHCGX3AVwurwclEogl
         HtLi2Nnh4zY0q/zXogijHPmgAnboyKyj+vtrR+4p/DJwof79e5Hy+mlCcqFdSwlji8yR
         lJ4ADloqe87MvioA0jCUoSJzqcUOg5WsEoxqF4vrPJETlF6u++1cpvJxJZTQrF4fltXB
         K3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636538; x=1793241338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wO2JUr/7Oi69Jsq+qOpX+DQVSRoBTZ6KKTrlEemvdT8=;
        b=20QQLNYLbJBgbsQ+OWWOMGfgDIhBxhjJFquBV+yoHgWBNWUO909r4Phfnspbii5XAd
         0LQAsEC30PVKzKnwST1Ob12tFVf0oAkxnvlPEC0W2sHPSSYFw5IlUwqCbIUeWAdPlt3w
         NdEFgy7VGA7wSp0oRN7NkeSd1FPK22eV8ec+suWd7pmizJJeCWkLvOoteHxQGbB8OfX+
         lhkk6rECbCBARyDFCS+z9QYnRI5Wkn+Lb+UR5sZSYyJez70gAmbMlPQ0O/bWe188m+Mu
         pC79uE7p/VPpMqoQ8NUHquPWF/RjZm7WrbKguNKJvKQ9wJNAiNrTAYQgGdPyHk6Y5ObG
         K6Jw==
X-Forwarded-Encrypted: i=1; AKwUvBzg7KM7ICY3hVvUWS+EIPJ+2O4hEfqp/s52I9IrAu6eb0jq8c6LcBFF0si8z3CZO1tujgkPyPmsoa7BVhg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkecb1sEjUb6xEFoN+7AwGJhqdKWxZxs1m3PZERY02EmJY5Svj
	URCYTPmueOq7NhQJhVJF0Cpn54fdAy4q4aRBG7o3nnZxHcPg6LXFw7v66NWpW74QJ7Z862XJnbi
	e5u3SMfss6dtUf3EbkL2sjxg0p7zr9TiH0buq2/M8/od58zyE5z2fDkvdxqbwvUeFtGk=
X-Gm-Gg: AYBFou0WC0MejRWFEGLKmxbFWu3Jocb4EAKAHs8rnQ28spkAnNXpnERMGjE8YRN46aG
	AIRT9xwKy/PMSp4/bEW2CYGz0oqG0zkqbgCIaHLuc5UEqpUiGzXmdqc04SE2MA29m9uQ7xki/J2
	aGittlPB7epy2AkuqR2TaINJJeA86IdeYs7BM5dLWCJoBmJDGDjbkbCiDxNX0/8u90NvNmwktUb
	KvidcuIJwUZLZNoQClE24lACjvJNg42mpq7wwQfLpKYaCW0qClfhAYQ7q4YFYDEV45NDVXH6PrZ
	gPb3h17ZGUTcPbiSroCDMkzH3z0lA7qk6cPPWYpQFhYYAYcxxhC3hQT0uE9hG3gm0HVcQz2aBbp
	d0Oxef1IVzywT8Z3Z+OCEoLueBKyK6whyZsg1LUiZwCNnZl/jMY9rO60Dj0xPzWDr/e8oqZgU
X-Received: by 2002:a17:90b:53cb:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ad870a3362mr3274113a91.59.1792636538446;
        Wed, 21 Oct 2026 19:35:38 -0700 (PDT)
X-Received: by 2002:a17:90b:53cb:b0:3ab:884b:65b4 with SMTP id 98e67ed59e1d1-3ad870a3362mr3274086a91.59.1792636537687;
        Wed, 21 Oct 2026 19:35:37 -0700 (PDT)
Received: from QCOM-SocCW5bzXR.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada488550esm1959935a91.3.2026.10.21.19.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 19:35:37 -0700 (PDT)
From: Jianping Li <jianping.li@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Jianping Li <jianping.li@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Escande <thierry.escande@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com
Subject: [PATCH v2 0/2] misc: fastrpc: fix UAF and Oops around SSR teardown
Date: Thu, 22 Oct 2026 10:35:29 +0800
Message-Id: <20261022023531.465-1-jianping.li@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 6bb2FPNgnOYMf5lKQSiVf6ujlsB5_2M2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX06I4cyIPGxah
 rKt1qtpDy37QuJbR29ONcL5R0s5X0qLw97eM94FmVKUD2LvQ5SvtInm/ilY6XUJsBJlmdRlcxQ6
 eJrO26Wp0m/Q8kirnH8AUhP7GACAJJ8=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ad9767b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=BpxS1hBXepmEKCCl2oUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: 6bb2FPNgnOYMf5lKQSiVf6ujlsB5_2M2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAxMCBTYWx0ZWRfX9w82VigdinWb
 5Jw/baZdU8JBHOvMgILnuOqQyWEDgSjZTLnG6CHGjhu3wgWV9taBeNihVmr65KjBXAPmbeldgZd
 2Y4idqZ47TcTNPholIQv9uUu+Zo85+DppiZ4+sIStst4KO6gwnizk/o83uZ5x06N/8iJotkmCcl
 DZpexsQtU5DyVMQds4/2yWRR765zVexD1/Prbymg9+zdRPMdB9Y29wQot4BSTWdfj/ahWxWjuOu
 uiKoZmwW6OPdA3Ym2rQsgwwRN9jT40r+eNs01qhsn75f93nUNE/dEiZ5dtqrop7ZNsqYSi4fPRB
 GRITz/jEs84nwoaenqHHL/5Sa/2BzKpp+kSvBdr4bIuU8HG+OHqOJrpXOn5usjkWGLCypmzMM/Q
 sAAPN+nWZPS6AY12l6KNrVi448ZZGYcQhJp+Wuqd3/WVanVzq8ihyPhg4VOqzcVeaN+IEUW/Inx
 OaWGA5ZGao4kVjcD0/A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220010

On Hamoa (X1E80100) IoT EVK the ADSP can restart repeatedly, and every
restart has a chance of taking the kernel down with it:

  Unable to handle kernel paging request at virtual address fffffdffc1ffffc0
  Internal error: Oops: 0000000096000006
  CPU: 5 UID: 0 PID: 2766 Comm: adsprpcd
  pc : ___free_pages+0x24/0xe0
  Call trace:
    ___free_pages
    __free_pages
    __dma_direct_free_pages
    dma_direct_free
    dma_free_attrs
    fastrpc_context_free [fastrpc]
    fastrpc_internal_invoke [fastrpc]
    fastrpc_device_ioctl [fastrpc]

The faulting address decodes to a struct page for a PFN that has no
vmemmap backing. It comes from dma_free_coherent() being called against
a qcom,fastrpc-compute-cb device that of_platform_depopulate() has
already unbound: with the IOMMU torn down, the call falls through to
dma_direct_free(), which takes the buffer's IOVA for a physical address
and hands the resulting page to the page allocator.

fastrpc_rpmsg_remove() wakes every pending invoke with -EPIPE and then
immediately depopulates the context banks, with no synchronisation in
between, so woken threads race the teardown on their way to
fastrpc_context_free().
The series is ordered so each patch stands on its own:

  1/2 makes fastrpc_notify_users() wake poll-mode waiters, which today
      keep spinning on a buffer the teardown is about to reclaim.

  2/2 counts in-flight invokes and drains them before touching any
      channel resource.

Jianping Li (2):
  misc: fastrpc: wake poll-mode waiters on SSR
  misc: fastrpc: drain in-flight invokes before tearing down context
    banks

 drivers/misc/fastrpc.c | 61 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

-- 
2.43.0

