Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD92456DE0
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 18:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787856872; cv=pass; b=YMfyT6i17JUsrupTQF1rpBLr/eUYTfkv/U56ekh0JAkkW47Fx5xoskU+UsgsYnJCqM0BsTvDi3x8ZMStPJhy4l2ufeAzTEMo6KvfFN7bzxvwU9s7jJb5o33vfoAHgCR1mNOzMBabjfJJHclcVUe7NcGFPDbszcxK+emzUGkJVq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787856872; c=relaxed/simple;
	bh=T1pG2WEfWVgIVf8ho0lrSnlLE3kBpBwPvvr4u9b6ALU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LstdKPh3y7zR4uzYl8nIQL4EsLvK60iY325KHKfWFz8UTHV8LoBDZ+SIL0fUnZOTBlIZCwgTalkehjL8jYVKB7vxRrJ28eKX4ZFSjPlAo/QdaZRVCtGNH09r1QVb8c4yaROAFHLXZLVViDSVKGTxfJ9xpYAITQAo+ZTg/DG74h4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sUt+PMsf; arc=pass smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sUt+PMsf"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964e76d0f4so27678a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 11:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787856856; cv=none;
        d=google.com; s=arc-20260327;
        b=i0Vdmpb+fiCI1nvFlyw/GPytestrwQBTgpEXcewUcSFfl01oh8kgdedXfOn5x1MFE/
         DnmxhoE2J/6CEmmHUZ/JTPfuEaMiWt1/6QuGaaiUf/2E/85gz9810+lIhCzxu2nPEbl4
         hmOylHQu9w6yhwGxJ3xeWEyxTlcLnDZPz6DnUdyX33OxfdYVJU11DngVIsDeA5QNzqSA
         VsFiYoYwBf52mjWdRxr0rdqJH2HzdDhkpBBcnlohE5a4+xaSraGy84RT5TtlQcM23m6/
         SkJrxNDSNSBT8e84SO23TjzS9y5s/wX3Y3VpXZEzskPyFs9nq3w9WoBDpjArCdNPd3p1
         PF+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIMFUTwheoLBZ4d5onLuSDPADLZX1lH9pIq/GlMnSC4=;
        fh=Ld5gfsXfNU2WWu4VrlsVjUDaOtOKu0BYUVbyRy457yI=;
        b=E6jyXhQeWQ95LUJ7m9RAhbHXRXRH8boaJpua0IKeEqALelICxrrQ3y5Ewh8GIXGlOX
         zXBR0KSUv1VFlQ9tDa2mE+73iM1ITuuBeOSRpQkBygWk0IiC0QtBtwgYa3NyloCXTg8/
         YReszOQ2DMon3eqWc95i2/BGu4fF6VdwVs8yv+mJOcTM4UXHJfbGtpP+rXLzBN855gn5
         wZDtRrfk4t0eYLLquKvsCa0+35J1aRgkrZJKj3oDpcKRwaBlVMzoDZVCvcAImLghP3vH
         Q/C79YVvoW9wFCs1IQdsgIpwdSuQ87NnU885UtgeljLbOzT0tDJzsTW2laltYmQQfWa8
         SGdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787856856; x=1788461656; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hIMFUTwheoLBZ4d5onLuSDPADLZX1lH9pIq/GlMnSC4=;
        b=sUt+PMsfo9goGzjn9aPmXY5CXKIKoteznfGq5wjl2Xh2IoKgdWaHbaaGPCxz8L92GT
         6Q1NCxi94vHLnSDH7YyYEZmwp+YpIKyVwJVqgwydKSsEdy97b/KZ+y9WEEof8VPnqs4O
         FLdDuLECkit7j8kAEu2i2cSrwfNnXwQWxiA4OluxwsS6CAy/MBEulPVOcV+nOlT68zCC
         xSCUhHxap/bL4YQtACIecDDl83zN9K07ALigFBFA8KBmPuf7T8qdEyOqABEX7izb9vub
         4A5bADffdMjhgMrbnbg0O7XncVrB63yuexP5cYvT10AOzxRTOtC7xBahMMWnpnQOYbki
         L6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787856856; x=1788461656;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hIMFUTwheoLBZ4d5onLuSDPADLZX1lH9pIq/GlMnSC4=;
        b=eFIQdbe7fro8j0CfdjfrGe9u1/BSz41ITK0Zl4CyhkxvodtuZoH5GfXQa3SMjfjhSj
         X4qka4UqFhUHDJoTAOkqTUVR3ZWMbS1o22/jQngTMo75AhVqdAcZqOB3nC439BXYkdFi
         rV0CnQqbNa7zhH7jJXBRcJQcEHbI6RTK4rf5Iem7GoWWfFCmsh7asATJQ2GKHrHT0Ap2
         P1W6aI8I7O6Q52tyK1Q0X03T/mmwf1cGzJn4nvBFpmY2TAYIHBWh3WY3V+BGKQCCr3zk
         Gdh9NmXySYreAMe3+9NhxxLMMq/zFeyMzBwM/CZPSofW804DgB5U9yeg4FKzimTwApbC
         JGhQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWSfxbGV9fOOcWcCmKIa5MkIXLsHxYR5j5yf8xgx4J4LMruRWrQ7e5pI8C2dzwABowAQfaRzPmkrLO4F0=@vger.kernel.org
X-Gm-Message-State: AFuF++mMTkdEHVowHLqx3TTe/TmSHoW4I/mU9NRrt5HD9rNzK90BEMY8
	94UQ3ry3HppxGUmQG2To60oSLgpdgzwNlxo5Zowa1v7J4ffk3qfdUnr3cMWLC3Z6MAS6wPAGual
	I6kAG8D5QBVxBCZH91MkqRu5DtG7tq/FgFd7I3hTq
X-Gm-Gg: AR+sD13vjOoIDzZWMfLRv9+E+9AfHRkZCxjy71CFWBKVUhWylpMOz6Z9AXh15m/zTAH
	XeDVaNpeak9xDW3kXDjz7NzBf9lmsoxpLqxOZ6e1J+t6fm0br48q3UmZbvyrupaIGX/KVz6YWbO
	u518jmB+wN04mCkU1y791dCLgjJG11UVISn6JTmvIljlWdx1N8Vz/0FWPtq3o2l9H4pSu3pbp71
	iaksJuQq+iNYc6BCicOg8w949yUZaKwXpcwddKTAbYRXuXW93qgQvWNJuIJ63Xw4ENw1j1C2MsD
	RDWK2Rp5mr/FTWU2jMpdt/hZH66r5kn6jkP3gRoy8zQko/2+0qaYy85ENA==
X-Received: by 2002:a17:90b:1a90:b0:36b:bec8:94c5 with SMTP id
 98e67ed59e1d1-396d0f8e80cmr1888877a91.10.1787856855570; Thu, 27 Aug 2026
 11:54:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827173511.2322549-1-dmatlack@google.com>
In-Reply-To: <20260827173511.2322549-1-dmatlack@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 27 Aug 2026 11:53:43 -0700
X-Gm-Features: AcwNN1WvasuJQlPgX8gu4_bgTqaxnyoZQNZsTMyZ4LFvBrDZl2W53G30ppdPRJU
Message-ID: <CALzav=fCyLcbcNJWERyH+uO6+60w76iyHUd2HXgOnDauysR6UA@mail.gmail.com>
Subject: Re: [PATCH] iommu: Introduce reset_mutex to avoid circular locking dependency
To: iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Joerg Roedel <joerg.roedel@amd.com>, 
	Kevin Tian <kevin.tian@intel.com>, Nicolin Chen <nicolinc@nvidia.com>, 
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 10:35=E2=80=AFAM David Matlack <dmatlack@google.com=
> wrote:
>
> Introduce a dedicated reset_mutex inside struct iommu_group to serialize
> device reset operations and domain resetting state without acquiring
> group->mutex.
>
> Commit f5b16b802174 ("PCI: Suspend iommu function prior to resetting a
> device") introduced pci_dev_reset_iommu_prepare() and
> pci_dev_reset_iommu_done(), which acquire group->mutex during PCI device
> resets. In drivers such as VFIO, device reset handlers (e.g.
> pci_try_reset_function()) are executed while holding driver locks such
> as vdev->memory_lock.
>
> This introduces a circular locking dependency that can lead to tasks
> being permanently stuck in a deadlock:
>
> [vdev->memory_lock]  =E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80(1. VFIO Reset)=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80>  =
[iommu_group->mutex]
>          =E2=96=B2
>          =E2=94=82                                                    =E2=
=94=82
>  (3. VFIO BAR Page Fault)                                    ... [*]
>          =E2=94=82                                                    =E2=
=94=82
>          =E2=94=82                                                    =E2=
=94=82
>          =E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80  [mm->mmap_lock]  <=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=80=E2=94=80=E2=94=80=E2=94=98
>
> Fix this by using group->reset_mutex instead of group->mutex in
> pci_dev_reset_iommu_prepare() and pci_dev_reset_iommu_done(). To ensure
> other iommu_group operations stay properly synchronized with resets,
> also take group->reset_mutex when checking group->recovery_cnt.
>
> [*] The iommu_group->mutex --> mm->mmap_lock dependency was reported as
> a transitive chain: iommu_group->mutex --> cpu_hotplug_lock -->
> i_mutex_dir_key --> mm->mmap_lock.
>
> Reported-by: Vipin Sharma <vipinsh@google.com>
> Closes: https://lore.kernel.org/kvm/20260821193502.92431-1-vipinsh@google=
.com/
> Fixes: f5b16b802174 ("PCI: Suspend iommu function prior to resetting a de=
vice")
> Signed-off-by: David Matlack <dmatlack@google.com>
> ---
> Cc: Alex Williamson <alex@shazbot.org>
>
>  drivers/iommu/iommu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index e8f13dcebbde..29e63697211f 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -56,6 +56,7 @@ struct iommu_group {
>         struct list_head devices;
>         struct xarray pasid_array;
>         struct mutex mutex;
> +       struct mutex reset_mutex;
>         void *iommu_data;
>         void (*iommu_data_release)(void *iommu_data);
>         char *name;
> @@ -1080,6 +1081,7 @@ struct iommu_group *iommu_group_alloc(void)
>
>         group->kobj.kset =3D iommu_group_kset;
>         mutex_init(&group->mutex);
> +       mutex_init(&group->reset_mutex);
>         INIT_LIST_HEAD(&group->devices);
>         INIT_LIST_HEAD(&group->entry);
>         xa_init(&group->pasid_array);
> @@ -2476,6 +2478,7 @@ static int __iommu_group_set_domain_internal(struct=
 iommu_group *group,
>          * pci_dev_reset_iommu_done() attaches the device to group->domai=
n, if
>          * IOMMU_SET_DOMAIN_MUST_SUCCEED is not set.
>          */
> +       guard(mutex)(&group->reset_mutex);
>         if (group->recovery_cnt && !(flags & IOMMU_SET_DOMAIN_MUST_SUCCEE=
D))
>                 return -EBUSY;
>
> @@ -3652,6 +3655,7 @@ int iommu_attach_device_pasid(struct iommu_domain *=
domain,
>          * This is a concurrent attach during device recovery. Reject it =
until
>          * pci_dev_reset_iommu_done() attaches the device to group->domai=
n.
>          */
> +       guard(mutex)(&group->reset_mutex);
>         if (group->recovery_cnt) {
>                 ret =3D -EBUSY;
>                 goto out_unlock;
> @@ -3745,6 +3749,7 @@ int iommu_replace_device_pasid(struct iommu_domain =
*domain,
>          * This is a concurrent attach during device recovery. Reject it =
until
>          * pci_dev_reset_iommu_done() attaches the device to group->domai=
n.
>          */
> +       guard(mutex)(&group->reset_mutex);
>         if (group->recovery_cnt) {
>                 ret =3D -EBUSY;
>                 goto out_unlock;
> @@ -4042,7 +4047,7 @@ int pci_dev_reset_iommu_prepare(struct pci_dev *pde=
v)
>         if (!pci_ats_supported(pdev) || !dev_has_iommu(&pdev->dev))
>                 return 0;
>
> -       guard(mutex)(&group->mutex);
> +       guard(mutex)(&group->reset_mutex);
>
>         gdev =3D __dev_to_gdev(&pdev->dev);
>         if (WARN_ON(!gdev))
> @@ -4153,7 +4158,7 @@ void pci_dev_reset_iommu_done(struct pci_dev *pdev)
>         if (!pci_ats_supported(pdev) || !dev_has_iommu(&pdev->dev))
>                 return;
>
> -       guard(mutex)(&group->mutex);
> +       guard(mutex)(&group->reset_mutex);
>
>         gdev =3D __dev_to_gdev(&pdev->dev);

Ah, this does not work. __dev_to_gdev() has a lockdep assert that
group->mutex must be held. I'm not sure why my test did not catch
that...

>         if (WARN_ON(!gdev))
>
> base-commit: 37ffa24c9d07edcd414d34283e02af3f3866cf12
> --
> 2.55.0.897.gb25b4bd76c-goog
>
