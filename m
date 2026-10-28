Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793176383;
	b=sb+MTcyg9pWNglPzdsb/mmjKGWhpdECg0YzRIlaGj/P7gVJ1pY4E/V/DREyyWT5jDMOX
	 8qQKOOCLooZPKRjHMfhl/femhj8glxPd+PJ8QuIWwj3Rx+rJBIyMpzfvedwIsF702u3qi
	 1YjnVPbZNvXJBYFNVY3GSwnooRcuWzVZSA2zeBekWNuIo3UiMnp+tzIDj94Aaq80GFBMU
	 iy93nO/TJ7r/jg//5rcX9s0vRXVnQL6z6EEqp/p4l34bDXdx+35yfF09Y+fdWQ0JEV8RQ
	 im9qi1Mg8z6P1zXyNKOhGfg+HRhh533VE6ZkA4/UhsqEjfCsuOOm4lf1bqrAs/DpnTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793176383;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=;
	b=q6W9q0MPpFexaF9EFU2+nmRZUnEbTqoSRIeOlE9yFqF/fSHorX5A2Slp1auIM3z39PBV
	 dLb7LmRZVu3eRTYq+0niBrFaNTNqBeaLbYLsEAGeSvIlWlMAOdznuUdoIuA8QYUCnYrDi
	 VghGtFQM4piZkE+EawppL45FxY7ojYTksavKdgQdTfAg+kY8ly0BeAAL3mnmXUVpL1Y1e
	 QrLgQ377ZNkck85hIEOR/jpiXEecZ5KN3CP2YB269RMDtFffFl/eFt+xax0IBWtsxUTH9
	 jPgRnDcrib2NY1FHRZhFm00CHUDcfQ9rPRAezv6v+tXL1xS7emWwg8GGOraUkoTZZVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncNLjPbz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdI+rD4C;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C2B606A324
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84C2B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ncNLjPbz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BdI+rD4C
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K3wl612732
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=; b=ncNLjPbza6dr0wlH
	kv+T1dd64Cp/ETy3h6mex1da3RFmHlVvC+c4BkrCMyWSmngCaJ0CJGppMrAe9WkK
	DFxxrNDKjpi6EIfLjqLFg1LXF5kCGUF48rTx0xYWCOL/wL+tA7TrDWsLkz4SVu0H
	ZVpSFK2eBzGqL7vi8apNaEf3LYn9J3mnA9DZSkH7ih5pGdxsETApuvD5syDNh5oF
	JoQjNZptJoRvG4Wfive5zwnJTRjcYH4XCfTgYBVRKqFEjv9eHQ45BwKTQK0KGRhb
	iwDeeDPwNvcs9tVaYKA3POYeUgdwnXRF861eg+4EtEs8vjMaczppJQbjLv6bBnO9
	a5GlYg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkbhw8g23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:33:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-537548d4bc0so10227571cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 01:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793176382; x=1793781182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=;
        b=BdI+rD4CnSj+6tFiT9MyilSYZLen1oheUtqTZrXzeihwrhKp4PXjhFC1XU+B/Nfc/t
         nkzi44RwLR7b+MMQypgPYZvuqI5uVq1fGYMSkMeyd+TR1e0Bir7jJD7E72tr5YfcqziL
         xyQTgGXiGPTWjQEd84va+RR5MhnpgueSiUI9BE9hadMpUrOD08XzEoC9TqLk42sZVoW/
         V+Pe8P+66LGMtBxXTnpvQYW4eET6gCtWgnHxOBPRmbEWQPb81oqH0yzReEX73C9eXhKn
         UiHSMjDsz1Wrl2DLCZnJToyjvTItcUMLq2YR2XuQcrS7fIC+pasPZWyx4awGTxXvjng1
         sBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793176382; x=1793781182;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3g7lLq5xhPax1nntmOLGNg2Dkzd08UjGGHsD4/hgZN0=;
        b=fFGt4K+9cnsUed5tfL/SMzv8W1lBOINdXQeRRcgYDzUP+BHF/BnZZtjUKYim2LG0bf
         +IvRa4innuDLTlrE5FgloBC/DgUKcQKOwFiPgCVd8NjNEFessbm2scqvSyB6Jb/nB66u
         focDbzsoYv5K+OULvodeiFDnEeAxctAH+a/NClqfmW1jGfhkcZJhnXoe6eyqELOwy2mN
         Yn4H8hHWwnSGyRElih35Q1Zf3FBEdmYR4tDrYaUtEYmfNGUTLy6iUnLhAOvRd2yDH2Ul
         OwsCW5sUxczy2YdKE22k4OVbGxBSlm9EYc2I5VhOBfBlxwfFnPgQUJDH3/HxKgxXAZpc
         0+zg==
X-Forwarded-Encrypted: i=1; AKwUvBylJNS0DClrYGENcpzM8SGEa1OD+/lYCWCSeOaoBO2r+8OW0DQtQ7SS2bR2juZ++p8nGhZswSac6KaPW50=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvx3ge46oMaDAko25uFIvXLzU2Wj8vNIXu9O3k1/V83lDN1K2K
	if/0T6cLsKSlc9+3XyVhm9KyVla2xdTFROmSx0TJRDJhFMlaQXiyxtcJpPYst8m0jWFwTTk+xmN
	EoUyPXBnly64MH8Dw7nvRGhVmcRqpe18Qiw0WmRJwrDtHugR98F+ug5mSnDwO/hjZVZA=
X-Gm-Gg: AYBFou3VcyU2xOuxBV/xXDbyFlXB6U2uwJKyCzGdin1itp48b+1qZ3l37/6z2GOUZ3d
	eiRgscyjDb1LGhMsXvogP1a5AKmT47JqOnuyUGjQWk/+VXAVV6ujTnr6wlzTc/VEXduCPpAQBsJ
	4j+P4MZeQRlWtZe7dnlakD8wqERjnHeddl0rHnoOFIz4vJ5r/CglceeR+6oqODrl+Yt9LTU4ijr
	BNO/+c7UBmEsgHUTyuBZWHc2bVUsSO7jHfvD4nM2gxbtTI/Qk1/VQEy5QuxbPupqvRF9EcJ3gti
	syNjSyT2elSmyVKw1JqU7APqKNFApY6G+avntziwQMQiyDTc/ihxRmAQgUcCL+PUNBxila5eXWI
	gGtbKorLpKPqMUmPqhtGqruGazXdJh4C3II+yugZh6DQniT2vMtcgl90oWHurAja0EanXMg4Jgf
	Cq
X-Received: by 2002:a05:620a:4505:b0:943:f3d6:8e89 with SMTP id af79cd13be357-94408a80e9emr210398985a.28.1793176381678;
        Wed, 28 Oct 2026 01:33:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4505:b0:943:f3d6:8e89 with SMTP id af79cd13be357-94408a80e9emr210396985a.28.1793176381246;
        Wed, 28 Oct 2026 01:33:01 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3a1csm27503404f8f.16.2026.10.28.01.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 01:33:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sysfs: use const APIs for legacy sysfs attributes
Date: Wed, 28 Oct 2026 09:32:54 +0100
Message-ID: <179317637228.6922.14855638693910064261.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
References: <20261021-gpio-sysfs-const-v1-1-3d89ac247086@oss.qualcomm.com>
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
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: BvhXcGO47QxA7AhCL-8na2pm94fAb2qc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfXx6g1C+jJ/FbA
 TkI2p/7SqDudVQyUjfC6R+op9oEgNOHfVWCX0JU5sFQUjIsQh/iG1feuYOQnxCB6B2i1GozvcpO
 bPca1391dKMzMJenrzfD5sKdY8dSJrs=
X-Authority-Analysis: v=2.4 cv=V+joQuni c=1 sm=1 tr=0 ts=6ae1b33e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=C0EIza42l-ixwskntg8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: BvhXcGO47QxA7AhCL-8na2pm94fAb2qc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX4wIa7N13bg1W
 Wbvxx0wgv6sGSizLCmuT1kByT6TaW3Gww8rO8whdiLYg2ZtLrIUViiJ0TnnS/Dwt+VTrm0bFoXq
 cOo9v7Pb8YHtu7NdsyuAmYjEmG8tu2lZf+u/CcwamGcrXNQ4EGR13MRBuSDXoEZpVAE3XkYgYsv
 qMhPVpX+Pdu91bJ8uApWRhWhVT/MfGwok9UJ0fy2B+VXyIdSrEcGYl2c099zwGrWBEhg32raPul
 rxbE5M0nRknUuvciY/aYMcONdg/QILItZq0OwYkkpP287WyUihkax2Izbn/6WL0repjlKiN1JW0
 L4yqvyLx1vHN8pUCn2AahzZ+nKwWZnqP0bx+kdN2FP3BUESv+iIBjbE3QhILE2mWzq50XaAVXg1
 DSF+Q5AaexovR095c/S2sEPfSoZk+n8aZl+XS9F5fcUDb7GvX91u04uhc6q9q42h4Rklnh9dr+L
 V/deqZ7VJJm41377Flw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033


On Wed, 21 Oct 2026 12:47:25 +0200, Bartosz Golaszewski wrote:
> Replace the deprecated non-const sysfs attribute APIs with modern const
> variants where applicable. This leaves out the attributes embedded in
> struct gpiod_data as this structure contains fields that are modified at
> run-time.
> 
> 

Applied, thanks!

[1/1] gpio: sysfs: use const APIs for legacy sysfs attributes
      https://git.kernel.org/brgl/c/7607a865e435066087b94a42fef065756ca91ea2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
