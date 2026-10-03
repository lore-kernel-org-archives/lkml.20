Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D4D3438A1;
	Sat,  3 Oct 2026 08:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791017993; cv=none; b=cSoey1EmZFM4TYWEQtUmm/va6zkvu5f/v3SWgQx+UgyCITSHE2j+VwFrLenePpU8CzxoTd3xMbrTpsq+eIqq+cydPNwvfs6fd7k1GbFgpZc0xGRnx7k2cFWYnD80772IbScEmJKo6pEEzJUvYfJm/S+uHCmGb7d6hezyGAGIy18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791017993; c=relaxed/simple;
	bh=s8Cu3qre7Neg4ccvJP+sqhesl6Xmni43rPSqqm6CaXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNKvZpwopeWGYQ08x7Zv9ohw2FZpstZaJlSsLBvasAyQ962iPqvwwYxEOE5RsRlf0Zki48ASLICTrvzjGXqJaS/bST1goYURunZnU0wi3GpTiwy3zsgIMjW+4ujVQM4f12pPuEkm8fj+qlDTgrGkeE6IYcIFkW9xztkvDnfRcJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=geW2TDtS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="geW2TDtS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A89A01F0089B;
	Sat,  3 Oct 2026 08:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791017992;
	bh=eMzRQ3loCT4X6MsgaYehq758YXz8sTdDO6zQ9/A0wec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=geW2TDtSj9738bqRknuucxFq8St6BwFeXXYq3I1a74hMgzugcnj6CyNd/jCuSZS5V
	 wSUAmvyaCprKHD27hgYAY3p8dkc66BzMN7UPl8+JwQYTv8xcw6u3Jn70MGyYvWItJL
	 jAKa7o5/FyMp3hsmhXj15QCa+hkReOWXGN6duFuY=
Date: Sat, 3 Oct 2026 10:59:48 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: condense NDIS encryption status enum
Message-ID: <2026100334-delegator-status-fa8c@gregkh>
References: <20261003074943.267819-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003074943.267819-1-marinela.selseth@firmwaredesign.org>

On Sat, Oct 03, 2026 at 02:49:43AM -0500, Marinela Tatiana Selseth wrote:
> Address maintainer feedback regarding loose anonymous enum constants
> and redundant naming aliases. The legacy driver framework contained
> multiple duplicate definitions (such as mapping both WEPDisabled and
> EncryptionDisabled to identical tracking states) alongside several
> completely unreferenced, dead tracking properties.
> 
> Clean up this subsystem by defining an explicit, named enumeration
> layout 'enum ndis_802_11_encryption_status' inside wlan_bssdef.h.
> Consolidate redundant aliases down to singular, uniform variables,
> purge all unused legacy elements (KeyAbsent, NotSupported, and
> EncrypteionWAPI blocks), and convert all remaining active states
> over to standard uppercase snake_case conventions.
> 
> Update all internal software state assignments and state evaluation
> loops across the entire driver operational baseline to conform to the
> updated definitions, ensuring code tracking clarity while leaving
> hardware execution behaviors completely unaltered. Fix associated
> line length violations and remove redundant braces for single-statement
> conditions introduced by long macro names.
> 
> Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>

Did you forget an Assisted-by: tag?

And isn't this v2?

thanks,

greg k-h
