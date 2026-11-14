Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794674445;
	b=VqpbSFlLC7b6ApyEXO26VwqdGcPUcCqx1bmTqjkcIfrHc65PJ92uMvrp+g487j29lArL
	 gviEEItXV+yNss+bklDEJ1WQCNdCmnBxFvkmxGeHHpLGei6Ii2IfbCn4oF8MD5vtRXGfz
	 2wlEzTTsPpOlZEpVXnI2bYDpiXlFtz3vu6tVO+Qz12FIGeYZys+xqhhvpWDDLuZ5qMOHk
	 sFJTXIemqmv8p+F6ZSz+0M01OJy0flDjaJVL/uyfP27abiqWAGaF1n3eleixThq5COYzF
	 06qsrakaiHPqh4/3JxuP0A/fZ2fyOchLheXjyUugDPezQYICDA6nENb64QlDWSsH8+Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794674445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
	b=IdT4CwOu8B1dcN3hjtPVni+s5TW2jROWIP1XZH5K53CYS7mRgOzOqmbh6+bV1B4NVzZ+
	 LgPiLhg0xekIP2IF+oBnCBEkpV5BsUdiyDOHHAcMez7FuQEfZCyb5a1hIgoG/j1KYbZp6
	 Ab/LJWo8rpXXJjFdTIt7g25t4zxwvqwAeSeXkqMldCJNgsOMwjsjnXz835LIaIDUne9pZ
	 rSacgJ1OS8Xv4fUAUu8AzMielEzc9Acl16cLXplCBTYhxQx0nwyaBOTd7zTGWW5rtyhvs
	 T/GrZGJk2aB/GUy/9JhlHS28MsHkokw1zcz1UO2hOFxUwR3hEw1SIbaPThO974uWc2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpYXnSkd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEyKBndF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88BA606A333
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88BA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fpYXnSkd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PEyKBndF
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDkOuH3174232
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:40:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=; b=fp
	YXnSkdnG4BA4y8XDLRl8x2Co9x2NAPivGl8Owm4IYNiITvILAgSN3/MakeeFTb51
	oQ8ysc9yiMQMzZ6pOGm6khvyUOxdnIydruCt5uqV4NQvj3bpmKyr+kOnzdaUlXKB
	hevt+FA4bZxt2sFFHBKSpKAMO1WBHi30sU/FjKa0QRmwba52oYXcestA+zmoVJft
	Yym1C5/qt8+wUAa/sTnxPbYtcn4CE8g9YUD0UZo6STZrnIOTbUaR5h4Z7ev67KyG
	3CA7GXlrMqCtC3IE49B4siNKjkxkxF1tIYcUo3ePvlp92/FNIZAg6xKIAOZmIsjV
	NCZGFDSvrVLBR78lAFWA==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhh7br-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:40:43 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-703a37d970eso2409980eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:40:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794674443; cv=none;
        d=google.com; s=arc-20260327;
        b=YNeP7bvlEnC0wa4L8A/6gF8Q4cB+HgYlUbR4Yyh9176ouLZrbE1T4dha6V/g46I7tG
         /CNBqjQVa9Oufl4RlcPzSwEbQWwdrka6AWE5t6qliaAFXmBGp5xSjNGhtbsh1oRSa8jZ
         tg4XCa5GGdmfJDsD+i8gBWiZrXl5oceZgfay92vjrPwRox1ybuqgsBJ39qIP34BzZNc0
         Xdnz/I5wMlUBLUHq4j44snoDQ2hLaU8WYnWGpPhRax8hjE9e4wPPPNuHoUVoipZjHly1
         T0C0SrSmkOTd4a+lxAxdfffjFLolRK98AiVRThmDV6rcS21piqh8kXqJSKbn8MH1g2IO
         XWeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
        fh=ADxeEaKWxWdHW0kKKw8gQCghFzPChiznqYiirqeX3sw=;
        b=NkCuZMLN9o+6cvbL9Ho2q5tGFQofG2kZKxYsoxAS1LTtu1xbYWWbcsHpzOK2Qjtb1e
         h0pBMdzFH7vkQpgED9IP06i6E3t0+Kyj8e1VCm6jKgjVjsxbBMCs6jFeauXes6CsMD7H
         XEsuKEEZ4UyUC9lzpGpoZtYA/aoHg8jKLajKhOOliSD3vRvMkv0KklLn4xSPIUTX4MXt
         wbbpkEhTCaLpyeQUHJmvwDek221GxLv6H2/wDgz3u3PDoGLZFObF4x/4cj2UAJbLyhKY
         EFKDn7VgUNuSFdEawbc1wAKAx8GJZWiXW0fMM3ZtzJMq6MI09OK3Er42kbv614HlGwxM
         9uEA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794674443; x=1795279243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
        b=PEyKBndFsBRy6cE+pH6wvUPpxLuqOFsAMgUnt6zROwdejjuihiLQYeOlCBoLvqUiHI
         NLrND11V6vM9gjVqZMMrelLjeLmYj1wDFK1X2Ldq0nQ2xT96OQRxjbGywolczIHnudsG
         gmFL+d4iKq1E6nJUbFVW5VRqr841KnY3HZNv7OAtqswQvjb3aE0bqGVngXb2nbyl0Bp0
         TkzLqPI8j0OdDrkDWZfYOm+6gF4C0YC25rElTQE8HWIUck6KdnJEh8KQvUqn10jntAH6
         MlFC7E7/nJQw7wYZxz0PYlY7XVboE5D1FkuogrYeCywEDFY8VSN910NjT0FFbUuLGWJP
         WYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794674443; x=1795279243;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXkHJphoEY20da+45qB+WjPGBGb3UoQAwSXHDIUPxh4=;
        b=uRKmfvrCBiNRrVFjiu5vblJrI6t9pfzt1rxrhq86+08UElzLt9YQXnTxR2AtSImDLJ
         Ylt4I1oRlkfhzWX3GotoaH/ZrcaRDXDYJiCPnnP49te1PJCPRPWyfbzlmc5Yl5B8Mpe+
         0kjiw2KgCvGT8NdiAteAVUb7zi9nNpWEzBUyC0y17+q4tER9qOtJZIBs6S1wnKZHMhGy
         NtBO7ndxaX3FoHWapixBp3wBhLGJM1Yc0mzWqYb/q5yrWQLDoxD8X/pDI2MPKnqvetIA
         iliM/DaQgmuzj5+h67hPp7oiXiu43VBcmR337KUb/yqhmP2Gc1yebgt3/bmuYKyEDNC7
         uNlw==
X-Forwarded-Encrypted: i=1; AL+hErF00FHDlwP+oST77T38NN3lj/5aewCsXEi3LknoQzOtSj8zeuOlTIOQ8HqlNGAlM2lZC1jQA7ElO2M76w8=@vger.kernel.org
X-Gm-Message-State: APuU4Z880IwOOTF1oZMcoTD5ucyPm9uHicXwYXgOuAXOSqJzk+2c3bYz
	Egn/1H7YfZ+X2HGtHBX2XX8yFQzbazJiBrFdKo9WmSLCMYBtbdRW9SqYVqK2plFXSQ4ZYcL+sTx
	3P4VQ8az+AoS4khkTa4A+ZevSk9kO8I83Pm75ZpyJN1UUCjq8zSXVvEiArcvNorwOfkmkNE9/fn
	JQ/WgI/eGan21+mJT8US/gY+3fbyNJk7ebr9DEUP3OJeZu1rPj3l8T
X-Gm-Gg: AYBFou2msnNWjx8ZuIahyo8/1o49YnmorgCVoqpukFnGTBesWaBCjJeaX7j0mlIOZ2y
	HnUMSkmNFCg+OmHXQ36/W6Firii+wf5lJuLmfjTE6xwECYFQ7qwotdkHWUvEr8nP2H1m5bh5ZPW
	l1jmCKBA9C0OtFk+2+c7AFBnTOipA286LBlADTELG8RQjDwQsv3Otjq7HaRCkMHe0wvTwwztbFv
	8gu3PPx4nFMtaSInvEtwA==
X-Received: by 2002:a05:6820:1394:b0:715:453:c6e2 with SMTP id 006d021491bc7-71ab4fbfbebmr3860139eaf.33.1794674443076;
        Sat, 14 Nov 2026 08:40:43 -0800 (PST)
X-Received: by 2002:a05:6820:1394:b0:715:453:c6e2 with SMTP id
 006d021491bc7-71ab4fbfbebmr3860118eaf.33.1794674442621; Sat, 14 Nov 2026
 08:40:42 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CACSVV02fCwbFXVjE+XHCo68xMxYUHovJ9ZHRYd98L74N1T14Hw@mail.gmail.com>
 <20261114153622.148125-1-arpe1618@gmail.com>
In-Reply-To: <20261114153622.148125-1-arpe1618@gmail.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 08:40:31 -0800
X-Gm-Features: AclHuK8v6yocAMov5_kcb3jEgrVHdGlRUdiYk4AGEpFJ8mzDlgn5asj4NprUyOQ
Message-ID: <CACSVV00ZppfBKwsHJ+NBYBB7a2f3g1O=6J4Gt1m_A74fudZQoQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] drm/msm: Fix VM_BIND job, queue and entity lifetimes
To: Jiwoo Kim <arpe1618@gmail.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Anna Maniscalco <anna.maniscalco2000@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: -ZKt1w3pt5KAbgrPtxHBCS_IXZrwbHAh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2NiBTYWx0ZWRfXwsvZqTCs3Idk
 5X4uE1xLQRw5Y30dfynaweH+ht2tGK7bRUhvMyVSLyW+8Rr1gjaZ3p/OEhimNTTy6BGYu/l6ZP5
 rxro/LA8U/v/G25QWTaf4Al0sS4ll90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2NiBTYWx0ZWRfXxttgRwkh7041
 VEGL7aGy0A1aFBqiYQ+GD5I3o9sAyk0/f8MCNJDQ6I4mpW5UYpg7CCo+D6zy18uyztQQopTNSvv
 rPYnD0XgIYb3s3ZS/JzAl9ObMqzLKge/E10wmCsH6b7n2iXYM83Fhzf9NXgEQoLhNTFMkvBf2fo
 A3JyfbglIsWAxQN7yirQWoOVmdlao2alshrA4TDir6Pfns7u9alzsjWGwMmLAXdx7MJbisPVVA6
 6YymiZDybKtv1owu0iCBFJf5PgM0sQt1cIDvZ5f+/K06bbuu0dZrFaWDA4XoG/FkfbsUnaeuHo8
 2lDGfPTYUhPinHVh6X8pBp/fRgJtQZAv25+aFoTvvC/hKaF0iTd3iaYEDn7s+Sy/p1n5mp//Hmb
 KYWA8159bwd42DuTMr/GkFeh3K65aPdUEtLCrXM7u2amZKxg8xgij5dOdQ/j1V/Tm64Jyv68OS/
 KIuzC3AQm371HPIFUZg==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af88f0b cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=2g9MNY1Fx1-Z8oZBzW0A:9 a=QEXdDO2ut3YA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: -ZKt1w3pt5KAbgrPtxHBCS_IXZrwbHAh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140066

On Sat, Nov 14, 2026 at 7:36=E2=80=AFAM Jiwoo Kim <arpe1618@gmail.com> wrot=
e:
>
> On Sat, Nov 14, 2026 at 7:03 AM Rob Clark <rob.clark@oss.qualcomm.com> wr=
ote:
> > msm_gem_vm_close() waits on vm->last_fence which will be signaled
> > after msm_vma_job_run() returns.
>
> vm->last_fence only collects the fences of GEM_SUBMIT jobs, in
> submit_attach_object_fences(). VM_BIND jobs don't add theirs, so
> msm_gem_vm_close() waits for a VM_BIND job only if a submit depends
> on it.

Oh, right.  We should probably just update last_fence for VM_BIND in
the same way.  (Ie. using dma_fence_unwrap_merge() to deal with the
case that the current last_fence is on a different timeline.)  I
overlooked that.

> > My expectation is that if thread A is in midst of a VM_BIND ioctl,
> > perhaps not having created/updated last_fence yet, while thread B is
> > racing it closing the device fd, that file_operations::release will be
> > called after thread A's ioctl call returns.  Is this not the case?
>
> It is the case. (The vm_bind_closed check in patch 2 is only for
> MSM_SUBMITQUEUE_CLOSE, which can race with a VM_BIND ioctl on the same
> queue in another thread.)
>
> The problem is a job that the ioctl has already pushed and that is
> still waiting for its in-fence, e.g. one from another device or
> drm_file, when the file is released:
>
> - If the queue was closed with MSM_SUBMITQUEUE_CLOSE first,
>   msm_submitqueue_close() no longer sees it, and nothing waits for the
>   job. Otherwise drm_sched_entity_flush() waits at most
>   MAX_WAIT_SCHED_ENTITY_Q_EMPTY for an exiting task, and kills the
>   remaining jobs only on SIGKILL. Either way, the job's reference
>   keeps the queue, and so the entity in it, alive.
> - msm_gem_vm_close() then calls drm_sched_fini() on vm->sched, which
>   frees the run queue that the entity still points to.
> - When the in-fence signals, drm_sched_entity_wakeup(), which the
>   scheduler registered on it, uses entity->rq->sched;
>   drm_sched_entity_kill() leaves that callback in place. A killed job
>   is freed then too, and the final put of the queue calls
>   drm_sched_entity_destroy(), whose flush reads entity->rq->sched
>   again.

I think if last_fence is also accounting for VM_BIND jobs, this should
ensure that all VM_BIND jobs are also finished.

> Patch 2 destroys a VM_BIND queue's entity when the queue is closed,
> by MSM_SUBMITQUEUE_CLOSE or on file close, so always before
> msm_gem_vm_close() tears the scheduler down.
>
> This comes from code review (see the note in the patches), and I have
> not reproduced it.
>
> v3 is at
> https://lore.kernel.org/r/20261114141851.134290-1-arpe1618@gmail.com
> and its patch 2 is unchanged from v2.
>
> Separately, Sashiko's review of v3 found an ordering problem that
> predates this series: the VM_BIND queues of a VM update the VM's VMAs
> at ioctl time, but their pgtable updates are not ordered across
> queues, so an unmap can reach the pgtables before the map it undoes.
> That does not need a queue to be closed, but v3 patch 1 adds another
> way to get there: the unmaps it applies when freeing a killed job are
> not ordered against other queues either. (Its other point, that a
> killed job's fence signals before those unmaps are applied, I'll
> address in v4 as well.)

Yes, userspace must use fences/syncobjs to synchronize VM_BINDs if it
is using multiple VM_BIND queues with overlapping updates.  An error
would mark the vm unuseable, and the kernel will stop accepting
SUBMITs and VM_BINDs.  But maybe we should also handle errors in the
UNMAP path as well, as that also indicates that userspace is doing
something wrong?

Userspace shouldn't be allowed to cause the kernel to do something bad
(use-after-free, freeing pages that are still mapped, etc).  But it is
perfectly fine to let userspace shoot its own foot, for example
triggering an SMMU fault due to pages unmapped while the GPU is still
accessing them.

BR,
-R

> For v4 I would make a job that unmaps a VMA wait for the job that maps
> it. The other way round, a map that overtakes an unmap of the same
> range fails or gets undone, which breaks that VM but doesn't leave
> freed pages mapped. Ordering all VM_BIND jobs of a VM would be
> simpler, but turnip uses one VM_BIND queue per device plus one per
> Vulkan queue. Would that be the right direction?
>
> Thanks,
> Jiwoo Kim
