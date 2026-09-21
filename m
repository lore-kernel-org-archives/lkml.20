Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891E851AEDD;
	Mon, 21 Sep 2026 22:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790028667; cv=none; b=IBNeLMC0A4caCAsS6d8YDRgXlv7phFKKxg1+QJLqC/OQGl5ryja3MZRWStw+1yU52KPEinLn/UJ5dh8aoiqxr+rqz5NKIt4qrDHZHkIYrWSNX3jT6P9kvzOgDLebGQYtZoFTCvBAuk3NGPK8T0s3o4gtuUC2oTXpiK/r32cHi0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790028667; c=relaxed/simple;
	bh=ahvApTuV93FnF7RlCR5yIQ7UANPnWf6Mi3CgsRYjUAA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=klNWEjdV5JIHQrYiB3c/6o/YLKrITog/qntPfvjCeOv59uRnTOmGrvUi9PH2SSuCvv0z5eNKAsaqXlOA+eYuQe8pBVi9mMugWMvEhVUXAGwGJ+33P/Vrwyq6IzRYITnCZkRf9YHV6SzN8bQpPTiluJsRLYurkw48y2fB+Ooom8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KiShhQDr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KiShhQDr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790028657; x=1821564657;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=ahvApTuV93FnF7RlCR5yIQ7UANPnWf6Mi3CgsRYjUAA=;
  b=KiShhQDrEvBWxC7HsEzPFQ1VRHFkX5ABYx+XmL8EHLgLdX0Ig2vI4qYj
   GHVqynA+bDGPOX1J882krxTuSlcC+K1BxcgDtOJzUyiObtoElRc+DN6HI
   JyS82nuznO8EiYPF/yctbuA6lMpfZhCGaGotCZdGr30ogUTFRbnDdWPtC
   v6xcO4Z/Z6BpU+Nc2drNf5mS2bLFxyhGz6/RqWL70azINoXmD/pjfUUvw
   k//rtY8WQQfc1aGQX8YjEbgyWCvf5eV1znZYXIiQPeZVR6xZ2d3ea6BPv
   yb+Paf2x0o8aMsmmznZdlbP5lK7YKdqH1MypEa5U46YdWWtVXrMWEG+Mq
   Q==;
X-CSE-ConnectionGUID: s+NDD+wZTJSQcS7gLJ9tnQ==
X-CSE-MsgGUID: URi8DdzURIeSB579hx4GpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="90702320"
X-IronPort-AV: E=Sophos;i="6.27,115,1787036400"; 
   d="scan'208";a="90702320"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 15:10:53 -0700
X-CSE-ConnectionGUID: 7IERfhlGR2G5paaxUJA6iA==
X-CSE-MsgGUID: eYn6C2dCRESg/jcyOaTySw==
X-ExtLoop1: 1
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.175]) ([10.245.244.175])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2026 15:10:51 -0700
Message-ID: <9c0f7132-995e-464c-b9f1-b6f240af5abb@linux.intel.com>
Date: Tue, 22 Sep 2026 01:10:48 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] usb: xhci: Allow custom op for
 usb_link_tunnel_mode reporting
To: Konrad Dybcio <konradybcio@kernel.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 usb4-upstream@oss.qualcomm.com,
 Raghavendra Thoorpu <rthoorpu@qti.qualcomm.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Sven Peter <sven@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260901-topic-dwc3_tunneling_state-v3-0-22fdced8de55@oss.qualcomm.com>
 <20260901-topic-dwc3_tunneling_state-v3-3-22fdced8de55@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20260901-topic-dwc3_tunneling_state-v3-3-22fdced8de55@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 13:05, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> The Thunderbolt framework relies on the USB core to create device links
> for tunneled ports, so that the USB3 controller is only kept
> runtime-resumed for the duration of the tunneling.
> 
> Currently, retrieving that information is only possibe on Intel XHCI
> hosts, through a vendor-specific capability. Extend xhci-plat to allow
> plumbing a custom one.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/usb/host/xhci-hub.c  | 13 +++++++++----
>   drivers/usb/host/xhci-plat.c |  2 ++
>   drivers/usb/host/xhci-plat.h |  1 +
>   drivers/usb/host/xhci.c      |  3 ++-
>   drivers/usb/host/xhci.h      |  5 ++++-
>   5 files changed, 18 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
> index 80f07bd5081d..c585e4d02d84 100644
> --- a/drivers/usb/host/xhci-hub.c
> +++ b/drivers/usb/host/xhci-hub.c
> @@ -749,7 +749,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>   }
>   
>   /**
> - * xhci_port_is_tunneled() - Check if USB3 connection is tunneled over USB4
> + * xhci_port_tunnel_mode() - Check if USB3 connection is tunneled over USB4
>    * @xhci: xhci host controller
>    * @port: USB3 port to be checked.
>    *
> @@ -763,7 +763,7 @@ static int xhci_exit_test_mode(struct xhci_hcd *xhci)
>    * detecting USB3 over USB4 tunnels. USB_LINK_NATIVE or USB_LINK_TUNNELED
>    * otherwise.
>    */
> -enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
> +enum usb_link_tunnel_mode xhci_port_tunnel_mode(struct xhci_hcd *xhci,
>   						struct xhci_port *port)
>   {
>   	struct usb_hcd *hcd;
> @@ -782,8 +782,13 @@ enum usb_link_tunnel_mode xhci_port_is_tunneled(struct xhci_hcd *xhci,
>   	/* Fall back to the legacy Intel-specific ext_cap */
>   	hcd = xhci_to_hcd(xhci);
>   	if (!dev_is_pci(hcd->self.controller) ||
> -	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL)
> -		return USB_LINK_UNKNOWN;
> +	    to_pci_dev(hcd->self.controller)->vendor != PCI_VENDOR_ID_INTEL) {
> +		/* Last chance - if the controller has a custom tunnel_mode op, try that */
> +		if (xhci->tunnel_mode)
> +			return xhci->tunnel_mode(xhci_to_hcd(xhci), port->hcd_portnum);
> +		else
> +			return USB_LINK_UNKNOWN;
> +	}
>   
>   	base = &xhci->cap_regs->hc_capbase;
>   	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index 6fd595f81a30..c19bc5d7a7b5 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -244,6 +244,8 @@ int xhci_plat_probe(struct platform_device *pdev, struct device *sysdev, const s
>   		priv = hcd_to_xhci_priv(hcd);
>   		/* Just copy data for now */
>   		*priv = *priv_match;
> +
> +		xhci->tunnel_mode = priv->tunnel_mode;
>   	}
>   
>   	device_set_wakeup_capable(&pdev->dev, true);
> diff --git a/drivers/usb/host/xhci-plat.h b/drivers/usb/host/xhci-plat.h
> index 00751d851831..c5042766a486 100644
> --- a/drivers/usb/host/xhci-plat.h
> +++ b/drivers/usb/host/xhci-plat.h
> @@ -22,6 +22,7 @@ struct xhci_plat_priv {
>   	int (*suspend_quirk)(struct usb_hcd *);
>   	int (*resume_quirk)(struct usb_hcd *);
>   	int (*post_resume_quirk)(struct usb_hcd *);
> +	enum usb_link_tunnel_mode (*tunnel_mode)(struct usb_hcd *hcd, int portnum);
>   };
>   
>   #define hcd_to_xhci_priv(h) ((struct xhci_plat_priv *)hcd_to_xhci(h)->priv)
> diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
> index 5fb78613a993..a7e3c46937fa 100644
> --- a/drivers/usb/host/xhci.c
> +++ b/drivers/usb/host/xhci.c
> @@ -4762,7 +4762,8 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
>   	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
>   		port = xhci->usb3_rhub.ports[udev->portnum - 1];
>   
> -		udev->tunnel_mode = xhci_port_is_tunneled(xhci, port);
> +		udev->tunnel_mode = xhci_port_tunnel_mode(xhci, port);
> +
>   		if (udev->tunnel_mode == USB_LINK_UNKNOWN)
>   			dev_dbg(&udev->dev, "link tunnel state unknown\n");
>   		else if (udev->tunnel_mode == USB_LINK_TUNNELED)
> diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
> index 480fcbac4525..2b5c0b304c6b 100644
> --- a/drivers/usb/host/xhci.h
> +++ b/drivers/usb/host/xhci.h
> @@ -1675,6 +1675,9 @@ struct xhci_hcd {
>   	struct list_head	regset_list;
>   
>   	void			*dbc;
> +
> +	enum usb_link_tunnel_mode (*tunnel_mode)(struct usb_hcd *hcd, int portnum);
> +

I don't think we should add another function pointer here.

I think it makes more sense that pci and platform driver override hc_driver .update_device.

The PCI override side would handle the intel parts, the platform override the dwc3 case,
and the generic part would check the new PORTSC.TM bit

PCI and generic parts would look something like this: (untested)

diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
index a8889081ae82..ad7571aeffc4 100644
--- a/drivers/usb/host/xhci-pci.c
+++ b/drivers/usb/host/xhci-pci.c
@@ -103,11 +103,13 @@ static int xhci_pci_setup(struct usb_hcd *hcd);
  static int xhci_pci_run(struct usb_hcd *hcd);
  static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
  				      struct usb_tt *tt, gfp_t mem_flags);
+static int xhci_pci_update_device(struct usb_hcd *hcd, struct usb_device *udev);
  
  static const struct xhci_driver_overrides xhci_pci_overrides __initconst = {
  	.reset = xhci_pci_setup,
  	.start = xhci_pci_run,
  	.update_hub_device = xhci_pci_update_hub_device,
+	.update_device = xhci_pci_update_device,
  };
  
  /*
@@ -606,6 +608,42 @@ static int xhci_pci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hd
  	return xhci_update_hub_device(hcd, hdev, tt, mem_flags);
  }
  
+static void xhci_intel_port_is_tunneled(struct usb_hcd *hcd,
+					struct usb_device *udev)
+{
+	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);;
+	struct xhci_port *port;
+	void __iomem *base;
+	u32 offset;
+
+	if (xhci->portsc_tunnel_reporting || udev->parent->parent)
+		return;
+
+	port = xhci->usb3_rhub.ports[udev->portnum - 1];
+
+	base = &xhci->cap_regs->hc_capbase;
+	offset = xhci_find_next_ext_cap(base, 0, XHCI_EXT_CAPS_INTEL_SPR_SHADOW);
+
+	if (offset && offset <= XHCI_INTEL_SPR_ESS_PORT_OFFSET) {
+		offset = XHCI_INTEL_SPR_ESS_PORT_OFFSET + port->hcd_portnum * 0x20;
+
+		if (readl(base + offset) & XHCI_INTEL_SPR_TUNEN)
+			udev->tunnel_mode = USB_LINK_TUNNELED;
+		else
+			udev->tunnel_mode = USB_LINK_NATIVE;
+	}
+}
+
+static int xhci_pci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
+{
+	struct pci_dev *pdev = to_pci_dev(hcd->self.controller);
+
+	if (pdev->vendor == PCI_VENDOR_ID_INTEL && hcd->speed >= HCD_USB3)
+		xhci_intel_port_is_tunneled(hcd, udev);
+
+	return xhci_update_device(hcd, udev);
+}
+
  /*
   * We need to register our own PCI probe function (instead of the USB core's
   * function) in order to create a second roothub under xHCI.
diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index d61ed5de69a2..945f6647ffad 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -4752,7 +4752,7 @@ static int xhci_set_usb2_hardware_lpm(struct usb_hcd *hcd,
  	return 0;
  }
  
-static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
+int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
  {
  	struct xhci_hcd	*xhci = hcd_to_xhci(hcd);
  	struct xhci_port *port;
@@ -4760,9 +4760,13 @@ static int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev)
  
  	/* Check if USB3 device at root port is tunneled over USB4 */
  	if (hcd->speed >= HCD_USB3 && !udev->parent->parent) {
-		port = xhci->usb3_rhub.ports[udev->portnum - 1];
-
-		udev->tunnel_mode = xhci_port_tunnel_mode(xhci, port);
+		if (xhci->portsc_tunnel_reporting) {
+			port = xhci->usb3_rhub.ports[udev->portnum - 1];
+			if (xhci_portsc_readl(port) & PORT_TM)
+				udev->tunnel_mode = USB_LINK_TUNNELED;
+			else
+				udev->tunnel_mode = USB_LINK_NATIVE;
+		}
  
  		if (udev->tunnel_mode == USB_LINK_UNKNOWN)
  			dev_dbg(&udev->dev, "link tunnel state unknown\n");
@@ -5696,6 +5700,8 @@ void xhci_init_driver(struct hc_driver *drv,
  			drv->update_hub_device = over->update_hub_device;
  		if (over->hub_control)
  			drv->hub_control = over->hub_control;
+		if (over->update_device)
+			drv->update_device = over->update_device;
  	}
  }
  EXPORT_SYMBOL_GPL(xhci_init_driver);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 2b5c0b304c6b..1071879366c6 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1697,6 +1697,7 @@ struct xhci_driver_overrides {
  			    struct usb_tt *tt, gfp_t mem_flags);
  	int (*hub_control)(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
  			   u16 wIndex, char *buf, u16 wLength);
+	int (*update_device)(struct usb_hcd *hcd, struct usb_device *udev);
  };
  
  #define	XHCI_CFC_DELAY		10
@@ -1897,6 +1898,8 @@ int xhci_check_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
  void xhci_reset_bandwidth(struct usb_hcd *hcd, struct usb_device *udev);
  int xhci_update_hub_device(struct usb_hcd *hcd, struct usb_device *hdev,
  			   struct usb_tt *tt, gfp_t mem_flags);
+int xhci_update_device(struct usb_hcd *hcd, struct usb_device *udev);
+
  int xhci_disable_slot(struct xhci_hcd *xhci, u32 slot_id);
  int xhci_disable_and_free_slot(struct xhci_hcd *xhci, u32 slot_id);
  int xhci_ext_cap_init(struct xhci_hcd *xhci);

Thanks
Mathias

