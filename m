Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919847;
	b=sqnEdHfdrIDP3TYJcdsmMjMrHpf88x++1pvjD0Yfo6CFcaHcyfl3uFBZHuVWlvimJq7F
	 zWOyZTtytrag5aB8wZ8mkEsuxUR/J9CnCqouGxwMkwqNWkZOYgO7nYf0TWg2AhXEo4b4y
	 JtFCGMDSMnydsMCiiTlacd1fMJwuKIF8qZCFTwNGvio7+H3PWxBUWmE3UCwrb9JgIBBMO
	 2/s7goMsN6WoLWxtNr0/cUyzldx6PCj4RKzZSXBNBcXUakICk+D9co8lajM+l7zuk+uMX
	 a5UtlMDyu6zI1tUJPc9Of64gl2WuxwReNo6ySOgyvskoy6YggJ27/qYDdX1g64WAxMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919847;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=TBqtCx9X2cV6qUHx1FLONx/l/x4FumUzVEsD1J6HJkw=;
	b=onRj9aLFeWgFUVCurwU1g7x2kZ1IMno6P3Ghh5Ej6UvvsRY273QXuvNsZuPVf8tCilpH
	 ITZAwKpEahhYU+Yvi1os3gON639tIC+qCmocHWnc5oWAqXyZlrpBfcrKcxhPGhzUnbu3z
	 EcB4w9aw0+xTx3KJstiS8EwE3a6YHFzgiMAXzQd2U8N5AEPimE72aqMbfUUqt6igfc4p3
	 gYmYGPFyOHFtsQhftoAiiXNtgBuMYiWqXHMxmAzWTr5CJBxWgqcseL715Ykozn3bGng6E
	 wqdwTKTAKbPMfbxRcijBS0VD+fcwiQbrWjhOs+wloisIpEJhj34Pqq3g/LAu6p2bjfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C848606A883;
	Tue, 17 Nov 2026 12:50:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C848606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jTPjF0JNtzFpfj;
	Tue, 17 Nov 2026 13:50:40 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794919841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBqtCx9X2cV6qUHx1FLONx/l/x4FumUzVEsD1J6HJkw=;
	b=xa6ct3fb8hTN0mkqDPmr0clA1z2AGwUlAIzM54kBLTu6lZ4Mi2KK4gUIucfYjJrzoX9krr
	7q6J3pq9cHP70YBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794919841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TBqtCx9X2cV6qUHx1FLONx/l/x4FumUzVEsD1J6HJkw=;
	b=TH99CY7hHyH8LjWZHhDXnHFXGvlKBLQDr1/0y//CKcsCszHDZQdx77nGXqB3rX9Y4OlOoy
	aoVrB489uM14XFlDQMCm/udsan7V45k4AuNEaNqV5DvFRYjVK40as4qHKRsT9VWANg1YNe
	SBBVOZe2YR9S4UHLDdXQiVCbudRDDN9W7tPLM9JikPKDW2V1n7N3LLQDkN89iJOBrbFacv
	2fHLadrFk9xBUjWd/ZKTK2ogCfu0miYnULue5M0ShHODykHfz5KFL1Wv+ClqGOmMsfsKx+
	ZmXMJuAjUiNG3X29RpmoJLi1Owvy7tb3X/YAn6fWNRIy3kvr/8NsmQnypFIW3A==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id gYo5MqBN/GqqEikAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Tue, 17 Nov 2026 13:50:40 +0100
Received: (nullmailer pid 3641473 invoked by uid 2002000001);
	Tue, 17 Nov 2026 12:50:40 -0000
Date: Tue, 17 Nov 2026 13:50:40 +0100
From: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next 1/5] wifi: rtw88: sdio: cache the free TX page
 counts of the 88xx chips
Message-ID: <avxNoFNmFRT8Rnmm@hardeman.nu>
Mail-Followup-To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
	Alastair D'Silva <alastair@d-silva.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
References: <20261116190145.2736364-1-david@hardeman.nu>
 <20261116190145.2736364-2-david@hardeman.nu>
 <83F543B9-2066-493F-8372-0E36779C1B04@linux.dev>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <83F543B9-2066-493F-8372-0E36779C1B04@linux.dev>

On Tue, Nov 17, 2026 at 08:20:16AM +0100, Luka Gejak wrote:
>On November 16, 2026 8:01:41 PM GMT+01:00, "David Härdeman"
><david@hardeman.nu> wrote:
>
>> +     free_txpg[0] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG);
>> +     free_txpg[1] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 4);
>> +     free_txpg[2] = rtw_sdio_read32(rtwdev, REG_SDIO_FREE_TXPG + 8);
>
>[ ... ]
>
>> +     rtwsdio->free_txpg_valid = true;
>
>As far as I can see, a failed read can leave bogus credits cached here.
>While the chip is powered on, sdio_readl() returns 0xffffffff on an I/O
>error, and rtw_sdio_read32() only logs the error. That becomes 4095 pages
>in each affected page count.
>
>The first frame can still fit the real page pool and be sent
>successfully. The cache then stays valid, so the next frame can be
>admitted using credits from the failed read even after the real pages
>have been consumed. Previously, the next transfer would read the
>registers again.
>
>Could the sync return an error and leave the cache invalid unless all
>three reads succeed? The individual reads used as a fallback in patch 5
>would need to preserve their errors too.

Yes, I assume Leonard's patches will go in first, and there's already a
read helper there, so when I rebase the patch set, this will be
fixed.

-- 
David Härdeman
