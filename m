Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793707186;
	b=xUjHIgYg2Xi5fYBX0u+w0N3JDJRqyA2nD3p2xQO1INZD8US4F1u8/0eWwAgrMakWfOMh
	 be7Cg+S4gccqzEtPgK0f/xEiWr2pyJofM0p0ojCJrW12kOhHaX02zVE2Twxt08FuAJ2/z
	 3fOzQJ2w66HDPS3l4rxkqC+mAomT9sH+UsvUtMSUChz3S9eKpy8G937tF+BMdvYhwjdrP
	 p90mbbK1JZC/dB1AgthroKvnR11+wp4DxDdPUO0DkKjVkz+B3fnbxSRV5E/nGfn1uc7AP
	 t6SNLJWV0UR/XMpFRS5hh0dzY+CBbXTSTkNF4HfVsbXPJ76z4JD6ktAJIsRrDzG2clA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793707186;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=NBtYdfJ9FACFqGH8pymCzLh+8VMN+8KU9nb8NqUMw3U=;
	b=cZt6iBztrgGijhKFI8vRj9OPdmnfPH9ZLPu6u0cXrcIsXn3ZtdUHfrQKQlqg0OvBlS3S
	 iEUrGcfe+mTWcGP5UXQbUudRLJQlXmJ0s0/2x5/yUxh16e1zYJkduTdUspYs3fDrX5ZGc
	 wYybz3YhHzlCVuQ1qPvFM6dHIybVzKA8VYAGSgeGxoN7y0AJsLqdyYSHUJ8Asp5SUNGP0
	 Q/pRqmT3WaXICggdh36JhnRT8K9IwPLXA5E4S4AjXg9TSmDWj713enbJGTHmEDuodOiLs
	 yWrKe6b9D+aghAVYKMLiw0MN5/7vmyCzZWNQPFA+Tfqw3ycxdjsB6OPaUVB1gnv8ysg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ch09Q+nd;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746E6606A324;
	Tue,  3 Nov 2026 11:59:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 746E6606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ch09Q+nd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793707187; x=1825243187;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=ve/7VngWp5nu6ma8xxZ/WNVYXekDw3Wkhfvgu/iaSog=;
  b=Ch09Q+ndunaztv7p4ciznCZudjl7Z1MvcTuJ6eZDBnYTUsadkb2xUF3l
   owI/BC+vN/C4VC0Okbqp2E3X9gJs7K0mGs4RbPe0QwnZrvbPjoJy5GaI7
   8v7WFH02Z/+cL5N8QUSa/ZzS4uXEM1FwTyJfscK3pBbqpbYypCIdjZWIY
   NoIENPnwwjTp4pfMJd+yjvAHDhepprJjOQzjtQiQq7ErEXbdJUOYGJpZ6
   hZIVAGbuDOZsHBMMPvpg5EauEqT4PHvYHxNdM/GaaYMam9oqQGhVbgSHo
   6P8t+UHbzYqHfyIES2octGsIZ5JkAZwIKSJVqJSk044JN6evmBuEjZ2E0
   g==;
X-CSE-ConnectionGUID: +OFyoopaQReTY8Kf4D7mFw==
X-CSE-MsgGUID: 3z1Rq7KDRcq2u1GxgEmivQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2437481"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2437481"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:59:46 -0800
X-CSE-ConnectionGUID: iNmx9fryS6+inCdn210jIw==
X-CSE-MsgGUID: bZp7h2NoSpe3HSWvbAyx4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="8253818"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa013.fm.intel.com with ESMTP; 03 Nov 2026 03:59:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 6388099; Tue, 03 Nov 2026 12:59:42 +0100 (CET)
Date: Tue, 3 Nov 2026 12:59:42 +0100
From: "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>
To: Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"westeri@kernel.org" <westeri@kernel.org>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	"YehezkelShB@gmail.com" <YehezkelShB@gmail.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"andreas.noever@gmail.com" <andreas.noever@gmail.com>,
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH 2/4] thunderbolt: add support optional dedicated wakeup
 irq
Message-ID: <20261103115942.GZ158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-3-chunfeng.yun@mediatek.com>
 <20261030084854.GQ158991@black.igk.intel.com>
 <34de87bb4da20626d440346f9aa0cf7873ef85d1.camel@mediatek.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <34de87bb4da20626d440346f9aa0cf7873ef85d1.camel@mediatek.com>

Hi,

On Tue, Nov 03, 2026 at 09:05:45AM +0000, Chunfeng Yun (云春峰) wrote:
> On Fri, 2026-10-30 at 09:48 +0100, Mika Westerberg wrote:
> > On Fri, Oct 30, 2026 at 04:25:37PM +0800, Chunfeng Yun wrote:
> > > There is a dedicated wakeup irq on nvidia n1/n2 SoCs.
> > 
> > Okay but why it is needed?
> due to mac/phy is in power domain which its power/clock will be turn
> off when enter into sleep mode, so can not use the mac's irq to trigger
> wakeup signal, instead add a dedicated irq to send wake signal which
> stay in always-on power domain.
>
> >  Can you add this to the commit message?
> OK, will add more info
> 
> > 
> > And why you did not add it already in the first commit that added the
> > platform driver there anyway?
> OK.
> because I test base funtion first, then support suspend/resume

It's fine to test it how you like but split the patches logically when you
submit upstream, and this one belongs to the first patch IMHO.
