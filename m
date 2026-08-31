Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C3387363;
	Mon, 31 Aug 2026 02:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788143185; cv=none; b=PQ4tBUy7rp3A3Y2Jn9fR37dQGJ0hfiERdRaCQP6AyV6W//G61+hlmf2VqmZLZr7bDRbfGqXWip/ItnlCbt8bZq8Ak0I6jpr5fVCjAwHT+fXNOzMdh00oZOH8XK6kHp+pqIvpEd8YfvkIS7fs47H9tzLsDi5KUc429YeVWu+JPnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788143185; c=relaxed/simple;
	bh=d8Hs6S+dKfpFggHaqLVu/GufQyKEH6HRxbqNopsYD40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qBYMiZ1w55Hf3zY4dLudoZuGChopuFb41UyPvZI7+5Pw0KpWjTfHxb0WcQyLO8aYyMK8tFBLEVETibiMC9js+Jm458rcbeymaS+pQ9cJRFbedmrVvu1SLkxIUDtDlv99SBDGbvLqwe9BYxJA6GKR6oJoMT+4WMUVTxCssxd08vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W7h8QDe5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W7h8QDe5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A771F000E9;
	Mon, 31 Aug 2026 02:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788143174;
	bh=PAuNlSD3KcRG2e6QUkGjSARsweEPhyxyVC+8H743MtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W7h8QDe56JzPkyprp5woK7/y/j89Diw9LYnHmfTjkWmNwKb3fAjyN4DEgp7Z0P6kv
	 gU46M2rbsN8sgqmUvO07Xw96GI9buacXspG6jmJZ0YSMWoJvvlhphjtggvjqMEeI7+
	 rKhx5pBIfuZch4/bmuG76al5GfGQRy1pXaC9xI4WZqWDmHQ/kA4i6sANgKBWBdjXFD
	 t8L7Mtsu/0m7dz6/owZbhTWA3S2QpwmU7yO9MHYhss8JM3191bxVke3Hgz/+vVlMd1
	 CosQvExXlR1qC1u4DPqW98VWATBnS5nBH080huN1MSFf6Ws2i62PT3CoPFclo5YiCP
	 Y2/6USXmrMnOg==
Date: Mon, 31 Aug 2026 02:26:11 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Daniel Balint <dbalint@google.com>
Cc: linux-kernel@vger.kernel.org, chrome-platform@lists.linux.dev,
	jakiela@google.com, hmazur@google.com,
	Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] platform/chrome: cros_ec: add API for power monitoring
Message-ID: <apTmQ4w3aupzVp0p@google.com>
References: <20260824155554.1046334-1-dbalint@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824155554.1046334-1-dbalint@google.com>

On Mon, Aug 24, 2026 at 03:55:54PM +0000, Daniel Balint wrote:
> Add new EC host command and MKBP event to allow cros_ec_pwrmon
> iio devices to query the EC for power monitoring data.
> The actual cros_ec_pwrmon driver using this API is currently downstream
> and will be upstreamed at a later date. This is a sync between the EC
> header and the kernel.
> 
> [...]

Applied to

    https://git.kernel.org/pub/scm/linux/kernel/git/chrome-platform/linux.git for-next

[1/1] platform/chrome: cros_ec: add API for power monitoring
      commit: b57af7f8d194617e965d9713a767cc012774a2b9

Thanks!
