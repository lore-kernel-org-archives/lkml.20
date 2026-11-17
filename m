Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.119.170.32
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794914764;
	b=nej7KBOy9ZGDaNUInoADJ+7FnIQZ2fe/+vrPfCFbraDvwgNGW3/NAAHT7mCbi9DnQ1SJ
	 kx3jwi9Hpfp2OcT1wDzPEJ403vQQ9aPem42ffZ0gg7eFK/QlCDTBYAC5/M/NVb9f8B8h/
	 +FW8V0qGY9thA/reBCVRztpgsYhJ0HGRshBMPRY2wCsKnKYEc3M5JK5yCnz3NT73GBQnZ
	 jfreLEqjV0vLql9qAvx5sgJMJUTQYCr8HcYDNrTgwe+PPEyPhc4qfZlnSMp7rPxuu3mRA
	 03OGsj430pQSo4Elp+0yIPANPMCOT9S/o+t+eG+67aqFKFqdXETI/BPWYeWybUsQYTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794914764;
	h=DMARC-Filter:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yT9uQRdKOwVrh+dXZ4NYo5AubjIM8lyWvJNYTpylD+Q=;
	b=H9oM3X+zCyAVbxSXYc6YVyhZILQkNJFkRhKtyPMIlkw67ZAEwt3wi/eSbt4DoEdTwJyx
	 HXrfEzv3S31AavIiQh28+r6bgSi4Cbc6hBUSc+UfDQfmr4OJESCFkwPocppQW2jID3+RS
	 deeN8QBNNX/+NydIgumxs9jzFmZfL8opPGeklkBbCLwfAniNthxdy902vg9qEVN+GCAAl
	 hzwyiANsbqCNRaC+xbMXOsABxExCmnUEdjjMc1hkSisxcf3wQhybuldL95XQnt72bL+PD
	 218zsWZ1m3+quiqUC/0PpITx2Mwp48GNHu4K63fCaMemodqFiwIU1ssQ7F2jZaqEcoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=crapouillou.net;
	spf=pass smtp.mailfrom=crapouillou.net;
	arc=none smtp.remote-ip=185.119.170.32
Received: from aposti.net (aposti.net [185.119.170.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A18606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 11:26:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01A18606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=crapouillou.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=crapouillou.net
Message-ID: <9c247830067d2192acfe08080d1c5f2bb366cf1a.camel@crapouillou.net>
Subject: Re: [PATCH v5 01/58] nvmem: disconnect provider callbacks before
 unregister returns
From: Paul Cercueil <paul@crapouillou.net>
To: James Hilliard <james.hilliard1@gmail.com>, Miquel Raynal
	 <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, Vignesh
 Raghavendra <vigneshr@ti.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Srinivas Kandagatla
 <srini@kernel.org>, Tze Yee Ng	 <tze.yee.ng@altera.com>
Date: Tue, 17 Nov 2026 12:25:56 +0100
In-Reply-To: <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-1-cbc49c5c5e74@gmail.com>
References: 
	<20261115-submit-rawnand-retained-handle-lifetime-v1-v5-0-cbc49c5c5e74@gmail.com>
	 <20261115-submit-rawnand-retained-handle-lifetime-v1-v5-1-cbc49c5c5e74@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi James,

Le dimanche 15 novembre 2026 =C3=A0 23:29 -0700, James Hilliard a =C3=A9cri=
t=C2=A0:
> An NVMEM consumer or device reference can outlive provider unbind. The
> reference retains the NVMEM allocation, but not the private data or
> hardware resources that the provider releases during remove. Pinning the
> provider module also does not prevent unbind from freeing that state.
>=20
> Reject new callback access once unregister starts and drain admitted
> accesses with SRCU before returning to the provider. Cover register
> access, keepout handling, cell post-processing and device matching.
> Existing consumers retain core-owned metadata and return -ENODEV after
> disconnection. Release the write-protect GPIO after the drain so
> retained references do not prevent a new provider from requesting it.
> The final device release frees only core-owned data.
>=20
> Give cell entries their own references and retire layout cells when
> their driver is unbound. Remove and drain cell attributes and callbacks
> before layout-owned state is freed. Rebinding creates new entries; held
> old cells remain disconnected. Remove partially added cells when a
> layout probe fails, and destroy the layout during provider unregister
> rather than at the final consumer put.
>=20
> Track layout ownership explicitly so provider cells added after layout
> creation survive its unbind. Rebuild sysfs cell attributes when layouts
> bind or unbind, retaining cell entries until their attributes have been
> removed. Free partial attribute allocations on failure and remove the
> group before device deletion. Only notify provider removal after a
> successful registration notification.
>=20
> Preserve the existing exporter-module references and allow providers
> to specify an explicit NULL owner when their operations are built in.
> Providers remain responsible for unregistering before releasing
> callback state.
>=20
> Retain the firmware node explicitly and serialize consumer-reference
> acquisition with disconnection. This lets MTD unregister an OTP provider
> before freeing its backing object without requiring a release callback
> into the departing provider module.

The fact that you have 5 paragraphs listing everything that the patch does =
makes
me think it should not be one patch, but a dozen of them.

This is just impossible to review, to be honest.

Cheers,
-Paul

> Cc: Srinivas Kandagatla <srini@kernel.org>
> Cc: Tze Yee Ng <tze.yee.ng@altera.com>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
> =C2=A0drivers/nvmem/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/nvmem/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 463 +++++++++++++++++=
++++++-----------
> -
> =C2=A0drivers/nvmem/internals.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 16 +-
> =C2=A0drivers/nvmem/layouts.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> =C2=A0drivers/nvmem/layouts/fixed-layout.c |=C2=A0=C2=A0 2 +-
> =C2=A0drivers/nvmem/layouts/onie-tlv.c=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20=
 +-
> =C2=A0drivers/nvmem/layouts/sl28vpd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0 3 +-
> =C2=A0drivers/nvmem/layouts/u-boot-env.c=C2=A0=C2=A0 |=C2=A0 25 +-
> =C2=A0include/linux/nvmem-provider.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
|=C2=A0 16 +-
> =C2=A09 files changed, 373 insertions(+), 175 deletions(-)
>=20
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index c36c2a4c2a0b..550f3118071a 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -1,6 +1,7 @@
> =C2=A0# SPDX-License-Identifier: GPL-2.0-only
> =C2=A0menuconfig NVMEM
> =C2=A0	bool "NVMEM Support"
> +	select SRCU
> =C2=A0	imply NVMEM_LAYOUTS
> =C2=A0	help
> =C2=A0	=C2=A0 Support for NVMEM(Non Volatile Memory) devices like EEPROM,
> EFUSES...
> diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> index 0556d140170a..b71d80d140dd 100644
> --- a/drivers/nvmem/core.c
> +++ b/drivers/nvmem/core.c
> @@ -13,6 +13,7 @@
> =C2=A0#include <linux/idr.h>
> =C2=A0#include <linux/init.h>
> =C2=A0#include <linux/kref.h>
> +#include <linux/lockdep.h>
> =C2=A0#include <linux/module.h>
> =C2=A0#include <linux/mutex.h>
> =C2=A0#include <linux/nvmem-consumer.h>
> @@ -26,7 +27,11 @@
> =C2=A0#define to_nvmem_device(d) container_of(d, struct nvmem_device, dev=
)
> =C2=A0
> =C2=A0#define FLAG_COMPAT		BIT(0)
> +#define FLAG_REGISTERED		BIT(1)
> =C2=A0struct nvmem_cell_entry {
> +	struct kref		refcnt;
> +	bool			disconnected;
> +	struct nvmem_layout	*layout;
> =C2=A0	const char		*name;
> =C2=A0	int			offset;
> =C2=A0	size_t			raw_len;
> @@ -54,31 +59,30 @@ static LIST_HEAD(nvmem_lookup_list);
> =C2=A0
> =C2=A0static BLOCKING_NOTIFIER_HEAD(nvmem_notifier);
> =C2=A0
> +static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell);
> +
> =C2=A0static int __nvmem_reg_read(struct nvmem_device *nvmem, unsigned in=
t offset,
> =C2=A0			=C2=A0=C2=A0=C2=A0 void *val, size_t bytes)
> =C2=A0{
> -	struct nvmem_operations *ops =3D nvmem->ops;
> -
> -	if (!ops->reg_read)
> +	if (!nvmem->reg_read)
> =C2=A0		return -EOPNOTSUPP;
> =C2=A0
> -	return ops->reg_read(nvmem->priv, offset, val, bytes);
> +	return nvmem->reg_read(nvmem->priv, offset, val, bytes);
> =C2=A0}
> =C2=A0
> =C2=A0static int __nvmem_reg_write(struct nvmem_device *nvmem, unsigned i=
nt offset,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 void *val, size_t bytes)
> =C2=A0{
> -	struct nvmem_operations *ops =3D nvmem->ops;
> =C2=A0	int ret, wr_ok;
> =C2=A0
> -	if (!ops->reg_write)
> +	if (!nvmem->reg_write)
> =C2=A0		return -EOPNOTSUPP;
> =C2=A0
> =C2=A0	ret =3D gpiod_set_value_cansleep(nvmem->wp_gpio, 0);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> -	wr_ok =3D ops->reg_write(nvmem->priv, offset, val, bytes);
> +	wr_ok =3D nvmem->reg_write(nvmem->priv, offset, val, bytes);
> =C2=A0
> =C2=A0	ret =3D gpiod_set_value_cansleep(nvmem->wp_gpio, 1);
> =C2=A0	if (ret)
> @@ -154,6 +158,10 @@ static int nvmem_access_with_keepouts(struct nvmem_d=
evice
> *nvmem,
> =C2=A0static int nvmem_reg_read(struct nvmem_device *nvmem, unsigned int =
offset,
> =C2=A0			=C2=A0 void *val, size_t bytes)
> =C2=A0{
> +	guard(srcu)(&nvmem->srcu);
> +	if (READ_ONCE(nvmem->disconnected))
> +		return -ENODEV;
> +
> =C2=A0	if (!nvmem->nkeepout)
> =C2=A0		return __nvmem_reg_read(nvmem, offset, val, bytes);
> =C2=A0
> @@ -163,6 +171,10 @@ static int nvmem_reg_read(struct nvmem_device *nvmem=
,
> unsigned int offset,
> =C2=A0static int nvmem_reg_write(struct nvmem_device *nvmem, unsigned int=
 offset,
> =C2=A0			=C2=A0=C2=A0 void *val, size_t bytes)
> =C2=A0{
> +	guard(srcu)(&nvmem->srcu);
> +	if (READ_ONCE(nvmem->disconnected))
> +		return -ENODEV;
> +
> =C2=A0	if (!nvmem->nkeepout)
> =C2=A0		return __nvmem_reg_write(nvmem, offset, val, bytes);
> =C2=A0
> @@ -289,8 +301,6 @@ static ssize_t bin_attr_nvmem_write(struct file *filp=
,
> struct kobject *kobj,
> =C2=A0
> =C2=A0static umode_t nvmem_bin_attr_get_umode(struct nvmem_device *nvmem)
> =C2=A0{
> -	struct nvmem_operations *ops =3D nvmem->ops;
> -
> =C2=A0	umode_t mode =3D 0400;
> =C2=A0
> =C2=A0	if (!nvmem->root_only)
> @@ -299,10 +309,10 @@ static umode_t nvmem_bin_attr_get_umode(struct
> nvmem_device *nvmem)
> =C2=A0	if (!nvmem->read_only)
> =C2=A0		mode |=3D 0200;
> =C2=A0
> -	if (!ops->reg_write)
> +	if (!nvmem->reg_write)
> =C2=A0		mode &=3D ~0200;
> =C2=A0
> -	if (!ops->reg_read)
> +	if (!nvmem->reg_read)
> =C2=A0		mode &=3D ~0444;
> =C2=A0
> =C2=A0	return mode;
> @@ -333,7 +343,6 @@ static umode_t nvmem_attr_is_visible(struct kobject *=
kobj,
> =C2=A0{
> =C2=A0	struct device *dev =3D kobj_to_dev(kobj);
> =C2=A0	struct nvmem_device *nvmem =3D to_nvmem_device(dev);
> -	struct nvmem_operations *ops =3D nvmem->ops;
> =C2=A0
> =C2=A0	/*
> =C2=A0	 * If the device has no .reg_write operation, do not allow
> @@ -342,7 +351,7 @@ static umode_t nvmem_attr_is_visible(struct kobject *=
kobj,
> =C2=A0	 * can be forced into read-write mode using the 'force_ro'
> =C2=A0	 * attribute.
> =C2=A0	 */
> -	if (attr =3D=3D &dev_attr_force_ro.attr && !ops->reg_write)
> +	if (attr =3D=3D &dev_attr_force_ro.attr && !nvmem->reg_write)
> =C2=A0		return 0;	/* Attribute not visible */
> =C2=A0
> =C2=A0	return attr->mode;
> @@ -466,59 +475,102 @@ static void nvmem_sysfs_remove_compat(struct
> nvmem_device *nvmem)
> =C2=A0		device_remove_bin_file(nvmem->base_dev, &nvmem->eeprom);
> =C2=A0}
> =C2=A0
> -static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
> +static void nvmem_sysfs_free_cell_attrs(const struct bin_attribute * con=
st
> *attrs)
> =C2=A0{
> -	struct attribute_group group =3D {
> -		.name	=3D "cells",
> -	};
> -	struct nvmem_cell_entry *entry;
> -	const struct bin_attribute **pattrs;
> -	struct bin_attribute *attrs;
> -	unsigned int ncells =3D 0, i =3D 0;
> -	int ret;
> +	if (!attrs)
> +		return;
> =C2=A0
> -	guard(mutex)(&nvmem_mutex);
> +	for (int i =3D 0; attrs[i]; i++) {
> +		nvmem_cell_entry_put(attrs[i]->private);
> +		kfree(attrs[i]->attr.name);
> +		kfree(attrs[i]);
> +	}
> +	kfree(attrs);
> +}
> =C2=A0
> -	if (list_empty(&nvmem->cells) || nvmem->sysfs_cells_populated)
> -		return 0;
> +static void __nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
> +{
> +	lockdep_assert_held(&nvmem->sysfs_mutex);
> =C2=A0
> -	/* Allocate an array of attributes with a sentinel */
> -	ncells =3D list_count_nodes(&nvmem->cells);
> -	pattrs =3D devm_kcalloc(&nvmem->dev, ncells + 1,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sizeof(struct bin_attribute *), GFP_KE=
RNEL);
> -	if (!pattrs)
> -		return -ENOMEM;
> +	if (!nvmem->sysfs_cells_populated)
> +		return;
> =C2=A0
> -	attrs =3D devm_kcalloc(&nvmem->dev, ncells, sizeof(struct
> bin_attribute), GFP_KERNEL);
> -	if (!attrs)
> -		return -ENOMEM;
> +	device_remove_group(&nvmem->dev, &nvmem->cells_group);
> +	nvmem_sysfs_free_cell_attrs(nvmem->cells_group.bin_attrs);
> +	nvmem->cells_group.bin_attrs =3D NULL;
> +	nvmem->sysfs_cells_populated =3D false;
> +}
> +
> +static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
> +{
> +	guard(mutex)(&nvmem->sysfs_mutex);
> +	__nvmem_sysfs_remove_cells(nvmem);
> +}
> +
> +static int nvmem_populate_sysfs_cells(struct nvmem_device *nvmem)
> +{
> +	struct nvmem_cell_entry *entry;
> +	const struct bin_attribute **attrs =3D NULL;
> +	unsigned int i =3D 0;
> +	int ret =3D 0;
> =C2=A0
> -	/* Initialize each attribute to take the name and size of the cell */
> -	list_for_each_entry(entry, &nvmem->cells, node) {
> -		sysfs_bin_attr_init(&attrs[i]);
> -		attrs[i].attr.name =3D devm_kasprintf(&nvmem->dev, GFP_KERNEL,
> -						=C2=A0=C2=A0=C2=A0 "%s@%x,%x", entry->name,
> -						=C2=A0=C2=A0=C2=A0 entry->offset,
> -						=C2=A0=C2=A0=C2=A0 entry->bit_offset);
> -		attrs[i].attr.mode =3D 0444 & nvmem_bin_attr_get_umode(nvmem);
> -		attrs[i].size =3D entry->bytes;
> -		attrs[i].read =3D &nvmem_cell_attr_read;
> -		attrs[i].private =3D entry;
> -		if (!attrs[i].attr.name)
> +	guard(mutex)(&nvmem->sysfs_mutex);
> +
> +	__nvmem_sysfs_remove_cells(nvmem);
> +
> +	scoped_guard(mutex, &nvmem_mutex) {
> +		if (nvmem->disconnected)
> +			return -ENODEV;
> +		if (list_empty(&nvmem->cells))
> +			return 0;
> +
> +		attrs =3D kcalloc(list_count_nodes(&nvmem->cells) + 1,
> +				sizeof(*attrs), GFP_KERNEL);
> +		if (!attrs)
> =C2=A0			return -ENOMEM;
> =C2=A0
> -		pattrs[i] =3D &attrs[i];
> -		i++;
> +		list_for_each_entry(entry, &nvmem->cells, node) {
> +			struct bin_attribute *attr;
> +
> +			attr =3D kzalloc_obj(*attr);
> +			if (!attr) {
> +				ret =3D -ENOMEM;
> +				break;
> +			}
> +			sysfs_bin_attr_init(attr);
> +			attr->attr.name =3D kasprintf(GFP_KERNEL, "%s@%x,%x",
> +						=C2=A0=C2=A0 entry->name, entry-
> >offset,
> +						=C2=A0=C2=A0 entry->bit_offset);
> +			if (!attr->attr.name) {
> +				kfree(attr);
> +				ret =3D -ENOMEM;
> +				break;
> +			}
> +			attr->attr.mode =3D 0444 &
> nvmem_bin_attr_get_umode(nvmem);
> +			attr->size =3D entry->bytes;
> +			attr->read =3D nvmem_cell_attr_read;
> +			attr->private =3D entry;
> +			kref_get(&entry->refcnt);
> +			attrs[i++] =3D attr;
> +		}
> =C2=A0	}
> +	if (ret)
> +		goto err_free;
> =C2=A0
> -	group.bin_attrs =3D pattrs;
> +	nvmem->cells_group.name =3D "cells";
> +	nvmem->cells_group.bin_attrs =3D attrs;
> =C2=A0
> -	ret =3D device_add_group(&nvmem->dev, &group);
> -	if (ret)
> -		return ret;
> +	ret =3D device_add_group(&nvmem->dev, &nvmem->cells_group);
> +	if (ret) {
> +		nvmem->cells_group.bin_attrs =3D NULL;
> +		goto err_free;
> +	}
> =C2=A0
> =C2=A0	nvmem->sysfs_cells_populated =3D true;
> +	return 0;
> =C2=A0
> +err_free:
> +	nvmem_sysfs_free_cell_attrs(attrs);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> @@ -533,6 +585,10 @@ static void nvmem_sysfs_remove_compat(struct nvmem_d=
evice
> *nvmem)
> =C2=A0{
> =C2=A0}
> =C2=A0
> +static void nvmem_sysfs_remove_cells(struct nvmem_device *nvmem)
> +{
> +}
> +
> =C2=A0#endif /* CONFIG_NVMEM_SYSFS */
> =C2=A0
> =C2=A0static void nvmem_release(struct device *dev)
> @@ -540,8 +596,8 @@ static void nvmem_release(struct device *dev)
> =C2=A0	struct nvmem_device *nvmem =3D to_nvmem_device(dev);
> =C2=A0
> =C2=A0	ida_free(&nvmem_ida, nvmem->id);
> -	gpiod_put(nvmem->wp_gpio);
> -	kfree(nvmem->ops);
> +	of_node_put(nvmem->dev.of_node);
> +	cleanup_srcu_struct(&nvmem->srcu);
> =C2=A0	kfree(nvmem);
> =C2=A0}
> =C2=A0
> @@ -553,22 +609,30 @@ static const struct bus_type nvmem_bus_type =3D {
> =C2=A0	.name		=3D "nvmem",
> =C2=A0};
> =C2=A0
> -static void nvmem_cell_entry_drop(struct nvmem_cell_entry *cell)
> +static void nvmem_cell_entry_release(struct kref *ref)
> =C2=A0{
> -	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_CELL_REMOVE,
> cell);
> -	scoped_guard(mutex, &nvmem_mutex)
> -		list_del(&cell->node);
> +	struct nvmem_cell_entry *cell =3D container_of(ref, struct
> nvmem_cell_entry, refcnt);
> +
> =C2=A0	of_node_put(cell->np);
> =C2=A0	kfree_const(cell->name);
> =C2=A0	kfree(cell);
> =C2=A0}
> =C2=A0
> +static void nvmem_cell_entry_put(struct nvmem_cell_entry *cell)
> +{
> +	kref_put(&cell->refcnt, nvmem_cell_entry_release);
> +}
> +
> =C2=A0static void nvmem_device_remove_all_cells(const struct nvmem_device=
 *nvmem)
> =C2=A0{
> =C2=A0	struct nvmem_cell_entry *cell, *p;
> =C2=A0
> -	list_for_each_entry_safe(cell, p, &nvmem->cells, node)
> -		nvmem_cell_entry_drop(cell);
> +	list_for_each_entry_safe(cell, p, &nvmem->cells, node) {
> +		blocking_notifier_call_chain(&nvmem_notifier,
> NVMEM_CELL_REMOVE, cell);
> +		scoped_guard(mutex, &nvmem_mutex)
> +			list_del(&cell->node);
> +		nvmem_cell_entry_put(cell);
> +	}
> =C2=A0}
> =C2=A0
> =C2=A0static void nvmem_cell_entry_add(struct nvmem_cell_entry *cell)
> @@ -583,6 +647,7 @@ static int
> nvmem_cell_info_to_nvmem_cell_entry_nodup(struct nvmem_device *nvmem,
> =C2=A0						=C2=A0=C2=A0=C2=A0=C2=A0 struct nvmem_cell_entry
> *cell)
> =C2=A0{
> =C2=A0	cell->nvmem =3D nvmem;
> +	cell->disconnected =3D false;
> =C2=A0	cell->offset =3D info->offset;
> =C2=A0	cell->raw_len =3D info->raw_len ?: info->bytes;
> =C2=A0	cell->bytes =3D info->bytes;
> @@ -639,20 +704,17 @@ static int nvmem_cell_info_to_nvmem_cell_entry(stru=
ct
> nvmem_device *nvmem,
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -/**
> - * nvmem_add_one_cell() - Add one cell information to an nvmem device
> - *
> - * @nvmem: nvmem device to add cells to.
> - * @info: nvmem cell info to add to the device
> - *
> - * Return: 0 or negative error code on failure.
> - */
> -int nvmem_add_one_cell(struct nvmem_device *nvmem,
> -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct nvmem_cell_info *inf=
o)
> +static int __nvmem_add_one_cell(struct nvmem_device *nvmem,
> +				const struct nvmem_cell_info *info,
> +				struct nvmem_layout *layout)
> =C2=A0{
> =C2=A0	struct nvmem_cell_entry *cell;
> =C2=A0	int rval;
> =C2=A0
> +	guard(srcu)(&nvmem->srcu);
> +	if (READ_ONCE(nvmem->disconnected))
> +		return -ENODEV;
> +
> =C2=A0	cell =3D kzalloc_obj(*cell);
> =C2=A0	if (!cell)
> =C2=A0		return -ENOMEM;
> @@ -663,12 +725,45 @@ int nvmem_add_one_cell(struct nvmem_device *nvmem,
> =C2=A0		return rval;
> =C2=A0	}
> =C2=A0
> +	kref_init(&cell->refcnt);
> +	cell->layout =3D layout;
> =C2=A0	nvmem_cell_entry_add(cell);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> +
> +/**
> + * nvmem_add_one_cell() - Add one cell information to an nvmem device
> + *
> + * @nvmem: nvmem device to add cells to.
> + * @info: nvmem cell info to add to the device
> + *
> + * Return: 0 or negative error code on failure.
> + */
> +int nvmem_add_one_cell(struct nvmem_device *nvmem,
> +		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct nvmem_cell_info *inf=
o)
> +{
> +	return __nvmem_add_one_cell(nvmem, info, NULL);
> +}
> =C2=A0EXPORT_SYMBOL_GPL(nvmem_add_one_cell);
> =C2=A0
> +/**
> + * nvmem_layout_add_cell() - Add a cell owned by an NVMEM layout
> + * @layout: Layout registering the cell from its add_cells callback.
> + * @info: Cell description.
> + *
> + * The cell and its post-processing callback are disconnected when the l=
ayout
> + * is unregistered. Provider cells added with nvmem_add_one_cell() are
> retained.
> + *
> + * Return: 0 or a negative error code.
> + */
> +int nvmem_layout_add_cell(struct nvmem_layout *layout,
> +			=C2=A0 const struct nvmem_cell_info *info)
> +{
> +	return __nvmem_add_one_cell(layout->nvmem, info, layout);
> +}
> +EXPORT_SYMBOL_GPL(nvmem_layout_add_cell);
> +
> =C2=A0/**
> =C2=A0 * nvmem_add_cells() - Add cell information to an nvmem device
> =C2=A0 *
> @@ -729,6 +824,7 @@ nvmem_find_cell_entry_by_name(struct nvmem_device *nv=
mem,
> const char *cell_id)
> =C2=A0	list_for_each_entry(iter, &nvmem->cells, node) {
> =C2=A0		if (strcmp(cell_id, iter->name) =3D=3D 0) {
> =C2=A0			cell =3D iter;
> +			kref_get(&cell->refcnt);
> =C2=A0			break;
> =C2=A0		}
> =C2=A0	}
> @@ -789,12 +885,17 @@ static int nvmem_validate_keepouts(struct nvmem_dev=
ice
> *nvmem)
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_no=
de
> *np)
> +static int __nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct
> device_node *np,
> +				=C2=A0=C2=A0=C2=A0=C2=A0 struct nvmem_layout *layout)
> =C2=A0{
> =C2=A0	struct device *dev =3D &nvmem->dev;
> =C2=A0	const __be32 *addr;
> =C2=A0	int len, ret;
> =C2=A0
> +	guard(srcu)(&nvmem->srcu);
> +	if (READ_ONCE(nvmem->disconnected))
> +		return -ENODEV;
> +
> =C2=A0	for_each_child_of_node_scoped(np, child) {
> =C2=A0		struct nvmem_cell_info info =3D {0};
> =C2=A0
> @@ -827,7 +928,7 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvme=
m,
> struct device_node *np)
> =C2=A0		if (nvmem->fixup_dt_cell_info)
> =C2=A0			nvmem->fixup_dt_cell_info(nvmem, &info);
> =C2=A0
> -		ret =3D nvmem_add_one_cell(nvmem, &info);
> +		ret =3D __nvmem_add_one_cell(nvmem, &info, layout);
> =C2=A0		kfree(info.name);
> =C2=A0		if (ret) {
> =C2=A0			of_node_put(info.np);
> @@ -837,8 +938,19 @@ int nvmem_add_cells_from_dt(struct nvmem_device *nvm=
em,
> struct device_node *np)
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> +
> +int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct device_no=
de
> *np)
> +{
> +	return __nvmem_add_cells_from_dt(nvmem, np, NULL);
> +}
> =C2=A0EXPORT_SYMBOL_GPL(nvmem_add_cells_from_dt);
> =C2=A0
> +int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct
> device_node *np)
> +{
> +	return __nvmem_add_cells_from_dt(layout->nvmem, np, layout);
> +}
> +EXPORT_SYMBOL_GPL(nvmem_layout_add_cells_from_dt);
> +
> =C2=A0static int nvmem_add_cells_from_legacy_of(struct nvmem_device *nvme=
m)
> =C2=A0{
> =C2=A0	return nvmem_add_cells_from_dt(nvmem, nvmem->dev.of_node);
> @@ -851,29 +963,68 @@ int nvmem_layout_register(struct nvmem_layout *layo=
ut)
> =C2=A0	if (!layout->add_cells)
> =C2=A0		return -EINVAL;
> =C2=A0
> -	/* Populate the cells */
> -	ret =3D layout->add_cells(layout);
> +	scoped_guard(srcu, &layout->nvmem->srcu) {
> +		if (READ_ONCE(layout->nvmem->disconnected))
> +			return -ENODEV;
> +		ret =3D layout->add_cells(layout);
> +	}
> =C2=A0	if (ret)
> -		return ret;
> +		goto err_unregister;
> =C2=A0
> =C2=A0#ifdef CONFIG_NVMEM_SYSFS
> =C2=A0	ret =3D nvmem_populate_sysfs_cells(layout->nvmem);
> -	if (ret) {
> -		nvmem_device_remove_all_cells(layout->nvmem);
> -		return ret;
> -	}
> +	if (ret)
> +		goto err_unregister;
> =C2=A0#endif
> =C2=A0
> =C2=A0	return 0;
> +
> +err_unregister:
> +	nvmem_layout_unregister(layout);
> +	return ret;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(nvmem_layout_register);
> =C2=A0
> =C2=A0void nvmem_layout_unregister(struct nvmem_layout *layout)
> =C2=A0{
> -	/* Keep the API even with an empty stub in case we need it later */
> +	struct nvmem_device *nvmem =3D layout->nvmem;
> +	struct nvmem_cell_entry *cell, *next;
> +	LIST_HEAD(cells);
> +
> +	scoped_guard(mutex, &nvmem_mutex) {
> +		list_for_each_entry_safe(cell, next, &nvmem->cells, node) {
> +			if (cell->layout !=3D layout)
> +				continue;
> +			WRITE_ONCE(cell->disconnected, true);
> +			list_move_tail(&cell->node, &cells);
> +		}
> +	}
> +
> +	nvmem_sysfs_remove_cells(nvmem);
> +
> +	/* Old cell handles retain data, never a departing layout's
> callbacks. */
> +	synchronize_srcu(&nvmem->srcu);
> +	list_for_each_entry_safe(cell, next, &cells, node) {
> +		blocking_notifier_call_chain(&nvmem_notifier,
> NVMEM_CELL_REMOVE, cell);
> +		list_del(&cell->node);
> +		nvmem_cell_entry_put(cell);
> +	}
> +#ifdef CONFIG_NVMEM_SYSFS
> +	if (!READ_ONCE(nvmem->disconnected) &&
> nvmem_populate_sysfs_cells(nvmem))
> +		dev_warn(&nvmem->dev, "Failed to restore provider cell
> attributes\n");
> +#endif
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
> =C2=A0
> +static void nvmem_disconnect(struct nvmem_device *nvmem)
> +{
> +	scoped_guard(mutex, &nvmem_mutex)
> +		WRITE_ONCE(nvmem->disconnected, true);
> +	synchronize_srcu(&nvmem->srcu);
> +	gpiod_put(nvmem->wp_gpio);
> +	nvmem->wp_gpio =3D NULL;
> +}
> +
> =C2=A0/**
> =C2=A0 * nvmem_register() - Register a nvmem device for given nvmem_confi=
g.
> =C2=A0 * Also creates a binary entry in /sys/bus/nvmem/devices/dev-name/n=
vmem
> @@ -883,10 +1034,8 @@ EXPORT_SYMBOL_GPL(nvmem_layout_unregister);
> =C2=A0 * Return: Will be an ERR_PTR() on error or a valid pointer to nvme=
m_device
> =C2=A0 * on success.
> =C2=A0 */
> -
> =C2=A0struct nvmem_device *nvmem_register(const struct nvmem_config *conf=
ig)
> =C2=A0{
> -	struct nvmem_operations *ops;
> =C2=A0	struct nvmem_device *nvmem;
> =C2=A0	int rval;
> =C2=A0
> @@ -900,15 +1049,15 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
> =C2=A0	if (!nvmem)
> =C2=A0		return ERR_PTR(-ENOMEM);
> =C2=A0
> -	ops =3D kzalloc_obj(*ops);
> -	if (!ops) {
> +	rval =3D init_srcu_struct(&nvmem->srcu);
> +	if (rval) {
> =C2=A0		kfree(nvmem);
> -		return ERR_PTR(-ENOMEM);
> +		return ERR_PTR(rval);
> =C2=A0	}
> =C2=A0
> =C2=A0	rval =3D ida_alloc(&nvmem_ida, GFP_KERNEL);
> =C2=A0	if (rval < 0) {
> -		kfree(ops);
> +		cleanup_srcu_struct(&nvmem->srcu);
> =C2=A0		kfree(nvmem);
> =C2=A0		return ERR_PTR(rval);
> =C2=A0	}
> @@ -918,9 +1067,11 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
> =C2=A0	nvmem->dev.type =3D &nvmem_provider_type;
> =C2=A0	nvmem->dev.bus =3D &nvmem_bus_type;
> =C2=A0	nvmem->dev.parent =3D config->dev;
> -	nvmem->ops =3D ops;
> =C2=A0
> =C2=A0	device_initialize(&nvmem->dev);
> +	mutex_init(&nvmem->sysfs_mutex);
> +
> +	nvmem->priv =3D config->priv;
> =C2=A0
> =C2=A0	if (!config->ignore_wp)
> =C2=A0		nvmem->wp_gpio =3D gpiod_get_optional(config->dev, "wp",
> @@ -935,24 +1086,23 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
> =C2=A0	INIT_LIST_HEAD(&nvmem->cells);
> =C2=A0	nvmem->fixup_dt_cell_info =3D config->fixup_dt_cell_info;
> =C2=A0
> -	ops->reg_read =3D config->reg_read;
> -	ops->reg_write =3D config->reg_write;
> +	nvmem->reg_read =3D config->reg_read;
> +	nvmem->reg_write =3D config->reg_write;
> =C2=A0
> =C2=A0	nvmem->owner =3D config->owner;
> -	if (!nvmem->owner && config->dev->driver)
> +	if (!nvmem->owner && !config->owner_is_explicit && config->dev-
> >driver)
> =C2=A0		nvmem->owner =3D config->dev->driver->owner;
> =C2=A0	nvmem->stride =3D config->stride ?: 1;
> =C2=A0	nvmem->word_size =3D config->word_size ?: 1;
> =C2=A0	nvmem->size =3D config->size;
> =C2=A0	nvmem->root_only =3D config->root_only;
> -	nvmem->priv =3D config->priv;
> =C2=A0	nvmem->type =3D config->type;
> =C2=A0	nvmem->keepout =3D config->keepout;
> =C2=A0	nvmem->nkeepout =3D config->nkeepout;
> =C2=A0	if (config->of_node)
> -		nvmem->dev.of_node =3D config->of_node;
> +		nvmem->dev.of_node =3D of_node_get(config->of_node);
> =C2=A0	else
> -		nvmem->dev.of_node =3D config->dev->of_node;
> +		nvmem->dev.of_node =3D of_node_get(config->dev->of_node);
> =C2=A0
> =C2=A0	switch (config->id) {
> =C2=A0	case NVMEM_DEVID_NONE:
> @@ -972,7 +1122,7 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
> =C2=A0		goto err_put_device;
> =C2=A0
> =C2=A0	nvmem->read_only =3D device_property_present(config->dev, "read-on=
ly")
> ||
> -			=C2=A0=C2=A0 config->read_only || !ops->reg_write;
> +			=C2=A0=C2=A0 config->read_only || !nvmem->reg_write;
> =C2=A0
> =C2=A0#ifdef CONFIG_NVMEM_SYSFS
> =C2=A0	nvmem->dev.groups =3D nvmem_dev_groups;
> @@ -1010,7 +1160,7 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
> =C2=A0
> =C2=A0	rval =3D nvmem_populate_layout(nvmem);
> =C2=A0	if (rval)
> -		goto err_remove_dev;
> +		goto err_unregister;
> =C2=A0
> =C2=A0	/* If the device has WP GPIO, default to read-only */
> =C2=A0	if (nvmem->wp_gpio)
> @@ -1019,23 +1169,25 @@ struct nvmem_device *nvmem_register(const struct
> nvmem_config *config)
> =C2=A0#ifdef CONFIG_NVMEM_SYSFS
> =C2=A0	rval =3D nvmem_populate_sysfs_cells(nvmem);
> =C2=A0	if (rval)
> -		goto err_destroy_layout;
> +		goto err_unregister;
> =C2=A0#endif
> =C2=A0
> +	nvmem->flags |=3D FLAG_REGISTERED;
> =C2=A0	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_ADD, nvmem);
> =C2=A0
> =C2=A0	return nvmem;
> =C2=A0
> -#ifdef CONFIG_NVMEM_SYSFS
> -err_destroy_layout:
> -	nvmem_destroy_layout(nvmem);
> -#endif
> -err_remove_dev:
> -	device_del(&nvmem->dev);
> +err_unregister:
> +	nvmem_unregister(nvmem);
> +	return ERR_PTR(rval);
> =C2=A0err_remove_cells:
> +	nvmem_disconnect(nvmem);
> =C2=A0	nvmem_device_remove_all_cells(nvmem);
> =C2=A0	nvmem_sysfs_remove_compat(nvmem);
> +	goto err_put_disconnected;
> =C2=A0err_put_device:
> +	nvmem_disconnect(nvmem);
> +err_put_disconnected:
> =C2=A0	put_device(&nvmem->dev);
> =C2=A0
> =C2=A0	return ERR_PTR(rval);
> @@ -1048,24 +1200,31 @@ static void nvmem_device_release(struct kref *kre=
f)
> =C2=A0
> =C2=A0	nvmem =3D container_of(kref, struct nvmem_device, refcnt);
> =C2=A0
> -	blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE, nvmem);
> -
> -	nvmem_sysfs_remove_compat(nvmem);
> -
> -	nvmem_device_remove_all_cells(nvmem);
> -	nvmem_destroy_layout(nvmem);
> -	device_unregister(&nvmem->dev);
> +	put_device(&nvmem->dev);
> =C2=A0}
> =C2=A0
> =C2=A0/**
> =C2=A0 * nvmem_unregister() - Unregister previously registered nvmem devi=
ce
> =C2=A0 *
> =C2=A0 * @nvmem: Pointer to previously registered nvmem device.
> + *
> + * Stop and drain provider callbacks before returning. Existing consumer=
s
> keep
> + * their core-owned metadata, but further access returns -ENODEV.
> =C2=A0 */
> =C2=A0void nvmem_unregister(struct nvmem_device *nvmem)
> =C2=A0{
> -	if (nvmem)
> -		kref_put(&nvmem->refcnt, nvmem_device_release);
> +	if (!nvmem)
> +		return;
> +
> +	nvmem_disconnect(nvmem);
> +	nvmem_destroy_layout(nvmem);
> +	if (nvmem->flags & FLAG_REGISTERED)
> +		blocking_notifier_call_chain(&nvmem_notifier, NVMEM_REMOVE,
> nvmem);
> +	nvmem_sysfs_remove_compat(nvmem);
> +	nvmem_sysfs_remove_cells(nvmem);
> +	device_del(&nvmem->dev);
> +	nvmem_device_remove_all_cells(nvmem);
> +	kref_put(&nvmem->refcnt, nvmem_device_release);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(nvmem_unregister);
> =C2=A0
> @@ -1103,17 +1262,33 @@ struct nvmem_device *devm_nvmem_register(struct d=
evice
> *dev,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(devm_nvmem_register);
> =C2=A0
> +struct nvmem_match_data {
> +	void *data;
> +	int (*match)(struct device *dev, const void *data);
> +};
> +
> +static int nvmem_match_device(struct device *dev, const void *data)
> +{
> +	const struct nvmem_match_data *match =3D data;
> +	struct nvmem_device *nvmem =3D to_nvmem_device(dev);
> +
> +	guard(srcu)(&nvmem->srcu);
> +	if (READ_ONCE(nvmem->disconnected))
> +		return 0;
> +	return match->match(dev, match->data);
> +}
> +
> =C2=A0static struct nvmem_device *nvmem_device_match(void *data,
> =C2=A0			int (*match)(struct device *dev, const void *data))
> =C2=A0{
> +	struct nvmem_match_data match_data =3D { .data =3D data, .match =3D mat=
ch
> };
> =C2=A0	struct nvmem_device *nvmem =3D NULL;
> =C2=A0	struct device *dev;
> =C2=A0
> -	scoped_guard(mutex, &nvmem_mutex) {
> -		dev =3D bus_find_device(&nvmem_bus_type, NULL, data, match);
> -		if (dev)
> -			nvmem =3D to_nvmem_device(dev);
> -	}
> +	guard(mutex)(&nvmem_mutex);
> +	dev =3D bus_find_device(&nvmem_bus_type, NULL, &match_data,
> nvmem_match_device);
> +	if (dev)
> +		nvmem =3D to_nvmem_device(dev);
> =C2=A0	if (!nvmem)
> =C2=A0		return ERR_PTR(-EPROBE_DEFER);
> =C2=A0
> @@ -1121,8 +1296,7 @@ static struct nvmem_device *nvmem_device_match(void
> *data,
> =C2=A0		dev_err(&nvmem->dev,
> =C2=A0			"could not increase module refcount for cell %s\n",
> =C2=A0			nvmem_dev_name(nvmem));
> -
> -		put_device(&nvmem->dev);
> +		put_device(dev);
> =C2=A0		return ERR_PTR(-EINVAL);
> =C2=A0	}
> =C2=A0
> @@ -1337,8 +1511,10 @@ nvmem_cell_get_from_lookup(struct device *dev, con=
st
> char *con_id)
> =C2=A0				cell =3D ERR_PTR(-ENOENT);
> =C2=A0			} else {
> =C2=A0				cell =3D nvmem_create_cell(cell_entry, con_id,
> 0);
> -				if (IS_ERR(cell))
> +				if (IS_ERR(cell)) {
> +					nvmem_cell_entry_put(cell_entry);
> =C2=A0					nvmem_device_put(nvmem);
> +				}
> =C2=A0			}
> =C2=A0			break;
> =C2=A0		}
> @@ -1347,12 +1523,6 @@ nvmem_cell_get_from_lookup(struct device *dev, con=
st
> char *con_id)
> =C2=A0	return cell;
> =C2=A0}
> =C2=A0
> -static void nvmem_layout_module_put(struct nvmem_device *nvmem)
> -{
> -	if (nvmem->layout && nvmem->layout->dev.driver)
> -		module_put(nvmem->layout->dev.driver->owner);
> -}
> -
> =C2=A0#if IS_ENABLED(CONFIG_OF)
> =C2=A0static struct nvmem_cell_entry *
> =C2=A0nvmem_find_cell_entry_by_node(struct nvmem_device *nvmem, struct de=
vice_node
> *np)
> @@ -1362,25 +1532,15 @@ nvmem_find_cell_entry_by_node(struct nvmem_device
> *nvmem, struct device_node *np
> =C2=A0	guard(mutex)(&nvmem_mutex);
> =C2=A0
> =C2=A0	list_for_each_entry(cell, &nvmem->cells, node) {
> -		if (np =3D=3D cell->np)
> +		if (np =3D=3D cell->np) {
> +			kref_get(&cell->refcnt);
> =C2=A0			return cell;
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	return NULL;
> =C2=A0}
> =C2=A0
> -static int nvmem_layout_module_get_optional(struct nvmem_device *nvmem)
> -{
> -	if (!nvmem->layout)
> -		return 0;
> -
> -	if (!nvmem->layout->dev.driver ||
> -	=C2=A0=C2=A0=C2=A0 !try_module_get(nvmem->layout->dev.driver->owner))
> -		return -EPROBE_DEFER;
> -
> -	return 0;
> -}
> -
> =C2=A0/**
> =C2=A0 * of_nvmem_cell_get() - Get a nvmem cell from given device node an=
d cell id
> =C2=A0 *
> @@ -1443,25 +1603,17 @@ struct nvmem_cell *of_nvmem_cell_get(struct
> device_node *np, const char *id)
> =C2=A0		return ERR_CAST(nvmem);
> =C2=A0	}
> =C2=A0
> -	ret =3D nvmem_layout_module_get_optional(nvmem);
> -	if (ret) {
> -		of_node_put(cell_np);
> -		nvmem_device_put(nvmem);
> -		return ERR_PTR(ret);
> -	}
> -
> =C2=A0	cell_entry =3D nvmem_find_cell_entry_by_node(nvmem, cell_np);
> =C2=A0	of_node_put(cell_np);
> =C2=A0	if (!cell_entry) {
> -		nvmem_layout_module_put(nvmem);
> -		ret =3D nvmem->layout ? -EPROBE_DEFER : -ENOENT;
> +		ret =3D READ_ONCE(nvmem->layout) ? -EPROBE_DEFER : -ENOENT;
> =C2=A0		nvmem_device_put(nvmem);
> =C2=A0		return ERR_PTR(ret);
> =C2=A0	}
> =C2=A0
> =C2=A0	cell =3D nvmem_create_cell(cell_entry, id, cell_index);
> =C2=A0	if (IS_ERR(cell)) {
> -		nvmem_layout_module_put(nvmem);
> +		nvmem_cell_entry_put(cell_entry);
> =C2=A0		nvmem_device_put(nvmem);
> =C2=A0	}
> =C2=A0
> @@ -1575,8 +1727,8 @@ void nvmem_cell_put(struct nvmem_cell *cell)
> =C2=A0	if (cell->id)
> =C2=A0		kfree_const(cell->id);
> =C2=A0
> +	nvmem_cell_entry_put(cell->entry);
> =C2=A0	kfree(cell);
> -	nvmem_layout_module_put(nvmem);
> =C2=A0	nvmem_device_put(nvmem);
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(nvmem_cell_put);
> @@ -1628,6 +1780,10 @@ static int __nvmem_cell_read(struct nvmem_device
> *nvmem,
> =C2=A0{
> =C2=A0	int rc;
> =C2=A0
> +	guard(srcu)(&nvmem->srcu);
> +	if (READ_ONCE(nvmem->disconnected) || READ_ONCE(cell->disconnected))
> +		return -ENODEV;
> +
> =C2=A0	rc =3D nvmem_reg_read(nvmem, cell->offset, buf, cell->raw_len);
> =C2=A0
> =C2=A0	if (rc)
> @@ -1742,7 +1898,14 @@ static int __nvmem_cell_entry_write(struct
> nvmem_cell_entry *cell, void *buf, si
> =C2=A0	struct nvmem_device *nvmem =3D cell->nvmem;
> =C2=A0	int rc;
> =C2=A0
> -	if (!nvmem || nvmem->read_only ||
> +	if (!nvmem)
> +		return -EINVAL;
> +
> +	guard(srcu)(&nvmem->srcu);
> +	if (READ_ONCE(nvmem->disconnected) || READ_ONCE(cell->disconnected))
> +		return -ENODEV;
> +
> +	if (nvmem->read_only ||
> =C2=A0	=C2=A0=C2=A0=C2=A0 (cell->bit_offset =3D=3D 0 && len !=3D cell->by=
tes))
> =C2=A0		return -EINVAL;
> =C2=A0
> diff --git a/drivers/nvmem/internals.h b/drivers/nvmem/internals.h
> index 4e610deeaa7b..6c6d4a690e8f 100644
> --- a/drivers/nvmem/internals.h
> +++ b/drivers/nvmem/internals.h
> @@ -4,14 +4,10 @@
> =C2=A0#define _LINUX_NVMEM_INTERNALS_H
> =C2=A0
> =C2=A0#include <linux/device.h>
> +#include <linux/mutex.h>
> =C2=A0#include <linux/nvmem-consumer.h>
> =C2=A0#include <linux/nvmem-provider.h>
> -
> -/* Hold pointers to callbacks owned by the nvmem provider module. */
> -struct nvmem_operations {
> -	nvmem_reg_read_t	reg_read;
> -	nvmem_reg_write_t	reg_write;
> -};
> +#include <linux/srcu.h>
> =C2=A0
> =C2=A0struct nvmem_device {
> =C2=A0	struct module		*owner;
> @@ -20,6 +16,8 @@ struct nvmem_device {
> =C2=A0	int			word_size;
> =C2=A0	int			id;
> =C2=A0	struct kref		refcnt;
> +	struct srcu_struct	srcu;
> +	bool			disconnected;
> =C2=A0	size_t			size;
> =C2=A0	bool			read_only;
> =C2=A0	bool			root_only;
> @@ -34,12 +32,16 @@ struct nvmem_device {
> =C2=A0	unsigned int		nkeepout;
> =C2=A0	struct gpio_desc	*wp_gpio;
> =C2=A0	struct nvmem_layout	*layout;
> -	struct nvmem_operations	*ops;
> +	nvmem_reg_read_t		reg_read;
> +	nvmem_reg_write_t	reg_write;
> =C2=A0	void *priv;
> +	struct mutex		sysfs_mutex;
> =C2=A0	bool			sysfs_cells_populated;
> +	struct attribute_group cells_group;
> =C2=A0};
> =C2=A0
> =C2=A0int nvmem_add_cells_from_dt(struct nvmem_device *nvmem, struct devi=
ce_node
> *np);
> +int nvmem_layout_add_cells_from_dt(struct nvmem_layout *layout, struct
> device_node *np);
> =C2=A0
> =C2=A0#if IS_ENABLED(CONFIG_OF)
> =C2=A0int nvmem_layout_bus_register(void);
> diff --git a/drivers/nvmem/layouts.c b/drivers/nvmem/layouts.c
> index 07a34be9669c..32995c9be68d 100644
> --- a/drivers/nvmem/layouts.c
> +++ b/drivers/nvmem/layouts.c
> @@ -118,6 +118,7 @@ static int nvmem_layout_create_device(struct nvmem_de=
vice
> *nvmem,
> =C2=A0
> =C2=A0	ret =3D device_add(dev);
> =C2=A0	if (ret) {
> +		nvmem->layout =3D NULL;
> =C2=A0		put_device(dev);
> =C2=A0		return ret;
> =C2=A0	}
> @@ -192,6 +193,7 @@ void nvmem_destroy_layout(struct nvmem_device *nvmem)
> =C2=A0	dev =3D &nvmem->layout->dev;
> =C2=A0	of_node_clear_flag(dev->of_node, OF_POPULATED_BUS);
> =C2=A0	device_unregister(dev);
> +	WRITE_ONCE(nvmem->layout, NULL);
> =C2=A0}
> =C2=A0
> =C2=A0int nvmem_layout_bus_register(void)
> diff --git a/drivers/nvmem/layouts/fixed-layout.c
> b/drivers/nvmem/layouts/fixed-layout.c
> index 635d448b3dd2..b97f39897a75 100644
> --- a/drivers/nvmem/layouts/fixed-layout.c
> +++ b/drivers/nvmem/layouts/fixed-layout.c
> @@ -19,7 +19,7 @@ static int fixed_layout_add_cells(struct nvmem_layout
> *layout)
> =C2=A0	if (!np)
> =C2=A0		return -ENOENT;
> =C2=A0
> -	ret =3D nvmem_add_cells_from_dt(layout->nvmem, np);
> +	ret =3D nvmem_layout_add_cells_from_dt(layout, np);
> =C2=A0	of_node_put(np);
> =C2=A0
> =C2=A0	return ret;
> diff --git a/drivers/nvmem/layouts/onie-tlv.c b/drivers/nvmem/layouts/oni=
e-
> tlv.c
> index 8b0f3c1b8a0e..99e7a5406b4c 100644
> --- a/drivers/nvmem/layouts/onie-tlv.c
> +++ b/drivers/nvmem/layouts/onie-tlv.c
> @@ -95,18 +95,19 @@ static nvmem_cell_post_process_t onie_tlv_read_cb(u8 =
type,
> u8 *buf)
> =C2=A0	return NULL;
> =C2=A0}
> =C2=A0
> -static int onie_tlv_add_cells(struct device *dev, struct nvmem_device *n=
vmem,
> +static int onie_tlv_add_cells(struct nvmem_layout *layout,
> =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t data_len, u8 *data)
> =C2=A0{
> +	struct device *dev =3D &layout->dev;
> =C2=A0	struct nvmem_cell_info cell =3D {};
> -	struct device_node *layout;
> +	struct device_node *layout_np;
> =C2=A0	struct onie_tlv tlv;
> =C2=A0	unsigned int hdr_len =3D sizeof(struct onie_tlv_hdr);
> =C2=A0	unsigned int offset =3D 0;
> =C2=A0	int ret;
> =C2=A0
> -	layout =3D of_nvmem_layout_get_container(nvmem);
> -	if (!layout)
> +	layout_np =3D of_nvmem_layout_get_container(layout->nvmem);
> +	if (!layout_np)
> =C2=A0		return -ENOENT;
> =C2=A0
> =C2=A0	while (offset < data_len) {
> @@ -123,12 +124,13 @@ static int onie_tlv_add_cells(struct device *dev, s=
truct
> nvmem_device *nvmem,
> =C2=A0
> =C2=A0		cell.offset =3D hdr_len + offset + sizeof(tlv.type) +
> sizeof(tlv.len);
> =C2=A0		cell.bytes =3D tlv.len;
> -		cell.np =3D of_get_child_by_name(layout, cell.name);
> +		cell.np =3D of_get_child_by_name(layout_np, cell.name);
> =C2=A0		cell.read_post_process =3D onie_tlv_read_cb(tlv.type, data +
> offset + sizeof(tlv));
> =C2=A0
> -		ret =3D nvmem_add_one_cell(nvmem, &cell);
> +		ret =3D nvmem_layout_add_cell(layout, &cell);
> =C2=A0		if (ret) {
> -			of_node_put(layout);
> +			of_node_put(cell.np);
> +			of_node_put(layout_np);
> =C2=A0			return ret;
> =C2=A0		}
> =C2=A0
> @@ -136,7 +138,7 @@ static int onie_tlv_add_cells(struct device *dev, str=
uct
> nvmem_device *nvmem,
> =C2=A0		offset +=3D sizeof(tlv) + tlv.len;
> =C2=A0	}
> =C2=A0
> -	of_node_put(layout);
> +	of_node_put(layout_np);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -221,7 +223,7 @@ static int onie_tlv_parse_table(struct nvmem_layout
> *layout)
> =C2=A0		return -EINVAL;
> =C2=A0
> =C2=A0	data =3D table + hdr_len;
> -	ret =3D onie_tlv_add_cells(dev, nvmem, data_len, data);
> +	ret =3D onie_tlv_add_cells(layout, data_len, data);
> =C2=A0	if (ret)
> =C2=A0		return ret;
> =C2=A0
> diff --git a/drivers/nvmem/layouts/sl28vpd.c b/drivers/nvmem/layouts/sl28=
vpd.c
> index e93b020b0836..1e65a0b6c61f 100644
> --- a/drivers/nvmem/layouts/sl28vpd.c
> +++ b/drivers/nvmem/layouts/sl28vpd.c
> @@ -124,8 +124,9 @@ static int sl28vpd_add_cells(struct nvmem_layout *lay=
out)
> =C2=A0		info.read_post_process =3D pinfo->read_post_process;
> =C2=A0		info.np =3D of_get_child_by_name(layout_np, pinfo->name);
> =C2=A0
> -		ret =3D nvmem_add_one_cell(nvmem, &info);
> +		ret =3D nvmem_layout_add_cell(layout, &info);
> =C2=A0		if (ret) {
> +			of_node_put(info.np);
> =C2=A0			of_node_put(layout_np);
> =C2=A0			return ret;
> =C2=A0		}
> diff --git a/drivers/nvmem/layouts/u-boot-env.c b/drivers/nvmem/layouts/u=
-
> boot-env.c
> index 33ec2350386f..83c687e43e5a 100644
> --- a/drivers/nvmem/layouts/u-boot-env.c
> +++ b/drivers/nvmem/layouts/u-boot-env.c
> @@ -49,11 +49,13 @@ static int u_boot_env_read_post_process_ethaddr(void
> *context, const char *id, i
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -static int u_boot_env_parse_cells(struct device *dev, struct nvmem_devic=
e
> *nvmem, uint8_t *buf,
> +static int u_boot_env_parse_cells(struct device *dev, struct nvmem_devic=
e
> *nvmem,
> +				=C2=A0 struct nvmem_layout *layout, uint8_t *buf,
> =C2=A0				=C2=A0 size_t data_offset, size_t data_len)
> =C2=A0{
> =C2=A0	char *data =3D buf + data_offset;
> =C2=A0	char *var, *value, *eq;
> +	int ret;
> =C2=A0
> =C2=A0	for (var =3D data;
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 var < data + data_len && *var;
> @@ -78,14 +80,19 @@ static int u_boot_env_parse_cells(struct device *dev,
> struct nvmem_device *nvmem
> =C2=A0			info.read_post_process =3D
> u_boot_env_read_post_process_ethaddr;
> =C2=A0		}
> =C2=A0
> -		nvmem_add_one_cell(nvmem, &info);
> +		ret =3D layout ? nvmem_layout_add_cell(layout, &info) :
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 nvmem_add_one_cell(nvmem, &info)=
;
> +		if (ret) {
> +			of_node_put(info.np);
> +			return ret;
> +		}
> =C2=A0	}
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0
> -int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
> -		=C2=A0=C2=A0=C2=A0=C2=A0 enum u_boot_env_format format)
> +static int __u_boot_env_parse(struct device *dev, struct nvmem_device *n=
vmem,
> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct nvmem_layout *layout, enum
> u_boot_env_format format)
> =C2=A0{
> =C2=A0	size_t crc32_data_offset;
> =C2=A0	size_t crc32_data_len;
> @@ -156,13 +163,19 @@ int u_boot_env_parse(struct device *dev, struct
> nvmem_device *nvmem,
> =C2=A0	}
> =C2=A0
> =C2=A0	buf[dev_size - 1] =3D '\0';
> -	err =3D u_boot_env_parse_cells(dev, nvmem, buf, data_offset, data_len);
> +	err =3D u_boot_env_parse_cells(dev, nvmem, layout, buf, data_offset,
> data_len);
> =C2=A0
> =C2=A0err_kfree:
> =C2=A0	kfree(buf);
> =C2=A0err_out:
> =C2=A0	return err;
> =C2=A0}
> +
> +int u_boot_env_parse(struct device *dev, struct nvmem_device *nvmem,
> +		=C2=A0=C2=A0=C2=A0=C2=A0 enum u_boot_env_format format)
> +{
> +	return __u_boot_env_parse(dev, nvmem, NULL, format);
> +}
> =C2=A0EXPORT_SYMBOL_GPL(u_boot_env_parse);
> =C2=A0
> =C2=A0static int u_boot_env_add_cells(struct nvmem_layout *layout)
> @@ -172,7 +185,7 @@ static int u_boot_env_add_cells(struct nvmem_layout
> *layout)
> =C2=A0
> =C2=A0	format =3D (uintptr_t)device_get_match_data(dev);
> =C2=A0
> -	return u_boot_env_parse(dev, layout->nvmem, format);
> +	return __u_boot_env_parse(dev, layout->nvmem, layout, format);
> =C2=A0}
> =C2=A0
> =C2=A0static int u_boot_env_probe(struct nvmem_layout *layout)
> diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provide=
r.h
> index 6063fe5b7784..87d871a6d5c6 100644
> --- a/include/linux/nvmem-provider.h
> +++ b/include/linux/nvmem-provider.h
> @@ -81,6 +81,8 @@ struct nvmem_cell_info {
> =C2=A0 * @name:	Optional name.
> =C2=A0 * @id:		Optional device ID used in full name. Ignored if name
> is NULL.
> =C2=A0 * @owner:	Pointer to exporter module. Used for refcounting.
> + * @owner_is_explicit: Use @owner even when NULL, without defaulting to =
the
> + *		parent driver's module.
> =C2=A0 * @cells:	Optional array of pre-defined NVMEM cells.
> =C2=A0 * @ncells:	Number of elements in cells.
> =C2=A0 * @add_legacy_fixed_of_cells:	Read fixed NVMEM cells from old OF s=
yntax.
> @@ -107,12 +109,16 @@ struct nvmem_cell_info {
> =C2=A0 *
> =C2=A0 * Note: Specifying name and setting id to -1 implies a unique devi=
ce
> =C2=A0 * whose name is provided as-is (kept unaltered).
> + *
> + * Provider callbacks and @priv must remain valid until nvmem_unregister=
()
> + * returns, or until a failed nvmem_register() returns.
> =C2=A0 */
> =C2=A0struct nvmem_config {
> =C2=A0	struct device		*dev;
> =C2=A0	const char		*name;
> =C2=A0	int			id;
> =C2=A0	struct module		*owner;
> +	bool			owner_is_explicit;
> =C2=A0	const struct nvmem_cell_info	*cells;
> =C2=A0	int			ncells;
> =C2=A0	bool			add_legacy_fixed_of_cells;
> @@ -144,7 +150,7 @@ struct nvmem_config {
> =C2=A0 * @nvmem:		The underlying NVMEM device
> =C2=A0 * @add_cells:		Will be called if a nvmem device is found which
> =C2=A0 *			has this layout. The function will add layout
> - *			specific cells with nvmem_add_one_cell().
> + *			specific cells with nvmem_layout_add_cell().
> =C2=A0 *
> =C2=A0 * A nvmem device can hold a well defined structure which can just =
be
> =C2=A0 * evaluated during runtime. For example a TLV list, or a list of "=
name=3Dval"
> @@ -173,6 +179,8 @@ struct nvmem_device *devm_nvmem_register(struct devic=
e
> *dev,
> =C2=A0
> =C2=A0int nvmem_add_one_cell(struct nvmem_device *nvmem,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct nvmem_cell_info=
 *info);
> +int nvmem_layout_add_cell(struct nvmem_layout *layout,
> +			=C2=A0 const struct nvmem_cell_info *info);
> =C2=A0
> =C2=A0int nvmem_layout_register(struct nvmem_layout *layout);
> =C2=A0void nvmem_layout_unregister(struct nvmem_layout *layout);
> @@ -212,6 +220,12 @@ static inline int nvmem_layout_register(struct
> nvmem_layout *layout)
> =C2=A0	return -EOPNOTSUPP;
> =C2=A0}
> =C2=A0
> +static inline int nvmem_layout_add_cell(struct nvmem_layout *layout,
> +				=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct nvmem_cell_info *i=
nfo)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> =C2=A0static inline void nvmem_layout_unregister(struct nvmem_layout *lay=
out) {}
> =C2=A0
> =C2=A0static inline int nvmem_add_cells_from_dt(struct nvmem_device *nvme=
m,
