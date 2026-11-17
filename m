Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.132
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883404;
	b=aUmtW9/p0QODs/VAgmuWrchkElG//pz6uMHGWzLiCbtUZyPHqJw+L5AD/nu2Qz9L7Xmd
	 9JQKauWQYyEWIMz1kVU07mM+YGBYO07GOSzo7uctw82LeobD52e30KXsXdmtXiZrIkuBh
	 z7YUce40ZOZq40q8YMsqn0v2MPirKVHPzJkAJrrQ5g/xtetferEk4rRFPPuGu7XwrirU/
	 669F/L3VFQcMn8o7NGW3sc1Cq0Ity8VRjAJssyVeU02pFgFgrMjMdO1z/GioYiKblty4l
	 DukjtxOD73pxtUYyNvqdB7sej9tD0iAmsf1iegcxKBpBSOmlcdfLo/0PaP4w4QLzkqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883404;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CfPcvB++wsWrlfK0SuqJlUoXRuhQcrHaDaCEa5M/JBs=;
	b=yhXdcdPpv6792xUXvjtuLMwHsEVL68ZjmDH5XfCsTQAM9ygmx45n/NMhHJHddY2gcm9X
	 Z08JcCWf2oAPLM9lnpoQkXq7RQqZC+HqdInIurajyDS3H29f6ceW4Mj6u+IFKk+H9GTnq
	 I6G7zEwJWxn0rrTMKW0QgDOT9gx0qUmnZrNla/tQTCedbkxHpFhjNJdLO19e2mNw/5y3D
	 O9UzkfwYqt2n6car3PQRFSjNmUYXHJhv/ccrvLHdaftF7LWOkKT8KKUAMTvVv39Dn6sxx
	 Mc9GZJI47Om87SGXfB9su3mDEwGk1beqF4E5DZwFH7FNif4nNvfYAgR60/rdBQ38kMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qcNis7dC;
	arc=none smtp.remote-ip=91.218.175.132
Received: from mta0.migadu.com (out-132.mta0.migadu.com [91.218.175.132])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3B9606A329
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:43:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C3B9606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qcNis7dC
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=HoJ4ScLko7qTW7aeanrz78QLaJpCl7fO0b5x7Pn1u1s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794883401; v=1; x=1795488201;
 b=qcNis7dCHdgzJhHnQbx/4e+Vcyb22u/QNCiRh+EFL0rnoXd4UpmiqCZTBRz9EviWevOGKH+B
 kd3uZLp17i0o7tt9ywsCWIyLDewaXr4S2K+MlIew1R24dDTxlrCAYyH7/c6WeipAVvyXEZ5WKti
 +/aWKLyIxq/ujlL8ooW0eFek=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id eebe6f70f4e10d27;
	Tue, 17 Nov 2026 02:43:20 +0000
X-Mizu-Trace-ID: eebe6f70f4e10d27
X-Migadu-Flow: FLOW_OUT
Message-ID: <d752f826-104a-4128-9f63-72e5eb8732d6@linux.dev>
Date: Tue, 17 Nov 2026 03:43:20 +0100
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
Subject: Re: [PATCH 07/13] platform/x86: asus-wmi: Convert to
 pci_assign_unassigned_bus_resources()
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Corentin Chary <corentin.chary@gmail.com>, "Luke D. Jones"
 <luke@ljones.dev>, Hans de Goede <hansg@kernel.org>,
 platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116152403.2672-1-ilpo.jarvinen@linux.intel.com>
 <20261116152403.2672-8-ilpo.jarvinen@linux.intel.com>
Content-Language: en-US
From: Denis Benato <denis.benato@linux.dev>
In-Reply-To: <20261116152403.2672-8-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


On 11/16/26 16:23, Ilpo Järvinen wrote:
> The asus-wmi driver scans single device and then attempts to assign its
> resource using pci_bus_assign_resources(). That function makes bridge
> window sizing disjoint from the assignment phase and is going to be
> removed.
>
> Convert pci_bus_assign_resources() to
> pci_assign_unassigned_bus_resources() which is likely no-op in this case
> as it looks like bridges are not involved here.

Reviewed-by: Denis Benato <denis.benato@linux.dev>

> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/platform/x86/asus-wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index b33ebdb21aa2..9eb783eb53c6 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -2325,7 +2325,7 @@ static void asus_rfkill_hotplug(struct asus_wmi *asus)
>  			}
>  			dev = pci_scan_single_device(bus, 0);
>  			if (dev) {
> -				pci_bus_assign_resources(bus);
> +				pci_assign_unassigned_bus_resources(bus);
>  				pci_bus_add_device(dev);
>  			}
>  		} else {
