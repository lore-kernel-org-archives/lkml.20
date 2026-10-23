Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792769867;
	b=s4nZqkyhNg+o+DvvDcKgp18s1jEBOy9RgGhUiOWcPGxXUYZUyAjeokACjTbkkuMyEtQj
	 VDbLvXvqGQ3RhvmNfDjH1yuH8CnvqjDw105/bqk3ZxOPcOH1AGDDpuawUqXKiY1uJT5Rj
	 JYJrFBTH4gV44VnDBY4aGG7WKcPFPX5slIzJRuGx8q13TjVS/Yz6Yr34FgQXVqwMBNNKv
	 PWJPyZFJ4k6KNophth3CGAEvIM0KhPjnF5IwGGexyLGdKq0kU8xmcPI1nsF8qWtKryFqr
	 KQQ2Pjya0p1l/uj+C5z+qPbXVFSdmZI8wmMBKz4rd4TWmb2SNKEYulztqdTnunG8IvQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
	b=XejwcjhDRe1GrJlzF7AkY83LjvdWOBEDdOsMb8CJa3oCvfGd/cuVk+tWqTtoQhN9O2Md
	 cEGZYQ6NxtEbNTkNsVTvJH9O/WxN6O+KpwztuCzl6+cFDWLmdCIBxYHWXUskCnzp1+9jI
	 7CO/yBXFWITx+3RHFcbdeoQ/Gc4h/XyJPYttnFkfzk7W0BFcw54WMnJIKyhOlEKQg1cQO
	 e+adxSNaz2Evt6kpsJaiKCY4fazMj9pxHeHbE9xEm0zo7TU5zBgXXRZLOFAoFvsFEpexz
	 m1HiGzc0r9EJcMQSc174K8fAczpvwAkIgtgEkDEXJC2Xz25Nk5RKO7sWAUfHYaiXQUQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oscOz2za;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P34KoyEp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CDB606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48CDB606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oscOz2za;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P34KoyEp
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Phn3000292
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=; b=oscOz2zakSq427/H
	WOVKkqX88uNUFLv9cbB/hvad0/uIStlwDWUeHqEuDg5HekRLKL4ql8nNTfKhlTSa
	fUoR/oyzzbNvx/LNiuX9oFduwnYjt1Zqfr4wOmQH3M6C5QhANs2EWtv5mJV/pHP9
	OzXoGVtjbzanmY410ZBFvhqeOoRjU6eqAITYZVjTyLu1pClzj3WAq0QEreF2tFM6
	sq/wZYYxOFOPo6XQ9DxCetoXdOXZ4DfV1qCjXVku+jG6WoY6f2NVm0vkqfavYDjC
	919P3qvUJFbSCSduomLjh7oW0PJFX8U/Zsz5pv05RIWbvEykpfGq7fDUEDnryxlm
	nTnTfg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7cn0r1s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 15:37:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4dab94dc3e7so1550119b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 08:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792769865; cv=none;
        d=google.com; s=arc-20260327;
        b=erjyafDQTOB/wtLabuAG2f/In146NxFHFZX1zdda08QmmyzZd/YEKABuS80uQwk8qe
         8RYmRIUCG3OzL8kW73hh2hNtKrPsvsJDysLfKl+pBTJhnQFRGLhomjdkZWZoE8l0w0AE
         dkLwEg/pgCUu/CqFCjp5KtsFXdK1bArJ7HkTf+dvfe8HMDEE29Bi5se4SMm/Xhg2HLYH
         2YC17aYWgoIHJ8OXC6vEtNcDr4N/FRoE0jufEQsHYLABwGOuI7bQ3dW06Uwzs9hDVOM4
         VlVLc5s3wM5Mh6wDpPX3HQCNdL6OXbo8nY4ReiH2ToBus3q5dbLaslkoko/39hq3CTE7
         Calw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        fh=K6wfU+2ZMCxCTI3Dw67F7fZRVLUi7/8bm5rTjNcC2gk=;
        b=pTTFTCsoqLIzjG5tY4ro1vIc+Sl/pCWJyivE5mOZwfeDKcvf5o/po2NUyriiFZoQ3W
         vixEzODkzRy3OK8YzglAfEJe3ugbvJ0F4YM3pAkl4bvIt2pSOCNEzT6vIdxzV7qoM5QA
         /ZuMQpuFQs/U/6wuLU2cKEEhkCupMbh6NCypxU8qCkKjzal5uSnPv1Fo9jEP0pomxlz6
         4gJW6DASS7a0BlnPBlY1SHcpWWzSLocMq+ylIRaSY/ybwAn7eziqujN9IotFbUbEyVx3
         41sWzR+q0EhTTOHBTaC1F6bZ7ZM38MdEtQnEi/Q40bNJr1OGCcfmzWjEjvvzZ7n9HK2q
         M0yQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769865; x=1793374665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        b=P34KoyEpcj8qi9nCPpR1VOgOsMcNeP2Bx44QoJERS6Ve31jTerLtTFn9P8AsH818Hk
         AGCHH2twc30JM3uEHK1mspQYdUD6UE3fQpVJZhTCetEd3ySC+/SmLwhbF0lScXQ1y3Yk
         UODEuWVSQpaCNRqsW1xJHL2tGIe6/WDtuQ5HHEDXFSxrjzV/mB00SeXbFolUXQ6Fn7cf
         1iuA/HdsqfQsV/kZThLBNYkT8GsMU9RY6mYzb2OFX8b+J0q0DmDJFJosm5GMPEcjKjUc
         wve1i/qT/AvLu+EJzJisFnxyQpb3oYrTjxfLAuse/izF5B7SndxbXCG9L+LK50N2rSa2
         3uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769865; x=1793374665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        b=uTazgYZgFBg9qJ5epD9ZOauD8nyaQvXn0WO32oGUdrjcbT4fvfyLQYEKWdqYCYrron
         N7iVXdWMgkjXBkoI9N+90UsVDw1ohfmGUsaIKc3YK9eA1maYVYIKLnlenJ+Wz2ijian1
         ERjGrRjAsXGkeXz37IdDQn0tmqN5AapiOEe1ic7VWdCm0MYL+StHfr4wU0R9FmC+EkFX
         QS9XbzvmIqsVou1TIvA9eWF2UzZPH+wCjl6dEYEmfXEVvblf0b+gZ8DLJa57WxkeRYUP
         wq1UkKeYJNBFNEZLWq/Q7rOZrpgoPJhI9Yl1S0RgMXLMWi72KDlYCv/MzNz6EwZmt5/n
         OnjQ==
X-Forwarded-Encrypted: i=1; AKwUvBySSbFdp/qi8wiXsECq8rEJMcKXE/LQud+S7BIJHHNI8kmAT6JoRdW3lhiVPmPLV0Wie3ikC0CjmoXFllQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJupAJh84QV3a/QF92ybPBPkJLyH02xr4USRumggeQDpdY3w3As
	5EahSyEcv/VxPXSA/XJ+p/ahAhVgxhrqL9W0L6GflnPMtknsJQUqUwzT5+jvzEM2BimrVsbaOaZ
	ksecq5vpkfR0QI6DBedGJHahjwiabZ/MlRBqjBJ2bQRnONuzpWxnmDnmfCeCCjeKYMZGN0qzHH0
	dFViwCouUdEpR2mUSHoV4bbjYlf9d0HdPSBgnGXFBFMw==
X-Gm-Gg: AYBFou1T7Dd7vXkcL1PWmWV0oMHE4JfMShXmsnrF5aEUeiSpCQBuZUtkhcvNvdNp8li
	w/Q2t+QHQF5kN75WvbrV/vrjwFVU2s/Tvy3j9DeMxnFs60OYdaCdTT9KHrd2LZAoxTOFRhe1r0x
	m020BUWxh2CW3WuAh7HjAMkBwWXIY8eMNZt8L4a9HXNl+uttg2lBtdQAlRYsVLzGalzcGyOMAHt
	G5Qu0ylew7J3Tx3vkFXfkcdDCR4RM9t7tTMeWWuW83hUDdtkedPETOdHhQKpiylW6/QMcb8zUA=
X-Received: by 2002:a05:6808:470c:b0:4f8:4a95:9969 with SMTP id 5614622812f47-55be85f894bmr1777817b6e.15.1792769865447;
        Fri, 23 Oct 2026 08:37:45 -0700 (PDT)
X-Received: by 2002:a05:6808:470c:b0:4f8:4a95:9969 with SMTP id
 5614622812f47-55be85f894bmr1777788b6e.15.1792769864900; Fri, 23 Oct 2026
 08:37:44 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:37:33 +0200
X-Gm-Features: AclHuK98d0P5yH7QJpyoncKDu7si33RmQoO6a8dZ5w8x9_6qeviYUDBD5TuqCZo
Message-ID: <CAFEp6-2rPeLXwo2uRDm+xTW_MRMcwM1BsbE0hLU9+S_kGdgOxA@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock
 rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfXxlwspgfgF7tG
 YwbV6teSxiq9pvPv2cIoVI1m6eI0rc1nF465j+dPtvZKcM4pNttqZh2fFk3JBzFPIcDumIkE7iR
 kLGReL9KDOKHuTh+cywZzrKx30o3NRQk9rJmHFpP+6t99LvLyAV8I3LhlYwNuPV6tgFrQk4HOFF
 ALUFYWMb1+lcGoLeCCTH89gWqJRCvapcA4xc1E4snS72jFinNaZn57PudnRQTGO4M7UjGUe+Jza
 aJDV2sHS7NvJx8OyLgQ07iMX3YUkWnZicRchznyYkdEslbaujluJl8cA5ui9sZcJA8Avqyt+i8n
 i0yfoiYTFiEWWtlVMcI7Gb9Bq+L+7Dkscxs3EHFUiSEj2/2lvk0IJfaWkUSGnNo9mvr9d39Cqd2
 NWByqbL/LqfWdlbRkQlaf90k5bvAkRU6l+fned3PBgw3qb5rRZFpuLaTDRokYg1lBQwqOTvsDUe
 Q7IpK9RLPcMQigdp8Rg==
X-Proofpoint-GUID: 8RTZtrMfsFnvRCR92kZE9XulLCXRBylY
X-Authority-Analysis: v=2.4 cv=a9mlZkSF c=1 sm=1 tr=0 ts=6adb7f4a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=u2ZE8GkQQ5s483KH7DcA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: 8RTZtrMfsFnvRCR92kZE9XulLCXRBylY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfXyqYpLwtRQy3a
 m1L0D2K3hhFHUsY70lGUigCBUfKTwZqLRDDvsy4QJWBPvik9srbFX6F7P0wdEuCnR9ch6io4ZfC
 MgNjDVOmxBR9tE63eN5OtaKOF+R8JLQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230061

On Fri, Oct 23, 2026 at 5:29=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
>
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..7fe12049b78a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_a=
reg", "vfe0_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 350000000, 475000000, 576000000, 720000=
000 },
> +                               { 0 },
>                                 { 100000000, 200000000, 300000000, 400000=
000 },
>                                 { 0 } },
>                 .reg =3D { "csid0" },
> @@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_a=
reg", "vfe1_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 350000000, 475000000, 576000000, 720000=
000 },
> +                               { 0 },
>                                 { 100000000, 200000000, 300000000, 400000=
000 },
>                                 { 0 } },
>                 .reg =3D { "csid1" },
> @@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_li=
te",  "vfe_lite_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 400000000, 480000000 },
> +                               { 0 },
>                                 { 0 } },
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
> @@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_li=
te",  "vfe_lite_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 400000000, 480000000 },
> +                               { 0 },
>                                 { 0 } },
>                 .reg =3D { "csid3" },
>                 .interrupt =3D { "csid3" },
> --
> 2.34.1
>
