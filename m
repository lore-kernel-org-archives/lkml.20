Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DCF4718CB
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789076269; cv=none; b=H0yp/L7tQx2Vl7n9M7Ul54jmfdeXZutY+xSuKgUvkZoRIDP/fgXF8t1AC7IpmRzM5KpBOXzy/SMt7UXEhYCCLXPfynWsB1Pi9bVNyhUsboAQM87Oq8K2GqFAUStYfl2VNv5F8cuY6Ap70YH0rRQ4PxP3hxKrXm+Kgv9V/RESy0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789076269; c=relaxed/simple;
	bh=un7OMWQ5+Bl1tHxViQ8Q6BOKaEMkVJ7XSFFAqOE6ovk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hGyaZvdYggcqpaDbNAsUvlBNQNkwJ4pnpr2BPhnbCdwe6PKoF78Y9jPvcBbta8IZVHUFwdM2iR6KY7/+GRqTAq2q+TTeYgYt5jgREWpiY34L5sYLdkrcOXrqN3jevkX8wNw2PODmNVSxpYrs5eXtSaZXuWO46Vf1calNBDMavTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=j/OfRX/1; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="j/OfRX/1"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5218927884fso3594011cf.3
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1789076261; x=1789681061; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ozbwghE9AMpwIIhz2P8UJs4AXIT1SYFdl3Q4CzsGjEs=;
        b=j/OfRX/1/b1t8Lz4YYTK1C+7uixEgr2xQCYV9GOBs3ipAuwDmePDFm+tLffdzZIfHn
         aUO2UKgFVQEA77YkrMwfDhQKZxU3i3lCyVO61al+SQ4JyioWg4+E9brl33WExQz2EZkp
         DS4QQ7rNyK7lxer9URIkn5aNKrV3tMNw79ZP6xMMndVe58jCHIf7G6GS+OohYSy7U0eV
         TE0xMTbUCW4xWj2+BA6KySsxlxOAmPg3HYJ/E9rAK3/34T3gaRpzC9OKCkBamqBwtzA1
         8/ASOvgUkQSUCGQ+S8V/YXJzj1ec6jOKC7ZLBehPYK1RtLiBaDAiRpr3LnwrddLa8hAR
         yrkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789076261; x=1789681061;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ozbwghE9AMpwIIhz2P8UJs4AXIT1SYFdl3Q4CzsGjEs=;
        b=qFPkwis+UdLSSmcA+3NvaZ4XEl/fjGiJ7lcBUKVvxICGS95U9NJpDXY8BW+OrCIEzV
         sRSYc3xQHxi5La08Vo8pVpQKfUqFR01YYgXQSp6/OHJAN8c68PXX6i5cTE9mLzxMHkoM
         XdLWLVv2KuUwnTJZikXRBeeidX6W2+esxWC1rsLuQuvYvaC429DHVoZ2OX1htjC2tw6d
         /nU2N1SFJHb+Vxp0fymq9SpwtH06HOeEIopqIk5DEITVouBMl0pwoQekHCZUzlf1lV22
         RSFocM9IU4Vl4PgoU6ussjZd92UztE543gv/HzPYhW/fmxV1+XmWiDs29EW5bNb7qfj4
         2Jcw==
X-Forwarded-Encrypted: i=1; AKwUvByW9wHp+rZ+DjRVyOI+ip1Fj6Vig5U4omQA6nObrgsQaK9pIirG7zJ+Ev1IHMZ5Dxl4C07c8j2Fo0Dgj/E=@vger.kernel.org
X-Gm-Message-State: AFuF++kmxOtImsFv2MK0xxYoZKBrwsZAjNI7v01W4Vk8Z7uns0R8pIgA
	a0iQT1Gr0u6/GinuzQwUHTpAK8k+PDZgDVNvNmkHVnQPuPyeRtOUdu5qcPew32dcQr8=
X-Gm-Gg: AYBFou0iqZxVtjn5f6fvezH2hBiGSk6FjzfVwyv2RpLPeoiW7QZW6Z/SvDQw4Us9gcf
	wmQ9bwBI4l59df/+fE+PZFqDX5T7oO7S0Tr6cvupQxsmpbzSq+X0hby7ei8uYuHO5JpPzwz080W
	PmfXOSZZgIdODCQXzOhThuzZthAy0z33TAR6MJi8FWE/knSkrEmrmD7dO30ktOKrvevLQnvik5F
	kmSWObduC+Hha5vF9EA9Y1ZB/zm6tofjS+0ndrt3CS1Hrg6cxzeRK0qgK2BskhsE4l81weCTELk
	4wlauQzQ62sQS2JhI25p+GRx8/sQxdJWXqQY6sPS7nrQLYeS0zJFgOd/8UyHL27UbG7FYI3Avz7
	jARHGvGUrAClsQz+93eflT5/fzaFib6h4yYUvLGHBycBYBvS+LLgS7n8pyIJyhdCFgypezg6Vos
	XGTR6k/Pib3BO+d7pgua7GDnsIAIxjI6OGjAiQ3WzIAT6t+LBUEtt0/t8ItsiqazovmYnD8RnQ6
	HjhpubJN8Rq10H4bjhxVeVeAdCmI51R8l5M
X-Received: by 2002:a05:622a:393:b0:530:a441:c52d with SMTP id d75a77b69052e-530c876307fmr21122731cf.46.1789076261010;
        Thu, 10 Sep 2026 14:37:41 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f4d3779sm5444196d6.43.2026.09.10.14.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:37:40 -0700 (PDT)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-pci@vger.kernel.org,
	David Matlack <dmatlack@google.com>
Subject: Re: [PATCH v8 00/12] PCI: liveupdate: PCI core support for Live Update
Date: Thu, 10 Sep 2026 21:37:36 +0000
Message-ID: <178907602445.560913.2482730956380750475.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260728221007.2098560-1-dmatlack@google.com>
References: <20260728221007.2098560-1-dmatlack@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 28 Jul 2026 22:09:54 +0000, David Matlack wrote:
> NOTE: I am sending v8 out a little earlier than I normally would since I
> will be AFK from July 29th (tomorrow) through August 6th and would like
> to post the changes made in response to v7 feedback before then. I will
> respond to any review feedback on v8 on August 7th or shortly after.
> 
> This series can be found on GitHub:
> 
> [...]

Applied,

https://git.kernel.org/pub/scm/linux/kernel/git/liveupdate/linux.git/log/?h=lu-pci-preservation

Thanks.

[01/12] PCI: liveupdate: Set up FLB handler for the PCI core
        commit: acff3a35a49097424762f255afdaf2a122e926a3
[02/12] PCI: liveupdate: Track outgoing preserved PCI devices
        commit: ced0d433a98ccc33495a985580bfefb62d73b16c
[03/12] PCI: liveupdate: Track incoming preserved PCI devices
        commit: d96e637021905ee22ef75f3608b46287b3d44508
[04/12] PCI: liveupdate: Document driver binding responsibilities
        commit: 4d9305a6938a66ccc1154dc5fa5a8a9ac56eb549
[05/12] PCI: liveupdate: Preserve bus numbers during Live Update
        commit: 8db5cb4011d0ebde5fbadf1236dfcb23bb8ce007
[06/12] PCI: liveupdate: Auto-preserve upstream bridges across Live Update
        commit: a7709b31ea29cb7d65b75beb844e0b92a20d4ab0
[07/12] PCI: Refactor matching logic for pci_dev_acs_ops
        commit: d2cc005d11de82f352e1f30f7b9aa2a4c463dec0
[08/12] PCI: liveupdate: Adopt ACS controls in incoming preserved devices
        commit: bd5970669fa8a2c1bc04c3fa516a0667a090c604
[09/12] PCI: liveupdate: Adopt ARI Forwarding Enable on preserved bridges
        commit: 48928296f529d15ecf66c263f3cc5fc657894e26
[10/12] PCI: liveupdate: Freeze preservation status during shutdown
        commit: 09907e211d2d63cc74f5a00e5949866f1078da76
[11/12] PCI: liveupdate: Do not disable bus mastering on preserved devices during kexec
        commit: 7f44eb94b1a85d2827610726e43de5554795cbdc
[12/12] Documentation: PCI: Add documentation for Live Update
        commit: c08eff447b966b21511c997272612e9665b0bd6e

Best regards,
-- 
Pasha Tatashin <pasha.tatashin@soleen.com>
