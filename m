Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C87B2245005;
	Sun, 30 Aug 2026 06:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788072617; cv=none; b=ru2avbF85qpsnNXPGs4znD0AEGRvFwHb1aXEkOcV16HrSt+alNN2VDjptI7qXMGVpDypL0w3YtjAnmZ3U9pLd1pE0QJDVEg4GykAuVkkauVigv1v1budlr1SyvWuJihOB0Qz7DTLKWr3XqD0nP8OBhon4xkz7ObZhIUCieFNl5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788072617; c=relaxed/simple;
	bh=fcfFbNUkP2uE66jkrRxdX6zu0gFqs47WEwgUBcVNumE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WPX92lgzY+5jMdVrUR9vezHKxKmBfwklx4hZUBA+EH1oSNAsolAZ4DA92vV2ZeMScH5kfxbM2pZtPrubscS/6TefmeBNffQ0Rx0/cuy7omg8M98Auw8EIPD5OtW64M81MGyAbT8QWZ+Hh1iuW9Wz5ilj+BPrq1rwAVg63GsPMHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N/hd9HPo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N/hd9HPo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B66861F000E9;
	Sun, 30 Aug 2026 06:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788072616;
	bh=fcfFbNUkP2uE66jkrRxdX6zu0gFqs47WEwgUBcVNumE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=N/hd9HPoTZC9K0ZTFIAepDfGY0rWI0CyIlyt0XAjCJyKvC9h8PsYcD+GXUw+/DIpw
	 FnC+slJ5cP6JsBr0DQCM+BbB+chVigl9DNtDoqKaWNIeBYjU94FKSv21k+wCVatx5O
	 BMNE/JWmpYe3ps80CpYwEfH3f0rcRi/r0o3qrgwM=
Date: Sun, 30 Aug 2026 08:48:33 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: valentina.manea.m@gmail.com, shuah@kernel.org, i@zenithal.me,
	yuyang.du@intel.com, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+8753715f05759f1a10de@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] usbip: vhci_hcd: let the driver core manage the sysfs
 attributes
Message-ID: <2026083027-referable-exhale-1624@gregkh>
References: <20260816061034.17769-1-kartikey406@gmail.com>
 <CADhLXY50-2NMU2P3-htxfh8d6cQZ7VQ1C93aGm+HBXFz=6uB=w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADhLXY50-2NMU2P3-htxfh8d6cQZ7VQ1C93aGm+HBXFz=6uB=w@mail.gmail.com>

On Sun, Aug 30, 2026 at 11:53:30AM +0530, Deepanshu Kartikey wrote:
> Please let me know the status of this patch

It has been the merge window, where no new patches can be accepted.
When that is over we will get to it starting next week.

To make it move quicker, please help review other patches on the mailing
list to reduce our load.

thanks,

greg k-h
