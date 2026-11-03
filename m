Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793715268;
	b=glGRpkFFGcLwbhOlTokhv/ZU/makG5QXLvolgxXQ408jUFq8VLnRDHmBwNIrG7wDRrmf
	 EnEN7wkAyTO4GQZ+5uZNL68WBRQ5A4BZhfdCbuVBDZboXo1b8GXQhVNoYryuh44VfKjVX
	 FZHqvwhkRfRPfJ8xU0DjNaZWf5w17AdEHIQup+Bes/nmbC0CTKCUip13xwFoadPMzdIYP
	 8Kj6AKfYSC9uWqYimH7iv9QcgZa74TFUBo1GoeHq+iqWKmnYbsFDDXR+OB2lO9H/to/RP
	 tSkX4SwMvMPYc/8a/Y+FgXfkYevznTaEgKijtMO37OQlLF5YKd2gxJ+1j6J0Kcdd6Ag==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793715268;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
	b=gzpJ5KEPdAzOkX42gJU+dbR7tMQtHScAoHc7jpm+9dl48xdSrDZxT4lB6UxC/tAXFVMo
	 +RaxiAW9f0kft/wTOTX8U8HbcuWLWRbmepPekH8/LU9bF1qj/NpPpL8hIUXfOtfH1HoQS
	 Yojg2fh0g7V3fMh5/Wrp/fIb6vLXSnYfrbMSq8f5oZsig2cugZas/0Kq/tBJOxVrEhAmV
	 Wp24M2iuYWpy1tB4nnhaSMfQfa15pKSxa62tp6TOcanzQM9/z/tfI1Rot/HiMSbozDOs+
	 eKyzbLgffZj0TlSVZrNiPxzsD4xD026icl5L+O/W43juuge2WvENTV71FATlg6qndMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=alDpBw9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOg0VUJc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73BCD606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73BCD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=alDpBw9D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NOg0VUJc
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9vHI2526760
	for <linux-kernel@vger.kernel.org>; Tue, 3 Nov 2026 14:14:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=; b=al
	DpBw9DPHjAUfwbzkD0sAKBDIVF62V2+19WyArxit3bDezESsDCPMf1kSqRUhu9U5
	RdTqdILrnNSAjGmrOeLPaKWoqhwEv3Q9+sAAYbE3txbYTUjHHewo0gbQPAEqQo4g
	OpI7f7ghVq/LqZXoL1tyICHHw/E4ez5ACiB5rzCkKNQGnNXl6Aw6T72vIpNSn3am
	H8aXTxi3XvZFdhrwWGrIeiXRFBKsMWpMWZNHDi77WRiNauREEoedC/Z2UuY6Bp2j
	k13nSdOm5GIVu+nDivITx4PLxx4pEd4qWF/w48+KlXz6xfzKNNayfH2QwQdXVsFC
	Sj7cHzrlwKfLBrUk8srQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7yctd0t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 14:14:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so17454552eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 06:14:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793715266; cv=none;
        d=google.com; s=arc-20260327;
        b=GBo0bvHKBFP9y9prNI45kiyotsGnlBVl8gSGO9aKfdWBgMszJH3iW9HATa/kYTj/qG
         6w5HcS2ruQn8MDVV+FgCwyIk7YJYw402+Tb5wV3u+/wJu2hs8MhyAgZ0uOP9auqG/T8e
         keK+UPA+oiMmy3Daj3dYSgnIBT1vV9QKJfHY7k53nCmHS9p+MJoDHKF9QqdD8E9lAQOX
         wyXSsl3X50V2pOkmcSqkqQO8YpnOmVJgpmUGIJEIaskm6uquEVAzTy8vMXxdOVgl5ksD
         DLt+F2yLRWkoEc5lNuSRiqpSv95mPKrhdIwkj+EZvOSpH8NtIfdkCP7bSk043J8YfNk1
         er9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
        fh=Iw5mjjbeAMybd50a+UkNk4b786LN3XoAihiI/epbc5s=;
        b=FGNPGKlS8jYCAQ8J9n9Q/bfV4T7i4PHUyhMG4aQK8gbjwhYfKHzI3LJrbxDnCoFd8u
         Wtk/3Y0Cb4dCuOG9R+7P/J0iK2nh1aP4BwR+bpV6FCfRBoiupEDX3JYdcyTWh/abqNxF
         1NZwXMTN9Dr8Yrzo98JIlWGof1bLMQWEswqrJw7KaAtvcZNvImZ/8JX6IJo+yZ41vN9Y
         1ZmxLE1KZ8JbdQqRnfbhTP79oDhQBJbgb9dywyNSfwPb79it5O4V+Dt5pvz9yKTDGRJ9
         Ttjd+yhLLK3tNxDWxghiFBgSJPsQYju1tqg3JgZcie0SVyQ/CVCQf9UVhqXqRMDB+Pw2
         OInQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793715266; x=1794320066; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
        b=NOg0VUJcU6Od0U/ng/VIjG88q7xad/yviyCrIFzRFErYbsjn/O2qyS6oHRau/pYE1X
         FACI3l93NjBQzCjqV0jwtoqANTqLKhjQ7ShTYx23ippNWtHY0NlNT6w8JcLyfvW5fmUy
         qfnyL8bNyrz725UI2W8fLwtHD7/a7LMFC6d5cJF6dD/tkpL8/+6xAFXAy4x3rh1wuSJk
         bkb1t2pEjGvSwIfo31kI6CMx8BVH4mwvDxYqb5BcaKV2QDzwxhA3Upd2srHXNtkKSqUo
         n+MPVmHIHnQb+0U+mTisRJyG1/yQsiON4gBWCL7WNHb2vHSUGMee6mJJfd5uJqJmIuUa
         jlKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793715266; x=1794320066;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pwZoBqfoFo0YvlCchBXW5lqCWHboNX5xMKkZiBuo0BM=;
        b=FjnUv7OQu6fwyDYFCwXUhk/fer6eAuw/U3Y/R0qM7oFP6+vhGR5ICg6imZoAOxhzG/
         wwhynrI0YGNIhSaJ8X1VhoA+DjlMyxcBsayN/Gb/ZGZZ8yRaqjMOJLZPA+/W015jFgIt
         4f9xxdBOfhcPxViVcECyzpDOP8YgokSdi/cjwRlHgeX5644WYMa7oQa6959lgO3z1RiW
         VBMksrUcZR+PAFzZIX4NWqubFbWgBAbCJ8mEz1PXRwquICopreO3yhGRIb1sjRuPNuMk
         fN/zknnUX1pe7fRY3vBEFzlSU37GG+6siK/CIrCSW9QjzB4TtY9rLvCx5jdh5gtDQfC0
         BmUA==
X-Forwarded-Encrypted: i=1; AKwUvBzjWjPeCTQ4s6Ctqz3UEQWOowhp9jOPqSsJ6geB3Qy6b4yozn9S7eVvQ1JVFbleu7aveNthJMPNIyBYlMQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+/csV/QXm4OvIixb4Av08LkQOKqvhEz6BNHYs7Ad/d6Uvvnl6n
	Fx/ML5r54mxCeDaDTtWThiGevXfxf4utQ1KwI8EOjW2a8KMlepNJm6PPlkztvf5VcACPN3tkcqn
	EX+JXex7ofxmJLmcU0gACxHrmKQSO/0mwpZO4I4fYxuyITcT/8GxKGkuLUSjUIOe2X2ZAV0K4pi
	LsbNC7gnuRATOOecfrT3IMXBVqb+00bFvspmZd6AMkvg==
X-Gm-Gg: AYBFou1kpBNW9qj4Iq2sWPfs5+zJ+hhXJuLjFDnAJX4KAVxQnzwUx9JQWxHsikJ1aAl
	Cy0AAZ6uCc/JdfjhtYBj6BJGVbtaYydoZnJP2TEZKRZVcW0DbumlBnv4pJDN06jsmUl92UMegjE
	MKyFf0uJy69CiMr0Yw4LLzK5B/fEkpXEHkXtVLUuGA6fRu57H/azI3lquynQ==
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id a92af1059eb24-1ac5c555078mr21077418c88.35.1793715265867;
        Tue, 03 Nov 2026 06:14:25 -0800 (PST)
X-Received: by 2002:a05:701b:2050:10b0:152:92c6:8b58 with SMTP id
 a92af1059eb24-1ac5c555078mr21077404c88.35.1793715265400; Tue, 03 Nov 2026
 06:14:25 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102172001.508440-1-robin.clark@oss.qualcomm.com> <20261102172001.508440-5-robin.clark@oss.qualcomm.com>
In-Reply-To: <20261102172001.508440-5-robin.clark@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 06:14:13 -0800
X-Gm-Features: AclHuK8L2yW1PaKznz8lmJSJhTx7osRp-6K0SX6zJK8oMud99n8w6-qv_LxHXDs
Message-ID: <CACSVV00rYMk1E+Ajv4mUCPEiBkaptqRFskB91om+uAHdc1T93g@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] drm/msm/gem: Clear nr_ops in lookup_ops() failure path
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6ae9ec42 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=b_1sW29P2VfG_wUA9JQA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: w2L_RA9qnOr1aasG3R7V5y1NYI-ybCRF
X-Proofpoint-GUID: w2L_RA9qnOr1aasG3R7V5y1NYI-ybCRF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX/37NV7eMyz/P
 CcYuEDpkxypoOvKT+ZAfmEDPQt+1j2xLa7zVbdKdjYNboE6UOXFYXrI/qsfXP9neXro9EQCvr0W
 XjDMEvZ+Obj7xHSfyH8BKgTlsHVFug8N7EeuKr6I0oI3m1IILZ8FH/fW2iDmSn8OMG2+1y0kLA3
 uCdswHqU5DcT8O5r4NRMzjCjCBI6q0f8etowj87JF1eSGAwNxM4e7PZEE2bNNk1rKK20oLpa2NE
 R1pEzJN3Ri0Qntt3NTvG+sQJYJByNxa3QFq2LbzwRlawOHhF8Y/yhyRPlNL/n99r0BwGenX7vd1
 eWSkmK2Aa7DO/X3ut0uoiZPgzDhaTn/KeKS9pUjw7MxRTUbFuM4OibuNCkG+IJxLyVRYJMkb9xJ
 4WufDSNHO+IYmAy7eyvHmpOIF/B7wXNYO8Nh96OF87QYmrhOQSMCb6zE3LcWxs8BZcDtB9l6Gf8
 VOS6k5Z3pub8THYG6Nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1NiBTYWx0ZWRfX7dbb1QMwS9gB
 /sNqDTUHLB4eX+yYPzuWdcQmlHnYueylTW30WVwXssL3fYA16ypk2MP4om19cDQyQP4qNS5h82E
 dbnzjWLhWKkG5fVxfAxnaxpU/J5kIx4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030056

On Mon, Nov 2, 2026 at 9:20=E2=80=AFAM Rob Clark <robin.clark@oss.qualcomm.=
com> wrote:
>
> We've already dropped the references taken in the handle lookup loop, so
> we don't want to drop them again in msm_vma_job_free().
>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")

> ---
>  drivers/gpu/drm/msm/msm_gem_vma.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 3177461d7ad0..8b702422030a 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -1088,7 +1088,6 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job,=
 struct drm_msm_vm_bind *args
>         }
>
>         if (ret) {
> -               job->nr_ops =3D 0;
>                 goto out;
>         }
>
> @@ -1143,6 +1142,9 @@ vm_bind_job_lookup_ops(struct msm_vm_bind_job *job,=
 struct drm_msm_vm_bind *args
>                 }
>         }
>  out:
> +       if (ret)
> +               job->nr_ops =3D 0;
> +
>         return ret;
>  }
>
> --
> 2.56.0
>
