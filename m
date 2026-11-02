Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793629637;
	b=u8iK1Mu6mUcpWGPYcNYY/MRqM0Lrkhc3/CWTq0suF+ArXNpmDtSZUVkN+euQTkJcQhU3
	 zQNxiszdt3XRqFsh4ysqkbfM3phHRVBV5Zh8m0zCRxeGk/M5JW8OEVLl4H6taRTO2chVh
	 t4wCa/OPS5iGJREPRs/eFl+XVMwruIdYx6WbKEgjtYGqRmRlSLG0dtcO+z1KH9WbKTdp4
	 4YntmkkM2rrDh/HwsMZ1GCq6w2t66TlITWtomFi6apIIRjvdWTIqaywpRVcF9T20hGj9r
	 b4oAuXB/rH3ePAv0cJ2F2weLJhNoNuykWPUNhUIHseDDOhgU984OWihzMev2yHi/KHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629637;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
	b=xNNOce3NnUtENI1akS15bnW0sCXJFyZKljRsAlI2hkeUCCsDArB2dc2YvsuRimaRNTQh
	 hFvEVbDZWSmO8WEtv57BqLOQ+B3nzrs8w8nq915eyf2dss0tXP98OTU3/+FShAZtr+BJ7
	 uFuR7EIkQrGVfPN/KM7DYVplFbLDXXdyskMlfr/iWjmCSlVJw46xTMmg3EK3WESin5HcB
	 o1WWV9BU1Xzj+fAuvgXQZ5rfhm5cnySyUo/WM/d1juZ4X/vqG0gZR10iudUiEyu8cq0cL
	 HN7crvS7z8JO1q6K+YKWvYMi4DtR5eFjzopNekafaxM2cDpcJJqvENQlkAOFIcjAeNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lejKQmqG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="PYFZyU/4";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2401F607A8B6
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2401F607A8B6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lejKQmqG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PYFZyU/4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpP31452660
	for <linux-kernel@vger.kernel.org>; Mon, 2 Nov 2026 14:27:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=; b=le
	jKQmqGwQP6CJxqQJ/4fG9AAw3mSod/NgYwm7RK3UIEyXk+z/xXX6OXL4S19UhWco
	oV+EhLgcfkB0pZ4KMvF/6Kelt4BfdjwFZaJRP5v0oRb83w1iu0m5yHHmIQA+UWaR
	DhhgwpvVQV2qWsBlh1he2QjWfHaPduvsxfRK+sYUbB865yOswBeeaAeFYnya7eep
	kfGesPqEekAJal5fHnoDzCbPT9e9NdZelrVaonqvYk/z2tzKrTrfJPDYvbi+qn3R
	WHVuTIOR+xjuW/jZrTFDOv2IDQS91ZB8cKANe9mXk2jLZTtaT5v8A+iR9VHQxFjj
	LRmOwMp77484C9FWK9pg==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6rpum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:27:14 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-702f912301aso2997843eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:27:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793629634; cv=none;
        d=google.com; s=arc-20260327;
        b=nZPi1gl3q+amTbOMo1KDLJqUgSLUdSsDO5yzZbHWqZseQuEfR0/hI1tOTVWkJquWdB
         IlR45c8PB3Bj0ppaw6bKf2CbggL91uk2enq8TYFd8ruENp5qneFCDLpSkRMovTpXAWG9
         5xadMu+lNJ6ctIj6JxWF95BZiDvnB6xXQ8cuU3vF0K3kqFlVe/6vPvxHDNLlGY3y1vTg
         skhGz+1BnSRXbEKunwZcuTCRdQKgStBaeDfqg27MaSglzRwMr3zfbI6avz5NnVfE3erj
         yTBSVTf5v5zHfnuKkuGOyhAiULB5/OC+a/KjYkjU2TgtnwnMYG23wmnG5dLJA/E9PzQb
         vkwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
        fh=tZpivW9EJHzhNZd6tw9yqsE8drAO9o78nHUGv1PX8J0=;
        b=Q67C2bDIlDlJuwopX1nTL+x201doeQUfzzVTsAMsX87zFVl9hBi5pLBkmQvPnIAjTc
         6Psr9S03XKGYDiuh0NtwSPtV9utXQROpthZ4XJZxx0wpRkrG1CsSTTHJzbgwww/CpJCe
         4Zhfge+f76nm2q1MgoHFkdMCvIBSFCUDL8e1tVJjRjiP0vW7G1Q4bl10IUuaaHf/Wjfy
         TRKE2NIZ6iOaW/kUHchp9kBW2q2FTdIquyinOvnn0Idp8GS4L+6vnXc49GnaQbNxLiKo
         ox1SD0j4RCuXNL7FDy60WJqgezIuG6qvD/X1JX0lPUIQqPbOxxZ76aTanYRlLgOjYi0W
         MlEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629634; x=1794234434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
        b=PYFZyU/4vU6vjmUGpX6rvzfVjbmpRUBEcQvje8FtjXO15OAvem+9Y+YtjRg1cUvnwb
         0d171Ul9cS0UMUsnsYcbNIzlAoudpUywDuj2ngFQiHTr3o23RX93nrsTT/dVJ0GagpxD
         RTQEodUc0wsrvENGLLSVWU0jOrk66Atgh/c0Fd7I3xIj6VlQNqulXELf1kHfJvUtkP3b
         IQghkEio2Oi5aRQHetLdphqH5GFe+cA8fK4KIUm9IymOWfTrE8eK32pAjd5AI2OwYuWC
         y/t4QqK+JtZ+N/wquk027M/IS+gQR7vIR1EWSRM/279ae5R7KAf54KoaPknPYmxN9cNe
         ptAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629634; x=1794234434;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z3C3fTfBmoqwoS3MGZeLcIJkmnsPUJSPdomT1oiAvZw=;
        b=eFr9p3GwFGRSDIdQXQRnF9ZEvKFu9G5COc6P7hOZOndjO1WYfCGk51gD2OM0esO2fg
         rWFgkkh7HfY0ArhgtwEZ13M/QqPbYKLs0vQgXeMaFKmAwbF06v81/q7rytwOd33AQZsW
         EsF/l62X3BZAcDtqiMZNdX26bcxOmdjSU2G4uxpmwqM1ZDz39u6VbrHyVUOaXN5GOlwr
         u2NK/ApL+YPfUdIjS5+CiOq1tgwF6MwzyYz/U3mISObswkuOfO1Mhr2OzVQqILruAEXg
         ARJi19j8WqBtAo760+iAjDpm2l9dl6e+YV0xbnMqxOeVcDkDg07wLLu9hu3WY4NmzszU
         aYZQ==
X-Forwarded-Encrypted: i=1; AKwUvByyj5GgPuNhddSDR8h/Xvg4fkZPGC8B3ms4ZiEWhgrxFpt5tFLHixy108n2dAImdGNqSyOuTO+QzLGFJhs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKRAzXz6Eecc0U41ZuNIUPiXV+i7Zl574MZslt+aRJODz/VyjB6
	0+IPGxmImqgNa/6UcdkwikxLrNblO7OlVDflXFXSlhUzV+tiikF7IWXitv3AHn3YX9BjI+BvEdx
	OdEpbptTMfzA3gi4z75czzlCHoNUIblInWHl+pN/ITJmH2yxRi767J/5gZrcpuAld2K2FcQo4F6
	+hQRzUOYvue7cXXvh1XCI+Aod79inW5z1iqmwuS+PLKg==
X-Gm-Gg: AYBFou0jCeKZwuIEzz4DF0BaO/ghMjMPj1avrufKYIZNlhzS0uKr+xt+hqyRjmLM4RV
	dCO9U2N5AGjXL3k8gW7N2vUg6QkA8tQ38SLQ/WBPtoggwf0DIzRv3I6wza0RuhXgJI0t/79jQ7z
	n9YyVWiBW0gtC2OTo74p2d1Y8JH+GXcKDbJjj79/o7ilPfLHExkymZwZmfuA==
X-Received: by 2002:a05:6820:7081:10b0:6e0:1599:a4a with SMTP id 006d021491bc7-714f290f51emr4033710eaf.35.1793629634200;
        Mon, 02 Nov 2026 06:27:14 -0800 (PST)
X-Received: by 2002:a05:6820:7081:10b0:6e0:1599:a4a with SMTP id
 006d021491bc7-714f290f51emr4033681eaf.35.1793629633693; Mon, 02 Nov 2026
 06:27:13 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101175553.53746-1-nicoangelodelacruz@gmail.com> <20261101175553.53746-3-nicoangelodelacruz@gmail.com>
In-Reply-To: <20261101175553.53746-3-nicoangelodelacruz@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 06:27:01 -0800
X-Gm-Features: AclHuK9APyGtpZOJQcsejCVfEW4m73oY8nFEMTVCqR0OB1TvK7sTUjK0ek7HnrA
Message-ID: <CACSVV00ud7+mJ0YWM4a_jzRwDuZTFkHkLF3tXC9NBwMcmyMUfg@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/msm: free the crash state asynchronously
To: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX/0yjACzILsYu
 n8Wqd/aQR4hwsXxeRthkfzEezEPkjiIk2QSHUrj7H3fTUhjurbNSsSco0VebrmAtN2GzTKN4rYj
 ft/LKa3+Blht4c52aEece7X6CHYa8t82WDuNIttvxmYXg2vpp2Icj2mvGHEns9pxs82o3TYWn2y
 e0Kmv5dX8LVD6jM3rQ3He1PkadXdFE9dME+NKzupw2No4cHWU1c6esL+6lYEDKoHA5X56bYO+vQ
 d4HVaIzNVVvR1LKpZQGnveuI8vlTZ8TFY+ucKCF1KV1iANq9inMKKXio/C+kQy6Kg2JNbARoWdT
 cMrFjCEubSkLMW9GriMm3+uoZPO+7ccH5/W8vyBN2p0w2s644Wpd7+HlJW+NpVUZSQZ3IWUbqY/
 Jdj7OhlLCWBXexpZrwnAc1If+qd+5RQu2EXVMX3lpWZy3iQiRlF+MiqlCoMoIOjelEhSQVjYsn5
 oJlXGkeoRRkKl/n+aMw==
X-Proofpoint-GUID: iD4odKJrDKFcKZwYKglintpc-YZR9WkD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXzNbdRn4S3BYQ
 +Tzzgy4+R26EFYsSRFP+jOWD94lVu1yXAcfGOoxywch16dcXoet3lZHJ/KZHxdb/OMfArxGuiaX
 iwpPzGx01L86+2r0UOX6PpGAAh4cF1k=
X-Proofpoint-ORIG-GUID: iD4odKJrDKFcKZwYKglintpc-YZR9WkD
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae89dc2 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8
 a=PDzu0jb1FHLFr2hdgv4A:9 a=QEXdDO2ut3YA:10 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On Sun, Nov 1, 2026 at 10:00=E2=80=AFAM Nico Angelo Dela Cruz
<nicoangelodelacruz@gmail.com> wrote:
>
> msm_gpu_crashstate_capture() sets gpu->crashstate and calls
> dev_coredumpm() while the caller (recover_worker() or
> msm_gpu_fault_crashstate_capture()) holds gpu->lock. When devcoredump
> is disabled (/sys/class/devcoredump/disabled, a write-once knob) or
> its allocation fails, dev_coredumpm_timeout() calls the free callback
> synchronously.
>
> msm_gpu_devcoredump_free() then calls msm_gpu_crashstate_put(), which
> does mutex_lock(&gpu->lock) and so recursively takes a mutex the
> caller already holds. On systems with devcoredump disabled, every GPU
> recovery that captures a crash state deadlocks.
>
> Defer the put to a work item on system_dfl_wq instead. This is safe
> because msm_gpu_devcoredump_read() takes and drops its own crash
> state reference, and the work takes gpu->lock normally once the
> holder has released it. gpu->crashstate stays set until the work
> runs, which only means a capture in that window is skipped.
> msm_gpu_cleanup() flushes an already queued free before teardown.
>
> Tested on an Adreno 830 with /sys/class/devcoredump/disabled set to 1:
> IGT msm_recovery gpu-fault recovers and the GPU resumes.

It seems like this is missing test coverage in msm_recovery test.. it
wasn't a case that had occurred to me.

Care to also send an igt patch to add this case?

BR,
-R

> Fixes: c0fec7f562ec ("drm/msm/gpu: Capture the GPU state on a GPU hang")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 21 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu.h |  6 ++++++
>  2 files changed, 26 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.=
c
> index caa86279f..fded78fdb 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -175,6 +175,14 @@ int msm_gpu_hw_init(struct msm_gpu *gpu)
>         return ret;
>  }
>
> +static void msm_gpu_crashstate_free_worker(struct work_struct *work)
> +{
> +       struct msm_gpu *gpu =3D container_of(work, struct msm_gpu,
> +                                          crashstate_free_work);
> +
> +       msm_gpu_crashstate_put(gpu);
> +}
> +
>  #ifdef CONFIG_DEV_COREDUMP
>  static ssize_t msm_gpu_devcoredump_read(char *buffer, loff_t offset,
>                 size_t count, void *data, size_t datalen)
> @@ -215,7 +223,13 @@ static void msm_gpu_devcoredump_free(void *data)
>  {
>         struct msm_gpu *gpu =3D data;
>
> -       msm_gpu_crashstate_put(gpu);
> +       /*
> +        * dev_coredumpm() calls this synchronously when it can't keep th=
e
> +        * dump (devcoredump disabled, or out of memory), while
> +        * msm_gpu_crashstate_capture() holds gpu->lock, which
> +        * msm_gpu_crashstate_put() also takes.  Defer the put to a worke=
r.
> +        */
> +       queue_work(system_dfl_wq, &gpu->crashstate_free_work);
>  }
>
>  static void msm_gpu_crashstate_get_bo(struct msm_gpu_state *state,
> @@ -899,6 +913,7 @@ int msm_gpu_init(struct drm_device *drm, struct platf=
orm_device *pdev,
>         gpu->dev =3D drm;
>         gpu->funcs =3D funcs;
>         gpu->name =3D name;
> +       INIT_WORK(&gpu->crashstate_free_work, msm_gpu_crashstate_free_wor=
ker);
>
>         gpu->worker =3D kthread_run_worker(0, "gpu-worker");
>         if (IS_ERR(gpu->worker)) {
> @@ -1047,6 +1062,10 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>
>         DBG("%s", gpu->name);
>
> +       /* May be unset if probe failed before msm_gpu_init() */
> +       if (gpu->crashstate_free_work.func)
> +               flush_work(&gpu->crashstate_free_work);
> +
>         for (i =3D 0; i < ARRAY_SIZE(gpu->rb); i++) {
>                 msm_ringbuffer_destroy(gpu->rb[i]);
>                 gpu->rb[i] =3D NULL;
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.=
h
> index 5cf220f75..db9e11e7f 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -258,6 +258,12 @@ struct msm_gpu {
>
>         struct msm_gpu_state *crashstate;
>
> +       /**
> +        * @crashstate_free_work: drops the devcoredump's crashstate refe=
rence
> +        * outside of @lock, see msm_gpu_devcoredump_free().
> +        */
> +       struct work_struct crashstate_free_work;
> +
>         /**
>          * @recovery_in_progress: true while recover_worker() holds @lock=
, so
>          * that fault capture and GMU waits don't wait on a fault devcore=
dump
> --
> 2.53.0
>
