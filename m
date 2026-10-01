Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D95136A03F;
	Thu,  1 Oct 2026 15:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790869249; cv=none; b=lz0zNbBeDz4TU7ZDffjB7WcicmqEbWgjRS4pGiTBAJ6OwrvB8qmmxXm3J+ToGWVi+fxc08q0azWrRgflpnASbpObzUQMMnr/HIxydMheo09YgrLd4wi09kSJaYKBsJeI8iwDGj66v6+d0/Vo0eozEA2V2B8WV3Ha6OfJtaBqqP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790869249; c=relaxed/simple;
	bh=U7Ad+xuU3w/wQ7jkjaC+yGoF7bPEvnOwnpDJh1/pZv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uckn1971YVHJ/07X52J5oNd1aWMhE3oCODVBiBGnswfUp7btFsaRSFNcKWAJeSXKz8FivsBorKEVzMY1fX44Is1OILkn/k58hlZZ1nsAE4M7RyBqat3h+H+9WH54CyRP1MOdVRIIEjTeqN3taXxnW26oJfLqF/S+tJ1RcB7Mlhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TjGOUZY7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TjGOUZY7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EB71F000FF;
	Thu,  1 Oct 2026 15:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790869247;
	bh=V8aVElRAM117BYzn7qwuhH9w0KxLFctCUBIZGzrp0ko=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TjGOUZY7MsgNHoqZSKdufqJyypYyjqWVIoBPCcdjnm9gxAVoxle34lDt1vsstMZc6
	 iBPw1wZ8Z0OKGB5Z1IGHiq97vxbcYTFFOMAEA/SQVta1wL0/pIej/dlh77nGHaDxEy
	 GYVlniXkJ3Fpd1b+b/C+Hy4juqQR0DREeTaRCBr8=
Date: Thu, 1 Oct 2026 17:40:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Timo Joannin <timo.joannin@gmail.com>
Cc: guojy.bj@gmail.com, m.steinmoetzger@gmail.com, atharvmargur@gmail.com,
	straube.linux@gmail.com, andriy.shevchenko@intel.com,
	s9430939@naver.com, qstrydom0@gmail.com, dev.lmmrtns@gmail.com,
	khomenkov@mailbox.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: rename phy_status_rpt_8192cd_t to
 rtl8723bs_phy_status_rpt.
Message-ID: <2026100130-jersey-durably-8245@gregkh>
References: <20261001151814.157881-1-timo.joannin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001151814.157881-1-timo.joannin@gmail.com>

On Thu, Oct 01, 2026 at 05:18:14PM +0200, Timo Joannin wrote:
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
>  
>  					rtw_recv_entry(precvframe);
>  				} else if (pattrib->pkt_rpt_type == C2H_PACKET) {
> -- 
> 2.55.0
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
