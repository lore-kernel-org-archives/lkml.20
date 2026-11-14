Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794643321;
	b=W+BB+xcHMp3wBFKVm6MoMebm3vwodxUT/y64rwrLWBS0HqXjzi2JRBYWXrjEI2mUV2yu
	 pH16Ft/n1/AGBYMbWDeJTSn67ETe3iS4hlaeAoyvqIYgOLVh7kK5aiiY4NSUzjzXtA5ZD
	 an7JfHsoa0PynV7y4B7qxiINbRS60xI623xEaekW/eWXdfE3zKazHr2mrUeOifCG2h8hC
	 TMw9SiZbix5NbUJl+P38SazYagshxwPkNMOPop57v9560pwUgYasXjHuGt2ecFb74xu+X
	 EuTdanTSoMJCBLAiThoH3IZdHz9QscPdVJNRtg8y32VjVmHGd6dKJpYj8FPX5qoX+Fg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794643321;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=eOs0wo+AEMTo528QIknBptEx/0/lGfoY+hjXbdqJYG8=;
	b=awjIL0dEyx1GOokda79v1PWQC+wPR5j9TULQs2heZGcN/SFAf5o8Zjuracp4CtVJkKeb
	 nhbhkuT2rydI/yVJbvixcIWeTdEI93NQ6FKVCWr9JY+57CunseqjooYlOyf71PyXh8yhu
	 x3mFL29Kvdp/QORDbTl/QHLXZZtndymLYof1BEKnrY7N/Jzw5zIYB+Io/Eifi6Z0yxzPw
	 rw/I2RfigRiQDhaPX7Y+q+QjuGZQFr6OuIsdAq0YC3ewzlu0712DKKDTk3st5CLSDej8T
	 r+9LPKwQ0Bjer4NdAuiHplNewKAncmeEtKw78vJeVwTqBxNb2RV6KaO+UxYmo35WJWQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ka0mouk5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WOj2XRtu;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9BF606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:02:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9BF606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ka0mouk5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WOj2XRtu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE61Ocl2224356
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOs0wo+AEMTo528QIknBptEx/0/lGfoY+hjXbdqJYG8=; b=ka0mouk5ouZLMSl3
	fJprxz1uhjURWYyDMH9fRBpK6r7r9UbqVFE63k309g4z3M5i7awraJ2E45FjQ87s
	/zAomF4KXGGOLau3HafyP+2W2F6AmGZK39oTfSo3HXu1K061ldl3SSdW9hkOBImB
	W+tttiHc+QHz1cZqHsQiIeo2hjZRKTFkjHQQIJn3hjGH9FK+4FcaeuLLXhqO0W6F
	VdH5KrWl2l5/BcwsANUGWJNpRNheBT17DpJ+MXNrmyMEGBAdFWlOO6ZTAdnLpgr4
	of2H/izbsOP/RBcEAHInGcQiErCi2JDFHfshCOw/d6vC92E1u4T+Wp7Vmu2gLTtZ
	4ESjqA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhg8sp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:02:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaf3f829b3so14688535ad.3
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794643319; cv=none;
        d=google.com; s=arc-20260327;
        b=L3k8m44fGnPunc3HL1ViF07cR7ErekeIhcGOt1Scnbp70uNQWTpxS0d4rtSuy4Kt1m
         fLTjKxRZiv6o7b7c47Fjm6jEztHSPfrBM1nynuNcZCZFI1vg+gdX0Ah0MH6U/UniZKsy
         Ps+QA2VNmRoEnZ6OjaPCfCo1jW8iA83+kgRZOjbXJ3POhtU18FTAIRc/dwoUuMR+yqRK
         ByhiKDnUlMWeW1WCsmQMXsdbZ98JX2TEpd11nFI4pNfcmqRFoTwELuJLiQ1e0mgXIgmP
         KFH5bbcoD6cn9xB2O8e7r8XNQFGZYb2aV74Qyo3jiQtWOzdCl1wLJc/hBS9MD5ZehD+n
         ZE1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eOs0wo+AEMTo528QIknBptEx/0/lGfoY+hjXbdqJYG8=;
        fh=d9aOLyim4Bp/l5f4OWQWWJfe+nKrkKQshWi6/AdlNCc=;
        b=qqSnYMdc3u3hzwNbkOw+nYMH19TV3YrLgKxMfIKFrvHI9aYsI/2CYqO+gKiVBzJMPD
         qaAHYe8x1B/oUPWLfbLYqz86JyOS5sN6wAOnS2OSxKwxD83UQ/mkqrpQBzNVnhevX3Ta
         E0vEF6SG4FHFNT6nA6mYBlFUKfAHBr/N1zDDvS3awht0j2h9+3l4zpS//3sBrDEjHBTG
         DY7xPsAdWapp4qW4g+KijhzNw6vkfJ9wabqVOGpsOFbceewTchbG2opUpbztVXJI2Q/p
         3RYYwGDaByYMoWEukk1LMrmG8HfRBtQpNX0TIsyECjXrnNzOb40qSDNTXh2+0Uvppw9Y
         Rtkg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794643319; x=1795248119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eOs0wo+AEMTo528QIknBptEx/0/lGfoY+hjXbdqJYG8=;
        b=WOj2XRtuGRgdVZQXWmRquYQtJc29mbImiwoE+nrhOdkJrq1aTFJxCuPAFtuR41m9FF
         JQaP/07lSeby6tObWTEfZAyeDAOb+CQobMcAyNksPbuFGsgWPvpzGDJ80bJlKK5V+PGI
         gLPIfCUXS2oYQp87fRpaunOd4+Rj0H9XU9LIDmI/r0Sw+OjUbpBaRRXzGExS4r0h4La4
         V+m/d6Kf9brciFnjQaASTvXpSXiNwD6FjQCjXeGsH/ct3SxtrYlSb71MfGa90a2xmME3
         GKQ2t1NZ/R8kLAASOgwoe3qlG9i+eX9h26q9xLf+HXWOjWakUvJLbXEVpTKFlrAhpH0F
         8DdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794643319; x=1795248119;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOs0wo+AEMTo528QIknBptEx/0/lGfoY+hjXbdqJYG8=;
        b=w0ZTexaMjhLJ2Z3T9h32X2qLdkSY+bbwypY7XtCtLGz+OEWcuYlYvsYDL2eZs3uaA/
         YLuevlGGSKaEI72crNsNbax8b+uH+SqADwqvP+/Wy3t7CQsg+GfRGDC01IyBsNIzJP7z
         6yx13fIujriqFDIvEADQoUMX+6iz3aYAXRYDosvgNCfUyBJvoafM3smSr68Jm/mrqXlA
         FUs2CN6OkV6DDgTIFsBBWv2/R3mr/IQ9aIjhT8/11LzIKkX7OVj3r0w77oIefgpkolHG
         MYQ7Qi7g1CbLTszrtBkCUWEeeO4kvBPbHwSTEU8LXwaKjTaxbWv95sZEPj7vSw9JWU0u
         Gidw==
X-Forwarded-Encrypted: i=1; AL+hErHTLvkNxdYNhePjUdDi5V4JFLu4pr+J9Q/2dzxBUae71EqhqV1fznSl8hK8T8PwERmfA5/jirE6aBzVPBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z++erZV3SZAYiwE1YQUWyLmuiGB/5X6TprgL2cch/tP2peO4AVz
	FxWNKn6D1Fu6oDh91QlcXBbf1cEjIHgtGkIYmT/iaKQU6kE0ZIcuJQE2O1/knLRlRglxrcH7UWx
	EZ8CBBm719Nz+TDFxVGFTOn5YrfY8zsY4Q8R9IZH4OKrOYDowmjSvjN/1vJMlcQTpQY30bXwF9U
	cJtuxnL9WoohA88UxRUh3ld7L1sSpYlNNi6kVmULIfKw==
X-Gm-Gg: AYBFou29HurbynJ+gAOcXnVsKCyBbZhZNMGJfXdyAumS/Zf9/c4hdU6SoLukA8vxEex
	htiT0TZoIuqYvUMvN8J4Fn7+edp8olm2WAEYv4B4xYNE772PyY9j7glQQDpJGbb7QGxYs0U9AZF
	/ZGbHQe0YwqBRw85qAG5sYtrQ6wgfndDUd9HWrNpFSNC5srwuN0a0tFagkuw==
X-Received: by 2002:a17:903:184:b0:2e9:3c10:c5f8 with SMTP id d9443c01a7336-2ee0dccd57fmr43606695ad.65.1794643319247;
        Sat, 14 Nov 2026 00:01:59 -0800 (PST)
X-Received: by 2002:a17:903:184:b0:2e9:3c10:c5f8 with SMTP id
 d9443c01a7336-2ee0dccd57fmr43606495ad.65.1794643318783; Sat, 14 Nov 2026
 00:01:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <4789427.LvFx2qVVIh@rafael.j.wysocki>
In-Reply-To: <4789427.LvFx2qVVIh@rafael.j.wysocki>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 09:01:46 +0100
X-Gm-Features: AclHuK-lhZ_smxSVi6yno7pceItwahP6z94N7EeTzslfLh2fUR-EdD7X-VmqxTQ
Message-ID: <CAPx+jO-k5U=Dxqf0kxnZhSQ-+vaTk4_dknag1k7G8JgnPPoxvQ@mail.gmail.com>
Subject: Re: [PATCH v1] PM: runtime: Update last_busy before calling
 rpm_suspend() in rpm_idle()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Brian Norris <briannorris@chromium.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _z5BQ-h54paRnWuVM--LRr6BAsQDSQtz
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAzMSBTYWx0ZWRfXyxoL8y5xLYtL
 r8pXmqGlAqT+K6jH6LmK7Icfa2ZNUUCFeibXwrDthMAKyPQEjeJfJOGNWRi6ncuukP/90PEiigC
 dSIUFcpd6YgmNYEGXIftznGLE/S+QuU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAzMSBTYWx0ZWRfXwF4mBd16G+//
 /HcS5dTrpe0Qpr8Oz1XX/im2nTBux/pxN7EfRaVGF+dmeJE1A448iweEg200QYnbMoB8HliszEI
 OH3aUPdLslgLHImNmpb6bhijWeFY/QCztb7E8gDBY6JdgzhfGeXt29E0X7mOlczSofZ+T/5q1pa
 M+lC3Pk+mARRSU05fRCf21ole5FhqM4kipzCqEzJt54xmvv7Db3Aa3l26q+nc04UQ+BaHoBxRx0
 V/lbm1qJnc5PotLE7am9yLfq9jAqIYI/o9WgYRSSzI3K30EO97/LWb9Umt6tHY5sv/BnPOKs4nk
 mvecteXf62//mwvm0CkpDnJb0wBaMXVEoBCpxrtn2rOvNrdfzIrBYR1J3AbJE8KU4P4sG2QrqWP
 lUeHf2q7F4XGrZz2PMXNx0D8Ol/HFz4lDfTTN8+J5gpSYPXZ0KrzFNoG69B2Qmnkza+aEaR1C4J
 qjUYMWmvQyTtmgFJieQ==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af81578 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8
 a=spzYhce0c6bss-WC7psA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: _z5BQ-h54paRnWuVM--LRr6BAsQDSQtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140031

On Fri, Nov 13, 2026 at 2:27=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>
> When rpm_idle() is about to call rpm_suspend(), there are no reasons
> preventing the device from being suspended, but if the device uses an
> autosuspend delay, it needs to be taken into account.
>
> For this purpose, rpm_idle() adds RPM_AUTO to the flags passed to
> rpm_suspend(), but doing that alone is insufficient because the point
> in time from which the autosuspend delay is counted may be too early.
>
> For example, if the device has children (or consumers) and the last
> of them goes into runtime suspend, the parent may now become eligible
> for suspending, but it may not be worthwhile for it to suspend until
> a certain time later.
>
> Quoting Alan Stern [1]:
>
>  Let's say the last remaining active child goes into runtime suspend at
>  time T.  Let's also say that the parent expects none of the children
>  will need to resume until time T + D.  Is D sufficiently large to make
>  it worthwhile for the parent to suspend and then resume?  If not, the
>  parent should remain active.  If yes, the parent should autosuspend --
>  and the length of time the parent should wait before autosuspending is
>  on the order of the value of D (let's call it D*) that corresponds to
>  this crossover point.  Thus the parent's autosuspend delay should be
>  set to D*, or something close to it, in order to achieve both
>  objectives.
>
> Moreover, if the parent's autosuspend delay is set to D*, it should be
> counted from time T at which the last child has suspended, but that does
> not happen because the parent's last_busy timestamp is not updated at
> time T.  That leads to undesirable parent suspends occurring between
> child suspend and resume [2].
>
> To address this issue, make rpm_idle() update the last_busy timestamp
> of the device when it is about to call rpm_suspend() which most often
> is right after the device's last child (or consumer) has gone into
> runtime suspend.
>
> Updating the last_busy timestamp when rpm_idle() returns an error
> without calling rpm_suspend() is not useful because the device is then
> going to remain active for an unknown amount of time and its autosuspend
> delay needs to take effect later.
>
> Link: https://lore.kernel.org/linux-pm/fc43eb13-816b-4cd0-9711-848fdab605=
ef@rowland.harvard.edu/ [1]
> Link: https://lore.kernel.org/linux-pm/CAJZ5v0hKpjMsGQm8Cpa89x5wkNxqkggDN=
bp+eQ0S-E52DETWjQ@mail.gmail.com/ [2]
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

I realized that I have joined these discussions a bit late. Thanks to
all of you for working on this, it's been on my todo list for a long
time! :-)

That said, please add:
Reviewed-by: Ulf Hansson <ulfh@kernel.org>

Kind regards
Uffe

> ---
>  drivers/base/power/runtime.c |    6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -560,7 +560,11 @@ static int rpm_idle(struct device *dev,
>
>   out:
>         trace_rpm_return_int(dev, _THIS_IP_, retval);
> -       return retval ? retval : rpm_suspend(dev, rpmflags | RPM_AUTO);
> +       if (retval)
> +               return retval;
> +
> +       pm_runtime_mark_last_busy(dev);
> +       return rpm_suspend(dev, rpmflags | RPM_AUTO);
>  }
>
>  /**
>
>
>
