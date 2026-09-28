Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3732E4D5988;
	Mon, 28 Sep 2026 13:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603991; cv=none; b=JYtZXn8llU8QxMOPtoES+oYxopBuhdPNmO8yBXmJgRQEQ0nWwpC064LiUpzPIsije/LQiZO0nk7w+2rVw6vfqP6tjQ0HgmfyZEe8DskHnLDC+/qhBEyQIwsgkU4ew8+sjE8bJHV7CPe5TwLoCxpVkp2cRgnFQ86sTWaMOC8r3Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603991; c=relaxed/simple;
	bh=oK3jZxxDr0BnpPbmFCjbTWLPyFqxlCPZlscEIjM9pLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S8F/yFLeuO7dMwy/0D1cu0lB2Th70+tw0UKMg2NAuij6W6EOegS/4lLHQsE7Vfv0TpwF+XrR8TkxlmRc4WMkZU+hFHbOh6Hba/IS5PNTC1oVPSyJbJLQbXRC6mqVJUzX7UFZlBqz/vKJqRkaAu8Ugly7qwoY/VK2e2+tl/B8lig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L9/V6OAd; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L9/V6OAd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790603989; x=1822139989;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oK3jZxxDr0BnpPbmFCjbTWLPyFqxlCPZlscEIjM9pLE=;
  b=L9/V6OAdRpBgIHePdL1yvqJHwBC1ciijAs3Ampwh8qlkofok3OHt9GzS
   ZSarOR2zOnCXrlmq5cTgbCThUTH3HyLgiqkoVZ5oksc07nEGH+GFmQVvz
   141uWvBtDw7DQh8mLiKRqAFyuFSu8yyNDZfP7uJ36vuHzXzSnPz3OfN+V
   7bqc67qQh9E76Q70HoJ62Y/t7JwPu5mHn6I29qtyWUftNEYjNGBly0Ogg
   eamw2UE+roqgv9K7CwOIBuxYEJ0IPyfhCrbRqF3TXFn7PF53TMP6ZeYs+
   8YiG+zG9Ljv+JdvjDRpKhAaVXiwS9KlsbQU8cMKidlEvg3YvER+durc/M
   A==;
X-CSE-ConnectionGUID: g8d3cCE6SFypsKZJOJrp5g==
X-CSE-MsgGUID: HN8kgLkCSXyQ5zkto8qrHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11919"; a="90068800"
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="90068800"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2026 06:59:49 -0700
X-CSE-ConnectionGUID: NEJqQGimT4C8rbhoiu06Zg==
X-CSE-MsgGUID: rI73WS/oRnSCECNXKNG0Fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,128,1787036400"; 
   d="scan'208";a="301354197"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa002.fm.intel.com with ESMTP; 28 Sep 2026 06:59:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id C369A99; Mon, 28 Sep 2026 15:59:46 +0200 (CEST)
Date: Mon, 28 Sep 2026 15:59:46 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Carlo D'Ambrosio <carlo.dambrosio@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] usb: typec: ucsi: Acer Aspire 16 AI reports connector 2
 while num_connectors=1
Message-ID: <arpy0gdTPc1YhKHr@black.igk.intel.com>
References: <18c22d05-af53-4d94-b6ff-91441adc65c2@gmail.com>
 <48e56ed1-d8ef-4d26-8c18-9bb0fa2e5a7a@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48e56ed1-d8ef-4d26-8c18-9bb0fa2e5a7a@gmail.com>

On Sun, Sep 27, 2026 at 09:04:09PM +0200, Carlo D'Ambrosio wrote:
> Hello,
> 
> I did one additional A/B trace which seems to explain why the notification
> storm persists.
> 
> Starting from a clean Windows -> Fedora boot, I traced
> |ucsi_notify_common()|and |ucsi_acpi_async_control()|and connected the
> charger to the lower USB-C port, which behaves normally.
> 
> The first event was:
> 
> |NOTIFY CCI=0x20000002 connector=1 num_connectors=1 CONTROL
> command=0x0000000000010012|
> 
> |0x12|is |UCSI_GET_CONNECTOR_STATUS|, with connector 1 encoded in the
> command.
> 
> This was followed by:
> 
> |NOTIFY CCI=0x80000900 CONTROL command=0x0000000000030004 NOTIFY
> CCI=0x20000000|
> 
> From |ucsi.h|, |0x04|is |UCSI_ACK_CC_CI|, bit 16 is
> |UCSI_ACK_CONNECTOR_CHANGE|, and bit 17 is |UCSI_ACK_COMMAND_COMPLETE|.
> Therefore |0x00030004|is:
> 
> |ACK_CC_CI | ACK_CONNECTOR_CHANGE | ACK_COMMAND_COMPLETE|
> 
> So for the valid connector-1 notification, Linux performs the expected
> |GET_CONNECTOR_STATUS(1)|and subsequently acknowledges the connector change.
> 
> In contrast, when the upper USB-C port triggers the problem, the trace is
> only:
> 
> |NOTIFY CCI=0x20000004 connector=2 num_connectors=1 NOTIFY CCI=0x20000004
> connector=2 num_connectors=1 ...|
> 
> approximately every 570 ms, with *no calls at all to
> |ucsi_acpi_async_control()|*during the loop.
> 
> This matches |ucsi_notify_common()|: because connector 2 is greater than
> |ucsi->cap.num_connectors|(1), |ucsi_connector_change()|is not called, so
> the normal connector-change handling/acknowledgement path is never entered.
> 
> Also, to correct an interpretation I was considering earlier: |0x20000004|is
> *ACK_COMPLETE + connector 2*, not ERROR + connector 2
> (|UCSI_CCI_ACK_COMPLETE|is bit 29; |UCSI_CCI_ERROR|is bit 30).
> 
> This seems to leave two separate questions:
> 
> 1. Why does the PPM expose |num_connectors=1|via GET_CAPABILITY while
>    the upper physical USB-C port generates connector-change indicator 2?
> 2. Independently, should Linux do anything to acknowledge/drop an
>    out-of-range connector-change notification to prevent a persistent
>    notification storm, or is the current behavior intentional?

Please report the issue to Acer if you have not yet done so. This is
an obvious FW/PPM issue.

Thanks,

-- 
heikki
