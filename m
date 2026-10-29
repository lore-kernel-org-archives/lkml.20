Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793287580;
	b=KUCb/ZVS94A+ZaJeA3ZFigiD2XhQtLgEswX59oIvilmdYciKrO/X/spDZ5uhQOQ453WG
	 Tw5szreHIwRcgX8Eq2QTZO2f9P7b9N0KQ2C0Dc1UhfD+28loInmUGW8J00g9qdKTYaa3M
	 d1hM08HEuMq1wRsFKqojzv8U+uR9pmr/ESk579SuXydvjAeauyPiCI/TcByEAukziu+SF
	 YLA1F2C7CMZvGeBPdRXIXATYHLa1SI8ghjADDOOdWH8Hdqm059AUiwQ+eFHRI+LhgQ8Kl
	 +kAjC2Hb/SEa1Xo1tQIAnJt2mt9s2YH8NpIvzigjwael1uJaJEUwE7m/L/7obgue1kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793287580;
	h=DMARC-Filter:Received:X-Virus-Scanned:Received:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=TMem62g2lcDs4GvVz70GOlc3OQ9/CsK2Am3UmiiCzO8=;
	b=xXHx4SUxcruwnBaIjqh+SnPBT/+eikkrqiLuBd6VkH4Rsc62br+Jn3Pw0YHzGZZrgIRt
	 ZRHJuxi+l8mYkXNQ4MDy9JQGhtdSITFR37A4+CkWJ8A4245zXzsclsKeLG/d7EAtrjMqp
	 e9Hg3opgguCJlnC3dm+dWJMVr9gr3iMCXGpfU6sl0wangWSIAmLkDZKRP6orjiF/rukOn
	 JQ8Ry0vJqml1FgtG4REBOSV71CWfiSdEOO7rdjbMwOkytSbGMq19dANxhL+tZpI3r6cXX
	 sPDSZg6wqvtOBvyzE+yNVLMW7/AHzKigVm33+87a0yd/8RfVDAA8do/1P0PDRI0wuyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=alien8.de;
	spf=pass smtp.mailfrom=alien8.de;
	dkim=pass header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=WfaLSk8V;
	arc=none smtp.remote-ip=65.109.113.108
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C083A606A31E;
	Thu, 29 Oct 2026 15:26:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C083A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key, unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=WfaLSk8V
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C2E2C40E04D6;
	Thu, 29 Oct 2026 15:26:10 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id SXko1jis7xbX; Thu, 29 Oct 2026 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1793287566; bh=TMem62g2lcDs4GvVz70GOlc3OQ9/CsK2Am3UmiiCzO8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WfaLSk8V2zc10CCTJC7KQ+mW5ZNVwQ6tVysSm3QoFYrlYQcQbTdeGnTWigDnGTV73
	 WAtHhbThxElxilGbIyKiOlL2OX3thsUsUKN0nSBfHsprxovyr1FZDWqLXiKOOLKYSs
	 mDjo4Utiji/QF1wRS8DWQQyxP1qHgQco+wdJP90GqhecLmoJKI9ErJsIsL6P0NI4DH
	 JUQFoLcrE2LAb+aBmPA8dw3OpkNCanlDP4Y4MZRuBTqHLgw+HQvyXuoSF7WPa4ErZV
	 9wcOGxVxeoY5QzJ5I1M3ENK7LoVA47K5yeRTOzJo8Qe474Ehta1F5ytcJswRoCOOWn
	 rd85yhrR4cem0mPfQ0Oqwqp+HzBrw75sQ3gA09h5DtQOk4VeAjlGEiG+ZKhmry5joI
	 TbZxD/S51f8V7Zxa/gjufRhBlTd6JkvZjZn1JalTE1+7GpowzJ28W9eJPVXFTlWlHN
	 KVFNeXBV60culPcF5RzGCa0YPTCQdfu8kVbkN7HAFDHavT8ZDHnK19uCOYnzPGJFI/
	 qaFUEHixReT/86cilapEQg7osZTZgHHu6OTxtl5XoZBythAnLxYMNda5Dvcdhztq/y
	 i6xVPIBqsL/Wvx4PkgNva+23Fkyp0PyIHMIaWHleslwajy52bfZC8K12PHiqbsmWAW
	 LFxAowr7WGdXTAV/6kLD8zhI=
Received: from stx.tnic (unknown [IPv6:2600:1700:38ca:c00::48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4810A40E02B7;
	Thu, 29 Oct 2026 15:25:52 +0000 (UTC)
Date: Thu, 29 Oct 2026 08:25:49 -0700
From: Borislav Petkov <bp@alien8.de>
To: Michal Simek <michal.simek@amd.com>
Cc: "Veggalam, Rama Devi" <rama.devi.veggalam@amd.com>,
	"Ghannam, Yazen" <Yazen.Ghannam@amd.com>,
	Rob Herring <robh@kernel.org>,
	"tony.luck@intel.com" <tony.luck@intel.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-edac@vger.kernel.org" <linux-edac@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>,
	"mchehab@kernel.org" <mchehab@kernel.org>,
	"rric@kernel.org" <rric@kernel.org>,
	"git (AMD-Xilinx)" <git@amd.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: edac: xlnx,versal-ddrmc: Add
 xlnx,versal-xilsem compatible
Message-ID: <20261029152549.GBauNlfeOlTwktwjYs@fat_crate.local>
References: <1792587442-2794880-1-git-send-email-rama.devi.veggalam@amd.com>
 <1792587442-2794880-2-git-send-email-rama.devi.veggalam@amd.com>
 <20261022143730.GA1287910-robh@kernel.org>
 <20261026203920.GA696395@yaz-khff2.amd.com>
 <PH0PR12MB8125B27A7814A3818739C4B9CE6F2@PH0PR12MB8125.namprd12.prod.outlook.com>
 <b683fcbd-ae5b-416c-96e1-7b0d7146c468@amd.com>
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
In-Reply-To: <b683fcbd-ae5b-416c-96e1-7b0d7146c468@amd.com>

On Thu, Oct 29, 2026 at 03:52:35PM +0100, Michal Simek wrote:
> Let me jump to it and start that discussion again

Sure, but pls trim your reply. I almost missed it from the gazillion pages of
quoted text.

> Please correct me if I am wrong but today edac core only checks that there
> should be only one MC edac but there could be multiple EDAC devices.

An EDAC driver contains controls for all the RAS functionality in a platform.

> XILSEM edac device is present on Versal and Versal NET SOCs.
> https://docs.amd.com/r/en-US/oslib_rm/Tool-Configuration-for-XilSEM
> (Actually also on Versal Gen 2 but firmware interface is going to be different).
> 
> I don't think we should try to integrate EDAC memory controller with EDAC
> device because their usage is independent of each other.

Are you saying that you will have this XILSEM hw in different platforms?

IOW, you will have a Versal or Versalnet thing and then something else, and
then XILSEM will be in all of them?

Then perhaps it is better to have it as a separate EDAC "driver". In air
quotes because this is not really a driver but simply a wrapper so that it can
be called an EDAC driver.

It all depends on what hw configurations will be built.

But if you have XILSEM *only* with Versal, then I don't want a separate EDAC,
hm, driver.

I don't want to maintain a zoo of "EDAC drivers", each for the RAS
functionality in a hw functional unit. IOW, I don't want to have:

AMD64_EDAC_L1
AMD64_EDAC_L2
AMD64_EDAC_L3
AMD64_EDAC_DRAM
AMD64_EDAC_SB
...

and whatever else hw blocks you can imagine which have RAS capability.

Makes sense?

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
