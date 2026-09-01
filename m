Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F10369D4A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 14:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788274027; cv=pass; b=A/Z2+6LUkhC1GUwrHsP5CS/IwB9fzOB25JEve/g1G4hJJyqElQkaf4M+NCIFQr6fu45ksQ8OucIQYFYUvKwcarTnJPiG53YR3RxiiIVWVjp2XA2ounsoucfAFEw1CQLs2WTgFTbV14KOKGBoya9d9gWyrlQE+EqUPVIV3BSVCjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788274027; c=relaxed/simple;
	bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ft8e45sRLMGNPMIteqV3LUlTeuVoLueh8SPeV3f/WTMfDRuo3dZl2pRGDjDEz//njJcATwUqJ4FebQRc8VZT0vGOSez+Y/6HkWIu6ZV3P8I20147AeRnemx+P7OU5IkLzQv6NDvsLG7bdPaFToEjuWMuWcvExrnShOJ1JP7HEmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJYQ3j39; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QXx1FXtP; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJYQ3j39";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QXx1FXtP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681E9RPM1638683
	for <linux-kernel@vger.kernel.org>; Tue, 1 Sep 2026 14:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dT3RN5VdEwJ2zJ5PYII/r+JE
	HnQOkc7pAjMxC21FiBY=; b=LJYQ3j39rNg3jWlWWauFXljfGn0CDk4MSMJrmPlv
	L15NtYDyNfvCTM4m3op85ejvzHPlnVv5fmfGigCpij00OFLABTu4XisP7YPYy6Ij
	9/CwakbGQbgKzBmT+ZJTZRpU7Ayr2cP02DMLfqbI7aLeRqAEFwqeFkWEStD70qn/
	aReYSwd/sgFUYw5VU/9KvIm3S30u3taNTCy/FKbU9oAFRgLFhO9zEz3JGIIhqxJH
	hIUyfgxjAALr/cGeJjOAlXCVucSem4oZ3BmP1fGJMmpCSvmqGDLh4pEd3weG6Tjt
	GxBXCVJqfYmlWybdPMpp4B0VPXv4n+L4zyU38VACb+eVpg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdrcsjead-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 14:47:05 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-853a9c4c99eso88074547b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 07:47:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788274024; cv=none;
        d=google.com; s=arc-20260327;
        b=msPeQ6sFVtVAiNPvUE7W28VXbrL74rMD7Bm8IMBdM8DzsaLLa6rmDUhV3OCbhg+o7H
         B/CwHElqj/gUE3VPLaKXMKTplwmcE8aHZSJtMPCgXOSGRSjFSKtZRlmOYOJQ4jy74zrH
         C5OG30ZPVVmRMNHDqp4w8si5rXZYJoRTLnxjpzxiOIBMPp5/IhZumwLmaUl5Zpjo8Gc1
         /AcRwLhgms4zVWb6S6qoGonVecxrOD9I1CfnIzf1rJiJL7armAgmXkuPGfwt3+If0YNF
         /lMNkPzjBLzgxbKDueZUy0MhKbdPN6wUVgFfOam5BbdZDSHfIAyknx6JyhqLIL9KOzpg
         TCCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        fh=P/nxDcKTDQTbMrm+hgX3vbzIESuVlBhy1O2+f028Jok=;
        b=jcBz6YZq3Wi9BkUCtoQIJnRWy0Ti659e+3oy6TivR1zdYRv1symHddyS2EeSUSiADU
         E6QEJbSlqAcLyWjgaWIheIiQ4po8WsHo+N0+9qPhpQo2iVIHsk2qRBbyBsjLwRkv2nBc
         wl0MO+qPAj+kyHu/5Ad4GXbfmasjtC6wc79MWTvghpfLhznkK8Z0w4iQDwc9fTODelnP
         vigaeuiR4UwqX8np4+ECImQRVfneNfm0l8iS7sOlfZ8tMzKXkP0qYyuGxSIbB6His9n5
         zj8V8QaJdhoZh6FoPdDeB37Fz/ZN20lo0fHbLMZTcsnGNbIv7tJnezqfEdk5VCvqL3fj
         y9Qg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788274024; x=1788878824; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=QXx1FXtP/rufyBfs+6M8DM01Bp9kos0zxmdy2U/vdltJplNrBPz+NViBc8c7q2NT2Z
         zzAOyXHV3bRNMQvj/Ayz0jZxBDhNp4RumOP7EtYWiW4wmEWqT6h+sE46qVujdCHw8+3/
         RSdjT3IrECSG8AywobJFkWS05yH71MjnT6V0FBTLXGdof+PZYIqOBwo6kX0vUlfGsQsT
         SrimCWKur8SunYyZCA1BOS853tqqRzocGikW/Gw1U2vdN/WLjyPbcCZkJElWiL1Anfqu
         2omqfQzCpO0FG/+c0KMEX06IBTNxi/EVrkgCr2xWHYiSLR7goVmDLICd0m06YcGrQKZo
         maqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788274024; x=1788878824;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dT3RN5VdEwJ2zJ5PYII/r+JEHnQOkc7pAjMxC21FiBY=;
        b=WrBlqR/mlLflk0+9MWL1eHpSeviOPHNz6QxeDoOV7M+RYUY6/GbEd07LAvNx4coI1f
         qTkqGZ2OXzbQrv4JPYz+D5I4FfmQ/KwnZuvwp4xnDLJxp7LAXk7H5+zVP+67k/q4K//x
         ORe3wi2xMC8TKOhhe3PyRTGr42/GE2Uca9vIkLeov4KCxD7nJx4ds0pQOwmFc+c7TOvz
         /oQCnOtxK0bj0gpMPJ+1mcogBrzRzOnVgOFPsIQsruEPAR0CdERomaTteokCGc2ZfUAI
         8Wu3ApOQqyzv2z8u+N466zyQH+mWe4egOBCY6/4GyEO7mW4k7spYTULN25uDH/qdkMFn
         FyqA==
X-Forwarded-Encrypted: i=1; AKwUvBwtxYE2eJ4AtzK+uZYLaTuZJjK+YloG7iWXbV3NlFvf63ghwNy84FPImG+o/O0hl+jhnMeE4L327Sv7Hl0=@vger.kernel.org
X-Gm-Message-State: AFuF++lSfef7SQOwDq8uQW4i/20jNk7JSrstx4Jx3WlXDKgJUXvU6f2E
	ja6phyd5OtLipN9EoAEkKq9uJWLtBLsC6LeMNlHirl83Qxf54ZMTdldtpwe+/N46zLi0r2adOEe
	3WFDHdWUkVB2KsqCHQP4CAICeoHkcGB5lGMaG9r56UpO56WKjs30qIUXXVI3etgBPxLnQNorPT3
	CPWltbbMSgv1GGURDQPHK7Xb78WnTU9U/sLqP811EOlA==
X-Gm-Gg: AYBFou2hMLkSbqNAYgkHFu9QoOzfw/PQyboXn/sAO6Eoi3cz7HRm772mBjIWRBWW9FQ
	XeEgF8YbD1o8zGMZ9COZQxMkgmfwiMnYsPiXVWIZP4DM4utB+fUEvpd05ReaTQd5rgkwrrHm/LM
	otg+pSu1DGIYNSa5abwCtvuaNA9vcFCAXrQ5EUp5ZF5RBwFrxT77zu9Q8cljU=
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id 956f58d0204a3-66f856546f4mr2647729d50.24.1788274019309;
        Tue, 01 Sep 2026 07:46:59 -0700 (PDT)
X-Received: by 2002:a05:690e:804:10b0:66f:8565:4302 with SMTP id
 956f58d0204a3-66f856546f4mr2647716d50.24.1788274018846; Tue, 01 Sep 2026
 07:46:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <2e998f75-bcf9-48b6-b9ac-52627d52d284@oss.qualcomm.com> <CAC-tS8D1Q+Qq_cuwJbc5jU3UiOEe03zqgrvbQ8VAksmPEiZE1A@mail.gmail.com>
 <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
In-Reply-To: <2dcc0fc1-6e71-41cd-815b-bca5d3517a65@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 20:16:46 +0530
X-Gm-Features: AcwNN1WVNVZF23H9olknWUBf0jBjDI0S1tPmtjMycntbFFHs18PkVuP9uKwJBYw
Message-ID: <CAC-tS8DcSuhefOMwEzKdcAHrkjh450pG7bFjKkhbdRi0zHgdFQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX8WMwPENq8SeK
 fOyarVxmp43Av95YGgkKBItsNJsAXN7OQ4sozO67iUtcX0XQAvru4zdk9O3C8S0iSYGqpY8phLc
 rETB1+VmTUNV6O4hrQSegOJbz4oGpBQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDEzMSBTYWx0ZWRfX/KxVJ0pJFeLo
 b6uyThIOlzyqXYE2YKvpxztZu4DyDSP7L363hb95HD45YoWScI18N3CMSaBhGaMD3Aipx7TauWV
 H/gXcd6V27mziFR2WxRc49lKsin/6gurHJ5RTdi1dSTt1c5A7SSLrP4Wcs1qmu7DJf3HvGKbdLb
 Ckv1t3AbSQr8zgh61JYtx6fytfe6rPpaimnjqu8F83gFPyadUrvn0mJg0Yjqpx+g8E0EpJgSrdb
 VOfaSpC6pa1Hlt5pbUpMjCFTjVWojECL9zKwh67iJoty7WEP4jwYAeMyzr9to3tTjLcmXG9zvx+
 U7KNf++CMSPhoeEsJAqZzVj3OjXAfWAP69GbdV9G7ZK5ASGhpf9FdX2GniC0dzivxCoUrOBsiJ/
 DaPvfGHhsYxrD4NFN/qAbYCWVRL/pbuR9+ECw7tE15c/AdRENRxX5c08xz2rusLVD4kFZb7rOkC
 zc+S6KiPTVfeSih7VfA==
X-Proofpoint-GUID: ktWjfUsntOmNyhkqBa3McgGpfILs11iU
X-Proofpoint-ORIG-GUID: ktWjfUsntOmNyhkqBa3McgGpfILs11iU
X-Authority-Analysis: v=2.4 cv=QsNuG1yd c=1 sm=1 tr=0 ts=6a96e569 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ubUB8SH87j9vw69hzB4A:9 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_04,2026-09-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010131

> >> The DT binding filename and compatible string do not match (qcom,qaif-cpu.yaml vs qcom,shikra-qaif-cpu).
> >> Usually DT binding filenames are aligned with the compatible string for clarity.
> >> Is there a reason for the naming mismatch?
> > The filename reflects the controller; the compatible is
> > variant-specific. This follows the same convention as
> > qcom,lpass-cpu.yaml.
> >>
>
> There is no compatible for controller and the only top-level compatible
> listed there is "qcom,shikra-qaif-cpu", so that is your filename.
>
> And I already asked about this in v1. Why does this have to be repeated
> at v3?
The QAIF hardware IP is the same across platforms, only the board
integration details differ. The binding is meant to describe the IP
generically, with board-specific compatibles like qcom,shikra-qaif-cpu
used to distinguish variants. I had qcom,qaif-cpu as the generic
compatible in v2 but removed it in v3 as I was not clear about the
guideline. Could you please suggest the right approach for the
compatible and filename in this case?
>
> What about other comments from v1? Where they implemented?
v3 carries major changes in binding and code, which addresses all the
previous comments from all patches of v1 & v2. Requesting you to
please review v3.
-Harendra
>
> Best regards,
> Krzysztof
