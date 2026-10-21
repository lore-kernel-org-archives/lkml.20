Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792560001;
	b=DTuh89kYNRKf7sGS+cYueMNZNQfEDYSMJP9WE6uUWSNk6T++Z32UKpUfHEHOkI+bU+lS
	 vT5p+KXfowfCIi1TxSgied0onZ1/ZP56Gg4IFW3wV/4KnPu2gIa/2mfKKVzbP9FJ+ddfr
	 JWeTquaUPI/1YrLNZ1qQY00HjIjGdqMpMrq6BFXBtPB1zk1OQNiZGWI++IB+HAzCVDlAc
	 qzl7BMuAoUK3he2EZB8PaBro+9NCjf7oe/h9+PswyNYPdEiGWw0U5xkihzetRNh9OypVJ
	 Kg9N1g0b2fGu3BIpRtCsM0YCfKYreombGQ2/0+3hbjUqE65qUsTMhzCLtXdh5XdYO/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792560001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=xqmI5oTYDX1SfPqyVBb8xiQJ7sNcHlpo9oEZ0gRtz5M=;
	b=1JJdrbybMbteL5TmcTYkCHrfQJnAmfjFXtQUDNAzb4WbbzAb/oBftYyJ8NHLtg8X9jkY
	 BgJVjGT+iAsK8pgu7HSxPmlFgm9UWNDSeX6KmabRhz6VXDoXsm/FTmdd1aM7GWHp/QQH9
	 14DArUnnAti9kt7/D/lT5x472DMI1I52MCkF0iiW2ODLlJby4J1YfmRw3YoVM5rQUfJnd
	 IFkAamy1OLMKhdvJY87EE7k+1x7apXD2IYpMUdTC0bevhKp3b/EHqz80Lc/yVte/4dJDp
	 C4Q7L/3WTdLhr3XXy/kJtMrI3gMu4BLwsFfICdA29bzBzYusMKj6qgqiktuQN+RB6Tw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kjx7elIo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC8C606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 05:20:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FC8C606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=kjx7elIo
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-150ef97e790so3418c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 22:20:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792560000; cv=none;
        d=google.com; s=arc-20260327;
        b=qDCkqF8vugTVf/MQUgsNu55s8+GGXx3kHwUNLYweGmE2cOOyIGuRd187a+fYwWpHLN
         NmdgYQGZN9NLmP9eIwK2zdp4sUGidpXOerI/5e3S+/eP7XK2Og5Ld6xbDv+W8UxpLv7B
         DWdKzRC9QWV3/PtKsc6yCjbN8yzn0MK7W8owxwkvj+PpFWwNDI2zAWtkzZ3OFx6+cAWo
         NMSi5GqVNQchWY5qzEt/noVLBW5UyVWPs5S/IfCZdqhr7nge3/7aapsmgdMF0oL7P4HE
         8zoQv03JFL0/0Uxyee2qZZXzYUiy+4rMqZo+u0LmlSjuCk/HZLlIDG6K5i9XLfUPM+LH
         BNAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xqmI5oTYDX1SfPqyVBb8xiQJ7sNcHlpo9oEZ0gRtz5M=;
        fh=MwSFNGWcaX+dLL3pYO+fq+jfb9jerC3If/8lit9QTUE=;
        b=ZcoVtY31KsX9ItEI9kdGyteI8CSNxTaVMyuXdl317u9ATQ65P7VkuRtFVJI4Px8aS1
         1Zy+tsLn4opg2efXa4j3Bzy056NwnD4Ytt6gQIkB5RrqjenGsToKvVMCph4ueonp3qyG
         WNVm4yZFUPV8IIWNITXAvwR64NXocmd3w3abf21GSKHDh84dX6ZyLEfVJ5W2HlPS0FyL
         QCLvf7eYoPdfi4w+B746Y/9mJIEjY0X+5enl1fXsGdxt1FGD3kBdWOreeO/3x9YBC6yd
         5l8k+2BARqlUbrUcFBn8sDb5gCk6NeTPayf4DW8MZ+gzQTuFFOVGV4MKKtsZePpxoyLo
         uuaw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792560000; x=1793164800; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqmI5oTYDX1SfPqyVBb8xiQJ7sNcHlpo9oEZ0gRtz5M=;
        b=kjx7elIoFIGbKq1kJHGs7Crjx7F2FWSh8MumHPwYJ47/SVZTaTunS9fZg1VnCztNwA
         de7lrYw5K0nGI36dg+T6xoljsotPtdlx7Op69utlPa0YaeoS/2GU5KNlFQzjH2LqNFPX
         oF2o3pjD9cZKFKF04LbcFxDX9PNWiaLJ4GqBt81r2B6Q9Z72zkrXDkLOiocLaQSPa9EQ
         Y+e+AFEcsVd59uiFkhHDKYwIa640I7yoF6XkDK715qUD3+LhLIVr5w2mcptmufdJEYpH
         TwSjBuQoVDhbaeI/FTcmkJar9LGzCtUcVw46bMfO+lIBqq/CE8N8GOjNzLpBa4FsShn9
         bKag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792560000; x=1793164800;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xqmI5oTYDX1SfPqyVBb8xiQJ7sNcHlpo9oEZ0gRtz5M=;
        b=NeZ4np6EZio/IakUa9bBAo1GxULiTchDg2dWZEyp3MO4HSlKChZ2jJkqa4tcx5nzzD
         XuJ4oH6EgJVcoDhovOEcaUIC1tpMSi43SzFR3R3n92y9NHWK/U1kUQbdqRc3iXvRcloT
         xTdgczTqr8XgdiHruEb6SYAkx2lB3QwqLTs5VXZUaD81K+BT1qc8+cjSdUABiwBpXOC7
         Bw4YC7OypE4KAoFnKAFyBj9PG3ywRstQ41ZG3VXC7+ghYXA57Gbhiy2HnZg+o4Mp8daH
         goOCI4iGKkwRIh3fFmQxoVIYu5AdU+qBxzzZQdn48z9vbz1oA56EaaPgc3fI1Mdg8YZ6
         Qmzg==
X-Forwarded-Encrypted: i=1; AKwUvByj3wrawkVArqRrNpDf9VzFvcZDccG7zTuWAsDd3S5UanG+i4IfoVProOOlyG/OzT82kGnVEuNvmy+bEqk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsXmmxMAilUAKw9xi9RnG23ZkTDuR2scprW9SkEOaWrWbbza98
	rW+/VOw91Q1muK1OFuNsR/h0c/GHYeoGoTm/IeW1Ym6VuQW0HkeaHfTz5M/2GpQaUFgyqo4iLij
	1ZJYQ91w3JQkh1iroxvQ+PNPNaF/FqGJRVi5vn20=
X-Gm-Gg: AYBFou2HRGCMgN9CyQ6OJncYyORAll4HQKCoGhTURfA+ZgXeCNvtzs1Xh1T7PsMXPZE
	ot8y8JzLdFWiH3MJyUOBEs0vz1TJc3Nh3B81TadviQHPzOCsnOseWLZ9RGDkX0XxfoNqUVPqR07
	Y238k+T4zNQ3XYfaIvhmrQNS+KQUTuS30ILeO8szf+C5lIrqNy5htnChbvIbEaHBW/yeY+aGvy+
	KzXO9xC6ge79RqSh2viRb1wb8FvVWyQZ4MUbhCzvW5J/sMqx2BbxnheJUA+sB5zdyHpwfwKVlZQ
	Qkee9pOjfcYyYju6uN3uuhXQ8efgI4qa/wB8J8CLcZjfoOFAVbE1kyi9za1Kt6uiOCiqLFulv/u
	muTzuRleTIs7okLpwZUEQ2uRy10sWIB+tMJtxbd3K+F47vJeMHXqCz1cQcmNt23hBsu3F+8mIjB
	/xSeVmFeYecAxIjZUW2Q==
X-Received: by 2002:a05:7022:5f1a:b0:18a:392f:abb4 with SMTP id
 a92af1059eb24-18dca4525e1mr532164c88.8.1792559998707; Tue, 20 Oct 2026
 22:19:58 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019213054.3157159-1-dmatlack@google.com> <20261019213054.3157159-4-dmatlack@google.com>
In-Reply-To: <20261019213054.3157159-4-dmatlack@google.com>
From: Josh Hilke <jrhilke@google.com>
Date: Tue, 20 Oct 2026 22:19:46 -0700
X-Gm-Features: AclHuK8_I0lbhT2Ykck25LC8FtHxcLqDsxEKAtZfCcYcVX3702p2AtjdvdGdqto
Message-ID: <CAAdrzjuxL-RCLUK33WYpdvDV38+kFTmoTBVoxK9cw9Voj38wcw@mail.gmail.com>
Subject: Re: [PATCH 03/10] PCI: Factor out bridge window probing from pci_read_bridge_windows()
To: David Matlack <dmatlack@google.com>, kexec@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-pci@vger.kernel.org
Cc: Adithya Jayachandran <ajayachandra@nvidia.com>, Alexander Graf <graf@amazon.com>, 
	Alex Williamson <alex@shazbot.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Jacob Pan <jacob.pan@linux.microsoft.com>, Jason Gunthorpe <jgg@nvidia.com>, 
	Josh Hilke <jrhilke@google.com>, Leon Romanovsky <leonro@nvidia.com>, 
	Logan Gunthorpe <logang@deltatee.com>, Lukas Wunner <lukas@wunner.de>, Mike Rapoport <rppt@kernel.org>, 
	Parav Pandit <parav@nvidia.com>, Pasha Tatashin <pasha.tatashin@soleen.com>, 
	Pranjal Shrivastava <praan@google.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Samiullah Khawaja <skhawaja@google.com>, 
	Vipin Sharma <vipinsh@google.com>, William Tu <witu@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 09:30:47PM +0000, David Matlack wrote:
> +     pci_probe_bridge_windows(bridge);
> +
> +     if (bridge->io_window)
> +             pci_read_bridge_io(bridge, &res, true);
> +
> +     pci_read_bridge_mmio(bridge, &res, true);
>
> -     pci_read_bridge_mmio_pref(bridge, &res, true);
> +     if (bridge->pref_window)
> +             pci_read_bridge_mmio_pref(bridge, &res, true);

These two if-statements are redundant and can be removed.
pci_read_bridge_io() and pci_read_bridge_mmio_pref() already return
early when io_window and pref_window are 0.

Thanks,
Josh Hilke
