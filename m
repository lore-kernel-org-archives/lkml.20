Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BE954706B
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 03:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033376; cv=pass; b=lcdkxSP7cSbOYshRoDnwAfvildHrSNBY1ZukfghFJIOk/F4sKPd89lnjySxBchADvVwBCLvCTo7X5tMRT2LBDtfDOugo7s+HswyE2xceYybSWYd70g5yI9TDG8pSZJfkEJA7uVxS2Y5yFK/gprtKPtBpG7X3aiFpmgASpAZsVpg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033376; c=relaxed/simple;
	bh=rOr67Aqe+4hdWq3B4kvB+iDZ/2wfpLjWPShp5799jhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GsYGv6uBL51zzzWE62bU+pPQ0Agjg3466PsS2/Aue1tq6YMmJN/427ocHP1ogOfQ932W1ucJUgHuS+ny6VaoKvIWNEEff23myoJt8yNgj/8uggqi3djx/EyZ3C/lTpZ7MGX34kPSx7MWsXD/cQ59kuvmIxxS8t27d4Y7FC5UiY0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b=kUz/csb3; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical-com.20251104.gappssmtp.com header.i=@canonical-com.20251104.gappssmtp.com header.b="kUz/csb3"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3a9cc82ef31so12922421fa.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 20:02:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792033372; cv=none;
        d=google.com; s=arc-20260327;
        b=SkmSK4hTk4w2XCZa0ISUPc5QOtqVKZ6KtNROUeGZmdPXNktcI4s4FHo32oDyKBWKtx
         GKI236nyyeYxQ5q9Lv7QmhQsgj9Wdf94JnMRmPtdJS1yuExhWKIeDAqmFVgD5u+Adx1j
         7r2TNHi4svNuHnmbGIM34dgud8Zk9iiglqlmfyuDKWkpwdCGjykz1kI8iDOvSFyYFGM7
         coXRrpka4WP25pdAXLM5ozKzlFZmhoouMS7N8797KMwgRL2OfYpKWrniKaQ6WAoFx4zt
         lPSNaWBPngfT36PgAUdypKWBs/P3ZkamVZ2VQjvQt2DUZe2OH/tKLSU6XYgR8YSjEuYA
         K1pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1s+JRYJlW95kfzYp8Dxon8PYmpI4e8W0o33GcowKMc0=;
        fh=WRy2OWQU+II8ROkAQ+5Dqr0/xWYc1Eeb/W29luhtaNk=;
        b=XX38rNIVA/qZ6kjw4gtgczFRPVYEIsr/JTYMSbf+iYtgYOu5Ivp+jVb0ke/UnDb8jA
         +pZeMDGrHkhkTrkd5pH1YfrAw6+rmGufwxiY06KLDnJKD+g0kNgVv0TC64BEgxGqxs3j
         C1jMnceORKusH813QZAMbIKrxUByr6evUWvtejvUneCZOnS9uCfPIPqHYXRmjCXr6Y+N
         r4Q+hFgEKYm2aAzMnjeHgL86g/6NNj07vbzFkdP73Igr/wA9B6qbOR5kPuzquxWdEL2R
         yewsc5LVgBiEObO2gQWeyX+RxLQockNVMl7mImBvFLLKyMwaULhe2yxAfl+b1JnUaOkB
         3Hjg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=canonical-com.20251104.gappssmtp.com; s=20251104; t=1792033372; x=1792638172; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1s+JRYJlW95kfzYp8Dxon8PYmpI4e8W0o33GcowKMc0=;
        b=kUz/csb3F1Fu31iHIXptFBKIV6SCKdY0Dj/ZWP2xNZ41M3il/qsVhc6VFEb2VrGc77
         huZqems7wipkeP6y5Qg6wI4uIN43i3Glz/r2AMIW+SjmHDYW0m6bS5YDCmucrK7vfUEH
         YKivHSoNfjkHARkEu4cadTzX37auIVV1o/A98WRY+j8q97X4FO0lKh4S5H7fhcqJ7/f1
         8fjKIJIssD0CVhEws1vtUpvpN0QHAY0lHyeCR5b1BSJsuDr7IDLK4ZNg1AnwWp9eNj51
         XgRskBeYMhpY++JeqS3O2gydePLYYFoeJop7AzBf+37JzBdlnTwyvPmy/hokTAyF/Gfb
         6/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792033372; x=1792638172;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1s+JRYJlW95kfzYp8Dxon8PYmpI4e8W0o33GcowKMc0=;
        b=jW23ODmd4H9CF8FcpBXof3JnaaWjUwbN3ZOasqyimqJ6snrMJAhsmnDeNCbZ25sj6g
         JjpK+gX3BZOn88oGGCmjob+UREzr5+r3+zFHrMwiMofnXW58P8gBbFqvbTPYR4gNl5n/
         uyzw1EZkOxXynHks64mhqZ09hEXh9tPsLBZTARTt6j/mIV9jNcUt6pOdAOS7eIql+3rf
         mm5BwBrq6z0c2+rbY5Y17q8YMSpBZnofcNx4g1rhcdjF8sIVMBTdeid7A3jmO8Q1p0NF
         y2hZgBkZrp38flZN0PHzJxBWbl1UuepjIBeDZAJfaOTAg57YHq9UcdKl00MBqnhf0E92
         YEnQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0kTByjK6q50jMK7FXqvx6rQCLsCZ8WYgcdr4E0CEpIqDrKMVE6wJo1hT0ve2ceXpWRqv8y9HHNN1Pr0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLtQNc7Y0SSIs9khPGd4nE7FvDpecIcU9p6k4Xsv+NeFCkiKyqM
	iolSNni8gD7SmiSkkhZ3yw9KJ7rGkj+3P0NYPfZKf8VXxUXbJwj2v0Cq/LsmH4DfSx8ignInIh8
	R6GpHPmXh67rwULvs64oBDF/J5R5xTRM=
X-Gm-Gg: AYBFou1HHRLtx+C2v5ZpJlzTZWJH8zo+RYS2Av8Kw2LN22BdCS8ik3qCf8WVUDJOYbJ
	Reefo3tsSmpmxtN9yV5LfD6d3SjWoZGYcAh6ivLptiuPj/BXBIWtzCiUv08sqekjKNI47XC2m+z
	MU5800WG+z4zG/diOMnQhq3G5567q40hcKUOlDa/bGyIXDJBXHrd3l6gPhiT7DrFtZ2YJJaXar9
	xuWncE0WqBsJq5IQOT1cuYbPhwGaKsI264w23CYpl0Fs9aSghOxEAx25Q4PO0wZzN3M27uStfLP
	Vw3B4HEkNVbSI2Ess4dws2v7sLQTWeTZdAsiq2RVGU2n2bmLHmZt3QkU
X-Received: by 2002:a2e:b8cb:0:b0:3a9:c04d:40c3 with SMTP id
 38308e7fff4ca-3a9c4ebaa9amr41258241fa.1.1792033372300; Wed, 14 Oct 2026
 20:02:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013233548.3864360-1-acelan.kao@canonical.com>
In-Reply-To: <20261013233548.3864360-1-acelan.kao@canonical.com>
From: AceLan Kao <acelan.kao@canonical.com>
Date: Thu, 15 Oct 2026 11:02:41 +0800
X-Gm-Features: AclHuK_4-OuzJXOQLGSY_1JPZsUhgch8UxUe-3-qX-PwO8ap9i-6EyBQdWcjUaA
Message-ID: <CAMz9Wg-JDHfN0iRs3LYOu803DVCHak8UFenJC=VTKbntM8R=1g@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btintel_pcie: Fix NULL hdev dereference in
 debug register dump
To: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Kiran K <kiran.k@intel.com>, 
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chia-Lin Kao (AceLan) <acelan.kao@canonical.com> =E6=96=BC 2026=E5=B9=B410=
=E6=9C=8814=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8A=E5=8D=887:35=E5=AF=AB=E9=
=81=93=EF=BC=9A
>
> The MSI-X interrupts are set up in btintel_pcie_config_pcie() and the
> controller is brought out of reset in btintel_pcie_enable_bt(), both
> long before btintel_pcie_setup_hdev() allocates the hci_dev.  On top of
> that, data->hdev is only published after hci_register_dev() succeeds.
> Until then, any interrupt that reaches an error path sees a NULL
> data->hdev.
>
> btintel_pcie_dump_debug_registers() is called from those error paths
> with data->hdev and dereferences it immediately via hci_get_drvdata().
> If the controller raises such an interrupt during probe, the IRQ thread
> oopses.  The bt_dev_*() logging helpers are fine with a NULL hdev (they
> print "null" as the device name), so the crash is only in the register
> dump.
>
> This was seen on an HP ZBook X G2i (8086:e376) with v7.3-rc7, where the
> GP1 mailbox interrupt was handled right after the device was enabled:
>
>   btintel_pcie 0000:00:14.7: enabling device (0000 -> 0002)
>   Bluetooth: null: Received gp1 mailbox interrupt
>   Oops: general protection fault, kernel NULL pointer dereference 0xda0
>   CPU: 11 UID: 0 PID: 671 Comm: irq/213-btintel
>   RIP: 0010:btintel_pcie_dump_debug_registers+0x20/0x910 [btintel_pcie]
>   Call Trace:
>    btintel_pcie_irq_msix_handler+0x1ca/0x6b0 [btintel_pcie]
>    irq_thread_fn+0x26/0x70
>    irq_thread+0x1b1/0x300
>
> The IRQ thread then dies in do_exit() and the module load and the
> following power off block behind it.  The GP1 handler no longer calls
> the dump helper in current linux-next, but the GP0 handler still does
> for the "Controller in error state" and "Controller in lockdown state"
> cases, which have the same exposure during probe.
>
> Return early from btintel_pcie_dump_debug_registers() when there is no
> hci_dev yet.  The register dump is delivered through hci_recv_diag(),
> so there is nowhere to send it without an hdev anyway; the preceding
> bt_dev_err() has already reported the event.
>
> Fixes: 190377500fde ("Bluetooth: btintel_pcie: Dump debug registers on er=
ror")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> ---
>  drivers/bluetooth/btintel_pcie.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/bluetooth/btintel_pcie.c b/drivers/bluetooth/btintel=
_pcie.c
> index 3a555aa50c87..fcdea1302cf7 100644
> --- a/drivers/bluetooth/btintel_pcie.c
> +++ b/drivers/bluetooth/btintel_pcie.c
> @@ -433,12 +433,21 @@ static void btintel_pcie_prepare_tx(struct txq *txq=
, u16 tfd_index,
>
>  static inline void btintel_pcie_dump_debug_registers(struct hci_dev *hde=
v)
>  {
> -       struct btintel_pcie_data *data =3D hci_get_drvdata(hdev);
> +       struct btintel_pcie_data *data;
>         u16 cr_hia, cr_tia;
>         u32 reg, mbox_reg;
>         struct sk_buff *skb;
>         u8 buf[80];
>
> +       /* The interrupts are enabled before the hci_dev is allocated and
> +        * data->hdev is published only after hci_register_dev() succeeds=
, so
> +        * an interrupt handler can get here with a NULL hdev.
> +        */
> +       if (!hdev)
> +               return;
> +
> +       data =3D hci_get_drvdata(hdev);
> +
>         skb =3D alloc_skb(1024, GFP_ATOMIC);
>         if (!skb)
>                 return;
> --
> 2.53.0
>

Sorry, this one is duplicated with
https://lore.kernel.org/lkml/20261013125241.1230408-1-an.wu@canonical.com/
Please ignore this one, and continue with the one ChunAn submitted.

--=20
Chia-Lin Kao(AceLan)
http://blog.acelan.idv.tw/
E-Mail: acelan.kaoATcanonical.com (s/AT/@/)
