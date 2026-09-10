Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F7F49B1F9
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050034; cv=pass; b=Ty0WN0zluzJdOOwC2Ga+ZtH14WGP0T3I3e035DkmrOIzRGbMsKTJitSRCwhTLu+XzXuHWg7ckhYMC+PTDRo+d847nrj21WNQuMCp0BKaQBp8FJJw2yQY5WMm8K0jsXtqDWNWq7ZVdC04bUB+2r64deYJ3eKHOzxptd1WA0+6/p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050034; c=relaxed/simple;
	bh=9QJteI92RwPPdOMUgnNnI7QviKfuZP58/utp5AmqgiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k+HaXrOdZ/HAB06rAmtvry8IUr6rFkC+XP35B68+4KfhM5iHDz6I+dXpNCq68K5nvVaAy8VcrecZ7BIZyF18zbpcVKHA1K//Wg6VJfpnyXHB6yMlHSjFqEVyNaBtG3Ldyi1tq+EloVN43BzQGsfHQ0FBQ7Uoc2zvtn9gopQF2wE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TEl+QYBj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGgvcHja; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TEl+QYBj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XGgvcHja"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AD23XS2149848
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LzPgv+JUw7blI/3j2Lv9Lk9a
	WSnQjmSVlk9jgF9EUWw=; b=TEl+QYBjvKr7HpD3M/E1C0inzzxT3wPzMBXyaxhQ
	JS/k2+jCEgSrZI5BXgXVlsRw8NSb9S6vwE+BV6TNPQgVtJ1i/VGUYRW8xvArJpBb
	/FExhwovNJjR603crm8ThBG4bbHouAHtaZpkFVtj6BKT+ii/rzl6nGDYwhdmj4Ps
	/vIW9HOv7ifG3YpVyTiyfvPIMG12n812GMt2C72XhR4SfIJeR1BK0QjC2mRH9q8H
	CX8pRnTA46axH3If96TmEpgPN2r7k4NWxWdZR3TEf1+tKv/S3/XwAl62V2FMl6ZU
	XGM1IaoqCeU7iFyUzmBIrAeE5yMqXRYPbUS/inILFhZTrw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyhc956-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:20:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dfd33ffso98777205ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:20:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789050031; cv=none;
        d=google.com; s=arc-20260327;
        b=AJsbs89cxE9/tG3lTnQxdrRQaaI8g6mzS7tLdo9rzpqIF+GQqHtTYWNIBl/vFBSH7w
         t6LG24XmMibvk4bwlq9u978OlasDbEq1eLH1mI5RKy8hMgsW6Qr1khSc50MZaG2lLh2l
         okqnwoTPqE/AI6y+DTlpi9Tl4OSm5CJiqGinjHbG9y7YYabz7Vblxz/BIh72DOG6ssq6
         P+EzXHy2zthoZCFqSCq3k1fSP/T4FcO6muhC1jhMGp91F3MK2rMLENEN1UuNPqvTo8NR
         vtgOHWCo2p2vvmNLnF63t8QIQYv0qnZDqSYnBXFb1EEG2jVjBrf6IOW+W+tNWQOVLVzT
         2R2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        fh=o4+bRJ/AtX/skwEVfiF3HmgLb+Q4hlstLIjMc0QK2zM=;
        b=R0/t6c+04VRRhIVOAffujI7ieMVBEkjR8+TyqSeJiN6xWB9nMTgmBXulB19cV6S3mE
         UCQq88BDY1yNxD39Tldnaa9jztHPpYAFUK8lHPrzgrWqv4C3GBcdn5FMUbMe9zkhnuOH
         izBs6ssmy6njAjTt0MLTDoIYnLyl0G/firC3GDXJDrA6gfwwIZCSrxeFHEBmLe1paUEB
         pbxLCbaXFzepBgQW92t6WzXpIVgrukAnhKWq1LYzHCWAC1gqhOFY4dqQMSmql9O15Xue
         WvurGkFNb+vlfFEorzomu4zvUJvMScAw1G5ZRoiiXNn8muehylclqSS0V5WrAQ1Ni/Kv
         klZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789050031; x=1789654831; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=XGgvcHjakHEMCcbFOxRAiwHyFbdyEyVnszpA48pnhYPbvEgWmMSY8RQNtwRtOVQ6Fv
         eObZm9ijVXXqQL/YLWhthVap9w/tUye/PNnrXaZEz6BtbSRWKI2vNhVX7SMDQsqjsrAk
         3ROEJVBL0Rl7BrGrc/StUlxhT4Rl4/WSqnTSoNcYhcJnE/gNEfRXMFIbzuE8Qw12Bj0B
         fygir9DDyCP1biVDRdGafA+qHCumTUlrV24giTWwqdP5JTy3LpUfsfFcAkkCUkENGTWP
         KOG46SGTGiELNDoNInrDgLHsnxDA+/FZ81t+xubfEE6Mo5HfFnR9n/z6UmiHcJUWHCvL
         +Ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789050031; x=1789654831;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LzPgv+JUw7blI/3j2Lv9Lk9aWSnQjmSVlk9jgF9EUWw=;
        b=M8UMJU6grTlmRAMqLnzS4xo9o1SMzFB/E1zScwDkik4yRFLWo00LwRdyJY5FJnKQaX
         puTUDjHjNrc6LBTGyT1+IU5DQbbUDIcXOm745Hk9fg+0uLRVVopbCjHXde6FWutR1+XB
         kxJg9R/RjpuQc45BX9fH72lKd4SDeIU4SAdr/i8vsDwYX1g4T7tJH/wbyS7tdQT4bkfj
         54KpPhPVD3jOeEnz2/xWVD2R6m35jn5Y3SoV1VevdSOJor1cq+3f9k2x0DgJD3KULvd/
         dB4wVE/at1bDhLFcdRiWSWUPgUS9bKZP5RAzLCrRYzTyxs9CJkp8otFjzzlYJ5F3MtTy
         GinQ==
X-Forwarded-Encrypted: i=1; AKwUvBz6R+wT42o483WI+VqnFX1xk791aAFmKEBJiBtjc7huRUK3/5WErhm3jmZe9OqIyle+MRsu3J3BUlEqo8w=@vger.kernel.org
X-Gm-Message-State: AFuF++naoZJ50OliWS5kDCeNFz6dGJAKl1ZZqf4brnd6KY/sv7X1u79Q
	D4ac1iUosUtuZadjitxrISd5E+CIVjbTGvLpgQg6sOh0H5DcKfAhqa6ekq3q3mP3yZz8f4udFw1
	u6aB6DvMfhSsZ/d6uRaMsoiNDNfi1ao4K+ZgvYxpeEJ0oLhXUie+acWmzKuLo11/vCdJ4wwgXzW
	GEmcBO9qJQvAeUpxaiFATt9ak1chCqEE1YP61V0tiXCA==
X-Gm-Gg: AYBFou3AznDVfZPPj0f2BJ04utGGfSmSwnEIHmgubq4uSeSvgaQPT06lLPxLHl04LK7
	1YXP83JQZDxtramK99RbUey1UebW61jLh84M8qJVNloamF3AzPotsc9cglNXOTyONNgePOC/U8a
	hN5HJK/TspZoFOfb7VRCKJJKDTpi2dU8KLwX9Wr2HuXO42/qwDmTmjuCxXkIlrei7MDD2APTM=
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id d9443c01a7336-2db8dc82407mr200794325ad.12.1789050030740;
        Thu, 10 Sep 2026 07:20:30 -0700 (PDT)
X-Received: by 2002:a17:903:3d0e:b0:2db:2c09:98ad with SMTP id
 d9443c01a7336-2db8dc82407mr200793205ad.12.1789050030094; Thu, 10 Sep 2026
 07:20:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
 <DKL6P7G0WTM7.UJ6KZERQZDFK@fairphone.com> <iv5radfllym2bjvkrdu4ffs25bqixyos7k3ymncpcdtc2uobn2@zlhsybrj3pwz>
 <DKX384NK76OS.3NNOMAH72PV2P@fairphone.com> <ssleznoahzs4wgf5irjiagss2rjwl2s2jjnqrrnlpp74rdkgfs@au6x63ykyjfs>
 <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
In-Reply-To: <DLBKL8SJL58R.2XQ76X6JILZ8E@fairphone.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 17:20:18 +0300
X-Gm-Features: AcwNN1VVA4SntoL5ZvQXqShw0ZuVR288fdr4bQQ_lWLwdYYaNA3KoOK8hgJ80N8
Message-ID: <CAO9ioeUEQ+kzBLj3KTv+uayaE-5aw-aL49-0pJ-x_Vwq4nu9JA@mail.gmail.com>
Subject: Re: [PATCH 00/12] iommu: qcom_iommu: implement support for instances
 on MSM8974
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX3+67785BNPWI
 5RCujNTWh/LAXqcVGAQ1T0tj38S0Xo/kayjS6NV0ICfXMe3JtS66ofq9z9euAZ00pQ2kAhrl9jR
 //h1O7/EuJRnHCd1piS805X4sgiRjD5Y5gSL1mAQ5jdrBeY9i1h8g/ns5KANAhw4ITNqU+yGAB9
 6uD1hpbHeoUEpWlvQM0AaBT7Qg2fb3g/U0EG8FlYs1AL0c5rPmFNyv3RUc7xSJGG4RsaJS9wL7x
 +CoV/N9AqEueY9fZFDhrLJCMSA44pgDPlvKRseWqZC+3P482/LYcfm9ReFjp3gfP2q2n3aDy11E
 vuTD8FOKhOmC2LgIQ0rgG6bAbNwFw0HEOi7E7FX0jTZ3FF/3jTglFYHVgqvaoRQTcaJuZxkkAPl
 KsVtE7ZuSQs9ceQ1ynVTEW9jdbDwA+ktGUwiKetHSwzBD9HErRz0vze3PpomHcKyiFli4EYbXxl
 rLGXUIY8SMK/X/59VSw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE3MiBTYWx0ZWRfX4wbF6+a3AeVl
 CbIpIimptZ83hkYPwxhLYMGuuwv6VP+3MrMH33G+05yEjBMfS6MbNFw8N+V4jmTE2mPLb8y3Q7f
 u8mM24RdMvHB8sF48qc5069+oU7dptQ=
X-Authority-Analysis: v=2.4 cv=YKgKWhGx c=1 sm=1 tr=0 ts=6aa2bcaf cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dlmhaOwlAAAA:8
 a=6H0WHjuAAAAA:8 a=YxQatw1j_ZWosVD_vr4A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=FO4_E8m0qiDe52t0p3_H:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: 10F0Z_580w5cmkQpEQJSHEkGwrjyUl9B
X-Proofpoint-GUID: 10F0Z_580w5cmkQpEQJSHEkGwrjyUl9B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100172

On Thu, 10 Sept 2026 at 13:38, Luca Weiss <luca.weiss@fairphone.com> wrote:
>
> Hi Dmitry,
>
> On Tue Sep 8, 2026 at 3:28 PM CEST, Dmitry Baryshkov wrote:
> > On Mon, Aug 24, 2026 at 12:04:57PM +0200, Luca Weiss wrote:
> >> Hi Dmitry,
> >>
> >> On Tue Aug 11, 2026 at 2:43 PM CEST, Dmitry Baryshkov wrote:
> >> > On Mon, Aug 10, 2026 at 12:16:19PM +0200, Luca Weiss wrote:
> >> >> Hi Dmitry,
> >> >>
> >> >> Many thanks for working on this and sending this patch series!
> >> >>
> >> >> On Sun Aug 9, 2026 at 10:15 PM CEST, Dmitry Baryshkov wrote:
> >> >> > Qualcomm MSM8974 platform has five SMMU instances, used by display, GPU,
> >> >> > Venus, VFE (camera) and JPEG encoder. Each of them follows ARM SMMU v1
> >> >> > spec, however they differ from other Qualcomm platforms in the
> >> >> > implementation-specific registers and also in interaction with TZ.
> >> >> > Venus, MDP and VFE SMMUs are secured and require programming only of
> >> >> > CBs, while GPU and JPEG require full programming.
> >> >> >
> >> >> > This series skips IOMMUs which can't be tested right now (VFE and JPEG),
> >> >> > and adds only MDP, GPU and Venus (although untested, it is required for
> >> >> > display to work) SMMU instances.
> >> >>
> >> >> I do have a patch series (sent years ago to the mailing lists as well)
> >> >> for CAMSS so I can definitely test this in the future.
> >> >
> >> > Ok, let's land these first, unless VFE IOMMU blocks display on your
> >> > platform (Venus was blocking display on APQ8074 DragonBoard).
> >> >
> >> >> > Note, to get display to work properly one fix is necessary, [1]
> >> >> >
> >> >> > [1] https://patch.msgid.link/20260809-msm8974-mmcc-fix-v1-1-50f2dcf18d2e@oss.qualcomm.com
> >> >>
> >> >> I've applied this series on v7.2-rc7, with the extra commits between
> >> >> that and linux-next for qcom_iommu.c backported so that your series
> >> >> applies without conflicts.
> >> >>
> >> >> So far I'm stuck with the GPU not being able to probe, adding some
> >> >> printk's shows that in msm_iommu_new() the call for
> >> >> iommu_attach_device() is failing.
> >> >>
> >> >> [    5.971154] msm_mdp fd900100.display-controller: failed to load adreno gpu
> >> >> [    5.972991] msm_mdp fd900100.display-controller: failed to bind fdb00000.gpu (ops a3xx_ops [msm]): -16
> >> >> [    5.974073] msm_mdp fd900100.display-controller: adev bind failed: -16
> >> >> [    5.974152] panel-s6d6fa1 fd922800.dsi.0: error -EBUSY: Failed to attach to DSI host
> >> >> [    5.974230] panel-s6d6fa1 fd922800.dsi.0: probe with driver panel-s6d6fa1 failed with error -16
> >> >
> >> > See the patch [1], it's picked up for 7.3
> >>
> >> I missed replying to you, with this patch the display lights up again!
> >>
> >> Unfortunately the GPU still seems to have issues, I don't have a log
> >> right now (I think even SSH was dropping then with a bunch of log lines
> >> appearing in kernel log on screen). I assume kmscube + more complex
> >> workloads worked fine for you?
> >
> > I was mostly using kmscube, but I can try running the CTS once I get
> > back to it, sorry for the delays.
>
> Yeah, kmscube doesn't even work for me.
>
> Bootup works to a tty with screen on (mdss doesn't seem to have any
> problems for me), but then as soon as I run kmscube the device shows a
> few errors on the tty0 on the screen (USB stops working apparently since
> my "dmesg -w" doesn't show anything) and a few seconds later the device
> reboots.

Interesting. I wonder if it's TZ tripping on the VFE IOMMU.

>
> dmesg: https://public.lucaweiss.eu/tmp/fp2-iommu-dmesg.txt
>
> The SoC in my device should be MSM8974PRO-AA (a.k.a. MSM8974AB-AA).
>
> I know there are some differences for some bits between MSM8974
> (Snapdragon 800) and MSM8974PRO (Snapdragon 801), which variant do you
> have? Maybe that's relevant, also since downstream splits devicetree
> based on 8974 and 8974pro.

Mine is APQ8074, not sure if there were revisions.

-- 
With best wishes
Dmitry
