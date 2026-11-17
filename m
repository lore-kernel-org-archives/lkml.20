Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=94.130.186.121
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794920284;
	b=3YwUSX48ZWEGcCnlEkyhurz4ifowuhG1OYjN5SrKngcGZBFAZlfgbPbcssXOCI/v/vFe
	 sPVjGZ03Z/HBMkSaE0M3PWZMhlx1sMPQ/7kgsB9kDaObm2EJc0pvk45NcAzCIs2+XHG5J
	 sw29igH05BSoYNJdWLQHnut4AG2krx/fwfEtOfpktybHj0M3MwWOOfzUOSiXuL/ONsxO0
	 B83q/45lxv7aJYN+Mx3goxyDIwKQkb7HRE6ZSaynLNBpCyDcQ5sZLPNILQy+VRYeSFDm7
	 r1xS14gheHZ4Yt7OjELGjy0uTLUKHW5YBEVz9nGRYd9+f0dSfv7RcDhRTysWrRYUdkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794920284;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=X++P4NBnyiIYn2JLERFI0cj+8rSyEarq+FNZBQ2tPFY=;
	b=NzHZObHNKK520mIo4mOaXjOyraOJMKDQ2JtgLuyYtdiXH06yx6PE7JdF2t7tFPXBIGbw
	 8/a35c3UB6qqUFpScoerxx6oD5LClgUx+JqL4l5Nw4/zgx+Alplu/8J4UU39SnD3EjQ6f
	 NipNCHh7vmEd/+jxpqHgaUQvNMl3Gyo8qpG2HprwzcNmp8ZqQZF7BiczjG/+6qNt0iCMK
	 ouGqbQKBS58FmCBNUOfHD0r1RTYqeWJ6AbfKzvbiFK0wO2bk08hqTIWGEz7ihLCTX7Sfy
	 vMvv19Quwn/qwansHB+KoIZBGHGDPRC433ieC01YERA6t39/trqBU1mEYb9dTXFBpsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=hardeman.nu;
	spf=pass smtp.mailfrom=hardeman.nu;
	arc=none smtp.remote-ip=94.130.186.121
Received: from thor.hardeman.nu (thor.hardeman.nu [94.130.186.121])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47AA606A323;
	Tue, 17 Nov 2026 12:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B47AA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hardeman.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hardeman.nu
Received: from thor.hardeman.nu (thor.hardeman.nu [IPv6:fd27:2a41:8fcb:2::a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "thor.hardeman.nu", Issuer "Hardeman Internal Mail Relay CA" (verified OK))
	(Authenticated sender: nullmailer@odin.hardeman.nu)
	by thor.hardeman.nu (Postfix) with ESMTPSA id 4jTPsg5znGzFpfn;
	Tue, 17 Nov 2026 13:57:59 +0100 (CET)
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=hardeman.nu;
	s=202608-ed25519; t=1794920280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X++P4NBnyiIYn2JLERFI0cj+8rSyEarq+FNZBQ2tPFY=;
	b=bCzpYInK2f5Wlir0Q00F3d4KD9pfY68ZPgu3TDJ3t6/NtfX/e5i26M+ScyDnLJYV/N2c/u
	s9qtROvxqGbUI/Cg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hardeman.nu; s=202608-rsa;
	t=1794920280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X++P4NBnyiIYn2JLERFI0cj+8rSyEarq+FNZBQ2tPFY=;
	b=Zw9+WiEaB3knnwLaTligp3LnQliz04VukIptSbZdStTdtGJRwPVaAO4YwLdTFzO9ub1ari
	cRTx1wuzasvvTFLu9Y75jxJyFwY1g1OP/74dblYmAcH16xZjO4t5bJId68L8j5tcxpzauj
	jRO1xggtNd4qD9o5v3M1e+cPde721z3iKE9NRo42ZUb2qQH47XIetIawJeT99L+vXzkVbY
	WokDM31dkpOjPnZiw7TLao3nUBArzTCaisD6qAIr3bbQfKi7sJJcEZ28+9TsHuD7WIwdAm
	SZTazUkNRzTCNOn30w60rwjLS43mQsjSJW/E9hSLLtqxaf2OwPTdlA8oQLk5mQ==
Received: from odin.hardeman.nu ([fd27:2a41:8fcb:2::a])
	by thor.hardeman.nu with ESMTPSA
	id erW8IFdP/GreEikAWTs42w
	(envelope-from <david@odin.hardeman.nu>); Tue, 17 Nov 2026 13:57:59 +0100
Received: (nullmailer pid 3647654 invoked by uid 2002000001);
	Tue, 17 Nov 2026 12:57:59 -0000
Date: Tue, 17 Nov 2026 13:57:59 +0100
From: David =?iso-8859-1?Q?H=E4rdeman?= <david@hardeman.nu>
To: Luka Gejak <luka.gejak@linux.dev>
Cc: Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>, Alastair D'Silva <alastair@d-silva.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Bitterblue Smith <rtl8821cerfe2@gmail.com>
Subject: Re: [PATCH rtw-next 3/5] wifi: rtw88: sdio: limit the TX queue
 length of the 88xx chips
Message-ID: <avxPV6EFa6PrHG6S@hardeman.nu>
Mail-Followup-To: Luka Gejak <luka.gejak@linux.dev>,
	Ping-Ke Shih <pkshih@realtek.com>, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Leonard Lausen <leonard@lausen.nl>,
	Alastair D'Silva <alastair@d-silva.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Bitterblue Smith <rtl8821cerfe2@gmail.com>
References: <20261116190145.2736364-1-david@hardeman.nu>
 <20261116190145.2736364-4-david@hardeman.nu>
 <B58755EF-D7EC-47C5-8DED-EB19A880CE26@linux.dev>
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
In-Reply-To: <B58755EF-D7EC-47C5-8DED-EB19A880CE26@linux.dev>

On Tue, Nov 17, 2026 at 08:21:50AM +0100, Luka Gejak wrote:
>On November 16, 2026 8:01:43 PM GMT+01:00, "David Härdeman"
><david@hardeman.nu> wrote:
>
>> +             if (ret == -EBUSY && !rtw_chip_wcpu_8051(rtwdev))
>> +                     resched = true;
>
>I think -ENOMEM needs a retry here too. mmc_io_rw_extended() allocates a
>scatterlist when a transfer needs more than one segment. For example,
>dw_mmc with IDMAC sets max_seg_size to 4096, so an aggregate larger than
>that can fail this allocation and return -ENOMEM.

You're right, I'll fix that in v2.

>> +     if (resched)
>> +             queue_delayed_work(rtwsdio->txwq, &work_data->work,
>> +                                RTW_SDIO_TX_RETRY_DELAY);
>
>So if I read it right, this also needs the work to be cancelled when the
>SDIO interface stops. The power off path is:
>
>        rtw_power_off()
>                rtw_hci_stop()
>                        rtw_sdio_stop()
>                rtw_mac_power_off()
>
>rtw_sdio_stop() only disables interrupts and invalidates the credits.
>The cancellation is in rtw_sdio_deinit_tx(), which closing the interface
>does not call. The flush callback does not drain the SDIO software queues
>either, since the SDIO operations have no flush_queues callback.
>
>A pending retry can therefore run after power off and keep rearming
>while credits are unavailable. The RTL8723BS retry helper seems to have
>the same lifetime gap already, so maybe the shared stop path is the right
>place to fix this before extending the retries to the other chips?

Good catch, and I think this is fixed by Alastair's series, which I'll
base the v2 on (+ Leonard's series).

-- 
David Härdeman
