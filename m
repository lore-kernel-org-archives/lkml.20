Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794603461;
	b=M8t9dcUA8JbxKTFAGs5oDx2Ve6FjAfgQhbDufW2ErgtCn/wsxUzDKND1neX2Ycq2IXME
	 oYMprajBujAdAycL4v5545QM09y0o5gl71PcRdGKV/zcOjZBj5uzq7tk2KBvKx+L128ef
	 Foig/Oa5vPTSwyAZrhaMZZO+IReWi5GzAksiBQQIt3C5kw8GYD/2YxHkzee+KJmcthnyL
	 ZoqTivn355B29kFaO+VIL9B2r51APk3l6lAvoFLwCDIMi13EdDnN9Q4jIWY0WdAwx1PtI
	 EvK9S2I7WdXzyWJ02WpjMv/771fP+4DXhSEOTKgzXXvisNRoQGaDEQdK5mniJteoTPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794603461;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
	b=AClalUSB0bFDlX5+uNP6CNC2qpyPl94z/l1pEDZZKlxL8P6VqJnNWAIAj1EvrsB1t8E0
	 iDB89ZkLjgTzvWzUaKjTaxdnEOxi5NNMKTcNq9VLkhgpjl+ZkpM62UAsSlyKZG8VfQcFJ
	 Yh7hdEHGf2KiHLQ4+G2uz2YYU9FTpYUWsf7NVkc+Kb1rRbyKNbO/XMHq1mjp3SYWupu8P
	 8FDwGgzKpQlD5Uz8QnikcJMIlurTxNSTU4U2Sw8HAQxq0Bcfzfi9ySCspxJyi+sN8h3IQ
	 3XLAM9pEFHt6Hoohtm52sPcnThDiUOyS0ndEqYXptvD4cmnaDVF9pTzJJ91mY0ipmSA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPxoMAm3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDwOiQjA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF477606A323
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:57:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF477606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kPxoMAm3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dDwOiQjA
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADKK3O64059296
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:57:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=; b=kP
	xoMAm3fRcab0Kbk51q7FFn55FiBzUAuq1i5LTeraB3kt5X7hl082HPDW2K/ysaQr
	0UQDcgmQNy0tZrXKp+GRNtOyXhxton+tKQr49RTofpYJlo6Hh261BFJJTbchT3uK
	3jORqMhpI2wrcwm3qBIfogD6LU9X/uZ7MjyBK6lXQwqKyqABXHo+9paBhRzjT8DT
	l5dwdbg5rW4+lK4laMPlcLjvv92jAqy36oW0JCQdt4BFiYXWpn+juKHEJpq04qid
	cAeIcZTriI9CN/ZvNrA5iflxqaCXhYCOjKaZHacS0bjv4XS8hpEV47Avcz+xWT3N
	IDQWlre0rJ68+dYmEtZw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvu6u5s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 20:57:39 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-4ae40674bd0so952969fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:57:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794603459; cv=none;
        d=google.com; s=arc-20260327;
        b=M7Zfx90NMuWyj2m/EpC0jcytEgGZ/YVu7pSax15SMnuFNiTTqCrl4VqvY4ST9Ym5dT
         u1mYxXSDEdU6jxn77QwvEWKF1sagDERbiRrE5Zcpajo2gel/KpnvGxU2tNQa5d2dwTTz
         k0xWZciaqy3YPP7lDdz839Im1AeEROgukAsYC+B2l2/TcYCn+BXZrsFxDg6N93rFQiJg
         WY+NHFSM/BReq2ggcsM2AgutRsCXwR/YxWP3aX0uhGCyUxwvFuKMojZ6IpUpsTvPtEN3
         ZveCP1lpZcXxcREar6WSoqAGYd/ZCMRV1G5rvvKN8CMDBELn5h6GlU3Ek89FZr7OeJJG
         naWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
        fh=2BcYwMsmEM6dMyQv4pliFOjg0+Q92r6hZcsYsoMC07Q=;
        b=AfCd3TKw8GdbgEzz/+VwZg0rAuaab6KDzS2E3bAUM395asY/a+TRMK1fZG5DEdyxnk
         v4feTD+6DjBIbMMuVdlFDxV+W2hFKcqPYCAtoH+MrvPCuA1ag8+sQoMHUApzPXxuSUVt
         Q5WZBdr1Mi13MSGSW1kvQR8lzxy/uo61UnNA+797zKkF9TJrzg4jk9CYmKmNzqYCwN4a
         e7TaKEh++JLOvUUrVD/SCoe6K8qJtuWPMSt84vGkOJb3xqrF1Lw9pKbn+lPCHC+L0bc2
         TLADe2B9E9OgMZ8fdnLQeT07USwstQXxdJItyzWlSof/sHXRIhMRCtK/bGtmyK7/ckCe
         yGgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794603459; x=1795208259; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
        b=dDwOiQjAM3MumHTLrkCM6jJxrWxigXxBzUClX20Wnfnd8Oo9+7SBF8IaFJVjLW1V78
         W5WW+qdJshnHsGPS+voEMl854eTmMMqSqvIYdPjQCeGu+h3//GrsAOM6Vx107rXH47Ym
         Ys/kHGaCXfFngeWphAgyeXYbYiyPvH+lSDoPh5oq1UxKTTlHnxsKbqVmrz9A5WoZghEn
         QZq82nHy5Kbmslk8KF9DzYJTTog8cHNiJarhRXm+HzeHfB8x/a7LSHOsC0W2mLVHb+U2
         rn4IV3jKd95j85rMD8tMHM9uFWoorx8dRswKUJvD4pynma5akB6tzTaCtGXq5fRp+wiW
         W4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794603459; x=1795208259;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sO1cwZq9LHn0pDlrGqQpOhpfBJM8fi1Hf6WBVfr0ThU=;
        b=vXscW3inMZIAm0RDWVLFW+Iw5tBY4m2cxaJbHLOwG4a9JXEkdoIwKw/frJlyJXXw19
         kS3ihssLE5wBc2u9daQkjtFGWDCCHe5s3MH5Sze28IALQNvkoUokv8N/buR2lKc8owJg
         iJDms3xr/u5puwS9gxy0mxRwsZuLNyr4kE0lwk7OSETcTK4PXHmkcwOhFvYxhe2e5aFg
         VtO73nNtSn8s13RMp4IyMdSDeMUbY9XQtKFWAmx9fYubtVztiYEzR9P4K3275V1rSRr5
         KbmI17eDMQuGcc6wWed1hfOZS98HkX75bjb3qnmTd7PXo5QAb97kNJsnyhaDRSft+D/J
         9Oug==
X-Forwarded-Encrypted: i=1; AL+hErEjOXYd65eXXiDaEBPsJ0ckWfJhrZl0wTpwSO4OqmV9JMDg111wUQkwWjkjCHKbC8wTfSP1B1DSGcEz0Wc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9AelDZkRAUUglMgth5vmDNvfcznToa5x/v2mkwP/2D9wOIHMkJ
	idwXK7R1cRhe8WiQiRK0bYmTlp/qZw2HkTKta2LPc19THqkHfB0air4IVdEby57hajyW4kFSo+B
	q52BPSP+jqj8tcZfYanNUqcmTI3aMXO9hdJxZTmAjx4sx4xkgkt/sJMNLCyQFThz1k9vES1ZMX+
	jGm9q0dhRRIhYOtsRDy8pWzSG8ZPhfzmb2A7WA1gsixsJBycLl1cfw
X-Gm-Gg: AYBFou3x/KknR8SLTGv3xSEesHtKBa8pAqMV6LUQldyTsaIPs57bDFsEsuEIB39TC1Z
	Y0lqNXfxVReQ5cZ6nH9WlGXS6CLq2NF3Jz8MymH3B0122+j6CD/gjlJixpWtDkByoRrf1f/6STd
	nD+Wx25H7wSkpoWjnw1w4bY/eR2ORCm0K68ImNffTVtsJbDnBXygAaVOPjAAaIg9eGphqdqvUyi
	YQutCGnTwdDhEZ9Wz+0uw==
X-Received: by 2002:a05:6871:c914:b0:48f:e0e5:a1e0 with SMTP id 586e51a60fabf-4afdf794eb8mr3593186fac.53.1794603458831;
        Fri, 13 Nov 2026 12:57:38 -0800 (PST)
X-Received: by 2002:a05:6871:c914:b0:48f:e0e5:a1e0 with SMTP id
 586e51a60fabf-4afdf794eb8mr3593161fac.53.1794603458363; Fri, 13 Nov 2026
 12:57:38 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261111080619.244138-1-julius@bairaktaris.de>
In-Reply-To: <20261111080619.244138-1-julius@bairaktaris.de>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 12:57:27 -0800
X-Gm-Features: AclHuK_jF12LGFMbl51Qw0skLNEfDBLsQfwj20MZJcl3WZZN4mMk_QEMp0swbqM
Message-ID: <CACSVV01-U9jEOfKsO8fgGtG_xQqjOF4TAKycJnqp4E-eDqsC2g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Keep objects of queued VM_BIND unmaps busy
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Sean Paul <sean@poorly.run>, Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA4MyBTYWx0ZWRfX7LZDi/CtR4zZ
 H6P1Gtdu8XIAgWSofnshhRbggnDZaYD1qa0WL1NNcbWziuX3ZwyMM1l1ggAlRbtioYNCvVLfRWN
 3NGk+ejwxLSRPViYQUebaWumyTee7LZ9W/5U7j7flqXKcXSW5P4r8KDf+BsWCTvcIbiNMRz3Lu4
 xvlmaqjWBjMisYXTfXGKrehkmvYv4qlFVivZiry9CHHH1tgNo0VHr9hMFJTHqpLbpB0oqlwS9rK
 Xca7B/6PLC0o4JTxia3ko80g8fN2MSp4eMxuOFP4bQOM4QEgawQsiCoRil0MKl2lnzB57ncaQ1f
 NwRE56JIrBHHvx4gw72O1M0Vs+1gxHx2M7JK2REXHVOivhwGffGubeM+dFwAPRyIN+nX4/8cgCU
 F32SuUMQWBPUmF/FsX4Zy1XDhiY/UwK0rBkyHFiFem7gch/u1LJ09l/EbZbtnsoLLOR6BSf5bLf
 wbNNly/aS68aCFaaTvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA4MyBTYWx0ZWRfXwY9yPJv8xblt
 w43C7TrGmbqIg2hGzO0/88dIWuwm13awYMNi5UJWCqpW0x55+BJoRQgIhVrcucoTHslDUHeiqWt
 MaytiqNuwMjqHq22wp6RsMTzD+QsZnQ=
X-Proofpoint-GUID: U8ERQmcZSFY4LxW9Xspib4pEZxckhQyx
X-Proofpoint-ORIG-GUID: U8ERQmcZSFY4LxW9Xspib4pEZxckhQyx
X-Authority-Analysis: v=2.4 cv=JfcpPkKV c=1 sm=1 tr=0 ts=6af779c3 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8 a=SXJYvs3pGg1A0ozdNicA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_06,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130083

On Wed, Nov 11, 2026 at 12:06=E2=80=AFAM Julius Bairaktaris
<julius@bairaktaris.de> wrote:
>
> A VM_BIND UNMAP closes the VMA when the ioctl runs, but the pgtable
> entries stay until the bind job runs vm_unmap_op(), and the job can wait
> on a caller-supplied in-fence for as long as the caller likes. In that
> window the unmapped object holds neither a pin nor the job fence:
> vm_bind_job_pin_objects() and vm_bind_job_attach_fences() only cover the
> objects named in the userspace ops, and an UNMAP op names none. The
> shrinker then sees an idle object and purges or evicts it, and
> put_iova_spaces() no longer finds the closed VMA, so the GPU keeps a
> mapping of pages that are freed and reused. The unmap half of a remap
> and a MAP that replaces a mapping take the same path.
>
> Reserve a fence slot on the object when an UNMAP op is queued, and add
> the job fence to it along with the fences of the mapped objects, so the
> shrinker treats the object as busy until the job has run.

Nice catch.. I don't really love that it means we can evict mapped
buffers but not ones pending unmap.  But so far I don't really see any
better option.

(Small note, a dma_fence should fire in a finite amount of time, or
TDR should kick in on the signaling side.  That ofc doesn't change the
issue here.)

BR,
-R

> Fixes: 2e6a8a1fe2b2 ("drm/msm: Add VM_BIND ioctl")
> Cc: stable@vger.kernel.org
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
> I used Claude (Anthropic) to help write this patch.
>
>  drivers/gpu/drm/msm/msm_gem_vma.c | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_=
gem_vma.c
> index 8b702422030af..d12df7e42fce8 100644
> --- a/drivers/gpu/drm/msm/msm_gem_vma.c
> +++ b/drivers/gpu/drm/msm/msm_gem_vma.c
> @@ -473,7 +473,17 @@ struct op_arg {
>  static int
>  vm_op_enqueue(struct op_arg *arg, struct msm_vm_op _op)
>  {
> -       struct msm_vm_op *op =3D kmalloc_obj(*op);
> +       struct msm_vm_op *op;
> +
> +       /* Slot for the job fence, see vm_bind_job_attach_fences(): */
> +       if (_op.op =3D=3D MSM_VM_OP_UNMAP && _op.obj) {
> +               int ret =3D dma_resv_reserve_fences(_op.obj->resv, 1);
> +
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       op =3D kmalloc_obj(*op);
>         if (!op)
>                 return -ENOMEM;
>
> @@ -1419,6 +1429,8 @@ vm_bind_job_prepare(struct msm_vm_bind_job *job)
>  static void
>  vm_bind_job_attach_fences(struct msm_vm_bind_job *job)
>  {
> +       struct msm_vm_op *op;
> +
>         for (unsigned i =3D 0; i < job->nr_ops; i++) {
>                 struct drm_gem_object *obj =3D job->ops[i].obj;
>
> @@ -1428,6 +1440,17 @@ vm_bind_job_attach_fences(struct msm_vm_bind_job *=
job)
>                 dma_resv_add_fence(obj->resv, job->fence,
>                                    DMA_RESV_USAGE_KERNEL);
>         }
> +
> +       /*
> +        * The VMAs of unmapped objects are already closed, so the shrink=
er
> +        * no longer sees the mapping.  Keep the objects busy until the j=
ob
> +        * has removed it from the pgtables.
> +        */
> +       list_for_each_entry(op, &job->vm_ops, node) {
> +               if (op->op =3D=3D MSM_VM_OP_UNMAP && op->obj)
> +                       dma_resv_add_fence(op->obj->resv, job->fence,
> +                                          DMA_RESV_USAGE_KERNEL);
> +       }
>  }
>
>  int
>
> base-commit: 1e59855738454b14021b64115f0090eafc7526ae
> --
> 2.53.0
>
