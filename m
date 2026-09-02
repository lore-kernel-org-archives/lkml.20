Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2771C3542F6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 08:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788337475; cv=none; b=jXkDErhrL9ORJgCy+NDinLdMa5lt0Ia6lqEFNLeuDsNiIDl/UVtX/Ak2ng5rmOqFCaA1J62+1jnQBQw38DSyRI9ndeppWKsdJP2nQTo+Qb2q5lgw7Z4Vt8v4hDa1ihB9rc5Yb1jCMhwaVTteraTMzmfEuNfFYdtMvFNol9aPYyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788337475; c=relaxed/simple;
	bh=USw1vEHEnGZ577Me1GPxccUL9xDu+6I1Z7yk0147Z8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZtkEkusJKGTOjlq07G6yRxSWt9zVsM5G15/cf9jMyYCqYcccksEK0JP3UBn8NkIo1pMS65/w4xMIV/9LDA/HMP0mOxPDiSCaPb4nj/pZhpoA98ZxriCpMI0Fm0zrZNKmorKYKZ9FD7B3MPwS3J2BZjH/VcZdxR4Y9mm1+jIbTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=binH7OZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZLjs2LGa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="binH7OZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZLjs2LGa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6826VkdD205032
	for <linux-kernel@vger.kernel.org>; Wed, 2 Sep 2026 08:24:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=; b=binH7OZjSuchccFh
	TQeSgoaZ082lvCimYr2/uz0AL8xWGNhoCbRPgif+gh0Rtd1sdPUtuNm3V6c111Ol
	lMsSr83w7FYMfRdu8S1mqr5v3t9quTnr9M9RX4CeXCtRejok91MeSO+qd+6ri+52
	/g/3DvinbHoWNBjr9gyeCRP4quke3x2ov3AhLqgzH4Q+QgBuaOePo1PLwoiZt6m6
	zYbUa88jESItg1CX27yfBdqakJEqRwdiFCgv3RGJTn7YPB1yg07ETa9YmOejKVgJ
	CsFQFXOqWLu3nYGnTSRq5b9nYJkqCZqnpXNcYbCo7TmPIhVZjilWTROZtO31hPQQ
	biPmKA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge1wpbek3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 08:24:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934a8cd3a8bso19175885a.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 01:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788337471; x=1788942271; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=ZLjs2LGapL2m0EWHymMXmVl7grS5qQyIrmJVsQkEj6AF+ly3QMrwL4lJ89KqowwOdk
         h27PYtNwpwHxM/mhsDDEc13LFmPmprObAS91vL94vEczyiQ6fzvxKvqUjeCbFPmiJo3b
         MOlwvhsy68POCed1w+CnbdMEj/aiULhzqASz+/wTdQWymDEBrggAqoSkDOz6kLc4S6dO
         bGd30QiFPuqKlSoPuFGWmiD/xSXQ0zPRT5/ESouFNuIaqzzG9t8WLwq4M401EQreOrIw
         QDXeYFR33jGpIXwCTaLDpddEHCLzeNsK5PuyqTJ2A8S2S1hJobElD9QYmeLrdEUcR7DP
         LBYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788337471; x=1788942271;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zo52MvMbBViPq0rbxALKDgNTDWskVrOQXYF6VoVWBAU=;
        b=W6PuhJYlhtBwHRVetTHpPzStrE4vmYiD/TgOnFoxd5vpsYhbYgNeKGgC34rIGJ3H2v
         Mkv38xZ/VXbMdIppwDuoCOUwInFZX6yMgwCgZFXh2xAr7/hyu2VwCg+3Z+aBSIbN//Sl
         LXFse7DxH0B2UKsazof8wuBNl/EVF6sxjbBWVbXigDf3ymAHFnhR7s6saNHssLLDYPq/
         8m1Cv/W3qvSSaexwibm1RpJXK/OY5vHtGPhQvL08rXkivwMxRDds3EW5sSY6B62IP9Uv
         OxwZZnAnpTvWXzGei17N3fiT0NZU+WU2VgcdYXM0AK6cA4SUzpLLG9+yjjaHcgMdM5zX
         b38A==
X-Forwarded-Encrypted: i=1; AHgh+RpbH7NtDj2YG1HOy31w/IMe0rE9dHxwJ+mCVWLRvdloZ8hRU1TuEac7/mpD6x/EF3FTbNe05bi4nEWoAuE=@vger.kernel.org
X-Gm-Message-State: AFuF++l9wugm32c7tt9SynFphTw52ZIwvG16HZoUp7rXTId0hz7E96TI
	TgunDLBy+gTXBWwi98XFL2mJ3fycOd7Sm6781Z2Kr6/80X0ipCLrdIWitN1hFBC0s7ERzgN2b7q
	SIOvYm+AOxz68mRpwVBSQcpe7JCZBxKL8gi/wwAvHb19dDVjb0Gf6AYdAz02x8be5/hK6nAx83g
	g=
X-Gm-Gg: AYBFou2e0snOAnFERk7ddn9PhBbFa7IggXYtWY3Jscx/tG+aetCcISqedzdgsJTL7/j
	wiH/gHvOGJ2BR2zuQLBismLtbeu7BAE9Kf/3N/DCdG5OzAQykNX8l+0YUgAnGz3tE1npON5GqOD
	XG8My9q8GwzQJMxdKBanrTrnsAs5pfw6B9BPAi+mzFYaaosTChSk1aAl2kBMKILLxG/X0dhZmC5
	VDODj+AKzMM6DtzBkw0Y2IlMCt7NlstAczg4kfbNzdJycnabIWeRMzPXR7s+uhvKkiFUPE638qX
	JxBhzW+KVY+Hl536Pv+0Tg4RNbqa465284XUoTpdlrW36WQjneRSbG6CifUlzGVZw3fCkqhmwdG
	JVmo30sO9t4E8qyLwMqrttQ==
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205845885a.0.1788337471102;
        Wed, 02 Sep 2026 01:24:31 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:936:2f59:dfe4 with SMTP id af79cd13be357-939608b0e19mr205842885a.0.1788337470667;
        Wed, 02 Sep 2026 01:24:30 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25d002e542sm89009966b.14.2026.09.02.01.24.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 01:24:29 -0700 (PDT)
Message-ID: <e9a0a9af-defd-4894-bb3b-e6e19ba3370a@oss.qualcomm.com>
Date: Wed, 2 Sep 2026 10:24:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] usb: typec: mux: ps883x: add a delay after writing
 config regs
To: jens.glathe@oldschoolsolutions.biz,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        stable@vger.kernel.org, "Dr. David Alan Gilbert" <dave@treblig.org>
References: <20260718-ps883x-disable-usb4-v1-0-cec86d0b909e@oldschoolsolutions.biz>
 <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260718-ps883x-disable-usb4-v1-4-cec86d0b909e@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F8JnsKhN c=1 sm=1 tr=0 ts=6a97dd40 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8 a=vq9KN19LKcxqXYNRiqoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: eAEI12jvvgisffvkBkxw-RH4Le2U_Mll
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX7zMjyjJn+fzU
 1dFmIRMrzKV5osJfvnFavWtLZkLcXuO4VEx+sPcXMFbRUC96/S8UtGDQHkb/hFcJkD1oujy51WP
 gOk/kF/FevsZf2jjtwRL6KzV8gNm5N8=
X-Proofpoint-ORIG-GUID: eAEI12jvvgisffvkBkxw-RH4Le2U_Mll
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA3MyBTYWx0ZWRfX5qnnk9kN2TRM
 fGaThvjiRsx2UYrHgT3LlsNqkk4PTrlf8zC8NKtieCBZ5484q/Pf2RcH7HfPadwAul2LIoa8vqj
 lbbN9VGpqP6ujZQS4EYJSMcXoS1RZ4iaHuQ1wRi/yiEDXhN/mW5wK79hAQQcol4HvKjpod2AUHg
 HO2mi4goxk9dhsKace8w1Rg6wc5cW75FYkOgumUR46TPj7QydH/55ZlKEMggkDKWE/xHloQXj8Z
 Eqzb+oIHdJfTO1q6ZSyW+whc2sMAeQFaO6qg0kQFaRiTyq5APb6nuW4EE595bRmJTU5EYYxp3GI
 W7hic/T1nPjGtwHkI31to4Y5TTdCzHVqMXCm+t1LFLT1faaMG2Rw99TIF+e20O4ocsvG95/6vlH
 v9nSB4tGZmONVBBo4dt1JLwcdibhlKmjf+b9J4bIZUV5U4wtdT5a2Ee80AhToZUNB5cHkwod3bk
 RguT+RGFVXY4zwoZzNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-02_01,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609020073

On 7/18/26 7:06 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The config regs seem to need a few ms to propagate the changes through the
> system (like, PLLs). This improves the hotplug dp altmode success rate
> on the Lenovo 40B0 dock to 100%.
> 
> Tested with T14s G6 and 40B0 dock on the HDMI port with a type-c host cable.
> 
> Assisted-by: Gemini:3
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/typec/mux/ps883x.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/typec/mux/ps883x.c b/drivers/usb/typec/mux/ps883x.c
> index 3533d4f363286..3ca2952e6a0a3 100644
> --- a/drivers/usb/typec/mux/ps883x.c
> +++ b/drivers/usb/typec/mux/ps883x.c
> @@ -185,6 +185,8 @@ static int ps883x_configure(struct ps883x_retimer *retimer, int cfg0,
>  		return ret;
>  	}
>  
> +	usleep_range(20000, 30000);

I learned our firmware (which drives the retimer on Glymur, instead of
the OS) does that as well.

With Heikki's comment addresed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
