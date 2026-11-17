Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794909568;
	b=y0Y0NAz7bVTF1XrAyu1x5+i3xTVwFlBPEXUqG6Mpg80agfafy9uVr4nz6GonS2IDqQiM
	 yvpRowTsTcqFXOzD2KfPLQ4B+IX8SKpajH89CKVdOCL94WQTODi2erixSHKclwjCC+kRz
	 RewVGsyPs3t55LTL11LU58HSckSmgru1yaK9Pw2oFoX0Ui6AwQLVpheODB//CxSBfHI85
	 4x7i377+l7kyshlDIGJVBoPgacOvystrLZX7Y+ksJSjOBPtH8ovXidf4Ldh8Q1U2HbWME
	 LpgxtYsvYrTD+Ghr3lTglWvWXPxvV0zSfOZjQFckO7Mb7I8y4YBzNyYqoXETnbptZzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794909568;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=8zZbd8HprYn1Gx9L/c5zzZhz/UL4N3JSwOynNmrXlS8=;
	b=g+1nrlGXfmMGsfFxiYcEYVYcNEQ/QoOKYOcYQApC6ReioKHoCsxttV3SPiImwvrUcmOM
	 KH5AgOKKPSz2MW6WkrFznOPAQJVzAuDwA8jaYp2cfYb7qrDd9Ka/tpKmGZvosHfVv+XKK
	 b+Vc8hQOSwmvZ39qbf0M/KKBZGiX0wFvo6u2OjKcj4TrI9Zod3MMYR3T7dbI82slcTImK
	 viaOyG84VRJof1m1P1XKfmtnTQdxgANcj0TpO7NaaIiimAuNOjHX0d/0Ds2p6pKGIuQML
	 YAsmgfKJcJzRrt2QATYTYXNRl5LCOlmtLfS+bHwcmTW6j6Hq1aW5VgIoJY0nXpU85AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xc71n182;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C03606A31C;
	Tue, 17 Nov 2026 09:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1C03606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xc71n182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794909568; x=1826445568;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=394icgQhJlL7b9H3q7KvlOMqRQNL6GRSY0PUFt3vTZY=;
  b=Xc71n182moqkzXmxXEZ3Ko3M6qwfnih28Oluke+r5muKCjVRLcanh3Zm
   +XjHvrf7M54sXWTYvphjJEQrEl4BTwW7gVOEeng6Ay+mVFx/8opkaVgP4
   rjemMryDWWyT7vpXCvN0D2K/NIk3CWNs1FURBpYyazV4GgSnPuhSiNnmq
   Sc9qCsNdRzRUfv7sX8syxtitNCreTg5SyAp41HbQZ1drBzRNGwi5wJNld
   JcU7n3my6qH5C3tc9rC0TcGoTcmniwTd+D5Z/y3VDF/GJEwmA3lhAchn2
   HNNnA7zg5R5Lt55Azenhw7qDXSwL6t5uTmgSUDnmR3tJJXU+QFJbAcBk4
   w==;
X-CSE-ConnectionGUID: NjPGESjHTDSeiPR2q0BZdQ==
X-CSE-MsgGUID: NMiKro9YQVKn9vt5NRrhUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3565593"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3565593"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:59:27 -0800
X-CSE-ConnectionGUID: CR51afUySkO2cS8pkj1UXw==
X-CSE-MsgGUID: /KoCMpUESQSPENjIbRplvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9585048"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO [10.245.244.50]) ([10.245.244.50])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:59:24 -0800
Message-ID: <54beec96-2221-4109-ab7a-74502969b369@linux.intel.com>
Date: Tue, 17 Nov 2026 11:59:22 +0200
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
Subject: Re: [PATCH v6 0/4] Add larger page size support for USB audio offload
 path
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20261109-16k_offload_v1_b4-v6-0-858c6e0e007d@oss.qualcomm.com>
 <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <a38e874c-4685-4892-81b4-a6aeeaaeddb4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi

>>
> 
> Hi Mathias,
> 
> Was wondering if this design looked a bit more acceptable?  Was able to figure out a way to achieve what you had suggested earlier mitigating the dma free problem I mentioned in my previous email.  If there are any issues w/ this please let me know.
> 
> Thanks
> Wesley Cheng

Big picture looks good
I got stuck on the "no_pool_rings[EP_CTX_PER_DEV]" solution in [PATCH v6 2/4].

It reveals and reminds me of how poorly designed existing xhci_free_dev() is.

I tried to quickly fix that fist by 'unlinking' vdev from xhci->devs[]
inside the lock, preventing it from being dereferenced based on slot_id
somewhere else, and then free it without the lock.

I ended up with a huge mess that rewrites vdev free/allocation,
slot enable/disable, xhci_discover_or_reset_device() and xhci_resume().

Seems like best solution for now is to add "no_pool_rings[]" to support the
larger page size, and then later rework the vdev allocation/free and
slot enabling/disabling. I'll take a look at the details of the series.

I also have another sideband change attempting to fix the use-after-free
stale vdev pointer in sideband. It basically swaps vdev to udev.
I'll post it on the list. Let me know your thoughts on it.

Thanks
Mathias
