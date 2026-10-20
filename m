Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792519724;
	b=Vsc+H/fRhsJjKCb1mR0N+lzHIz7yKT9K/ivKGZ97Q5vRU9bfQzNhGl/qHNq/uc+I4NVn
	 fwJ4wnMRfjq36e0rTD9TMTNla2muKnMW7icBxEgTqrt6HjVNQMv6G/r9+fMP94c9yd/N4
	 GW5T4CFgROqi2NkBEwi+NvT8BG/7gWDVhwtjtuhGYmKIQvRtOs84shVaXCpdirGHnKBET
	 TmUoKWr3d/DQfcFa7tScuBoa0DYCZF4IaTBvq+DsxVSDUG3pnN3AZPh/ky2yfVvAq6ylx
	 /BqAXImQIwZakcWW7G3WWBXKT2E5Nk94tR5GCAKZsksuj9EIRh2c6j7w6vCrGaG+HIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792519724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=B5U4wWA72SN+ZAvJ/BX/X5rev6jTQ5qgJahCbtUh4bk=;
	b=lCCJ2V8yTbG8FAMCmCg0ASKYrsIy+Qxf57UwlRKKqCKTWRDJ0L3MaRqsbDfVspXK2P1O
	 BUJ3G+TS3xj+6AIfX34JN6KFD1G20KvgsO0v/I9kuEMDHN7ZgTu88VOjbgfY3UaYoLkEs
	 DubuWXzSF4aw4iEYLzAaQ+d6k+1hBv8eR5B4tCzd2W7expH4gG+ATr86XVVDU7qntWMPY
	 1WuAbWmuie24zHl71Yg/9Ra3YwJ+tf4kNo//GZ3oDKqZeBpYPQInjqGGcQazVWdZPN+Ws
	 stzUXp8PzgV5rrUdnntVnU3TciNbxQFzxMylV6vPphWjMmfQ9P20cTwhcBTkBnvaSJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iGV7omrd;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6449606A31D
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 18:08:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6449606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iGV7omrd
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48c45111bebso2231452f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 11:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792519722; x=1793124522; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B5U4wWA72SN+ZAvJ/BX/X5rev6jTQ5qgJahCbtUh4bk=;
        b=iGV7omrdKolkiMTpX8DjlPFEftKUtcJxwckDPp9KjbIUasAv2U3+Mat9uBpRF2jPwN
         U43Q3Cd6uWgY7Gx9Nh/TRGI/ADt4Gh0UPFpuX/GH7R/9c+jeZVdhYl4+sqYY3GG2NmJt
         EilmQK9Fpqc/gS9jwhw3cEF/Oi/xNZWwIqJPuG1xsRjxyFEJxeX8+UGYHC/BqLzSi3F/
         uvw+wm+vajk/TG0Ha8ZxE8lbHjPgcpt8b5PHbNwuN1tK3BtLvEL2G9IHTndym8Grg51Y
         eY1Jh1Gv+wXaypRq8FacWE3UF70vblJSJdxgvE4IsmhrKIe+35u/JpHhDVcAxIh4249z
         RA7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792519722; x=1793124522;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B5U4wWA72SN+ZAvJ/BX/X5rev6jTQ5qgJahCbtUh4bk=;
        b=SUMmyK4iBIpclGqNhAHYeRX4nVW4/YmNgVJxyD8Vuq9t3qMXadnBmtdv3CY6VB4FFa
         feU33FfKqJLgpRuRAvzH7Cemm97GcsbZhyA29dVM4v/W2dxqLITjSvG5p1LBPe28wlck
         1IQDimuWfZrOLf6rhm9q6uO0tOXDPFIR5s/oQ/GEiUPIgdwH0Nz69FH5TVMAG4KNzf6j
         b69zmlBSfDGgty/969dhdMj1CbUOLAeRJhXfShh/v/Q6aSp1B+WVxzXgtb4lY719y95V
         o2jwLiK80JHSuiZeoyzHOdbJDOwk8ohQY2x7U57hRcaagZgoJhqW5hr7bfw4yi/QInUY
         z/1w==
X-Forwarded-Encrypted: i=1; AKwUvBwi73NHSUjaJMY5yjfnZIwZHruIJmJYRsLrhGGJgKO3AeInECDCoHrWx+4DB7SSxosUH1JrCrsxST5umq0=@vger.kernel.org
X-Gm-Message-State: AFq9FYK6xkVC9arttZhS1vCRvUU+GntISMq4c8EIRaU1GRzyjMIb8LxC
	d52PW1oTOawybUmXB8aIcrRDNmbTRuFXPMeDZiB7yrRJfGXNrtNxfqN4
X-Gm-Gg: AYBFou1Fz8GCX1FXP2Vzvyo4DvT4dSrtuFmSfXenByvjyNUctpllVNmNflwU91+DKsj
	5XTCesHGmUl3ZOrkKzcRw43xnMDT93miP3o7KTvV6ZaXR2jhe0gFHqUbtMLoz5OKKYJF3sj7CwS
	Wn9lsY8GvrTrFHC+Am4VUMz2UGu8d/dXu+t7UM+rh6bvYOP4GgGOxS6YLGJ0qvB6IwGluby5pYm
	TFEPD5FrD8HYv5iwt7HLsYdSjsY2ee9JMDMrQ3VahEuytmZ62a1EpkEvcI01Q5hwXpgtLeAnKbs
	9SP2uckpVbNPXISh+/3XZTv2Ifb8yuB9iG0FLV/mgVIq3b8E6vcoOeoDFMBAr3pQleXRG/1oyuK
	Ok4dDr2iHu3nreEU07d4oqi+FFinpsdnU2zAkvwaWXkiRwTk2IF6gj+tw2yFNIjKtixzBLgCMow
	Zm165ywwrotNRjax3sC1XKCla4mJEyCAvRw9RCzwVqWUqbjDmn716eDQASYWqv7OJi8SFgKz+IR
	T+eqw==
X-Received: by 2002:a5d:53c6:0:b0:48e:412:3827 with SMTP id ffacd0b85a97d-48e07fb2b0dmr18069299f8f.9.1792519721971;
        Tue, 20 Oct 2026 11:08:41 -0700 (PDT)
Received: from [192.168.1.50] ([81.196.40.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25835f46sm30848f8f.38.2026.10.20.11.08.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 11:08:41 -0700 (PDT)
Message-ID: <c14d646f-b8b1-47ce-a92e-cbd5f534503f@gmail.com>
Date: Tue, 20 Oct 2026 21:08:39 +0300
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH rtw-next v8 5/7] wifi: rtw88: 8723b: add the RTL8723B chip
 driver
To: Luka Gejak <luka.gejak@linux.dev>, Ping-Ke Shih <pkshih@realtek.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 Michael Straube <straube.linux@gmail.com>,
 Peter Robinson <pbrobinson@gmail.com>
References: <20261006130701.120460-1-luka.gejak@linux.dev>
 <20261006130701.120460-6-luka.gejak@linux.dev>
Content-Language: en-US
From: Bitterblue Smith <rtl8821cerfe2@gmail.com>
In-Reply-To: <20261006130701.120460-6-luka.gejak@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/10/2026 16:06, Luka Gejak wrote:
> Add the Realtek RTL8723B 802.11n chip driver: the chip operations, the
> power sequences, the efuse layout, the RF and IQ calibration, and the
> chip specific coexistence handling.
> 
> The RTL8723B chip support is based on the initial work by
> Michael Straube <straube.linux@gmail.com>.
> Link: https://github.com/mistraube/rtw88/tree/rtl8723bs
> 
> Co-developed-by: Michael Straube <straube.linux@gmail.com>
> Signed-off-by: Michael Straube <straube.linux@gmail.com>
> Signed-off-by: Luka Gejak <luka.gejak@linux.dev>
> Reviewed-by: Bitterblue Smith <rtl8821cerfe2@gmail.com>
> ---
>  drivers/net/wireless/realtek/rtw88/rtw8723b.c | 2534 +++++++++++++++++
>  drivers/net/wireless/realtek/rtw88/rtw8723b.h |   14 +
>  2 files changed, 2548 insertions(+)
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b.c
>  create mode 100644 drivers/net/wireless/realtek/rtw88/rtw8723b.h
> 
> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8723b.c b/drivers/net/wireless/realtek/rtw88/rtw8723b.c
> new file mode 100644
> index 000000000000..8bb9c03d769c
> --- /dev/null
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8723b.c

[...]

> +static int rtw8723b_read_efuse(struct rtw_dev *rtwdev, u8 *log_map)
> +{
> +	struct rtw_efuse *efuse = &rtwdev->efuse;
> +	int ret;
> +
> +	ret = rtw8723x_read_efuse(rtwdev, log_map);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Report a power track type this driver does not implement once,
> +	 * here, rather than on every two second pwr_track() tick.
> +	 */
> +	if (efuse->power_track_type != 0)
> +		rtw_warn(rtwdev, "unsupported power track type\n");
> +
> +	/*
> +	 * No firmware hardware feature report exists, so fill the hardware
> +	 * capability here; a zero stream count kills the HT MCS set.
> +	 */
> +	efuse->hw_cap.nss = max_t(u8, rtwdev->hal.rf_path_num, 1);

Another thing I noticed too late: this chip always supports only one
spatial stream. rf_path_num happens to be 1, so no harm done.

> +	efuse->hw_cap.ant_num = efuse->hw_cap.nss;
> +	efuse->hw_cap.bw = BIT(RTW_CHANNEL_WIDTH_20) |
> +			   BIT(RTW_CHANNEL_WIDTH_40);
> +
> +	return 0;
> +}
