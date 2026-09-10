Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71C63AA50B;
	Thu, 10 Sep 2026 04:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789016105; cv=none; b=eVgcbdJbNETZUSKFud9u4vJtHQlf6711K4WFVpX/2WLIESuKGKATnt0JiE9ccRlftJ0YsvdwDUEqFFuXex9roFLkT58kti759d7aP4Em+NwuwGXgBbsuOnaLKYbSs+PrtZnJibKizOzHxiQLpVEzkdcs2WIxQI6xYxmN9nFwdzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789016105; c=relaxed/simple;
	bh=KDE7UNTDJIQ2uWjvJCEGyTyC62DCbKod/dyQyTTUmHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkuDV9DBf98FvferxJb3Cazc4mfc/56Zyek88iUGQocqf+pjFqxWELQoE2l6amSkMRCsHQxgLoaWB5latHDBDLDuwtoHiNKax/ZdmfEwaek603E1yp/PV8OPTRwecQIvZFqFU4YF0+mfjITHmszFhhULf1r27wyYsvVRUUWVCso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH1pdJKJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH1pdJKJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D5071F000FF;
	Thu, 10 Sep 2026 04:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789016104;
	bh=4b8PYqv4VWkKA9hB1zFAscNK0cfZC015fuLfwpBZ3G4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RH1pdJKJSnU7hItjQj34V4BOEhh1rua9xC9Ylp7MDPO+gzzNAlBT5xtpwojTqa/vq
	 IEUD4jxF/GrqOzUkQRP9W2jr171jumcvrhD0cMekeaUp9zyOHZOEFCBsAXU/ndRMnV
	 cjweQ/SRZzgVc5XMoQpBYvEiLHYFFlcSvSUYawGlFMzYyYgM/DiqfnFQ2vastSO2Uv
	 QydTfLtgZa3tp0odhE1T6SryJVNFW2z5KzAYSuK/vCeOCc152pJxHNRhQ2GAlIiY6x
	 3QHhP5Sb5HvxGTyuibtDNZzoppawOi08mzbokCUAkp1iSriLXJqNBl9ILbjR3dchnE
	 iHFHigmJiNvRw==
Date: Thu, 10 Sep 2026 12:35:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Shubham Patil <shubhamsanjay.patil@amd.com>
Cc: alexandre.belloni@bootlin.com, Frank.Li@nxp.com, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, michal.simek@amd.com,
	radhey.shyam.pandey@amd.com
Subject: Re: [PATCH v2 0/2] i3c: dw: Document optional core reset and drop
 redundant name
Message-ID: <aqIzgh9hA7lcome_@xhacker>
References: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720073510.1869623-1-shubhamsanjay.patil@amd.com>

On Mon, Jul 20, 2026 at 01:05:08PM +0530, Shubham Patil wrote:
> This series documents the optional core reset for the Synopsys
> DesignWare I3C master and updates the driver to match the binding.
> The DesignWare I3C master IP has a single core reset input. The
> binding never documented this reset, and the driver looked it up by
> the "core_rst" name even though a name is redundant for a single
> reset line.

Hi DT maintainers,

AIUI, the dw i3c explicitly says there are three reset signals in
total:
core_rstn, for core
presetn, for apb
dmareset, for dma

and I'm adding apb reset suppport, given this series has been applied,
we have three choices:

1.revert patch2 and document the "core_rst" reset dt-binding. This
equals to v1 of this series.

2.add a patch to add the "core_rst" reset, but allow no reset name

3.add a patch to add the "core" reset, but allow no reset name

Which one do you prefer?

Thanks

> 
> This series addresses both:
>   - Patch 1 documents the optional 'resets' property in the binding.
>     The reset is kept optional because the reset line is
>     integration-specific.
>   - Patch 2 removes the "core_rst" reset name from the driver and
>     looks the reset up by passing NULL, since the name is redundant
>     for a single reset.
> 
> Changes in v2:
> - Updated commit description for binding patch
> - Dropped reset-names from the binding
> - Added driver patch to remove redundant reset name
> 
> Note:
> The DesignWare I3C driver support was added by
> commit 1dd728f5d4d4 ("i3c: master: Add driver for Synopsys DesignWare IP").
> 
> The original Synopsys DesignWare I3C binding was added by
> commit 116e246a8bcd ("dt-binding: i3c: Document Synopsys DesignWare I3C"),
> but it did not document the optional core reset.
> ---
> Shubham Patil (2):
>   dt-bindings: i3c: dw: Document missing optional core reset
>   i3c: master: dw: Drop redundant core reset name
> 
>  Documentation/devicetree/bindings/i3c/snps,dw-i3c-master.yaml | 3 +++
>  drivers/i3c/master/dw-i3c-master.c                            | 2 +-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> 
> base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
> -- 
> 2.34.1
> 
> 
> -- 
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c
