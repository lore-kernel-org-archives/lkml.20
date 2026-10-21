Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792621344;
	b=mavfFRSdLQz58wHrS1MNKst2yX3hDZgtX4FodA7CqrSJGlnRTKApK3C7EnQJXQPWW14w
	 3qNQOHLEpQ4ri9TJzHuHxdY9Gj/hZ2M9drax7nSVrUnvtkQp9M2T8Z5Fl1EP/qUQoDyMh
	 XIRy1n17MCQA76JNP6Fj/+y2DpOmcexoY+qfm9kJXvNAUUFmv5C2Q5iMnc7QgNhp2tP/R
	 3DAwlGPkpKjVJhKluAfslANQb0NOw7VGKSW3Uz1N+H0MJDt9P9OoCMvFV1difNeewbLtc
	 E5demmwimFfOrIl4Aodov9gqEZ1/dYhLTnBAFCEkuHUWnglFcxxrhbZqQPdSHoxU7Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792621344;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fiUM6JnMHmA5Ov/xErJ0AuJ15Kfyu9ttUsUZNXK5l38=;
	b=FHCDbNqjw4p2QXDoZKRqB8pFXNIqKJ0cekIqI0g07YHw5yX9i1E+HOvPOJCCQZNajnjf
	 2GhH9+rjgdHOMP+e+oE4C8+gkE2wUgeGCRJysv55wqw/5oNY96RK9hBAgD75F8Mbpp9ae
	 Dd+rvup9XBHoZekwVq7B7CUBkgmUqb7Uf/BtYnSaE2uOusH+QpKw7l8iPeEhI/2M/jlwO
	 Sdz1D9XFyzxB6NnOonbUYWfO+OKIsUIbPJGU+nVhSjd/cCaVIHORg6C3fq4rW5rLgMLle
	 2MY/LfJzzpGanEYSSFnhR4+/EpdxUEpOpYUiCDQuAylDgP3YpyInaFSmernpDdhJH5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKEmHpaZ;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52EED606A322;
	Wed, 21 Oct 2026 22:22:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52EED606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cKEmHpaZ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792621343; x=1824157343;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rPUtyuFnWu82Z984Cm8dRmoMlFt8wbeuLLGVVyrRq0o=;
  b=cKEmHpaZAKll5ufRzLNbx8vm9dLyATaoh+4zoO5lEvRwSyFifsB5myjG
   BfYgR9YwPovf+b3wvCckH9nxhyVz0e92Jbcmes6d2C+pUwDv+kju3perM
   fwO/twEYqL4MZKrM6OLacdc271eL1z/5FsQW4NkRCJhvbXZQW3KCLontU
   5ao8WD62uVFySHNiyF85Mgna5sdZYaCTVRkMDRUlZhbL01ZBrLtbgnqKt
   vsVX36kolWEPkn7FGhT+o1ju2HkJA+dtI8ROhBSqwP+PdKFqdPFJfup8O
   +ZZALEuJ9FkoO1OV9CeSspHlr/cVJOp+YKmu5AadCMFeb7iDtkgjXDKgV
   Q==;
X-CSE-ConnectionGUID: 202Bar4aRBulGHiWzjFgZg==
X-CSE-MsgGUID: WlSygMDEQCixWwklwGkVLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1373155"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1373155"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 15:22:22 -0700
X-CSE-ConnectionGUID: jERSXTrpQ4mmahGGAlw3dw==
X-CSE-MsgGUID: Fu/9SPr7QIiN0bURyZL7vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3258258"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 21 Oct 2026 15:22:20 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJehM-00000000Q94-2Qb6;
	Wed, 21 Oct 2026 22:22:16 +0000
Date: Thu, 22 Oct 2026 06:22:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Yongjun <jun85566@gmail.com>, stern@rowland.harvard.edu,
	gregkh@linuxfoundation.org
Cc: oe-kbuild-all@lists.linux.dev, digidietze@draisberghof.de,
	xiehongyu1@kylinos.cn, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net, linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	syzbot+7317196294d50d6e55c3@syzkaller.appspotmail.com,
	Lee Yongjun <jun85566@gmail.com>
Subject: Re: [PATCH v2] usb-storage: option_ms: bound probe-time bulk
 transfers
Message-ID: <202610220624.5aofbefV-lkp@intel.com>
References: <20261021081616.89976-1-jun85566@gmail.com>
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
In-Reply-To: <20261021081616.89976-1-jun85566@gmail.com>

Hi Lee,

kernel test robot noticed the following build errors:

[auto build test ERROR on usb/usb-testing]
[also build test ERROR on usb/usb-next usb/usb-linus linus/master v7.3 next-20261020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lee-Yongjun/usb-storage-option_ms-bound-probe-time-bulk-transfers/20261021-171616
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20261021081616.89976-1-jun85566%40gmail.com
patch subject: [PATCH v2] usb-storage: option_ms: bound probe-time bulk transfers
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20261022/202610220624.5aofbefV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261022/202610220624.5aofbefV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610220624.5aofbefV-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/usb/storage/option_ms.c: In function 'option_rezero':
>> drivers/usb/storage/option_ms.c:49:18: error: implicit declaration of function 'usb_stor_bulk_transfer_buf_timeout'; did you mean 'usb_stor_bulk_transfer_buf'? [-Wimplicit-function-declaration]
      49 |         result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                  usb_stor_bulk_transfer_buf


vim +49 drivers/usb/storage/option_ms.c

    30	
    31	static int option_rezero(struct us_data *us)
    32	{
    33		static const unsigned char rezero_msg[] = {
    34		  0x55, 0x53, 0x42, 0x43, 0x78, 0x56, 0x34, 0x12,
    35		  0x01, 0x00, 0x00, 0x00, 0x80, 0x00, 0x06, 0x01,
    36		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
    37		  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
    38		};
    39		char *buffer;
    40		int result;
    41	
    42		usb_stor_dbg(us, "Option MS: %s\n", "DEVICE MODE SWITCH");
    43	
    44		buffer = kzalloc(RESPONSE_LEN, GFP_KERNEL);
    45		if (buffer == NULL)
    46			return USB_STOR_TRANSPORT_ERROR;
    47	
    48		memcpy(buffer, rezero_msg, sizeof(rezero_msg));
  > 49		result = usb_stor_bulk_transfer_buf_timeout(us, us->send_bulk_pipe,
    50							    buffer, sizeof(rezero_msg), NULL,
    51							    OPTION_MS_PROBE_TIMEOUT);
    52		if (result != USB_STOR_XFER_GOOD) {
    53			result = USB_STOR_XFER_ERROR;
    54			goto out;
    55		}
    56	
    57		/*
    58		 * Some of the devices need to be asked for a response, but we don't
    59		 * care what that response is.
    60		 */
    61		usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
    62						   buffer, RESPONSE_LEN, NULL,
    63						   OPTION_MS_PROBE_TIMEOUT);
    64	
    65		/* Read the CSW */
    66		usb_stor_bulk_transfer_buf_timeout(us, us->recv_bulk_pipe,
    67						   buffer, 13, NULL,
    68						   OPTION_MS_PROBE_TIMEOUT);
    69	
    70		result = USB_STOR_XFER_GOOD;
    71	
    72	out:
    73		kfree(buffer);
    74		return result;
    75	}
    76	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
