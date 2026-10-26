Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793027044;
	b=oB7R+CdxRAz19haSX8YZSLOMB108b2BbzFRJ3J+twKa7XhP3bGRQT27kmzKe/Upfnduz
	 QbGzShuNiOG0hCRfuusKcIqiZtpVYPRGiuX7qWkwWiT88dRT/E7+D29rqlT9K6C30GbFz
	 kFNmUG4wxGLCXJxLVnxY+p9b2FbjkhLYSZ1i1Bk64i6gqCchXo9e19so6folDshikUL9E
	 Zs0e+ngh+0h0xTNZcpkAoDVS3ny+o46GwAizZEfKbR8vVoCIpaBvuV97K48FT6UfWUXr6
	 Ml+S+N3aR/Vr3COUVlJ2rUhnZCnFqiEnumHAQPTp//gACsjEJ3bk6cMd3js3JB6SIyA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793027044;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
	b=qywv76nZGo++gr+pKA8azxYUxcfQXMEk8V90w1KAY9lAty4Nbt1mT4RAnjwogxBxIcYp
	 3rsK+o9O1lxq8/x/S19QVqyvtr7TKX46iKuu0cwHRIgFAs8n3Z/EWbMfntLVBZipbss/2
	 p1YBFvCy07ozkPnMA1Yym14zPqf8WtqkAESDZpcPuwyJwDBKiX1O91nRU2JUPcLDhFrks
	 DJFXBB13Owi+OEqetmsjjuphEzTVX3E22EeOmD4Q60xnLtHx52dYR0p16DQleca2uqreb
	 ch6newq7GAKpl9jK4ZHwTC3hYerZHRbKyGoPlP2ZSSjgq1no3ceXPSCS4qaAxQcPzgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRnrH7Yl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFw1sUL6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99119606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99119606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LRnrH7Yl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FFw1sUL6
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QEvife4168157
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=; b=LRnrH7YlLzqodBMg
	yxqpuGzqQq8Q+euwWRdQtyDNcUIySFG8F9zmv8NGcKlOMD7GqO3sLmobBcpusyLw
	hAafzOtoCKGc3IOwRid88cnftNjX8iWgcWa5bZG4iN8BTaXWDU5YpUTdKIrYIsMx
	jz2zp4l4PUROJv6vAScl6Z1PRDIXkXdb24Wjc+u4vTdgHz34IUUDejKb4l/pEUP1
	1qeMgd+zvI7EUGnJHyCi73hU6I8nrI3ZAntX4wQWrQswQCITWakYhGazTQj01boq
	1CpKAT8r40wlBGfd+lROJmLfyQEgQ4WT4ib9U+jqmwArA3y/csapGiGCiVmh9PKe
	HViSeg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4sf149k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:04:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2c0e6653so312273585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793027042; cv=none;
        d=google.com; s=arc-20260327;
        b=e2vHsiptOEARQhXJQBH3yXGOigghws92yjXinr/BJa2SOcLugRA7Bk/De+CQcBmYnA
         mbrRzv1JCS7iWS5jP09zFAFFgWfAuEg1ng3Rr2WaGm7minT1HWhD6JSc7YBuIlXrqQc2
         phrOrvrxEgabA13eolJFWTeuDhmj1Pa82atf5aXS6r/Xv9btf2eV6jMFQwCBSNqLcdPz
         +ClIdkBo/84eKCLAkwTLGhPTp9g0tiSWTNmXsL/pKS2dZLxfpERXkC72VMz8Cn9TiXbj
         SCLIK1oUc5uy85lPfOwp9Z52a45qEgEJMJ4v2ZmSFs8NkM27PJSJxKdiv+IxOnaGVSox
         TVEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        fh=7qWrkHiPRgLLK//01b+5jt2pxxiWELyUEgFFnc8fkcc=;
        b=i/MDBZNvY4JaH4z9mNhuX6axHWI2uERdKm7v2LRoJdlvRxluOdOJiIjwzIqfkHH6l3
         7Q+YvtVgT4QwJJm7NL2yNxWe1AKRQyWqnW7MLOyAKyB5GL8KDM1ioyLyrXTr2Luo2XKw
         YymeFW7Md0F8jrIVl+D8rU5/LH3PItK9wchj4HJl8hF1oqTTFlxgKuvQvxZbyyWSVG97
         W/I+Kcf1KBJBHfR2zfN/WREcvctm/YFubsVUU6Q/o5Sjs7Ev8JCqapa/TDlfRLVKjCPS
         quGf1qu30LbaTIGZrkPRGBJ4taNp5PX3YPFPqH+ExYLZg6g1I+zEiMfUS/czk4arH+tA
         dnKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793027042; x=1793631842; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        b=FFw1sUL60zbI0K/HWDTIThcZcM0/RSAAwCI5qTe/8RYQK8JHh/cAKVaxOBiJjy8dLs
         E8F5JQntFHa4UhzVGnXCIV44wTKq22ituYeQ5jFqXI8CuapWcWbxSwirzG1VOsv78H9j
         x79Nl9Nzbvs1LjgnG8ZvE+liYARKtiUFjivzVAOyBZoX+3fczSTmE43kBn6kjW4UBzH9
         G7afRkAUi1Xr8BnmhrKGFNUqfFt6GXKHaPfbJ0vN3coA4+M8X+RPi5za82/QcQoHRgee
         He3halYLlQRFewpMoau8cLKS9A8bZOLgFTLN1gZFzvE/0+biCRkYT4picLADVhmCB23d
         zT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793027042; x=1793631842;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2KMHQ06vm2QmkGZLsM4mvA+4lycDd63CIoLfhv0niYc=;
        b=Ji4ZnQQzsjvPinbsLTGXrZkkEAVfoIqusEUlSlFr8sAhvkDl8i6NS2j31xlJYU/6q5
         JDaxFGEGAeGU6QvUqsHU8nMqiymxOZm1HZGKDPsSN9vvLVBDZmnm8JgeaA3GsHTPkbqt
         kJ0wsxnIt6yE5NHhh6o+4xGNd6NmMSPGjC3WNUUObPnOG85aHKgVs2SXsTKeOq0gGRFc
         5MeawhPs5uKMZ9P18C+npl6GKjeCo+iIK/jDVCnFseVG60iNedropIqTT/MW9qWf6GcF
         pP2MkxKHDjmF6ipcCE+KZwltrhBC8DOMpOQZi414hsNkxZXxUMI4nn39v327aqI6ZpOo
         DqiQ==
X-Forwarded-Encrypted: i=1; AKwUvBzNWGaBb7WGdtZYEuvf1QQLVrZABJfIUavN0jjFNP4mZeuOiPeKcAquvnuxvkHvF5SR8G1xqeVJFKRGPg8=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3sKFBAdGBU3UtzJpiIYjQerQ51/1Ta6DofOMSD7+pDWSP3kVi
	bb9sdGPZ7Uv14oZXfPArIcG4gwmr5WhUFdIkFl270v72I/MjhGKEEwvRAV4Tr5Ndw1J1URJZSDp
	wb6GocDxQ6+pfJQ7nfZbtSYMwoYZa8czJO2VKU6z879Vhh8rcSll96mERXTzPwRfEjRyJzMrF8F
	6iOxgstbBGLXzf+78bE4hs14Mpv+tG7dO8gaoFPbx33w==
X-Gm-Gg: AYBFou0Vpx2m7fm1FpT+aHd1QYBghSIGdaeNm/X93zHoFZJCbf94gBf+ju4GKQP4TL4
	mdCt5qW3CtGH++7i6uTK/LC+tPz9uWoBPanB/rzZk8lVpCwKBrPo78+K6boItZ6eRIdecYCGtcN
	uK7BxQBjkwBys04BKsgWDo5rfj60vBlrZhNJhkQQHr8DRyq3qHMvSJb5oyuy/8MBy4OroLFPdU+
	VOSlNe8sO4S/BapcE9PSmb0SAswOx0zaFaE6ZQZKoM5qsOGQvkpUxTWtvsc+PBwS/dWbxfGQooT
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id af79cd13be357-940f2d96196mr699038685a.6.1793027041666;
        Mon, 26 Oct 2026 08:04:01 -0700 (PDT)
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id
 af79cd13be357-940f2d96196mr699032985a.6.1793027041023; Mon, 26 Oct 2026
 08:04:01 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com> <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261026133726.3249235-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 16:03:49 +0100
X-Gm-Features: AclHuK_TvdBINMSWsq4YF_lka7v-QqzNFebZNni5byyx9B9emy8t2ESfOBOR4AQ
Message-ID: <CAFEp6-3WQyjjFDjUMeVD7QDAK0VNhfD98XFw2YYJ8FZi54yypw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfXzPZGj+8EEZxP
 CnVdkzbHJUvIC5/jGR8EMR09Ftn0R5cj6P9vbFvTTGIE+TrnvU51VKoYFU/7ToNTMtYNbBDEII5
 pY7CeS+MbvzO9kSbVLeIYEgfwzg3QUA=
X-Authority-Analysis: v=2.4 cv=ZOdCCn7b c=1 sm=1 tr=0 ts=6adf6be2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=xfkO0-JmZNjxaItLvQwA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zI1AWuZTX5rwl_VD9NIYP2rAjmU80wd2
X-Proofpoint-ORIG-GUID: zI1AWuZTX5rwl_VD9NIYP2rAjmU80wd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1OSBTYWx0ZWRfXyq6cmCibWRkh
 ztla1/1Wfj5oz2eS2CCa3mY6IEF7n9mmNylt0mzNOr7Awi0BIGEdFYS6rISXRfFzac3IIRjB+zr
 qGa7A9ynZTtND04aVfWa+tjWKbqbXMNCy31bjE20Uy7jsmzXmpU6rSRNgyKojEPTP8nXlzXA76m
 pbXxDKOawk02JG5Qb1oAmNOH3N3jUv0I0Qp8oXf1Qd6xq0CVOkKMcPE0PlLBKS1/+CfO/Z9n0BB
 b5+yGRXrPhz6vp+NdQsK/rtH7vtBDF/R+x0a5qdDlurCUSBBQbHRuKcC2PiOrtX3PLjd1cunhR6
 4+ok+kXh+kZQCcRtsGlGCmA2hfD21cA6G/ET/NAu3rLyjuKI08ToQeMVKa726H05tcH3HXGzTiu
 emBHzvEFzXDblmNUvjf8JEk0xWTyJ/a1ZljO+FyggACk1CWaTEkEY6SMNlFcOlWQKQgpVpqMTrX
 Od+wCbQIrRZa4xFOj1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260059

On Mon, Oct 26, 2026 at 2:37=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.

Again, we retrieve the pixel clock to derive the required VFE **core**
clock rate. If the VFE cannot sustain that rate, failing here seems
like the correct and sane behavior.

What I don't agree with is applying the same logic to other clock
domains, such as AXI/CAMNOC clocks. Their frequency is not directly
tied to the pixel clock, but rather to the aggregated bandwidth
requirements of all active clients and data paths. As such, deriving
their rate from the pixel clock requirement feels inaccurate and, in
my opinion, is an abuse of the existing logic.

So I think the implementation should either handle or delegate to
separate functions depending on the clock type:
- Set the VFE core clock based on the pixel clock requirements
(typically vfe_clk_rate >=3D pixel_rate).
- For all other clocks (like camnoc_axi), and until we have proper
aggregation or voting support, a simpler and safer approach would be
to select the highest available frequency.

Mixing fundamentally different clocks under the same rate calculation
does not seem conceptually correct to me.

Regards,
Loic

>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..359b5942df89 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         long rate;
>
> -                       for (j =3D 0; j < clock->nfreqs; j++)
> +                       for (j =3D 0; j < clock->nfreqs - 1; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> -                       }
> +                       if (clock->nfreqs > 1 && min_rate >=3D clock->fre=
q[j])
> +                               dev_warn(dev, "Pixel clock is too high fo=
r VFE clock %s\n",
> +                                        clock->name);
>
>                         /* if sensor pixel clock is not available */
>                         /* set highest possible VFE clock rate */
> @@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         unsigned long rate;
> +                       long max_rate;
> +
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
>
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < min_t(u64, min_rate, max_rate))
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
