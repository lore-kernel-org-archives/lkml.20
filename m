Received: from mail-wr2-f13.google.com (mail-wr2-f13.google.com [74.125.225.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B6E94E01E9
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790070461; cv=none; b=p2c5wNEI/1nARSmVYPdBmDpRPal+J274GzIyGmTlJw4FMOgze3NTxTE3L47lvBIh4ROZ1bro65OjlnD1LkcEywCx+1NXtTJYWJgfX8Es8IXdgzSSA3KrUfoTR9FkPub7pJeUvKZDMojC/ycBgR0/UOBj9tck3DrGcW7Ia2xlusw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790070461; c=relaxed/simple;
	bh=2CUH3YGiPlXy555Q9SI3ZYnCZbH8YDJQaUSBvfvqZ6w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Rfyv77v3l0thOtGykaNoH1n8vSISsmTCpu8JNfacp103JYoERiTZTg/QG10jEMRNff8k0gnG/oD2ZpFDgDAXnVjk4LDEWpOfPV/iE4OEzTXqbssAQE2Ne/cZXzkY8J6CpiiHdM4z1iFdSpzp9QnUuQ0oKsoFK2EwgYArdp2CVIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UvNBStGl; arc=none smtp.client-ip=74.125.225.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UvNBStGl"
Received: by mail-wr2-f13.google.com with SMTP id ffacd0b85a97d-4843378fb37so1906918f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 02:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790070458; x=1790675258; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1mHA714llFxRbL4YpV3zzI7qdHUQEj56NbS4Oyhz2TE=;
        b=UvNBStGlptbsfoizP0M7WPR8TBH+UhYLVyjoEPDRLeSoLNQuh7GLHz3T5/m0+UmBNZ
         RHrrzsLV0K/1tL1nA+hHnjigNFBMWMqOHkC2hAp9rehOuAlFe8SvIs8Z6CpW3d6rTbbu
         qUN4yFety6ERn2Pq27SISc97Qgyi/FNkA/2oV0hESNH3CrGFm1JB7EYRbfKMluJjr8oK
         ttR4FN9+EvyTCRmk7aGWOVeyliElH3Fme+P3KYATNqyFatLBn3k0NH1gwluMVxzIirTx
         DTowTIQwxpjvhHhSZOLcG5y2+hQWEt9qDuVNyafBzvAUvmydtwW4n5iPhqIUqR/Rgbej
         XPqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790070458; x=1790675258;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1mHA714llFxRbL4YpV3zzI7qdHUQEj56NbS4Oyhz2TE=;
        b=niXmzMNBLjbNVhNBapabW7jymka66LnDOB8O2PRYtf564cn5hqJBbOkUiy1/OXnC5P
         r605bGdbXDOiA53kVmWoDMx8bT3fqYVnzXR9RtSO3G2g9pkoARWuiqDzMxO0NSWcQ27E
         Kutf4SPnvRTaLPOI86xMe6CJbODhjjEHGC8ZnSAAWCJfonGBEpudxYItrqxI+Jr7EbPh
         QPTAyJzTDyrfEBxfwN3nox11QHPszmM6LO4uuqOHlnB5nJItpHA68vvV9TmSN0NnSa9b
         ppAwxQPpCXhA9EoCsNCQb8ZRiWneYMg6lxhDP7yVTNdPuzcxMknCxGLh5EKB3u/FNR1S
         hnnA==
X-Forwarded-Encrypted: i=1; AKwUvBzecqeSyz2Tjc8T7kyj3aQhW/Vs6pUNEAt5mWF4GEczVOPtNlKiCsfsIrGONhlKYE69vTahoFC1czIQyo0=@vger.kernel.org
X-Gm-Message-State: AFuF++nDA37xqFdMv695gJIRIXn26cjMyUloJdPUg6knK5jiW4hbYWZ5
	3W6Enw1n0ebbIskcQP7Veoo+P7XfhGo9SiK37ahyUJ/xkJFxWN2hZR1S
X-Gm-Gg: AYBFou0BgjD1Co83D+Ivo44UcfGKELSnM6FCOIojMAULP/bUVJqEslI/IvQ6uwg50fV
	vnHKRkOaS5yqWKwC5x49H/AHdtXvCQrEpxVDVHA3A2pgHGx0+dedK2KG5RmhR/haHr99QRV/YcT
	Vp0OR9CkQiZ27zf7SH03uFqqLC7byGNb8WFOhz03MWNb0maD0lDC8JOdYe0E0NGcSBBKxzXMNuA
	WrfZli37LwC3xiR9VCbBTaE6mJ7DRfWt0t6aB6yPVHxUHqILU41IEgPeaJ8Jj9JbkCIHtoKAds+
	YAa6DqwIJHBs9EbmziDjKBR886zCNe6bcxUdlV2ghS7boh32/NqhcOATFnG9NNRfnbixq24zvDT
	0C/2JXjcjVfz1TSm1NZ3C76/tc29TtjUbdi/JQHu1yO1POnRdYcUzK1ru2ZbOnJGSy90Z5gxDnv
	bbBih6R2xFHVNIFKWgbLkowDTRZg8apNxpJIJIQAz6cTIL5JFyjc36cxcMWo3W+tPah1AWm/s0S
	2QZ0qMqXVytM+ZU9bCW+ltjfaKlVslmKCA=
X-Received: by 2002:a05:6000:1a8a:b0:487:62d:37dc with SMTP id ffacd0b85a97d-4871e269cd3mr21320913f8f.32.1790070457566;
        Tue, 22 Sep 2026 02:47:37 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48862773ee0sm3708938f8f.6.2026.09.22.02.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 02:47:37 -0700 (PDT)
Date: Tue, 22 Sep 2026 10:47:36 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Hui Peng <benquike@gmail.com>
Cc: Harry Morris <h.morris@cascoda.com>, Alexander Aring
 <alex.aring@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Stefan
 Schmidt <stefan@datenfreihafen.org>, linux-wpan@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH net v3 2/3] ieee802154: ca8210: prevent stack buffer
 overflow in hwme_get_request_sync()
Message-ID: <20260922104736.0e7e20f2@pumpkin>
In-Reply-To: <20260922093126.141969-3-benquike@gmail.com>
References: <20260922093126.141969-1-benquike@gmail.com>
	<20260922093126.141969-3-benquike@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 22 Sep 2026 09:30:24 +0000
Hui Peng <benquike@gmail.com> wrote:

> In ca8210_get_ed(), an uninitialized u8 lenvar and a pointer to a 1-byte
> stack buffer (u8 *level) are passed to hwme_get_request_sync(), which
> unconditionally copies response.pdata.hwme_get_cnf.hw_attribute_length
> bytes into hw_attribute_value without checking the caller's destination
> buffer capacity, overflowing level on the stack when hw_attribute_length
> exceeds 1:
> 
>   BUG: KASAN: stack-out-of-bounds in hwme_get_request_sync.constprop.0.isra.0+0xf3/0x170
>   Write of size 16 at addr ffff888001907780 by task init/1
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x70/0xa0
>    print_report+0x153/0x4c6
>    kasan_report+0xf1/0x120
>    kasan_check_range+0x125/0x200
>    __asan_memcpy+0x3c/0x60
>    hwme_get_request_sync.constprop.0.isra.0+0xf3/0x170
>    ca8210_get_ed+0x9c/0xf0
>   ...
>   The buggy address belongs to stack of task init/1
>    and is located at offset 48 in frame:
>    ca8210_get_ed+0x0/0xf0
>   This frame has 2 objects:
>    [48, 49) 'level'
>    [64, 65) 'lenvar'
> 
> Initialize lenvar = 1 in ca8210_get_ed() and return
> IEEE802154_SYSTEM_ERROR in hwme_get_request_sync() if
> response.pdata.hwme_get_cnf.hw_attribute_length exceeds
> *hw_attribute_length.

This function is silly.
There is exactly one caller, the only valid length seems to 1 (is zero valid?),
not much point using memcpy() either.

David

> 
> Tested in QEMU with KASAN enabled by passing an oversized
> hw_attribute_length response into ca8210_get_ed().
> 
> Fixes: ded845a781a5 ("ieee802154: Add CA8210 IEEE 802.15.4 device driver")
> Cc: stable@vger.kernel.org
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> Changes in v3:
> - No changes.
> 
> Changes in v2:
> - Split out as patch 2/3.
> - Replaced the temporary stack buffer in ca8210_get_ed() with lenvar = 1
>   and an upper-bound check against *hw_attribute_length in
>   hwme_get_request_sync() as requested by Miquel Raynal.
> 
>  drivers/net/ieee802154/ca8210.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
> index a990a0f..8aa7ffe 100644
> --- a/drivers/net/ieee802154/ca8210.c
> +++ b/drivers/net/ieee802154/ca8210.c
> @@ -1677,6 +1677,9 @@ static u8 hwme_get_request_sync(
>  		return IEEE802154_SYSTEM_ERROR;
>  
>  	if (response.pdata.hwme_get_cnf.status == IEEE802154_SUCCESS) {
> +		if (response.pdata.hwme_get_cnf.hw_attribute_length >
> +		    *hw_attribute_length)
> +			return IEEE802154_SYSTEM_ERROR;
>  		*hw_attribute_length =
>  			response.pdata.hwme_get_cnf.hw_attribute_length;
>  		memcpy(
> @@ -2027,7 +2030,7 @@ static int ca8210_xmit_async(struct ieee802154_hw *hw, struct sk_buff *skb)
>   */
>  static int ca8210_get_ed(struct ieee802154_hw *hw, u8 *level)
>  {
> -	u8 lenvar;
> +	u8 lenvar = 1;
>  	struct ca8210_priv *priv = hw->priv;
>  
>  	return link_to_linux_err(

