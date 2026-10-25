Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792925015;
	b=x6y8+5+cMQzwpHLn3pyGTKyAYehZkycn5FNrVc/m3hRb0Aja06wznYhwpEsaWOaLC3wI
	 ER9xNE6+PqKR7KD5H9vXX5M/gzc9sONQ+SaYRm4NE4UvjChOUBZVKruDx66N4v9Gk1saN
	 ldRshQkDOoqpVxwWT2CGogUJRARQu31W7ym3PUfkMfxxq4+aJPyZbMeb/+IS+c5c3YQ2D
	 B5v2xjQIW6AUVe/vSa/NK2pPDDaHU5YJXOG1YvBqCczfmqvebXjpfTI5MIrVpJ8Z8BMAH
	 BTUfR8dNa1+v8rIoB6FOWnkTLp2cOABZAmMVNg9nO3atMSTix0+4atusPJG5V5WVN6w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792925015;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
	b=21gV/eJ2w+KU/pgVjjoOTAB7txVX5w9rtwgmaGU3Dp39908NUeoRKcRDf96KfXaxkkQ9
	 5KVnGtzAa9wS7lwrQJ2PCGAF2EvSJDKLMRMBll/TRJEzH2d3+DXhyUxXGQTZqZz7G0cO3
	 COtyecuz2J2MCG0yTyQtvwXEk5YXU0EvBIbmH4mxtrhoKjmDnpjL7iB3NS/3C+OgBKE/I
	 E887SkCs34lV/ppLzafMvIKTgy/oSjb6XT+M2O03hfvkgNYWoivc7CUojixYCKSnhPbyL
	 M61SVuqNDXANxlj893lzb7XR/ci3NngJnvRTI1pIfj0N7Ypui3xEcwxina/Fzdl+GxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbt38REz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E843606A321
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 10:43:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E843606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbt38REz
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ac76a02368so2661223a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 03:43:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792925014; cv=none;
        d=google.com; s=arc-20260327;
        b=QVYMrE4ue89zJ+Cmsouq+pWYhOSw86O5YbFgLTdC/EV/zq5VtU0V5IVsLglNt7eIMv
         lNj6vFYyUqYQJ22of0//vyHsoSmHTY2E1a3D3BRdiN5vrHK4+mPYuMItYRXPxsp17LZw
         4dXfEVQO+SLOLfN03Mh3+4efEsPrYbCLO+rg1+Rz/SKD8KNIxFyLHZNnVWYBQkVKTgAn
         iUKGPyfW3ytX9lKaKMsMffzhWt+qdTpyv4y0LpIFtFgClZLMmdYFvct3df5eh4mY4S4G
         lUZ/f69WAgCyAc0YTHmNAamQ/B3mMdyv176aTHuEau/iLH8lvojiZ9/jx1486Gqaixm2
         opdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        fh=UV5OKhO8pHVd4hiyifz/vVkUIDxnElOM+hHQDMTG56I=;
        b=FM8WJm551UsgnRtiG8q3G1jE9CwxEDlsDte9uAaiedOTTCxEJ9y/PCQxKzybM5YnTb
         LrOri73AA9d9YdIgOupGcQl1LI5gPSdFQ//h4zXva7A3v952Kjhe3RLT/6LsgWpFqQ48
         CTxOD0sWHclXLCeZsbQnvr5W7hLcHd2UvassoBSLs/ISkqrnxg8wbeVJz0KhljLjqw/h
         GQ/O9gpsSNi+NElIum75D6NM19meHSFwOpbgE/B8fjvu2WfS630tKYKMyL0UFa4jNWXH
         b95nzj1fhe3gqLXUdTL5oySiSjp70qM/sYIRFhJMuMYfG2kDdy4TE+3ehJaFNME40ZSo
         O4mQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792925014; x=1793529814; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=Rbt38REzAy+sj6ZjpLOT+mVNyxZj6UqGJHgMQrw0MppcvV85pE8CtuLLb9hWrJ5MZn
         BIDRHdjJFWGCbHVvxxXxgt03fSFR6yIofwtQtO0cN4x/OEeQrBru0OMr1vx9tj5aRFmJ
         vqeCzDfDHUWYVOH0G32D7lHGuCZ3DfRIOyiisMx23EVkzlHfe1wugq7IAYpYqy5RyYI0
         DwnEj9UfRFbldIimFSvTe9TZab3uhQnHNvUTEGae1o/d7FA2pSPJhclP+URG1VGJP9BC
         yCExYq/OXmwGVreIA6v7Yb3h/AEISO+z10zhexnOUWfTg++d9TjVrr2pwHzsDV7MvlHr
         IXAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792925014; x=1793529814;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2nhVqeDWML+DyZIbNVrMj09Q/t6YqRPgh+lFp44NdbU=;
        b=UiXHGTKSRW6IeI4AXu2BoSpE85Q+TPf/QGudMHHvZ0rKq9AVpGO2hqerX3Qrh1fqXJ
         OmvqzZgVT8mGrgSHD+Ncw/DZ7hnpjTV72TpNfcfYWWn8ZL06mehOav3FYDfXO51niNcL
         lNIiiyZDxYVGoqzPviJoYJ3lg+KR3tvIbZNGm+ZjlAjW3etZX/Nf7qAKd0q8vWeFL76q
         cHZdG2TTr9MUG7B5/dJK/88+LfYCo1GGB8OKtZNA0H9MxYxw4P6dQrxzA4cdEM7WfnOB
         bLz3MEfscg/wOdcVnJh4yq/tTd9hZzKbVBdzVzK2768uOOgCCZNFPzdat25fcTFeeSVR
         wQPA==
X-Forwarded-Encrypted: i=1; AKwUvBxc37xSu8avSH2twowk8mAkWC+ukI0FVmbuT/5xHE/eLpqL7qHTSthySkZooFitbt8G8vQ595PjOXYVMwA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKhCb2fGSfF56xJEHYuUM0dy3LHf28SaER+Wh8JVjIGO2GAbNJZ
	CHCokCMYDiey4/2fqpcpvF3GpX01/h6mf7HFykQq1UZEk0gUkoQuf2KtqhVdV35H5pGhHiAbZTe
	SDN2aNQdQaCKwewpub9LFK6UV0y+7Mjk=
X-Gm-Gg: AYBFou1qnvUWv8Dkczl74XajMr5OscYhfpfBlCdJqfNLj1e5n6K+MBZZo3JIPlJRSNP
	b0alxdBvkEDQmDQK9eOtVzpo/Ffnh7G31SuN1cqsb6eMmo+pX2bPt+mZA2bSeJI6Ede5Yrp3fEE
	z1l+t8Ilgqsn4tl0MUZbExljmv4v3asi/jLCChlD7snWDCunKUCcu5OepNTTM/EQV+ce7J8MhWS
	ezO4jKwBZBh0O61wtAHMQn/Hztw5YBFvTuYw69vF/LS0I4KntLe1pHlRcPO6osdoGSSzjPqC+DQ
	pLxkloifTBXk1CzO8w+e1HG8+t8xhn4rcMjUHL3d4fXGgwzgRZHUP40B/t4neNwT7ZskOWgzWWO
	0jHabFlach57zaxpm3TIuu6bMR68Iaya9Bdc=
X-Received: by 2002:a05:6402:270c:b0:6b2:20b:aed4 with SMTP id
 4fb4d7f45d1cf-6b4430199aamr5305867a12.38.1792925013523; Sun, 25 Oct 2026
 03:43:33 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024092558.143621-1-alan.tseng.cs@gmail.com> <20261024092558.143621-2-alan.tseng.cs@gmail.com>
In-Reply-To: <20261024092558.143621-2-alan.tseng.cs@gmail.com>
From: Anand Moon <linux.amoon@gmail.com>
Date: Sun, 25 Oct 2026 16:13:16 +0530
X-Gm-Features: AclHuK-kOeWVKlgsWorJqSjEZdHZLjS8gQzZJLPBLsv2jCYHjrUYgUabSVC5ZyA
Message-ID: <CANAwSgQ=Djw_o89MgvEsmKVxuNiE3Yuy=e0T5DcLfqCYy6eWMw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] riscv: dts: spacemit: k1: mark boot-critical SoC
 nodes bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, E Shattow <e@freeshell.de>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hung-Chun,

On Sat, 24 Oct 2026 at 14:57, Hung-Chun Tseng <alan.tseng.cs@gmail.com> wrote:
>
> The K1 BootROM loads the next boot stage from SD, eMMC or SPI NOR into
> SRAM, and that stage brings up DRAM. To do so it needs the fixed clocks,
> the clock and reset controllers, the console UART, the boot media
> controllers (sdhci0, eMMC and QSPI), and two I2C buses that every K1
> board wires the same way: i2c2 to the EEPROM that holds the DRAM
> configuration, and i2c8 to the PMIC that supplies the SoC.
>
> Mark these nodes bootph-pre-ram, the phase that sets up SDRAM.
>
> Reviewed-by: E Shattow <e@freeshell.de>
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>

Thanks for these changes. It helped me a lot.

Could you update the pinctrl and GPIO configurations, including all
necessary pin
assignments, to bring up the SD card, PCIe, and Ethernet nodes?

Please ensure that the required bootph-pre-ram properties are applied
to the relevant
pinctrl, GPIO, and other dependent nodes wherever necessary for SD card boot and
SPL initialization.

Additionally, could you update the regulator-name properties for
vdd_core, vdd_1v8,
and vdd_1v8_mmc?  On all the boards, the SPL code requires these regulator names
to locate and enable the corresponding regulators during early boot.

I am verifying the changes against the existing U-Boot board device
tree and configuration to ensure
that SD card, eMMC, PCIe, and Ethernet initialization work correctly.

Thanks
-Anand
