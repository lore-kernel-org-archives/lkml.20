Received: from mail-pj2-f7.google.com (mail-pj2-f7.google.com [74.125.227.135])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD8A41DE15
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 23:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.135
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791242880; cv=none; b=TE1h7jgIaCr/k3LqMco34M4Ir2XhxjmuUPaFJtTKrLXiUqJYwko34uv3EQ3IZmnNKE1IpNH8R6ep81JxK+JmgjOka5Ey4+ZMlXuXqVDnj5z/Pf6vk0GuKFJh7DagnfPiomymika87+wzb5iao2oM9yJR6sramfnQeT6YlXFKKGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791242880; c=relaxed/simple;
	bh=6CPiYuuTXPIWdsAfIiOCV03Lg6iemO+IJl3GZDw3XnE=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RPFIo9GFzA8unpdcFqCYhIoG+WnIWUrEGLeQz3FvP83+g7pzJz4B35kBXwQekX1ogjQhzTpH/eDL8oh0b0iVrfPj1YiSA4K/ADufuHKaxNw91vdQl1/Kq2onXDfbewYrB8ho2sGMo/nkbGK+QXhsyKEXjYRp9xWdTlbzxnJc9u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dVhUBfBp; arc=none smtp.client-ip=74.125.227.135
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVhUBfBp"
Received: by mail-pj2-f7.google.com with SMTP id 98e67ed59e1d1-39e501442e2so807774a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 16:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791242878; x=1791847678; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=B/zPhhqSzZgiqvCy2v2R07ljbiJnf/kj+cRVGXz4l2o=;
        b=dVhUBfBpQHFBCdRxCHVQyN/oEX+e9kKMtc6mMLiEovOZjkaA3dP6WT7ELYFfz+rIcG
         LbEUJ5g5hJj50kCLma91uM/oidP9T5hyWPQ8PBX6w8U7Hj2RQfTEh4pJ0l1qHYT/Favj
         J0yz99S5Imjg9n9D1VDfkpzcqV9sMhKRz0QXdE0QS3x2jdtBenxDa2pCYW+NiOKUctUS
         5WyT++KjqO+U8LMOBE6NvTI7EPaE0sCkhhgBl64lbb/KEkc1Pf0Ckh+Apnk2NYj0lC0n
         Ncu82QhKEHa7hMtz7U8Ib3or9buvzo1QZKM12KRV93V7Y2hEqsWWEMKKwQZfLYFEQxYy
         gNUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791242878; x=1791847678;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B/zPhhqSzZgiqvCy2v2R07ljbiJnf/kj+cRVGXz4l2o=;
        b=03wC5OvuCT4YmBFvkbIfAHx+6lYFncMturdtZGHszVQ5WeOk1Z3wTlwnj36pJXYorc
         6gB/AtmeoDc+VuVOez/08l8tmkbtR1W82mQhZ0lsQH1JnduiZvdC9DmGmsrR87ZTcx7L
         JjCeg6QpDa00BzSBYX9tZS82SS0jm/veZXjbhQhVqvkBdpag3etYrn27gMuAYQX1mrMe
         qNanffp+uwS9pru9x7QadFw6gA+znIHLh24guQNgbUJGX3kRVnLxi1DigtxRfHI1Qi9i
         L7OOHCOOSuSbEg5aNM/oBl6y4RaWB/5ZwwkgoIcs9w9zFAx3vSU8EJkL2BAZX9erFfe4
         GfWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxgcP+Uu2/DymZwWYuFGXLdg1FJpsyJ9I9JPNJnzGkXdfgKkDFVJJI5I7HzHV6dCAsezsVbiNBliezv3J4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVF4deXBeH+PQdy/zflJdmzL6ocIsLxXE5y5sMB5lpUbqAQVt8
	R8Wolmz9cdLyrpHGLkHtNneXp8+R2gBRvg0yn/m09qadZKAUcdlbg6w4
X-Gm-Gg: AYBFou3TkngLEW8l2eOoilNFWqjNZT8Df4rJsIzkwpVfEruiBDgTcmSZTixw4CgoDoj
	OEkSmkGOq19/fqL8pJjaq4p6D2gHY/eMXWankCvLkJ9pL5OOFaYthElWHyisDjukrLBhXOaRow7
	p3HfiVHCn5n5JwQDQmwC2qhFAXWZQZq7Ypomm1wF7rSmF4NKgDDKcIG2nGD/HhK4u2BNUOhu+2r
	ZlUTrE6q4v3ZvzfvKrZny7XM0kFYkOAKHRcPdPeiM47Od3Lm2KnWk+sB7DDElMT8bMZqtAsQxtg
	SeXuvCPkUT8UsPkl+lOUMea+bpN2jjw3x2vqPmaCmMnAUUuhOOYFCy+CoUuWC2B3YL6wQjfbshe
	u9JzTLTRgLG8/8dCwwfLjJ5DLSY8K8G5AF97HrMyqpTd1riHcP+Ec+u4AU1I/IkuHaa/vz4E8xA
	pdtBpZX2jPq6az8AxW4tokBZrgdznCBUWFUsZlGfBI4X8h7560VTctOFBiILgEAkRvTRpaS9oT/
	rg8gVLV
X-Received: by 2002:a17:90b:5144:b0:3a0:a055:1759 with SMTP id 98e67ed59e1d1-3a6cecaa898mr10080837a91.40.1791242878358;
        Mon, 05 Oct 2026 16:27:58 -0700 (PDT)
Received: from ehlo.thunderbird.net ([168.138.199.194])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dce36d07sm8230776a91.1.2026.10.05.16.27.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 16:27:57 -0700 (PDT)
Date: Tue, 06 Oct 2026 07:27:52 +0800
From: Coia Prant <coiaprant@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>, Heiko Stuebner <heiko@sntech.de>
CC: Sebastian Reichel <sebastian.reichel@collabora.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_pmdomain=3A_rockchip=3A_mar?=
 =?US-ASCII?Q?k_PD=5FPIPE_as_active_wakeup_on_RK3568?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20260925041751.495818-1-coiaprant@gmail.com>
References: <20260925041751.495818-1-coiaprant@gmail.com>
Message-ID: <382B43FA-B225-41C5-80B6-944D9D2802CF@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On September 25, 2026 12:17:51 PM GMT+08:00, Coia Prant <coiaprant@gmail=2E=
com> wrote:
>The PD_PIPE power domain on RK3568 hosts the XPCS, the PCIe
>controllers and the SATA controllers=2E  All of them can act as
>wakeup sources for the system:
>
>  - the XPCS for MAC WoL, through the SGMII link
>  - the PCIe controllers for PME#
>  - the SATA controllers for hotplug wake
>
>The domain is registered with active_wakeup =3D false, so genpd powers
>it down during system suspend even when a consumer is on the wakeup
>path=2E  That kills the XPCS and the SerDes, which breaks MAC WoL on
>RK3568 SGMII boards, and it also powers down the PCIe and SATA
>controllers while their drivers still expect the link to be alive=2E
>
>Mark PD_PIPE as active_wakeup so that genpd honours the wakeup path
>of its consumers=2E  Consumers that call device_set_wakeup_path() keep
>the domain powered; consumers that do not mark themselves as wakeup
>sources are unaffected and the domain is still powered down when
>nothing needs it=2E
>
>Several other Rockchip SoCs already mark their PCIe and USB power
>domains as active wakeup, for example RK3588's pcie and usb domains
>and RK3576's usb domain=2E  PD_PIPE hosts the same kind of
>wakeup-capable controllers on RK3568, so this follows the same
>pattern=2E
>
>Signed-off-by: Coia Prant <coiaprant@gmail=2Ecom>
>---
> drivers/pmdomain/rockchip/pm-domains=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/pmdomain/rockchip/pm-domains=2Ec b/drivers/pmdomain/=
rockchip/pm-domains=2Ec
>index ba66ae719428=2E=2E16ef0a235f0f 100644
>--- a/drivers/pmdomain/rockchip/pm-domains=2Ec
>+++ b/drivers/pmdomain/rockchip/pm-domains=2Ec
>@@ -1296,7 +1296,7 @@ static const struct rockchip_domain_info rk3568_pm_=
domains[] =3D {
> 	[RK3568_PD_VPU]		=3D DOMAIN_RK3568("vpu",  BIT(2), BIT(6),  false, fals=
e),
> 	[RK3568_PD_RKVDEC]	=3D DOMAIN_RK3568("vdec", BIT(4), BIT(8),  false, fa=
lse),
> 	[RK3568_PD_RKVENC]	=3D DOMAIN_RK3568("venc", BIT(3), BIT(7),  false, fa=
lse),
>-	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), false, fals=
e),
>+	[RK3568_PD_PIPE]	=3D DOMAIN_RK3568("pipe", BIT(8), BIT(11), true, false=
),
> };
>=20
> static const struct rockchip_domain_info rk3576_pm_domains[] =3D {

Hi,

Gentle ping on this patch=2E It was sent on Sep 25, and linux-pm Patchwork=
 shows it
as "Handled Elsewhere", but I can't find it merged in linux-pm,
linux-rockchip, linux-next or mainline, and I haven't received any review
feedback=2E

Thanks,
Coia
