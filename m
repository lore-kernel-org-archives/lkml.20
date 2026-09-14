Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED1B3B2FF9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789366479; cv=pass; b=RQTza27XVc1DNIYijXpKXgedAbsGXjk/9+nRTDhQ9eKeQIh386zan3F4odStmDWeIVZvM0dKhScCjpAudLMnoU06VSNLfe5fzCKlNNVHVNUFLG3IspGuBx8ttbVAWK9wcwpw+L/IyU1LzzTNkAnDnb2ZuN4OLKVsRdVz9xQbNsQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789366479; c=relaxed/simple;
	bh=k4xfR0PeWNxd/reUF6upN1QRUBTuiHQNijGzhwYPpu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nD4fHkyqd5E3FIt+xtQyhLLsl1y2AT/i3+cSq5KO7YqcPSe0AVQk3D2UodqvryCg6IY+9ukjykOtsu6VlwSK9r4hi9NGwiIvDoWP0dD+7i6rFCZClI1ghLEWiT+Sk/hSYFIPH43RxZb82PLXN78H4DA22xrlvp78LAx74WbSPFo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVYm0btx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bp/JhtEp; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVYm0btx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bp/JhtEp"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5jXDq237707
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=; b=PVYm0btxLAUVEefj
	MFjGUCqMsofjo/3Sljg7waqF/TlsXwon5zrbN4AUw0HMwsfIIaT3VV3yGGto0AyL
	YZfUGZvaihpNmPvRZhxMMD/57MrPEbQW90J6qUO7ZnGwG1iJU0G8ilpTb6o+EKKx
	Tn+N6QQNqHqIFNTMMt5QmwR0sdqVU0KGU1rvmgHwL2ZplrGrnsZogvae2dSP4Lbc
	NmkLO9kohiV9j/LXb2V4u434iEJ3ZjtA6/ciAhqTpUgS0C4WXnT+OqlAItR04tcc
	cECi4WNd8oB1X2AOK03AhFLQ8L+rUU+VW4ZIYR4uTJ2Byp9slybde8bWBZzdoLIY
	OrGRyg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dna2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:14:36 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-87014338e7aso63812167b3.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:14:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789366476; cv=none;
        d=google.com; s=arc-20260327;
        b=sEhGfbw8GMZVJx7jXTB0KQAZyAN3w/1cp3D3M/4HS6/DjW4b5g3q5AISaT89dqKd3/
         hLoI1c7lEoeOaKBvhxNABlJNI6tVm6rxdLUFcnd0znHTA2HXp18ut1njOpxDVQsqL8Ot
         rcfWe3ijTkBRg7iKBV7CLf2Wi7QtWaCjxVRiLXBmKsQRqPw+sJg2f8+WjI6pnV+O46By
         G+3ZsF95JMOBVWOYE2NLfo/lIQR/UYknui7ah0/qSzWGqa1o2Wp/7y6cuoJnwNDsRVD8
         ieejb2g4385ZLNA/Qdmv5RhYCHVatjKrb2EIEaKdu8Nrlb+GBsIw7OdUdPwm37mWrZh1
         raZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        fh=aZEL7gg/raguvggV10D3wUaQ1yhoZ62+eQOnatUGUf0=;
        b=T5YeyvKKRSXX/xElsAOd47N/y4rP5Uvpp/PslnuNzDL58mppGhuBJOKRSdY7eCq2bQ
         Z+IC+jyoTh4ECZPx5rdTBqAj04rmUTn3bdZltPi2Tcifk6AjsMVZU+WmGFHklPOYFSUc
         A4ix1fZs2DmbqHUdZUynoLYhQmZHIgW+kNdMjQk8EFGlHt2jG4SmY9bHdtm04QC8gxqR
         JpBUFlfp7k2BTRGbvvCX1K4ddN89H6Y4O++86ZhjJX4Y2sXTTfh5bawL2rBWUIRjRhpH
         oEHQJcfF4zR+2f6Z6dLj/3eDS4PMGeHy8TE4//8iG18kuozckGzMtGAnKKo3rgrrksJj
         HrTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789366476; x=1789971276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        b=Bp/JhtEpuCrjRDQP5EmYJHuPzIMOP5BSLwKCE3nTfm8adLme1zae+FeLuiEf/4PaIF
         NlVndRJ+qWgslH5JJkNr1u0NF3dgkRfvGJUd7a8yHUcQ0ImxxzOYfIAF2W7TL4WLViEl
         h8KOcu9KVBngi0B/rcVyNwAvJPmO0hrGRhT9J36mqHL23ZAc33Qsk/V6eX2fC9qR7Vlt
         tQ1f1wETRrWQ6i5HoZCwGnZw3xIFlaVDUze6wcU+8JZ6WXhnBPA+RsHovN8XKcDd95hL
         Ci2Jqbq7Si4QN0wCYOcUGgF/WFJQ77+ElZBVV7Tj97nerwwsSsybFXGTFK/HImw7elmP
         7aGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789366476; x=1789971276;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iyi/5oCNoofAp3ld0Zs7sv83wQk4jpokqi4QcSkzluw=;
        b=Qa5prJO0mve87drQi+RCVJAW+kNpOFcfYw79DNzpr3mjJi4eZUhnPBlD0JcZbnYUir
         3tQ/oFJuTd+cVY0NT2q0z4VL0wemMrZBjYHOqNzJAiciN/Lq4xZljo78PwGNnpzcHtjK
         SCv2d9LTVMOkwxwnt3Abh2rz4IQet6gpcfsWs9SDle6260oZpKnyHQyhDPNDFKGX2dUr
         EY6iyYXGsZdV6BM2Z2nfUMxIC0UYjrsh4ozi2LCS3EJRF21S2wC3E9jr/LXwgaXSfb2y
         D/U3mKiMKmd6yG1stMcJ/s+aDwA1eTm9nSdO07HzBZAOckNrM77VcVf3WW3axjmYYe4/
         NOlQ==
X-Forwarded-Encrypted: i=1; AKwUvBxOojlqIGhBuLVrsvWb59gHWlvIeaBgjQVXvpbr/XHxMYVSv1zsitgOlAK0a1NLFlfytnbrz1JWMsHhGoc=@vger.kernel.org
X-Gm-Message-State: AFuF++klldktDhWbz/8zPyXS9d8X9UARc7Ev/50jNX8v5fQKmt1J9XWI
	TCQ7KZSt5XV+/Usb5m/B1/WkBF1Q2YJUHjou83UGIGAitvoFE/VA7NW7s00pOs1Y7pTIYhcQGwb
	n5p9vT7V7S8L6PNiwN8TmkPmDFoEh+BdF6FrjoiY2+xCgwus3BC+RyEb7JO58PKaRVDXctF2JqV
	JgyzeIjnQ6Aodqer5plGwmqdLigCXyuATbO0KeaeWYpw==
X-Gm-Gg: AYBFou3EP/SIY5cHk2Cyo+i4Z6KtajnbptZC8h0Tg5lHZHfXRVaDYmE64UToLpYOyok
	oOMJz48DpR+5MEDwwgIav6lrUMTsygz1L4udU0Sluhyn4MkpU50m1xW60JqN2i7JkE25VPPXFhx
	yKjvfkZ/1tax6hngA3Fx/yY8yRCABKi0A6hZ6bp4gD9bLTUTz6og1ZlSzQmF8=
X-Received: by 2002:a05:690c:a194:b0:88a:99a:6ef7 with SMTP id 00721157ae682-88d429bc2cfmr1481217b3.29.1789366476015;
        Sun, 13 Sep 2026 23:14:36 -0700 (PDT)
X-Received: by 2002:a05:690c:a194:b0:88a:99a:6ef7 with SMTP id
 00721157ae682-88d429bc2cfmr1481177b3.29.1789366475619; Sun, 13 Sep 2026
 23:14:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org> <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
In-Reply-To: <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 11:44:24 +0530
X-Gm-Features: AcwNN1WMz2nu0585ncfAPT356zzZjVDl_ErD0iCxDirfyWquSHbcFRVIWjnzCME
Message-ID: <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: AnuATUvtcf9lKkquMNchF2-pgXYMkvkx
X-Proofpoint-ORIG-GUID: AnuATUvtcf9lKkquMNchF2-pgXYMkvkx
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa790cc cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=P_Z3VnmZX6NCh_LFz34A:9 a=QEXdDO2ut3YA:10 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA4NiBTYWx0ZWRfXyy82MNJXD0S6
 ZqROEURf85k9+FH/0fZpcA1pHgv7sxa6PkXKUm2pWoyOdBaOZ7LYHWhK0Qai7yOlBeCGjYsi1u2
 mpU28ykdhE+bjMTchezLbr/GdF/nO/E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA4NiBTYWx0ZWRfX3/qdV83GZpaJ
 sel+myZHb2xvB4yXE28vNgqw4MChwlWiLVbFUsGBXXe2GaiUprsrhUvKnghUMHUCnHAS6WiIjcp
 pPeP6TcEosS8aqCV1zgHBcpteTWY38YHPsaFc7jBQNi7+DvbVmSAw2nwRn5gsh3II9refnvL1mO
 RfH3QWixQ/TppbnDqedApnoKBiIX23gWhcSwhZcYJgMzmAJOqSvq1H3SZLcrxzJx/uQthIqGrHP
 dDQpDfSltPsscQONmG33fe6LcCeMYKHVIqP3P2F5p3Yz6jWMwOJdRoXtM4rOUiL2UzBuXQg0esk
 ERUOXlp1O4YVyZa5eTJanMCm+co+Fx2y1L6jOm9A2EgMhL+dRl0Dwbs32fZAdSFzjj6VQtvujgU
 31nALpfi7/daMvXsTBPTQ1KFzBewLMlhoo+jdmCf933xroJDQSEPt833C46pod0SI/BJ4u/FzEc
 50NvQLupbd+diWeKSyg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140086

Hey Konrad,

On Fri, Sep 11, 2026 at 7:54=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 9/11/26 2:38 PM, Sumit Garg wrote:
> > From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
> >
> > qcom_scm_mem_protect_video_var() is only serviced by the SCM backend;
> > with OP-TEE the TEE owns secure memory protection. Use
> > qcom_pas_get_backend() to issue the SCM call only for the SCM backend.
> >
> > Assisted-by: Copilot:claude-opus-4.8
> > Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
> > Co-developed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
>
> [...]
>
> > +     /*
> > +      * qcom_scm_mem_protect_video_var() only applies to the SCM backe=
nd;
> > +      * other backends (e.g. OP-TEE) own secure memory protection and =
do
> > +      * not service this call.
>
> Can you not just stub it out in TF-A then?
>

Please don't, we don't want to support these random SCM calls ABI per
subsystem with the open boot stack. All the config in this case for
video is handled by OP-TEE itself.

Instead we want to mostly support any subsystem specific TZ use-cases
as proper client drivers for the TEE subsystem.

-Sumit
