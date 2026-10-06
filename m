Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DA63B9DAC
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281798; cv=none; b=blV8XAb/jRm9k5ZM2h8B01N5DLIITc41byOp3RolxTUmaIaaBi+EVLlXrabTr1jtwxyCrI9HlWsuBGMR4eoXyDEBFgbB3NOVTQz/h57vu9FmAWgZENFJqeAk3Keb8xawYh1skSiGJOVtG9spZE7AQL+nVYD1NJ0FjIu1Uc4cw44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281798; c=relaxed/simple;
	bh=kyU579XOXAIlEHwjuDyIrRWHf4a6GOX7VuOC6l8fjmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=g49Jyp8xholP/ltS2hoF1IGDHeb5hHQ/qxIMGZRIbcTNMKzyMMgjIc8T1o/TNUdAcxT6iqUnh6CP43nYL9dbQCCSPMLRLEmKgWtq+pqEsdf1kfoG52j6pjBBcUMscK0oDufv5jrAXJaM3TwtjumSW9GdaIwUBnyaNcubYH59RQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4m6DelR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4m6DelR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A97B1F000FF;
	Tue,  6 Oct 2026 10:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791281796;
	bh=kyU579XOXAIlEHwjuDyIrRWHf4a6GOX7VuOC6l8fjmE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=U4m6DelRB8wHStLxn63xF8zK9Q0lJZv42tbcWGb6jo3f11OeckqYgy4/XknjJnVBV
	 9TZgFLlgBrDI3aXjWGKyKFbzJ4o5IrmgS/VZ6QL5yGqFZxwN0ziH8u6knAEp/uCorV
	 jx3be0GagGZ7TcJsN2/PhGB1BtLVaD3h4fp89G+rA9fIlBTpNVddxPD0Rnq2DOpmHi
	 SiJwLQ8W6nAAhv07nRBlVEkJQMmT8+LUY9GCtYhgxo7eTG/iMjf0XxhRk4F6rziPF2
	 T3PJ2CVYEKSIDNLFsjxq5MI3cC39jquTFk7sytvwzKZGao0jMKTqYKfe+/QoLC1+GQ
	 rJnOZCytlFASA==
Date: Tue, 6 Oct 2026 04:16:29 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Andy Chiu <tchiu@tenstorrent.com>
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    linux-riscv@lists.infradead.org, andybnac@gmail.com, 
    dfustini@oss.tenstorrent.com, greentime.hu@sifive.com, 
    linux-kernel@vger.kernel.org, olof@lixom.net
Subject: Re: [PATCH v1 0/2] riscv: runtime enablement for native misaligned
 ucopy
In-Reply-To: <20260911182402.1434257-1-tchiu@tenstorrent.com>
Message-ID: <2d08eaa4-c7da-04ce-e3d4-7cddd336db12@kernel.org>
References: <20260911182402.1434257-1-tchiu@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Sep 2026, Andy Chiu wrote:

> This series is the continued series for commit b94cec5761d2 ("riscv:
> skip software algning code for HAVE_EFFICIENT_UNALIGNED_ACCESS") that
> makes the optimization available to distro kernels compiled without
> NONPORTABLE config. Now, the kernel can skip the software aligning code
> in ucopy after fast unaligned access is detected at runtime.

Thanks, queued for v7.4.


- Paul
