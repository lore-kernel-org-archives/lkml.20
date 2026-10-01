Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC863815D8;
	Thu,  1 Oct 2026 05:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790833245; cv=none; b=so/Qn7mtcAmWMbQCJKpIhrFMxwtxHV1FNpRVgXoq6ujMf7IIwDSjOeWAnIJqpUIl2NoN1EHmW4Un3fHcr9NDmorK1wHTf5GYzwrGZDXCn9dQncIxFaLN+TM0S8qyP2Jca0ocmc1ljtcdTsc21CP+VH1tJPpWQvFtnUeGrCL1Hi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790833245; c=relaxed/simple;
	bh=cMqjic0HTYQ+SfZ/m48QD/qRO2cGz0QhOHCH/yY36CU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EkHirgxJviJdSu3wcZKUC/Xm+6QHOKqcPZUYfI25Nckg47qwUaIQSXtF/Y4GQqeoPZRkHiWiSzCDT6EexjoXMO652cMVFagJEF8009/yDc7PRg+qxkpUPPpKThKdIy7KsYmul2NTB/NMOJGq3g0i4JWcNdCkP0ri8iJ5+juAqmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=jtth7A4P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="jtth7A4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD3D1F000FF;
	Thu,  1 Oct 2026 05:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1790833243;
	bh=oANg63MCLXtQmSggCM5zwp8nA4SlNd79Tob4EPX2/Cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jtth7A4PU6x6jrOjTDTKHxGFXIEbh8VRAJ7Kvs91dbXICpuGUqMT5aeEtW/vpd2D/
	 QEPccPx6c+pZYtxpehnODnrAwBUA4WaLldSypFRs7aMvmieoIudN63nnDFi24rlYDy
	 yyEyBRP2JM8y8WxB9LWJk6lAaqBUa5fLbaMZcw+E=
Date: Thu, 1 Oct 2026 07:40:37 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Balazs Moro <balazs.moro@proton.me>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: remove unused NDIS definitions
Message-ID: <2026100129-mulch-autograph-b148@gregkh>
References: <20260909195344.353880-1-balazs.moro@proton.me>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909195344.353880-1-balazs.moro@proton.me>

On Wed, Sep 09, 2026 at 07:54:13PM +0000, Balazs Moro wrote:
> NDIS_802_11_RATES has had no users since the driver was added.
> NDIS_802_11_PMKID_VALUE became unused when struct BSSIDInfo was
> removed.
> 
> Remove the unused typedefs and NDIS_802_11_LENGTH_RATES, which was
> only used by NDIS_802_11_RATES.
> 
> Signed-off-by: Balazs Moro <balazs.moro@proton.me>
> ---
>  drivers/staging/rtl8723bs/include/rtw_ioctl_set.h | 2 --
>  drivers/staging/rtl8723bs/include/wlan_bssdef.h   | 2 --
>  2 files changed, 4 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
> index 768e4868ecfd..020b143f36be 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_ioctl_set.h
> @@ -7,8 +7,6 @@
>  #ifndef __RTW_IOCTL_SET_H_
>  #define __RTW_IOCTL_SET_H_
>  
> -typedef u8 NDIS_802_11_PMKID_VALUE[16];
> -
>  u8 rtw_set_802_11_authentication_mode(struct adapter *pdapter, enum ndis_802_11_authentication_mode authmode);
>  u8 rtw_set_802_11_add_wep(struct adapter *padapter, struct ndis_802_11_wep *wep);
>  u8 rtw_set_802_11_disassociate(struct adapter *padapter);
> diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> index f4c1456f1476..ff2cee2f3b99 100644
> --- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> +++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
> @@ -12,10 +12,8 @@
>  
>  
>  #define NDIS_802_11_LENGTH_SSID         32
> -#define NDIS_802_11_LENGTH_RATES        8
>  #define NDIS_802_11_LENGTH_RATES_EX     16
>  
> -typedef unsigned char   NDIS_802_11_RATES[NDIS_802_11_LENGTH_RATES];        /*  Set of 8 data rates */
>  typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
>  
>  struct ndis_802_11_ssid {
> -- 
> 2.47.3
> 
> 
> 

Does not apply to the staging-testing tree :(
