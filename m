Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E431D485508
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331174; cv=none; b=Z+WixtSE9EMkpKDE2bokAYi8rztYawfRsCdGs71DdKtalLhYFC0p9t/AL67T0iIjjqhyQWFDOPd/JKwGu60btvbFLBkqx7ih2lRaavDgt/2s65QV7umzsAom9tafcjVssxPrMxPfXNaAorlhO+VW9BHYppYk2sMxAKk98u6VDlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331174; c=relaxed/simple;
	bh=CC567qKsUfgoyKrNNflLFTpJYo6DoPTZxNhRpHvgoRk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eEiKChkODmSdablgMBTKZsCksofY0IrtXzUxR9p+75jKlcBcFgUgnsefCgLAcGdRsO6Bk4kqldmCP989MqmFLWg+DG6YBT2yN8YvnmJxIOJKSjrnE1TaeHtPCICtxHgjfz0Qr3dFc/yB8fmrPXJPlt91aYaS8UPPwys1Wjsr1pc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OefcyB8Q; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OefcyB8Q"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso9369115e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331171; x=1790935971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3OL5IUnkxezEvQtx7bFDxp48e1R0t/qQajh7OCSGPQU=;
        b=OefcyB8QiaHxDvcZSU+BVwit3PEQWsRpQUoyyD4rw1yLI4gBKaoQhNmQBrYaK1ZnLu
         zCFwMSaGEc+985PDrnLJTjDGrO3T5mzzyDV/iUZCDkxcHwHO93MZzz3/77nB4Q1Sj+DL
         NoJccgbKnQnVOshykvFnRjGO0piZR3SqH9lby2/fBE2npqFEjKbL9DRK1s1FxZUDIENW
         ieIz5HeuJC+j9mEvWy+ka4x/pyXL8LZhW7fBqYIGAgU/5BTc+O3mvbkoY7elXCc8tUQW
         hMKeP18kGVs8uI5JC3BOxqI1iX4zRb07ZOS49rQdvuUImUeJoYlU6uTbijhrjrof9nGB
         oeMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331171; x=1790935971;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3OL5IUnkxezEvQtx7bFDxp48e1R0t/qQajh7OCSGPQU=;
        b=NvSpw66r/GCXTD7k0dAZavSL+xml0Nze0YeihugOSsEaS5/l0h0X3YjaN1scod3D6A
         eJQ0CXeCyacTuh6MSnLJSaiIyGFHDxr9TwLkYuRaiPXRF8JZtkrzCFcZgxcvvjCpQMdF
         LdPmRpuYHYkQsDSewfVKtz2S2FMvtXrkvXOgbPKxSDXyC+3ooHZk+PmlKOAmTZ7+YFaw
         eOcXQGgLbdGQg7AUcJyKpuqi2I/OCgtQ8WVFClB3PwlM+pFN4YpiOtBKlAnctgmMxIkL
         yasfYcAGiiV0MzAmpCCICbS79rBPfYyOPOJYKUUxF/YyI1cEYbt6zw6vJ69Kjj8I3Ecl
         VI4g==
X-Forwarded-Encrypted: i=1; AKwUvBwCS2Hye+OZTQUbOcrzw1ZDGsn692N15i7NZpRIAKbYl076sQI6IP8KX14ByXY3cCP9l7maumDklhzXFB0=@vger.kernel.org
X-Gm-Message-State: AFuF++kac/Xyr4rX4tqwlxik3kY11WrqGTav7asmrzxnPw8rUlgUbyxB
	OmG/5ev9vCGukJK7CuACh52e8ddDwp/5S2TNaaIe49Nkmc9mlHykdJI1
X-Gm-Gg: AYBFou1KBVK6+LxFqyQYu3GxwtavzGVy5HMoBWGQPgQRQ5LllpXqSqwBXXKU/v+sAxy
	wzC78yM1YgdKUW2nPCf5OLJ48Ao8ksqXtk53m2uD2ed7aw6cHaEGrUOi3vVmnx/0PZfai2O3xpr
	vmm0rpWXjlmvwh0iFB9+dRsmnpklji4f5p9vC5k4wcsv5078jo6Cj9y+QQqqKC5gLuizpH47Pfb
	sjowOWnLpNwOBDjT9LwFI6x+4DjZ8Tuq5OobxCAMv/8h9LHVHXCuo/TZz701RkYhaixKulvdB+A
	XwHaFniepJTw3PVhEqR1bTcqEEeMxLrJE0UI2ZN4XIOY7tamOub0FOoxCksCbusVWorh+ReBmGq
	J4x+YG9kFlqblp6T7umY87WV+0r4zh7Lsht7HlQc9oTxp7eiIHBneqLeU4yWr37LEsZPm8qM+zK
	2P0+ozX7ZIdOcfjf8L4LSsZkQlafoaj6gVBVupW+h0WtJzCaM++HeaZZHyg2vVCkKiWzcb/jCl/
	wuu239yCtoviklFsbNV
X-Received: by 2002:a05:600c:4705:b0:49f:dde2:3906 with SMTP id 5b1f17b1804b1-49fe66d95f2mr92712495e9.15.1790331171003;
        Fri, 25 Sep 2026 03:12:51 -0700 (PDT)
Received: from foxbook (bez152.neoplus.adsl.tpnet.pl. [83.28.37.152])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ff06bdef2sm48473885e9.11.2026.09.25.03.12.49
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Fri, 25 Sep 2026 03:12:50 -0700 (PDT)
Date: Fri, 25 Sep 2026 12:12:40 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Kean Ren <rh_king@163.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Mathias Nyman
 <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
 Griffin Kroah-Hartman <griffin@kroah.com>, Kuen-Han Tsai
 <khtsai@google.com>, Kees Cook <kees@kernel.org>, Nikhil Solanke
 <nikhilsolanke5@gmail.com>, Thorsten Blum <blum@kernel.org>
Subject: Re: [PATCH 2/2] xhci: fix ASM3242 port speed report for Gen 2x2
 links after cold boot
Message-ID: <20260925121240.2bda9984.michal.pecio@gmail.com>
In-Reply-To: <20260920025308.2358862-3-rh_king@163.com>
References: <20260920025308.2358862-1-rh_king@163.com>
	<20260920025308.2358862-3-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Sep 2026 10:52:43 +0800, Kean Ren wrote:
> The ASMedia ASM3242 (1b21:3242) reports the SuperSpeed speed ID (4) in
> PORTSC[13:10], together with two active lanes, for a link that is
> actually running at Gen 2x2 after a cold boot.
> xhci_get_ext_port_status() copies that ID into dwExtPortStatus, so the
> USB core matches SSID 4 (whose LP is SuperSpeed, not SuperSpeedPlus),
> returns USB_SSP_GEN_UNKNOWN and falls back to USB_SPEED_SUPER:
> 
>   $ lsusb -t
>       |__ Port 001: Dev 002, If 0, Class=Mass Storage, Driver=uas, 5000M/x2
>   $ cat /sys/bus/usb/devices/2-1/speed
>   5000
> 
> while the link really runs at 20 Gbps:
> 
>   GetPortStatus(HUB_EXT_PORT_STATUS) -> dwExtPortStatus = 0x00001144
>       (RX/TX speed id 4, RX/TX lanes 2)     after a cold boot
>   GetPortStatus(HUB_EXT_PORT_STATUS) -> dwExtPortStatus = 0x00001177
>       (RX/TX speed id 7, RX/TX lanes 2)     after an S3 resume
> 
>   O_DIRECT throughput, cross-checked with /proc/diskstats:
>       1.49 - 1.60 GB/s (11.9 - 12.8 Gbps)  in the "5000M" state
>       1.63 - 1.83 GB/s (13.0 - 14.7 Gbps)  in the "20000M" state
> 
> Both exceed the physical ceiling of a 10 Gbps link (~1.25 GB/s), so the
> link is Gen 2x2 in both states and only the controller's report is
> wrong.  Only an S3 suspend/resume makes the controller report speed ID
> 7; a device re-plug, a port disable/enable, an xhci_hcd unbind/bind, a
> PCI function reset and a PCI remove+rescan all leave the wrong value in
> place.

Out of curiosity, does it mean that after one suspend cycle the
controller begins to work normally and reports correct speed for
new devices too, or only for those present during resume?

> Add XHCI_ASM3242_SPEED_QUIRK and, when it is set, report the Gen 2x2
> speed ID when the controller reports SuperSpeed with two active lanes.
> 
> Reported-by: Kean Ren <rh_king@163.com>
> Link: https://lore.kernel.org/linux-usb/<your-report-message-id>/
> Signed-off-by: Kean Ren <rh_king@163.com>
> ---
>  drivers/usb/host/xhci-hub.c | 17 +++++++++++++++--
>  drivers/usb/host/xhci-pci.c |  4 ++++
>  drivers/usb/host/xhci.h     |  1 +
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 470bafe1802b..ef2b35b31492 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -1001,13 +1001,26 @@ static int xhci_handle_usb2_port_link_resume(struct xhci_port *port,
>  	return 0;
>  }
>  
> -static u32 xhci_get_ext_port_status(u32 portsc, u32 port_li)
> +static u32 xhci_get_ext_port_status(struct xhci_hcd *xhci, u32 portsc,
> +				    u32 port_li)
>  {
>  	u32 ext_stat = 0;
>  	int speed_id;
>  
>  	/* only support rx and tx lane counts of 1 in usb3.1 spec */
>  	speed_id = DEV_PORT_SPEED(portsc);
> +
> +	/*
> +	 * The ASM3242 reports the SuperSpeed speed ID (4) together with two
> +	 * active lanes for a link that is actually running at Gen 2x2 after a
> +	 * cold boot.  Reporting that ID makes the USB core fall back to
> +	 * USB_SPEED_SUPER (5000 Mbps) although the link runs at 20 Gbps, so
> +	 * report the Gen 2x2 speed ID (7) instead.
> +	 */
> +	if ((xhci->quirks & XHCI_ASM3242_SPEED_QUIRK) && speed_id == 4 &&
> +	    PORT_RX_LANES(port_li) && PORT_TX_LANES(port_li))
> +		speed_id = 7;

Is there any way to distinguish 2x2 from 1x2 here? If 1x2 gets the same
bogus Speed ID as 2x2, this will incorrectly report it as 2x2, right?

> +
>  	ext_stat |= speed_id;		/* bits 3:0, RX speed id */
>  	ext_stat |= speed_id << 4;	/* bits 7:4, TX speed id */
>  
> @@ -1265,7 +1278,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
>  				break;
>  			}
>  			port_li = readl(&port->port_reg->portli);
> -			status = xhci_get_ext_port_status(portsc, port_li);
> +			status = xhci_get_ext_port_status(xhci, portsc, port_li);
>  			put_unaligned_le32(status, &buf[4]);
>  		}
>  		break;
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index a8889081ae82..6219151d9eb0 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -471,6 +471,10 @@ static void xhci_pci_quirks(struct device *dev, struct xhci_hcd *xhci)
>  	     pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI))
>  		xhci->quirks |= XHCI_NO_64BIT_SUPPORT;
>  
> +	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
> +	    pdev->device == PCI_DEVICE_ID_ASMEDIA_3242_XHCI)
> +		xhci->quirks |= XHCI_ASM3242_SPEED_QUIRK;
> +
>  	if (pdev->vendor == PCI_VENDOR_ID_ASMEDIA &&
>  		pdev->device == PCI_DEVICE_ID_ASMEDIA_1042A_XHCI)
>  		xhci->quirks |= XHCI_ASMEDIA_MODIFY_FLOWCONTROL;
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index c7bfa7f028d3..77fab2f29693 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1647,6 +1647,7 @@ struct xhci_hcd {
>  #define XHCI_CDNS_SCTX_QUIRK	BIT_ULL(48)
>  #define XHCI_ETRON_HOST	BIT_ULL(49)
>  #define XHCI_LIMIT_ENDPOINT_INTERVAL_9 BIT_ULL(50)
> +#define XHCI_ASM3242_SPEED_QUIRK	BIT_ULL(51)
>  
>  	unsigned int		num_active_eps;
>  	unsigned int		limit_active_eps;
> 
