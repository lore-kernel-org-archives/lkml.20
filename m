Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B1747C0EE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790078426; cv=none; b=HimZS+0goU4sk3K47iDugRKv54eGsYkmP+VGtCA1D0JJ350yqXVwPbADVGuM70ybRzeiAaDW/MJNvnjKU/tkl7o9bWAXZmB0uAqr3howT5ut68wUVJ0sknVRJwB/Anh6fqiNP6i2HpxLrAA4Vtpu1DzOl0Mik5ZG9u8dMYnliGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790078426; c=relaxed/simple;
	bh=IITuGJnyd7hkwpPEYGZaVjoaxUkycDV8iiciOq/U27E=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pUjsOK8UM3apB5SzicfJSIqcsPHIh/BsbHLml0vofeWz77E6y69TlbHY4rSieTJ+oqX9jnsnypsg09g7z/pqjb162uFFc8zj0jsw3lcP1C8Dw7Y0M8s5ZT2h0UGNUc4TMAgY1hYbOg0G5p2KgN/nlpDFwZzYxsvqW2grf5QSBVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tv97CqDy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tv97CqDy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E69471F000FF
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 12:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790078424;
	bh=6RM4rZOUQ/CGY0vjeyqh4qsEp2qijHYaOlsrJFXq8X4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Tv97CqDy/Pp2O52gdF3/yHVWM42iREArDgyqcnuHDNiCnfmaj0uxfI+npda7+QdCU
	 rmIkY6P/Jpp8qDdeKNEVZbd3R1QHNzBoDsWi0ivAkDyMb0MAVwmIFIC8utInBvCp5L
	 HLhjWPfIZg22fHW2uCqqXMUb6lbb0vnVV5psiEWw4IWcReWId5nuPlbE+cC6GpQbTy
	 OdshfMz7t3riUWQlNAyH+4k8RQ31xtzjRQWgS9CvQmiZim5W8qOxYU/gmGJ102xhTC
	 g7j6H5JNdImOPO9gIir1l7pCOL0HPiuiZG/gPlHndDE/llc2ITHhOJSJwLIFT6ZTFb
	 LDtNkz5KFEkmQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f15cfdso3733886e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 05:00:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx078f3MlOTm3NU0wtSJwzs411a9MzCwVDyoZC5zr8+L4C58T8jV/bGx7UtAxIAHiWp9hZqflb69391+x0=@vger.kernel.org
X-Gm-Message-State: AFuF++mqXr0AhqzWBkox/CJixWLOkAHXJMxq60tBB9s+EzHmhAyLufiI
	0hj1XwlhjkfYJ8ay9Bw9UgORmLb8ADzDbifSe22rObA8RaDyMjI90/YujNAawGfQAtpHF9ZW1tV
	xxYRLD2e0SowR+TvWo120hd5tyR+iHTNm52v/Ox1J0g==
X-Received: by 2002:a05:6512:688e:10b0:5b6:e07:8f95 with SMTP id
 2adb3069b0e04-5b8d74fdd5bmr16988e87.24.1790078423599; Tue, 22 Sep 2026
 05:00:23 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 05:00:22 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 22 Sep 2026 05:00:22 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <03e3cd69-0d7a-4494-bc0c-d6a623f37681@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260921195636.1925869-1-mukesh.ojha@oss.qualcomm.com>
 <20260921195636.1925869-2-mukesh.ojha@oss.qualcomm.com> <03e3cd69-0d7a-4494-bc0c-d6a623f37681@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 05:00:22 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeJtvTW-V2BU-VCVqhs8wWv==Ga7k-8svDCi3LjcbwE_w@mail.gmail.com>
X-Gm-Features: AcwNN1VUJjlhGvAjEhiOxnkoCaI8DflYJv5IiO5T1oY0X2kpNBbh9kbFnSb5MnY
Message-ID: <CAMRc=MeJtvTW-V2BU-VCVqhs8wWv==Ga7k-8svDCi3LjcbwE_w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] firmware: qcom_scm: handle empty PAS resource table
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Abel Vesa <abelvesa@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 12:42:57 +0200, Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> said:
> On 9/21/26 9:56 PM, Mukesh Ojha wrote:
>> The PAS resource-table query may successfully return a zero-sized
>> table. kmemdup() with a zero length returns ZERO_SIZE_PTR,
>> which is stored in rproc->table_ptr. The remoteproc core then
>> dereferences this invalid pointer while processing resources.
>>
>> Treat a zero-sized result as an absent resource table and return
>> NULL after releasing the TrustZone memory buffer. This allows the
>> remoteproc core to skip resource-table processing.
>>
>> Fixes: 8b9d2050cfa0 ("firmware: qcom_scm: Add qcom_scm_pas_get_rsc_table() to get resource table")
>> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
>> ---
>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
>
>> Changes in v2:
>>  - New change.
>>
>>  drivers/firmware/qcom/qcom_scm.c | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
>> index df20773dd754..b5959f833dd7 100644
>> --- a/drivers/firmware/qcom/qcom_scm.c
>> +++ b/drivers/firmware/qcom/qcom_scm.c
>> @@ -823,6 +823,14 @@ static void *qcom_scm_pas_get_rsc_table(struct device *dev,
>>  		goto free_input_rt;
>>  	}
>>
>> +	*output_rt_size = size;
>> +
>> +	/* A zero-sized table means that TrustZone has no resource table. */
>> +	if (!size) {
>> +		tbl_ptr = NULL;
>> +		goto free_output_rt;
>> +	}
>> +
>>  	tbl_ptr = kmemdup(output_rt_tzm, size, GFP_KERNEL);
>>  	if (!tbl_ptr) {
>>  		qcom_tzmem_free(output_rt_tzm);
>
> ^ this hunk can additionally be remodeled to jump to this new label
> too
>

This wouldn't be needed if with my series using cleanup.h[1] in this driver.

Just sayin'... :)

Bart

[1] https://lore.kernel.org/all/20260903-qcom-scm-code-shrink-v3-0-8237f3a654e1@oss.qualcomm.com/
