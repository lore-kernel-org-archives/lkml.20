Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FD49362B
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:00:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787803225; cv=pass; b=cUYj5j7vgZ2yG7Pkq20agHamiOlLaG3dWF8LFGeWxQIwtUSucXwjWmdbrTBYeInJggQ4CirslPjAMnTsKwGWtoQeOlxGIj/h5YGhipvAkK0F0viiVqEyC93CPi9h6lqUXfx8RuMMxR8ykQyzq+uWY9mtVrHhrWN0KgX55pJNv0c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787803225; c=relaxed/simple;
	bh=oxkYlzhhuag4na2JWsclWG8wKntLbGrO1jgX1/Z8KNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qBu5Ajp6gPdo013BI3Q//QQ/yCxfBHhxeW+MYOUwxv7ybhUBMhJZt8Se5uE1H4BERpeJJiWFDNsUr3QZOrkTlupAdEzJyhjCpihPJJ/BovKLb2GF+yoUwb1JiFfesFOMy5BdQlg4lzOfjIUHCFpcuqv8sxDzaGqRwf7lYJpbA3U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JzRmdEjS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RtJGRTaY; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JzRmdEjS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RtJGRTaY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67R3IshM3875126
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=; b=JzRmdEjSWbYhMJAP
	28tOehxuOJD3K4yGSPqxv0LdFqXkMtvZOB23dB/K31xMt7Pv2TA47vpzTgKU7Ezc
	Iq6OmQwp9PjkbDMIby8/ALPpdXBQcnMNalhZudHuzqKgu8Ui8z5zM5ddg5SR8pQg
	RbkP70O/dmvtcu7d/rTsRfVNmLDM6Xvu0v+iuhox2Q4LVtqpNB8QSfnzX+9Eph6t
	qWzBN4p26S2PvFR08DOH96lKGIwfx0XaRrAM+GEfapQN1G1W7n3915+/rEt36x+K
	vqwfehXcuXONIixlxDzuliiaizOLU7Y6R026AVEcSeggZogs1wHXx1ADTOIleidu
	a/zAvw==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ga8m5gvp1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 04:00:23 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-845cc1ab78aso7218857b3.2
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 21:00:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787803222; cv=none;
        d=google.com; s=arc-20260327;
        b=HIW0wp3VVIr3arcMptj2Nh6I3UUZ0IFVURSba54bqAqKBtXGg0OLO3Cu3ILDPZVba1
         Y85Q4ibbkygDUtGGoJEdit1LkM8TLZepDqFeDr+nkgbBMTknK9dt/oddsFp+8uDye2Cd
         LxbR+x3JnqsgwirvZFeoEXNf4a0gzyawVGg+FaCWEYVitsTMnQTnIVVy22o1068haf/D
         MheZVKSaKw5AfqQNOJEcSdJMJ+iHhtCuqU72AKm2npJruDRfjKJJoTjCNO5W0GJcjSzV
         KY2z9lATYaGMv3ju6rwylyX5+ww2vIlAo0cCgCB6Ku5sYGpB+v/hLMG5DnJ6vkyhmh5K
         ZFKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        fh=5Rw8iuDz92dYEK041252syledP6M0teNsUY/zJkiKAE=;
        b=H29gR7vScHb+bEeF52inpaokWuDqrshEeAxDuwPqNL+JXxdohMiosHmbiXHP+3qL+3
         P7a7ZwFBkkQ+sS0x1nBSfm5XAUtJVkhFQgDn5jf0KNwUZ17E5IrS68h3y/+Zdu/48ZwU
         Qi9rKxp+Gy2Sk8cRy8PoJZimGq93NZo3p6oOuH2pfz7VrXozw7Js1Yt/w9XO2NQLa8zU
         9tLMVAMfDWNjI55sVlyzw1W+ZHYgh9p6ujlpDeA90hGPZuIOv07VfmSZpuOPtW7gHi5w
         41GzDp7dggKuWdSz8L6TEZUIw8n/oHxigJqwQA/TXFFnwWPsneG/HujheOq/0i9smxJs
         h5lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787803222; x=1788408022; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=RtJGRTaYBa+MHc5N6c8i8KAzGCcr5ETGlzt6HAAdv8F2BBXRvJP30gLixJ4+AlEpDZ
         NUI3ZPbP8HjslKYvBxlVhQdGUSccx3NOwXgQU/iw4HLcsUA0+hrE+L5Y33EvgGRWTyxk
         S39SQb9xakqaN5JwLEox+ZM9RYoUsN7XDCokZmjJtwmWqrwyPdR3Yhj4alvAbF8v2ddI
         uObet1B5ehVSCdUFv9Nuk4BLo5IQP/9ZFlhMx3iEbQw0DBOTEIyEGqI4aHbt3e2thklT
         1y64b83UOuhzBIau8n3PKLUYlMPDE0OvYxGuubcnlDGmslhEh7qX0/TnqfJrfDyJb4jI
         ELmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787803222; x=1788408022;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BNR9IyKP17sfWdf/ApxRjJuSKp7XlqeCgiYbOHvCpg=;
        b=aT6q5M4TyoGwI6gtjHWS7uANjkMur7WLJHbREiwygWiFDGIYyiHnPIBCUl9GpPGbXL
         IZiARuKqGzW/s+2KTQFUlT7pcWhXRCCJsS4c2UIygOcSJYfX2ra2REx6JA+rTcqD8Pr3
         pjCNBQzPE2d2r6S8DFQnrRiF5C6Z0lKJkcDEeRGBIKBYdJULAive6LdIC0a2d/26fXs4
         wJv7GJbkJ2x3xAfu7IxJRaSrwMtWB6L00f8KSzJQlJxphGcRlN8W1ZpjjNqd9u2LQl9v
         afm9lF8Rfyfb3AE4IsN3qxccbzhx3A9+dxROByvkSH4bCerrGgd1NHVXmZFQDBZDOA51
         fXGg==
X-Forwarded-Encrypted: i=1; AHgh+Ro8wO4dCoRaNec/U7X+houvsFGtoKBOwDdbXk42BXjGVtFCRmcr7ezbJErhzvZmkDAoxwIxHMmw65txmKI=@vger.kernel.org
X-Gm-Message-State: AFuF++lqveKe0BYw2BXqsglGdJLFOTHZC349p3FNtCCJng9pja7L7weJ
	Ah3QbLp0TohZRXBmGHiZDezEI8PLOTOMWV5J9h0zjOny46eszHeUnve2vvKewh7juHc1tQwdmSo
	QpDSla9h6ELfiYEo2VTJeDEi5tL6yGBbwfOdpXkGun94m3sHNg4M5J8NLz2lpaIkFZk638ixW0n
	L1NvSTovK+C/3Fq380ZpJSjgwJZNjFjsCN0c+jVWhEMw==
X-Gm-Gg: AR+sD11HRG66c4iMI/3t3xRsF29NNL467Q9EIPHZjQSs8cgwx3umDEL3FsyBsVjcPA5
	7R/BdvIzuFnnBPgRw2mKDBTKpycI2lJt459U9DOzsKxQRMasvQd8luTMWIZ9zwjRGcI8roYP8T/
	5az/C0x/8TodR3/T3Vu2cb2p5kp4AvW2MmvoNw7vE3xLF72+ZcekI4JrfGRA==
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id 956f58d0204a3-66d257eba9amr3248383d50.48.1787803222403;
        Wed, 26 Aug 2026 21:00:22 -0700 (PDT)
X-Received: by 2002:a05:690e:111:b0:66d:7b7:e36c with SMTP id
 956f58d0204a3-66d257eba9amr3248376d50.48.1787803222014; Wed, 26 Aug 2026
 21:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824063627.3595610-1-harendra.gautam@oss.qualcomm.com>
 <20260824063627.3595610-2-harendra.gautam@oss.qualcomm.com>
 <bf6e42b4-ff21-4b6c-a7d5-024e5b9a7da4@oss.qualcomm.com> <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
In-Reply-To: <d59bd8cc-8b88-4529-8a3c-45358f9ba6c1@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 09:30:13 +0530
X-Gm-Features: AcwNN1VxELkZrglEk7cAJOduQPXP1zIrNjAfvcnJwAH-yznopOZrFR-Fw-ookJg
Message-ID: <CAC-tS8AfsCT+CY44EDQ17NUkhuPX8xT1tA=Soi+UwP6+HRoupQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/9] ASoC: dt-bindings: qcom,qaif-cpu: Add binding
To: Mark Brown <broonie@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: gn6lhnJAiiH5KCKf10jPr7J0F1ij6Usw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfX5b18e2A9AHXS
 F+OA6q5dJk4AkIcEe1vNwvkMbhr+IBUYcd4Cu+Kyq/I9xhsbXNqvyRL6Pwv728EKqogMz6T7tkm
 Lq4Hi89/lmNkVQCzkkEqq43Nnr2VX+A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDAyOSBTYWx0ZWRfX+zyA02pWAi4w
 AJr0uzEIcVhqxREVQUr7KuxshhMyY9TXpwgfJx4n+4NoV9YSYdfqYusm4BK9Li9DoWsC2TlA/TB
 TGTj5THqsVSCUwJVknM7pqpsc0IXLX1lv89mnHv5EIz5lF6he8jgsBKKCpOjI22XNMWz6q4cS05
 UevUqzvVJTajxRM28EuNNE7sUsYjKAGG1Th2AUrhvDnvl5zMP3eQlhQaBxNezHwY89rsVuAZGfE
 3S6fLz2AyarHV19uQzfK4OnGQn2fUVwFKBVoI7xNkzvET6gFugHoDY/vk1wjsok+ix4IYUxJV4Y
 +AhiJG329Zkki5cp8toUBOoRB3Q8isPgxI6EoDLSkVzphBbnHh0mMYxJ5NLgYhblqCMKi1/Q6N1
 cDYr3iMxlq32S3gG4gn5VpAfK+8SlJilzc9k38rMH45jP/Fketik7jbLOQAct+D2+4WDTPEKQ4m
 CCBK+6nITSA2kNvUdcQ==
X-Proofpoint-GUID: gn6lhnJAiiH5KCKf10jPr7J0F1ij6Usw
X-Authority-Analysis: v=2.4 cv=SomgLvO0 c=1 sm=1 tr=0 ts=6a8fb657 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=5jftPqpqXhJRGXY4JksA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_02,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270029

On Thu, Aug 27, 2026 at 5:02=E2=80=AFAM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Aug 26, 2026 at 02:01:52PM +0530, Mohammad Rafi Shaik wrote:
> >
> >
> > On 8/24/2026 12:06 PM, Harendra Gautam wrote:
> > > QAIF routes audio between system memory, external PCM/TDM/MI2S serial
> > > interfaces and the internal Bolero/WCD codec. Platform Devicetree fil=
es
> > > need a binding to describe the controller resources, DAI cells and pe=
r-
> > > interface AIF configuration, and named constants to avoid raw numeric=
 IDs
> > > in sound-dai references and child-node reg values.
>
> Please delete unneeded context from mails when replying.  Doing this
> makes it much easier to find your reply in the message, helping ensure
> it won't be missed by people scrolling through the irrelevant quoted
> material.
Thanks for your suggestion, Will keep it in mind next time.
-Harendra
