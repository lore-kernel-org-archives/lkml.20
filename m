Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CA1392C5A
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789057939; cv=none; b=FMOfOZuvhIjnBwAP+E9lQ1EzWS5UcCWURMPFbisjTaNkB8xL4iTtX9wRjk7jWD0opWrgJxC/q5Uq/noGD4KfLGuKGqbUpWj2A7PH+DuW+Eg67Nn7ekq9EbYZO3UXY8fs2iCnaErlV+Sw8zN7pvKPGZNbcXXdfNt4/S7M+/lR//Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789057939; c=relaxed/simple;
	bh=/P1Jv0DF4UzkIT1u26XRyNwrpVHhc0h6XCRRh+gwWEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ps7Nqy8k73gOLf/LAEWrXyr2YL+s9pQrFuU2lQUvVFl3uEp4ci81Ek/PzWAeG28OmsB+5rN697VKgzA6AU80X5ANMZ6iRDbMMcLI09Yj1MbMckbtWg93nqOd/SUPTxe+45x4dk9MBy+A5z68Jfs35gm1WTpsH+iVaKNv1WDzTYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/HhQ0aA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MoyhswqR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/HhQ0aA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MoyhswqR"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4Xep107128
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/P1Jv0DF4UzkIT1u26XRyNwr
	pVHhc0h6XCRRh+gwWEc=; b=Y/HhQ0aAM6DG5jxxIQCHpQpK9SwwKxlFyT+eq+7C
	6DURNVHIO4zTHjNc6u+3t6m2WBGNmcPSfmheDoyBAHm6Bf7nLyERpuqfjg85yjat
	kJdrJQcC/TK+nH9qf904KIvagUymOGsn3k/dhrGwZoTef3S2On0aImOsFkbV5JuP
	uFRyzn/BzSXR6yl0EAK2mpmeBWi1ZivEthkz7k4kvsSgu4oEZrPDLUpJZfphCqza
	649JER6DhqpZLDC7omP+WMeSskEyEWbIr0MFqPV0jOCxp6zLh2Wh5TttyvMFGpuo
	+bw3L7ITgIWIDxqwiE6zd05QyFUN7kwOBL86sX/FwDN+dQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8t2qj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 16:32:13 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e7624e584dso9568982a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789057932; x=1789662732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/P1Jv0DF4UzkIT1u26XRyNwrpVHhc0h6XCRRh+gwWEc=;
        b=MoyhswqRq2FBE4jRkQ/0iqFg5GPwnrfIH5vw9cXDlGVMJIhIMgRhszirf62pgQzZao
         54o3slgeqkhRAmthDoLJ6vq/VdR4xwbp7lBBnaqOVLXzfaBe6SxVFv/UwVvxp7Tzdnt1
         dyvZBlRFiwbIFT+73c5Wz6CRkS/wfAK8pjgzSKgCT/dt2UZ9DqKRX/mDHfmRQuX6J39O
         zyhxjK6t8/dpQl57+j1JRl64/5dpZJm3bpMEFIGGBWBKnwMYIKl7cqwj4ja3D+jrOLov
         jeUmvV+TC2qx7x1A+2norGZNJCyiAE/3beHUvuI9868yx+WffFoN/uxosHUA0ZN8c82i
         F7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057932; x=1789662732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P1Jv0DF4UzkIT1u26XRyNwrpVHhc0h6XCRRh+gwWEc=;
        b=P73Yf0WWK1iY/X/x8VWMwHqw9ohbn23Rqf5dCfNszBUbFe0ZAY0w/aizBCHF2emMWn
         cBUXV9b7+9oYNlLUvSzGB+JqE6zJlHBOsTSzRg7R4AYbyv6ksYWj4iS4t+L5hSw9/KS9
         FeWceEz0zCrE3kAm5QJXP4HOX8Bc4lc7Zco1/PX/Brthv8JrYiRgURj73g95b9h5PZwf
         /NNaOBjlvinVL5TxIJC+M6eAh7BipxfZA+2c7eXKPy13qbdc92esHYawHwYp56gPs47v
         3do+hKU0nG1O6Lnp53noiTwmFTFPXyzaHuTXWO7F0xoxz2UH0RzFGTijEPPVqFZiI4qT
         LXTQ==
X-Forwarded-Encrypted: i=1; AKwUvByCRGoDFky9xeMXFmyRLZerLhYv1hgMgjaAHpEMw594yTNwX8ztYt7V3pZR5MorlrFKM7Z7Jxir9PZsDIs=@vger.kernel.org
X-Gm-Message-State: AFuF++lRvbxG2CPIUta962BCPXDRqAbTolAbKq6alQA6RmGE5JNjzaIK
	z2sCCZTPfVgMUfbFP1wJ8YAVZ68slrfWHIM8yhXhn3SERcsZK9+B0fehTj2PIChvQ/ZElETj2hL
	AvhhrFYKo4m4EDU11kbm6PsQe4naQeIDXn3+E3buBjoDidy+ref/rvuIt9pbzmUKGjpk=
X-Gm-Gg: AYBFou0fQGC98vXapUfw9+Wb1HfRnSzSiWrKUO4n+wKjLfwiGyjY3MVQhyrSZtntujO
	ze7DWFd/aoBiLlqOb1ApuPxeEeoasfjQeJlWcDNAvJnH9ufQsTtk86Mv0uBD49dTZ6XAPHUd0/e
	078JDXCbg6vm+KGhTyyYVLaJeRifGivkuEcf6h9vBAgRnA3XOUbbjiOPdaFM81fxNVq0P3Vlxz1
	hLll02VsJdRqMmJYRVzZ7ujY5T0BJYpYiURIXCnqlNxcplYyd2OKSDBWYdb5XXGr/ATQAYy9oKZ
	h2LIvzrPs2L5t1NcxvN/d4R7pDclpbTMY1Hu8KR5qPUyYOFwlpn0Gz2PkBIQ4lxg9JktyrNYWDi
	JgU0c+3n60msI5g==
X-Received: by 2002:a05:6820:8584:20b0:6ba:3635:8010 with SMTP id 006d021491bc7-6ba36359c46mr10463459eaf.67.1789057932475;
        Thu, 10 Sep 2026 09:32:12 -0700 (PDT)
X-Received: by 2002:a05:6820:8584:20b0:6ba:3635:8010 with SMTP id 006d021491bc7-6ba36359c46mr10463418eaf.67.1789057931956;
        Thu, 10 Sep 2026 09:32:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c38e3asm90572365e9.9.2026.09.10.09.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:32:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:32:10 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
Message-ID: <aqLbikuYvneJcNjj@lore-desk>
References: <20260907-stmmac-ptp-error-propagate-v2-1-4a2e8e41e860@oss.qualcomm.com>
 <20260910075213.1c9aff98@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DcyQ1168CK4VEaSG"
Content-Disposition: inline
In-Reply-To: <20260910075213.1c9aff98@kernel.org>
X-Proofpoint-GUID: 4SW30Z43mb6pbuP_WR8M_XWF1McnT2nN
X-Proofpoint-ORIG-GUID: 4SW30Z43mb6pbuP_WR8M_XWF1McnT2nN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIwMSBTYWx0ZWRfX7Dh8oXNGFu5c
 0C/PWBzvOFcFItoAWebRZaTvNO1bvCpFKRYu5VIlE4/Q/zytJJsD1qtR0RojeU5rlZta4cukbyi
 LwxTgdU70AKs8iT/koUC8MbGifIrp3UGeEZSWQhgGD57tMUa2VoDGYM8OF4iPu3BR5RQj/0UT2r
 WAfU2zt99HXYSFheELzXq7AAbZA5lkIxtXZ/O7Ow3ftgmtGi7jtWL2Aq1o4ijUEJQt770dP2Yq3
 bW1/3UngyXAfEVntKqgbwTJ07HxpvnCHxToR65LN7IWFk0FyKFpUkgyDNx/PqRIO28o+kyzjWoo
 /Xtpp4nif0cZHjJgZbls/dT0WY8qJLeiadwbVES84R9dPBGz9Nzk31Tftu9LLRCEnsrU0QVA+Ls
 YrV5BvbfFaZsd+A0FQ2Qkl/kzuvcPlFDH9NeteiuAiZta6pR4nQHmiT9ikFH5wU3Jv7sO7uCt9p
 GrjSL0cSkVtZdgV1oCA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIwMSBTYWx0ZWRfX2uQ9eRpxx3KC
 qCRolbRxQbevrjw4eP5bMqreMK3rKqHIvArw4HwOoLcKmS2DmquyHJ85fe6f5AfkGK+G3Bnesqj
 65K8f6F46rtyW8Je+I/UKlzSUQL1SKY=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2db8d cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=zKpTHd943Rx03GREjosA:9
 a=CjuIK1q_8ugA:10 a=vQJXkPjffEpyFp3C77kA:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100201

--DcyQ1168CK4VEaSG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 07 Sep 2026 13:50:46 +0200 Lorenzo Bianconi wrote:
> > stmmac_setup_ptp() returns void and swallows both PTP setup errors:
> > the PTP reference clock enable and stmmac_init_timestamping()
> > failures are logged but never propagated. When they fail, the MAC
> > system time counter is left in its post-reset, non-running state,
> > while the driver keeps operating as if timestamping were up.
> > This matters for TAPRIO/EST qdisc offloading, which derives the EST
> > base time from the hardware timestamp counter: arming the gate list
> > against a non-advancing time base would leave the schedule permanently
> > stuck.
>=20
> pw says this didn't apply at the time of posting

ack, posted v3.

Regards,
Lorenzo

--DcyQ1168CK4VEaSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqLbigAKCRA6cBh0uS2t
rAz5AQC5mqUXWQW5lWcrVqX8VwH7UExQ5V8EJae67/Mr1xrXJgD9EZlnC4/Qpq+0
SYzMVRkB1CBnFcHX4kIqKAF3WpxH0w0=
=phU3
-----END PGP SIGNATURE-----

--DcyQ1168CK4VEaSG--
