Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428D04078D3
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790146024; cv=pass; b=b94ROXQhgu7R1zycevkE7GSqg0zbbuMsHhEP+rIDyje67X9ZAdZc16m4cq0gU/ZwTyA6aOBcwH4ZAYl5eGXLSEBCjJajVYtNrG0HadGTpc2Avl9sS3LdSjoSIZm+ql0keRNOJm7J+4o+zLTkf1nPbTl3RMH/s+zSn0WmL9ntjIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790146024; c=relaxed/simple;
	bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zrsqun4GA40C4ODniTkpN+dkaWsgxlEeqkEDoFY/EsyUvb7Kgpqsl+O7YnBZyK6NuhVPT+ceUnHNpp5GxIzzIi5JWDEGtI9+Czuk0bkZ8KPgaYik+yOjM+s3Va2PQiNIe/MqDam33oMWoyKaE4R9lH2LnrScWpMEz2EnMdG1FbE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L0NI+ZSJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hu7617uo; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L0NI+ZSJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hu7617uo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iM6x783359
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Cd+UFMshbHHucxt9icv2dTeV
	fo16suRl9lwtg+OQtVI=; b=L0NI+ZSJlV3Fd2XeEnpmo5NEe25PmSIOXXdpkttX
	IVOndk1jMctIIuvuK1SG1T2sDsJos7ZGj3mmMSlPNsCLZW/LZQlFQdTn7ySN3kO/
	B7xnRuauL9/BvkQgzsM2HnCcLbD0IahICZKJuBikHWiHzWo4N+p2AXRy8nKUHJYY
	+K5lRjvKzhb+gsphYWl7poiskWTxYq13PhH0XmJpT1RRXgKk4SEUhYWUDaxCZbew
	64zvE/tWlrTz9wlj1eDBp8XkvVsPiXA4Nv0GlKMvUOmOfej5PoHda74iJ5P/nwTg
	rOV4itroE9Yp2Bxx3t89ZIW3itiZSEhuZ3QMJR4nVNmhVg==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guyma2f88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 06:46:56 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8a111888575so20769357b3.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790146015; cv=none;
        d=google.com; s=arc-20260327;
        b=djbFnnsendFOtels8o2R78Awx8/eu0rZ0OcML9SLY9rSkmcldbBM/dgOGL9EKEQ37G
         0A/6J/gkTBbKKyfcGbFS6Az8IvyCX9YiZ8Esgi1gZ0HCCW1gsfC7wA+WhsTOIXpKdVKP
         GuYVLW2GdwGQj8W5zaLY+KLqfkN8fjB9ncgJi5vJnIYt3qctZJs3h68bsJlrelcQq7Rg
         +ECxEhqthcteOCDVyP/l6WNPxG8Na0ybbYCrWdvL0UVaB46ips3ApotPb4/fwciNva1l
         C+jiGMAj6HohMMWO2peq95fAvFJEnJNl1KRqbIWAQUBF5uJ0e1sfy/1wT77IlTC4XTD4
         KCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        fh=YpU7JzU/f3ciDvdjwyaLyBnIOK2fgxe5Ajevd4BT6ps=;
        b=hCB7cL3mOYokq5R2QDSfC9wlNUI111Tv85hSwcpKGK9IJFbEUlx2w2gEIWwqZNcYmL
         SuYMJhxFh98WGLoOb2uJCI+2C95uGGAtENuVxZqqA3D03Qjb00EhBZNOqo+0PIWf42TU
         1o9jMvfzW7R8k5SiI+A+rZMiiVUAX9zjOxQq8sXWqWvlc4BQsflDoGEASlpCbM3y4f+6
         cVRV8Xtteb/Bv5VTMnh/KY/YJPLAn4DyhSgp+tyiav8mIH8xnqQM43o7jy+PP+oomuwU
         Z+7mOaqtv1nlRl6eNwH0rhjfwlGcCrJcKJIoPeEr10pF8eB/yEKx9Z4cT4rlisw71tvE
         uXqw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790146015; x=1790750815; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=Hu7617uoFzQUVQWB96mh4fqXtX6fplDdYJ9oWJJCwCqwH1aElCs5v4S9h6LXP4tB6m
         g5RQh0hJ5JTurFvE7HKh7aX2XArEvOxO1S7LkElg92rnwjefhAuvMw3/f9YRGh97WIwj
         TP3Ue1Ui2uq7zliRm1ppy7pES2+NttBzmk0jEqDK6q8g6q1IzDDhEly3dPqXu/G9MNJe
         PTHCvjhk1UjpEUWIqAampIcHrrOaUJOzfzaSmP8VcFS5RaOkE7o9pSaabKl/F9rEaXMV
         KJcnIZBMaHqVHaUIxrJPcNkvEvznZbxOLZli7WF7LWMRQlZ5fPMEuWOvIiscObpzV66k
         u6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790146015; x=1790750815;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Cd+UFMshbHHucxt9icv2dTeVfo16suRl9lwtg+OQtVI=;
        b=QywDCm8XXwdPRtrHUPuR4vLa/9tDFa8fi9BCfru8VGGXnaXVfHaYZKJF2I9+FvAwj2
         iKhjTlbgvs6rVh7fBXxT2YxNWGhMwwoA/n1ZqAot2WgoVTHMVLpCAproeCRky7Yel1xj
         g4dJWNPvbkLTgIHNR94k/zV7MIGBzoFfY9J+nqVq5+Syw9RFeyMVR4+F+JM0OaoS0+yT
         CRAmGdigsedBv2KFx11TTG9MF+SfAXfEwCTleCatmn0aNy4XdVgKzvV+4PiKvLRq/B8e
         isoGkauyrJizPZgdE+c6+seXmZrgGK6lr4u4I5528oXMme12zr2401MwzAooSeWUhwsU
         27PA==
X-Forwarded-Encrypted: i=1; AKwUvBxC5o8lu1q7500p25VPLkXlGE7o+GQ5uwiMOON2in+Rc8csl5j890jMcezXb4MNYBG+NwCCJJPfP4ipMeg=@vger.kernel.org
X-Gm-Message-State: AFuF++kIOy5vsHk0Px997uFjsICn+spjMvJ0XH+wfTxMlK2XudTM+nKQ
	NinQ2A6RH4zT4VcP1pC8Wcy87PUAgmVuk3r7oaZrd3v9s8ggGmdIobMX84kFfoXDaeKH7u//7Kp
	nJ+0Jxjfw8n4nuB27tjeBW4295HFbnxUCpPgZGUvmsDR2UfEo1vsRYlvImiDWOO8Vr32Rsb/j4X
	aNdUn+kGG72ERPIbvz1OEbQQmSm2MnkSrTzT/eWOx3qg==
X-Gm-Gg: AYBFou3Ul6538wZpLZ1Ozy8gGx0eQStICDtyuiQH9xGVy3qBy1nY2e7jRIxPkJ+zYSq
	IYnCZgLejI8ianHxUZ+hz50ePz18r56ugleJxqZpnwCcXMG0j+fcRfd0OdTijgUbN1/+GZkEZMA
	W+mqBPKfz0Ank8VFd1HBlBoVD2zWwlnDxCjaIa+PsEv8+D4U6OW6L/HDVC9A==
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id 00721157ae682-8a45afa5e61mr11724767b3.42.1790146015213;
        Tue, 22 Sep 2026 23:46:55 -0700 (PDT)
X-Received: by 2002:a05:690c:dc2:b0:88f:62ba:512b with SMTP id
 00721157ae682-8a45afa5e61mr11724697b3.42.1790146014877; Tue, 22 Sep 2026
 23:46:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-b4-qaif-shikra-audio-v6-0-e9addb358201@oss.qualcomm.com>
 <20260911-b4-qaif-shikra-audio-v6-1-e9addb358201@oss.qualcomm.com> <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
In-Reply-To: <ba6bcf41-779f-4ad2-96f8-6fcb97ed7253@oss.qualcomm.com>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:16:44 +0530
X-Gm-Features: AclHuK8RmfarfYcyic1FK0k471Xfoy9CjVOJ3A0odhXQDN9UmnemC72i7Itidw0
Message-ID: <CAC-tS8DO3SpVLapNr-VVVQdqQgNMmd8oX0Fizg=sqSs-iNQ2nw@mail.gmail.com>
Subject: Re: [PATCH v6 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-ORIG-GUID: vT5kW7RWAlBy2a0XpzId6RMoa3m7P1zh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX5KADtAORo+6y
 IMEwcIUmGDVPAnsR+oY9Ezq2GL8jD7bbPcsMP8ejSYpFmyBATjBxR/lwA9FpCkwPz6/lOisZqjA
 OrZ2hDN4VhGR62NoKABU/ssJJkrx1ww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAyNiBTYWx0ZWRfX2sjB4rFT1Bdl
 dqg9pNmtRQPt/4S9efrkVp/ExmeilGropa63lkpvrmgeaysUA63awiNSqF6+yzphEEVFLajqOwt
 v8Yb3ww+oaQQYiXnYoLIacMAGcrruuSQLSYJz7AjCRvtPAEjpT8USqoCSYAzT98V+KX1prQUnRQ
 l07Ft/jLfIcH1oea3eGCx6frfr/Xm9nQHRztRW582hChVXwQIwVVA+qWiPucoYL4fjj4aNyYOL5
 baOZ7r0GVnjnSFRr4zTZOmjP3brm97YYT1tW0pgeq2Z1TxjBVUYjxwh5/qYisPr6rWyNyIdzK+M
 sVij1+/mBYHmIQvXZsl40KGeThoP8znCjryW62sdAwpOC1cwfSSPzne7x8PpTMdLU1AsqOyU4OD
 zWTe45LKFGYtXTQPGC9szG+Rwxo8u9ek6FgSyDZQphOuE9EUiLsiAbRjSLmJkmA5GUX+PsrBSYp
 yF9RgwM6Ozh4YN4wXlQ==
X-Authority-Analysis: v=2.4 cv=N828hG9B c=1 sm=1 tr=0 ts=6ab375e0 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=U4cKQ1tlMYw-BQMU8JwA:9 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-GUID: vT5kW7RWAlBy2a0XpzId6RMoa3m7P1zh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230026

> > header for QAIF DAI and AIF interface IDs.
> > index 3a99703dbc4a..f08c20c84c60 100644
> > --- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
> > +++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
>
> Please drop this DAI ID change from this series.
>
> I have posted a separate series for these DAI ID additions since they
> are required by other Qualcomm platforms as well.
>
> https://lore.kernel.org/all/20260918-qaif_dai_id_support-v1-0-ed863c0e5e45@oss.qualcomm.com/
>
> Keeping them separate avoids blocking those board enablements and allows
> this series to remain focused on the Shikra-specific changes.
>
> Best Regards,
> Rafi.
>
Sure. I will be addressing this in the next version.
-Harendra
