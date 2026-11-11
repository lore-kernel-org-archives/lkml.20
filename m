Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794414965;
	b=p0vK9x7UyiZgFv9CLpUgxKMLA6vBvW9HkIB6kPoPxq5QH9erUT0qeZyxfn+5q9FncUzl
	 LWMvILN3KKR3Zb0RhQcniduAmp/g75QqDYnWMbeOUSywVbna3grw75262zsiifb3QAOUQ
	 RfTOh0qjaa/YmWJ+uUWr+yT+XY392d20SHnPFASJGt/5Jqi09yhZL+2JnpZgIpdBBb7/a
	 0MNnMCPKz8QyGMfOoGMFanKNMGv9DfOH/MRTvsU6T2iBrDrXAHBgo/D7kDJ0Zceg53WZ5
	 6bc/pYHkxv3iemsUaqC6XVdnZST74tBY/G7v0rPca37HYeElrRTID/PVxd4olXzjl2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794414965;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=9YFnZgNhPyoA/hpZg7SqznI4aFLyTBKsRmaGoanNujQ=;
	b=WC/U5GIL/ZiwWjXVOsQuirHQsZpEPOH3tzUSCbMkD5xmqcDpbshSL6f6HQJxIR9pajiM
	 5yMC8i9dp/ZgdkF50MxGaJfrwVz3vmVVdDWJOXfP95SbbWsZN6pKUruIzhHnbO/gLk25u
	 b+mRlIQDu/XlYyIxHQ4DNduJm1qYicZqnQ10iwcGdH8FBTONUsRrBFI0RSFWmH5EJNhXT
	 0h9MvYyg1gZoZIXid35eCcIp1iZhVX0CuGg0s+WhtyBz20kZ+9mab0ZtMz3OrZDSua3tP
	 EvweuZKD5z5zK5OxwuT2ddWBrc7QVQ8E/rsqG2JO2Bd55LwMOXKCFexnCt9xxjZ/mNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=WUjgm6P7;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073DE606A32A;
	Wed, 11 Nov 2026 16:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 073DE606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=WUjgm6P7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9YFnZgNhPyoA/hpZg7SqznI4aFLyTBKsRmaGoanNujQ=; b=WUjgm6P7Tb6AYnbmfEnGD0Agbc
	z/G6mQA4hPMVTErHI5njl7YrXg/fbTe1oHjSkCTN0auBCNviblIjO79k86LzMabO7EyMNYa8P3Fle
	pdJ2Mhly0yKYYKZguLanbjW2/vRs82T04WESPK2n87DtPsMpOL1jOMHU39836vSJglLx/V2xvPQvD
	50a56mMiwQnw78dA042OLAb6ooy71sDgWDfQQxZ0PCZOjnEYNjhjdG3ntkq0FI3kMSw3WoRK4thUc
	3i2yNG/cumlm68uo6mqTQxyGskujPKZMlae7mBlTEfEj2CuLY2MziTeMQAL2e8gYO2odShS/Zpm1r
	JliCxg2Q==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRBIW-00DJlS-0Y;
	Wed, 11 Nov 2026 16:35:44 +0000
Date: Wed, 11 Nov 2026 08:35:38 -0800
From: Breno Leitao <leitao@debian.org>
To: Rik van Riel <riel@surriel.com>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
	Qiuxu Zhuo <qiuxu.zhuo@intel.com>, linux-edac@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] x86/mce: Restore rate limit on MCE logged message
Message-ID: <avSZTQatplYDfHk9@gmail.com>
References: <20261108143751.3af49e48@fangorn>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261108143751.3af49e48@fangorn>
X-Debian-User: leitao

On Sun, Nov 08, 2026 at 02:37:51PM -0500, Rik van Riel wrote:
> FCommit ea324444ece9f moved the "Machine check events logged"
> print from mce_notify_irq() into mce_log() and dropped its
> two-per-minute rate limit as a side effect.
> 
> A particularly unhappy system can spew out around 100 million
> of those "Machine check events logged" messages every hour,
> without that rate limit. A large fleet may have several unhappy
> systems, leaving the netcons infrastructure somewhat flustered.
> 
> Reinstate the rate limit we had before.
> 
> Fixes: ea324444ece9f ("x86/mce: Restore MCA polling interval halving")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rik van Riel <riel@surriel.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
