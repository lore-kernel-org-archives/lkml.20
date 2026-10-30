Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793351876;
	b=HH0qz74Qtzstm4dfFcu7hXn2x0inamza5NQekrV2iDAcEgguSr4Ck28FWhbPCuhEMfPd
	 OAjMUOqJPi5EjGSF/xx5Ry39pUZLz1mq+OhQeFzSq4FHkCcd2/PrJYUgfO0XhEeidhr47
	 By6+PDbmtyvQPnnxxaEqMBqto1qCQ68TafTqtWWfHufptHJf30GOBKzdJKE15xGWEeO+L
	 sbWxO/wBZGXPg8GzowyGTbJUfVygmNDdSvCEYLwzgEUz40oqnPjcjvOmUTI1wcgtELATz
	 F1BvF8lTvIKJ8P8ql9w66ry4v6lb+JGt2nOJlTZiNLtvYAY8x30gaN+MvRXkmRCtgPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793351876;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-WP-MailID:X-WP-AV:X-WP-SPAM;
	bh=3S2IdpDO85JMPoOoqxv8aNu5TabINF8tpl22mIJyXDQ=;
	b=Mz0J8V0hg6m77hJ7Gxgqfdki2qgjTXchjB5psWTjeWDnnppzY2PQhX+eEf8B9plcrp7d
	 aeGp/jwYdwYYMFKsNDmCtfBwYolUSCs+Jxd5Skts53Js6viApTidERc3+Fr/s16OyMXw0
	 j6yQVZAlWIeJQgFr0E765ZlPZx7HQPfjxMH1IgzuDT9hgfwcj75HEIUrNGDNDI+uws8GU
	 CNak8ubz8xdAJ/gU4MyuZV2P23xPYs9A1K/VHDXVRBviyF+mEWHLorlO5OFhyOTT+pFf9
	 snS9KPz1O5Ha+ZM8NI/osFgx0jaPAJjD8PX47BJMHeMh/RInOZtuDvqkLTpZrCU5ccA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=lflLrKli;
	arc=none smtp.remote-ip=212.77.101.10
Received: from mx3.wp.pl (mx3.wp.pl [212.77.101.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15B0606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 09:17:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D15B0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=lflLrKli
Received: (wp-smtpd smtp.wp.pl 42632 invoked from network); 30 Oct 2026 10:17:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1793351866; bh=3S2IdpDO85JMPoOoqxv8aNu5TabINF8tpl22mIJyXDQ=;
          h=From:To:Cc:Subject;
          b=lflLrKliuOP6RnqC/CAFPgGN678YPldzYVIPjK1Ok0X2YQnOzMLYzLmcskTacDLNz
           J6lo+3DgvPg7zskjE88nuHcL1pjYBLMwBt9jnwxTA2fgT7Cn1lgXM1DjpqlU2KkrRz
           8LyCbOFM+u/elt9nA7QMrxmOpbl7wkX7jMp8inNhjNdqmP2WGqajfob/UcN/s/c9Z+
           IK0rD1W6/WApHmMrQnVG3urToC5lbhgnGrVaITMdXcylrzLa9Uq50WIeojjveEtocZ
           XeFsdBi2ilqESj8UKOL4ehwOhJ+gnYJLwcimXETfCkxwitSwKrjlW36TCDrX3WlDj/
           9aFRjaskKRedA==
Received: from localhost (77-236-11-144.static.play.pl [77.236.11.144])
          (envelope-sender <stf_xl@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <hjf3108@gmail.com>; 30 Oct 2026 10:17:46 +0100
Date: Fri, 30 Oct 2026 10:17:43 +0100
From: Stanislaw Gruszka <stf_xl@wp.pl>
To: Ho Jie Feng <hjf3108@gmail.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH wireless-next 6/8] wifi: rt2800: set the mac80211
 fast-xmit and aggregation flags
Message-ID: <20261030091743.GB27096@wp.pl>
References: <20261029134752.1299130-1-hjf3108@gmail.com>
 <20261029134752.1299130-7-hjf3108@gmail.com>
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
In-Reply-To: <20261029134752.1299130-7-hjf3108@gmail.com>
X-WP-MailID: 20180c3f55c8943a67058771b48cccfa
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 0000001 [0VIx]                               

On Thu, Oct 29, 2026 at 09:47:47PM +0800, Ho Jie Feng wrote:
> Enable AMSDU TX/RX support for this driver, which can increase
> throughput.
> 
> Signed-off-by: Ho Jie Feng <hjf3108@gmail.com>
> ---
>  drivers/net/wireless/ralink/rt2x00/rt2800lib.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> index 032cd6ac345f0..8b4458a74d33d 100644
> --- a/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> +++ b/drivers/net/wireless/ralink/rt2x00/rt2800lib.c
> @@ -11861,6 +11861,9 @@ static int rt2800_probe_hw_mode(struct rt2x00_dev *rt2x00dev)
>  	ieee80211_hw_set(rt2x00dev->hw, SIGNAL_DBM);
>  	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_PS);
>  	ieee80211_hw_set(rt2x00dev->hw, TX_STATUS_NO_AMPDU_LEN);
> +	ieee80211_hw_set(rt2x00dev->hw, SUPPORT_FAST_XMIT);

IFICT this flag will not take the effect since we have SUPPORTS_PS.
Also for WAP3 (802.11w) we fallback to software encryption - 
that will prevent fast xmit as well. To truly enable
fast xmit, I think we would need add hardware encryption support for 
WPA3 and also compromise by remove Power Save support (which is disabled by
default, so that's possibly fine).

Regards
Stanislaw

> +	ieee80211_hw_set(rt2x00dev->hw, TX_AMSDU);
> +	ieee80211_hw_set(rt2x00dev->hw, SUPPORTS_AMSDU_IN_AMPDU);
>  
>  	/*
>  	 * Don't set IEEE80211_HW_HOST_BROADCAST_PS_BUFFERING for USB devices
> -- 
> 2.53.0
> 
