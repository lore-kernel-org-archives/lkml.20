Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C680F3921C6
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 18:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788978803; cv=pass; b=q+AlLsg1WgEtSqnZUiCCH6nCS0GH3bt9sqP6Dt1pS2Qp9IN55fo28dlBbw4X39LQF+LR58WiY0cQC9ideUS+tiY+5b6RJCyR2hca3tshqLMa42y8kD8DI9BbI/lgIrmhlyiO5wORqbsjkmBnCRk1yZDnMoq6ver+hkPcD/EnMus=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788978803; c=relaxed/simple;
	bh=z5drTcYcGl2Jr9UjBWtckeJabvhG43hbCnCgTQHXMGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tf7NEeBJO0EH3sXI7VKr1mxJBMbrE+Z5FjYf58YrF+SCscjkKgjiiOhGDGOGyQpascPijfgCfEJGZMZqiEc8ux2/28igCQ6rV3CP/MxFYi/2dAnCZghiZ0Mhan/sYpllzDn63IQkdcUHB+ODcAyRmG3oz3V+XpKsWkz2bnBh6i4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JvHNatId; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JvHNatId"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-836c4474028so62261317b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 11:33:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788978801; cv=none;
        d=google.com; s=arc-20260327;
        b=MFVsiY+ZRbc2ymyhJQWZJfXIJlZr99sct2qVhulb3WQPKPvLZ8pzoNlhgBX1XbuZNU
         V1VivJdLljLoK6+mogB8vUnR155RBJpxXor0F2wWHEgjKtaIUBkJHCNKziaVC8NPF7Df
         Da9X3CJPJt33mDtrUlEETxbVupAtR6PDufQZHyuWqpxWuyCUTEbrEUbjo+l2/Hzsrmsc
         STHAUWosjbpkztc29M6jXnMU+TyH9ASEXjr3hUX+Zbs2hfrCxnP/P2nJA9Iric/3ZYHL
         Za9xSCAZ6zzF+kOmtAGMswZNKkDygUft15aMqsyVe1zIKbuza+3RvyrjH73sQXu2LDfT
         d0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JRkPfEv4yppMNtmLUzhCiBdCmOrIOGxmiuDlPFbbuQI=;
        fh=wpT7M8DVcyJR92wPMAP82pJ94MhqVErScpm5bkOzqL8=;
        b=kCPa30YmjbYWw0gRdwauc+EMLbh9dC0TvzpAoFHi8jfKudwE1ZY/bXYf1mv0dc6QP/
         x8t4utoqB/AENfjuHk3DP3e7+is+6p3VPXyjt1pcftELFKb1pbhIzSLKuMZeCK+Z3rSz
         RWMwS2n+dRelxMjYszLg4+Rf1ndA9hM0cwm/ehwm7tUqWQ6dIVFpJrsSZsi6/R0kmSKN
         Ima8uXsrV7GOn67iGSlNtQsu2G/gT78nET2WSR2g+MwkBc2pFy9yRQNLI4MUT1Q3zVVh
         0/bKXQ2EDzaWT/dfZWmx/7nKRN9+DqWTTXu+E/keu+1Z6AHJZQrTDngVMu7v+qAyJnbP
         Grlw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788978801; x=1789583601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRkPfEv4yppMNtmLUzhCiBdCmOrIOGxmiuDlPFbbuQI=;
        b=JvHNatId79yT+Dn+pVAvQn6X8lF57Zn4T6wkavdLlAO4IT/lgIvq7Az/uu1KBz55S8
         o35zdcLwcH4/T88YMu3Lf1iqCf9yWlMDm8qcSbiPo9sscgUXdKMrHg4Hd2VDVe0wIBAz
         TSI1OV/XTt0ZkYnRp2luwNgnvABlR4uc5/LIdt/+3/w+Mln32DHcxgqzkjY8RNHqN9nf
         Bhb9OQouWbmEqIlEho+Lnh8xn8j+vX40jfpSGT5eHjkf6ovVKDCsSJNS7tZ6+AbNiwgl
         swVUs13ZaIkVB2AXNBk/cK+OlxowUkUJybJWk3TC90J9d6jLU+T6UhiTqk0DVC4Btj85
         rLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788978801; x=1789583601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRkPfEv4yppMNtmLUzhCiBdCmOrIOGxmiuDlPFbbuQI=;
        b=qrHB51eY9sEuUp97xjCagNcA9jU/Iv0/tcHyeKhrxr6c/7PJVYKVD6hpZTgmlyVUSn
         zjMz1vYXkgdNre3c01dz+eOyGiuxTM4PQITR/eB39Pvaxw21nDt4zuqk4DZAVBYvpMdz
         ozaKWDcTBKnZtYAboPkGs68P8I9mrxKizIkFQiD8NRejZWdEK/wgEwm/kIHiKklkeFB6
         tOk1xtXpHUsqcCcOi/l3pYYNMiN5rwgeSVvxPEeGsA34XevDwzuDk3Ry1I0lxMhSDdUu
         LcXWfNb2OtAmfj6i1TpK+wlD1iWT7B+YOWXqf4m4AbX2IMOHz5RLsi840f8xoSur0/V5
         q/7w==
X-Forwarded-Encrypted: i=1; AKwUvBxAygIXXoUYsTsDKIPZyh6bWrwTAslrMc++zQx9xKGK/nSIlMnaXHLAaeP9btNHhCfqSfnsAzGtzhufPWs=@vger.kernel.org
X-Gm-Message-State: AFuF++m54BMzaIB6r2S6BzRrgJjf8i2P25MVl3qYqP5ijMnsUZM7qCkD
	HY5XdlK90dG5QWA9jzvWO2PKAhKEDVV8A2yFIuduWw/AKeqI16307/BZsCMlgyTugn+UXKI/7TX
	BzLDdIy0dDm7tgz1GSFeWuQnW48aj44w=
X-Gm-Gg: AYBFou0srLlbve0S7uJSpk813QtL5fFyWJWSQMJM3yi/kJtvkdKMHXb5YrJZ60M0am5
	Ie9SnEnLa8oZ2owb1vGdOGicehM85mxN+1A+P6bvNwcwKWNi9D2dwIqTYuEOYfb0YZqK+ItFfZw
	0Dd13ZtgMDeKaQ8Aj7CrY7KRM5upxh2EXS0pAsKWzD//+rg6oJ99DFWlvIqPiWpJ/xvAO59WKzQ
	Awk5gWnwdFbCS255fteHzyf5snZ87z2QNF3SOVvQ7qnmZUKJJCIwFdHZ8GzGyb//uVDzXtYwIGb
	tnJhHNW4WON7+vyJVPRJcGdtcyHjjDkIiTRwturD9wjooQwM/YRr3ds031NPQZ91oRVOcDJt3gz
	6OoOa5hEdNzeUmaa50h3Fsq72ico98btCpfFGPAXwew==
X-Received: by 2002:a05:690c:4444:b0:865:7a80:36b7 with SMTP id
 00721157ae682-87122599aeamr142564427b3.6.1788978800405; Wed, 09 Sep 2026
 11:33:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260909123416.71919-1-lsa.uz@pm.me> <20260909123416.71919-3-lsa.uz@pm.me>
In-Reply-To: <20260909123416.71919-3-lsa.uz@pm.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Wed, 9 Sep 2026 14:33:08 -0400
X-Gm-Features: AcwNN1XcHZPJcssFC-8vPRMH72OhUSRlU6_4zWPTJ6wY1PJSWEqPSLPk_3KLJKU
Message-ID: <CABBYNZJfH4F1-Hy1eiOrzuU1nzTbMbue3EqMT5gfHs60wFw9QA@mail.gmail.com>
Subject: Re: [PATCH 2/2] Bluetooth: btintel_pcie: fix PM flow for S0ix, S3 and S4
To: Sergey Lebedev <lsa.uz@pm.me>
Cc: Marcel Holtmann <marcel@holtmann.org>, 
	"Vladimir V . Kondratyev" <vladimirkondratyev2@gmail.com>, Ravindra <ravindra@intel.com>, 
	Ferenc Lengyel <dev@lengyelf.eu>, Chethan Tumkur Narayan <chethan.tumkur.narayan@intel.com>, 
	Ravishankar Srivatsa <ravishankar.srivatsa@intel.com>, Paul Menzel <pmenzel@molgen.mpg.de>, 
	Kiran K <kiran.k@intel.com>, 
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, 
	Mahalingeshwara Chambarakatta <mahalingeshwara.chambarakatta@intel.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sergey,

On Wed, Sep 9, 2026 at 8:34=E2=80=AFAM Sergey Lebedev <lsa.uz@pm.me> wrote:
>
> From: Ravindra <ravindra@intel.com>
>
> Use pm_suspend_target_state to differentiate S0ix from S3/S4. Set the
> controller to D3_HOT for S0ix (PM_SUSPEND_TO_IDLE) and D3_COLD for
> S3/S4, freeze and hibernate to prevent post-resume instability.
>
> Register .freeze, .thaw, .poweroff and .restore callbacks for proper
> hibernation support. The freeze and poweroff (hibernate) paths set
> D3_COLD via btintel_pcie_suspend_late. The thaw path resumes with a
> normal D0 transition, while .restore forces FLR-based firmware recovery
> after S4 since power is lost. S3 (PM_SUSPEND_MEM) resume also triggers
> FLR. S0ix resumes via a normal D0 transition.
>
> Fixes: e57362f4911b ("Bluetooth: btintel_pcie: Add support for _suspend()=
 / _resume()")
> Assisted-by: GitHub-Copilot:GPT5
> Signed-off-by: Ravindra <ravindra@intel.com>
> Assisted-by: Claude:claude-opus-5
> Tested-by: Ferenc Lengyel <dev@lengyelf.eu>
> Signed-off-by: Sergey Lebedev <lsa.uz@pm.me>
> ---
>  drivers/bluetooth/btintel_pcie.c | 64 ++++++++++++++++++++++----------
>  drivers/bluetooth/btintel_pcie.h |  2 -
>  2 files changed, 44 insertions(+), 22 deletions(-)
>
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel=
_pcie.c
> index 361c550b5..e37e710b9 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -16,6 +16,7 @@
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/acpi.h>
> +#include <linux/suspend.h>
>
>  #include <linux/unaligned.h>
>  #include <linux/devcoredump.h>
> @@ -4168,11 +4169,16 @@ static void btintel_pcie_coredump(struct device *=
dev)
>
>  static int btintel_pcie_set_dxstate(struct btintel_pcie_data *data, u32 =
dxstate)
>  {
> -       int retry =3D 0, status;
> +       int retry =3D 0;
> +       long status;
>         u32 dx_intr_timeout_ms =3D 200;
>
> +       /* Not reset per retry: dxstate is unchanged, so a late interrupt=
 from
> +        * an earlier attempt still confirms the target state.
> +        */
> +       data->gp0_received =3D false;
> +
>         do {
> -               data->gp0_received =3D false;
>
>                 btintel_pcie_wr_sleep_cntrl(data, dxstate);
>
> @@ -4220,18 +4226,23 @@ static int btintel_pcie_suspend_late(struct devic=
e *dev, pm_message_t mesg)
>
>         data =3D pci_get_drvdata(pdev);
>
> -       dxstate =3D (mesg.event =3D=3D PM_EVENT_SUSPEND ?
> -                  BTINTEL_PCIE_STATE_D3_HOT : BTINTEL_PCIE_STATE_D3_COLD=
);
> -
> -       data->pm_sx_event =3D mesg.event;
> +       /* S0ix (s2idle) uses D3_HOT; S3, freeze and hibernate use D3_COL=
D. */
> +       if (mesg.event =3D=3D PM_EVENT_SUSPEND &&
> +           pm_suspend_target_state =3D=3D PM_SUSPEND_TO_IDLE)
> +               dxstate =3D BTINTEL_PCIE_STATE_D3_HOT;
> +       else
> +               dxstate =3D BTINTEL_PCIE_STATE_D3_COLD;
>
>         start =3D ktime_get();
>
>         /* Refer: 6.4.11.7 -> Platform power management */
>         err =3D btintel_pcie_set_dxstate(data, dxstate);
>
> -       if (err)
> +       if (err) {
> +               bt_dev_err(data->hdev, "Failed to set dxstate:%u (%d)",
> +                          dxstate, err);
>                 return err;
> +       }
>
>         bt_dev_dbg(data->hdev,
>                    "device entered into d3 state from d0 in %lld us",
> @@ -4254,7 +4265,7 @@ static int btintel_pcie_freeze(struct device *dev)
>         return btintel_pcie_suspend_late(dev, PMSG_FREEZE);
>  }
>
> -static int btintel_pcie_resume(struct device *dev)
> +static int btintel_pcie_resume_event(struct device *dev, pm_message_t me=
sg)
>  {
>         struct pci_dev *pdev =3D to_pci_dev(dev);
>         struct btintel_pcie_data *data;
> @@ -4262,19 +4273,15 @@ static int btintel_pcie_resume(struct device *dev=
)
>         int err;
>
>         data =3D pci_get_drvdata(pdev);
> -       data->gp0_received =3D false;
>
>         start =3D ktime_get();
>
> -       /* When the system enters S4 (hibernate) mode, bluetooth device l=
oses
> -        * power, which results in the erasure of its loaded firmware.
> -        * Consequently, function level reset (flr) is required on system
> -        * resume to bring the controller back into an operational state =
by
> -        * initiating a new firmware download.
> +       /* S3 and S4 may cut power, erasing the firmware. Force FLR to re=
cover
> +        * instead of a normal D0 transition.
>          */
> -
> -       if (data->pm_sx_event =3D=3D PM_EVENT_FREEZE ||
> -           data->pm_sx_event =3D=3D PM_EVENT_HIBERNATE) {
> +       if (mesg.event =3D=3D PM_EVENT_RESTORE ||
> +           (mesg.event =3D=3D PM_EVENT_RESUME &&
> +            pm_suspend_target_state =3D=3D PM_SUSPEND_MEM)) {
>                 set_bit(BTINTEL_PCIE_CORE_HALTED, &data->flags);
>                 btintel_pcie_request_reset(data, BTINTEL_PCIE_IOSF_PRR_FL=
R);
>                 return 0;
> @@ -4283,7 +4290,9 @@ static int btintel_pcie_resume(struct device *dev)
>         /* Refer: 6.4.11.7 -> Platform power management */
>         err =3D btintel_pcie_set_dxstate(data, BTINTEL_PCIE_STATE_D0);
>
> -       if (err =3D=3D 0) {
> +       if (err) {
> +               bt_dev_err(data->hdev, "Failed to set D0 state (%d)", err=
);
> +       } else {
>                 bt_dev_dbg(data->hdev,
>                            "device entered into d0 state from d3 in %lld =
us",
>                            ktime_to_us(ktime_get() - start));
> @@ -4308,13 +4317,28 @@ static int btintel_pcie_resume(struct device *dev=
)
>         return err;
>  }
>
> +static int btintel_pcie_resume(struct device *dev)
> +{
> +       return btintel_pcie_resume_event(dev, PMSG_RESUME);
> +}
> +
> +static int btintel_pcie_restore(struct device *dev)
> +{
> +       return btintel_pcie_resume_event(dev, PMSG_RESTORE);
> +}
> +
> +static int btintel_pcie_thaw(struct device *dev)
> +{
> +       return btintel_pcie_resume_event(dev, PMSG_THAW);
> +}
> +
>  static const struct dev_pm_ops btintel_pcie_pm_ops =3D {
>         .suspend =3D btintel_pcie_suspend,
>         .resume =3D btintel_pcie_resume,
>         .freeze =3D btintel_pcie_freeze,
> -       .thaw =3D btintel_pcie_resume,
> +       .thaw =3D btintel_pcie_thaw,
>         .poweroff =3D btintel_pcie_hibernate,
> -       .restore =3D btintel_pcie_resume,
> +       .restore =3D btintel_pcie_restore,
>  };
>
>  static struct pci_driver btintel_pcie_driver =3D {
> diff --git a/drivers/bluetooth/btintel_pcie.h b/drivers/bluetooth/btintel=
_pcie.h
> index 016795fcb..3030b4e8b 100644
> --- a/drivers/bluetooth/btintel_pcie.h
> +++ b/drivers/bluetooth/btintel_pcie.h
> @@ -713,7 +713,6 @@ struct btintel_pcie_ini_dump_info {
>   * @txq: TX Queue struct
>   * @rxq: RX Queue struct
>   * @alive_intr_ctxt: Alive interrupt context
> - * @pm_sx_event: PM event on which system got suspended
>   */
>  struct btintel_pcie_data {
>         struct pci_dev  *pdev;
> @@ -773,7 +772,6 @@ struct btintel_pcie_data {
>         struct btintel_pcie_dbgc        dbgc;
>         struct btintel_pcie_mdbgc       mdbgc;
>         struct btintel_pcie_dump_header dmp_hdr;
> -       u8      pm_sx_event;
>         u32     debug_evt_addr;
>         u32     debug_evt_size;
>         dma_addr_t      debug_table_addr;
> --
> 2.50.1 (Apple Git-155)

Sashiko flagged a few things:

https://sashiko.dev/#/patchset/20260909123416.71919-1-lsa.uz%40pm.me

--=20
Luiz Augusto von Dentz
