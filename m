Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793636303;
	b=sHZaOBUjhos0rLXpTbTQYxxlb/99aRD5lrdmveECfkfS19YHnKkeERitw2cE4HSUliDE
	 b8x7u8VEFa/MV+WVATg0zmRyStntYYMOTtnEK+WeLmY3B0Ryvmk8JZwWVjx7aqtc+YeWk
	 7a2Mv6qGMcFdpskf0WL8LhaRDDCeJqUpA6KuXjsf7js7TlNAZ0yIbpdyN/AT2m6JtGR2S
	 ZzbF+JQ46YuZH6IgAtYtcNOF65BH3wwlqsvw7Fff6j9nMRSTtUHY+Nxkk3JsynWd1MiSN
	 7GNM1YJ9PaPJtEPXNlj2nVO0bUjBP127kYgvY0Byh1cSd/ai0LKUe2mMDXj51zxGPzw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636303;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
	b=1sXTxUDq8dBqwbm3Tpa/oLUgnO3n/8YSaGYShC+0uyT3UvfFP6ztRQGp3hxx3Q1srOHa
	 IyQM42KS3oVPI82/zQNOzo+2E66JR7lSQMUGp1OELAJgGmbYcHM21ShmbqEIsmnSysIxK
	 xe8oppeqJ1QiKkL/zDK8g81gZnv7NXMTx86DTxT6VWszm8Gtab9hCMaHExktMnaNiqdsl
	 diaCXKAj6Ol129n8yCaq2bUc/59no2dHNQY7hmac4pxca+/RMo8wCqTQVhoMkA2iiYXqi
	 YcIPwUwxSPRiIhIjzHTGduMjNq4oHODDUQhXOZ1gMEmVoMKxXhQtjrNmWphW6d4cXIw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiPmSiKG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE41B6083619
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 16:18:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE41B6083619
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oiPmSiKG
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-33fb4680717so5028558eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 08:18:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793636302; cv=none;
        d=google.com; s=arc-20260327;
        b=OyQKqrYJk5oTE6BZzHbecjvmtSqzCg6ga1s9QoO9ELY8fXC7PalkNwzr0tMJqVE0AB
         QNfgivCL1m30jYfRt5D9AqE/eQARFCWEdfCOQO+msN8T6WpzDv75IqwfZaUiwf31k/vR
         j3TPItzaweFYecuPR84GdHPvWsyoMXqzvDqJk2WA1awk0KWtAma8Gglip83X0I0shko+
         pLILYck9qPKtPmUgKTFP4UsaGBN57osnl7RBreE1YIUaTermuRlLq2m+PdhVD+LarQdL
         3lNj7UkpE1LNXaGAF3XI5ULJxiTw7ZJabMuUXh5Qa5Gxs36q5M1xqBNbm7TZibD/NsIc
         vLGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
        fh=oJMpC3KEG5Fb3HIrRTfAjcykKiwAcsTMUgF7mfxyBoE=;
        b=EQ2swClVyWrpHJd1Ja4BgQa1rk8Dxt5JoigU3T275++9RvkJtWgQGLNHYF0Cd2Nfl+
         uAIaWwcZCAQc250LNadHsYpznH92BuQ/USlMbxnQEhQ56HrLWyQ8d/6GoQ6pSgUKqgXx
         GyUAzsG599jVk6M7gmSZUvb8MP7sVWhbC1TYJ5Sx1wwVG9hOKJJMdKf4d7x6P1YUNhw6
         Y72bonziFJzUmibrd/7RIGxNcCy2wiVFy119pfetRhMJP0sRKgL8kcrkk8sk72orjMUR
         V7/evAT7R324aWNjDjuR1NAvOi2m1/MMtkSFR11FNWgHrBvvg6ZrYe6e3EzCzsZ30Zl7
         gwdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793636302; x=1794241102; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
        b=oiPmSiKGc/9iR+p8CGhW031Q6pD44el9sD5FeY84Wj5De2OZRNH5+yEF+BjF3trLUy
         3n90pJtd+8i7QflHvhbZR3TL6YRdBcLpzS7TMgnd5QPSbPzP/mTxqUQ7W1OfX3ZjS85R
         lyG3G1R1FzRJEKMKnLZ4c4X3dOZ15PcZou5xmxcALNaTwT8bgY6bKOvERVde6VIs3kMf
         R1LORE/nSdoKQYtObvSjP6EdrUDwcg9ERikwNXCXGLkUehj9fCQozAxqk3lammBcRMYM
         7Sym/p7vzJIBrGAM02OZbuh4ZZ/9Msf1jyrMvwqsqDay1oByONDJKXNj/QPQPC0aTh/U
         QOLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793636302; x=1794241102;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CcXba6+QSvZDXF/uqMoMEPJwhAO9oMl+Ldeh0etrrCk=;
        b=DcCIzoQyo6y7OkKkjn0SzBF81MdgfB0AA9ZKZi57kITTPM4DvKMEbd06Npvd6GF3Y9
         2u+QLs+UEoTn5F7FZYzkoWSg4ft7duQgNxgJHHzsQ4dz2skZHz3TIAMQtUKUSX/Rg41R
         ybfltTyeFn9mlFcOddFBxdaL4oMgFntHyosJAnfoBRvhdwPzfR7rgmdmXH9cXG7oI6CU
         rTwTBEY1L0kNiokgCvHORaubjNE8E39pUhyRnUdlIy3HrJxdveUtK3tgKHXeaVbdDyZc
         PbF9gz3rWsRaR5INDamtx9fMaGJ1I9hzEukf9+Vo2pODkxcVKYlyHv48IKXF/ZKQM5Pb
         MlqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxbKkwaCZD2Xyp/nFeN5jLx8Yu4X8dfC4XNnAwu41eq8GzdyoqQQimmyNFN1ZR6o+fFvb4IF2unOk/Ja0U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8m3k4LPCIO+fPtcQ00tyeaLJOg1DrzWyGpisICnjluBdg+bvV9
	bRYAfKwTeF96ZDNiV/PYq6cQK9tdX0/INoG2mN7kUE1AT82/GejpKJIekNHUwPKKy1p692/JI/r
	/RH/YGELUR+NNT/VjFpK46p9ZAeiO/g==
X-Gm-Gg: AYBFou2Xb8dxONSZ8Y0UAJtmDY0kuovBV+UvYoyF5xYW3lOwBqC1+BOXzeVgEpsjokp
	1Pl8eqUk8IPiFsDK9Hz7fYZr53MdxG6HPWhRA1N6IhjgYNZ+Chuk7AZx9NggZCVF/qqy3Nednab
	+eLV6TQVg2HsVhAE0Vm1pGwSslBljaLJb7U3nHNqf+BwxGkri6PyF/SSuUzdGTgrPRQRYAO4DmQ
	KHy1v4ojewavUcne3TT2TRC4V0Uww7TetdpFSUr97KlVjKGzoTE50b57gRtNSU04Duzf/7Uipee
	npeKa7QCAw1LXkX4srYW+E8Inr8Kwnlp//I5opBuvkPQ5hTCab1YOkGpYzsAqGnYN0KZEJt6YBu
	CSR41MxuAkoyTtqwMTx4LYzgCkPsUZ3dIdTLTY5L11Z1WyB03rMPGJUpFIXW8ilcIiGTbKe55Ol
	Q1jmh6j8Xl3+359Cq6eFI=
X-Received: by 2002:a05:693c:864d:10b0:369:9062:c392 with SMTP id
 5a478bee46e88-36a424261c5mr18440928eec.37.1793636301684; Mon, 02 Nov 2026
 08:18:21 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CAM6_QD_PoTdwdM7DvzzgHRs-G5EvQu-c5oNGve=GuKV4wFYAvQ@mail.gmail.com>
 <CAM6_QD_xAyTFVvYKvCrrZmS+fV5DBBje9V=VdkDMMSpt2ussRg@mail.gmail.com>
 <20260928120343.49e02c07.michal.pecio@gmail.com> <CAM6_QD-CbYSsmic5LhpMi-aMXuC_VaniELBzaBeWO8SWm4UONA@mail.gmail.com>
 <20261002104355.698eaf00.michal.pecio@gmail.com> <CAM6_QD_z7eT+N6HieHyZhPmXqPxKqeSYKX8OK--M+rN2VAsO_Q@mail.gmail.com>
 <20261013232506.1b4dc340.michal.pecio@gmail.com> <CAM6_QD9NDbVESP5peiNhfU5B_7UmvKVLqNz_85A_GABwDhabiw@mail.gmail.com>
 <20261102135125.121f8de9.michal.pecio@gmail.com>
In-Reply-To: <20261102135125.121f8de9.michal.pecio@gmail.com>
From: Dane Linssen <linssendane@gmail.com>
Date: Mon, 2 Nov 2026 17:18:10 +0100
X-Gm-Features: AclHuK--jr7yX0N51mMeigjqHQa3DhOtTsDC_f0Xm_ujdo1a4DNU9CY359A64s0
Message-ID: <CAM6_QD_ceOeoiv8HC5aH5nMHoisnAXGxMz6tRAbgmp3RD_4cdA@mail.gmail.com>
Subject: Re: r8152: RX stops until rebind after -EPROTO on the bulk-in endpoint
To: Michal Pecio <michal.pecio@gmail.com>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org, 
	Mathias Nyman <mathias.nyman@intel.com>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org, 
	Hayes Wang <hayeswang@realtek.com>, Chih Kai Hsu <hsu.chih.kai@realtek.com>, nic_swsd@realtek.com
Content-Type: text/plain; charset="UTF-8"

Hi Michal,

Your patch works here for the simplified case. I applied it to
openSUSE's 7.3.0 (offsets only) and tested on a second host with the
same RTL8156B (bcdDevice 31.04) and an Intel xHCI (8086:02ed), 5 Gbps.

Without the fix (stock xhci, r8152 with only your trigger), down /
ethtool / up gave exactly the stall I see on the other host: four
soft resets about 3.5 ms apart, the hard reset at +14 ms, then
Transfer error + Hard-reset at ~270/s, and virt_state 0x40. So the
onset of my real stalls can't be told apart from a desync that starts
at the first error.

With the patch, three rounds of down / ethtool / up all recovered.
Round 1:

  15:56:52.892  Transfer error for slot 1 ep 2 on endpoint
                (3 more Transfer error + Soft-reset, ~3.5 ms apart)
  15:56:52.907  Transfer error for slot 1 ep 2 on endpoint
  15:56:52.907  waiting for ep 0x81 clear halt
  15:56:52.908  Hard-reset ep 2, slot 1
  15:56:52.908  usb_clear_halt(pipe_in): 0

No errors after that, and RX worked: the gateway answered pings and
rx_packets kept rising. usb_clear_halt() returned 0 every time.

The host that stalls on its own hasn't stalled since 10-28. Three
things changed around then: the adapter moved to another USB port,
the kernel went from 7.2.11 to 7.3.0 the day before, and the host now
carries much less traffic. However, a 74 GB copy at ~15 MB/s over the
new port on 10-28 didn't stall it.

Testing your patch on that host needs signed modules, and I can't get
to it for a while.

Thanks,
Dane
