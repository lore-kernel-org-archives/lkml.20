Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F19391832;
	Wed,  2 Sep 2026 19:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377028; cv=none; b=THKU+PqlU1ZVKX6YJHVDVogWEMHb0zFMdZiA9cDFKwWZUngvDYuamDmCdq6Yz/XPHoCwwfAtSft4tGAusdTqZeVRFIfhduONnrCzF8jCYyk/DlXZAjJD2gMuK/jWcJHoaQXuUX6RuCd/4GAu1AsXoO3FCI4N2W8xCvUKP/r74yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377028; c=relaxed/simple;
	bh=qw+K+BJ1RrD7zmM2m2dAEw0XiEShg477ZN2YlQC79z4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afgzbX7t8bgO2vXygxWkTWUQy3iqzud7QMPsKAcRZUjh1B8aDcVfQFWQIsUhgptSucRDDkcFlYmskbo721MR2pCPT5212PLZgTneiWYxttl0VnjaOj7v1nxG85O7luDY9T66+wGpuFGWv+5BkZYBMvjzKSxlwpJybiuyHhOVLQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GNvTglrv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GNvTglrv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788377026; x=1819913026;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qw+K+BJ1RrD7zmM2m2dAEw0XiEShg477ZN2YlQC79z4=;
  b=GNvTglrvDHGkWPxyhxk4WtglzUOZ+lAw5LvslHQZVxRouoeKx6x2AbMw
   gCmajMTZ2632Kc/BF/w1tv1W7GrdHmu2y/x+1AnUWOXkLNxHhWz0W/pnh
   mSYW6C9Z0jF1shEQMwX3f4l+1BRJUxyz3dq1m2BRWmEWNfbOWuXAtTebC
   FWRuBtbgv/smuIPVBfQuCfW9dejmvDROw3G0tsmk4Gg5fPI/fZr4uWb0a
   Hltr0CKYynMqHquHmz2QCyQZImAjqVf7+8Iu1eZi1bSW9tOKKAd3iLKzd
   HX3GRZQbuDYPF4AYLS8I0hvUJ5V44YOfwo8TAzPLYoRcHkVkSCbf3t8+0
   A==;
X-CSE-ConnectionGUID: EsOKtsboSnCvaS82lDG+7g==
X-CSE-MsgGUID: 5v7emZfmQ1qDAoI9QNAdIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="88772187"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="88772187"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:23:44 -0700
X-CSE-ConnectionGUID: hMo5Lun2Rn6VxvOsPgLP3Q==
X-CSE-MsgGUID: uV1YVyv7TzWYC09NEDOPKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="265798023"
Received: from abityuts-desk1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.8])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 12:23:42 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id C72AD11F7F5;
	Wed, 02 Sep 2026 22:23:38 +0300 (EEST)
Date: Wed, 2 Sep 2026 22:23:38 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Sergey Zagursky <gvozdoder@gmail.com>
Cc: Miguel Vadillo <miguel.vadillo@intel.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: ipu-bridge: do not use the CVS device lookup for
 IVSC
Message-ID: <aph3uoSgTLECfBIQ@kekkonen.localdomain>
References: <20260901194526.6369-1-gvozdoder@gmail.com>
 <20260901195036.7648-1-gvozdoder@gmail.com>
 <apfI7m2oD-k5GOYN@kekkonen.localdomain>
 <20260902145830.1796405-1-gvozdoder@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260902145830.1796405-1-gvozdoder@gmail.com>

Hi Sergey,

On Wed, Sep 02, 2026 at 03:57:25PM +0100, Sergey Zagursky wrote:
> Sakari Ailus wrote:
> > I can confirm there's indeed an issue here. But considering the list
> > contains the CVS device HIDs, doesn't it mean you're returning NULL here
> > for CVS, i.e. not for IVSC?
> 
> acpi_match_device_ids() returns 0 on a match, not a boolean:
> 
>   int acpi_match_device_ids(struct acpi_device *device,
>                             const struct acpi_device_id *ids)
>   {
>         return __acpi_match_device(device, ids, NULL, NULL, NULL) ?
>                0 : -ENOENT;
>   }

Ah, I missed you used acpi_match_device_ids(), not
acpi_match_acpi_device(). v1 is still better than v2 though.

Can you match IVSC IDs instead? They're more stable as I don't expect new
ones are created anymore, which isn't the case for CVS.

This is ok as a fix that is easily backported, but I think parsing CVS /
IVSC should be separated so we wouldn't need a CVS fallback case at all.
That's not necessarily part of the same set though.

> 
> so the bare "if (acpi_match_device_ids(adev, cvs_acpi_ids))" is true when
> adev is *not* in the list, which is the IVSC case. Both spellings are in
> tree, e.g. drivers/acpi/scan.c:1800 uses the negated form for "matched"
> and drivers/acpi/x86/utils.c:206 the bare one for "did not match".
> 
> On this machine adev is INTC10CF, which is not in cvs_acpi_ids[], so the
> early return is taken, the IPU6 probe fails with -ENODEV and is retried
> once the IVSC device exists. With the polarity you read, IVSC would fall
> through to the lookup that returns the driverless INTC10CF:00 platform
> device and the camera would stay dead. It does come up, so the code
> behaves as the changelog describes.
> 
> That said, you had to stop and ask, which says enough about how it reads.
> v2 wraps the match in a named helper so the polarity is visible at the
> call site:
> 
>   static bool ipu_bridge_is_cvs_dev(struct acpi_device *adev)
>   {
>           return !acpi_match_device_ids(adev, cvs_acpi_ids);
>   }
> 
>   if (!ipu_bridge_is_cvs_dev(adev))
>           return NULL;
> 
> No functional change, so I rebuilt it but did not boot it again; the
> functional test in v1 stands:
> 
>   https://lore.kernel.org/linux-media/20260902145440.1786297-1-gvozdoder@gmail.com/
> 
> Thanks for the quick review.

-- 
Kidn regards,

Sakari Ailus
