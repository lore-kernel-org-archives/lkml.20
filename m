Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2F6448B87;
	Mon, 14 Sep 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789394804; cv=none; b=IiTiGKRL1z38LqAtEMlXpFtxjui+nNsjoYxqfjKQ2zQtB1BEJzHMZDYuzIMcaBD5Gw7bvj/pGHKWJ6obz5/ZHdvHtVVZsuYA6SZ5Z5c23q+fN/aFg41xY6mmou/md2AlY7u+kHaYM/LJBuzADucEKElyGG7+Jf0LpZMw2fUS5Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789394804; c=relaxed/simple;
	bh=B9uJJDIixRKp+LUY+fl1LfejnACSIFX8t3ukniGGiqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oNQdfstuWvlujn3YPlnLLwebn0+QxnWZ362moUf3eeEsizSrEBRLLYNV946+rTmQirV6THFjvfjUA/rZcO4OrkRVlt8qf6pWK+ZCRtd/qikGiM/nGfnmisrYUuEOky0qbAkV/cm+RUcNveBAkbdiJw+ZXnSZuxoXwJbc2bzuHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xy4JvyJV; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xy4JvyJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789394802; x=1820930802;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=B9uJJDIixRKp+LUY+fl1LfejnACSIFX8t3ukniGGiqw=;
  b=Xy4JvyJVPImd3PPc/61mARqBps0Chky+rJQNZZWJaABPZwaP0U+agdVd
   ex5yf0MZto3FAao0+h8SeUqq7IdXh+e+5WY1x2YhIoKzICS+nrjQkPTL5
   C/iHVrHihk879z6+5//DLfhPZRS3yV3ERf076UIsAFOndxOBHtu/hR1Pg
   7RG5bDRqfD87dLaJWhIuDhIGNcnUe37lg3Zr9kDknVglhZy8b3KD5xVso
   v3jC4X6LsmP5NgJ4Jh3e6MqKAwM36ryeQuMS/RKjTfodkLNNi6DFp1Jkk
   fAufbHtEp47F6YKgbwrnP2/VL8IHpno8Z9LBiMtYCJ3EvXLaPzR1jCn/y
   w==;
X-CSE-ConnectionGUID: lFH7NEQfTyuG3W+7+2+yFw==
X-CSE-MsgGUID: t+8sLn/3RHauFhXFXL0Q3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11904"; a="93570622"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="93570622"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 07:06:41 -0700
X-CSE-ConnectionGUID: DXPsM1NpSF+4ueqH23DAGg==
X-CSE-MsgGUID: gdslVUqMS7mIu6yZFx0wOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="269371139"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO [10.245.245.60]) ([10.245.245.60])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2026 07:06:38 -0700
Message-ID: <9d326c6e-f033-495c-a5e1-dacb46ea7b73@linux.intel.com>
Date: Mon, 14 Sep 2026 17:06:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IOetlOWkjTogW1BBVENIXSB4aGNpOiBzaWRlYmFuZDogY2hlY2sg?=
 =?UTF-8?Q?vdev_liveness_before_removing_endpoints_on_unregister?=
To: =?UTF-8?B?6IOh6L+e5Yuk?= <hulianqin@vivo.com>,
 Michal Pecio <michal.pecio@gmail.com>
Cc: Selvarasu Ganesan <selvarasu.g@samsung.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "quic_wcheng@quicinc.com" <quic_wcheng@quicinc.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "cpgs@samsung.com" <cpgs@samsung.com>,
 "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>,
 "thiagu.r@samsung.com" <thiagu.r@samsung.com>,
 Niklas Neronin <niklas.neronin@linux.intel.com>
References: <TYUPR06MB6217000B59003EDF233D7246D2B22@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <CGME20260910101324epcas5p1faf6f82de85c9468f42f6f9b2f13e99b@epcas5p1.samsung.com>
 <c17e0351-d390-4a40-89c4-51d4be9f0123@linux.intel.com>
 <360067785.01789039502721.JavaMail.epsvc@epcpadp1new>
 <TYUPR06MB62172308C897F81F7DAFF557D2BF2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <750468423.101789103583573.JavaMail.epsvc@epcpadp2new>
 <TYUPR06MB6217F0788C14DD89D237C807D2BE2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <937773018.41789116303608.JavaMail.epsvc@epcpadp1new>
 <191ee5d5-d93d-4fa3-9654-b3735d344118@linux.intel.com>
 <20260912141837.06b2f3cf.michal.pecio@gmail.com>
 <TYUPR06MB62174110FB101AD6B7B069EBD2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <20260914110949.38a46596.michal.pecio@gmail.com>
 <TYUPR06MB62170DB4AB23F7A79E8DA466D2BB2@TYUPR06MB6217.apcprd06.prod.outlook.com>
 <c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
Content-Language: en-US
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <c6c9890f-46d8-42f1-a7e7-8a5d551fa22c@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


>> 2. Add a sideband callback in xhci_free_virt_device() for defense
>>      in depth.
> 
> Selvarasu Ganesan pointed out that xhci 'core' in fact doesn't include
> xhci-sideband.h yet. If possible I'd like to keep it that way.
> 
> Setting xhci->sideband->vdev to NULL, or calling a callback here changes this
> and is the first time we then intertwine xhci core with sideband.
> 

Disregard the above, I forgot about the xhci_sideband_notify_ep_ring_free() call
in xhci_discover_or_reset_device().

Rest of comment is still valid.

Thanks
Mathias

