Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407869;
	b=QCcI6SlhDUfyHUKYHfX9IO+vWLordgqNYkE5uK2UIPKhz8nsaqS7Z2ocluIWWx7k5FnT
	 U3dvmJ4W7rcLhh7JC7dZQDJjsDkm5AEDLChtu/5+LJxQ4h8CVZOyCIpZ4SO5EL45aLWeK
	 jjpDjOFM3FbvooS4rohSDs5CjWbUWE1VpZfkOjS4g4kHqJpHhKv+x+j5PjRzAWlDWVA5a
	 HtKM6KPzHjCwQCEviwFxg4+hG3XapDaaL07Ru5rWI8GuEeXDnBHkQxhvrZ+N6rb1Vqr6e
	 Vy8E/1sIu1lKnr+9Ax6vSKv9ixxJS5nySdr9sKTJCxJbKGbxw2uu/1CBperqeH7Ci7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407869;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=PcFqdyQip3caAxLpihzZdOa7UVDjVA+wDG3Rq8J697E=;
	b=vu1xpN0Of33LS4ViQGoo42CjZtFITRYTwTKm5Omkx0pmAnnimL2FytjKgrY9IpyiLjrL
	 cZ+Z0RUHIl9pId5IDzYsY4laP3e4cccECTe2L2mrjYmSOqeLsHl3U107Ky9p9/pQrVic6
	 z19A8ZmR3brqcS3Hf7CRA0BNi6tnRGqQbLjejxk8dTw+eZPd4Z8yhzTQ2wIIVL6Y3W852
	 i3zXSfQstRfiPauiAqGAVjOdYuhUUJQLgbQIOFQZdLSBGeMchjZiT77GjXLJgx7iHN9Fr
	 gO8/QMwvRglkXjKsgQpQMJfemJas1CMaWD1w0fl29oPHpxKdmowhZ3aRWky4vnUYQSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmcY9BEk;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82047606A324;
	Wed, 11 Nov 2026 14:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82047606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PmcY9BEk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794407870; x=1825943870;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ndux+QvjLDQ+qAek9BQTLlCJTB2RpYrvjL12zE/2LjI=;
  b=PmcY9BEkQcTMUmRc41cuXHSFgckTEMRmpJMkToEfepM9XSqLOSIiH+Kf
   unIyD17zpKkUx5/22fJwwMgx4aWqxb1r9BRCq6eEpElUIMNDPRyopmdNo
   vpwsI6D6fsT0aVhoLLKfjnRd4rLVllCf9qxKm0wLUwKc5QrpTaR6KUbk/
   +cswMTS8Q0xQ2IfXXvWlIAqCvMf9TKo8cXD4u0xKLwTxfG3+liLtPotWZ
   JK8uoJ71gX7NI1XG15VIIypueN+V/Z0WSrh8ukTVep3uEhIrLkNNvwZT9
   2gswMBMkUI7hNdpg1WvlMnUWi4aavuHkzgWEmofz0n+AzsdUPepr3FO0F
   A==;
X-CSE-ConnectionGUID: SRCwTPCSS+ujvBKgay6JEw==
X-CSE-MsgGUID: MbuRaoYIRMSAFT+9C58tyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3061239"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3061239"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 06:37:49 -0800
X-CSE-ConnectionGUID: 4TsPNawXQKmUKvYlK/1SgQ==
X-CSE-MsgGUID: O8N9s9ITT86ivc0A5ECyhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8308192"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 11 Nov 2026 06:37:48 -0800
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9214099; Wed, 11 Nov 2026 15:37:46 +0100 (CET)
Date: Wed, 11 Nov 2026 15:37:46 +0100
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Alexey Charkov <alchark@flipper.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: typec: fusb302: Drop unacknowledged
 Get_Source_Cap_Extended
Message-ID: <avR9uoRAYKQQtw4s@black.igk.intel.com>
References: <20261102-fusb302-getsourcecap-v1-1-26b5bfea4b2b@flipper.net>
 <au3KYk13lFTjhltb@black.igk.intel.com>
 <CAKTNdwHpSNhtxp3eaUHt8N5ea6cwXPc6pE_HVVOwtGgk-xWxzA@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKTNdwHpSNhtxp3eaUHt8N5ea6cwXPc6pE_HVVOwtGgk-xWxzA@mail.gmail.com>

On Tue, Nov 10, 2026 at 10:48:46AM +0400, Alexey Charkov wrote:
> On Fri, Nov 6, 2026 at 4:39 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > On Mon, Nov 02, 2026 at 05:09:05PM +0400, Alexey Charkov wrote:
> > > The chip mistakes Get_Source_Cap_Extended for a GoodCRC, as it apparently
> > > decodes only the low four bits of the message type. As a result, it sends
> > > no GoodCRC for it, but still queues it in the RX FIFO. The partner never
> > > sees the message as delivered due to no GoodCRC, so it retries and then
> > > sends a Soft_Reset. When FUSB302 receives the Soft_Reset, it finally
> > > raises its interrupt, at which point TCPM sees Get_Source_Cap_Extended in
> > > the RX FIFO instead of the Soft_Reset it just received, and answers it
> > > Not_Supported, which is not a valid reply to Soft_Reset, so the partner
> > > escalates to a hard reset instead of getting a chance to gracefully handle
> > > a lost Get_Source_Cap_Extended.
> > >
> > > Discard Get_Source_Cap_Extended, which FUSB302 can never properly receive
> > > due to its inability to automatically GoodCRC it, and answering it from
> > > the host within the protocol specified 250us window without so much as an
> > > interrupt cannot be made to work.
> > >
> > > This way the TCPM view of the PD exchange at least matches what the
> > > partner saw on the wire. This lets the TCPM complete a PD negotiation over
> > > the FUSB302 with e.g. an Apple Studio Display, which otherwise always ends
> > > in hard resets.
> > >
> > > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >
> > Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> 
> Thanks for acking it Heikki, but let's please hold off applying this
> patch. My colleagues have done broader testing with Apple hardware.
> While this patch prevents hard reset loops and lets TCPM negotiate a
> PD contract, it can't yet complete Alt Modes negotiation in PD 3.0.
> 
> I've done another attempt locally to send GoodCRC from the driver
> instead of discarding Get_Source_Cap_Extended altogether. It lands
> wildly out of spec timing wise (close to 2ms vs. the spec-prescribed
> 250us to start transmitting GoodCRC on the wire). However, it works by
> sheer luck because the partner waits up to 1ms for a GoodCRC and
> retries the message with the same ID up to 3 times, so the first
> GoodCRC lands in the window of the second or third retry and gets
> accepted. Everyone is happy, and the negotiation completes just fine.
> 
> It's a bit more invasive for the driver, though (as can be expected),
> and relies heavily on the bus speed being at least 400 kHz (FUSB302
> can do up to 1 MHz) and not a single extra I2C transaction being added
> in the timing-critical path before the GoodCRC goes out. I'll send it
> for review separately, and if it proves palatable, it will supersede
> this patch.

Okay, thanks for the explanation.

-- 
heikki
