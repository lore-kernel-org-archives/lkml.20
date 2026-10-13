Received: from mail-yx2-f2.google.com (mail-yx2-f2.google.com [74.125.224.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC9E42668C
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.130
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791856517; cv=pass; b=j5a2ei7d8YO/BPBVbqcVD14gRcmXLCjYArlRqisVCli4jfrDnMIU577p1MTr3r9iJ0FeW9wGVvqTn6PKCXZPzyEE5Zo8qmXCVFS0BD0WBB9Ns6heIUGEtaeOA9TxbNA5rNRxdux9screO4BF9G+uuV1kBLYnZmW0YKqsGc4cYSg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791856517; c=relaxed/simple;
	bh=mG265DhJNejB3aQoWJ6qVy75eCz04BYxxJNwPeHfTj4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kWghe6w/G8YqLRIHKq1K0GqQEUXN5yUHo45rQMKdlNh5Vl/kXcEn6329qDnfhOgU/frs7C6gYmmcYMSihCSVCL/anGo76dVjLbAQGA+ehdAizv4RxhO+J4cmbghC3JH3gePpKL+H6f9lMsrJhZ7JnIFjbx02lUweGgGF53j4a6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wvn5T5ze; arc=pass smtp.client-ip=74.125.224.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wvn5T5ze"
Received: by mail-yx2-f2.google.com with SMTP id 956f58d0204a3-67569b8cbf8so728468d50.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:55:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791856515; cv=none;
        d=google.com; s=arc-20260327;
        b=WrozCiDq6h1shTx1XA37KjgNYw3701oxk6JbdTTV5pC37o3ygFR+SCZhOiGCsDyVOt
         eV3eEc2fwSageOpl2K9potLF5tcyx2h89Tvv/BuqIPbrKEJsg7FtMyJly/y70vmyDTbB
         j59Cl6OQxKCZpFHrZ2fUE9DsT4C2mmPsGT2ov9akQ4yxoaemlh6/6+TaqAnKkjl+lH+r
         iW9J6DfWNrGcyQXqqqegcAGaHWxo/iE3f1P13Gtp68XqS/G3+AHj+EtvX+R5obdkJ2av
         p9yY3Jip7UDOaNr5sqJpRp/lehY3sqCjlVPqeEANNTq6yygMA1crOAKyVqe9WeZ1wldA
         OY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZWY1+3DvZQ0StiNShQCtdQAyPVbWkBMdlv0s3OdV3Y=;
        fh=qcY0Xrxp1663br808aXh74UgBep8h1P4BejHKB+EBEw=;
        b=Ae0fY2akBS8cigEEikqADsRDzaK0SJiWG5fjT0PuWAM7Fl//LhvRabM/SXKSj7nY6v
         QkV6A/L3V0Vni6KMdyebYD0DUbguvup8omcDLeDo73NoDPGY2LVaTjEeIVbIOD1yPyJm
         nEk42R7oZf7GLFd0jmM30M2MzrJ4S/k4KwP0O1HPfEfH/+4eeQr4TFcLcU+draU+4wWb
         4gLW9A2RMKTXaZY15i9mqHjcmSuHBkDOvudxnR4C4VG1eAXuH8nS/VsS46MH7qUPMem1
         4IZ7n7qZafSzQ08kDsemRV/iyAMjg4ZYtcZZU6WfyAHS3lic40kVWAh9rdzFXfbHVg0s
         n8Vg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791856515; x=1792461315; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PZWY1+3DvZQ0StiNShQCtdQAyPVbWkBMdlv0s3OdV3Y=;
        b=Wvn5T5zeH6R5qvW8UAxE8l8bgurch7aUZebNHYYc6H49S066y+tWC/1rnEHYsSWbf0
         cfuZSZUCUUD7bN//VvAFSnfzyIm1GCdpC6ibK5mjfYIipppdyDPMmbol2d4cOjupJgBN
         RkTKE2HYTJcVuxjosGl94VQmG2blg1X8rZiS0pS7ZrPzyiMpltDpj8zCGgxPe+weEB0U
         u94imbMvQIji5YbbKR0KEwqjG+mkKWFE9G56eqN9VjidkNnXSK6gtEwPzhW/rCixYO7O
         o9h8cKWuXCyA8E6CMFpkUKVzvQzqpImXrh4CjKvaLIAThr9g8DohGqo0kPwPzLZPUMVi
         rj0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791856515; x=1792461315;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PZWY1+3DvZQ0StiNShQCtdQAyPVbWkBMdlv0s3OdV3Y=;
        b=kiT2X53Ovb5Non6scO/cx3r0nJmRsS0X2nYqsGA7DoM20GhQ5SsBIO2vwfUiLSHFjU
         og7/aaBdBnAjSJR7tYNdmoVxCmqHxzmQoAgAAVbQRt06ACWk7eglJvWaDMPV/+/0SLPg
         e5Liz0liIBUeSaoVNHz5tGrs4oO7LNWdCWlIC8WGM1NDTypv3XsoDfkXjx6X7PEuubTu
         vshPLaPEMif3UgOy/UhTdsGMYUZoSr2IeinZfbR5BGFsELB+5SPBLMsNXFcNjcAALFAO
         JlSHMbtJ0gSGxzAETWwQluddfIl9HgnNID5F7hj3ue77H/2whWPfU/W9cIb6Vkx9RS1B
         i3tg==
X-Gm-Message-State: AFq9FYKMdKjZ5/6oRuUVh55wmpZ2BF+H+W/1aeFctn6qm4vPF9ESX82E
	pDGqIsLYNrLGhysFtYelYvG5rTMknBK5SxmPXKd9odpupIqZyLIPZcW32rwDODYMbZZaKYC6VVv
	AOGuq/koGHfw/fwPWBTJqxE8GbXCqb14=
X-Gm-Gg: AYBFou3PLlvCQ/JTfUtNgZv7F/wd/mPcskNITU3EfLTAVMbmkRI3JPAzQkjueDaUfc0
	ouLbVryYPL8/yl3egvMg3H9tx64gZKIYpD8jijWjL4VY2VOqvGGJAA/zI1gftQCuXrPJ/crKZQa
	x+jXSJUxp8Wjm26nOZQd9Kdrs2xmHifiipunDEEGo0DnYeDtatEO0yuVeu3bQdAmXILuC2b9x6Q
	NdFQfhqe+i/KYh9PVgNKcZS6gFnnG/yAnT7DjHbOLdAz3YDuB6in3Kv3Jzwn3puDhFV3iSrxHWH
	zG5a7lv1W59qMP+wgC+VB4U+OK/daLXqMqWIgXuO4cWtetarm/Iy5/NQFmkifo0B135gnuxyhf4
	yqUg2z2weQQUzMbvFGI0tTo4qwxjEfCfvhSn4
X-Received: by 2002:a05:690e:d0f:b0:677:c1c9:8cad with SMTP id
 956f58d0204a3-6793630857bmr4065688d50.101.1791856515453; Mon, 12 Oct 2026
 18:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011131857.30481-1-jianyungao89@gmail.com> <as1riZMcDaX5niW9@aschofie-mobl2.lan>
In-Reply-To: <as1riZMcDaX5niW9@aschofie-mobl2.lan>
From: Jianyun Gao <jianyungao89@gmail.com>
Date: Tue, 13 Oct 2026 09:55:05 +0800
X-Gm-Features: AclHuK-qPrcKDhDkwZ2-LoYX7aqLa6VHDfxw6GQjUohnMboPcDsPQB2ik2549xw
Message-ID: <CAHP3+4DCsJ4vJWFWfswGj70p+it+KJ2fLA1G8p5iKYJ7fi4TGw@mail.gmail.com>
Subject: Re: [PATCH] dax: fix mapping_store() returning 0 instead of error code
To: Alison Schofield <alison.schofield@intel.com>
Cc: linux-kernel@vger.kernel.org, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <nvdimm@lists.linux.dev>, 
	"open list:DEVICE DIRECT ACCESS (DAX)" <linux-cxl@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Alison,

Thank you for pointing this out! I'll drop my patch since Muchun's
version covers both cases. I'll review Muchun's patch and add my
Reviewed-by if it looks good.

Best regards,
Jianyun

On Tue, Oct 13, 2026 at 7:21=E2=80=AFAM Alison Schofield
<alison.schofield@intel.com> wrote:
>
> On Sun, Oct 11, 2026 at 09:18:57PM +0800, jianyungao89@gmail.com wrote:
> > From: Jianyun Gao <jianyungao89@gmail.com>
> >
> > When the region driver is not loaded, mapping_store() returns rc
> > which is 0 at that point, instead of an error code. Set it to
> > -ENXIO to match the equivalent check in size_store().
>
>
> Hi Jianyun,
>
> The change looks correct, but there is another path in mapping_store() wi=
th
> the same problem. When alloc_is_aligned() fails, rc is still zero, so the
> sysfs write reports success without allocating the requested range.
>
> Muchun Song already posted a patch addressing both cases.
> https://lore.kernel.org/nvdimm/20260924025035.1265035-1-songmuchun@byteda=
nce.com/
>
> Please take a look and add your reviewed-by tag to Muchun's patchset
> or comment if it doesn't meet your needs.
>
> -- Alison
>
> >
> > Fixes: 9567da0b408a ("device-dax: Introduce bus + driver model")
> > Signed-off-by: Jianyun Gao <jianyungao89@gmail.com>
> > ---
> >  drivers/dax/bus.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
> > index b809e1a264af..262f97b5e7aa 100644
> > --- a/drivers/dax/bus.c
> > +++ b/drivers/dax/bus.c
> > @@ -1192,7 +1192,7 @@ static ssize_t mapping_store(struct device *dev, =
struct device_attribute *attr,
> >               return rc;
> >       if (!dax_region->dev->driver) {
> >               up_write(&dax_region_rwsem);
> > -             return rc;
> > +             return -ENXIO;
> >       }
> >       rc =3D down_write_killable(&dax_dev_rwsem);
> >       if (rc) {
> > --
> > 2.34.1
> >
