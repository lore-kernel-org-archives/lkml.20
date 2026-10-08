Received: from mta1.migadu.com (out-58.mta1.migadu.com [95.215.58.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1823430CCA
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 11:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.58
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458499; cv=none; b=PrmDA6kyc/5B2LVD+bqZiexmI64MoX5LwajCKehjm1sAE3O9G9RKSfcBd+k+JFxkOUAWVaPm9kbIZ2lXifvZVfAG3UYBOrLfg8S/XG6VeSlSfyNqzsWWtGJ7kTYV+/yaAy7JxB0R+iEbyOlASysKyakmGuDTV9rWl9wN9duVf68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458499; c=relaxed/simple;
	bh=hN44cRPPJNs08AgZF8viTPk0lBwtAQRH0vIjNbzefVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tTn0qwaEgMXKgxX7Vf3lVUU1qA96qjcFlEdrgyb/MAZXGkkpn8p+HHmO4oWjgQoSjPv6Vi76ep6eA+nUCuuRaToDkHG8QGAa4jotynq18dL79xsAAjsehVwJOF+EUjgpiWMDYk4ebYU6G9mUVw5GfST/AR4WxYv3MMGPtT8fKBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=uyUJnMx0; arc=none smtp.client-ip=95.215.58.58
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="uyUJnMx0"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hN44cRPPJNs08AgZF8viTPk0lBwtAQRH0vIjNbzefVw=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791458495; v=1; x=1792063295;
 b=uyUJnMx0aK2axifmrh+RBKmKj6SYrrWM+69EA7kPNS0xG9PKgyI/9+0xzaqjzVzE0JReeaIE
 y0hOF2h/Sv3xtcwBZKm/rxg9DiaBZmwELUKieRzg7iC2kRqGW2b/wYT6r/MrH+7m6gyWtErJ1hI
 QSjciFBDbPXUXfycdQGph5BU=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id cea9a33647c304d7;
	Thu, 08 Oct 2026 11:21:35 +0000
X-Mizu-Trace-ID: cea9a33647c304d7
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5ba429b64c5so5957e87.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 Oct 2026 04:21:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz4k44SCNh4UqRdUkxuT1JI4HDui2f4Dc/va2mxN6y66WvHV8rCpuxnsg1e6P8Q535kLHzAlOaiaSdLlGU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLvTZgGoIQa94n8ACbw3IQ19XP7Vpdft06pa5JYu3GByFwtiqsN
	Qtyl9wp5K0+C8Xreghi2n49mZRDDKUeCQXcvNPaSF7TEuFjinol4eFTkIOy/mkDyI4PJrOzIZKA
	Ae9t1a/94Jj1Vn0y5o3NxoTwhyzQEAmQg35aFEhIa
X-Received: by 2002:a05:6512:1089:b0:5bb:7b34:8e00 with SMTP id
 2adb3069b0e04-5bcd41aa2fbmr117834e87.6.1791458492776; Thu, 08 Oct 2026
 04:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007150255.1648849-1-vdonnefort@google.com> <20261007150255.1648849-5-vdonnefort@google.com>
In-Reply-To: <20261007150255.1648849-5-vdonnefort@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 8 Oct 2026 13:20:56 +0200
X-Gmail-Original-Message-ID: <CA+EHjTxtnzcahWPtgvEdTyXV62EuYnMNFzgCbt9sBUe4Max1TQ@mail.gmail.com>
X-Gm-Features: AclHuK9PPIyWi-AF-JOxAvOaLC_7_TBjRNbevEdaA41uckDc-fo7UGZq6QbNwUw
Message-ID: <CA+EHjTxtnzcahWPtgvEdTyXV62EuYnMNFzgCbt9sBUe4Max1TQ@mail.gmail.com>
Subject: Re: [PATCH 4/5] drivers/virt: pkvm: Handle a granule larger than
 PAGE_SIZE for MMIO_GUARD
To: Vincent Donnefort <vdonnefort@google.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"

Hi Vincent,

On Wed, 07 Oct 2026 16:02:54 +0100, Vincent Donnefort
<vdonnefort@google.com> wrote:
[...]
> Validate the memory regions are aligned with the hypervisor granule
> before enabling the MMIO_GUARD support. If aligned, then the MMIO
> regions are and overshooting is safe as MMIO_GUARD is solely here to
> indicate to the hypervisor where the MMIO regions are.

nit: "the MMIO regions are and overshooting" is missing a word, "aligned"?

> It is possible to add new memory regions with memory hotplug later.
> However the alignment requirement is way more conservative than the
> maximum granule size of 64K. Nonetheless, add a test to document the
> limitation.

nit: this is a runtime check that disables MMIO_GUARD, so "add a
check" rather than "add a test"?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad
