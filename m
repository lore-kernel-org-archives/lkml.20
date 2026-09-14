Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E2F372EF0
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:48:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789368486; cv=pass; b=USazVut71mvR93I+f0ck9e1LV6tv2Z+DDmzv2NnspbOuX7uyjfsjSgNd+sNBtoziif9rky7DLba4pTXaiaqytTHPuZY3yXAEm33pdg98T/8CJ4JTXJT9mlEr5vQ5ZbJLE3MAqZx9EcRYiE+bZbXa1tD04lHcEcwiiXAkkkhvGPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789368486; c=relaxed/simple;
	bh=k+adlSyQyqCHc16yk2+TlsZYUekWo+KL53XZm5SEa1g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Izy6CpRnT3gG9NHYOMt0u2QygYp3FxBWalVkctiqPfBx7X2TYH+qe2LOa+6Rd4jtBLUCH7o1EgBXipzVbt3R9hxUVappdmLdYNsNrhii1gYVeUQnlfRFZcjE9UC3WAadyZW75LS6PjFv23gsgolJF60eW4EMz2AwYstpL+x2pic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=OcMBnIvd; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="OcMBnIvd"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d4ddd179eso12271427b3.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789368484; cv=none;
        d=google.com; s=arc-20260327;
        b=l58Sjpo5p1EI8/34xmnlf50n4jT1eb2eeslDbnqAkwBK9hztH2/OvjhlDDbrrkp/xP
         6VJOszngKEDdJJZBxuc3LWOubr++lZjE8D0Zyahh5sPcjnNx1NfuVKayJSpmKtJ8KAwi
         LPm1SjUUC8qYcmiNPmgebnErS626ls2AiLNKAl9VU48+qvJng8FHyLGXVOh5uT3+SJjc
         t5aYh0tT8y+KIp/NYvKzx4bBxIIQBQV1CLsBshWvZmnk5RTOtFenYBxVJ3okPD8gpZK7
         dzSeib8nvxIKDPFz2NF9fkEwTgS1L01p43GzAmdooCGep8EUO06o3ezdTKeWOK+u56tQ
         7X6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/6vxNJgFB0kAwZIfG9ct3s/oIXV82N4VnXyA7jWGSXY=;
        fh=64COaGJhmEJz3KiQRV0anf0VgJBBR+BXNzDonpDPNrw=;
        b=H8tiRkgrYT1fL8CZHnlEyTFbOp/A9UcJOdNZdu9DXPl6gVzPQWPeKvNLo1kyXG8XNu
         HQuKGkYxb/vBdLa0XSMgThT+OoSCx1aYHbJ3d/2cq1slipMUMxNGJp87fLJQyNIbQttr
         AdR9nhg4WzXVn3c6OjpfzP7BiIe7amNeAfP9iAo+7TqPtpgI7f1po6RMBVyTWWFnh3Aq
         oviXwtsA3WuM7O/+r6qo+XhcL5efjVbLlm5WZ3erxhV4xzma6LmJ1YRUQQv50xzYqWQu
         U2//2yt4sc3+n7I6ifTBuhJNQYyLWxhlcSl8GgvQ2He4mITPmHEX/0xudZYVX0UCugX1
         9SPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1789368484; x=1789973284; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/6vxNJgFB0kAwZIfG9ct3s/oIXV82N4VnXyA7jWGSXY=;
        b=OcMBnIvdQF1uFDoGiiDEfX0anWANvvl4WADVG61xq+ghMj+CqUnolpwLhyNyhNm6A9
         Pacf6ByiBZSxgCw3+fSTo+fD7E1S7YeVqeBwQKuFKIQ2DAPgrJvbLghgIwf1RFmVD0Hz
         pryaCRroH/osh7EPxajiV+vk0aOd9IOegoxoU80uY5Ghtfma+pgE6ONDRuKxKzwu4Tdf
         UbJd1XXYLqjL34vCCp8czR6RiHtk6Wqt5LEKUFPrXgkHpbAD6FppRfkGN/xgjdLq3BAI
         G72eLJJ+CoQozBxxNbnOjLhfvm2o9T2tIs/JUgfWlpex2fwkI1bJipDZF1sq5zGrG5K0
         n2Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789368484; x=1789973284;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/6vxNJgFB0kAwZIfG9ct3s/oIXV82N4VnXyA7jWGSXY=;
        b=IniWMBvG6F6yftrvjLKlkm3IoAKrPBy0AwofoZIZnSD/XsYVsgRips5/IvjgYGAefr
         0SX9BMgYgLRYfn6h3IwTjHbeKHehcsywyMblyqMRpSmiLbaDU9VuAFxOD3+7VzcjSkfM
         ki4nOep+LKn9Ma80rl7q3u7bo8PvTHGtcURoejwxG2ckcPXZFxSH8XzglNjN0VmPIBjW
         wHhNpKNPWPN1XN4Y3oMp65Su/XgTxRfWbyRf+rqdNVC9hHos2u5OGyfn2e0qO1YI3ALj
         bwldQLjVGTFGc/5o5VRNStEARCzhGmI4CxvpXHe+uFI1GIEekkVq5CsAlKKcO4T9gwTj
         Ol7w==
X-Forwarded-Encrypted: i=1; AKwUvBzzZR41v0jXd5911MM5Ud1ibTU8jsqmRVeY551iKxSgDeMcbwiLKKfPtd3RQ8VXGJfnT/BlWzj62uJQ2Rg=@vger.kernel.org
X-Gm-Message-State: AFuF++lD/owhSkzBF/zMVCBylXo4zwbtxMz1ACvZ3Fyc8GiXBhC3TPtp
	v1l7X4HwXtA1XyiqdEGRJs9aAr5nIYiCMLQkcqoPlr+n5Oney4YbghAjFbrI6QeVDcbl8sWEXtq
	7K3++WzG59T9d893zolRak1K+w2xAXhrcysZE7MChX3d1wM0pPu7J5Wd6cFTR+rvS
X-Gm-Gg: AYBFou1Nc/FDX79iF88WofWQABoPaRmSM8OzaSSUHF0crYZV6R9V0PuDiTCSS1ziNTF
	uTUizVNV9Bxf4gaUWsCykdYjRaqd7LgcigE8y8siSbIvZ9WOW2PAMdvQLDZeXCQLozJkpj00j+2
	dWwT7oP1jAtdQcr1ya4AzYGZDXwmV3xvaFxFNtSueG2FSBlY9ZWqWrQiEwtQ+WxVQfoVqzJyu1U
	szh7Sg2/aa4ku5j9iByMz5GKfmp6oqBr/Cx+3uL/z3KGubk6m/eTooYtnLvgMEh4SPd+i6ZnaTk
	mMosfsmOImqb6/CSo6LMEqmmbFGnNunLWMcFFCmiswkFUknYmJqdAUZN3ul5tyaW9kEbjWWWXWQ
	BhSNvxNjMUlUiAVRovGfcBNs1GtnTcqg1jb/ZBFpmQpwC7OkU2A+moa3D4UYNPX5yDiEv+XET8o
	j/O+wofAH1ueMRm8yRFQ8rmch/d10bqzW+tBkw1AB7+mNwXQ4Sz5B4L3iwO6jmdc+JMm7A85P0m
	+jVFtCN8sxA6rIxrGkHSjESRlcz22VSXWbtQE+vb5ubmZO4H2jWEil0OyjUGpHU7rMfyOeffwJR
	qOmqll5VKZ7ndIDlvgc158zV
X-Received: by 2002:a05:690c:60c4:b0:882:1d1f:ccb with SMTP id
 00721157ae682-88d1f9e215fmr5331177b3.8.1789368484215; Sun, 13 Sep 2026
 23:48:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726221908.104873-1-julius@bairaktaris.de>
 <20260726221908.104873-3-julius@bairaktaris.de> <CGME20260911075315eucas1p1b4ffb1f57ef187e0a055072ccc0983e3@eucas1p1.samsung.com>
 <a068a857-a549-4cc2-ae0f-3ef119d3a859@samsung.com> <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
In-Reply-To: <dd342f3d-36d3-4a85-95ca-6cacb7b834ad@oss.qualcomm.com>
From: Julius Bairaktaris <julius@bairaktaris.de>
Date: Mon, 14 Sep 2026 06:47:25 +0000
X-Gm-Features: AcwNN1UJxtZXAgjAG7UR_9O9cwtb9zT-R7CtVzX75Tvg07K3khGsBYzjwWq2LnQ
Message-ID: <CAC1t37J2N1OWkPUthz4XGkeNK47+QeV1siU5s=WtfsqbE=Osew@mail.gmail.com>
Subject: Re: [PATCH ath-next v2 2/2] wifi: ath11k: disable interrupts during
 firmware crash recovery
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, jjohnson@kernel.org, 
	ath11k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linux-kernel@vger.kernel.org, vasanthakumar.thiagarajan@oss.qualcomm.com, 
	rameshkumar.sundaram@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"

Hi Baochen,

I am without my router until 21 September 2026 and will report back
then.

Julius


Am Mo., 14. Sept. 2026 um 06:32 Uhr schrieb Baochen Qiang
<baochen.qiang@oss.qualcomm.com>:
>
>
>
> On 9/11/2026 3:53 PM, Marek Szyprowski wrote:
> > On 27.07.2026 00:19, Julius Bairaktaris wrote:
> >> On IPQ8074 a firmware assert reboots the SoC:
> >>
> >>   Unable to handle kernel read from unreadable memory at virtual address 0
> >>   pc : ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>   lr : ath11k_dp_rx_process_mon_status+0x15c/0xd84 [ath11k]
> >>   Call trace:
> >>    ath11k_hal_srng_access_begin+0xc/0x60 [ath11k]
> >>    ath11k_dp_rx_process_mon_rings+0xa0/0x5d4 [ath11k]
> >>    ath11k_dp_service_srng+0x1f4/0x348 [ath11k]
> >>    ath11k_ahb_ext_grp_napi_poll+0x34/0xd4 [ath11k_ahb]
> >>    __napi_poll+0x38/0x188
> >>    net_rx_action+0x120/0x2c0
> >>
> >> ath11k_core_reconfigure_on_crash() tears the data path down with
> >> ath11k_dp_pdev_free(), ath11k_dp_free() and ath11k_hal_srng_clear(),
> >> which memsets the ring list. The DP NAPI is still running while that
> >> happens, so it services a ring whose address pointer has just been
> >> cleared.
> >>
> >> That function used to disable the interrupts first, until
> >> commit d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >> moved the disable into ath11k_core_reset(). reset_work is only queued
> >> from mhi.c and from the debugfs hw-restart handler, so AHB parts never
> >> run it on a real firmware crash. Their recovery goes QMI server exit ->
> >> restart_work -> ath11k_core_reconfigure_on_crash() ->
> >> ath11k_core_qmi_firmware_ready(), and nothing disables the interrupts
> >> anywhere along it.
> >>
> >> Disable them again on the crash path. The reset path has already done
> >> so by the time it gets here, hence the ab->is_reset check.
> >>
> >> This is also why the debugfs hw-restart trigger never showed the
> >> problem: it goes through ath11k_core_reset(), the one path that still
> >> had the disable.
> >>
> >> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.12-01460-QCAHKSWPL_SILICONZ-1
> >>
> >> Fixes: d455e805de70 ("wifi: ath11k: rearrange IRQ enable/disable in reset path")
> >> Assisted-by: Claude:claude-opus-5
> >> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> >
> >
> > This patch landed recently in linux-next as commit f7a74e131d3f ("wifi: ath11k:
> > disable interrupts during firmware crash recovery"). In my tests I found that it
> > causes a regression on QCOM RB5 board during system suspend/resume cycle
> > (s2idle):
>
> Hi @Marek, can you please try if below diff can fix this regression? Also, @Julis, can you
> please also confirm if it can address your original issue as well?
>
> diff --git a/drivers/net/wireless/ath/ath11k/core.c b/drivers/net/wireless/ath/ath11k/core.c
> index d2ed6a0ea7e3..1ad0a47653de 100644
> --- a/drivers/net/wireless/ath/ath11k/core.c
> +++ b/drivers/net/wireless/ath/ath11k/core.c
> @@ -1275,9 +1275,6 @@ int ath11k_core_suspend_late(struct ath11k_base *ab)
>         if (ab->actual_pm_policy == ATH11K_PM_WOW)
>                 return 0;
>
> -       ath11k_hif_irq_disable(ab);
> -       ath11k_hif_ce_irq_disable(ab);
> -
>         ath11k_hif_power_down(ab, true);
>
>         return 0;
> @@ -2333,17 +2330,9 @@ static int ath11k_core_reconfigure_on_crash(struct ath11k_base *ab)
>         int ret;
>
>         mutex_lock(&ab->core_lock);
> +       ath11k_hif_irq_disable(ab);
> +       ath11k_hif_ce_irq_disable(ab);
>         ath11k_thermal_unregister(ab);
> -
> -       /*
> -        * ath11k_core_reset() already disabled the interrupts on the reset
> -        * path; only the firmware crash path reaches here with them live.
> -        */
> -       if (!ab->is_reset) {
> -               ath11k_hif_irq_disable(ab);
> -               ath11k_hif_ce_irq_disable(ab);
> -       }
> -
>         ath11k_dp_pdev_free(ab);
>         ath11k_cfr_deinit(ab);
>         ath11k_spectral_deinit(ab);
> @@ -2605,9 +2594,6 @@ static void ath11k_core_reset(struct work_struct *work)
>         time_left = wait_for_completion_timeout(&ab->recovery_start,
>                                                 ATH11K_RECOVER_START_TIMEOUT_HZ);
>
> -       ath11k_hif_irq_disable(ab);
> -       ath11k_hif_ce_irq_disable(ab);
> -
>         ath11k_hif_power_down(ab, false);
>         ath11k_hif_power_up(ab);
>
> --
> 2.34.1
>
