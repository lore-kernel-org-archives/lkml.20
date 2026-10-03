Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8884334750B;
	Sat,  3 Oct 2026 06:45:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009905; cv=none; b=Ldts2/ig4e1V7gEIzuHI52R9UZ3k1sEAmeXbgs2e79QmLlEOP4h/9A44Ze/G6b/SLMSoFkq6aqpfooqGqTiFYjeewZwII8eIaYbCaf39Xk8duITxHuB1KEj0itd5ad4fK5mtV4ULsJNWFqVFgcOhYJwgCdz7MEappjI8JHAP/qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009905; c=relaxed/simple;
	bh=Er1EbmNcqJ2vl55rBFE4wBW3GRPVnX1NIn4YwL68seA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iYK0qYd0W+Al7E/6T4XXXuDrF7lZZUsek3hmwzeiFHjwGRm7fs4vonPMzxQ3sv6M+KbwJEJ0xKsAAOpwKGU23ihqAN0D8dKME2o1ULeeYocDk8s4NjrT3x8PHlFl+vuGY5C5jyMFSV4BKA3s5moSacOkY1V/w6MiGF5+WiGvrK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=bxJbXSVh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="bxJbXSVh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EF841F0089B;
	Sat,  3 Oct 2026 06:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791009902;
	bh=/OOfjkKWnrnWe006CFmU9mSuOdaA/1ieMkxkgIOKeGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bxJbXSVhTkoWoTKwnsrWN0Hm6yvJGq/4Gg6wKzWoavbKVLMBGv6eRcdC1HhZVivGD
	 y0tLnx19RyBtiLC2sO14oWIEpFrxFx5jupcAlPmzStHr1MbdJDDTnZRDt/2hOCHBWx
	 9aNk4LvvDv5X1vk/FTpkIRy9s/xrqi5m2DvU8sbc=
Date: Sat, 3 Oct 2026 08:44:59 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove dead antenna diversity
 infrastructure (FAT/SWAT)
Message-ID: <2026100304-entomb-collector-9004@gregkh>
References: <20261003003341.238789-1-marinela.selseth@firmwaredesign.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261003003341.238789-1-marinela.selseth@firmwaredesign.org>

On Fri, Oct 02, 2026 at 07:33:41PM -0500, Marinela Tatiana Selseth wrote:
> Deep analysis reveals that the driver contains major vestigial out-of-tree
> architectural frameworks for Fast Antenna Training (FAT) and Software
> Antenna Switching (SWAS) that are completely uninitialized, unread, or
> write-only.

what tool did this "deep analysis"?

> 
> Remove the 'struct fat_t' definition from hal/odm.h and refactor the
> fallback path in hal/rtl8723b_phycfg.c. Because the unassigned structural
> member 'RxIdleAnt' naturally defaults to 0, the conditional path check
> statically resolves to false, permanently routing RFPath to RF_PATH_B
> whenever antenna diversity is active. Hardcode this layout behavior to
> match factual reality and remove the now unused macro 'MAIN_ANT'.
> 
> Additionally, purge the write-only 'struct swat_t' infrastructure from
> hal/odm.h and include/hal_data.h. Inside hal/odm.c, eliminate the dead
> variable tracking assignments while explicitly preserving the hardware
> register read to rDPDT_control as a dummy read to ensure initialization
> sequencing and hardware timing remain completely unaltered.
> 
> Lastly, clean up legacy comment baggage across hal/odm.c and
> hal/odm_DIG.c. Remove arbitrary spreadsheet digits and references to
> unsupported legacy chipsets (92E, 8723A, 8821, 8812) to ensure inline
> notes are highly focused on the active RTL8723B Bluetooth coexistence
> parameters.
> 
> Signed-off-by: Marinela Tatiana Selseth <marinela.selseth@firmwaredesign.org>
> ---
>  drivers/staging/rtl8723bs/hal/odm.c           |  12 +--
>  drivers/staging/rtl8723bs/hal/odm.h           | 100 ------------------
>  drivers/staging/rtl8723bs/hal/odm_DIG.c       |   5 +-
>  .../staging/rtl8723bs/hal/rtl8723b_phycfg.c   |  11 +-
>  drivers/staging/rtl8723bs/include/hal_data.h  |   1 -
>  5 files changed, 11 insertions(+), 118 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
> index f3989fa33d9f..00b938071dee 100644
> --- a/drivers/staging/rtl8723bs/hal/odm.c
> +++ b/drivers/staging/rtl8723bs/hal/odm.c
> @@ -461,12 +461,8 @@ static void odm_RSSIMonitorCheck(struct dm_odm_t *pDM_Odm)
>  /* 3 ============================================================ */
>  static void odm_SwAntDetectInit(struct dm_odm_t *pDM_Odm)
>  {
> -	struct swat_t *pDM_SWAT_Table = &pDM_Odm->DM_SWAT_Table;
> -
> -	pDM_SWAT_Table->SWAS_NoLink_BK_Reg92c = rtw_read32(pDM_Odm->Adapter, rDPDT_control);
> -	pDM_SWAT_Table->PreAntenna = MAIN_ANT;
> -	pDM_SWAT_Table->CurAntenna = MAIN_ANT;
> -	pDM_SWAT_Table->SWAS_NoLink_State = 0;
> +	/* Dummy read rDPDT_control to preserve initialization hardware sequencing */
> +	rtw_read32(pDM_Odm->Adapter, rDPDT_control);

While it's nice to preserve this, how about testing on real hardware to
see if it too can be dropped?

thanks,

greg k-h
