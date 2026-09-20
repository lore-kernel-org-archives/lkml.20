Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1D9386435
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 16:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789922565; cv=pass; b=Jkam0OHx89vUzkmKWSm1yVVzsNwnQqvoNO2tgvReBjlTfV7BVDaBM0sd+LlzKZtDazMdtGTzNipp9yyMYUUqYR0pwa/SbVQSSXbJE9pn4sSzHJOqJ9sQzIXROxo1mScJJ2FlVceDOonfbCAEqNkx7hZVfb1dlvcRGQiZFbK+GBI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789922565; c=relaxed/simple;
	bh=EkL9YWU3McSB/6TFR7GezgerqmTkHK4AZdOGAsISNn4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BGA4v9MYop90ehI9apqd3EC5g3G0C0Pyz8tBQYXFYA8Vk33r9Fn/qGXn+e+m2a1sx0/f5uRSdjYgH7SvhQWV94fmJCqjuKelYA5NPaG/X8tlWHqzSucwd7mBX6r5zIiOk49ZXy6dthAiH/zNyVT5yqgnVSGnNW5ai9OzPz4TRXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=wOFinIyw; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="wOFinIyw"
Received: by mail-yx2-f13.google.com with SMTP id 00721157ae682-85d440939e3so13844707b3.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:42:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789922563; cv=none;
        d=google.com; s=arc-20260327;
        b=GxFOJrLFUxEla2TPyfyVgpi8nYhpzO8k7/xqcY20UkJKBoELw+xIEUS1ix5/dUdwSx
         C0o9ydnObHkYTjWwzhidj7ZujhmLAe89uj8CIkvL7fcEEBvgfW7TaXDVW0hqOyTOMBpS
         upF7TszTDm6rRzC5UXPD42WlFQlgYkl+YxaD0lsnEpVCQoo7LwCYb59W/bE9CUCYBVot
         t/pQRtWa3c51AqNSGQnPEcfkM9LD0vO9xRbPpQ7SE+Dy7y+NfJzaW5enAuLubn31MSBT
         9mfgVxTYwi/JYy/Ezvb14Cbb/SllnDnQVtnF8HSMGNWryOWugvfrUq+BeGA08R3izrnJ
         Ywgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=nHza7uhFopdEpXjnPqVhCbEMpK63s/WOhYzeeG3B/+A=;
        fh=7JHavz3rtmkSCww/b3OzA/mwxhV8SIt31xBfrJuRL1E=;
        b=jgu2SDAtVbczTZ63Z+DTwMFaYaQPGZWFIdXFdcbcpn7CkaSiq43q1w0QFL5gQoB2dV
         PzJoM22l93pqIfeuV1IMg6dSCvPT56fpmqPTimXMkvZgjJ1/mBqgk3OkZg0Zej7s3YI4
         rmY/0hTNsHbOHt4EUUd8xxzvs2A+GBTDTXX871p7FQ2aza/6269MieCaBFPT2eJxP82t
         dt/8WhhTWGfhH2Xb8LrieKvZRKUooTj4ZgXE+L/k57rI95FcUpsuvlXq6Z89PU2nd8Nn
         NGztImK4wF920KJEKLJRRibCShQVpDokmgQ1INCKEJhypzlmC4UA6o32mDhmilsYLPqd
         s9dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789922563; x=1790527363; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHza7uhFopdEpXjnPqVhCbEMpK63s/WOhYzeeG3B/+A=;
        b=wOFinIywN+7CPY/DG8xaJj1czKt4fI0fIP8kFDQyqHZCMaHCTSUqWfmSRy+JL4vjO2
         9QfYE/f3s3WNXclty9vTTrHpeTRYpIU5kdrDvo88dH/9WPVbrkwwm4TwJLEBAZG3SdzU
         hDOXR/7Cz7QZ1ufdk1sE2YUheQ3u0rdatuWR6oDaLvgzIyLeglOd5ljr0lBHHiDPNPEW
         kZtJp7iz8tfhn56sOYOgF/zuvIetyiarCaHqeMInh0BKn9zCwZPNSv60zLr5PpgneHN+
         zarRBBUaJ8eVS8mQCgH30ukKXRiTt+xNRv7x+1/omrU9/KDBHHUCfpn/+ipFGfKrw13z
         8ZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789922563; x=1790527363;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nHza7uhFopdEpXjnPqVhCbEMpK63s/WOhYzeeG3B/+A=;
        b=f5lfUxVvJdnziE4gRv71+Vrl98qCIbwJhaRfQwwMzD0eX93NevxC3IRE3nyx/O+xGe
         W9ggEi9TuI+pier9nkzMMkcNAmqhzzzYwmHzUB2GWUAoEoV+mL+Wvyjeo2VfbdCpgT3V
         y6m8Ny0tkuOfK7/FjexDSwuliUtj0yrUmtnyOV4kgYmvIda2tYnHcuPh8RmpDpmCTB3w
         aDjusCx6zz46264KcLodSEHXyE9tkPpeR9l7vzs2YO3Xq9Fkn0wOThRJgUkSazXOoggj
         erx0kbhZIAk//Cei8XM2rsUNbOrA58d4Y8IVw15wjs53Z5WbI9mMTOCCQgR/gzrGRLVZ
         mpbg==
X-Forwarded-Encrypted: i=1; AKwUvByehrreLY3hM70kByoY5qBjQy1N/3HFbSdMOn1u0d2lbxizGy3X0iZlkLN8s/BBI3eEomSBO2nQOtg6x3k=@vger.kernel.org
X-Gm-Message-State: AFuF++nOoQ4Dd1bvwp2xIOWoEDP8VKRKw3XTrkdCK4H9OscXVYz3my4x
	jQxgRlpbdr2Jp+cd6m2auUKQvg06kk5EGOK0PhHSqDadowHuFS6xYToa7Yy49HpBKemEfhkidD3
	StNIwC+pzL2YD3924wwQXci1+ry1UeBFdDUPV/Or7
X-Gm-Gg: AYBFou376Y5pnboiUkDgGq8RtaeTIp1xcQaIhkPKkuq28yIotR4osqTeskoj6trpTin
	BsFbd3MnfcAuh1gJ12FbopHFJurKZBLVnXPRS9BdfknEpNAV2H+MB0uIm9rv8zzbnrUG204CUna
	dOU5G07Mqsfb/xIpcWDreZ1ld7a1nKRtr3GG68UmlM5nsWoRHjOy31awjIpuMfZHmgsZJRwkCsF
	lpQxe2GWPcKC6DWP14d7tUBbdThprYMpMJOnsm66XtM3+i1pAATpLnQzSYFtwaLNCoVTQdSsSbE
	+0jk7y+ZLVwfpjVcYDChmx6FIijyV5xmo4e1c9xujSf61ja4opuUIWXDvSxtqHV8+DJyHc4eCrZ
	F09mgr+z++ZbBqmNXs3DY9mF++umYOUztxobAHzpl9cAgGd3hgnTJrF/15a3GrQ4Zbz1ijv+IpK
	9TfeVgb/lfC7seY98ojceeo/woZyu2verJm65QtM4zI5fsPoqMG/UK6uhx5ER5crPDYucxcu7Cu
	HDJ7FAaPgkwTlNfR2nrwhRUnmiSW2zt2EsRA/WYeVKuf9f29X4ATJiQkzetmYtTC934EhEpcOAM
	rA3xPaoWWQA=
X-Received: by 2002:a05:690c:315:b0:86f:3b4a:f8b2 with SMTP id
 00721157ae682-89730eed53amr31830807b3.16.1789922562709; Sun, 20 Sep 2026
 09:42:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de> <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com> <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
 <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com>
In-Reply-To: <10491411-b500-4e89-bf85-5142ced60aaf@samsung.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Sun, 20 Sep 2026 16:42:08 +0000
X-Gm-Features: AcwNN1X9njNa5bud7U1eFhRRabFMS_lFHDaJorC6mykzTt2Nulm24Bp200Rb6sM
Message-ID: <CAC1t37Ltrh+BBaEPi8grXnMrDt3qGDH8BA56av-h7=yPCCk0Nw@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>, jjohnson@kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com, 
	rameshkumar.sundaram@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi @Baochen,

tested 5 times and it solves the problem. Thanks!

Julius


Am Mo., 14. Sept. 2026 um 07:22 Uhr schrieb Marek Szyprowski
<m.szyprowski@samsung.com>:
>
> On 14.09.2026 08:32, Baochen Qiang wrote:
> > On 9/11/2026 3:53 PM, Marek Szyprowski wrote:
> >> On 27.07.2026 00:19, Julius Bairaktaris wrote:
> >>> On IPQ8074 a firmware assert reboots the SoC:
> >>>
> >>>   Unable to handle kernel read from unreadable memory at virtual address 0
> >>>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>>   lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
> >>>   Call trace:
> >>>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>>    ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
> >>>    ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
> >>>    ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
> >>>    __napi_poll+0x38/0x188
> >>>    net_rx_action+0x120/0x2c0
> >>>
> >>> ath11k_core_reconfigure_on_crash() tears the data path down with
> >>> ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
> >>> which memsets the ring list. The DP NAPI is still running while that
> >>> happens, so it services a ring whose address pointer has just been
> >>> cleared.
> >>>
> >>> That function used to disable the interrupts first, until
> >>> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >>> moved the disable into ath11k_core_reset(). reset_work is only queued
> >>> from mhi.c and from the debugfs hw-restart handler, so AHB parts never
> >>> run it on a real firmware crash. Their recovery goes QMI server exit ->
> >>> restart_work -> ath11k_core_reconfigure_on_crash() ->
> >>> ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
> >>> anywhere along it.
> >>>
> >>> Disable them again on the crash path. The reset path has already done
> >>> so by the time it gets here, hence the ab->is_reset check.
> >>>
> >>> This is also why the debugfs hw-restart trigger never showed the
> >>> problem: it goes through ath11k_core_reset(), the one path that still
> >>> had the disable.
> >>>
> >>> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> >>>
> >>> Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >>> Assisted-by: Claude:claude-opus-5
> >>> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >>
> >> This patch landed recently in linux-next as commit f7a74e131d3f ("wifi: ath11k:
> >> disable interrupts during firmware crash recovery"). In my tests I found that it
> >> causes a regression on QCOM RB5 board during system suspend/resume cycle
> >> (s2idle):
> > Hi @Marek, can you please try if below diff can fix this regression? Also, @Julis, can you
> > please also confirm if it can address your original issue as well?
>
>
> Works fine in my tests, feel free to add:
>
> Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
>
>
> > diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> > index d2ed6a0ea7e3..1ad0a47653de 100644
> > --- a/drivers/net/wireless/ath/ath11k/core.c
> > +++ b/drivers/net/wireless/ath/ath11k/core.c
> > @@ -1275,9 +1275,6 @@ int ath11k_core_suspend_late(struct ath11k_base *ab)
> >       if (ab->actual_pm_policy == ATH11K_PM_WOW)
> >               return 0;
> >
> > -     ath11k_hif_irq_disable(ab);
> > -     ath11k_hif_ce_irq_disable(ab);
> > -
> >       ath11k_hif_power_down(ab, true);
> >
> >       return 0;
> > @@ -2333,17 +2330,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
> >       int ret;
> >
> >       mutex_lock(&ab->core_lock);
> > +     ath11k_hif_irq_disable(ab);
> > +     ath11k_hif_ce_irq_disable(ab);
> >       ath11k_thermal_unregister(ab);
> > -
> > -     /*
> > -      * ath11k_core_reset() already disabled the interrupts on the reset
> > -      * path; only the firmware crash path reaches here with them live.
> > -      */
> > -     if (!ab->is_reset) {
> > -             ath11k_hif_irq_disable(ab);
> > -             ath11k_hif_ce_irq_disable(ab);
> > -     }
> > -
> >       ath11k_dp_pdev_free(ab);
> >       ath11k_cfr_deinit(ab);
> >       ath11k_spectral_deinit(ab);
> > @@ -2605,9 +2594,6 @@ static void ath11k_core_reset(struct work_struct *work)
> >       time_left = wait_for_completion_timeout(&ab->recovery_start,
> >                                               ATH11K_RECOVER_START_TIMEOUT_HZ);
> >
> > -     ath11k_hif_irq_disable(ab);
> > -     ath11k_hif_ce_irq_disable(ab);
> > -
> >       ath11k_hif_power_down(ab, false);
> >       ath11k_hif_power_up(ab);
> >
> Best regards
> --
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
>
