Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793207778;
	b=Rf8665V0r72v8kVho9BRHwk9rCpa+oH3l6z12DPpxV7wUlePJevHUPlLOjvh1jFpco39
	 FhFv/XG2p08HZZMYKCOZ8FgYvdmGydWTWcdygRNZaYNVhXecRSv0kFXz8SUaL8JZUFRKg
	 Pa2sCm0ZOnTa7vtiOwpVD4m4BqCH99Dts64P1KobU0Ykq26ncL31vwaxu43NXpbzYIvTq
	 2HNXRDdAkvSCZhC8d0fDH+ZGiekcU9cNv4k3IJrZ9Knu7GccTvpu/ntoxmBl2QmoNIREC
	 zR0GHvyB+Um7QTPOnqYEyAwTFcFUYX+GsuUcekCh3SRMrdgHxtMhg+BFKznUqTGb1oQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793207778;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=D7GG4SgIjIgyPXJ6NmPfb47FfoLIQACfPP84KnXPQTk=;
	b=aFUt6MAm26mQyM9oRYDMmDCOqYKphzIAzad0yn+Dr7I7hLrcni46m7ktHURKYw5A6IrB
	 1deiYEm6Y7WwblnlXmp77iUV7FwkUm+b89+TpkBqaZIVLvXVEk7C3afBoIv9nMBP1aHBq
	 JYDZOhzaVmFDqhJw7teoTu8uWHfwb1WQeIcAQZ39hpYozudJVRAboSKGcWTt/Igt+4nc6
	 tI5ekuyiuBFWup+reC4ooTz2CNSXuyJbg+2jsVf79eIbkfPOG45CKN+UYytm0eJonqwLu
	 i7MJM1QN4XN2CQflDZ0xfdA6OiTmKtJN6dnZU9Z3JZNSi/r1tke6+5Vv40hVeUsJjJQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V390VyH0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdKGMSTj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 631C5606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:16:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 631C5606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V390VyH0;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OdKGMSTj
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SF9sma966140
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:16:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D7GG4SgIjIgyPXJ6NmPfb47FfoLIQACfPP84KnXPQTk=; b=V390VyH0LdF8a2Lv
	+sXglJb5Aa3ivHajkH+ONtNVtwo0SGCJ6Z+Oz0FWmxCNoR7M8GljvWCb1rZPgpBM
	jN+2KTBnxFtVX5+JpXSzJY/zzVkW2LwnhbFfH38HTRUwGcE0uBXBBNa0gf0POVcy
	OZJqBEdWNCTcPzpSepfmg+1s4HGnrRDdDEJIZ7wamjttuOZyr+/8uLVsl8ykqUN3
	tV5UNzmiuxej77Ml3CIQByR0buz/zpLH6IwUDOL6m4Iff4KxrjrzUmAJQ33DEYL4
	jhrpRlz6itEhcgimMXhtw1CFhA/TAWQ/CqXiukqqqs5Z+JqX2btt3P1F5kcuayXy
	h0rM+Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtjh3b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:16:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3adeba76cadso866079a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:16:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793207777; cv=none;
        d=google.com; s=arc-20260327;
        b=XuhJHjmrPAbmLyENBtqa2SfbYS5nordjVwZ1o1ErleuHXx6VtewgvO47raHjKg7OWL
         gwoqBMX3ZEf3u+C8V9z33HPHuWVaEhLk4ku1r891Imx6ocaCZvG4TqLvtCZ1uSWRHPjv
         fGkIv8s1a9WE5DtSGJqTrspkupBgZqhoEsVBcHgXfzqIKa+oZyQ8GZGElGE1Z/ixKfM+
         dtBfgpJHYg4NvgzWPgGd6PQZYx68XhiGGHbhnBZ3aVpB8KEFctyUaZ8mD70jjJNKJmvn
         mzidZYB4hSwiCmouDGuPUioLvL2QeBPLJ9DexRtQYLy+PMLk9cTN6c+04MS7CgW2xL5J
         tYTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7GG4SgIjIgyPXJ6NmPfb47FfoLIQACfPP84KnXPQTk=;
        fh=jcPg5f0S+cL8etX3lovDAO0kVtT7KxBhh7Ziy0hY3JI=;
        b=fQI4GDupPQrVUKMLe6dn0zadFSl1WLup8z54bY5ueky5PBZ7p2/mfcScSJpX95WVQN
         PA2vOso7TwnlHCTyEnVcmrBAihSRw9nhzeM46VBJfdrTo+WqyN/I16FsKRI/lnTrFmdh
         5WmWLiPHu5pgT/CDDFcJzZ8US+YPF7qpOPky5s8ghKCzQ6131GgF+BZMztBXMLtjIjvW
         MvLbsSJF0nTAaj9chP/N5GtscqiPjKJFcPKxQhnsvN+prer79QcuBHUO2lbLGjpCN/0Q
         qhmN5HBQwnb5EVS7GmyQyWs4ibCmptWyAjp/Wd8DSWd19IY0PfiuAaDYPMPydbUcmfsh
         8Gdw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793207777; x=1793812577; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D7GG4SgIjIgyPXJ6NmPfb47FfoLIQACfPP84KnXPQTk=;
        b=OdKGMSTjWmTqKnSCB/1NCwBdlg1psqK4h/ADk2h4E88WIDUAo/6SJOdatUxitwhFYG
         SBFR5LnuEVzLmtrHmppdDV6/GL/B387G0lbT1Yud3Rt/ZUcKjxWSx98Rtc0iQvdc431g
         EShigpmHBTzpqZwkzNeJev7BSUIRFE48s1KUkaS64vLvgp57r2E725kgl0SxcyWmXkOO
         +ldVgPg5JnPlUj7evyxKspER3yFVt6Bu1NHaoHLAE98T1MmEAN4m4n676wkI9zp2FICZ
         gYNTINcFyU05Pg3Z8dSkui8Ujm0H8AYbGryko34knto5vPMGUQHnAxXwl+cuxWpryojd
         lYAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793207777; x=1793812577;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D7GG4SgIjIgyPXJ6NmPfb47FfoLIQACfPP84KnXPQTk=;
        b=c/WKXpTzUu+mwD+8vPRK0EwT0P3lRL6e81+Yqzi5IdU4dBHUicag0rIWSGscLna1sW
         tsLFC+i7DktOw6nJi6eN55ewyTXOa+EGRRlLeqqjHxey6GQ6ar05Gqi1dp1eKBzWSt2x
         qB2lDVQh2qfuTM1XRgXki2pCkSN1R7QrX+j6G3KLYnh4QJpC0TI7xWq0AR8BI5IaIuq/
         vDbFzuos7aG54DxY94ueG2moMf5JLcQqLgLhCxzh9C/B9GAtZ5Kc5xyDlypLJ7r12r0m
         5vBn7zhfeVuDckN77PcGsUOIQarpdeB2H7eEjfKHTsJ6qmFAvqcN0T6RHE+7Nf8zqvyr
         TnOQ==
X-Forwarded-Encrypted: i=1; AKwUvByJNDJrDe6zJ8AhQOD6z0ZDUrN4vmYPEXBY//tNg2rD9EJyLJ9yZWtUFrS9UtSTXLmL96Wpnx1dtClDKWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKEPXuXy9uCtKknkM7HANAkgj9GEPaV2pYmUVyS1fpVyjx6giac
	5qDQ++PMoy7twWzYLtQcYEpTnv3lTt7Fr6ozer9SkBH+ma3r0FglcfC/MkOLp9+kPDMtMWK+8LI
	9/hvE/J5r/mruT98SXSORexVch7+tDqkGWC3LijIYIwQJVReGSG1eTsFzYfphBndhaTqz/GQhiD
	KHyfMnkI0K4GecGguaKTBU7EbA938VTFY2LD1jJmPVOw==
X-Gm-Gg: AYBFou2Fb+Hi+YTts4OponhYq4x1HxEfahj1zQXkdA/w+SG6pnMJOTZstIAfow4fO0V
	JxJvPovB2n0UxqSwxozTYQFaJSqSYe29CSqZ9makSHTuqXkRuKmsDxsR7WkMAc/EUqrFodMSXm0
	S27ubd/ScDIIn6hDRHW2oQfs2gVvo9Fo4s3OUhvLWq2rgQqr0/gOZvlRyLiA==
X-Received: by 2002:a17:90b:280b:b0:3ac:8af9:4a6a with SMTP id 98e67ed59e1d1-3ae580df8d5mr2117280a91.42.1793207776925;
        Wed, 28 Oct 2026 10:16:16 -0700 (PDT)
X-Received: by 2002:a17:90b:280b:b0:3ac:8af9:4a6a with SMTP id
 98e67ed59e1d1-3ae580df8d5mr2117255a91.42.1793207776430; Wed, 28 Oct 2026
 10:16:16 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <1791876245-190981-1-git-send-email-shawn.lin@rock-chips.com>
In-Reply-To: <1791876245-190981-1-git-send-email-shawn.lin@rock-chips.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:16:03 +0100
X-Gm-Features: AclHuK9Kxlm5C3IgAhirnZvTK6BIFy9iuNX1tDcinEVTipCMGdkXQyIMtujIolE
Message-ID: <CAPx+jO_Oo_Uv4vagaBzyss6EuAm8g3eYRJ8v2V-e5k4k10R-SA@mail.gmail.com>
Subject: Re: [PATCH] mmc: dw_mmc: enable MMC_CAP_DONE_COMPLETE
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Jaehoon Chung <jh80.chung@samsung.com>,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX48a/NG49DnE5
 AXdLLgn52GlKPY5zZdcpuLsikp5a7UslMNSR0UAmJzVLYOGRxqz89D0ALhMcAFb2AfbiaVnqs+I
 clEWoXBjpaCVxgRqgTORWdR1cCI4jYd44QTfPKMh6mLcBuWiRICmuY9r1kXDpHG9W7fctcGEVdi
 wz1gDILGLzUuCrqnWx3Icq7wqvUxHS5tGE6QK+YXSueeJdgY4mB/zQ0McpEQ+PaiyOIN59aPBcp
 ohaGdCdXIdwcgiNC84mEE6e/tJCzYel3TrIMyykUGh+tJ3imIUl27gdSNc/vsYHCF4usHOI4/zY
 g7rECQz+g9KTc1pLgci0kn+wXphUDTpvin31kCdCyGj65mwp1YAk1cbytpU3TsbbkeqoQ7/qFUy
 q1ZLgr80FIIFaQJcX6gtZHx59IjaAT9OogzmyxRDR9Dj5sIKy3xBA70B6gGUedrK12LyJRKSXoP
 HatdFQgwm2csTt2itOg==
X-Proofpoint-GUID: rViELXv6491MId7p36ZsD47HH7xPH65p
X-Proofpoint-ORIG-GUID: rViELXv6491MId7p36ZsD47HH7xPH65p
X-Authority-Analysis: v=2.4 cv=LdipeTfi c=1 sm=1 tr=0 ts=6ae22de1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=s8YR1HE3AAAA:8 a=fHPB9ihC9Gx1bL0rJyQA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=jGH_LyMDp9YhSvY-UuyI:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2OCBTYWx0ZWRfX4OLGqxazsgcl
 2Iq6HC3uYqGNHsh9FDrDCrbvoABg2jsG/qf2XAymuEARE7sFZJ5FjwR+Z0T20hr+9/V4I1nbAg4
 4ze7NCagwB8hj52/vsng7+prveIptw8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280068

On Tue, Oct 13, 2026 at 9:24=E2=80=AFAM Shawn Lin <shawn.lin@rock-chips.com=
> wrote:
>
> All requests issued by dw_mmc are completed from dw_mci_work_func(),
> which runs from the system_bh_wq workqueue. It is therefore preemptible
> context and host->lock is dropped before the completion, see
> mmc_request_done() in dw_mci_request_end().
>
> The dw_mci_interrupt and the dw_mci_watchdog_fn never call mmc_request_do=
ne()
> directly. So every request is completed from a sleepable context with no
> spinlock held.
>
> This is exactly the contract required by MMC_CAP_DONE_COMPLETE, which was
> introduced for hosts that can complete requests within mmc_request_done()
> without deferring to the core's complete_work.
>
> Without the flag, the core records the finished request in
> mq->complete_req and queues mq->complete_work, i.e. a second workqueue
> dispatch plus an extra context switch per request. With the flag,
> mmc_blk_mq_req_done() completes the request directly via
> mmc_blk_mq_post_req() -> blk_mq_complete_request(), and a following
> request completes the previous one inline from mmc_blk_rw_wait().
>
> Measured on an RK3576 SD card (dw_mmc) with:
>
>   perf record -a -g -F 999 -- sleep 30
>   perf report --stdio -g graph,0.5,caller
>
> fio: 4k randread, ioengine=3Dlibaio
>
> Without the flag, the completion hot path is:
>
>   mmc_request_done -> mmc_blk_mq_req_done -> queue_work_on      (~4.3%)
>   ... -> mmc_blk_mq_complete_work            (kworker/5:1H-mm, ~18.4%)
>        -> mmc_blk_mq_complete_prev_req -> mmc_blk_mq_post_req
>
> with the flag the workqueue round trip disappears completely: there is no
> queue_work_on and no mmc_blk_mq_complete_work in the profile anymore, and
> the previous request is completed inline:
>
>   mmc_blk_mq_issue_rq -> mmc_blk_mq_post_req -> mmc_blk_mq_complete_rq
>                                                   -> __blk_mq_end_request
>
> This can remove a redundant workqueue dispatch and context switch per com=
pleted
> request.
>
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>
>  drivers/mmc/host/dw_mmc.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/mmc/host/dw_mmc.c b/drivers/mmc/host/dw_mmc.c
> index ff0b25d..bec777b 100644
> --- a/drivers/mmc/host/dw_mmc.c
> +++ b/drivers/mmc/host/dw_mmc.c
> @@ -2945,6 +2945,8 @@ static int dw_mci_init_host_caps(struct dw_mci *hos=
t)
>         if (mmc->caps & MMC_CAP_SDIO_IRQ)
>                 mmc->caps2 |=3D MMC_CAP2_SDIO_IRQ_NOTHREAD;
>
> +       mmc->caps |=3D MMC_CAP_DONE_COMPLETE;
> +
>         return 0;
>  }
>
> --
> 2.7.4
>
