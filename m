Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE89470EA8;
	Tue,  1 Sep 2026 09:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788255988; cv=none; b=Sp+qteT3p56q9G+bHrBNxlpD1T+5qQTJSP3PrOkl5Zr0pGLig8SirwK+Ngl1QVDjVO81ucQb2H/2aA9lHltv7TDNNa/KLZSmaMy50ZLYgMr0sUSFXSTPmdvH14FVw0hjHhJpb6z0WJv4QXh6RqxrPWw1GUGgaNgWnStphjikFfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788255988; c=relaxed/simple;
	bh=4C5RnHT6lscVJ9vJ4UbWcjYCO3BacG5iWgoyOwNaWCs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hwe7fiWSXTS5bewx35lThSHNQhN/ChIg02u50DmE1m2I7pn+LLz3V+FkMMR4Gmsn50LzrdiMjqsJEVnzE/C0Jwdt914FjkGkymEYsTyEMH7akWbJOmvWBHCD1pYIIOpI9F0ALXeTOboakpH8RZ6GovWWj3f+1po2bxo73GgfIA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ybV6aofO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ybV6aofO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85BA71F000E9;
	Tue,  1 Sep 2026 09:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1788255986;
	bh=5ziELb1JX9+0BuCz0vMtvJY4vBcPqiv0MfkE4YLMxrU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ybV6aofO+6A2ukGzOhn23czb7tLd08UaLjcz7SnfyPRHPXA5tTF5CkiNkv9uQP3vF
	 q72FokdEwfDhXlXduMh/6h1cIOkyrzuf97IwhKCcUunf3xoghb6CtrLe+KPeyhKhRg
	 maWryBDei4kUvZ0KpwaG8s47J22gjPw5D+4R7RNw=
Date: Tue, 1 Sep 2026 11:46:14 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v3 0/2] staging: rtl8723bs: Changing two struct members
Message-ID: <2026090103-spinal-revisable-990f@gregkh>
References: <20260715171634.1550-1-fliegbert2@gmail.com>
 <20260731142004.15281-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260731142004.15281-1-fliegbert2@gmail.com>

On Fri, Jul 31, 2026 at 02:20:02PM +0000, Dalvin-Ehinoma Noah Aiguobas wrote:
> This patch changes two members of the struct adapter.
> Two additional patches ar made to fix some checkpatch warnings.
> 
> Changes in v3:
> - Rebased against staging-testing
> - Fixed building error
> 
> Changes in v2:
> - Rebased against staging-testing
> 
> Dalvin-Ehinoma Noah Aiguobas (2):
>   staging: rtl8723bs: change struct member bSurpriseRemoved
>   staging: rtl8723bs: fix Alignment should match open parenthesis in
>     rtw_mlme_ext.c
> 
>  drivers/staging/rtl8723bs/core/rtw_btcoex.c   |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_cmd.c      |  8 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme.c     |  8 +-
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 80 +++++++++----------
>  drivers/staging/rtl8723bs/core/rtw_pwrctrl.c  | 12 +--
>  drivers/staging/rtl8723bs/core/rtw_recv.c     | 10 +--
>  drivers/staging/rtl8723bs/hal/rtl8723b_cmd.c  | 12 +--
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  8 +-
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  4 +-
>  .../staging/rtl8723bs/hal/rtl8723bs_xmit.c    |  8 +-
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      |  2 +-
>  drivers/staging/rtl8723bs/include/drv_types.h |  8 +-
>  drivers/staging/rtl8723bs/os_dep/os_intfs.c   | 10 +--
>  drivers/staging/rtl8723bs/os_dep/sdio_intf.c  |  4 +-
>  .../staging/rtl8723bs/os_dep/sdio_ops_linux.c | 32 ++++----
>  15 files changed, 104 insertions(+), 104 deletions(-)
> 
> -- 
> 2.55.0
> 
> 

No longer applies, can you rebase again?

thanks,

greg k-h
