Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793728752;
	b=i2KrsMEjesGC15m8CUnbsiZDA7taXiTkLGrTV8D7GfqT94KArXp7QwmHfiJSLUF6pn6y
	 k5ksASQsRXOJcwp/6o7ZlTlPjZqBNTt954G9Ahbi0Ui61iFN90A1iUwu3rS5KJXKMshSP
	 AInlnN7IGNZZ7VMIbCmgpttreqwlBlTXlyfjBEvsaRutOp+wRlNQRLqb7bJWYFxl+DsAF
	 amF70vC6RYIQbTH/zwbAlFR6tlxc4KGZ08M6KlQ4+qg5x8LEp26iL49t5miPeTxEzoQ1H
	 LdFe8Ps7zdVaU85XFp4q53dQwTt1o4f9rewTjEySbDsvhjotPCqYIL5tupMdMTL5IwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793728752;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
	b=La1R6P3eOLLjHnVS1P010KBxg1KkTRAFJfpcWJ+KgP9INuPjq/T5gqRLUGRcibRs1b7m
	 Kf8t/95PiKt1U6CBr4Stv/zW+hnSmJVnT/zttaO7t+eeDTGN69H62WHghmID9LXOS3Kmu
	 Ef/bH3Pn5p4ybZ7mZg9uvZE3LmLLxGtFkJQruvpaO5CroYzdUPDdQTpanblIsQOIPKLy0
	 Qj+9PTt6zqhzcWkoi0caRhPvHSR2JPfcTg6+AYLvHbHVemyY20aZ+O87LBdc+4ASOeWVw
	 IkwP/qr6EiGa7MDUbU/VI3UDGRBJH6A1jJpHxdbpRkQNXaErM5Ei2Yt8xuCbxARfOtg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pqj1t6SN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFpuBiHU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E83606A328
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 17:59:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93E83606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pqj1t6SN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TFpuBiHU
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3HPV0P3161520
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 17:59:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=; b=Pqj1t6SNvt9mXeCb
	hNVopmbn9MiawHBmT2+h8CuwFfJ7Rhzss4hq0VOkFh5Lg+ssvczhD+M5RkNLLvQA
	EsOKJ3GPuAJuqm2uFam95CXwY+RgZ0MYSguXwq5e/xSkKzjJkvZc6YjhAr2jpaSv
	oH0cn1hoi8ikq2/oXwzCgk3lqTWYDTu7LNnDN66Q6yaEytKX1AEv3pLlIR3PJ1we
	w9CYirNzC5faq9nbYB/EJKt7JR+1VhJgC3iCjjs0gFQJVLj6z98EZ0r1zsoBvsz+
	1SNJyZjWM5eLiSh15j2tPTKPp2oaWsbFoRrqvumbfeM7QZQQJret7o11ZceFVj2u
	HLFoDg==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqh2bh2k8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 17:59:10 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6795a39e53fso1573691d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 09:59:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793728750; cv=none;
        d=google.com; s=arc-20260327;
        b=mfGiJcrbkRrpDqGfoqURvvl3PpsNh+xZ0vRQ2sVt7ZDYNVn6dfFv75JUJOOgEdUJ07
         Fa2f4IaG6Ity4vcWPjiX7kDlL4Tn6DquN4Dz/3yF58mbZ8PCjskh9r7mVdeuCT6uLkGk
         G+2QVPf2pFQ6Z/X3rYRCDojZF9Qs+ZPRhZHQAk/493Itf1HxV33c1YrBbj+eCOphNknk
         RQT1useWSnSQ2KkhLL75mMe3Rmnd38QF2L7kp40D1j2WOlMwy99GuBqrH5kvaww3GNpk
         wnPy+Xl6XdsO2SWUPaCgF1UauM2YTcX/6DD4D9BbWHAbp9+xH4FgXeTAu9AAuU+p8t3l
         k1hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
        fh=r7YlBsLKekOglfA4SLMyW6D+66RQNZoOH2OEGc3Xpm0=;
        b=fu2NNpzjQ4Dmr5HIb6+RBp7NukSyWiygVkdzGWkEP8INihqbVs/T9T8DfJTeVOP6cv
         uhZmWp4alKZW7W8TNNrIKKqGOapHXDhQHyrm5cJ2j7wzll6iPc5VcNJ/QDTa+lbhQaD2
         hY/MT0cRDnpZGfeglH4IxLErMngq3+46yqf6q0GFSE4X4gjPiu4MAGNszrLm7D1GM/FS
         3KWUZBsOi1Bs9W5TCb0TWkTxOlQs+MhZchAbOkXY6CW2jqv/ngmzQ+CfRk2hRogM3zqN
         W/WV7SlkvbhrkhqEgjzao3rZE5mx4oMrK9bUx0QLFwwf1tGGBizNb42Xs+QS4mCD6lYH
         qziw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793728750; x=1794333550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
        b=TFpuBiHUEANusbS91C0W/XRtlMvP+CmdEiXMOarQ0aE818BV09lsoCkOgWuo+BPLYy
         ZR+eBhtEhUOaxrsgA9oD+A5MdUyBXYLE6C0dfl0ISGZ409VYCODu7teujNo5eGrlm6Y5
         fND+yHrwEPxPtn5nat/1OVrCXz3AjEadf4H0j68YQm/wzAFCSOYc1qlBCu0MFBzYRnu/
         CD/1UfELN3MnrO6Vy6oSanjYxBtICxoB2gFcTDgMrBJ6Hp3gIUFNho9ZVvqucVGnAJ1A
         Sm/uQzTaFsIuPuSg/HUxZxwkkl/jCYZ1HjXp2ID/3U7szAi7mdobiDT/rIKp/Md+OqiW
         /5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793728750; x=1794333550;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWiqVESok8K3e9rRJ3g5fJGIMlnrH+fRsBAgdT4QzNQ=;
        b=PTcuaoVJTl/T59DltwF2KDmm0OwFKm/gCmgTjuOtJ69Jpd+8Dl8KUwqJa46ZQz5sJu
         ENqytwQDf6yEgCgu9gPSS86Lar3GzDux84SJKpGqWEZWw6i0Kt+F9RbjXraFYGzLiHz/
         kdB5zxMdHsdiNBeoW5oglSAKbVf28QiSjBAK+p9oSnwDFW2wFwKtWDRuAstaJ4ZkE8DE
         Fq6adnwUJq1zCrGdadSQQYCZ4YYQmHHOoqaxUFc2C4m6A1HXuG2g9HNWaJjgnzoIYWm2
         Y2m6O/eYu5pVlEOxSBhFsTxd+DmXVRn6kpsbPRo7TGUNxVi0NZqx70mqqFcjkLrTXxtG
         bw/A==
X-Forwarded-Encrypted: i=1; AKwUvByYcf2mGASOgbtlffPWciVjxY0kA6NwI3BsI1YJ1aiPmxaeAefVfS2GAWsFnxaNcIyOCAld5AHusawXmyU=@vger.kernel.org
X-Gm-Message-State: APuU4Z98aGnsmqoqxHVUJntFWJjJ0VWJZ+fqo9CTz+NsvRg7WTRDQHBL
	zK4Cj/F4gvzIfsU+qarmF8sWkoEkYKGnNg+wyQKkoXOcTvMMvVEgASWso9sN0aVMNhCb6h7iCAk
	pm/R2E/4DlL2RtydZknzqyI6s7H6BwYFKry0q9roEuqZRldM5aMCPDl7mjlIWsAqPssQTr6hYUp
	5pkuC0FMDT5mWaUX1FYdgHt0xs9cvUZRAMrTpOkC/1n3SAO24dpw==
X-Gm-Gg: AYBFou3SdYy2qYLcQrghLrRUbniLzlfNN43nhINziPq5XetcqU3feGnfNQkC4kxDl5z
	fg4MsJWvC/XozBVRcEUv4r7yzkII1HPqOfQuvjOqac8+FrVuOEHfZKaPGRALAkFi+t1a5HNYi85
	ceTbfquB4lNwDse8wkuitBQu4ETLpp7rZFyndekR7MbyellhZ5fJoFHnRAhMWlAk8sSgGhUzj7A
	beNRuRqw9Oxus4m4jtwgXxV2qBuALybG8rTHAh2
X-Received: by 2002:a05:690e:1381:b0:679:a5fc:2f35 with SMTP id 956f58d0204a3-67a8d3dab47mr11993842d50.19.1793728749804;
        Tue, 03 Nov 2026 09:59:09 -0800 (PST)
X-Received: by 2002:a05:690e:1381:b0:679:a5fc:2f35 with SMTP id
 956f58d0204a3-67a8d3dab47mr11993818d50.19.1793728749355; Tue, 03 Nov 2026
 09:59:09 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260730062219.2836938-1-sammiee5311@gmail.com>
In-Reply-To: <20260730062219.2836938-1-sammiee5311@gmail.com>
From: Jens Wiklander <jens.wiklander@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:58:58 +0100
X-Gm-Features: AclHuK_eyUJ4LVzmPr0ntwvbkf_nZEw5d7HFVp4LeIbjHcyHf9f2l13O5bkRG6I
Message-ID: <CAGgiveUc+TkGyGDxuuCLpHO=i22-4fn1CqjqnnmWLdWWYOZfPA@mail.gmail.com>
Subject: Re: [PATCH] tee: qcomtee: user: check the parameter count from the supplicant
To: HyeongJun An <sammiee5311@gmail.com>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Cc: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA3MSBTYWx0ZWRfX6uYydmT6ZL+x
 SRJmTaj0xIt6+WqsOnGk+EfqGzxqDsErKAECMFnfBkG2p8bROqExqsCZXYub4p6fuVqZUJSW440
 qco6QlD3W+mO/e8KaQhLgyCT8cNcNNI=
X-Authority-Analysis: v=2.4 cv=Xs1vqlF9 c=1 sm=1 tr=0 ts=6aea20ee cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=pGLkceISAAAA:8 a=YeeCoqeVfiiWHf5BpmsA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-ORIG-GUID: CCEwIJVqLnFTPCU3ZGtEJB39_uNIzSG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA3MSBTYWx0ZWRfX4+ZhBX8dpnd4
 6rb+cSohwJC1zfe8oFvePd4t21l//N79MtMtFQkd0iyzGSKy2W5SX/CyIuRA1axfFzCUG1MWTnH
 EefIQOeU+OMaXilIGgZEDp087lBOy3b0g24vh6acdW76/I6510GMvD4CNRPWQ60vggE7D64nr1j
 4jKxeNtHtkKZjwXP+jkvCVAlrfRiQHYOrKxPGj1WebqAp6EtIAL3m43/YAajnt4WzpckuMo4xXm
 qA4GMiJ8xSjcFMTjYM+uskKRFTC+hNU0wWsRJLIOU/fBq64NnAPAkFSUHbml7Dd53wmsvqPoskE
 Z56FncEB7vI1euhTB1LBAU8ou/V8+t7VK5VCLyzF3B14m+3OUnpNUsZpI/ciDnHw4bbQb5kheTA
 jkNWRI+MGxKeGo83M8TkHZrugOvAyAw/qIco0oS2YEWfyeA1XQqpCE95i+1PqdQsNYoEh8CMHzj
 YlhFygDBawNeEfC/3qA==
X-Proofpoint-GUID: CCEwIJVqLnFTPCU3ZGtEJB39_uNIzSG0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_04,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030071

Hi,

On Wed, Aug 5, 2026 at 11:23=E2=80=AFAM HyeongJun An <sammiee5311@gmail.com=
> wrote:
>
> The qcomtee_cb_params_to_args() walks the argument array QTEE asked for a=
nd
> indexes the parameter array the supplicant supplied, but it never looks a=
t
> num_params. A supplicant that answers TEE_IOC_SUPPL_SEND with fewer
> parameters than the request needs makes that walk read past the end of th=
e
> allocation.
>
> To fix this, reject a response that is too short, the way ureq_select()
> already does for the receive direction.
>
> Fixes: d6e290837e50 ("tee: add Qualcomm TEE driver")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: HyeongJun An <sammiee5311@gmail.com>
> ---
>  drivers/tee/qcomtee/user_obj.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/tee/qcomtee/user_obj.c b/drivers/tee/qcomtee/user_ob=
j.c
> index 10452fcc7ccb..2a594ae299da 100644
> --- a/drivers/tee/qcomtee/user_obj.c
> +++ b/drivers/tee/qcomtee/user_obj.c
> @@ -507,6 +507,10 @@ static int qcomtee_cb_params_to_args(struct qcomtee_=
arg *u,
>  {
>         int i;
>
> +       /* Supplicant can not send fewer parameters than requested. */
> +       if (num_params < qcomtee_args_len(u))
> +               return -EINVAL;
> +
>         qcomtee_arg_for_each(i, u) {
>                 switch (u[i].type) {
>                 case QCOMTEE_ARG_TYPE_IB:
> --
> 2.43.0
>

Looks good. Amir, do you agree?

Cheers,
Jens
