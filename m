Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793960593;
	b=5fCYMCLa+JRCgiKqeI1xwBq0zWC8e/PrtgL3MvmR30tvV6w0LMHJReh/OBnk5HQiUUW6
	 feIj7Yx9NoljKglhRK5RCB/bYSVHlu02y28Kd2HOMRZ7DJ+xhDT9g5HYSlSUolGmT22cM
	 iA/StUkYNsVI3E3nGAX4QWvrLDmtvtl2dHJwLZDF73qVJywORGDRWI1nVPhjVZ39BhG8q
	 64cJszISrF47KkX9ZMhzEl9G2jc7UArw0fswACFltgzTdNqokR4glwoCoohX9iwEaC31l
	 wtHNcj6skj7sBwMkrS5TVMVhbR7v3O7vJmUc9pu4nSsnTdftYJh9lmLw45536ssnF+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Content-Type:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=c1GVYkei3Qf9E0c/7q/oAx7ZwQyyK7/G7Apozmc4xB10oj6dq0uVoj4/6BgSPqygePLn
	 qXeAOe+5JvMoZSMHLHJBof3jnUC3YJaADWJciaxiLRXeLPGD71UbnczZVPpaeoaxvZ8z/
	 HzgGvl0wqz68uHYPuPSLFghL8NdEOsbWu1uRMDjU4Iwwpi2Tygxk4R0KmLXA+yTsyUefs
	 P3HD1GP5VWA1mRzZCMmLCQEJWePLSBPVNqbn59cJnOPIzyAiGF6isS/1VJhf5/KIbCvDd
	 rKg8ywwo5Gj/h9S3cxljIBq6eBNUVkl0yPrk3VtYJGhtIIWRAu70zPXU7y7pFwJosrQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsvSMCVD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DHypBNFK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A221606A336
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 10:23:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A221606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nsvSMCVD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DHypBNFK
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RS7W3284394
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 10:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=ns
	vSMCVDxgaW1dbxxTIoiJ24fa6sJBo7/lAdrvumM6CIdktg5sPeOfDvqkiHb4AmQh
	5Ikl0LafWmiYc5PMnFsN1DS8Z1vfXmcbyVWvLrjKFrKpYrwS/F9rCm2f4bsx8eOT
	z4g5xryMHR5mgl1716uWR4Px29E7AutipEIH+07kj4+F507T8RbVXv5d7NFKx7hT
	AidjFfC2+f4iOyF3UZEAhWJFeRavoinvobwNzP4NEBns0e3+9A9qOfeY7hFAJqmG
	vi19KB1a2X/c1TrLdIfrH3+REQg1ABRe9QwAoXUGGFlj7IDnbV4LYAIvWJY+ngU3
	TqBrHIRNPeoSPWlzmiBg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa2bkb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 10:23:12 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-716c4a76aadso573355eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 02:23:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793960591; cv=none;
        d=google.com; s=arc-20260327;
        b=fXJwYqEiemFb7Mji9aQlC8se0+rr9zDA6A4RLUq6AK+U0A4cYK2Q4TjpPhB4F4XaTU
         30UmdVsYqPpYE/OrPnRp/L0AeapPxZUcAwdIjf8oB9z7LOrsVrV5UUzydtn22q61uIRI
         UqKjaEMuI3weM12yNKzLXI7bS0vQx5k/r8B5nJFDkMPHeSHi01XviL1lsdB3kY6msjSH
         DT9GyuwKlKNxrqIeboi4Yq6H+SJaU7Qo4WBUlNFKTo/cwcPwCj9j/A8IkHVB9nMeGQTQ
         /6vjs25tn1w0LUeldT9KoAkj/GNe0BmnZQtG20g5aKXX7g5QHKzrDpfF50Wx2BhbzCpH
         jiKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        fh=V9AeBafJgTW96HdC48wsxGAfd7Fe9P2uAL8tLCjpUN4=;
        b=j/GEEUZ/sWiHr8HTlmNixMnGzDnnLg4pm9IhNdvVxjIl08NWvlP1jCygso64Ysp0jH
         fJ3N4RwZQ6Vzd5CKkWo6K3phue1TR2v5ObglQw5B5rqCUEojP5D1bShQJuunfeEjCpJn
         Rwnsh/N/U0U1wfcSl+axpVWzX0hpP5ZGXlj5fTjIb8qwaM9lF88skgTJDAKgJvb3Y49W
         RTWoxfi2Ji/k0Kiql/x31iQzgKhyMdYwoQslNgUVPSO7Yed08XZAdB3AMEknY3T/dIWk
         f6W66CB4MWzxCvpFUjyq41nIvZSWZ0BgXG2Q6kmelQ/aI0MeWVZ1M6qfcIggizhSnW3A
         Fkzw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793960591; x=1794565391; darn=vger.kernel.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=DHypBNFKqpoY/yuBHxf6Trm5qL94DXLt1qRZxYCC0gOG8SxyXwctGXYmd22W0wR9jE
         vNaZOIy9ohOF4tyIb21gxf4p/Cvzn27fAjt8/0VrjqJX6xTVE0u6lUAI5M7RSjIFOwQE
         VqOt/GIIICm5xj4mCxyDXmhKMpXA6sfwqWKS8/bcjUuD6VyeyMnHEiChZc/E1IvvfdCN
         8+Kv9sw27Pj9pwVeQZU+xynV6qvMKi1BJh33SO2yBJJqpx+eiloYP35GOTuVHlntejjC
         mmMfNFsinpHXFQ3bZg1XnoBbDeu9FYCHkjwM8upnj8fBtiftmp9jGYLgrmPjaxhk4Grm
         blSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793960591; x=1794565391;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=iQXg9kSobvlAaZR6cRr0d1qHpEXrEOCqa4s0Reh2YpfJaJopgPOWIj+u7IwyKfFbRZ
         MhJTA8EqERlMJYbDSvHEs0MTf4KjRiY6TGtWWyZX5B7h1ww46SoL2xhpT2z3b5fiHmr5
         7M50l8DLROyxMCI3P4+VKOGm6wl+lugVrL4NeBUvpcGA95XoR6enA4d0xCvhnGBYGXHS
         b4TmV8nqZuZCaJsoaxPzcekUnpnOCMUyGJkJxOD2kXwY3MKjLLK4w5HUU1Mn3jBbmHjY
         4NbNEIutvigrHt1q+UCrPcoghnBsLFgCna03+tm8UEOcLafAbNpkH3cjpZFr7N6O44gs
         FeYQ==
X-Gm-Message-State: APuU4Z8Mvd0l/Th0J+3hdXBMddSEAg6Eiuco2XGk5fe25Qk0FfD/u4AR
	qrukSsMN1tHz4d/zPgaEuJmujJ3+jHiV948KWqoxhtLP+CiY47xx0czn6eVWIzOXTMbC1TT4ydT
	HYi252tmwqmAj+Xnsfl3eEeON2W36fWehK9uiFA24v4RheHi7w7tv62jQqudjdQOSseJKsSwuok
	SEz9RT1DMuBS8C6+NXtQKf3D94iDWICiY0eMoPTen7KiPEfx4SsA==
X-Gm-Gg: AYBFou0eWPuQ3Hnk6DsHAMUW7L2M/uFhnitXEaqHDv9qnDyqe33W95dFaSiqoza+oDN
	8yf6iD6eHJXFNWhx55Qc8fUbS3tcQtzoHZ0NLJZ8HUYILFkkGSpFY8L2CiiXwTt/MmjZRHo8Gt8
	/fAsnKaMRXmyIeBTSaq2pjzCtRfjJgnDRf0Z7DxPHs5srd8RekSglb89j1rzI=
X-Received: by 2002:a05:6808:1509:b0:4e9:a959:7a4c with SMTP id 5614622812f47-567e101a3c1mr1309424b6e.24.1793960591450;
        Fri, 06 Nov 2026 02:23:11 -0800 (PST)
X-Received: by 2002:a05:6808:1509:b0:4e9:a959:7a4c with SMTP id
 5614622812f47-567e101a3c1mr1309408b6e.24.1793960590556; Fri, 06 Nov 2026
 02:23:10 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 15:52:59 +0530
X-Gm-Features: AclHuK-SJw5fDdrUe9U2eb2DPbLGRjHaQeDmTi2yxZ1aO1aVc4sGts-JDSTxwos
Message-ID: <CAAFPZeurxRvpRK0iEHR2sn4iq_eDNwgs5yywjSpNYOiw7kVJOw@mail.gmail.com>
Subject: 
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: olA9OG21seNm3ZLzeVZwTjOOqPImtVqF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA0MCBTYWx0ZWRfXxFxmLQV3H0BX
 XeStHjohJ3zIDUNuo40nSn2mszXl87/hKPvRrLnXj9NwKBndeRAOZ7E42pH26tnAodToZSytClN
 Eg///dgHqOJw2wC/KCI1NexPc8RzwRQ=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aedaa90 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=tclcd6dtLQvEqt9_mmAA:9 a=QEXdDO2ut3YA:10
 a=k4UEASGLJojhI9HsvVT1:22 a=xo5jKAKm-U-Zyk2_beg_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA0MCBTYWx0ZWRfX3ahyKjfQMrsX
 5RjPGZz4Oyl0w/RbEtlI7CiIx4AxxFdHlZvguCfar/1KZVoocMcMd426VgvvorMP3Hx180pqlPG
 1+XWjzhyw6o/aWO6qNwRuKSmKkTWo5SW4Sq9j+I2ic/9p0QLOCl1w5vDoStFlnwGSohJahpESR2
 kR5koBNOkrQkvGlbKQ3te2f/A5lEb8/qki36dG/bBQtBcnF5LV/gQKCqL0NxVqny5hLb0d0TLxj
 X8J6P+4WpxTf1crWDstMi36n2Kyv1rXNVhR2ae0mPotAuJ0mHHIkp5A8rf4LRwYQBjL8GZJaRs5
 H8bz84ic07Q1zpPsU2I+Dry7BajM2DYpjaHKQkJVFXC/nT1CnvOU8rxvUtC9lRFvXlv53E1Q+vJ
 gvxWayXmFQbS/uGSwj2kE0bAs4JWI+YHWMRFOY00r9EgOSmPffdTTxjVw0CD16JZ70eVi0F+QuR
 7J4/myYlrKktMsK0l+A==
X-Proofpoint-ORIG-GUID: olA9OG21seNm3ZLzeVZwTjOOqPImtVqF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060040


