Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47BB3AB286
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790574300; cv=pass; b=DjN/NZdv79bkrYs8YjD7KDZaWmoqbMXsXdhPuAky+1ZxmpO/nbJTVik+OFJMETHGjYHdK1YN/sOTLwjOU6bAFT8OITdzW9yYEdHUURq9xBDJ2gGxDnOqfV73qygTpF7tbgIuX8xBJoObnN1kdkWOTwOgZa6Poj/CcGbmGdfzJfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790574300; c=relaxed/simple;
	bh=I9Mp/Py13xSxFWieB7EbhwjPp/EFqEXl6CXyIvK73sY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DTjVgF87bZ7IVHcBO2Tt9uNUY6wrIHV6cdUiGy/Wc66xKhfqfwf6Q0KbcDVoFHXCUV6lomhkUj3vcsTPPZuCZhdF/0jzDkg0tXFAJ6MSCfUsbyKN4/NcuZ1drH4leESgMN628xOCyA4CAkYi5h+oA6y21XDS1X20uhY8jiSc3RY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AnlEQq0r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OKb3OSTt; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AnlEQq0r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OKb3OSTt"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S1BC2l3455877
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=; b=AnlEQq0rZX1irCcW
	e1eybMhm5vHLxz5hTbuHab+sMTVHDvt6joyW67y35GODMR06qdkalK8lqGw2/+kV
	OonGx7d9eWraCLsJSZtgG8CuOTY2bq1qEQoWyBXfuvcZMwS/80AyTrNvyFPaZe4e
	BhKW8SiuT/f6X7LxLBZw8TLjXdZApQ+0qhsImm8lVdD5bGieALA31FDkFDZu+WUv
	XqDtkqVdQbG5MyQaHyDFtSor/TfA+vjLzzrjng4VNN3gK4Ck4m4dLzLcvC3s50Qr
	HHCy7VoQImDgYYgIEC0BVSRgG9MIRoTnbTftATleLWUl6y7MkBQqk6Ne2jHCZNL8
	I8ZnnQ==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq0nwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 05:44:53 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-67415fd800fso3207254d50.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 22:44:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790574292; cv=none;
        d=google.com; s=arc-20260327;
        b=i+4ljkanR+nfefYO8su+980tNhGgnrp3cUzUu84oVrF/FGwW44rn3d36GqM0OhfoE8
         1u2SkHQtL5bOwrZtw8XArSiRiwbxNTJAm4Yja998pgQ4v5ILV/aVxBh55WC/2PreU1dP
         LjFpSMX8KjznJFvNd6vNcS80KOXjg86dHPaG+kWqSmwxvQmFsQ/SZSzEg8Tt2cOOj3Gb
         CKwHhUbomttb/XQpJx7su3xNMJ6ZaktGfaLy6d69+PcCXLYdKKifsaytsWXOnSQ1UEY6
         itbnakPoyJ0CvZ5mZKEgktI4PbI3GYX3evTMS9mKeWKW3FTI8v0g/aJ9nbkRR3iEr1et
         JHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        fh=2d1tOto8D2VywKJcsdXr0YmJuoqCSlzDZ30uLXPQfzo=;
        b=OVov2poazFG6/6ZTtMQ/xkXQvc8RGwxfLQWGqsB7NS7+qce53XtQ3FJnrITz3UN5GV
         wIxyqWX9MPXqoL/tdvPUUf6dQD/Fs1+Yy+kw9KDglH129h36MWOU91ba1VUpSj44rEf8
         y7wSmn1IenHGEdGSijJeSP/ghjgDua/ikfvyAmqWJ8uR5m/bLS9z3gqdGRwdHN4UhVTB
         SDhaarokr2U7Tjg+YAHa3WAt0cJO8UJGSCjdz7StjADPNSvjf5cSOXiMYjNYV1AkCCbm
         gfJPKI97SHYH2pr54zYDrikRJv6QCCsj35I788EXL/uxB9CxCFzD3bpSE6mP4cQCgjCl
         FFRQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790574292; x=1791179092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=OKb3OSTtXcbXxLH8ak6HbUTJDuH1q+y8yM5yRA9SW8J3ykfhl5Hc6bnNPSvn9+Jp8v
         WRfIKZveWUD+rlcvc/Durj01iyy5KJQnTL/wVBZJ4xq9Y7f4hdDufiGLEAfgE+YmFBp6
         yQhLjAwUPDYRZqpMKSJ+ADN1nFTYREDQaAj7uDUszPpsrUlqTH0MP2XxA4outVFN/703
         1klRLVqapIz2UNc0vsbj6ZxUkeCkOgzlDLjOxE8YniCKzUOLsR+xGMYN8F4efgjv68/Y
         yVfNdnxFeqg32Dg7YpjBhJxLAsYfK8aQMIUzOuAeGe0MNHnrGHI7LDXrTnCph/UgLiok
         SCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790574292; x=1791179092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LwgxT6g7CzK/lb0vgQ1MfEf1Woq38eVDHc4Gj0WfteY=;
        b=hv84CDr8otQeYQDQA/+kU69Re+ns6G/r9VupKIivEmpAl1tyMjgJq/utMpcvqi7eHV
         w1BYlQxLr8pA2Xyj3l6dLcZ2oZzQX99gmaGQHubcJRmaJmJEooKsMxu5gNJ9DZJQUsw6
         E65IpFi8FKFDoyktwbm3HxUrU7Jkei3pE2AB85R/pjLlQOjVc7xDRY31afvFls4yrzld
         jWYCAOW7W37N4o0JK+QBrdIFFD4LolKr8AYniTmB5oNw7r0KsXjgGXwIziRy+vhehoqq
         l8UYjXZcxfMEFNN1tHeypdWjc/z3XMSN0tYzJzVHRvLyi5g/cje6JskkQWIe3CV7f5wh
         StdA==
X-Forwarded-Encrypted: i=1; AKwUvBwiXqL08lEGEHfz9HpeWBImGehciHM4ORRJ9pto6icqZA+cbd6OfYSHj0orXKXhH+KUqovHvuEMg2fVjSo=@vger.kernel.org
X-Gm-Message-State: AFq9FYLyGt9/nidCyFmryJi5FghkCEwFzKNRU6nleXUjzHbc3XG0jSEq
	kx7sJfbj2+Z9K9BfXqGRrPyydtYgTTnSTYj3gpm5afKHnaxCONRg0abRKo6GvJlwiVKkQKO8sYt
	ytdg67fyykkvuGZw3ZVXROrfH3cHeX4ivXpn/qAmnUyr6ic0tO6WURWjWEdmlfw3UqwQc4N540i
	7aCp/iaYnu+piVbfZW6MZKndSViEb1GFKZQt/DbxrM+w==
X-Gm-Gg: AYBFou16QX22E3IBrBmW6Qp+KSKXjYnf6u1poYBiK4f86LpoZyW5QxYHx+xIBjDtaNM
	1kxIV1vjb4ba3yJyYC0enL7TLpOIQVmj8EfOf1mI6cs1jWJKdBGqn2IeSaCbYcbpQQCf95oYLhC
	D8X0hSckOXRTj0nodB0UJhi+bAaL9YhzxAqXG8c/zLDEeXX8fn/PM6wdPgAjo=
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id 956f58d0204a3-6741cc07025mr2873107d50.10.1790574292221;
        Sun, 27 Sep 2026 22:44:52 -0700 (PDT)
X-Received: by 2002:a05:690e:4004:b0:674:1cc0:3523 with SMTP id
 956f58d0204a3-6741cc07025mr2873087d50.10.1790574291796; Sun, 27 Sep 2026
 22:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com> <arObexxuRRmQ5qqw@sirena.co.uk>
In-Reply-To: <arObexxuRRmQ5qqw@sirena.co.uk>
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:14:41 +0530
X-Gm-Features: AclHuK8wlZTyoF8oTJGu3l_EQgkbegRC3BqnooxmGUCthXkptRkdIGPllML5mPo
Message-ID: <CAC-tS8CpbnvV28AtziXzOd9CTCwN8ToM5JqFXPRn-4h3=GAGog@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] ASoC: qcom: Add QAIF driver for Shikra audio platform
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
X-Proofpoint-ORIG-GUID: FwA1XK-wZgsojssJg1aZrm5qvDaKXDn7
X-Proofpoint-GUID: FwA1XK-wZgsojssJg1aZrm5qvDaKXDn7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfX2WKgVWWY37T8
 lTWHwq5G7ouJsnXpqYahZnXdfrxARIl28JQqcGb8BrfmCec3aTlw8qkr0a4UcSKAIwTO+/ubJfT
 VRMKB942M/VV1dM3IyCOXWoS9u8vVJ4=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6ab9fed5 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6K1A5ce8U_YVOHI9IiYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAyMiBTYWx0ZWRfX1xtgKTSmafP/
 KBuwfPFd+J2SUMZZJj8bzQWekGRske4q/6KgOVqJidzZ+WiMS8hPdXSaUDi3Sf9wVVzV9uA4LeL
 BQTLws6woYXdEQ+5cVjtrba2xh0ZTeRJ5+9msoWxSebrcNaWOL8dUhUJcopTZ9GJVJjCBbrCqF9
 /ELBT1Q/ecv86UPljT0FBch0PJwjIn2taXKA6HMhXBRK6u+InUpBMLFN2e2yiuWTXogCDVMu8Bf
 7ytYCOqYfCnfM/F3+EhIrlFG3/OycJdEMFLspWQ1ZXVOefe5q1DMJWychUarNqewizyZ9BRMVfv
 q+UWkqYXi3tmX31McswvgIwN5Xkv/fDhpjtl1LDYOSpRYZs11WWxty9IqV5mFtLliRF7WpAApO2
 r09zYGJxvgGLLCrZ4m8Nqw4b+pAw8uKoOzD3+hDqfr15WzqI35MpfdpbuTfYPWhJ52AcN7IqKQt
 ytz1CESY2PycwBN0TfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280022

On Wed, Sep 23, 2026 at 2:57=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Wed, Sep 23, 2026 at 12:18:20PM +0530, Harendra Gautam wrote:
>
> > base-commit: 46e864b539a2d2f6c0e5d08623654513ee50c556
> > change-id: 20260907-b4-qaif-shikra-audio-729007ceff72
> > prerequisite-message-id: <20260918-qaif_dai_id_support-v1-0-ed863c0e5e4=
5@oss.qualcomm.com>
> > prerequisite-patch-id: 446fe28b27dbf5ce4240704d89296a5af69e8b21
> > prerequisite-patch-id: dc5ac9645789f25b3742dc4fca08dab4c1e4826d
> > prerequisite-patch-id: 0521512205679cad2462ecda959239aadc48cce6
>
> So, this does actually apply independently but does have the
> dependencies above.  I have repeatedtly asked Qualcomm in general to
> please stop sending things with in flight dependencies, it makes things
> very hard to manage.
Thanks for your input, Raised with dependency to avoid any compilation
error. I see that the dependent change is merged, and will raise the
next version without prerequisite or dependencies.
-Harendra
