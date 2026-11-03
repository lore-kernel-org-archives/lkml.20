Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727987;
	b=c+di3jEpc4s1TICpwNoZngOo4blLyvTTqmc+/FWr1aQesSDEZq3zXNg2OOsGq1EcJwE0
	 frEPL1jeWbzEqt+hLQguSy4V7qwUeklnwFItN4pPmPVuxIJZgfDi8Ab9QydpNSKiRcEp4
	 QC0umuOWbvEyQUU64sQRhrrgNBhC4qhEFV/wIA+o9lukgIDs45xK4PEwbDCO5YYAdTxf9
	 mqqiEQv4/2RMax1DvEfKts45Tr2f19+sA+A5+MrkkgfXOE8KLI5zii0OK9+59H6Yc8Kep
	 A3Fi9p2XpYu28LZQezYRd7Kt5ObRaxjm7y2gryKeVrE7e+LeqxiiqomJLDQVCxTZ9hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727987;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=IiKd0KuG8ORFbrnw7anLcQYLmOyD+VI3jj8P2pmg9a4=;
	b=kyDPykySTLV81HMoFYhEbmw6GEtjku7ni3cXVrz5Fg7dhguyh5J7DKYwK5H/RSNxSHtk
	 PcbBdVlZKmm2qrsxFU4MUY0pHP/kLJFqDWye2z2OdvtPgug4k93UlHLixrxv3eObwlwXT
	 Z1VkVkBU7GY8lWHUhdIY1ylDbUSOyVAUgYky6EGQuHO2V7rmn36Vi1BzWd+mFkt5McFye
	 FQfaYglA7lOpNiOOITSU5QmjRD+HJE4KPa+dgnJiE9qDqhWnb14z/mLThvFF/8PDhdENB
	 2e5WG/q4fBZAlpu8gVrA4P5g2aYAAu7L2TGqIXMv/vEGsMqxIgkockvBT64bYgWzZyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7XlZzyG;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7AB606A31B;
	Tue,  3 Nov 2026 17:46:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A7AB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=H7XlZzyG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793727986; x=1825263986;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/1P7VenxTj8Ms50SIYZh25JmBfbf4CzHTpdj53W9VKI=;
  b=H7XlZzyG5D8Tmpt48w6aS3pwM0mT5LESFPkOaUmCaVoSwd/it8NpO2nd
   IZg7yEJi90si/HOZVIzC8tXlpo7GaCpoy/Q+uVuosrHMF7C70TtsyfABy
   0vHKfPG79cmXShmWQJk0V6EXAh4gzSlPJmVqGhSYdW7P+tFho1pcNvt8f
   K64DzNvoYqOQz3KWCTvG0ge4ksVMjkMYK+rwCxhPXmJA6Q2hnaTFHiPDl
   i6tS4EYEjKD7dnSe35syLD5L5RXUTWAtSOXH/41Oue3TPvP+gjNlQIBR7
   i3g2nDUpvVu+CqNTEkd/5gbhdKREl+nGoCGePSbIoXHoUzSJVk4IToCTT
   w==;
X-CSE-ConnectionGUID: JCYrav9SSK6HnEF7rJdTYA==
X-CSE-MsgGUID: y5Zlg3Q0SCeKv0L4gl6PRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2374160"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2374160"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:39:41 -0800
X-CSE-ConnectionGUID: XUAjOe80Sr6jLtFqm+e+vw==
X-CSE-MsgGUID: 33FvTl2STtmU2hf2GP89ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6813279"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 09:39:38 -0800
Date: Tue, 3 Nov 2026 19:39:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Baojun Xu <baojun.xu@ti.com>
Cc: broonie@kernel.org, tiwai@suse.de, 13916275206@139.com,
	alsa-devel@alsa-project.org, shenghao-ding@ti.com,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	k-yi@ti.com, henry.lo@ti.com, robinchen@ti.com, niranjan.hy@ti.com,
	pin-hao.huang@hp.com, Syed.SabaKareem@amd.com
Subject: Re: [PATCH v1] ASoC: tas2783-sdw: Add basic BPT support
Message-ID: <auocWKMYhLlqGF8S@ashevche-desk.local>
References: <20261103133853.1612-1-baojun.xu@ti.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103133853.1612-1-baojun.xu@ti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 09:38:53PM +0800, Baojun Xu wrote:
> Add for BPT supported.

...

> +enum {
> +	SDW_MSG_FLAG_READ = 0,
> +	SDW_MSG_FLAG_WRITE,

Is it going to HW? If not, drop duplicate assignment. Otherwise assign *all* of
the enum to make code robust against modifications.

> +};

...

> +static int tas2783_fw_download_bpt(struct tas2783_prv *tas_dev,
> +				   const struct firmware *fmw)
> +{
> +	struct sdw_slave *slave = tas_dev->sdw_peripheral;
> +	struct sdw_bpt_section *sections = NULL;
> +	struct sdw_bus *bus = slave->bus;
> +	struct sdw_bpt_msg msg = {0};

'0' is not required.

> +	struct tas_fw_file file;
> +	struct tas_fw_hdr hdr;
> +	size_t offset = FW_DL_OFFSET;
> +	size_t img_sz = fmw->size;
> +	const u8 *buf = fmw->data;
> +	int num_sections = 0;
> +	int i, ret;
> +
> +	if (img_sz < FW_DL_OFFSET)
> +		return -EINVAL;
> +
> +	tas_fw_read_hdr(buf, &hdr);
> +	if (hdr.size != img_sz)
> +		return -EINVAL;
> +
> +	while (offset < (img_sz - FW_FL_HDR)) {
> +		size_t adv = (size_t)tas_fw_get_next_file(&buf[offset], &file);
> +
> +		/*
> +		 * Reject a section whose payload runs past the image. Compare
> +		 * file.length (not adv) against the space left after this
> +		 * section's header, so the check is immune to the size_t wrap
> +		 * in tas_fw_get_next_file() on 32-bit kernels.
> +		 */
> +		if (file.length > img_sz - offset - FW_FL_HDR) {
> +			dev_err(tas_dev->dev,
> +				"Firmware section at offset %zu exceeded.\n",
> +				offset);
> +			return -EINVAL;
> +		}
> +		if (num_sections >= TAS2783_MAX_FW_SECTIONS) {
> +			dev_err(tas_dev->dev,
> +				"BPT fw has too many sections (max %d)\n",
> +				TAS2783_MAX_FW_SECTIONS);
> +			return -EINVAL;
> +		}
> +		offset += adv;
> +		num_sections++;
> +	}
> +
> +	if (num_sections == 0)
> +		return -EINVAL;
> +
> +	sections = kcalloc(num_sections, sizeof(*sections), GFP_KERNEL);

__free() ?

> +	if (!sections)
> +		return -ENOMEM;
> +
> +	offset = FW_DL_OFFSET;
> +	for (i = 0; i < num_sections && offset < (img_sz - FW_FL_HDR); i++) {

	for (int i = 0; i < num_sections && offset < (img_sz - FW_FL_HDR); i++) {

> +		size_t adv = (size_t)tas_fw_get_next_file(&buf[offset], &file);
> +
> +		sections[i].addr = file.dest_addr;
> +		sections[i].len = file.length;
> +		sections[i].buf = file.fw_data;
> +		offset += adv;
> +
> +		dev_dbg(tas_dev->dev, "BPT section %d: addr=0x%x len=%d",
> +			i, file.dest_addr, file.length);
> +	}
> +
> +	msg.sec = sections;
> +	msg.sections = num_sections;
> +	msg.dev_num = slave->dev_num;
> +	msg.flags = SDW_MSG_FLAG_WRITE;
> +
> +	dev_dbg(tas_dev->dev, "BPT starting: %d sections, dev_num=%d",
> +		num_sections, slave->dev_num);
> +
> +	ret = sdw_bpt_send_sync(bus, slave, &msg);

> +

Drop blank line.

> +	if (ret < 0)
> +		dev_err(tas_dev->dev, "BPT firmware download failed: %d", ret);
> +	else
> +		dev_dbg(tas_dev->dev,
> +			 "BPT firmware download complete: %d sections",
> +			 num_sections);
> +
> +	kfree(sections);
> +	return ret;
> +}

...

>  static s32 tas_io_init(struct device *dev, struct sdw_slave *slave)
>  {
>  	struct tas2783_prv *tas_dev = dev_get_drvdata(dev);
> +	uint val;

What is this? Use unsigned int or u32 or other better fit.

>  	s32 ret;
>  
>  	if (tas_dev->hw_init)
>  		return 0;

-- 
With Best Regards,
Andy Shevchenko


