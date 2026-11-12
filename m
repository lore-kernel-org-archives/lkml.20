Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.222.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794512122;
	b=DPG/Vm4XVqiW1vk7Yg8r87W3PdevaxBws5q/Z+DhHi8Q8/NcVQeBCjWQ7z0VO7+zOEr5
	 3PbeG8BUzc0i5HJIHII8ymlG4j+XxxL3k5yt5Eo7TutOhk3AsWkm4VRtE+dXj16hLecpL
	 50CTQM2KTwmg+dnIiNoTpy2hijGZP77wGHOyT7GZgVHITmcfHlIUjJpjUzKlFchMMwpQ/
	 xIExjk3k9LVyAHnjZu9Z83ywAZmYqaLkUzf1xTPvz5D33yxJXlbeVZ57CA47MBzD9CQBK
	 t4glSHi97jRq53EWlTdAkd3Vs2FJBAgETOCkM1lxM7cXqRFRCuhmpZ0A0zezEwxlNwA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794512122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hSq411+s9NdWoKtVDUAKy0Kf3U5pcLNuZimkjP4e+Hw=;
	b=yLy7NJaJwWRaPcA3NElXqpLlLYFnG9kaX0IoFC0Lq6Dn9a7UQ8iRCon6NYC0CRP6XknY
	 5/4OjYcqsuIv5ZkupST6py49bPJFIskuSPiCGKzBNUn0AIUeD2j7R+Ip+lp4H/qtX3Gkd
	 +xck19qL59GDV54NCSLYWJR/jFuTgFV7pPGm2Vxrg32ToGLNC5zhAatvJLPWe+P7E4wrG
	 UgzO2OV8y2Dcha7HzHpNiGchnQmEiqwEeja2KkPq3V1vhT/08yCJanpkQNeb2IkGPqpbR
	 O/Kc5eVaCFOyRvgufiKzxdULg2CM+WtUIZ0kjR6y4l/G57EYCSKjg+QbwycsOGWQCyQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOvkPnaM;
	arc=fail smtp.remote-ip=209.85.222.179
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36B3606A331
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 19:35:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D36B3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TOvkPnaM
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-93e635220b4so14225185a.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:35:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794512121; cv=none;
        d=google.com; s=arc-20260327;
        b=o9zmP8NcYJiqBIm1hbr4WqDomCAMIMnWzmrnjpKaGJjLsHYPtjgiw9G+75qFdzkHZo
         hWMW3CNYIIODJCB6KXyyGneLe/duBLE2FXihZvCdgfUyzVa5VXLPqgrYUIJq/zc/K2Hd
         dxjreUjxIoOm9CxQYZvSUAkGXq+PbhTQkF7XDSVKV+UTF2ZcH8ZkS78TbHSpeLUf6sRE
         NBStFFwh3bk2z/KRvEXSjhzjdBcYsZv7xNysBLVxsm9dl9eyP33wMUIqcD12t5b34kcx
         VQHk1o8DAOJbwIeqqNzDeYXvZo6E42KqVKx8yfDVPwuVe5MkPi6HoPjeHAAm4+u4HJpy
         nFxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hSq411+s9NdWoKtVDUAKy0Kf3U5pcLNuZimkjP4e+Hw=;
        fh=VVNe0eHoBDYSz4sydUoaLv16CqKDwfx8PPkCKQj7xP0=;
        b=FVldoxgWYuoEuHI9idgwYhuDyaaS3XFsbaQ4YmR4lQ/noFvoCFAhX5WG1YM6YiYJ5D
         1b7xgqLe2jHPQ+lScl4rFcLaMmqmy1TZ+AffXQHIOtMXM5X6Kkd6eFrWzx7vc+WhlFc6
         WVBIipxmBS5nyrEjB4yhw/Rp09p47ElJVILYCgM54nY3whu9Q+UIC8WR2C+KwXQ443UL
         DGqnXI7m6DffsVk4/dwadGX504KhLnNCDs2Nz1WtnSTzimFFvU+PvhSscBJ7dBfEHmRl
         owLn61YH/yftQdlY+zJwH0rtDFIeslgmqSxOZCSM5rVQxPJ3Mhu8lbEVOSR0hUZ+FtlM
         xGNg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794512121; x=1795116921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hSq411+s9NdWoKtVDUAKy0Kf3U5pcLNuZimkjP4e+Hw=;
        b=TOvkPnaMiidIptAqmx2zbHxBFlHMqub9g0awZPe8AApCcNpJI4EHLPHNn/Btko25bN
         yLD9q/OHcEcJXEliYbDkVyTch9+v9kpGdAyFgvsEHZfHq1c1vhkqBQ/e9hFBjt63swpc
         5X8ISVDqpZ+LwEejsfNpLmmA3+GCryC6QocmXY0KdF7iFkmnKxGykVQw7Ro5Tm+ONneg
         1Mja5JR791Ia5qx8inHr+7iGE/PGeHetcMCG7qdoKc529QyB0uHfQUtifQXjKpEtq1VD
         0Rfkb2hvBiEApezIco8HGFa383afvQlTVuDOMjLy0ao617zfk160mMrKMrRGab8DP1me
         ImuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794512121; x=1795116921;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSq411+s9NdWoKtVDUAKy0Kf3U5pcLNuZimkjP4e+Hw=;
        b=xJRR2MzEvk2sPpfMNoyEFth1ZUXCpnT1mF9BYb6eiemDqsXmqfXS7n7sMtk8O9jcoo
         xYpoWnx8GKRMkstC7dOeYAQ7Gyc2WUsTUj8eSweoxiaPAu/2NBNyjpi/R2ubJ6aV67eD
         tnRXEC3wuNhaJKzU1YXNE1GiqFsmeHHIMc9uKp9+moCRfK0O4KM8YXErAnN5Si+OhZ6T
         KYr1/S8aXDmUfk5NBuAirBgf+NXfVEpjcOdkC1eoowAyaxWBedVADV/RB668wL2yEQh/
         uwYrTfS6xqPwVQDAnCNAhPDdVtW5Gq7/phg6xKjqzrjK8NEiuYpp/YH4abu2CpKOJcTq
         adpg==
X-Forwarded-Encrypted: i=1; AL+hErGubWwggMY1MJ1URbyzWzDpboGmovhgPmZw+fmdoowf+7lqaL7nVQyk+83+Pz4A3RuZNd/9XxpCTs3QmuM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/oNbKHsXppAi1KyM5UKnm25gHRuVJ1qQoK09ebALQO9uaWai5N
	UbyQu+FXigBBlFzUir/UTkXESKE5YMKZu30A6i1UD6B6zSEZwt+W1MiLuMIMaWjyUvMZhiOnHN/
	uNtuZ73oJqLK98kOxuEX0w/hOqfL4Pyo=
X-Gm-Gg: AYBFou0s1HgsdignFg63O9uMiXf4yha9j6F9KOTPEct+4lcFDMvLbirS8To6EZTBTPu
	sfBzAhU7+ZkQ0Exe97t2ABN5BSCEOR3VvN5RUBzW+eaWyWqyaQnanihKrk0SXCTwdbznni6KdZD
	Dfz3r/emflD3slyeWAfV7vKlyCfZVVCBPK6UEPNjUy6G+oFwjzpbn8IROX18F8b8eNXtYKkppaS
	BMCGUyGoLW0IZo1uHzol0iJLAqZuHnkwa0cikwhTCp2Q+w0yBRNxF1D8aXgyh6uR+Y6GHhPr3i/
	PEZj+YPEfRWDCa3QSl/nVZLxwkvzjRUSMJN+kCx6AOh6y3qUuRVWrso3mUCy483S7UESVtTgoWB
	gka9cPfpBDic4MFAkWFM+IVXbnRYrwoDPaSDmDe5kUoxT3tj0MJlDITy5Nampg0WfJydJJQleBd
	dmUHkW2nZDcMJ2+b+ODRAP5cZwgaos0/WakCuxQw==
X-Received: by 2002:a05:620a:1b81:b0:93c:c405:3215 with SMTP id
 af79cd13be357-9494bbccd6dmr77956685a.44.1794512120789; Thu, 12 Nov 2026
 11:35:20 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029192032.1325629-1-thepacketgeek@gmail.com>
In-Reply-To: <20261029192032.1325629-1-thepacketgeek@gmail.com>
From: Matthew Wood <thepacketgeek@gmail.com>
Date: Thu, 12 Nov 2026 11:35:08 -0800
X-Gm-Features: AclHuK_BvMs_YVdGy0WUpg4okUuBQygcvvwgCF7Igbxb1UybigcTBxXa87y20ak
Message-ID: <CADvopvYQDLx81gDFNR8MAg9E010K3yJNEByAwawQHFahRYiXzA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] PCI/sysfs: Wait for config access lock in sysfs attributes
To: Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kbusch@kernel.org, 
	Alex Williamson <alex@shazbot.org>, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 12:20=E2=80=AFPM Matthew Wood <thepacketgeek@gmail.=
com> wrote:
>
> Many PCI sysfs attributes that read from config space are using kernel
> accessors that don't wait for pci_cfg_access_lock() holders before readin=
g:
>
> - serial_number
> - max_link_width
> - current_link_*
> - *_bus_number
>
> If userspace attempts to read from these attributes while config space is=
 not
> available (e.g. during a reset) there's no telling what values will be
> returned: All ones, zeros, or garbage.
>
> Looking at attribute addition history it seems like this was an oversight
> instead of a specific decision so this series tries to resolve the attrib=
utes
> above to match the sysfs attributes that do use user accessors: config & =
vpd.
>
> Patch 1 is a prerequisite for the rest of the series. The kernel
> accessors these attributes use today skip devices marked disconnected
> but the user accessors don't, so switching over alone would make the
> attributes start sending config reads to disconnected devices. Patch 1
> adds the same pci_dev_is_disconnected() check to the user read
> accessors.
>
> Note: That check also affects their existing callers. On a disconnected
> device, VPD reads and writes, VFIO config reads, and VFIO writes to
> PCI_COMMAND now fail with -ENODEV, rather than returning ~0 data or,
> for VPD writes, timing out with a "firmware bug" warning.
> pciconfig_read() fails with -EIO, and the sysfs "config" file and
> /proc/bus/pci still return ~0 data.
>
> Changes were successfully tested by continuously reading sysfs attributes
> while a reset was issued.
>
> Changes in v2:
>   - Patch 5: check DSN read errors in serial_number_show() and return
>     -EIO instead of an all-ones serial number
>   - Collected Reviewed-by from Keith Busch on patches 2-4
>
> v1: https://lore.kernel.org/linux-pci/20261025000836.58294-1-thepacketgee=
k@gmail.com/
>

Hi Bjorn,

Checking in to see if there are any concerns with this change or if
the premise makes sense?

Regards,
Matthew
