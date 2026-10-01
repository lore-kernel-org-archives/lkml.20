Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F903B47C6;
	Thu,  1 Oct 2026 05:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833732; cv=none; b=IkdSH1LTgiD2lqs9Lj9ywhyyaUYozNfXxPb1T6sZbyFOKa+7ZumYca8bszuyBlKADie80z520Bn05zLBGU6pL+0eq6DH+dN/KdRhWCMkBxPhlpIs17bc02GoBK0Gvt/6LQ69nwMAeloCMjZU/u++PsbWgQPm3eEpFm+iJUSqhGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833732; c=relaxed/simple;
	bh=EKWF3Wk4S9F5xTYx/2mTOZ5ahdiZMCeU59NCJh/w+ao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJsKz+tnue/fhYThVbmgWcMkwVTC1IuNTQMoh2MM+KQ5XaY1gqEuN7QEUQikUvml5PnITuBDc1Ji9YaYR+btOaiNQ2k++t9Yuh5RsGxSbMMQO9MPY7XkrpGTXf7ijkMTpfpqEPQ1vZP+XhAhIYZiigWzNm8OQu668ApilVCFZ/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=T9vV+PAw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="T9vV+PAw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 301481F000FF;
	Thu,  1 Oct 2026 05:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833730;
	bh=kj7sJHzLaVgfXW6vDs2baOAesbwW+dgGRXa5h4WNh8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T9vV+PAwHxcnLzMlHvWs15JqSVfEER+b1o916RRrYGTD5m31+AFoSRPuQHXhBZVwS
	 LwDbL2zdH4P/ZE8WYFqTLexccFIC1HVNLsT1eun02neUcZYWqyaarvJnmcyxhImYq9
	 K7fMj+QkF+1odxGW7ZaHx52Qd/tCxknZFGgzmZ1I=
Date: Thu, 1 Oct 2026 07:48:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?Q?Rare=C8=99-Mihai?= Vladu <vladurares@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style issues in rtw_recv.c
Message-ID: <2026100132-subsonic-outdated-88d6@gregkh>
References: <20260917100254.1067839-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260917100254.1067839-1-vladurares@gmail.com>

On Thu, Sep 17, 2026 at 10:02:54AM +0000, Rareș-Mihai Vladu wrote:
> Remove unnecessary parentheses around arguments to list macros
> and the address-of operator. Fix alignment to match open
> parenthesis. Issues reported by checkpatch.
> 
> Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
> ---
>  drivers/staging/rtl8723bs/core/rtw_recv.c | 63 ++++++++++++-----------
>  1 file changed, 32 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
> index 7568fc514..fbb223288 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_recv.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
> @@ -59,9 +59,9 @@ signed int _rtw_init_recv_priv(struct recv_priv *precvpriv, struct adapter *pada
>  	precvframe = (union recv_frame *)precvpriv->precv_frame_buf;
>  
>  	for (i = 0; i < NR_RECVFRAME; i++) {
> -		INIT_LIST_HEAD(&(precvframe->u.list));
> +		INIT_LIST_HEAD(&precvframe->u.list);
>  
> -		list_add_tail(&(precvframe->u.list), &(precvpriv->free_recv_queue.queue));
> +		list_add_tail(&precvframe->u.list, &precvpriv->free_recv_queue.queue);
>  
>  		precvframe->u.hdr.pkt_newalloc = NULL;
>  		precvframe->u.hdr.pkt = NULL;
> @@ -161,11 +161,11 @@ int rtw_free_recvframe(union recv_frame *precvframe, struct __queue *pfree_recv_
>  
>  	spin_lock_bh(&pfree_recv_queue->lock);
>  
> -	list_del_init(&(precvframe->u.hdr.list));
> +	list_del_init(&precvframe->u.hdr.list);
>  
>  	precvframe->u.hdr.len = 0;
>  
> -	list_add_tail(&(precvframe->u.hdr.list), get_list_head(pfree_recv_queue));
> +	list_add_tail(&precvframe->u.hdr.list, get_list_head(pfree_recv_queue));
>  
>  	if (padapter) {
>  		if (pfree_recv_queue == &precvpriv->free_recv_queue)
> @@ -181,9 +181,9 @@ signed int _rtw_enqueue_recvframe(union recv_frame *precvframe, struct __queue *
>  	struct recv_priv *precvpriv = &padapter->recvpriv;
>  
>  	/* INIT_LIST_HEAD(&(precvframe->u.hdr.list)); */
> -	list_del_init(&(precvframe->u.hdr.list));
> +	list_del_init(&precvframe->u.hdr.list);
>  
> -	list_add_tail(&(precvframe->u.hdr.list), get_list_head(queue));
> +	list_add_tail(&precvframe->u.hdr.list, get_list_head(queue));
>  
>  	if (padapter)
>  		if (queue == &precvpriv->free_recv_queue)
> @@ -323,7 +323,7 @@ static void rtw_handle_tkip_mic_err(struct adapter *padapter, u8 bgroup)
>  		key_type |= NL80211_KEYTYPE_PAIRWISE;
>  
>  	cfg80211_michael_mic_failure(padapter->pnetdev, (u8 *)&pmlmepriv->assoc_bssid[0], key_type, -1,
> -		NULL, GFP_ATOMIC);
> +				     NULL, GFP_ATOMIC);
>  
>  	memset(&ev, 0x00, sizeof(ev));
>  	if (bgroup)
> @@ -352,7 +352,7 @@ static signed int recvframe_chkmic(struct adapter *adapter,  union recv_frame *p
>  	struct security_priv *psecuritypriv = &adapter->securitypriv;
>  
>  	struct mlme_ext_priv *pmlmeext = &adapter->mlmeextpriv;
> -	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
> +	struct mlme_ext_info *pmlmeinfo = &pmlmeext->mlmext_info;
>  
>  	stainfo = rtw_get_stainfo(&adapter->stapriv, &prxattrib->ta[0]);
>  
> @@ -682,7 +682,7 @@ static void count_rx_stats(struct adapter *padapter, union recv_frame *prframe,
>  }
>  
>  static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
> -			struct sta_info **psta)
> +				     struct sta_info **psta)
>  {
>  	u8 *ptr = precv_frame->u.hdr.rx_data;
>  	signed int ret = _SUCCESS;
> @@ -768,7 +768,7 @@ static signed int sta2sta_data_frame(struct adapter *adapter, union recv_frame *
>  }
>  
>  static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
> -		       struct sta_info **psta)
> +				    struct sta_info **psta)
>  {
>  	u8 *ptr = precv_frame->u.hdr.rx_data;
>  	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
> @@ -866,7 +866,7 @@ static signed int ap2sta_data_frame(struct adapter *adapter, union recv_frame *p
>  }
>  
>  static signed int sta2ap_data_frame(struct adapter *adapter, union recv_frame *precv_frame,
> -		       struct sta_info **psta)
> +				    struct sta_info **psta)
>  {
>  	u8 *ptr = precv_frame->u.hdr.rx_data;
>  	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
> @@ -1059,7 +1059,7 @@ static union recv_frame *recvframe_defrag(struct adapter *adapter,
>  	plist = get_next(phead);
>  	prframe = (union recv_frame *)plist;
>  	pfhdr = &prframe->u.hdr;
> -	list_del_init(&(prframe->u.list));
> +	list_del_init(&prframe->u.list);
>  
>  	if (curfragnum != pfhdr->attrib.frag_num) {
>  		/* the first fragment number must be 0 */
> @@ -1378,7 +1378,8 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
>  	    adapter->securitypriv.binstallBIPkey) {
>  		/* unicast management frame decrypt */
>  		if (pattrib->privacy && !(is_multicast_ether_addr(GetAddr1Ptr(ptr))) &&
> -			(subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC || subtype == WIFI_ACTION)) {
> +		    (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC ||
> +		     subtype == WIFI_ACTION)) {
>  			u8 *mgmt_DATA;
>  			u32 data_len = 0;
>  
> @@ -1420,10 +1421,10 @@ static signed int validate_80211w_mgmt(struct adapter *adapter, union recv_frame
>  			if (subtype == WIFI_ACTION) {
>  				/* according 802.11-2012 standard, these five types are not robust types */
>  				if (ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_PUBLIC          &&
> -					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
> -					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_UNPROTECTED_WNM &&
> -					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED  &&
> -					ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
> +				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_HT              &&
> +				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_UNPROTECTED_WNM &&
> +				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_SELF_PROTECTED  &&
> +				    ptr[WLAN_HDR_A3_LEN] != RTW_WLAN_CATEGORY_P2P) {
>  					goto validate_80211w_fail;
>  				}
>  			} else if (subtype == WIFI_DEAUTH || subtype == WIFI_DISASSOC) {
> @@ -1452,7 +1453,7 @@ static signed int validate_recv_frame(struct adapter *adapter, union recv_frame
>  	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
>  
>  	u8 *ptr = precv_frame->u.hdr.rx_data;
> -	u8  ver = (unsigned char) (*ptr) & 0x3;
> +	u8  ver = (unsigned char)(*ptr) & 0x3;
>  
>  	/* add version chk */
>  	if (ver != 0) {
> @@ -1528,10 +1529,10 @@ static signed int wlanhdr_to_ethhdr(union recv_frame *precvframe)
>  	/* convert hdr + possible LLC headers into Ethernet header */
>  	/* eth_type = (psnap_type[0] << 8) | psnap_type[1]; */
>  	if ((!memcmp(psnap, rfc1042_header, SNAP_SIZE) &&
> -		(memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
> -		(memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
> -		/* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
> -		 !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
> +	     (memcmp(psnap_type, SNAP_ETH_TYPE_IPX, 2)) &&
> +	     (memcmp(psnap_type, SNAP_ETH_TYPE_APPLETALK_AARP, 2))) ||
> +	     /* eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) || */
> +	     !memcmp(psnap, bridge_tunnel_header, SNAP_SIZE)) {
>  		/* remove RFC1042 or Bridge-Tunnel encapsulation and replace EtherType */
>  		bsnaphdr = true;
>  	} else {
> @@ -1593,9 +1594,9 @@ static struct sk_buff *rtw_alloc_msdu_pkt(union recv_frame *prframe, u16 subfram
>  	eth_type = get_unaligned_be16(&sub_skb->data[6]);
>  
>  	if (sub_skb->len >= 8 &&
> -		((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
> -		eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
> -		!memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
> +	    ((!memcmp(sub_skb->data, rfc1042_header, SNAP_SIZE) &&
> +	     eth_type != ETH_P_AARP && eth_type != ETH_P_IPX) ||
> +	     !memcmp(sub_skb->data, bridge_tunnel_header, SNAP_SIZE))) {
>  		/*
>  		 * remove RFC1042 or Bridge-Tunnel encapsulation and replace
>  		 * EtherType
> @@ -1670,7 +1671,7 @@ static int amsdu_to_msdu(struct adapter *padapter, union recv_frame *prframe)
>  	u8 *pdata;
>  	struct sk_buff *sub_pkt, *subframes[MAX_SUBFRAME_COUNT];
>  	struct recv_priv *precvpriv = &padapter->recvpriv;
> -	struct __queue *pfree_recv_queue = &(precvpriv->free_recv_queue);
> +	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
>  
>  	nr_subframes = 0;
>  
> @@ -1795,9 +1796,9 @@ static int enqueue_reorder_recvframe(struct recv_reorder_ctrl *preorder_ctrl, un
>  	/* spin_lock_irqsave(&ppending_recvframe_queue->lock, irql); */
>  	/* spin_lock(&ppending_recvframe_queue->lock); */
>  
> -	list_del_init(&(prframe->u.hdr.list));
> +	list_del_init(&prframe->u.hdr.list);
>  
> -	list_add_tail(&(prframe->u.hdr.list), plist);
> +	list_add_tail(&prframe->u.hdr.list, plist);
>  
>  	/* spin_unlock(&ppending_recvframe_queue->lock); */
>  	/* spin_unlock_irqrestore(&ppending_recvframe_queue->lock, irql); */
> @@ -1812,8 +1813,8 @@ static int rtw_recv_indicatepkt(struct adapter *padapter, union recv_frame *prec
>  	struct sk_buff *skb;
>  	struct rx_pkt_attrib *pattrib = &precv_frame->u.hdr.attrib;
>  
> -	precvpriv = &(padapter->recvpriv);
> -	pfree_recv_queue = &(precvpriv->free_recv_queue);
> +	precvpriv = &padapter->recvpriv;
> +	pfree_recv_queue = &precvpriv->free_recv_queue;
>  
>  	skb = precv_frame->u.hdr.pkt;
>  	if (!skb)
> @@ -1880,7 +1881,7 @@ static int recv_indicatepkts_in_order(struct adapter *padapter, struct recv_reor
>  
>  		if (!SN_LESS(preorder_ctrl->indicate_seq, pattrib->seq_num)) {
>  			plist = get_next(plist);
> -			list_del_init(&(prframe->u.hdr.list));
> +			list_del_init(&prframe->u.hdr.list);
>  
>  			if (SN_EQUAL(preorder_ctrl->indicate_seq, pattrib->seq_num))
>  				preorder_ctrl->indicate_seq = (preorder_ctrl->indicate_seq + 1) % 4096u;
> -- 
> 2.43.0
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

- Your patch did many different things all at once, making it difficult
  to review.  All Linux kernel patches need to only do one thing at a
  time.  If you need to do multiple things (such as clean up all coding
  style issues in a file/driver), do it in a sequence of patches, each
  one doing only one thing.  This will make it easier to review the
  patches to ensure that they are correct, and to help alleviate any
  merge issues that larger patches can cause.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
