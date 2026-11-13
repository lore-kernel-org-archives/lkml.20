Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794563523;
	b=eiKMMaerjqsvAIte4NuaWg/rszE9mdE35qhj+RBxw/FPktt2PgI7Hs88Co7p4ejFJach
	 EHEBiXYsybTMyyIi/FZy/9GGTnjZyjSYbgSHbb/vEsbREVJHbsRO0sgLwhgBhDqcCwtpR
	 eQyOeKP/ZQ3CRx9+Csv6dfEyU5BEYhoksQWtE0WFyaxFXeR66J8a/TXCzVWXBya3xEHam
	 b+LKiCafRmuJLzBlXvkKj0Z7ipUdOOyymX5w78zDl2yK7QSJJxxYQDIUTon+vZ31Cbh6h
	 VfmPN5TZIA6nWLWeHZAZEnZE8bWX209pd4MPIv4MxRJ9TqHWUpEOX30OQ/E8Yfjh7vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563523;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=7kfs/zOjBNjBekrqyCn+CdUPpDQ0qSWOcg2r77r9dpU=;
	b=NabGfD+cyRbqqOVGvjBXv+Lpe9cdXeZSWXhM6ImfEoXh2msi67QrDL6rMhWiRB/sz5ki
	 6iTB/AJA1dleM1QrYpevip2Dsb6D0mJdDAn4zlC13B6Usja524JKZp56LRZ9XOFRdR7u7
	 AKBcNzI9v6qtWhxt8lZntBhHfe7HvCBQM30GBBhfILpspjS/TRRS8Y8DojsTuc/s5T6zL
	 E1LMXdw69N7qk8cB55chSlJI77ZmBomzlW26a4kH/7cGHTpdFbUwg3uO3nJrGJB+a/bXm
	 0UlZwFCAvpliPQLx12OJYSx4w7E2PusnbFuh1OogG+coBVl7tkL4fV/ixuEdrzLpM/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jBt48QhI;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67787606A339;
	Fri, 13 Nov 2026 09:52:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67787606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jBt48QhI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794563523; x=1826099523;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=S/zqzoGm5EjMipC5lV/NsmQqYFXzxmIF2V4muM6g7p8=;
  b=jBt48QhIytlEceJ0BK8nlbXjsAcE5nYYLy08Q54DjjOEDtc2MzSBJOdc
   nFQysdKopbz4Lr9EFXTS525lvy7ZEWXyAgg9L/FM+84EizG/Y4rPrh2bn
   2bN+ByOWPvnqXgG4pRapUsJvs5r3rifhREBtDqPTXTtOOySl8rVsN4/1W
   Bx0SEnMif+OoLnscrE4Nnb2ZZAqGQaNM6Bfc6wRGBQr1h8UG0jRucd0FW
   Wl6lQ3hWetZXyTKaHptqCADU+2lkDmHc+DlP/+lJBARR3aAHI0T2IWWb2
   8oRDU+HUq6hpNY9oXm6IJTBbPS06bcbPe4eGJ5buSEx5QZAqAhlksBmUH
   Q==;
X-CSE-ConnectionGUID: PBS3cB6ZQn+DBeYyPS8m4A==
X-CSE-MsgGUID: WDXUxxs/TymcxeYyYV0dsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3457316"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3457316"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 01:52:02 -0800
X-CSE-ConnectionGUID: 0aERKQS4QBKVV2gnyELBsA==
X-CSE-MsgGUID: PHHSCECmQiy8SCtBaNs8lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8738753"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO [10.245.244.184]) ([10.245.244.184])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 01:52:00 -0800
Message-ID: <a1ffc9f4-2de6-4e0a-b70a-fe78e0656cfa@linux.intel.com>
Date: Fri, 13 Nov 2026 11:51:57 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xhci: Give back URB under lock in xhci_urb_dequeue()
To: Chien Kun Niu <rickyniu@google.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Mathias Nyman <mathias.nyman@intel.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261113041948.1280304-1-rickyniu@google.com>
 <20261113041948.1280304-3-rickyniu@google.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20261113041948.1280304-3-rickyniu@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 06:02, Chien Kun Niu wrote:
> Before commit 36dc01657b49 ("usb: host: xhci: Support running urb
> giveback in tasklet context") set HCD_BH, usb_hcd_giveback_urb() ran
> urb->complete() synchronously, so xHCI had to drop xhci->lock before
> giving back an URB. That commit updated xhci_giveback_urb_in_irq() to
> keep xhci->lock held across usb_hcd_giveback_urb(), covering normal
> completions, xhci_process_cancelled_tds(), and xhci_hc_died(), while
> the open-coded err_giveback path in xhci_urb_dequeue() was missed.
> 
> Dropping xhci->lock between usb_hcd_unlink_urb_from_ep() and
> usb_hcd_giveback_urb() breaks per-endpoint giveback serialization: a
> concurrent xhci_urb_dequeue() or xhci_hc_died() can acquire xhci->lock
> and queue a later URB onto bh->head ahead of this one, completing URBs
> out of order. When spinlocks disable interrupts, unlocking first also
> causes a redundant IRQ restore/save bounce into bh->lock, and without
> an IRQ-safe bh->lock it exposed task-context unlinks to a same-CPU
> deadlock.
> 
> Move usb_hcd_giveback_urb() before spin_unlock_irqrestore(&xhci->lock,
> flags) in err_giveback to match xhci_giveback_urb_in_irq().
> 
> Fixes: 36dc01657b49 ("usb: host: xhci: Support running urb giveback in tasklet context")
> Cc: stable@vger.kernel.org
> Signed-off-by: Chien Kun Niu <rickyniu@google.com>
> ---


Added to queue

Thanks
Mathias


