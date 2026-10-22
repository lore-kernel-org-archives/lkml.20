Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792645079;
	b=gAXzovvPluSLBGdqnANgccpqQDEchmeNnvQW5Kh1iGO8SwIJ1EQimShf+/wmjz2034wq
	 t3CnCUD7xBfaoMw7fTAtbnM5AYez+lRIa9DwvDoZcEaZkCSzElbcmngvPhzUc8Gd0pGni
	 ZlJ43B5N2LofaAK0bhMfwaQ15AN0BYrlOiX5wEUdKRWnwBtP+q12SgJ00GAz/aEOQh6c/
	 7IkfC20Y9KeXh2KY1Wg+9kAltHTCkE1ICAdK9R3DhLcKCJqCSvqC4rLUTnFAJKI0EWtAw
	 2kxzGGjfvCkKBD9EqlHm1rU+86euMPwcxibfdGF8VeVSIIG++AWYcd50oNNV3St20yQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792645079;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=zPV1TmNihZ9vuu5Uln4KZBCBepQo8N21qCTuq9N/eYw=;
	b=AaczbdLh0JwhQsbXPx7J8n0D3Eu0p7BSc2FjmmmJQL/+uYfbT5v8dmaxkxFZzMLwIKNb
	 Kq4bsisq3T/UzPtcmWZ8Z7B3BHodMLi4qrpb8YCe8q8L1B5we8lxzkqOx+TQEYyp+1P0G
	 vitl8EnnyvEzPeHdYOJ0K2Gis0aFexrEZTl+n4ww76t8qF8aCUaxlEBMoVhnZaOrzSID2
	 IRMoKYA2Mka2Ert4SjjlPtoMfHJk8iTtXZR7FanmiX8iBSHhSQkiBeYb0DUDXXHNdvaCZ
	 WJGWhd/LaNrsUM+gZBIibShOOgd7fXXU/LOKqT6cwkrTLyjQs0sc9dChhtYM2F1ZA7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NOGiE3Bv;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2234606A319
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:57:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2234606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NOGiE3Bv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792645078; x=1824181078;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=isppv1xTXdNP/4TfCeQbqEVFRaEztMtqsCLK9b6PaxY=;
  b=NOGiE3BvA+n5bfIYpZBEvnkVVG82SOubRZfJuFOAXcgJ74IVW9suISgR
   K8ZPCfAAnL3MInezU1jJ2/p9qa2CZ8pTtNkTdvSCjlEOKCpcsVXzEZogD
   qTM3iFEi5e9n1Com0XbYKXd5L/lUBlnx/pANbA0WUPjXjixRk/8zPcPqo
   Wqoew39zOG2PKEICnSCu3chUybiiueDv8ORAfCbUVQJnVvOUs+Xkblgbl
   CLy5KALno8yRPz8Mb61tKIcX1sM34I13HASHEjw1Ux73WliUdst/NPs73
   BruZxBA2fXnmez9XoNe7dQi4/VakHKenNMhAIPkDwZ3IAXMT8IUZYbMbx
   Q==;
X-CSE-ConnectionGUID: wXeuj2LPR6C74dVHNENm1g==
X-CSE-MsgGUID: jbXxmJNZTOSA1amjMEvtTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1272138"
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="1272138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 21:57:57 -0700
X-CSE-ConnectionGUID: moMuYjncR8ygDz/QZ10czA==
X-CSE-MsgGUID: NSix6fBMQS+UOYJ+2vEHOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,171,1787036400"; 
   d="scan'208";a="3337212"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 21 Oct 2026 21:57:54 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id BA63999; Thu, 22 Oct 2026 06:57:53 +0200 (CEST)
Date: Thu, 22 Oct 2026 06:57:53 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Navon John Lukose <navonjohnlukose@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Lee Jones <lee@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	mfd@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mfd: intel-lpss: Set d3hot_delay to 0
Message-ID: <20261022045753.GB158991@black.igk.intel.com>
References: <20261022040453.45797-1-navonjohnlukose@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261022040453.45797-1-navonjohnlukose@gmail.com>

On Thu, Oct 22, 2026 at 09:34:53AM +0530, Navon John Lukose wrote:
> intel-lpss-pci already clears d3cold_delay, but every runtime resume of an
> LPSS controller still sleeps the default 10 ms d3hot_delay in
> pci_power_up().
> 
> The PCI spec asks for those 10 ms on D3hot->D0. Mika pointed out that the
> LPSS controllers are not really PCI-connected devices, so the delay is
> likely not needed. quirk_remove_d3hot_delay() drops it on several older
> Intel chipsets, Cherry Trail among them, and commit 815b4448198f ("i3c:
> mipi-i3c-hci-pci: Set d3hot_delay to 0 for Intel controllers") does the
> same for the Intel I3C controllers.
> 
> Nothing misbehaves with the delay in place, so this only shortens resume.
> On Arrow Lake-H (Lenovo Yoga Pro 7 14IAH10) the touchpad's I2C controller
> autosuspends after 1 s idle, and the first report afterwards waits for the
> resume. With d3hot_delay set to 0 the i2c-hid interrupt handler for that
> report takes 1.1-1.9 ms instead of 12.6-14.4 ms, with no I2C errors. Only
> Arrow Lake-H was tested.
> 
> Signed-off-by: Navon John Lukose <navonjohnlukose@gmail.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
