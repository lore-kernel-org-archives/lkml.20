Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275A65038E6;
	Tue, 13 Oct 2026 13:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791898400; cv=none; b=oDdpfP1mInR/cjX7IMHRbvcVda42Tv+NF+yKrrlRCoXVPQ8W458+WZssx7A21lTbv3D/tb4mRlM+mRh9rH1Bev4iDpQW3VbfWDX9nOc479kBk4KDzsKywiLqRjO6cNL1xKB7Gajxsg1iCgPedXIgKbkIkg9fDxYW19AeFROS8B0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791898400; c=relaxed/simple;
	bh=cPVdDNYJoApSx+eURFNqmHO4aY1NPkklxp7No2AbiC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mz4Q+2LMOfldKYU4vjSD9iL35V3EFbS+pH35s88d/NjuKI1Wrqvc67v4KnF5qpZ/PPebIHiBWNTa/BVvy85erSpNMdGm530ydZ8GMNfthYRl4v2tzqTv42qyIR3WlDyawW2xVGg8MBaOsWNF9iX2y/SQbzD/MGEx+ExIF5ajAsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dQpSHBnk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dQpSHBnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2903D1F000FF;
	Tue, 13 Oct 2026 13:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791898398;
	bh=qA4VvsSqMwfRFBuX/zH0bRqB9tHqU0s8qak4tSqjWsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dQpSHBnk1+uFgaHJg23XwmFZDT+qGDAw/F7HyUyA4TimtID1U1ZNiYF2JsKkV+Pkq
	 epU3y7FCNYMOOavtiDcpi9L+voRcQxKEjDnl8lrYgx2bnGZtQDSzqZs54PoVvZK+2k
	 ftqe0577IquR/3C8jB89lVJ8SwgOHfFcUTh78rzE=
Date: Tue, 13 Oct 2026 15:33:23 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: rtl8723bs: use u8 instead of unsigned char
 in NDIS typedefs
Message-ID: <2026101314-dimmer-squishier-3781@gregkh>
References: <20261007103236.37607-1-ampr.mhd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007103236.37607-1-ampr.mhd@gmail.com>

On Wed, Oct 07, 2026 at 02:02:36PM +0330, Muhammad Mahdi Amirpour wrote:
> Replace the plain C type 'unsigned char' with the kernel's fixed-width
> type 'u8' in the NDIS_802_11_RATES and NDIS_802_11_RATES_EX typedefs.
> 
> The kernel coding style prefers fixed-width types over plain C types.
> This addresses one of the outstanding TODO items in the rtl8723bs
> driver: "convert any remaining unusual variable types".
> 
> No functional change.
> 
> Signed-off-by: Muhammad Mahdi Amirpour <ampr.mhd@gmail.com>
> ---
>  drivers/staging/rtl8723bs/include/wlan_bssdef.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> index f4c1456f1..df541e956 100644
> --- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> +++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> @@ -15,8 +15,8 @@
>  #define NDIS_802_11_LENGTH_RATES        8
>  #define NDIS_802_11_LENGTH_RATES_EX     16
>  
> -typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
> -typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
> +typedef u8 NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
> +typedef u8 NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
>  
>  struct ndis_802_11_ssid {
>  	u32 ssid_length;
> -- 
> 2.55.0
> 

Does not apply to the the staging-next branch at all :(
