Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794648517;
	b=XLPg8LXAGgFQyxogVZ8nO+vDlDf69XKdZB9rF46zO9xpa3MgDndoPd0cMBEVEa3iwto2
	 far4uH4aPWYQXyzBKlsY/Z8ZTf+SFF7cpPAbTeV+X1z7xJgZ26qo/ueF3c8HZme+8YrHr
	 QrbhGFk4b1aZsIF6AACBqfu3xOW0kB2p76nneK6lFRi41n1elIJ5aUFUdmEZuTtGsR8vZ
	 ef58ym1FnXOcHCzhLUT4z6WbiuBUnZJ+eWyaaxR7VUeCdsh4dY/egscqtcTRWTwiHJ2OR
	 smvtJNpLHq0C5eZ1zGbU9X9LvK8XF5mRrAOkrdYc+QKxJ4pvzZUM+diO56KyA265fNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794648517;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=zAOIoB8zMIJy0PccEa0YoY3NuaI3ziWGSSLeTtPskww=;
	b=Yj5mWFyTEgVd/rJb7jSSXzw6z1Ax40Lz+ITuHIn9V8K59S2MAvIiobV+Z+CLwHkTt0uD
	 z70xS8llFsT1FEiQifcrZBWQFfHK5XP5tMFoypv83W0CfM72ip77LLCLwGtuFawTNbPi8
	 aB8WkjIBKNMQ0WSxOzWuJ2HHgiCsuT8YIz4WA6FkLDw676oIpgbESEBfe3odZxGNxfU3C
	 FkMd2Cn5j/sazXF7ewwLqZHoNXjBEgy1R89tubUb3md6x+lF/B/fxGYDVmtlm0ImXCc+b
	 M+nxjzguVTK8C0w0tprYADVD+OZL8sAXOF6j/pZGCuG4/CXDCrYvo/41QhraEit+iVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIRGY3WK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BDB60A260E;
	Sat, 14 Nov 2026 09:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZIRGY3WK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BC471F000C5;
	Sat, 14 Nov 2026 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794648517;
	bh=zAOIoB8zMIJy0PccEa0YoY3NuaI3ziWGSSLeTtPskww=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ZIRGY3WKwZDiViauRw5dTBHYPn+R99e559M4qQUeQzOIkEFIiI0BfCVtQTm+l1p1o
	 u59o00oPdK1m+4OoL5F09QIke1iz74sbw7J6OfBp77Z8CNlTAbU1eRP/QPzvNO6ZFV
	 c8lQnwQ7vToKFjCCTEQgdAjObBCblPmgSoi01j04f5gHYQTeMYsDMBSnJMCbFdPSaH
	 oFBeBD2uDIMas9+5emOyImbMtB+q6A/+nNnHsl11N+sMfCk1dA8mTUDgkXS3OoXUoQ
	 ktxpTwiihAlqdRNB0epKqb33DgxHA4EXjnkCZAUcaWZ/MaKCkKsOg8v4GFcm5GQsTG
	 tvt1Uzvxnbhig==
Subject: Re: [PATCH net-next v8 07/11] r8152: split RTL_VER_17 into QFN68 and
 QFN100 package variants
From: netdev-bot+sashiko@kernel.org
To: hsu.chih.kai@realtek.com
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
 nic_swsd@realtek.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 edumazet@google.com, bjorn@mork.no, pabeni@redhat.com, andrew+netdev@lunn.ch,
 mail@birger-koblitz.de
Date: Sat, 14 Nov 2026 09:28:36 +0000
Message-ID: <179464851600.2199510.15487366405068056998@kernel.org>
In-Reply-To: <20261110032416.16968-8-nic_swsd@realtek.com>
References: <20261110032416.16968-8-nic_swsd@realtek.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] In drivers/net/usb/r8152.c, __rtl_get_hw_ver() no longer maps
  chip ID 0x2020 (RTL8159) straight to a supported version.

--

r8152: split RTL_VER_17 into QFN68 and QFN100 package variants

This commit splits RTL_VER_17 into RTL_VER_17_QFN68 and RTL_VER_17_QFN100.
When the chip ID is 0x2020, a new helper, __rtl_get_pkg_det(), reads the
PLA_PKG_DET register to detect the package, and unrecognised values fall
back to RTL_VER_UNKNOWN. r8157_init() also gains a QFN68-only u2phy backup
restore write.

> diff --git a/drivers/net/usb/r8152.c b/drivers/net/usb/r8152.c
> index a1c2e1e08b161..b6f252722a5eb 100644
> --- a/drivers/net/usb/r8152.c
> +++ b/drivers/net/usb/r8152.c

[ ... ]

> @@ -10227,9 +10254,38 @@ static int rtl_fw_init(struct r8152 *tp)
>  	return 0;
>  }
>  
> +static u32 __rtl_get_pkg_det(struct usb_device *udev)
> +{
> +	u32 pkg_det = 0;
> +	__le32 *tmp;
> +	int ret, i;
> +
> +	tmp = kmalloc_obj(*tmp);
> +	if (!tmp)
> +		return 0;
> +
> +	for (i = 0, ret = 0; i < 3 && ret != 4; i++)
> +		ret = usb_control_msg(udev, usb_rcvctrlpipe(udev, 0),
> +				      RTL8152_REQ_GET_REGS, RTL8152_REQT_READ,
> +				      PLA_PKG_DET, MCU_TYPE_PLA, tmp,
> +				      sizeof(*tmp), USB_CTRL_GET_TIMEOUT);
> +
> +	if (ret == sizeof(*tmp)) {
> +		if (i != 1)
> +			dev_warn(&udev->dev,
> +				 "Needed %d retries to read package\n", i - 1);
> +
> +		pkg_det = __le32_to_cpu(*tmp) & PKG_MASK;
> +	}
> +
> +	kfree(tmp);
> +	return pkg_det;
> +}
> +

[ ... ]

> @@ -10312,7 +10368,16 @@ static u8 __rtl_get_hw_ver(struct usb_device *udev)
>  		version = RTL_VER_16;
>  		break;
>  	case 0x2020:
> -		version = RTL_VER_17;
> +		pkg_det = __rtl_get_pkg_det(udev);
> +		if (pkg_det == 0x1e || pkg_det == 0x1c) {
> +			version = RTL_VER_17_QFN68;
> +		} else if (pkg_det == 0x18 || pkg_det == 0x1a) {
> +			version = RTL_VER_17_QFN100;
> +		} else {
> +			version = RTL_VER_UNKNOWN;
> +			dev_info(&udev->dev, "Unknown package 0x%04x\n",
> +				 pkg_det);
> +		}

[Severity: Low]
If the PLA_PKG_DET read fails, does a 0x2020 chip that was handled as
RTL_VER_17 before this patch now become RTL_VER_UNKNOWN?

__rtl_get_pkg_det() returns 0 in three cases: kmalloc_obj() fails, all
three usb_control_msg() attempts fail, or the reply is short. A 0 here
takes the else branch. The log then says "Unknown package 0x0000" instead
of reporting a read error.

With RTL_VER_UNKNOWN, rtl8152_cfgselector_choose_configuration() returns
early and never selects the vendor configuration:

    if (__rtl_get_hw_ver(udev) == RTL_VER_UNKNOWN)
        return -ENODEV;

rtl8153_ecm_probe() then binds the device, because rtl8152_get_version()
now returns 0.

The read might also succeed in the cfgselector and fail later in
rtl8152_probe(). In that case the device is already in vendor mode and no
driver binds to it.

Apart from the QFN68-only 0xb99c write, RTL_VER_17_QFN100 behaves exactly
like the old RTL_VER_17. Could a read failure fall back to QFN100? Or could
it at least be reported separately from an unrecognised package value?

The commit message describes the RTL_VER_UNKNOWN fallback only for
unrecognised package values, not for I/O or allocation failures.

>  		break;
>  	default:
>  		version = RTL_VER_UNKNOWN;

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261110032416.16968-1-nic_swsd%40realtek.com
