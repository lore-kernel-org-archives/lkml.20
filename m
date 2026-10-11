Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB463B52FA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791697498; cv=none; b=i6OzkcRG0kWhS8RZluISjPF4C9PEtHHxyxEc+9LcNv6eXZxs55L6eHsnpwPqyO/s7aUs3W4S3MuZUjiWgs+FniOFgeBHJL8WnLqOBe48UdWTLYm4uX/uU+BWMh59M+ebuhYLR8/V2Hq4N6pkDEWs7dfa3eV4DuuQZGyURVj9e60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791697498; c=relaxed/simple;
	bh=dCUDHhz4dgapugA1Auq2FlHXDI5hd/sAmskaSQc9Qa8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e9o6OQu9ioFKRD2Cg41+w/cG2tVq6pmYUMVXUkKuLcOcLMyjrxQ2emmpE+41Ow3uIlr502Eomg+ZuNahPF69hXdOS3EuWqkTK2vSbJf/CIHUlHOLCft74pSZcbvki6zrrkrIJd/xZ0ri923jbVPWAUW1odjaiz9cmnDJaGy6t7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q2aY7iBn; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q2aY7iBn"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33e6279a1d7so1252504eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791697495; x=1792302295; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T8diuNZ+zrgNOaX3UMVCcddQtmK2jbIBOVFz+8CGVq0=;
        b=Q2aY7iBnleak2MnUOPpERazeABiRxrc4dX22Uzqxqvv8Yxpc5pWO9kQwa1n/p5e25N
         dvRL6tn7Tu790AWjicHeA8yOU1yKb3YZPQzCifzMp91wRLndXmCag296fiFR53XZ+bLV
         Y9wTshu3Kw4qZzKJQTUDmCJncdqOjvjBvL/iFLTHkhUsik/IkFbsFbMNtn3oYLT/ECCP
         PNeoRu2e+ckktGlV49GLfEhr4Na6pOL9LwB3+zYzTlZmo4rI/r0r8kor9jQMy6Ir5ur3
         brqyFpad0ACTpk0mTDEX8RZWeFnye66FyHRBC0BLCCg7fdCN6HTIoKf/dD4UgY8tUuEQ
         dwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791697495; x=1792302295;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T8diuNZ+zrgNOaX3UMVCcddQtmK2jbIBOVFz+8CGVq0=;
        b=HEqvhqaO+OLgAXgcU6AxseSniczw+ViDTGTR8g9Pjh4lmGkHUA6j85iVzIBk08ZSzv
         tIxaGvdJ9TrQBXp/STnvsO8L0XPB2IFm8gHN4C7gnaGRbLIVzPJXgdydcVIbY50SkzW/
         SWjmm8kabt4tVg7YMcqusuefz6c+la7Kwcr1RctRMOb5YVUtUm5weiP41RoXL3UUQgU5
         ds0htKT7DEA7I96jV3duvcofwOHatcuE9KWCrw8XNQM3X3swSbztZJWm+xKC+432bzst
         OyKko0A4l40pd+FjIlSHZhb+HGaR+wWWltd7HMMPACFx7P/kieEG/t/u9wUoEzZOsJmv
         5Paw==
X-Forwarded-Encrypted: i=1; AKwUvBwcyl8Rh6j15VVy1l5rLhxMrkvS8MW8X6AT1EE23FA1aB4l4HaMMmo+YQWS9okCy1pLgMy+1xqzNEtOIKE=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoRgFy4vcXfedwKXbodOh0Lm5dwY+5Z9IUDbp+Ha0gGjbU7NwR
	7JmYISwPARg2UnKQYt+0Gjh3FpGM2eVUBq7TZiJPrctXhLYh31a3JHy5
X-Gm-Gg: AYBFou1IETUx2Zort7yFkmsvkjpj4+zm9qMQt2LgAkvChLUy5qoTFU/RcRK6mNvgG0v
	uFWvyC1yKsDue/N7k82f9mJnFAaCLAzH5J9is1i52N/2OVqroP+izqWeqx5ox4GgCNbC0mB8wih
	uSBpNMnm2oWslqVHc7+4+SvhCUvkdx7wL+x0yD9X0zOndIGhLFd39tiq1XwAvbn8xW2HW2wZGxB
	3ueAJx3BNHesRu8+zWPUzD5JZYmpxU/Hu+7UV5P8avSVgbGCcNxFrIhYzHj/T28JCwjZNPZx827
	trWSw9qF8Ly7+5DkaOLZud/ZIvpF0r+cHbpriRbBID2ujgUhpAl7vM5VjI2Zjzid42v/I2vNkhu
	GcJjGbDZWd74TgPiMQzMx6fxfnfQO2PQPA/x51uTX1HGVx0S+b0NE6/OVasCENLlBD3JZoqrxSQ
	V3SfDq2gXJNA0AxKXJglXYZlfUGzJ1QoHDuSxHXg9qz92RW73wtMCa2J5YcblQC3uksfkNhYcIb
	q0B3AuV5jPAbWLAI5s96ccnpFjuktTTYGTgKK1zVhrvpw==
X-Received: by 2002:a05:693c:8811:20b0:356:7ddb:2e54 with SMTP id 5a478bee46e88-3567ddb2f02mr6808511eec.29.1791697494583;
        Sat, 10 Oct 2026 22:44:54 -0700 (PDT)
Received: from [192.168.21.192] ([24.18.106.4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841648sm23485573eec.3.2026.10.10.22.44.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Oct 2026 22:44:54 -0700 (PDT)
Message-ID: <17a20959-44ed-43e5-8414-201120468f2f@gmail.com>
Date: Sat, 10 Oct 2026 22:44:52 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH] PCI: Set supported_speeds in set_pcie_port_type()
To: Stian Halseth <stian@itx.no>, Bjorn Helgaas <bhelgaas@google.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Andreas Larsson <andreas@gaisler.com>, linux-pci@vger.kernel.org,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20261007131304.309511-1-stian@itx.no>
Content-Language: en-US
From: Tony Rodriguez <unixpro1970@gmail.com>
In-Reply-To: <20261007131304.309511-1-stian@itx.no>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

This patch also works on the Sparc S7-2, the correct x8 link is shown 
instead of unknown.

# dmesg | grep -iE x8 | grep -iE link
[    8.421411] mlx5_core 0001:03:00.0: 63.008 Gb/s available PCIe 
bandwidth (8.0 GT/s PCIe x8 link)
[    9.472465] mlx5_core 0001:03:00.1: 63.008 Gb/s available PCIe 
bandwidth (8.0 GT/s PCIe x8 link)
[   14.734746] mlx4_core 0001:04:00.0: 63.008 Gb/s available PCIe 
bandwidth (8.0 GT/s PCIe x8 link)

Tested-by: Tony Rodriguez <unixpro1970@gmail.com>

On 10/7/26 6:13 AM, Stian Halseth wrote:
> sparc64 and powerpc create PCI devices from the device tree in
> of_create_pci_dev(), which calls set_pcie_port_type() but not
> pci_setup_device(). Since d2bd39c0456b, supported_speeds is only set in
> pci_setup_device(), so it stays 0 for these devices.
> pcie_get_speed_cap() then returns PCI_SPEED_UNKNOWN, max_link_speed
> reads "Unknown", and the failed link retraining quirk passes
> PCI_SPEED_UNKNOWN to pcie_set_target_speed(), which warns on a SPARC
> T7-1:
>
>    WARNING: drivers/pci/pcie/bwctrl.c:125 at pcie_set_target_speed+0x284/0x2e0
>
> Set supported_speeds in set_pcie_port_type(), which all three paths
> call.
>
> Fixes: d2bd39c0456b ("PCI: Store all PCIe Supported Link Speeds")
> Closes: https://github.com/sparclinux/issues/issues/109
> Signed-off-by: Stian Halseth <stian@itx.no>
> ---
> Tested on a SPARC T7-1: before, max_link_speed reads "Unknown" and the
> warning above appears with CONFIG_PCIEPORTBUS; after, all 23 PCIe
> devices report their real speed and the quirk lifts the 2.5GT/s
> restriction without a warning. Not tested on powerpc.
>
>   drivers/pci/probe.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 27008e2ea5afc..52a79b033b069 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -1651,6 +1651,8 @@ void set_pcie_port_type(struct pci_dev *pdev)
>   		pdev->aspm_l1_support = 1;
>   #endif
>   
> +	pdev->supported_speeds = pcie_get_supported_speeds(pdev);
> +
>   	parent = pci_upstream_bridge(pdev);
>   	if (!parent)
>   		return;
> @@ -2074,9 +2076,6 @@ int pci_setup_device(struct pci_dev *dev)
>   
>   	set_pcie_untrusted(dev);
>   
> -	if (pci_is_pcie(dev))
> -		dev->supported_speeds = pcie_get_supported_speeds(dev);
> -
>   	/* "Unknown power state" */
>   	dev->current_state = PCI_UNKNOWN;
>   
