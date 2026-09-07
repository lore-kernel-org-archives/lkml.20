Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854B8353A6B;
	Mon,  7 Sep 2026 04:21:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788754903; cv=none; b=cwsiAa4U24apHifjJLMPCdJZJB0bWYFbXObYAlv5MQ0vykYxZZy1hx0wUyy3lbKrRsXM8Q6s/ZtMx4ejx/YSstlDMTMBCJciCksq0/pQKMj9qSBOAmMbIlMKfUczpkO2D25Dmwi1ew+yxpygaeCOCglYVSo/i5IYIBksRcZdE7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788754903; c=relaxed/simple;
	bh=mgYgtkUA4vMQ/FQw9HIJp5tMpVVcD+qJI5OxIeP2r7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BxuFVkgZb0zOtAOaLIlXbSeAHXD6HOFbX9vydHO6JEx6dNanFfbbyzM5nH6nDICyRjgjWyumpJlvdupfbHs8c6OYJyJTCyLnxrBbTjoJLOx5K9AQEDSgGnBRrOMA6YxaUxbxHhB1Q8voAsgz1bF9fTF3TYoNEcw5oMDjdgNKfmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lapk2VEz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lapk2VEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6877B1F00A3A;
	Mon,  7 Sep 2026 04:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788754902;
	bh=QbHc3JAn7b/lc9Pm//EPCRJvlZ3k4ZAt50qzo8hEzgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lapk2VEzhdSpjNTdmISn3jeSNsBkzTKUny65nqDbX+PLEefKKU2pfuYZQQgpFh4qS
	 1oYafCcGgU8crrRbmSp2Wktplvezo19tb8fiGXk/rTNNWmgOYUlGCW6X6mdtYZtoh1
	 9VI6X6fSx9Vbb3yvJ0XogCnKMtD92Z/AaQAYcAcGsatKoQyyPZhGOVudXmgdwUAuPX
	 dWAG76At7T2/ndNhnMuCINqAfP+DFtxyoKR3ZGn6Ohv7WUdqyWlaAN4ng6VG87AkD9
	 iW32xyVlg7uiTwjHCMjCc1RDZ8IBsS928eb9JL8no91iGxk9a62AsGndLX38vvkTyV
	 7fk4bgyk8XosQ==
Date: Mon, 7 Sep 2026 04:21:39 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: google: use named initializers for
 acpi_device_id
Message-ID: <ap470yV5nunouUL_@google.com>
References: <20260904-acpi-firmware-v1-1-7e4d7a09198e@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904-acpi-firmware-v1-1-7e4d7a09198e@thegoodpenguin.co.uk>

On Fri, Sep 04, 2026 at 04:24:00PM +0100, Pawel Zalewski wrote:
>  drivers/firmware/google/coreboot_table.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

The file has moved to drivers/firmware/coreboot/coreboot_table.c recently.
Please rebase to the latest linux-next or for-firmware-next branch of
https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git/
and resend.
