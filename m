Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710127;
	b=lN5RNZ6p/FopfSajo2wNaBUgH0hVDDiT2aXCLKUDanXQC7/f3QW44Mcgp5q+inZX8yJj
	 lXzqEEyW/B7RiPXEP2PDpOxqN976RvVuBuPS/3B8a/NGSPW4ZLSId2TWo8KFDNa6tuyRI
	 c5ZeKe7KQFPWcNfFTLwuPZ1UZlnwehAnyNw6OgT3Zxe6r088MLCuvK3TaLpjM8okmwEF8
	 9X5gNEuzxzrRU4jDzvHARduwMG2itbCb8aRSy+LfZmMrJiq0eWzfTnSkRmrcZdAlNNviN
	 XIb7+G4r+OSMkwpKaEc+0XF/M0fleTzQ3y4v1MyRIEOhVM0li/jiwdkopElMJd+1wow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710127;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=DvLrEwFnnOMt3PTsnR8P7yQJiGzTT/5N3IGwtm50AhM=;
	b=oVwJl1zzR/v44eV2ELQKZgvJkbW9Ugb8pbjjmH68ec4/p66rZux4jiHV957+YRsVjc0A
	 yNOPDzjld9D/33IBjD+7pBT4NveOVR/dVTpM9sXGVaFlUN572fiSbPVYK0bMfMvKM4AIo
	 liLrEN+PFRZsSPUBszi/Zv2jJtBL65ga6DfaEMFxkd13nxVX9R5oWhQGlLvST5WJ6yw08
	 +y3/JYUs2W4tHc6Yfzx4EQDh42DQ/iE7t2wRbtP9HXYQzuMakTFCmec8P4q4NeKGilTTh
	 QXw8j6XvTBfEUaNPiaorzPwBHMnnrT0ZPGWeyqigu9RZqieehrm5LNOhJcYa0u2y52w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EANK6Cek;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58E49606A33B;
	Tue,  3 Nov 2026 12:48:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58E49606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EANK6Cek
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793710126; x=1825246126;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=szLErHR8O0Xef4JCXJ3dLezPIj9VfgU7oaY9Ib/XukA=;
  b=EANK6CekWf7xBsrZXeQv7BTa24pnOQk5dvnNlFRoOe2Gct7vyflypTn0
   dtyvQaSmMUvfCOxTfkgDNXtGdokk1yBiPvdmiRexPq1q32VWv8PaFc8ca
   nt7CGuxSPcDSM2YZY2x1XAgBhq3j0Byo5HMb8dRu8usz8+GDQh1TpHdhu
   2uI0Hv5iTWLjx3Fk9qG2MUC3wvlznbj+WUi8Ey595Nk73rYvq9oVhI9yf
   D9MzFVhN++dBYvsdEE06Fdi17ZkQHYx7gkS6dJBtv10Q4O72rFT80tTEh
   o5qnyQgJXQfOPsuuPF50/lLQi+xQdi9DDPeCr3bWJc+zcRxUXryalFq/P
   w==;
X-CSE-ConnectionGUID: Pgr2Nsn/Q0aaNbwiCjeqBA==
X-CSE-MsgGUID: Z5uqM7PyTJOlHpotgYFAAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2523720"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2523720"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 04:48:45 -0800
X-CSE-ConnectionGUID: W54yryuwSc6+vAc5NpYeHw==
X-CSE-MsgGUID: Oha4hgXqS9Kbdg4gTOflHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6953453"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 03 Nov 2026 04:48:43 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 21F9A99; Tue, 03 Nov 2026 13:48:42 +0100 (CET)
Date: Tue, 3 Nov 2026 13:48:42 +0100
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
Subject: Re: [PATCH 4/4] thunderbolt: prevent pcie tunnel activation/teardown
 warnings
Message-ID: <20261103124842.GA158991@black.igk.intel.com>
References: <20261030082539.1208733-1-chunfeng.yun@mediatek.com>
 <20261030082539.1208733-5-chunfeng.yun@mediatek.com>
 <20261030085628.GS158991@black.igk.intel.com>
 <82f1a3227685b241938ccb500b97d1e73212bf36.camel@mediatek.com>
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
In-Reply-To: <82f1a3227685b241938ccb500b97d1e73212bf36.camel@mediatek.com>

Hi,

On Tue, Nov 03, 2026 at 08:33:51AM +0000, Chunfeng Yun (云春峰) wrote:
> On Fri, 2026-10-30 at 09:56 +0100, Mika Westerberg wrote:
> > On Fri, Oct 30, 2026 at 04:25:39PM +0800, Chunfeng Yun wrote:
> > > When usb4 enter sleep mode, echo 1 to authorized of sysfile,
> > > will wakeup usb4 driver, but fail to create pcie tunnel, cause
> > > the warning due to a race condition between switch disconnect
> > 
> > It's router
> will modify it.
> 
> > 
> > > during resume and user authorization
> [  278.831186] usb4_hi NVDA8100:00: 0:1: is unplugged (state: 7),
> retrying...
> [  278.943031] usb4_hi NVDA8100:00: 0:1: failed to reach state
> TB_PORT_UP. Ignoring port...
> [  278.951125] usb4_hi NVDA8100:00: 0:1: lost during suspend,
> disconnecting
> [  278.957819] usb4_hi NVDA8100:00: 0:4 <-> 1:16 (USB3): deactivating
> [  278.964794] usb4_hi NVDA8100:00: deactivating USB3 Down path from
> 0:4 to 1:16
> [  278.972737] usb4_hi NVDA8100:00: deactivating USB3 Up path from 1:16
> to 0:4
> [  278.980504] usb4_hi NVDA8100:00: 0: TMU: mode change off -> bi-
> directional, HiFi requested
> [  278.991265] usb4_hi NVDA8100:00: 0: TMU: mode set to: bi-
> directional, HiFi
> [  278.999511] usb4_hi NVDA8100:00: 0:1: total credits changed 66 -> 66
> [  279.006408] usb4_hi NVDA8100:00: 1: link width set to symmetric,
> dual lanes
> [  279.013763] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activating
> [  279.019587] usb4_hi NVDA8100:00: activating PCIe Down path from 0:7
> to 1:9
> [  279.026468] usb4_hi NVDA8100:00: 1:1: Writing hop 1
> [  279.031335] usb4_hi NVDA8100:00: 1:1:  In HopID: 8 => Out port: 9
> Out HopID: 8
> [  279.038546] usb4_hi NVDA8100:00: 1:1:   Weight: 1 Priority: 3
> Credits: 32 Drop: 0 PM: 0
> [  279.046536] usb4_hi NVDA8100:00: 1:1:    Counter enabled: 0 Counter
> index: 2047
> [  279.053834] usb4_hi NVDA8100:00: 1:1:   Flow Control (In/Eg): 1/0
> Shared Buffer (In/Eg): 0/0
> [  279.062259] usb4_hi NVDA8100:00: 1:1:   Unknown1: 0x0 Unknown2: 0x0
> Unknown3: 0x0
> [  279.069730] ------------[ cut here ]------------
> [  279.074335] usb4_hi NVDA8100:00: PCIe Down path activation failed
> [  279.080426] WARNING: CPU: 5 PID: 2433 at
> drivers/thunderbolt/path.c:587 tb_path_activate+0x1a4/0x5b0
> ...
> [  279.220285] Call trace:
> [  279.222722]  tb_path_activate+0x1a4/0x5b0 (P)
> [  279.227068]  tb_tunnel_activate+0x140/0x498
> [  279.231241]  tb_tunnel_pci+0x180/0x490
> [  279.234980]  tb_domain_approve_switch+0x74/0xb0
> [  279.239500]  authorized_store+0x214/0x270
> [  279.243498]  dev_attr_store+0x20/0x70
> ...
> [  279.288888] ---[ end trace 0000000000000000 ]---
> [  279.293497] usb4_hi NVDA8100:00: 0:7 <-> 1:9 (PCI): activation
> failed
> 
> 
> root cause:
> 
> The warning were caused by a race condition between switch disconnect
> during resume and user authorization:
> 
>    1. While the system was in runtime suspend, userspace executed:
> 
>        echo 1 > /sys/bus/thunderbolt/devices/0-1/authorized
>    2. Writing to this sysfs attribute woke up the USB4 controller
> (nhi_runtime_resume).
>    3. During resume, the downstream port 0:1 failed to complete link
> training within the timeout and was declared lost:

Okay we get the warning but the bigger problem here is that why the link
does not come up anymore? Unless you unplugged the router as well.
