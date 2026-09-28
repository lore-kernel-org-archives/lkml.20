Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FC038DD3
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790567972; cv=none; b=msFp7k8otE7lqcD0OAFLg1ahrw/sEItomdQXfIb0lIYnPaChm+ANRjFwI872ToTL5I9Sd55uo+HMHqvzvaZQmpY18IIRnFwDnaLP9uMuGkMjx6z233Kt0nx810PR2A6k2Lezcqrd5YSST1SbVVfrGQuSdWSgnVvaSALUFCg1RSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790567972; c=relaxed/simple;
	bh=gSMEOHEGJ2Ds31aVjLCOgxkelt+wk3LTnGtZeSVuqPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kd1pG+0fDpeXuwsy8pAEGdJOLJ9s6VbUq1jWDVmrq6LfKxTQPwwYYustNmES7RRmsLSe8I01ulhswzaaDHbhTGhfkFv0eDl/A+xfOIONgm74qd2ubJLI5rIDRQvSHKyWWFSITQFH9wdNhVQgOnrVVAENm3r+lrPe4EGmeI8TWYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cIBlOlmB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jOEd0KWF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cIBlOlmB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jOEd0KWF"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68RLJ79I3220433
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:59:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7PJG8OQLwFo2rCuBSRKf7hni
	XUXEdFLYCt8QcAnvKQA=; b=cIBlOlmBmUlUhtmH72NnUPtlCpzU5ua2nrJIGzEY
	1/0IyGyFicYyTUGoHzrDrVf6AtkLF6f6U2ewPLsAqWbs3oapjFJU72XkztwBDVLn
	l1Y+hdoV6nj5QfEYJj6YvPauCAMzA5BEwJOPOJIlL5jbUc08grMiP/60IKxBZCtN
	6cBqL5VaNhYo7PNkth3DTjs19Qbwkrf3RM4OXpwSF84HtH5V7IKCZsQYpbQScEDs
	2C+7MoSbYkhAidJAVNJ9W/tYVaFTHhfPUR7gbY0weOwKWgPVejdRxiI1WybmlDBc
	jYG6uV6hmJO71TNHDZNrIcYVSf34OzsDE1+p+uK4K6tI+Q==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyav48phn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 03:59:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1466ab2bc8dso1612505c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 20:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790567970; x=1791172770; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PJG8OQLwFo2rCuBSRKf7hniXUXEdFLYCt8QcAnvKQA=;
        b=jOEd0KWFkWjdENToln4QQ2mFH9u1IfZ+IpRXN4aA6LklvQ8fIRPNmakyNWDqccUFn4
         Y8qocRu35Z0M0op47lRosU7RMw/H9mPJCFUdRZF1qpqKOWpjGq8biOyTVvRR8NyXJm2A
         niaJyZiCo2ocmjP36NL+Dt2n4xIJAdyM+dgZh8FGRxD7i+l/mf6g1xgRZ7VARL87B0SZ
         G/IjagpQzZyBZ54YzsCWxDOWMDo+ne2x/A+2SoM62B54L5B+y7J/1DtonFbHjNWEJvJe
         pxVbVwdFRWIOuiI9/k8X0UVedY+iUAmVvvyS6l4jusHpO4y3VRZybb8czSa8zyPTtM4o
         ojHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790567970; x=1791172770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PJG8OQLwFo2rCuBSRKf7hniXUXEdFLYCt8QcAnvKQA=;
        b=VedU9QeP6/6pIum0v1c0WMvGASZmQ1Jy9yW9VjYrk0LYCwsPElF1XvCukGO/QD+LPn
         J0nENGt/r4qvOq8u0YQcDCGapJFfncTiiLzRD5KJcdgAABpnu5KYztWMw7cWVe26h2j1
         Cpc9c4HkTM0xsB8ZFk6KOJtiqZxRbNUZixo6UeXUDcu/EJgzXY9Ieg6WRIQNAzXhR2Ui
         gytg1WwWh8cZqh8HUvNvsQS5lndBHbElL1XxFzemTHDOdMB8HFarbr2jtSzuScOWSuua
         PywJ3v9CtVtIqfZcz2Ypuhp6eBaIAfeid1PTlZenOt3BohUXuBsnNIWgqmrAu+MPEJyQ
         mVhg==
X-Forwarded-Encrypted: i=1; AKwUvByoqERQ9Xmx+t+tlQTL1PNivJb0OyW9SnZb+6kZP00c1oUmNjjYRwDNO8F6efJDsjs8bctQXqgT1t+viK0=@vger.kernel.org
X-Gm-Message-State: AFuF++m2uSGdlByckOSI3FoScfTa2a4v/ZnwMhW77uR2qwefP7YQ0Bl8
	5grqfvwGqEXVB0uX4SlZrxa5Glg1cBRiIjqxCgtiRHwCmTPUgRiHpQbUWIKA3Y+ZypW3vTZ5nMR
	ltCj1h3Ztf+DtCC/AqemfSJswvMBlbpaPg0lxB17L/ouDWsJ4b3hUfKkaW0KwPukV4tE=
X-Gm-Gg: AYBFou1U4qVYOpUZQlpp0v2yFcqQNa1Ntr50tdLFLpmbaJczrSxb3am9l+3V5+Udeny
	GUSqSxk31td9QuJAyxfTDyqbreFf6r3SeyXYNSJhYzzlIwhpIrx+54OQkYZH/zZV6duN/65dZRy
	B+HLOMnr+lyHRffQ4Wda2n13xJ4PWib/YPtpQ7W4Qq/eQlVRWmwEVJNmEykVxTf7XoeMOmm5opa
	D8okAY0efgnqCy1v8EIOThyjvD7K189SDuAhZDjLztaPnwgH7KYy+ylkq/TI2XlgBZDpF2G40KA
	brivG2tO2G5j1jm6VbQ9WlXu/TPDddH84Vap1GeAQyWZyz2bZFaaQwINUQtnIxMUq8hhvZvFs6e
	gFDnhJSOBQkwJ0vN6VT16RweD7sNV7ebRTg==
X-Received: by 2002:a05:701b:451b:20b0:143:297d:21f4 with SMTP id a92af1059eb24-146d096b2dbmr7835609c88.35.1790567969782;
        Sun, 27 Sep 2026 20:59:29 -0700 (PDT)
X-Received: by 2002:a05:701b:451b:20b0:143:297d:21f4 with SMTP id a92af1059eb24-146d096b2dbmr7835579c88.35.1790567969078;
        Sun, 27 Sep 2026 20:59:29 -0700 (PDT)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ad8e43d2sm25142946c88.12.2026.09.27.20.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:59:28 -0700 (PDT)
Date: Mon, 28 Sep 2026 09:29:24 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Tejun Heo <tj@kernel.org>
Cc: Pavankumar Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] workqueue: Fix NULL current_pwq deref in flush
 dependency check
Message-ID: <b4f1d325-8e4a-41c7-a9be-44c68ed66d88@quicinc.com>
References: <20260925-wq_flush_dep_fix-v1-1-fc5a9de31828@oss.qualcomm.com>
 <42a21c8fdeb903d8511a279b5cf2e242@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42a21c8fdeb903d8511a279b5cf2e242@kernel.org>
X-Proofpoint-GUID: B5R0wCopoGUU5V-RaSRDaOpEKVqW4Y_f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfX6lB3I3BJsTYi
 zqFdx3U8/WBxF3llfmILSyqQdf4klM/BZ2NlsExPPg8tnyfQAutgRAtflEPA/8NuPMAi8RinDl9
 IEQu2XzazPHOrSJU7H1AV8tDe7BhSfc637FNRNDbiy5LfEP+UrMn0Pt451tm/i2zdDUjl5/LUyv
 Yv8i/X7TbTQkdSUhvYR5fjA+lxyGO0TQwWiRG0gQmee7F6AOyxxtQ+GRMm1K5mTbR44cdYODHDZ
 AEgj+Mh4YgC/KvpgroEDQsIUBYgz4z5LIgM2pKVqBy6TXo6J2qyV6d/C9wHwWzTTVh1cwes8fyD
 HR6Mjbwj0BvnHuUxCrFKbgheuxLFSa4Zo3UpcXbUXj3XMMk6PGg9m2zSGNOTVci0kV8jxfS1vSS
 XX1T2Et191oegh+dvevCOR0xyzLq1137O0jr3voBnw6ji8RswaC900btqCXXEbEiyiK8vDu6ptc
 juFDxja8y685ke1YYhw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxNSBTYWx0ZWRfXwfUFdQZBCeNx
 c0asGcoBACqkAnzqTLu1FQOE8KixE3mccA2BjFJT5k9HCRNnYigQ/+7vwdlslIz5HcIiAUHbo7I
 Ih15X6K1XIHmlA+RbRJkQBTkGwLS0dA=
X-Proofpoint-ORIG-GUID: B5R0wCopoGUU5V-RaSRDaOpEKVqW4Y_f
X-Authority-Analysis: v=2.4 cv=MqLHeGae c=1 sm=1 tr=0 ts=6ab9e622 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=OfcC1_vaJly9iBgxsTsA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280015

On Sat, Sep 26, 2026 at 10:30:46PM -1000, Tejun Heo wrote:
> Applied to wq/for-7.3-fixes.
> 
> - is_chained_work() has the same problem. It dereferences
>   worker->current_pwq after checking only worker. It is only reached when
>   queueing on a draining or destroying workqueue, but a kworker outside a
>   work item would crash there the same way. Can you send a fix for that
>   one too?
> 
Thanks Tejun. I have sent the fix for is_chained_work() and CC'd stable.

I have also sent a separate fix to cover current_is_workqueue_mem_reclaim()
which is exported but there is only one user (NFS). It does not appear
to me that this can be triggered from NFS code path, so for now I did
not copy stable for this patch.

Thanks,
Pavan
