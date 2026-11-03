Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793733696;
	b=HPYPR0Yvey9/awyA8Imh4clbY3E3/xxg7pfliJQ8AK6mVhXDAJBN3ByPtGpY5dJy91w0
	 WG4+e0NuGv4P460RExswgmTzBK0B4ZipE1cwAZnIlH2M23KiQ85qgY0bYsv+zjv5697nt
	 ju9n4ekZxzROtn7TUwKud+jYPBEqX/qC79diSrzph5hMLI/qttHw/Rm9eor3oAKIc0V+q
	 26WDNuc683x4l5BL0WaL5dF7WODnFQPFcYt/wB5spN1C1wSgDYhYypYkntE0AQjeNGy3k
	 JH3WNYk5AmOPMaxGHoiWmGfI+OG1lmP4O5aqVdh1Nh6OrYgQis83s2nqVWdVrZWgl5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793733696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0uILcWGxRJkmEp+n0zS/w9W2zfSCMknq4cj8Cc7NJqk=;
	b=XJuDRtj296uQXzPl8eOa0ksC4fLowugzTtggFPoiMYfHIE8K7EDD3e+jEtMGDy9lmDfE
	 rdjE6jfCFwbuNjF6EcrgE0QcvhfcJ0hLYiZI1ZYEEPD9Ap1zsWOhOCDlgttQznwNmssJc
	 +Z2k78HiVxKrZttZmjraJIbv2ItxFgx5IUnO0MkZ3bH4hvBkFYKDD7c7gd0ULUB+sW2ZO
	 0Mlj0g0CvjAz0izCEkbxjeVmtY98+ZlQAp7fz1ZaPtmLFnHO3Kj0iQn0lruLeMfZejo54
	 LsX4//xbFnZ47wPN/5ldzrvh/bMZCx23P7g2JPGm1RXnyCjcjXve5bLGS/mtT02/1aw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=daX3WSnq;
	arc=none smtp.remote-ip=209.85.217.47
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94167606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 19:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94167606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=daX3WSnq
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-7cc013095d4so1424086137.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 11:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1793733694; x=1794338494; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0uILcWGxRJkmEp+n0zS/w9W2zfSCMknq4cj8Cc7NJqk=;
        b=daX3WSnq4qDjLDc80XZJ92cHFwfx/BNEqnqF7d0oiM8qdOwveA3kOfdkpnV0JQAqfJ
         9c5R4znbwgLfKPxmik9GaO+IAnvmTf/uQ6YP6XpZp+1ZS1e+LFiO9YK4lWdYesXRgPFq
         GMuOmLrdT7AQzH7vFJhtbl4KIA7vHxrZMr6eNBgZjPmDKKEDicV87Bpj3KlpcBlKNa39
         wxueRpM7ewhy0Qd1er83cA4fip43Hw6WqlNXArE1mJE6PFP9DdQboC3etpimf8naP3AV
         TM0xxfuHWyXdOm/5rrmF9zUS2yhPg4AS6HEwDL2/LzkGBSlRqRV0C9nk1Gp1FGYjChkk
         vrJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793733694; x=1794338494;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0uILcWGxRJkmEp+n0zS/w9W2zfSCMknq4cj8Cc7NJqk=;
        b=QFFB084SXV1XQaI4YN1CLX3cDZ7a8+vh6rJqtgnR8/Hiv1wL17Uwp6vifoOlt9T3oj
         IVdiNcbKNXgOe5ekKcQRU6F0HuLT0V6mW+gWZC2674fkuQez4hUU1YA6LI096DanYt77
         7+qPxfyHplVHVyZSxNV2xyPk0vrS8bCsr5qwdkVForwww1jENwPf35bZsUL7+IqkbUaC
         Zy7VviKdRKxi/byXI1CphVAgqblsQ4KGObHjNI3g/RyPCiiB1uU35V4/ZG2GDQr1B6nw
         /UfQaVcI92RvOgqCkLWW0YQS0oN2WPu9DsZqP8gXClBRLfmGGR/XooQTTODaWr4s2dc8
         hgtQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbmWPhFrYSlJH37UqN6fcF3pueSCFjB3qXzBOS0gHIh91GSez3hGa0k8K460fkk33tIjOd6vBTpFvoqOU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/6bY1MEC+IN4fIIOXl/sJYvWMDdaY/Mu/Eum/KrTTiDQAUr/kE
	KqqWXfctTJEB/Y5rWQv5ONXBDX9MlG6DbhGquKXLzs+/B727e6Wemqre/53v5KVY7w4=
X-Gm-Gg: AYBFou3pRKTmIt6aLWZCue3GE/xmotYN9khk5vqVrPW3b9O+cbB5rRtIKZBbMdsgq/2
	Ji2sMRs/e9j03PlxE1MvmMfryOrpY2vKiYY8Q1gqN5fmC/sNSP2wCxL2wehuFFfItmxfYZ2HsGX
	rt/vOXwNYUxv0SLKO4ATQaW7TCoVg1Bec1zXqv9TuaratKv8lFCv5VMDBlm7/tuSYPUcF3BUP3D
	WKoJycRtQqc2R8LatHWtjMSeldIwWUHVB4pd2JhECjP4p5y6YsfjZisaxzKm3e6VqY7btkhxgOJ
	D/vz6eb9YTpluYgUxG/SacjlA0B4izZGnBqFGMPjP+i0cIKYUHlQkSuBa0VmZ6NwjzxdPQ8dHbl
	+skbdMsSPR0PR0wu5uD67zlScxQodeEz+oPkXrcQJfZBkDLHh1TmX+F5pWSWEVuW9mBpWR5t17w
	2uy7fRontnqq1Dx9MdQ2MAPR5nxFw8CTaHd1gEyFeEJMVAF5rKPoXvIlb6ca/hM2eT0R5x06TAz
	6MnMI9rhzIApsMJLZvGSUHAuLdAk8RRHw+LNto+u5TeAbdR8VyYMHtYtDgjlpl3SOmKG5Lsqnke
	XalvC1B6Gy0+kBd/ZC+G+EonXeCwvqU7xftgcJEfkmLcCjM5JV6rMBM43W8Xqk7JgYZKcE9h9Yr
	QhA1sa08ghoHC66SF52DNB3yhQVyn4BfZwHwULB+PP1YudoRQAw9whhFliF/E6y+8fk4DV0kHiQ
	==
X-Received: by 2002:a05:6102:6c4:b0:7ce:78f9:adfe with SMTP id ada2fe7eead31-7d072c17d00mr5173411137.18.1793733689733;
        Tue, 03 Nov 2026 11:21:29 -0800 (PST)
Received: from soleen.c.googlers.com.com (64.167.245.35.bc.googleusercontent.com. [35.245.167.64])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-998d999c2ccsm560241.9.2026.11.03.11.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 11:21:29 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v10 00/13] PCI: liveupdate: PCI core support for Live Update
Date: Tue,  3 Nov 2026 14:21:10 -0500
Message-ID: <179373348545.623992.16522569527665218421.b4-ty@b4>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261013162529.1928093-1-dmatlack@google.com>
References: <20261013162529.1928093-1-dmatlack@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 13 Oct 2026 16:25:16 +0000, David Matlack wrote:
> This series can be found on GitHub:
> 
>   https://github.com/dmatlack/linux/tree/liveupdate/pci/base/v10
> 
> This series introduces support in the PCI core for Live Update, enabling
> drivers to preserve PCI devices across a kexec-based kernel update
> without interrupting the device. This functionality is critical for
> minimizing downtime in environments where PCI devices (e.g., those
> assigned to VMs via VFIO) must continue operating or maintain state
> across a host kernel upgrade.
> 
> [...]

Applied, thanks!

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=lu-pci-preservation

[01/13] PCI: liveupdate: Set up FLB handler for the PCI core
        commit: f874391deedec9be601bc044f2aed52a267a3671
[02/13] PCI: liveupdate: Track outgoing preserved PCI devices
        commit: e207461556c0d3a42fd59dc548e9e8f599aae298
[03/13] PCI: liveupdate: Track incoming preserved PCI devices
        commit: 42907d099a3c37f5a089d92465b3a61de9c7cbea
[04/13] PCI: liveupdate: Document driver binding responsibilities
        commit: 78d4d22c0d4e0830a5db9b903f1325b7fbe0eb17
[05/13] PCI: liveupdate: Auto-preserve upstream bridges across Live Update
        commit: 8178f14641e2d7acf648acc33a0cc070763250af
[06/13] PCI: liveupdate: Preserve bus numbers during Live Update
        commit: 3f832a32a1801a9e7b1dc4e88a3e1744a316b538
[07/13] PCI: Refactor matching logic for pci_dev_acs_ops
        commit: 966230f2ebac2013f60ba6376a6ca726f6427ecd
[08/13] PCI: Save and restore the ACS Control register and Egress Control Vector
        commit: 88016172c5585b1dd0d777ec529fcac577e4e94f
[09/13] PCI: liveupdate: Adopt ACS controls in incoming preserved devices
        commit: 1fabde9a0e4964ac43e8ef3f0c9619d8ed80cc23
[10/13] PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
        commit: 5506c59d1b844edad5cf2a704f8b87b353b3a2bc
[11/13] PCI: liveupdate: Freeze preservation status during shutdown
        commit: dbe2c3dfd43f9aa094b59669b81aa92b8685d23f
[12/13] PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec
        commit: 534abf9f0870b457e1e6f4ef8267b0471e9d2c2c
[13/13] Documentation: PCI: Add documentation for Live Update
        commit: 5d995129832f72dc7a3870eabb216d487a145cf3

Best regards,
-- 
Pasha

