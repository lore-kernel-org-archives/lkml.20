Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D82F29DB64
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 15:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789228669; cv=none; b=Owp7IJ/Gfb4n1QVNMwUfRxWCDHrD7mqc8OttLjIYP0szV44bgBBvOgmMdCUw5zD8jqpZoT2Kp95zcfp/QoAoxZbB3Y2lQj8EEG/6mJw7IoATIaTaASnI/ToP4tRxVCJibknkX5PcEqLGZov1BscYIMtBxsRmHJ3e3eswwKsv+Us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789228669; c=relaxed/simple;
	bh=DDdwMavose+L44nqqW3Jbf/GzHVrxplojO2qv8SdCQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mr3KFmb3A2fgqAf/fX25Br0WUtjN6+YHsjUZVRqDDfLyuIL7TPIrSOzN6gZcumy85wqtfVr0nqGoVyfaY5XEoOmIa//wxF8zteMusrpd9NYgR5lLDLgAPaluDNYZBNKmgSyBQ2tm1X5NlHUge3SOOuPdZW/ZPxd87sa4gSm4fRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dNMo1iQC; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fzUeq5w7; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dNMo1iQC";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fzUeq5w7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789228666;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Suz8unb1e4b6bNiUz2gPySCHFTJdV6OXkzqI95eyBY=;
	b=dNMo1iQC8jDNhrWXOIsYVMk4ySNegC5krtYVnurhWaNalXth2wklw4UUu7go76/Oi/gOqH
	YL1GImRQzpnNb8Z/L3Wlq33buUXZfo7dFA6wwrFfQqtiNF+xwgJl/Tb33qClCmbzL7zkke
	120IotcacR4reG/E9zY5YyL78z9iA84=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-UYaKpixDN329pdPZQOpaig-1; Sat, 12 Sep 2026 11:57:44 -0400
X-MC-Unique: UYaKpixDN329pdPZQOpaig-1
X-Mimecast-MFC-AGG-ID: UYaKpixDN329pdPZQOpaig_1789228663
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-49e6422198fso12172535e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 08:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789228663; x=1789833463; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Suz8unb1e4b6bNiUz2gPySCHFTJdV6OXkzqI95eyBY=;
        b=fzUeq5w74iXyUs3gLLBun0HKebgLfUd8slh2zUlnlTeEQl2RRBGI/N2PaBD5MpRYKw
         g76Rbj8lUZrSRX1eRDwmCG+ZsuVozeTkoVHBNNx3Zx8FYZq6qFC8/+b5wNl3iE59ut4l
         12grK3+9Gw1/rfXO/vi6wNWT4WzuAXOmdtPOk4K6RDSBHIB3CF3sc1B0WN3eQYijJsio
         SPOz0OB32loCbv6jD7zSgUzuBO/ytyq1W7NIHZIJi29O/9lzMVsW8p209hQB77HSZdGV
         Cy49lrseSsRYZe8r6f/R56wQW3K0kMoESdxwKnQgC87Ts0Nq8bOHqLgNdwxe99Z3FJje
         5v/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789228663; x=1789833463;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Suz8unb1e4b6bNiUz2gPySCHFTJdV6OXkzqI95eyBY=;
        b=NcVcEVHxPv5LODyB73oRDQyLPDEPTbY5cKg0iYi0yofmLCsqwUUjEs7Bbo5+lIXWyU
         +uJoxfqJDh6+DRiq5UwImhTKtcQ2DKt8a+b6UYoSuAghjxLMYUNRtYZpo1X9vGbVWT6o
         CdaDx+icgg8BfJS8DVDykWD5HTxH0SQRIX05morRQL3C0rzrnaHv/434yrAVq/T+aXIt
         4z62KYOr2+2moAc5KXmAnR+VMqKId7hVhBamdPaD5vhpGYXlTTMNct+DZebJuu7b+vXl
         vv9eGZQJh8majGOgFa3/gDZ6AD5TopIVEuQvPH5V53ZXTI/5zqgwhPHV6lWl1iRi+SYZ
         1YbQ==
X-Forwarded-Encrypted: i=1; AKwUvByM0QgpxrZfgpDJmvqm2X58WQz8dQA3zD9gZlZHYC6npMY/kQfKoCzaephcmhLLZ/0vRwds4H59l67QvYA=@vger.kernel.org
X-Gm-Message-State: AFuF++kAeHd2HD6PDIEHDI6Xitiz89CbaqVQZnhHAt2rLuvRs6bBtVIf
	MOpB5pP40+o3qbLsKmVUGwG+vxlX2iQKfffI/GDC6vTH0o09Vm0KwcV9IAuzSsDA6ygQElo2Odo
	ZfXhb+d5dakbJYkxCFQIX+oaJemLGilUNR1Pkj4Je/guQKS6IL6mDSeIoQcLjTmBtIQ==
X-Gm-Gg: AYBFou1Nvcs8DqhKZh9fzeREMPmiFee9rYRTpJZAs4eGfZrRszo/hObOBpe0V2Up+D6
	WXLqisN0U52J7uBSfU3wVtkvxY5pmn+yzIvtJ2PWgs79kvh2VGaGaR8sWW5FwWXhsPZEqlGbPzO
	xdcAhcPz/SeOt4YvT11qSVFaLDMkaX4YPHD0q4/Nozcr/tf9UlDs9Hrfp59Hy/L3AVVlV86ZwIA
	SqW2ytjfGflmI6lwHEnGL87zk3pQJ9O/7cYalS46ovRoqV60z4ghVTFYhaD890Sa+XYxCVa70sA
	C4OxHc13diqolnrpFhBQ0Rc3Tp1688h9byANNUXDIGb7yQ8smQP1dHNMZeitX+G7i94=
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr251758215e9.6.1789228663086;
        Sat, 12 Sep 2026 08:57:43 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0c:b0:49c:ed94:cdd8 with SMTP id 5b1f17b1804b1-49e6198734emr251757665e9.6.1789228662551;
        Sat, 12 Sep 2026 08:57:42 -0700 (PDT)
Received: from redhat.com ([147.235.223.59])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49db038401fsm269738175e9.13.2026.09.12.08.57.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 08:57:41 -0700 (PDT)
Date: Sat, 12 Sep 2026 11:57:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Abhin Parekadan Jose <abhinjoses@gmail.com>
Cc: bhelgaas@google.com, lukas@wunner.de, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, ilpo.jarvinen@linux.intel.com,
	kees@kernel.org, xueshuai@linux.alibaba.com
Subject: Re: [PATCH RFC 2/3] PCI: pciehp: Report surprise removal from
 pciehp_isr()
Message-ID: <20260912115420-mutt-send-email-mst@kernel.org>
References: <20260905183905.997833-1-abhinjoses@gmail.com>
 <20260905183905.997833-3-abhinjoses@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905183905.997833-3-abhinjoses@gmail.com>

On Sat, Sep 05, 2026 at 06:38:59PM +0000, Abhin Parekadan Jose wrote:
> A surprise removal during a safe removal cannot be reported: the
> removal blocks waiting on a device interrupt or status read, and the
> single-threaded IRQ thread is itself executing that removal, so it
> cannot report that the device is gone. The removal hangs.
> 
> The hardirq handler pciehp_isr() still runs while the IRQ thread is
> blocked, so it can report the disconnect. However, pciehp_ist()
> deliberately ignores link and presence changes caused by a Secondary
> Bus Reset or Downstream Port Containment, where the device is only
> temporarily inaccessible. Distinguishing those normally requires
> waiting for the SBR or DPC to conclude, which takes seconds and is not
> possible in hardirq context.
> 
> Schedule a work item from pciehp_isr() when a PDC or DLLSC event
> arrives and PDS indicates if the device is connected/disconnected.
> This provides us a pathway to wait/block/sleep as we will not be
> in pciehp_isr().
> 
> Move the scheduling of the driver's disconnect notification out of
> pci_dev_set_disconnected() into schedule_notification_work() so it can
> be invoked from the new work item. Factor the spurious link change
> test out of pciehp_ist() into pciehp_is_spurious_link_change() so both
> pciehp_ist() and pciehp_disconnect_work() can use it.
> 
> Link: https://lore.kernel.org/all/aHlZE18kPuHuDtTT@wunner.de/
> Signed-off-by: Abhin Parekadan Jose <abhinjoses@gmail.com>
> ---
>  drivers/pci/hotplug/pciehp.h     |  1 +
>  drivers/pci/hotplug/pciehp_hpc.c | 56 +++++++++++++++++++++++++++-----
>  drivers/pci/pci.h                |  6 ++++
>  3 files changed, 55 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pciehp.h b/drivers/pci/hotplug/pciehp.h
> index debc79b0adfb..c8ceb9320e2e 100644
> --- a/drivers/pci/hotplug/pciehp.h
> +++ b/drivers/pci/hotplug/pciehp.h
> @@ -116,6 +116,7 @@ struct controller {
>  	unsigned int ist_running;
>  	int request_result;
>  	wait_queue_head_t requester;
> +	struct work_struct disconnect_work;
>  };
>  
>  /**
> diff --git a/drivers/pci/hotplug/pciehp_hpc.c b/drivers/pci/hotplug/pciehp_hpc.c
> index 4c62140a3cb4..235ca8a176f1 100644
> --- a/drivers/pci/hotplug/pciehp_hpc.c
> +++ b/drivers/pci/hotplug/pciehp_hpc.c
> @@ -620,6 +620,45 @@ static void pciehp_ignore_link_change(struct controller *ctrl,
>  	up_read(&ctrl->reset_lock);
>  }
>  
> +/*
> + * Link Down/Up events caused by Downstream Port Containment if recovery
> + * succeeded, or caused by Secondary Bus Reset, suspend to D3cold, firmware
> + * update, FPGA reconfiguration, etc. are spurious and should be ignored.
> + */
> +static bool pciehp_is_spurious_link_change(struct controller *ctrl,
> +						  struct pci_dev *pdev,
> +						  u32 events)
> +{
> +	return (events & (PCI_EXP_SLTSTA_PDC | PCI_EXP_SLTSTA_DLLSC)) &&
> +		(pci_dpc_recovered(pdev) || pci_hp_spurious_link_change(pdev)) &&
> +		ctrl->state == ON_STATE;
> +}
> +
> +/*
> + * Workaround to not wait in the isr.
> + */
> +static void pciehp_disconnect_work(struct work_struct *work)
> +{
> +	struct pci_bus *bus;
> +	struct controller *ctrl = container_of(work, struct controller,
> +					       disconnect_work);
> +	struct pci_dev *pdev = ctrl_dev(ctrl);
> +	u32 events;
> +
> +	events = atomic_read(&ctrl->pending_events);
> +
> +	if (pciehp_is_spurious_link_change(ctrl, pdev, events))
> +		return;
> +
> +	bus = ctrl->pcie->port->subordinate;
> +
> +	/* The card may have returned */
> +	if (!bus || pciehp_card_present(ctrl) != 0)
> +		return;
> +
> +	pci_walk_bus(bus, schedule_notification_work, NULL);
> +}
> +
>  static irqreturn_t pciehp_isr(int irq, void *dev_id)
>  {
>  	struct controller *ctrl = (struct controller *)dev_id;
> @@ -722,6 +761,12 @@ static irqreturn_t pciehp_isr(int irq, void *dev_id)
>  
>  	/* Save pending events for consumption by IRQ thread. */
>  	atomic_or(events, &ctrl->pending_events);
> +
> +	/* presence change events */
> +	if ((events & (PCI_EXP_SLTSTA_PDC | PCI_EXP_SLTSTA_DLLSC)) &&
> +	    !pciehp_card_present(ctrl))
> +		schedule_work(&ctrl->disconnect_work);
> +
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -761,14 +806,7 @@ static irqreturn_t pciehp_ist(int irq, void *dev_id)
>  				      PCI_EXP_SLTCTL_ATTN_IND_ON);
>  	}
>  
> -	/*
> -	 * Ignore Link Down/Up events caused by Downstream Port Containment
> -	 * if recovery succeeded, or caused by Secondary Bus Reset,
> -	 * suspend to D3cold, firmware update, FPGA reconfiguration, etc.
> -	 */
> -	if ((events & (PCI_EXP_SLTSTA_PDC | PCI_EXP_SLTSTA_DLLSC)) &&
> -	    (pci_dpc_recovered(pdev) || pci_hp_spurious_link_change(pdev)) &&
> -	    ctrl->state == ON_STATE) {
> +	if (pciehp_is_spurious_link_change(ctrl, pdev, events)) {
>  		u16 ignored_events = PCI_EXP_SLTSTA_DLLSC;
>  
>  		if (!ctrl->inband_presence_disabled)
> @@ -1036,6 +1074,7 @@ struct controller *pcie_init(struct pcie_device *dev)
>  	init_waitqueue_head(&ctrl->requester);
>  	init_waitqueue_head(&ctrl->queue);
>  	INIT_DELAYED_WORK(&ctrl->button_work, pciehp_queue_pushbutton_work);
> +	INIT_WORK(&ctrl->disconnect_work, pciehp_disconnect_work);
>  	dbg_ctrl(ctrl);
>  
>  	down_read(&pci_bus_sem);
> @@ -1096,6 +1135,7 @@ struct controller *pcie_init(struct pcie_device *dev)
>  void pciehp_release_ctrl(struct controller *ctrl)
>  {
>  	cancel_delayed_work_sync(&ctrl->button_work);
> +	cancel_work_sync(&ctrl->disconnect_work);
>  	kfree(ctrl);
>  }
>  
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 23b1605e783a..4e17878edeab 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -805,6 +805,12 @@ static inline int pci_dev_set_disconnected(struct pci_dev *dev, void *unused)
>  	pci_dev_set_io_state(dev, pci_channel_io_perm_failure);
>  	pci_doe_disconnected(dev);
>  
> +	return 0;
> +}
> +
> +static inline int schedule_notification_work(struct pci_dev *dev, void *unused)
> +{
> +	pci_dev_set_disconnected(dev, NULL);


Does this not break what patch 1 was trying to do,
for everyone who does not call schedule_notification_work,
that is, everyone except pciehp?

I'd say do the reverse: make schedule_notification_work
schedule the work, and have both pcieh and 
pci_dev_set_disconnected call that.


>  	if (READ_ONCE(dev->disconnect_work_enable)) {
>  		/* Make sure work is up to date. */
>  		smp_rmb();
> -- 
> 2.51.1
> 

