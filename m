Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC76448B9B;
	Thu,  1 Oct 2026 16:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870808; cv=none; b=lWoJvs5Eu2p6FNImGjGrLLP1IisTsaarCUajiGHna22S+PJKhMuzp835ikcHKfdSGYDU5zXOxWHzkU0cBIJm8SufGEZ0SIO0C78fNXDgu5jjIRZjeWTvYRMgjDzsJ/8vZq8BpNrzwWJtuYlWJII9zsxEQAmmc+57vlc4MUdLuQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870808; c=relaxed/simple;
	bh=B68Cer7DOS5VhOjaq0WU57dQFZHwLItSc0UvX0jtCrk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CbyGgiusZGGA0Q2cush6KmDY6dh3zUfJNjjsaxtbkqeSmOlkqLEuMXGnfNz8ewvUOl9h8acrV2jJnxxeMHRO1zosmQoXg3By+dphd35hu62CNDGrFuu6Ba/J5dZPzjwHRe2x6TQyX2MREbEVzpPqtmoLJvMjuPrSKqR9v/DTwsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Jm0Jb4qT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Jm0Jb4qT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56BCF1F008BC;
	Thu,  1 Oct 2026 16:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790870805;
	bh=S+CR/k1bIRO6Ds98SDH7fis+WEl31ClPXh+IdiWRxkw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jm0Jb4qT7GZNqd3wXqZuoFbfN0Kwv3vD91NaTZa/EyTJTtLplGEgxFEXh3p8A+eKg
	 sSiQe3HQ7yBFviPNWO2oSePSlVI/N3+RDMrToOh09L2yjx3NVKcTDJulKLfFsLqBRS
	 IDB4wf+1da79wmfeOpUoOIevgEXLOPQd4AINowrs=
Date: Thu, 1 Oct 2026 18:06:39 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Timo Joannin <timo.joannin@gmail.com>
Cc: guojy.bj@gmail.com, m.steinmoetzger@gmail.com, atharvmargur@gmail.com,
	straube.linux@gmail.com, andriy.shevchenko@intel.com,
	s9430939@naver.com, qstrydom0@gmail.com, dev.lmmrtns@gmail.com,
	khomenkov@mailbox.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to
 rtl8723bs_phy_status_rpt.
Message-ID: <2026100155-abiding-immunity-0c8d@gregkh>
References: <20261001155134.159481-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001155134.159481-1-timo.joannin@gmail.com>

On Thu, Oct 01, 2026 at 05:51:34PM +0200, Timo Joannin wrote:
> The struct identifier references the 8192CD chip while being in a
> rtl8723bs codebase. Additionally, the identifier uses the _t suffix,
> while being generally reserved for typedef identifiers.
> 
> Rename the struct to rtl8723bs_phy_status_rpt
> across the rtl8723bs codebase to accurately
> reflect the driver and clean up the naming.
> 
> Additionally, propagate the real structure type all the way
> through the call chain to remove redundant casts to and from u8 *.
> 
> Signed-off-by: Timo Joannin <timo.joannin@gmail.com>
> ---
> Changes in v3:
> - Included patch version changelog (missed in v2, sorry).
> 
> Changes in v2:
> - Propagated the real struct type through the call chain to remove u8 * casting.
> 
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c   | 6 +++---
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.h   | 5 +++--
>  drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c | 7 ++++---
>  3 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index 34b0369a7936..c85194c8fe67 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -95,7 +95,7 @@ static s8 odm_cck_rssi(u8 lna_idx, u8 vga_idx)
>  
>  static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
>  				      struct odm_phy_info *phy_info,
> -				      u8 *phy_status,
> +				      struct rtl8723bs_phy_status_rpt *phy_sta_rpt,
>  				      struct odm_packet_info *pkt_info)
>  {
>  	u8 i;
> @@ -105,7 +105,6 @@ static void odm_rx_phy_status_parsing(struct dm_odm_t *dm_odm,
>  	bool is_cck_rate = false;
>  	u8 rf_rx_num = 0;
>  	u8 lna_idx, vga_idx;
> -	struct phy_status_rpt_8192cd_t *phy_sta_rpt = (struct phy_status_rpt_8192cd_t *)phy_status;
>  
>  	is_cck_rate = pkt_info->data_rate <= DESC_RATE11M;
>  	phy_info->rx_mimo_signal_quality[RF_PATH_A] = -1;
> @@ -383,7 +382,8 @@ static void odm_Process_RSSIForDM(
>  
>  /*  Endianness before calling this API */
>  void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
> -			  u8 *phy_status, struct odm_packet_info *pkt_info)
> +			  struct rtl8723bs_phy_status_rpt *phy_status,
> +			  struct odm_packet_info *pkt_info)
>  {
>  
>  	odm_rx_phy_status_parsing(dm_odm, phy_info, phy_status, pkt_info);
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
> index ca3380328a72..21182a880da3 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.h
> @@ -18,7 +18,7 @@ struct phy_rx_agc_info_t {
>  	#endif
>  };
>  
> -struct phy_status_rpt_8192cd_t {
> +struct rtl8723bs_phy_status_rpt {
>  	struct phy_rx_agc_info_t path_agc[2];
>  	u8 ch_corr[2];
>  	u8 cck_sig_qual_ofdm_pwdb_all;
> @@ -57,7 +57,8 @@ struct phy_status_rpt_8192cd_t {
>  };
>  
>  void odm_phy_status_query(struct dm_odm_t *dm_odm, struct odm_phy_info *phy_info,
> -			  u8 *phy_status, struct odm_packet_info *pkt_info);
> +			  struct rtl8723bs_phy_status_rpt *phy_status,
> +			  struct odm_packet_info *pkt_info);
>  
>  enum hal_status ODM_ConfigRFWithTxPwrTrackHeaderFile(struct dm_odm_t *pDM_Odm);
>  
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
> index 304fda3a3b5c..a62b845c69f9 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c
> @@ -73,7 +73,7 @@ static void update_recvframe_attrib(struct adapter *padapter,
>   *precvframe->u.hdr.rx_data should be ready!
>   */
>  static void update_recvframe_phyinfo(union recv_frame *precvframe,
> -				     struct phy_stat *pphy_status)
> +				     struct rtl8723bs_phy_status_rpt *pphy_status)
>  {
>  	struct adapter *padapter = precvframe->u.hdr.adapter;
>  	struct rx_pkt_attrib *pattrib = &precvframe->u.hdr.attrib;
> @@ -125,7 +125,7 @@ static void update_recvframe_phyinfo(union recv_frame *precvframe,
>  	pkt_info.data_rate = pattrib->data_rate;
>  
>  	odm_phy_status_query(&p_hal_data->odmpriv, p_phy_info,
> -			   (u8 *)pphy_status, &(pkt_info));
> +			   pphy_status, &(pkt_info));
>  	if (psta)
>  		psta->rssi = pattrib->phy_info.RecvSignalPower;
>  	precvframe->u.hdr.psta = NULL;
> @@ -317,7 +317,8 @@ static void rtl8723bs_recv_tasklet(struct tasklet_struct *t)
>  
>  				if (pattrib->pkt_rpt_type == NORMAL_RX) { /* Normal rx packet */
>  					if (pattrib->physt)
> -						update_recvframe_phyinfo(precvframe, (struct phy_stat *)ptr);
> +						update_recvframe_phyinfo(precvframe,
> +							(struct rtl8723bs_phy_status_rpt *)ptr);

Something is wrong here.  WHy is this "phy_stat" to start with and not
just struct rtl8723bs_phy_status_rpt?

This should probably be a patch series, first one renames the structure,
and then the rest unwind the cast mess so that you end up with just one
structure being used here and not two different ones with different
fields in them.

thanks,

greg k-h
