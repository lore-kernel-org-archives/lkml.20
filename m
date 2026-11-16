Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794854933;
	b=lAY5Dvg4SCcNE8YCAx95kwuhEMp4Wq8tRHjeYELwQorqGRrCxoGIp6MhCgDHqalBLL/E
	 aIsTx/WSCUmZGPkuNlSxiqbZ4hDGMWOvwab+nhNAdy8CkjG+U/3sqWQcx1o+f8f+xmT9h
	 xuCD3e4xQJdwDghVPfl/DOfN9LR32kRsE60/zAY0f/vZy44o1hGvj1glGJ8x4ydMLXjum
	 L/ZOPGJ/ie/m5npZEmu20gDgZdfHqOmx1z9O8J1+sOpQf0lnU4lSfO+Sths5Tukdml2HR
	 POL2ytEFkHkdIYVrqLfqq2I6/tH0ewfIAT2KcrSafCSRQ50/HGa88SNbRByeJ+192DA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794854933;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sz80l+p8ujGs9nPbP4achw/oPK2RjFSncK3Slf8bH8c=;
	b=J9BtTD5ilTQdmzMAo9CMlXruicubHxAyrAfNOgHNvII4vFYdmXeoK2saZR3bnbMs5Lmp
	 7VijA6OoJABKr73LpbPx3Hd8k1fD5w6tKXq5ZE7uye1ZAv8qL25WnqMftOS0k+FpdnIQu
	 PVdXH4v4k+46T1Yi9x0dILjOdkp/mdr7f+wdoFrxFWlCEmtXoMPx+9cV77Hq/WZqwRXZ0
	 MRcX8JQj3SM0r6WwSQN6KdkBtFeVfHqJ4pqfCEPdkPYHnywe5S0g23CiSzJpxqwEsc7yl
	 lpSdiFP8DDzalzBPA9EHM9siCaZZLzMTtFQ6Znp1fApLSW4F9GWiY/Ip1IY5wmvs9rQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uDwykJCq;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1EA606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:48:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B1EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=uDwykJCq
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53644b28706so31551851cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:48:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1794854932; x=1795459732; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sz80l+p8ujGs9nPbP4achw/oPK2RjFSncK3Slf8bH8c=;
        b=uDwykJCq016wgWS9+N00CG0siwXmgb74LhIACY+w8NCUk+FjaapQLWwCx3dvOl7ZJG
         4vvKZ+jybce3lfK0RDcTgwHMlsE/3Fcug+ERDZ6zpzKU19fCP9z0kvrO958T0yG54wXN
         MlG+5htTrhcdMaNa+leNCiQsA+U6IraxMULe2iaW1bbkQH9sh36WuUr7zcD6AabqYBWR
         9n3wuepS9iCXPTy/wp+q2a5FnScUtQgKQDqIDIk9kzlFeoyYCGPc/6BEOwm+36kRvDZf
         v+lBQ1SHZefJFAS5avpNnThvM9n8OU+PWs1uocbxC9IhXM6E5GL+k4Q6ZNXpDibxplzn
         xnYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794854932; x=1795459732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sz80l+p8ujGs9nPbP4achw/oPK2RjFSncK3Slf8bH8c=;
        b=cdD5JUE6BZ81pBG2BxMcw3q5KB6v5lvpjW/cCEB1enOOO3ouYNjxUr1uPNwtW/JUWS
         A6WhkWEjVlpCFvEOAMcnIgqI6lAnXVYPDum7XoL3dLPvKlhixeqtoHGJNot97RCqSTf8
         xqqB+QUnSpCfnHh/pXW9DmcrBXBLmToRv+uvpnqVVeZedXCRNwdesbY892vR4+qsij2I
         zE9qswA6b4NrmKGHtlX+Z8Fpfpjk7o7WM8nf0StdG816sUAeqmd/IzQmiv/ztjCISUyr
         gXkcXBtwV4dq2UFJaSA4NdeZeh+FtOORr53rE/eLviUGQWcTMaeSoyYxLSBNrNODQSmf
         /bgA==
X-Forwarded-Encrypted: i=1; AL+hErEZzuHle5sxRX4SmGoh9YtuJyxJOnjLX+SsXlxWpb/shv6BuK966wuDD3d+Air2r99+tURPkxzKixkm5qQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8S+tsQ/BOD7ReEPeZeOT9apdPNhvw1CrQAqXJGF5HfUeNyAkBf
	asCYyhep1iLIpM3U2oVG2ZmC2Hc+G8Ldhf7sAZYh5ldhHfdHLl0pvy8Phy/RJEuW0w==
X-Gm-Gg: AYBFou2HHkEjLzD55LKHY5Kdji7oPRoU10Q9yawmar3z2nqS0ARMuNTwB5HZCqLrBsH
	kl8BVzUCWuODwYJ/I+uon5iT0+OOsSc4yBa+rEEjCpKBbOfK2EBvbXgrtIas+Hdt1o+lGlAYpVY
	UYv1iWjK2kDkc70Ejhlrek5xgB5X+3tP7SjMB+6hjIQgYX69rfxI+/sr7e0voChv8PoyjtZ9fAf
	J9Y/+FqwwZfPhqN4wawsBab46ynaua936TuHCT9EeBc6/R8HPffcNa1oe92MoCDEORcxpSce1Nx
	6FrbTR9t+MYZhfqlgbdpeG4Puq5LXhGmGje2DLXNm0DkjkF9JYM4UkJTuhpZkX4yYMrJ4pMCQ60
	WLlJDcNqwQfnH4SOJDyFgCIahkvzQSpU/favH/pykKv3xNuB5iBsd0shZpTKirNpAoCXjVculVP
	JKpQVSRM1SUaouxyqqMtJEONwyAQ+JQtGYcz19shNPnlYHu3Vx5O5yi8yAfTyESHATgfEOcMkLn
	3VpMqVMJrhkgamLQEEsFlP+DDqS4NDGRMTFLQirR0iEAmmd61L0mpcycYAluDyxx0mY6NUG9i+Q
	p6swfyo1YuGLTsqXxIfU2Z+Sz/d1yfgiKk3GebcD5qS7Deog9Vs=
X-Received: by 2002:a05:622a:e341:10b0:55b:fd16:a2b0 with SMTP id d75a77b69052e-55bfd16a9b9mr104088641cf.70.1794854932273;
        Mon, 16 Nov 2026 10:48:52 -0800 (PST)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5f3e4sm93181656d6.16.2026.11.16.10.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:48:51 -0800 (PST)
Date: Mon, 16 Nov 2026 13:48:50 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Bin Yu <byu@xidian.edu.cn>, Cheng Wen <wencheng@xidian.edu.cn>
Subject: Re: [PATCH] usb: storage: shuttle_usbat: do not divide by an unknown
 sector size
Message-ID: <a36c4b9f-29e9-4750-8a89-38a57fe7bfb8@rowland.harvard.edu>
References: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>
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
In-Reply-To: <20261116093452.15286-1-25031212351@stu.xidian.edu.cn>

On Mon, Nov 16, 2026 at 05:34:52PM +0800, YuanZhe Liu wrote:
> usbat_flash_read_data() and usbat_flash_write_data() divide the transfer
> length by info->ssize to turn it into an ATA sector count.  info->ssize is
> only assigned when a READ CAPACITY command has completed successfully, so
> it is still zero when a read request arrives earlier.
> 
> Such a request is sent during device scan: sd_probe() starts with
> media_present set and usb-storage sets read_before_ms for every device, so
> sd_revalidate_disk() calls sd_read_block_zero() right after
> sd_read_capacity(), even when READ CAPACITY failed, because
> read_capacity_error() deliberately keeps media_present set for drives that
> fail it with media loaded.  A CompactFlash reader that does not complete
> the READ CAPACITY sequence, for example because a register access is
> stalled, therefore reaches usbat_flash_read_data() with info->ssize == 0:
> 
>   Oops: divide error
>   RIP: 0010:usbat_flash_read_data+0x2a4/0x5c0
> 
> Reject read and write requests while the sector size is unknown, the same
> way the driver already rejects an out of range LBA.

How about initializing info->ssize to 512 (it's currently hard-coded in 
usbat_flash_transport()) earlier on, so the value is always available?

Alan Stern

> 
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Cc: stable@vger.kernel.org
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Co-developed-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: Cheng Wen <wencheng@xidian.edu.cn>
> Signed-off-by: YuanZhe Liu <25031212351@stu.xidian.edu.cn>
> ---
>  drivers/usb/storage/shuttle_usbat.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/usb/storage/shuttle_usbat.c b/drivers/usb/storage/shuttle_usbat.c
> index 7e5424268c73..faea2c77c5aa 100644
> --- a/drivers/usb/storage/shuttle_usbat.c
> +++ b/drivers/usb/storage/shuttle_usbat.c
> @@ -1130,6 +1130,13 @@ static int usbat_flash_read_data(struct us_data *us,
>  	if (result != USB_STOR_TRANSPORT_GOOD)
>  		return result;
>  
> +	/*
> +	 * The sector size is only known once a READ CAPACITY command has
> +	 * succeeded; a request can arrive before that.
> +	 */
> +	if (!info->ssize)
> +		return USB_STOR_TRANSPORT_ERROR;
> +
>  	/*
>  	 * we're working in LBA mode.  according to the ATA spec,
>  	 * we can support up to 28-bit addressing.  I don't know if Jumpshot
> @@ -1221,6 +1228,13 @@ static int usbat_flash_write_data(struct us_data *us,
>  	if (result != USB_STOR_TRANSPORT_GOOD)
>  		return result;
>  
> +	/*
> +	 * The sector size is only known once a READ CAPACITY command has
> +	 * succeeded; a request can arrive before that.
> +	 */
> +	if (!info->ssize)
> +		return USB_STOR_TRANSPORT_ERROR;
> +
>  	/*
>  	 * we're working in LBA mode.  according to the ATA spec,
>  	 * we can support up to 28-bit addressing.  I don't know if the device
> -- 
> 2.34.1
> 
