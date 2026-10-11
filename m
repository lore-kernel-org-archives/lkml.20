Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E507B22FF22
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791684281; cv=none; b=XltdZcbGTxWaf5jDz18KTFq8cWxgQCxSuEUbUwmyv7tAct0wtP8U7zIDnB/3cFIbbyIBB9Hn+uhgquvEqrnYsC3wHRXUxT193Ai6kHOS8mc2NMMb0x8kTlH3OHCQYWnuM4JiuglkUENzawGBMuAS6zTfm0K9zUdc44vQCv81cUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791684281; c=relaxed/simple;
	bh=sKn/nrmLPM5n+vpbEyLe8dLcl1zlOtOCc1FbfDDrLqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o7nss15ZYmIkbNvNKog1zae5Xqtpuv7wn3sx20SsGedir5pxdah4jSPwRFL+1aZ5BkqhAoUgiUCJMvSN0z2DXEWb17MEAPbNA5ZTaZC93uHxDYOjBKL6WlqZv34ij2rffFAKaKdrpR3QIhE7NlojDVgINCY2l7t7dIJDamlemJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WTHvhlF3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PB1a5WfT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WTHvhlF3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PB1a5WfT"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B1pIF32046875
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fuBDltk+gj/ojNJZ0u0bn5L8
	8uJRD6e8V97djMMcdt8=; b=WTHvhlF37MzGu5NZhQwSb2wncZYhhZYB+HaAZfgl
	cL34Ly859iO+3Buqd4Wz0mHUxgEwl4ffAVU7G0hnGhIGJFenlP3pxhykSvoWwX4I
	WhCC/+xCG80agvMO5fZHX5kLolGPpQvbuuVqvGKNaFKCw5ntxNzGahjFGnko8Jhc
	U1VVCW6pT2dnZsS4hxXNfdmzRkSSln1EXtqZV9X3UZ57CoScqd1qwmM0gFHa+UQy
	Q9m/1LqrHBfrj9AAx93nbFDkjqg666oiTJlX+Sa7XL/HurDoQDGuIwKOb+gT0WN6
	icsktvEt8rTfua6qCEhHKvWsg3/f7zNSJo3UQdArfzxTFg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7aqmtjuy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 02:04:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso693710c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 19:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791684277; x=1792289077; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fuBDltk+gj/ojNJZ0u0bn5L88uJRD6e8V97djMMcdt8=;
        b=PB1a5WfTKKxN7Hy16i6edWjYql66YwlKq1RfE1kGgxjYK9fLlWjgEAkwArzmuuteXI
         CMC5L8MnUxwlD/MXTfLHS/xwVdBshG/m/pCiY5XxmM++NAkxPVrB7h82yz1zyejkgfcU
         giUbJlehMdwX5L7fFXtOK0EapqB43x0vHPfeyOC8bAxvwGihkuyv2OZXpuetSiWrN/8j
         lXjpArWUXS1EO5/KUlhGscaiOp06H73ZhG7er/ZpKIlN0/+/COgauLdQfdytbB70vzFv
         vkNf6A79e2adh59TYzwwJp9paNHtcc5xb3SFL+SuvQgDHUcpRq2Uux8VnMbZeVWPua6W
         vhcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791684277; x=1792289077;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fuBDltk+gj/ojNJZ0u0bn5L88uJRD6e8V97djMMcdt8=;
        b=fFi/emNTR8M0dPRU4sZv/BHkxpUMdhFH2rTrmpVBsS31MSMkHepu0HZBHf3qiDI2xk
         aG8E29wHVWh3bAdxZnMrFDUlxZZT37Me38yrvsW7NQ3qWBBszuOf2p5iRJ7Zl5WzUdCq
         2K6aO5NGUBrtZ2cnupQdDHnUnz/S/Jxu7xM2uxAo7l8y0pK6hs30gl5ahhkg9LsvAqI5
         Zyl/yKXu7iLj+AeRhmi6Jhy2jKgfIcXTAcHrcmyYfybafW4GeVwP2qy1naIxFqsVR9dR
         Sg9c4e1FVVdBVZmQjtbCCB4i0qG8EOk7FnCk+WoixiXP5lh+w6cxrzYNhu1NpsoMAah9
         Q4/A==
X-Forwarded-Encrypted: i=1; AKwUvBx7EGjUM8vPYgD8/1CWOZ5EZ/k0h8l2m3AVExFZPRvuhY3PLhvfH1wt2DoW+DUK/bkY71oO3a95Ge4Ngd4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJnR7hpwoigaJTyPcP8ej5a918y3icrUtLa/ar4KBu+TyisQuTN
	Jn9cipopblwLEyNhuyMSjzR95iAPn+iAqkw/vqUd+Wz8QTpKC6wZXfhOWA8CQe680cNpmpY4SbF
	Oi8qP3ZtOdCrgvoziEYu3J8JUYewa7qxZBMo+hbMIVnQvTjmW9ici4QGYuMaIMd+A8so=
X-Gm-Gg: AYBFou1GjhHKP5Zy/Sy0kgnpsJ6HnVMN1wOybYeijQCy2SymiJwYKKdWeQg0SPOLfht
	bPXKxLIqxKLFQG8NY/wqP45a6GO2U5vZtGBDqA/gQZulRDmTm6kwqtDPT4ZGPFjjvNps8JWNiW+
	veWtC7w/yniztSQW2irVhwO4HV0SvZHsY/ADGrsIMf4T4QILOghcoRAKsh2VcV+sW3QAxnU9t6W
	TWkBT+duGlUxyt5fpnywrvxyytXsVtvYF3Zbg7X613QBWIKQkMWASBALTrhOdUe3kZnKJahfEGn
	wiZRIrmVjWOJe6PwC6PldeiI9fqQugrEl/ldas700jpTp5et9gdNR4AFqPzxJE/xPs6xqtPmDxn
	IdNi7QOE6By2M+uB+iqlZtkv+kX6YOv7SzvyKIo1q/w==
X-Received: by 2002:a05:7022:1605:b0:151:94a6:6f5f with SMTP id a92af1059eb24-16a5fc917b4mr9179327c88.10.1791684277172;
        Sat, 10 Oct 2026 19:04:37 -0700 (PDT)
X-Received: by 2002:a05:7022:1605:b0:151:94a6:6f5f with SMTP id a92af1059eb24-16a5fc917b4mr9179254c88.10.1791684275265;
        Sat, 10 Oct 2026 19:04:35 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537ca0e64csm20491794eec.10.2026.10.10.19.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 19:04:34 -0700 (PDT)
Date: Sun, 11 Oct 2026 10:04:30 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] remoteproc: qcom: pas: Don't fail attach if the
 remote has crashed
Message-ID: <asrurrjg3TbOHnWf@QCOM-aGQu4IUr3Y>
References: <20261006033550.2726451-1-shengchao.guo@oss.qualcomm.com>
 <20261006033550.2726451-3-shengchao.guo@oss.qualcomm.com>
 <asj8VnSmKBF3nA79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asj8VnSmKBF3nA79@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfXzXJ435P/10lH
 zMbb2EasGYC0zqn3ZyPZ70KFZPEfH15K+4GCZcOKe74za4tCseoh6imhghhy/sCI1oYAL8MQ0lj
 gqVaVEAZwfdlQ2EaAnrLW/qrTHUjlik=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDAwNyBTYWx0ZWRfXwfkWRNO00Eam
 8LTPo/jBNL9FQ1IUNlXgeliexxVQ6aCBdLOgL0RtOHimyC7FyiY3/9ThWtcMlZ1pQ374ieL3rn5
 g2zqKeSVlVf/LpHdxIXwuThX2UCvaz/YFIdJJFxHrDeiqjyxZxMLWZgh13LYPlnAbn10pxNUv9x
 8wdC0YlErV3WSHYHVeesJXPtJDTVe+Y1speY0DlACBAjpUmoXp5E2FOKZEcrukcaVTm06aD7EW0
 +LFtFV8mUTlSCouQNQrUodwh+C6nlQn/25gtGUBbM+zSohrWVvvua3aBykT7VMphb4Y2omkQj6u
 CPftd0Lae5rEgbIDSCkRb3DMuItJSqpA7ukFj3MGtzgUXC0Jg70khz0wHTpPwFVch/GdNw9ZpT2
 /k4i9llh3aGMZWPisioILIlSZcYFVfMw8XOO9YrUtqJ8dU33mAFBl0sBmVVDroq3Dh2go8+h3Y6
 4BmxPiuTqOJ465SkBXg==
X-Authority-Analysis: v=2.4 cv=Uq32pOwB c=1 sm=1 tr=0 ts=6acaeeb6 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ReihM4LL204W2qN9rysA:9 a=CjuIK1q_8ugA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: rlBPm-u03EaSZMErqwumP-At6NiF98ol
X-Proofpoint-GUID: rlBPm-u03EaSZMErqwumP-At6NiF98ol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110007

On Fri, Oct 09, 2026 at 04:38:14PM +0200, Stephan Gerhold wrote:
> On Tue, Oct 06, 2026 at 11:35:50AM +0800, Shawn Guo wrote:
> > When qcom_pas_attach() finds the fatal SMP2P bit already set, it reports
> > a crash and then fails the attach. The core unwinds the attach while the
> > crash work is queued: rproc_boot() drops the power refcount back to 0,
> > and __rproc_attach()/rproc_attach() unprepare the subdevices, clean up
> > the resource table and disable the IOMMU. Once rproc_boot() releases
> > rproc->lock, the crash handler finds the rproc still RPROC_DETACHED,
> > marks it RPROC_CRASHED and runs rproc_boot_recovery() on top of that
> > torn-down state:
> > 
> >  - the subdevices are unprepared a second time by rproc_stop(), so SSR
> >    and sysmon notifiers see a duplicate shutdown;
> >  - qcom_pas_stop() and the subsequent rproc_start() operate on resources
> >    that rproc_attach() already released, e.g. iommu_unmap() on a
> >    disabled domain for rproc->has_iommu;
> >  - recovery leaves the rproc RPROC_RUNNING with power == 0. A later
> >    "stop" via sysfs takes power to -1 and returns success without
> >    stopping anything, so the remote stays running. A following "start"
> >    then boots the firmware again on the running remote and fails to
> >    re-add the still registered subdevices:
> > 
> >   sysfs: cannot create duplicate filename '.../qcom_common.pd-mapper.0'
> >   remoteproc remoteproc0: failed to prepare subdevices for adsp: -17
> >   remoteproc remoteproc0: Boot failed: -17
> > 
> > A crash found at attach time is no different from one reported by the
> > fatal interrupt right after attaching. Treat it the same way as
> > q6v5_fatal_interrupt() does: clear q6v5.running, report the crash and
> > let the attach succeed. The core completes the attach with balanced
> > bookkeeping, and the crash handler then recovers the subsystem through
> > the regular RPROC_ATTACHED -> RPROC_CRASHED path.  With running cleared,
> > qcom_q6v5_request_stop() does not wait for a stop ack the dead remote
> > cannot send, and handover_issued already prevents a spurious handover
> > on stop.
> > 
> 
> Hmmmm okay, I have never thought of this option, but reusing the
> existing crash path as-is by making the attach succeed feels actually
> quite clever! I suppose starting all the subdevs is really redundant in
> this case, but the crash case is also nothing worth optimizing for.
> 
> > Assisted-by: LLM
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> >  drivers/remoteproc/qcom_q6v5_pas.c | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 8f3d45c604c9..0ecd7688a54d 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -562,10 +562,14 @@ static int qcom_pas_attach(struct rproc *rproc)
> >  		goto disable_running;
> >  
> >  	if (crash_state) {
> > +		/*
> > +		 * Complete the attach and let the crash handler recover the
> > +		 * subsystem from the attached state, as for a crash reported
> > +		 * by the fatal interrupt.
> > +		 */
> >  		dev_err(pas->dev, "Subsystem has crashed before driver probe\n");
> > +		pas->q6v5.running = false;
> >  		rproc_report_crash(rproc, RPROC_FATAL_ERROR);
> > -		ret = -EINVAL;
> > -		goto disable_running;
> >  	}
> 
> My only nitpick is that it would be nice to fully reuse the normal crash
> handling in this case, in particular the crash_reason logging inside
> q6v5_fatal_interrupt(). Can you extract that part into a common function
> and call it from here?

That's a sensible suggestion. Will update.

> (I guess you could also call the existing q6v5_fatal_interrupt()
> function since it should work as-is, but externally calling an interrupt
> handler might be a bit weird...)

I share the same view.

Shawn
