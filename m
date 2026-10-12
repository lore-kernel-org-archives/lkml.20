Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7120F6FC5
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 01:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791768793; cv=pass; b=TiWbMtPkry13GqtssOP3VLt65EInS+OtsR0Z53XYKrHdMVs1fddnNxfJrJa7d8K/B+pH/PZ5pyuIII/8sssGpgDpqSb/tm+tD+P8sA+Z7Swj8ustHuO5VZn6J1W8eiR3XwfEnpPmNCcxJYLaHFv1mOsrhGjpXKtW0faHnP/Cea8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791768793; c=relaxed/simple;
	bh=z42CMjMJd7ZO1ysODD/RrVGUtBdGIU7yWHLMSpP/+SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZwXwIilDp0FzgHacJAvc1jbmTuMAUvXJrKxOkZmZYt2fOVSXuI4yqZyJ9RpftOMBoxvmTiGwRARR1CrWZhLaRAXROl4mCC25ElO45KK/UivLokxBFVXVPzHKkAnKHRQwNGwaD+UJNffspKIoigLDOhFMmWoN8iwa6/DwqQxBVwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l14chM4M; arc=pass smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l14chM4M"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-46556b9e02cso1059739fac.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 18:33:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791768791; cv=none;
        d=google.com; s=arc-20260327;
        b=lohsMceZQdGiavNhOP99waMhinpZacPC75f0T0Tr83R0UA4JLfRVpAZXFfkwdVYC7Q
         uTVu6NzYgjk6/gz4pxoNciwk0AZWmLnehq80GSeH95Lz20+9DmYgJgwS4whRcjIcqn6G
         ySASZUlYhq5bZ6mwCo3j/GjbU3lpWOFZzSR74OhN/ML+LqwrTfgZ1L/xmQOpfJz7TWy1
         Dy7PA+2yzAtHZTAxQk9tld+Li7YBNFbGTXzBhl+3v0qUTDNghf28m+u5eIe/n9M/yQFd
         uVR/ua+Vuu90CQyl+VhjSif+p5N5VFuvwCY6vrhHexe6vxqnzz5Y26yUx+a8yNMhXM+N
         0S8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yy605aOeAHaRRlQZ49hSeMe89YDd8h55bKBGCHpbQWs=;
        fh=gc370TLk0FzeKtIScG2tbBG0VGQrtG91q6ec6kWEu8s=;
        b=CCylv2Na+ueSnKzg5FH9/cyWKWN+iOLiPZlqlRTR7nnwgx7ACm5AIT64p5NjbFjSsm
         +1Kt2bLo5dXa2lCJwmQR0ZQ208jMPr7BpWWejAFzvz5ETMETFspjcYpgVNIcj2lkUsg7
         eCynJYlMg0ukc5wbIegp9WgNWF8zt+vDzgiuTYH1j6UMStkoeAb5mLBu70aG/W9aSlyq
         9m3fI45xhQxbSemSho6LL7MbixPW2lftMtUEFal3HbRoIl1mgrD4TMgNpL5eJsSENAd3
         FUxAePT4NPSpj1TNOv4cc5RZpwojRw/MjBSdscfABkqmLCE7w+Y74/s1xJT38sZiyd2O
         30AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791768791; x=1792373591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yy605aOeAHaRRlQZ49hSeMe89YDd8h55bKBGCHpbQWs=;
        b=l14chM4MmFS3NxqHua7MMzIC2GVRAHfHwAFeNRU/SOkIjZPV27JZc0op1fcZidwStQ
         y0uQ9tqM5iv664PuD3A8eKUo1KYgumgslmoq/os+q/kmTyW8jtEFwvr0h2889hLpHOeZ
         wjKWCDlJHQ7WmzehsUXhKSqIcXXF2uHPxdjlaXDH1CCZfZ1ULomV8+oQHPIL38AVrllk
         SPCyj0JMJyeRlCoWUN42i1U1fim7QWefvl4pWElGba5LkhFU4Qs/PA/cZkj2H7BpRJG0
         ZLAbDrb/PIF2XwPs3Q3krMrnb56oTYOLjjvm+yiPyESPsrANVsRD+ck7LoFr1PmRQrzB
         dMUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791768791; x=1792373591;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yy605aOeAHaRRlQZ49hSeMe89YDd8h55bKBGCHpbQWs=;
        b=qWWNuffsiAlx1J8yYBnxiUDaYnG2iecoCRKbHv79cAVmfHKTU7Eyf4/fjf5JokjCma
         FugVyYgl/XkzMLYMSXPn5Z1bDgmHt7qKLS67j4uuBMGISpbInRBFErohn+aUu/l7Oh5g
         H15GC66xMyyaJSQ0qvgsWaCxJ8ZoSJFhbtKDP7jlJxSoXNTYbSyO6bKDyDUd6HIcyorC
         dmiH7FsgQCSGnP20NLStPuNDes/RjeyuQCxe4jHhQHTX82NT3WsrCLyPffLutIV5Y1Eq
         KzY35zbgNYhqgyjKzpXR8bekoYhB4Jo5VZQbNffDHLpg8X/xBtqKpe3HnNLIiGZ7e9KV
         k3Fg==
X-Forwarded-Encrypted: i=1; AKwUvBykCuvFyaj5J+wUHloJgkqOc+CyEWBTFBVF1A5ayS+mv5pPtRVPATpCtjUDalcjIekLRWJtU0J1ap6D0Pc=@vger.kernel.org
X-Gm-Message-State: AFq9FYIrL2pw16UV7c0ZRLMxh0NNkF8Xp/txO1jHlYcWcPNw6C+98tQx
	NSi/ulor+PTKdQIsoA5+3CsxnDG2YefD4LNpxKvcS7ZiUprcXuYbjJqKJ7s0GwCOQuyiklKsgNe
	QaBCRmyHjcGUexdSkjzKGYEIESEGIAs8=
X-Gm-Gg: AYBFou3wr3VTUZAj8Odjc94/jj7J64Q8jZ8+hibKS6A5RTMiq0yyCkjKvuQnRNwjPcM
	ozfu+MNiY/P/r/1UsQbtkX5mbB2e1t5YPlFqZZnFOKUPMLHroAcvMl4qdIQnkE/cxBILwernWO0
	irBFR/LxbRWWrK6hZUOC6fgGngVvFkx9eMcOYTTInmeTwpH7GBhYXq1/Hygc8imd6cVAX6ghyLg
	kTWIgz8tNg0zgdIHExRVtmosnEOgyNfByop9LwvVG2C/k8ZlYFNzPcPr+Qy/OY0YcKuBNb1vi07
	uLUfHN0Rd6U7traOq71uMFkKRuDC8oQ/aFqBFMDOziYOiufHE/3exvE=
X-Received: by 2002:a05:6870:31a9:b0:462:ef7d:2a4c with SMTP id
 586e51a60fabf-4a2a894fad5mr5424931fac.8.1791768791364; Sun, 11 Oct 2026
 18:33:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008030214.368347-1-finley.xiao@rock-chips.com>
In-Reply-To: <20261008030214.368347-1-finley.xiao@rock-chips.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 11 Oct 2026 20:32:59 -0500
X-Gm-Features: AclHuK_QmkadvsvdD-zCdomyYwJKXc2L9BPDK2A4NqNEwXXLVrtwrCa7y00XQ18
Message-ID: <CABb+yY38GBk=OHZQ9GbDHhFr3Ny8+tavMdyK9qpRHg1yAw+jyQ@mail.gmail.com>
Subject: Re: [PATCH v2] mailbox: arm_mhuv3: Keep the combined IRQ enabled
 during system suspend
To: Finley Xiao <finley.xiao@rock-chips.com>
Cc: heiko@sntech.de, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	tony.xie@rock-chips.com, huangtao@rock-chips.com, frank.wang@rock-chips.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 10:03=E2=80=AFPM Finley Xiao <finley.xiao@rock-chips=
.com> wrote:
>
> When MHUv3 is used as the SCMI mailbox transport (arm,scmi-mailbox),
> SCMI clock and power-domain operations still need to work in the noirq
> phase of system suspend: genpd may power off a device's parent domain
> from genpd_suspend_noirq(), which issues scmi_clock_config_set() /
> scmi_power_state_set() and waits for the firmware reply via the mailbox
> RX IRQ.
>
> However, dpm_suspend_noirq() calls suspend_device_irqs() before running
> the suspend_noirq callbacks, so the combined interrupts are already
> masked at that point and the SCMI transfer times out while waiting for
> the reply.
>
> Both the PBX and MBX combined interrupts are requested as threaded
> IRQs with only IRQF_ONESHOT. The MBX combined IRQ must stay enabled so
> that firmware replies are delivered, and the PBX combined IRQ, used
> for txdone by IRQ when not in polling mode, needs the same treatment.
>
> IRQ threads are not frozen during system suspend, so with
> IRQF_NO_SUSPEND the threaded combined-IRQ handlers still run in the
> noirq phase.
>
> Add IRQF_NO_SUSPEND to the MHUv3 combined IRQ registrations so that
> SCMI remains functional throughout the suspend/resume cycle. Note that
> this only keeps the IRQs functional during the suspend/resume cycle and
> does not make the mailbox a wakeup source.
>
> Signed-off-by: Finley Xiao <finley.xiao@rock-chips.com>
> Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>
> ---
>
> Changes in v2:
> - Add Sudeep's Reviewed-by tag
> - Clarify that this does not make the mailbox a wakeup source
>
>  drivers/mailbox/arm_mhuv3.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mailbox/arm_mhuv3.c b/drivers/mailbox/arm_mhuv3.c
> index a1c528be47f3..04998e1346c5 100644
> --- a/drivers/mailbox/arm_mhuv3.c
> +++ b/drivers/mailbox/arm_mhuv3.c
> @@ -980,7 +980,8 @@ static int mhuv3_setup_pbx(struct mhuv3 *mhu)
>
>                 ret =3D devm_request_threaded_irq(dev, mhu->cmb_irq, NULL=
,
>                                                 mhuv3_pbx_comb_interrupt,
> -                                               IRQF_ONESHOT, "mhuv3-pbx"=
, mhu);
> +                                               IRQF_ONESHOT | IRQF_NO_SU=
SPEND,
> +                                               "mhuv3-pbx", mhu);
>                 if (ret)
>                         return dev_err_probe(dev, ret,
>                                              "Failed to request PBX IRQ\n=
");
> @@ -1017,7 +1018,8 @@ static int mhuv3_setup_mbx(struct mhuv3 *mhu)
>                                      "MBX combined IRQ is missing !\n");
>
>         ret =3D devm_request_threaded_irq(dev, mhu->cmb_irq, NULL,
> -                                       mhuv3_mbx_comb_interrupt, IRQF_ON=
ESHOT,
> +                                       mhuv3_mbx_comb_interrupt,
> +                                       IRQF_ONESHOT | IRQF_NO_SUSPEND,
>                                         "mhuv3-mbx", mhu);
>         if (ret)
>                 return dev_err_probe(dev, ret, "Failed to request MBX IRQ=
\n");
> --
> 2.43.0
>
Applied to mailbox/for-next

Thanks
Jassi
