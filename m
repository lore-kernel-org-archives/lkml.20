Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793547914;
	b=pC6/2DrFujCqZTCuPUKrx7b21T1cPQQtk4VzXZ9wz48rwe0GzvhI3z/9JBbqlnYaXd+G
	 96CzThluyXHsW/MQ595IvX7MOQAZ/IlpRYH3BFOJI/11k2Je/sAP7JaEBwzMTvXKW/CQH
	 dbIL9/nfVfTlI7FnHFBZr4diZYnaem/ahZUfRuLEr7CZiOjhGEY4+8agmTAVXOB7FSEo1
	 y4pFUaUUlTJorBFAwL8KDKV6s2lRCc4nGdxmxDFitDmZfCbXsiB85Mfaa51jFJvhhwWlr
	 zb4mkIYKy0vgzXk3BSoFcYV3ObMkwsB0QnVwtkN2rMjuyeDyIsSRCg/zESdv5g9473A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793547914;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=XRjT3VTaajCcFZPeCpCf01Ut57mwJ2M6igg0J48VnJ8=;
	b=VZaTkT5xhIjyLVWTTW+nrnkoPs7/wPg0a2hLts5lyBAgSxwLuGGyjESXh3MvG/Wd/3z9
	 A8mngo1i5857yIjCY26w2heMgtuQr1v2odF4tSLRLPOz5S5sOOB5l874utpNq77tf3YFX
	 UeFSfPiAzJYj20VrR4LE7YBw3Ejof0NySBeW6pHcS/0ud7VjkN0fHX2ji8TN/ePjDGI84
	 8xbYI7MW0PoBMuuIKHBcz9P+nZsWbYuEYu2XGGkgIt58QWOhqqo4XlKhjTr60F7Yfj56b
	 XG5rs48WLpxmeLgZSvj5ar2pLDuFhR8h9eKzzV0ruHoONQd6hw0GEcPBtumPocHwKdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wzaesWCw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A2B606A335
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 15:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=wzaesWCw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D66EE1F00A1C;
	Sun,  1 Nov 2026 15:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793547913;
	bh=XRjT3VTaajCcFZPeCpCf01Ut57mwJ2M6igg0J48VnJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=wzaesWCwtNN+1lDB+NECUNruInoXf1olvVq7w7oRkQdrsaqmAJk8SqwE4+ABxXcYp
	 UxY2Rsl/neti8u+M+Nq07S3hcH/vard+9ooq4n0XtQnlS0QFZWlZN6x0l4ms9GAEPg
	 a7QHQ3PAKLGekODnN+nTUbGriXwuyylJlPzydu9Y=
Date: Sun, 1 Nov 2026 16:45:06 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
	Menachem Adin <menachem.adin@intel.com>
Subject: Re: [PATCH char-misc-next] mei: bail out if no matching hbm request
 found
Message-ID: <2026110108-unnerve-transfer-3d5c@gregkh>
References: <20261101-bail_out_on_nonexisting_hbm-v1-1-ec1eb6aa5547@intel.com>
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
In-Reply-To: <20261101-bail_out_on_nonexisting_hbm-v1-1-ec1eb6aa5547@intel.com>

On Sun, Nov 01, 2026 at 04:32:06PM +0200, Alexander Usyskin wrote:
> Umatched HBM client response acts on wrong client
> as last traversed client is used.

Odd line wrapping :)

> Fill cl pointer only when match is found and add debug print
> for that edge case.
> 
> Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>

Does this need a Fixes and cc: stable tag, as it fixes a real issue
seen, or is it just a "handle the error path if it ever happens to be
hit" type of change for 7.5-rc1?

thanks,

greg k-h
