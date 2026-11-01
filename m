Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=67.231.145.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793502020;
	b=dwS0Gcj0k62yHHqY4q5B9SmeA5VKWsA34tE1U70kDCb2Zf7dB8FxUTRzYT7tpH0kMNke
	 dDNAd6K5ajnTKCdF6EdCuikmT6tY5V7FaU5gTk09LlyZ9dIxzuWmUFQBmdsuzNjohvKcp
	 kjrDEyUm0oXKPPWsne0aRv21dD9dwLQvxXfMsUMdjs1qDK4IJwwVlcMoTZunoiiFMp7vr
	 cTpa+zisEGUomBtFrGPHf9EyDrs2hNbstP2FTHgfAhj/X4kJik1W+5Qs9V8z29/1Wpv/l
	 hiFdRzQIHmunLGU54sfnPE+19HlWTnpJFzPNRgBG8Ik5fg++VGnodxozBFSYm+RE2mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793502020;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:X-FB-Internal:Content-Type:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version;
	bh=+7tqArStNBb6UzWOhpgCNro6Nr4m1kw0/PjhJKGYy3U=;
	b=qW/XpsKO/tEfF49Lc9e38J30SezznVLXf3qnQk/Q7JF/oy8GHRk1VNuOxWZ1NSM1i53T
	 P+DQ8bq0tdZHhRQa6pRQYFkak3f5/x5Pap5AgiBsneCww8N3ZurbjqoJVcirD7YckvSFC
	 FxmsHIGEYqxD8sX/sX3xWpMbTC7jwF2W/lGjg7WisnRM+oxbomviZ3NeFFVorq1jxUEbd
	 avJ65xqFzjAOwVCjMLq5LqoAhppp64G+GUwtBXgIyGxWS77cV3QCb+sjUuPfCbijw7nAf
	 /6WkLZ4P8o17k+JtoioQSqsNy+Bn6eLT7s8vTb5HfUBl1DBppPrDuWBCBxOQwJeSWtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=meta.com;
	spf=pass smtp.mailfrom=meta.com;
	dkim=pass header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=W9cvOe1S;
	arc=none smtp.remote-ip=67.231.145.42
Received: from mx0a-00082601.pphosted.com (mx0a-00082601.pphosted.com [67.231.145.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86568606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 03:00:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86568606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=meta.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=meta.com header.i=@meta.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=W9cvOe1S
Received: from pps.filterd (m0528008.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A12ma792898495
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:00:19 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meta.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=+7tqArStNBb6UzWOhpgCNro6Nr4m1kw0/PjhJ
	KGYy3U=; b=W9cvOe1SMaIvNcvf7RfKbQOs/stp++R8dHDRsAj+aPqtErtPzNJ86
	cDIt7TsSfEZh5Rbb+wIlosutUtbS/ipiN8g/AC0MzF/o0gpKiXMoEuQ81I86VHO8
	AS6Asa5odsJcnL5cIA1gUsEzZwHuzLm+r+6ounuJeLW7WZK9PrWUI8d3BI1CDHds
	ztRvMvX7cGK5NU/rPzr2EFubZUo2Lm/JK57zb0Td+uBysyn2N2fU7p3SkKS6HFT/
	JzyfTsh18chx9aizem1PKKoRCnjp3XmzaH/SO4Nc8nUq+SX4Bew3mYXYxnZUNNUU
	rWK+HMlRkwXJXBLq2lHalpgmZgQw/RuJw==
Received: from maileast.thefacebook.com ([163.114.135.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 4hn2wddpfq-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 20:00:18 -0700 (PDT)
Received: from twshared119346.16.frc2.facebook.com (2620:10d:c0a8:1b::30) by
 mail.thefacebook.com (2620:10d:c0a9:6f::237c) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.56; Sun, 1 Nov 2026 03:00:10 +0000
Received: by devvm18200.frc0.facebook.com (Postfix, from userid 352338)
	id 8E6ED6E47EF20; Sat, 31 Oct 2026 19:59:57 -0700 (PDT)
From: Murat Seker <muratseker@meta.com>
To: <muratseker@meta.com>
CC: <amit@kernel.org>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>,
        <linux-kernel@vger.kernel.org>, <rusty@rustcorp.com.au>,
        <virtualization@lists.linux.dev>
Subject: Re: [PATCH] virtio_console: add console port to list before hvc_alloc()
Date: Sat, 31 Oct 2026 19:59:55 -0700
Message-ID: <20261101025955.3870851-1-muratseker@meta.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261101022435.3466820-1-muratseker@meta.com>
References: <20261101022435.3466820-1-muratseker@meta.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-GUID: JsJ4_t4q_Ic8-Vmswas-ebw4bibyNikg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDAxMSBTYWx0ZWRfX5F1Lsn/Zecce
 XSTnq77wSLdel0adgvVojiqD/zeNHxvYPGOe2cfb6vgFQmCMrRmW/h/+O0lC+roNu7iO4EFARqV
 Y+HamuIatAt7Z+34bNFu1edpsKUveB8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDAxMSBTYWx0ZWRfX3LzwgwBvyNBq
 0EGHFwJVgBdcR8gCx0DTfNTNyyyye2x1O4HYXFL8upv2NT8t4VQ3q68uitc7OpgGYZDlDX/QES0
 VFRmY0qIDdCkjuErucp+JVcsXuEdIPvYBBCijOKtBQBDkg5dl4zqExP+UhNcaSpW6RMWF/0rgoR
 R2/SEF1AWwa1avL1NWO+O30JILFMFdJE1OMmRa/5idw88tWzW7/6qYeIkj18kBfjHV/IGTmWYd7
 kNCuw8kcURW00juIIzu4dDy+KkFYLh3t1daSnipAzJke15a5DHNrk3NgEiijFNE66szfnN8fpVa
 LPmQ97H1gIDd0jcjbDO7f9UeNYPVYcMcSORmwNQhirNInGnesGVTZ2cPajSkMVBeWqEvG6z4Kzg
 Q6Lqq6e+H7l9vhZuYwY9zvXr1Xr893yxpMKp0r2mVM7VjnJi7F+q57WPGejTaq/3Q/awrJWBawM
 +p3fD+wv+L6l+kzrjrA==
X-Authority-Analysis: v=2.4 cv=U+MHnuru c=1 sm=1 tr=0 ts=6ae6ab42 cx=c_pps
 a=MfjaFnPeirRr97d5FC5oHw==:117 a=MfjaFnPeirRr97d5FC5oHw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_1IyUuN4QrATX339ibzo:22 a=jLPmfgFi0iO_3v1wpOMA:9 a=QYH75iMubAgA:10
X-Proofpoint-ORIG-GUID: JsJ4_t4q_Ic8-Vmswas-ebw4bibyNikg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_01,2026-10-21_02,2025-10-01_01

On Sat, 31 Oct 2026 19:24:35 -0700, Murat Seker wrote:
> Subject: [PATCH] virtio_console: add console port to list before hvc_al=
loc()

Please disregard this patch. I'll send a different fix.

Sorry for the noise.
Murat Seker
