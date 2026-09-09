Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7AE53A785D
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 06:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788935198; cv=pass; b=dZkXUMh4s+mrbaEdLoHdraFbsklA7N52DF9GbDdJSHnmRF9lP6fMzYXp8dZUSYBMYfg8SmwN/64jFP4qJaLLus4jff4oZ6YAE7z5GEKHqKnGcumjfHz8cHRy/qPu7JYys2+LD0SUl5Xkmr/uYMJzeCnKD0NKE4dHMKI9ASvbi0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788935198; c=relaxed/simple;
	bh=NKoJ6JE3E+luIRxglgalTNs8vDhX048M3Yn5LzxShXc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DY1KGDYvFz9DP4qsqjqfMECFzoesAm67L6RAGzqAZHjIuuk0KvqY/An2r2AeJ5+wg1BgIttFhrdHK80lej//Z63fwdsNL4cjJdlpxvNZGEpvSYG0NmwDrJctIbm8wotBSRDEy5giv0U0qIlGYCJICBBwdiZAaff0GG9J18UuUCs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/H5nfBf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A7MPN6HM; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/H5nfBf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A7MPN6HM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mg0qr965126
	for <linux-kernel@vger.kernel.org>; Wed, 9 Sep 2026 06:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=; b=L/H5nfBf/HUiNmWd
	unIzWDWxr38VJB/3XxIaweghFfymZGIYjltXc7ElRQUfChY1VY5Rb3/u4PVPAKDa
	4hYs2GtyWx2f+Tm3bFXHhaZ4L+Tp5fBJybix0R/I1LXJsrto2PAilf8fMuGokstN
	tmw3NC+20CfJgYJ5b5gDwKoMXvehV1t6CxU+6xwfwTl7WtENZwAnED3jVLPjmInt
	Oeq5+Dc0qrfWaE/E1AVq2GUGD+0JS6xnWskGiyH2YaOj0YO8d8WyviruKe/gj3mT
	jTlz1FES2ZiW5AlpvbYwxqkFOrFNmz0TFbTuLl+INGdvflkAT0WRxCPpFrAf0g/1
	SpJPtg==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqha2j2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 06:26:36 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67105617528so1019152d50.2
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 23:26:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788935195; cv=none;
        d=google.com; s=arc-20260327;
        b=KfhtqvFEDBZYGqy0xzMcLmXb+63ecAAWXW4JRkIV+QGqonwhmmOcHqfi/NotiiylPm
         l8BObxNmeADu2jUz2fGSBm19LLeip2CaEdO7nmaAspGsLQlzwMYI/KI07AR5Noy4kjqW
         4geM7iQaIsQagultK7TteSyCFEXFyj2VKKs+x7VKhSz54rmg5MpAMcH0+4g9A338nkRU
         7E3QLkJbNSjLoH+3xmyrQirzZmzZ5w+kOUY6BAjve1UwRONDElvJwUqfwGIv/iTENCDB
         Q0uykljyVlR8Z850sdRVgJzOMjJNzJokO3wLI2w3zdFElT3+XrfkK1QSgRFLlwtn/4Rx
         VzqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        fh=6+P8U2fZsRQ/Cqn4/MRjHQcma/+MhMHB0HtIKk0AW8Q=;
        b=hA0aqii/r4U/XttzENI/dKZpjp1TkEZCN4j4hR43E0G7S0UuapVuwlU9edo6Tg+l1p
         AUYADdUc/LtI8Xx9alqWHa3teX7FKj/dlvVLDUOged/GLIzqP/pPnDrMGdwo+L46+G77
         ylAMHrxf98mt+qM/JXWuhY5ePvZKuR5h50y+gfPk7kvSiqQGX7puMZWj40XL+5IUJv00
         lMbTU8m6OxM0rSHCsFB1pUdhXoTD5XaXUfTEE28j8ziPY0KKKFXMvWv8UjhYmb2I18UC
         M0b19mLGiUr77NTncuSwE5mHF1suPJZgLcSdEubQtVjHwd9CPT2bYG64wA2clqYK/NeR
         S+5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788935195; x=1789539995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=A7MPN6HMYDrQWv5fC5ucSz0zVoM9rf/CUSaTI7NYEKXyau+hILqsZDVmedrGtc/eSw
         LIF3pCsJOePH086YjJRAeBqFGp4VBphX4Kp4I365bmvTDeKK9E+9YBY8tXyNl7eZ1zPz
         yDiZ+QNAjVw80SbuW5LPAL36Mmhpzp9z+Aoo6a4r4nMiMixQSmI7d1WY2XwBhfvR45MK
         PBdS/4bQQ1nlty8gW885q0AC4YShGQGh2SXnhIwcngs8Bz/Ckpq/ad1M5k6zv1q5v4sa
         AerlRzzFp7AdQJOGsenT8dVN6VRpfFnq0jBOBzPlQLEBhcTOjcF8aKTgpE8WYzpJowcC
         VHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788935195; x=1789539995;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z9txVF1E2CwqfuIlPlfen4d7jX6bNOZdy7o/BqDBXj4=;
        b=raXDGkASamEmOCQs5qwK9ZA/bA4tPxcwOwV879JYyOIpWy9DTaTlMxpJoL3h9wks/M
         po1D7U9+znLQvfv8xN62BIXA+oe6xNjws00nYFSczynKu1BRyiSqYP7Em0JBnJMxalqL
         gqK7klQkxqf8V4sVmqw0fGL1if+5KXpAw0B1TNIL7pchKtA972+Y62hpLwC/FazBnFQi
         0EoROuL4P9RcLYMYGpi3ijz8K88fW7IVPYbj59puqUjLwctTgDaonPRiNRH2RdXl+kJy
         6YvLVKrA5KzpSzlRErN9D5HctVXdx/g1cOwzxlNJ4ZL1+FzOAgalyh39bUXo6aGfMrdf
         B9aQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkOsG4CVk5W7F4NKabOmou9SeZskBWppOwRpz2J4wH2/Dj064JaW+lbMLwS+pMvJDaplPgNfzQSFt10F4=@vger.kernel.org
X-Gm-Message-State: AFuF++l8i/2IwdauVzjRlmd3FYHmmI9zx2/BPjsBgo5fzjXodG+oAUYP
	qkHdQc3aI6wrddq+vYVCHbyuVn5NBQ46DTkZB+HUnmBVc6+ZVL2ScAbJirnNkbszRaIAwDxuA7U
	551cMHUMIMZSGy+Osa34aTBtAvEkmCS2nHF5Na3zYhzPTNMR0diZqPWj7FHwS676goMsLM0cnPV
	Km+dqWFqDTnxLTtwDnRJxl78rd5Wl77KQOwp00bo37IQ==
X-Gm-Gg: AYBFou3dFruFzVxNd6Qxuul8oTttcETqamvGsVazQySSS3+xFJeMeqTljIHiGU7ILn+
	Fmy65p9ANOEbWHSQ7gpU47i7qG/ISnNUjNpgH6F4wG2KtqQks4ywYlk4U5qF8HEOQzGiKikE413
	rkHHDaFN6L8mvWp6TMD/7XEX9L6ZkIPkHBPWGrOJvlIgHuU3psaOwQ/6YVmQ==
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id 956f58d0204a3-6710b80f5b4mr71244d50.34.1788935195175;
        Tue, 08 Sep 2026 23:26:35 -0700 (PDT)
X-Received: by 2002:a53:ac9a:0:b0:671:b80:e8ed with SMTP id
 956f58d0204a3-6710b80f5b4mr71231d50.34.1788935194710; Tue, 08 Sep 2026
 23:26:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907-b4-qaif-shikra-audio-v5-0-6d8ad9ba5c9f@oss.qualcomm.com>
 <20260907-b4-qaif-shikra-audio-v5-1-6d8ad9ba5c9f@oss.qualcomm.com> <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
In-Reply-To: <a69c1fb4-b1cc-4ba2-81d0-7f6488536062@sirena.org.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:56:23 +0530
X-Gm-Features: AcwNN1UG8vvPTUZsvntZ8kx4jgNLH5GSTTTzIh3U6QIOG3hHK7a5SxUyRoYHjrs
Message-ID: <CAC-tS8B2CFFZ5XvTmUpWj_FxfJvfZ1mu91xML5wABOz07aiWTw@mail.gmail.com>
Subject: Re: [PATCH v5 01/10] ASoC: dt-bindings: qcom,shikra-qaif-cpu: Add binding
To: Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
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
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX6URfimbnVMKx
 sQUEgWmyv7yRBz0GBw4gKSdSU9Xm9KtMBFpevfSE5+VxYLnpjHbV51mKAIbVlf7lTnvEcWIxjyE
 nV2UT99fMjm1dgWlHLAQ+jW1VzIl/8fr+u0nV1SBvkypHL1Hw0JPbvtEKf5wL73CZY/34qZ6oMR
 Zi7VVHYKMFyWoE+0zg104zQh975frfPPQ13dNK220E3pWYl9yMwLrNXXjkAojFJfgg4lye+NP5e
 g0BZcCrjfVGRc8YWXsp/WeCCMWQHK/fbvbbkhKDflFwg+Pkfo7W++hIOmLf2p/GSiEPVapsnHzr
 /3Eugn3o8d88d9IeIO3KLPYt4Qde74gGLZep5zRs9qJi65V1JvzA5zYynwapLEhZcyWhYBuvv+k
 irheHK+fgLG4bTZWIgNRXQY7iFSPQ8r2LAO8DZb0RZ0nKfbFuAANe53nRqNW1QXQv8c39A/gAqQ
 V0JEYNqLOE1mztb2kCw==
X-Authority-Analysis: v=2.4 cv=Z5Xc2nRA c=1 sm=1 tr=0 ts=6aa0fc1c cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8 a=CrgXKhL8gDnHMrsOWy4A:9
 a=QEXdDO2ut3YA:10 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-GUID: 8UpUkWcvASkmubLA7F6o8YXsVgUcHHiv
X-Proofpoint-ORIG-GUID: 8UpUkWcvASkmubLA7F6o8YXsVgUcHHiv
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDA3MSBTYWx0ZWRfX8/5+hXOdNqrw
 smrWZALEPMiBsqVWaFp4Ct1o525kdkcUWHAU33MCFje0fApqTgQlJ+wUi/wLsqVGIW1CnsEJQ0K
 PgLvv3PmNjiWTcdzBkqaXhrFAm5mNtM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090071

On Wed, Sep 9, 2026 at 1:19=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, Sep 07, 2026 at 05:39:26PM +0530, Harendra Gautam wrote:
> > Add the Devicetree binding for the Qualcomm Audio Interface (QAIF) CPU =
DAI
> > controller used on the Shikra audio platform, together with a dt-bindin=
gs
> > header for QAIF DAI and AIF interface IDs.
>
> > +  clocks:
> > +    minItems: 5
> > +    maxItems: 9
> > +
> > +  clock-names:
> > +    description:
> > +      The first five clocks are always required. Any further entries a=
re the
> > +      per-AIF bit clocks (aif_if<N>_ibit), supplied in order starting =
from
> > +      AIF interface 0 for as many serial AIF interfaces as the board u=
ses.
> > +    minItems: 5
> > +    items:
> > +      - const: lpass_config
> > +      - const: lpass_core_axim
> > +      - const: aud_dma
> > +      - const: aud_dma_mem
> > +      - const: bus
> > +      - const: aif_if0_ibit
> > +      - const: aif_if1_ibit
> > +      - const: aif_if2_ibit
> > +      - const: aif_if3_ibit
>
> The driver doesn't request any of these clocks as optional, are they
> really optional?  Probably easier to make them all mandatory and then
> relax later if they can genuinely be optional.
Thanks for your input. Will make all these clocks mandatory in the next ver=
sion.
-Harendra
