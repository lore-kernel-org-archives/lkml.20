Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517212AD37;
	Tue,  8 Sep 2026 03:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836800; cv=none; b=CS82BFgHQMbCtjCVukzk4wBhWNCTphtrJzCwBfKlpoz4hkTW0vUIW05seuIuccAy98a5AU4kGBs6s77RBo+5yg6m0umTutripCWI8nru/BbU0dJQCCQbNc3SoQ0k0emJ3FQZFYN6plaqgy5wnNKOpG0giTCSsJK2kbJSGRjVW+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836800; c=relaxed/simple;
	bh=QK4Qc5b7NIYLPkjR1khb5J5yTiPGU5QtG+LctPOVK/M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaFKkgZfn5qXdOz+li9E8qW3Yp54ttocwBT6LhwwRFpMikj+oup1tix4FH05gXpMX06tukVxRoBqoTQ/hfhTd43p2Jg0JfgkAbNHYZgg7UkHRqHNaD3/zinWLpacnQdTAxmJL2VUsUV8+M3KKFj0SiMltk/stIwBi7vPPxybNRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DSrhcIGm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DSrhcIGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7DEB1F00A3A;
	Tue,  8 Sep 2026 03:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788836798;
	bh=MJ0yXYPFLqJC8oV7MY2mqeqUmtFy8b5jNzagCXy/cJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DSrhcIGmX9UjnW2qB17lbkzONxgC0A6hrBgsKwJN7kXfsWQlcxzeqab7V0NLRt2uf
	 ha82wHYlrot1rxoIg5FMSYzyy/8j62bn0eYUigSe2ws/eoQ5e6I+aaikuccVQWiqHB
	 kIp8oY6+CGZkGdDuxJTL2jwE3dKDyMssBnmzleta5weZcrVk1pNwVLZwI8wG4eDVwe
	 i8XizahkcTouAalXYYPYh92tcUiAJ4P8nybUbtQO+yINgkGwG1vFgtl7v11ceMuIe/
	 2HWPQsPxQuvzhPpcY6aSNdI7dhSjc774dKrrd1cETj/0Zdw3Jucd1yniCu08M7kHV8
	 BTw4hDS2HUlYQ==
Date: Tue, 8 Sep 2026 03:06:35 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] firmware: coreboot: use named initializers for
 acpi_device_id
Message-ID: <ap97uwujoSOrvjOT@google.com>
References: <20260907-acpi-firmware-v2-1-e0b6d40823d1@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-acpi-firmware-v2-1-e0b6d40823d1@thegoodpenguin.co.uk>

On Mon, Sep 07, 2026 at 03:00:45PM +0100, Pawel Zalewski wrote:
> Use a named initializer for the acpi_device_id fields which
> makes the code more readable and consistent with how lists
> are initialized in the rest of the kernel code base. Also
> drop explicitly setting fields to 0 where it is redundant.

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-firmware-next

[1/1] firmware: coreboot: use named initializers for acpi_device_id
      commit: 0e30b98a545991e440a947fb24f9df4ded9798f0

Thanks!
