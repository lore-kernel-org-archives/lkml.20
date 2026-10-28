Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793201932;
	b=UAl9GxYq1y3JwsQPORTuduDSO+69ms19hYZPq6IHRdXvZdJtxQXzUC6gqfTwa5dCQbJ+
	 mXWXiFBTWMVORy2Id7RmfeaU5FFTJIugPeFAowkicQQxrDbaezycx9MWjeBZmX+dRJdpt
	 C+paHBaB0FbNh8mE3rSBjpgr9USVAcXLzy7wQLbKIIlIhl7NZA7az/UICdGwA5DC3Ui0R
	 2snqBSiolCdJZefcO/dPnXVyfNxXsx79fqZxBYWV4/6vm0OMhTo/qWIY909OqmVjyFRuT
	 eOUC9YVrfZEpQnmaKU1kc9dRDG4X/r3ut91jrQaXDAP2J3MQqIxQPiXbxeUKa285iMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
	b=1tvtrlfbwoFGc/Xha/GY1NYZW40S4n2XG18VyPoNQabWZqL833NNbP1wjQcqXP1GXHBJ
	 g4Fm44uE7hgowZmenC2GiYDVAfOLuQUBT0DslxbfkEgQYsQH4oVA6opUiSAAIlUcd0VDS
	 5Z4iYSmFm+5y/bP2c3TA/vmXrnz7c7seyRaSbU1US4TkrfrWti9EkgWXpIoPhGDlwJuzj
	 sIgjIH2n2ltajfWc6kVOqu6B1d2ki7H75cBx0JQtGvB17cGIpKtuGk9eJ4S5CAva5LfOp
	 k079jMIB8DK0xjD1kuGMC05MN2pDo577eH4DE+U1LGwwTE56Fh3rey7vSxjIqnxRtUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwU1UGoL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsLvD3Pq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 635F2606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:38:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 635F2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QwU1UGoL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UsLvD3Pq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFA5vT966643
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:38:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HL3n5xlRKDyRhGpMHoz3nl0n
	GwGhziyan8A1Wdy6cno=; b=QwU1UGoLZJPPRN1rjKjGfwL82bt7KAKZeEDd5JdX
	lgGFryXJt2uQKelf7VO+9DwvDMUtXtsKW1QQ/b8wbqhfAp39J5cmlXdcbHyzgO2a
	1FNgUPI6aTo3UttCONl90/IFzcRGpRrSotR/6VE8gGRDUzj6sU8YmIXh2a17wpLQ
	yRA9VwfMCU67L5HawXfbG+X24BUce7/JXYTP8kVP0R/KBli/yCElfTKfr8Gi3FIt
	mtO6kya+5FGH+dMXA9RH9b9nC3hUPjqAbAAdiQUeeGMbnON6UuyNfDhd7qDlAOA1
	Y2p8jxyHgp9J0SjHhEeT34Vi2b4Whmh3OmS3Vz3gbGyMBA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjgmyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:38:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caf6c528aso150722485a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:38:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793201930; x=1793806730; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
        b=UsLvD3PqFbaKS77peXGZMcBuu4z8DXCkN7rEVnT/9rxbDQu/0IlWLXnFGe+kPSzljv
         nifHWWV6zi/2XQWOJGFSv4+iLTwhLa199r0Fw9nygP2u4dVQZTq/EaLuvns8SFt5Qb32
         f+DaeoT6RiFkzsoO/L0u+G/mT8KYEzjteB+yKJhBbUU/iSMEmE/8L6igzItnzJNmg0sX
         s5Wfgwz0tRRB952I+J6iMoOurk6voHot3BYCkiA2iC1BSJ3pAzztbS97GHPm1PE7ALcL
         LAG8zs2i6W01NZI0Q6OB5ixsqg5pSUjL+kWEFZjhWXj13kpy/kkGv3yO7nY9fybwKy1x
         0n2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201930; x=1793806730;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HL3n5xlRKDyRhGpMHoz3nl0nGwGhziyan8A1Wdy6cno=;
        b=u5lV0K9mHsEgSpUmbJ6DjAbUSSwU24Cyjivnp4u4hrU/cuXjPHDElPanS6/z82e7Ot
         3fsv5XOLLTnsSeRa6nPMSdOAxx3wDTfEC9JkTRPh74EYGCp6Bm872+lFFn+j+9cG1+xA
         1j9yKcg33Z1UEoo5oL09HAZhhNzda4vAVNtvRKhP4wXwi1mW7SFh7k4uy2Obmj6JKaa9
         wRTw01RiCbwW7PEkRXmUGPUNTSC2e4yEowOHU7xl11TryajioXMvWtMnwOEdqFFcHYMr
         UJ9BEkiuIJ9aLILOW5mxDlrNB0KDwNXjsNKp7Zz8faDn8Ii9HIqAReVLDuLKN2PUNUHQ
         +1pA==
X-Forwarded-Encrypted: i=1; AKwUvByRJ3E3+XaCJ2xpUck5ZLudvSB99fQ52WKOkjVJISZHxTo1y9G9M9mdF4X7D7ewmZhfU5NkigSKT637XhY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ1gWk7jyMIl22WCcXH/ZzTc+ti6QishorTSXFBe871HBYI+hI0
	lI76IE7Q+ZGsIz7S7cuRSRkss9z5iPEzqXon1xaarsZR4/Cxx8wqwTV3lDWv+JocLzuiz5ggl9D
	gPEhdke6Rne9c9bmw8Xer2BDooH7uYTeQM+iDJKw9Uzpr/bJ2n8n85uRV+W73hckotjc=
X-Gm-Gg: AYBFou0WsPbJWp6nJMOpGeMAPyNZVLlzLQooj2FPvYuqkeUYV7YHmLYDiCqwolUpwlM
	a2kYXwoKP5dzv5nwBQuoWEImMDATwQ/ME/efn8Qkh91HZGknBB7xWugCy760tPD0br+CBQEeyxT
	vzB9OEAxfdgN7vAAhqlQEVrr6QUiT41EUXwd5KrFb6gkjZPJMpoqIa91ULoE/XOuWqftYaMOnip
	rEHCx81oL6lsc19dfFVkk/rPX+WChty39bW4JjCvgAkfhtxxOTki4+1L0qW/jE3SHO5SSzR1NXz
	XvrJmIFIGUyuztB8BJfej8J9Bg5odkJobtl/prUqY6vfY+A2y3nGZAmKxAVjOQUs2/9WW+kZE4m
	BS0GNsIhLIxrU3Ju3wBj6R24PYDvP+pLoPLwSlbYadkFfBDjTEoOC2wWcMjAuTv/hiA==
X-Received: by 2002:a05:620a:63c6:b0:93e:746e:235c with SMTP id af79cd13be357-94408a26905mr381726985a.15.1793201930398;
        Wed, 28 Oct 2026 08:38:50 -0700 (PDT)
X-Received: by 2002:a05:620a:63c6:b0:93e:746e:235c with SMTP id af79cd13be357-94408a26905mr381720685a.15.1793201929666;
        Wed, 28 Oct 2026 08:38:49 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896fesm28945e9.10.2026.10.28.08.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:38:48 -0700 (PDT)
Date: Wed, 28 Oct 2026 17:38:47 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Luke Macken <luke@phorex.org>
Cc: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add
 Elan touchpad at 0x15
Message-ID: <46qu6w6grb2alv6f3pnvefbtbruoojwemwop34bdehosz4s2dv@l6ib6qgzvmw2>
References: <20261014234949.1730808-1-luke@phorex.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfXz1OegWiwyeKn
 22GEOa0b715T/t9QufIYw0oBNq8UzJR1uuQq51Le8Lm9/EPYeDxr3WxYz+DYtxgRChmfGG5loo3
 oHhCOsboPYMwJ2eAfba0n7FvH4cy+tVQXisrGXbroSJSqveW+iVI2T+PJ07KGL535fL1DWnS+0Z
 GonieKWoyzcdTpKlcCoeZvuNYPqR2H8aecZcVnppokXhIsKA2uWtPBBQaOC5/G+50/4jYHZsHDY
 hlvH/sMVbLY8H+fy45+EpVKX2dgO5PHC8CJs1iZrAwiNqqhybrPQ/jNqy/z/njVyL7UZdNrcvmB
 tNka79uNSCeKfvYr43QCMqVqud3qQJnZwHA8RIRHo/ndV6LuWCSmb/ZVmJ1MgxIYux7MWq9RtiB
 57HVORiB7AbNaR/7otNYiv+gk+jQrlPb1bVrrF+0g/qVOEjkorPDLe0qzkr4X8qohSI/6iqR5XK
 CInN/kQjYT2Lz1p6j1Q==
X-Proofpoint-GUID: aBPRBKlIWi49DkSsK--xj-3FbcvhuJAm
X-Proofpoint-ORIG-GUID: aBPRBKlIWi49DkSsK--xj-3FbcvhuJAm
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae2170b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=mO8_gwkcAAAA:8 a=EUspDBNiAAAA:8 a=1ncODQROBz-vSmanY1sA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=InTEqNb8lIr1xazlwGwc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MiBTYWx0ZWRfX2N57RAJ0HXdZ
 dNX2ltLXP1jWXgDho9763C2/9e9wl5KoLgu93tbLi4ZYTkZO2XW3PULo4KsVSFVOxEybCFxW7kY
 W3Ew1uplRTvSqKMMY78MmDfKqL8wckU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280062

On 26-10-14 17:49:49, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> Assisted-by: LLM
> Signed-off-by: Luke Macken <luke@phorex.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
