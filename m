Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D4F3CAE66
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 09:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788514895; cv=pass; b=U1e/sv0dCPGxEW9PJEtY4uxwtw6QVCJ7annNfQpCjNuqnUyP6ihsEZLxA/wvusQWxQ8aq/MPVjXL4G64Yiuvyjn0GV5YXuTQY5t3iBfyuXJ5E4x7N8fexoiI0SF9/ZqOhygFVZpcMclfOPLwpWEXayLk43MUYtqaxSF6HgKlfAw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788514895; c=relaxed/simple;
	bh=aeIbZ7Iqe67MQUbdL30yfOYMS5DGGUDI699nLrKwSTI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OCOUvkNTB1M6mhj+Kp2JsYXXBdv6fqNDgGILGxP3CROliZGWp9zEw1nukwM77EIOi/gCNQsbTvCZDmXGURy0jczl9WZbG8iSgPxP8Cb1o415pl1x6jiThkfoLH4vcJEmbHk+1boaA6kRdsluoWTTLMd/Ck02g19Q8eQGu7Zaqcg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i72Z6a9K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A8Ihag5g; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i72Z6a9K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A8Ihag5g"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6847mfIY2945685
	for <linux-kernel@vger.kernel.org>; Fri, 4 Sep 2026 09:41:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VI7GobWclG+P/LAGHzs6kL80cH1L+yzTiHPraa21oAA=; b=i72Z6a9KXUf5KnGC
	BQonw6JeT+Vjv4bONkiN5R/yDVYIy4owVbuOPcViQ2rgdsioq3JFpI8fDPff+J13
	SBrDNXi2c6ZJBU/55j5rdEWi4AH2gMUk7myZfe2KJ7yq/lQENXcTlmOrHymAn+RK
	1okxZnHiy9mF9JRuYYCZeD69q+Fsnt1HOUvM54W+heRsuAPKud8Rx0TmUng+bLcz
	t2NTi0363Uz6ckoyx2DYmRrDG/oKK0BRouJUiOBIx2ctjEScgjqdClPHa9c15Ht7
	X0fE0Uykud3+DQLIg9Lli3VWMrgxQ3S3RLfgdNEwORppGHKokMOvEmpLAPtM82bm
	+g1k6w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gfqqd0upq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 09:41:32 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-855f662439aso1516861b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 02:41:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788514892; cv=none;
        d=google.com; s=arc-20260327;
        b=ZicQhx9ljCq6gGRoufBqS8xnfw+WzM1VxRzT9cHcoEYtIbJkw9MvuV1b48EJhPNe/K
         GDpNgD9QM47mPtZe1ck8MhgNKlmd6G1xPwpxXrS6fmnm4eZbhlZTwGjY10VDC7E/g5Lr
         k11sZ46WRmRJ7k/2wSpXwBDwdwjlbFxLAVUk7PFVR3OxVUbJfvOmLSNuwKbRCA+9r9qH
         VVU2nk98Rjhrv3vW1Abm2Pxs3lemfJX89xK/oDx2Fvuco15Q3PjyAfCivd3XtzsQ5yrJ
         yqCe57dNwTNLreD22rjrWEpscWptitrpLtTZvaJ8VfIY8HiOdAgJ3kKq5P2DxSWrG5wb
         60mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VI7GobWclG+P/LAGHzs6kL80cH1L+yzTiHPraa21oAA=;
        fh=kI44WUIyzkZgS3TvNTocd4g14ZBLAbIbAFR4pGjb0zA=;
        b=oBbqeC5QLZowbpMJr342Rb+GhzE6pprhWx/B45h5jX4cK3T7rh6EPCELfupHA/s4L7
         UTJ1Z95WEqO3E0GsryPZBhm8U3rYX7QFwpoORMUKzXpTfLvGxvSKXc6ApH4rejbaimyJ
         AdWf7FWL943qE0rZqBmA9XDL0lly7f1qgyA7v8PTYcpqBIYt7QpNQbOwaI2wNFyJDsnb
         dg0uK0EYi6EVxkzQXD+z7Bzv13vb8ZJJ33Ja+wtWTKk+HYBTLS4RQFKGQzdUjf0lvDrx
         yvVFLg85qrhBAm7uoTbpvKISSWdUkotVvKAlgqx4p/8Rk0/F/EQsfiXeHKpCRzwh4SRg
         MaUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788514892; x=1789119692; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VI7GobWclG+P/LAGHzs6kL80cH1L+yzTiHPraa21oAA=;
        b=A8Ihag5gsM5mseZmVs/nSzeGC4ZbtJHkUSDmWjug3v+SEjloN0mP/eXWqtyUgqm0wG
         DP3BD0MDZgL807UPOr1apyvtAIR+IYCOsyAHf7lDlap2b4UB09td0k+YjmIF+w5aGF5b
         tZDX99hCfyyaBsm9FGiLSEVZe5HmXJxwCkdrDfny2ZTJEtONQQPSp9rC5YihI/zuiRC7
         CnAqffipYLInuLwDrsKERAh5GUkYHOn1KiL5MB5v61r6cIUJPbIfA6C6YpC2bUAFnXai
         vMmcQkmibB4Ee79xU1b3/7LCdvHUflQ5P1DHjKDfzOg0DYEyLweidrKvwc17pT9vDWzV
         nP7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788514892; x=1789119692;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VI7GobWclG+P/LAGHzs6kL80cH1L+yzTiHPraa21oAA=;
        b=qBFywbsuIFYBDDJgusiuoKsueXFekCF1CB4h3Gi9uaLIIEwqMHjoyoF6odfX98QkmH
         CsdWE4Jcyd15mN+oxy5UJMSjpYE2utaAC0J44pZO0QW4yvXCJidRHn9j1j7LFaz6Ty00
         9GU0Yp5l53aOs2HufDzcQqw6w3Jm/hGHTexFVhY6bCFCgV79/yyP/mZZIjuQJ+SVPdJk
         3oK3Ka9oiIxBsbD4/QBg0ecRm7khyaGZ/pkQIsfbFjmT5XrX/unYjFsEwqrTQzAgPJpf
         U90/Jzrd5Es44Ck9GvSCkAMC5dfDzBH/hu9x8XAtcyPqMTO2qJk17cCgnNZwYGmMKskc
         mRDg==
X-Forwarded-Encrypted: i=1; AKwUvBwdwUF+DA+03U6KeRaA9MP3wnGbXW1Bk9vxEzITqztxN/ZrchcSYa6rcoitHeKZ2V7E+KlVO/3mj1bEpEg=@vger.kernel.org
X-Gm-Message-State: AFuF++maHtdAp8Qwou9IKEU5UaQCrwCArrWM3qF1CXi3E2JcQLBEL+Y1
	v1Bla8Jlfx6Y9vTMLnfHzdSjCOgxSMAstbyKyYLjTIGzt8q5u4zkYBQoRHKeFrAqFZDxw79jd/J
	oOthry2iyL5fkkyE6bn8HvgGHKtuLqMPsQJr2gEk19CgVtKppS0J/O6eimh0g9Woe6PSK5Wv52R
	6GxUEFmm3hsp5H0ynQSdjyWbz0uU+VNkz6+cCzR9d47WQ6+yfPHg==
X-Gm-Gg: AYBFou1tCnQZU8hZHzJhYaM5GorVWo7OHxQFiybgc3lVG3jPmn5eoiDljhB1Q3doq3Z
	b/PtiFIhIcNTyu3V2jPuEGj4M97redZgJ/SCs9iVwrHTz4WjV9M1zprAxj5zDaQPGVs9wGkKipT
	r13m+QfHYekgmqwHlsndsSjDb3rt5oL94lO/SpDt3o6iXLUqL3E/0ggSYkJw==
X-Received: by 2002:aa7:888b:0:b0:84f:dfce:966b with SMTP id d2e1a72fcca58-8616a06b9eamr5822378b3a.8.1788514891639;
        Fri, 04 Sep 2026 02:41:31 -0700 (PDT)
X-Received: by 2002:aa7:888b:0:b0:84f:dfce:966b with SMTP id
 d2e1a72fcca58-8616a06b9eamr5822324b3a.8.1788514891229; Fri, 04 Sep 2026
 02:41:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260608095523.2606-19-david.laight.linux@gmail.com>
In-Reply-To: <20260608095523.2606-19-david.laight.linux@gmail.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:41:19 +0200
X-Gm-Features: AcwNN1XghJRFBri_1kHjfvi2ey89ABXgLFgvTbim4Ym2LDpNCA5fwc7QdZp97mA
Message-ID: <CAPx+jO_btBTkL2Ph9rM6er8SZkSqOB1WmuHhtr5vGBXtwcWxRQ@mail.gmail.com>
Subject: Re: [PATCH next] drivers/mmc/core/sdio_cis: Replace strcpy() in loop
 with memcpy() outside
To: david.laight.linux@gmail.com
Cc: Kees Cook <kees@kernel.org>, linux-hardening@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        Arnd Bergmann <arnd@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7M7UI8hHfty6g0vZLLu8GFnV8I0X3DNj
X-Proofpoint-ORIG-GUID: 7M7UI8hHfty6g0vZLLu8GFnV8I0X3DNj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX43aq+kyYyxzo
 EA5Bnzcd30TjtBJRT/AqKARgAiyEj5N13zQZiyYIv5VDFKg2Dpn0E/A0E5a3XgL9Ba3MCo2iM9R
 xGklIa+DfYmx6FkKnCvxurNk3jlst4c=
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=6a9a924c cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=pGLkceISAAAA:8 a=_2Zrk8i5Ywt6DdIg7-0A:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDA4OCBTYWx0ZWRfX0K2QCrJxoWfi
 xnlnQbrXsquSqJlaVeNA43i5xmT2I4mJS1Fscf1N7eADfajXr9FvgfTsDNqsUgFP4OD7Iw5AUWG
 HRLUOI0ssCVppZPYpTiOyOe0Cddwen0j+zx80VRFR3q/vaQJDED+QOtsmoADzu+5cYhQRk2N/NL
 KnFpuKqHhl+2qXNjBxuAjd+IHlnB7Bfqnhb509It/HVoIGra9WwWfE3trVTUwgMNSp7qnEztsUH
 kc81djQ6+UGAUyLzbMReXlqR1uIohdrRoKOBTEtvPfn8VUvaI63PGUBFJveQ+wW+KEYhRgK1R3+
 6EC7V4QoAcKSwkIuL03QcGBPtvK1YShIJebsWhChJNsCUYqAoRzP/3PGxACeqtsXOB/trKffnPD
 06F6vNV+DjHMBHP1v+Rjh4uFBtGZt8Tk+UIik/hBlAhe/7aYLFX9RG3g0i1Z3N2V9LzQW+ssCni
 vxaU1z6Qgf1CxlRDpfQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040088

On Mon, Jun 8, 2026 at 11:55=E2=80=AFAM <david.laight.linux@gmail.com> wrot=
e:
>
> From: David Laight <david.laight.linux@gmail.com>
>
> When copying the info strings and generating a char ** list copy all the
> strings into the kmalloced buffer outside the loop and use strchr(str, 0)
> to find the next string inside the loop.
>
> Removes some strcpy() that static tools might think are unbounded.
>
> Signed-off-by: David Laight <david.laight.linux@gmail.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> This is one of a group of patches that remove potentially unbounded
> strcpy() calls.
>
> They are mostly replaced by strscpy() or, when strlen() has just been
> called, with memcpy() (usually including the '\0').
>
> Calls with copy string literals into arrays are left unchanged.
> They are safe and easily detected as such.
>
> The changes were made by getting the compiler to detect the calls and
> then fixing the code by hand.
>
> Note that all the changes are only compile tested.
>
> Some Makefiles were changed to allow files to contain strcpy().
> As well as 'difficult to fix' files, this included 'show' functions
> as they really need to use sysfs_emit() or seq_printf().
>
> All the patches are being sent individually to avoid very long cc lists.
> Apologies for the terse commit messages and likely unexpected tags.
> (There are about 100 patches in total.)
>
>  drivers/mmc/core/sdio_cis.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/mmc/core/sdio_cis.c b/drivers/mmc/core/sdio_cis.c
> index afaa6cab1adc..0b818cb478ce 100644
> --- a/drivers/mmc/core/sdio_cis.c
> +++ b/drivers/mmc/core/sdio_cis.c
> @@ -57,12 +57,11 @@ static int cistpl_vers_1(struct mmc_card *card, struc=
t sdio_func *func,
>                 return -ENOMEM;
>
>         string =3D (char*)(buffer + nr_strings);
> +       memcpy(string, buf, size);
>
>         for (i =3D 0; i < nr_strings; i++) {
>                 buffer[i] =3D string;
> -               strcpy(string, buf);
> -               string +=3D strlen(string) + 1;
> -               buf +=3D strlen(buf) + 1;
> +               string =3D strchr(string, 0) + 1;
>         }
>
>         if (func) {
> --
> 2.39.5
>
