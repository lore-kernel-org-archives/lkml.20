Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794826402;
	b=L/hVmwRHXd37p3cwhk1tPfQh75YCS6QJNudSXMPfPx9WI0Odrv8w4LyqprayXE1BqGpB
	 k4nvRwZscqqOpiswd+LMZK8y96nrUwn5lVqlC3U8fvg8nN+MNwtT8bo8pTSlSO0kUc5OI
	 mwfpT0Q07ik7wt1cawaXSpYvzAtWOE3Mm0aGvgtyKlqwRlmeCRNMkP/PqMCaGoW0wOIcJ
	 YVOcHYmNB/iJf5BfGZVv/PRS+pMOlaK12gyYGOjHfeZB/0RcbhTDA4aYRolMfFH4TqF0X
	 XyNgxvXTXxm3gC7aV1xmtlVTIAmZwv/z29lKO73mS70GPRN4Ed6MYlBcUlR5qapEVRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794826402;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
	b=OKprWWsiMHe6EyUDQ4lnbpc8OzRCjK0qqQbsU6ise/OlJ0XRK2ssAMSidS7CC8halh2C
	 8HORlipxVC91sWhZ028hdF27mTBuG9fhvIUZV/qx/2umqx4w+2tZiD9bz/3MsDkzz+Smp
	 Fh8DSAN063/CHq0NgYjGtFAv5eNLAzQv1iPIRykDG/oQZoD5hgK44Lulu/leKdXylc3XM
	 rKxPq6Nx37cOMIZ6llD401qrwKiS4541xOxaj8xAKGVLWhtYBS5S5QHueidBjN7KZruLz
	 v8MTig09tP4NQ9Ls+KtEYA/HfFhHxaIQ0toeyDvysszyADF8sE5GlIiieSwajWO82tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b="gVOy/ThH";
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB3606A8A7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 10:53:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77CB3606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=gVOy/ThH
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0e61a4decso3758623a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:53:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794826400; x=1795431200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=JYxkXuSGXgPpvgtmzIWzxnD15FtI5OkWUSemTJ/hINLQC+/XNiKrYafwJPl5/RejgD
         Nmx2o1t9uJ7aVMXwRO3LhB/AyFwJptJBGXqsrMxP1GSdJv8IW4B20PkaV1TXdBIgDETi
         4QiIRewJYUfHXet7Gw4pW6uZVPeRvCiTnJa/cIz/TJeH05+1mfqx1D1+ZulqIyrRNjKF
         1Zv8y1CJMKS/iwzqo9ZKAyxMeDdiTEitF5k1sxtnDbyuj7mKLuYkaQSHHI5lbfQpBtOR
         NKRTINQuyZn7uUvy2a1ADMF4ZSdhABK+MvMLyOz4M2Kxo3Bsr+gLoCznfNlGdx3yO9QT
         J1KA==
X-Forwarded-Encrypted: i=1; AL+hErE+VJbYXigBLjCon7/W7NvaAnb/X0zNSyYwzJ/aj7DGBbgh+BJAHyb4eTjkXx4jQBoMqkk8XLX4I+2FVRY=@vger.kernel.org
X-Gm-Message-State: APuU4Z9KgwiUGrObmc964SiovvL9qUR3YJNF9ajKgXGgqdYVXy8YH8rD
	u5b7r85jz+lmSHSpWlsbl/NXZKqCi9wHrv+4AIo6sv3w4iZBWrfaK5UmMKr0k5EeBRpp42e13tN
	2+6/XqxUUkYI4d+t8s0Bry17d2cE2+7Zmt2HvWuKjtvIy77jv22VmQAlqpkSkxybZKO5A8Ay95l
	kdeq9YQopT1u27M5akeV0NOxEP6BRbgBj/8PHHKH28R3xsdVn+lQGr90wuc/xxz3G2YBZixkmih
	Wwd67WJy0PQ6jI+Ung83oZiDA==
X-Gm-Gg: AZFdTZe9wq8tA/bH2JjqIs1xzjb2K9ea67ntNkD4yOBJZOulHSWzo/cySb5B2TGv6pE
	g7hPjokkovJ1WM3huUj/2I1ErzkpMMblBhtKuYVefRcYSfWNhQFG7xFzyJo+5CLnkRsjGSTxIsA
	oBIoL7ZxYIwryDGtrf5UtJ4LUqiPFsHGcLMRfis9/cOFM00p2sJM8Ft3XpGsXysObtkqDjja5J9
	eynZLmffzB4lWiSnqOCWU3+z3BdOckN6+Dm+rqdOpV6qFoApLiM1FLseIcJrR7uTykzUxqs2mhC
	b16fgFngM1szgawYgIXwg1gPlLW4nZKdJ5TA7WKQGziNywLsf5pKEPCuYLUJg4jp/tvGdYaF89j
	lipfbr9w+kBrS7SWESUAm2SgV4IgMWQLhVcGxLIz4Nm9HbP6zMQ8VS1UNm+lsP/SmFT+BEXQqIs
	R7aUA6bZ7YS+/Wg6JqD0kn7TxRMhec0Y/k54rZg/xOzA==
X-Received: by 2002:a17:90b:35cf:b0:3aa:6b5d:a00a with SMTP id 98e67ed59e1d1-3b1b0d08f37mr9761209a91.53.1794826399585;
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1ae97e783sm11810309a91.6.2026.11.16.02.53.19
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:53:19 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495a1f5e47so177040185a.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 02:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794826398; x=1795431198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVQaD9JPLSlypPeoMjV3YW5/MfO3VO8SRm2wJMatWzY=;
        b=gVOy/ThHKXUgs1OvPpLYhMH/sQgjvWOvzLAUqnIZKQn69+idgqqFb0nESnT7u8LyjC
         9MyPVIZjBhBRKAbr9Hqjb7OcJtCQhztZdUnayjXqb2fH7CQ8Dr+dqODaj6gP5NoX0opu
         xWSBP8Ywx5mA6kVppv2sCNbG4ApEfpMXpAXkw=
X-Forwarded-Encrypted: i=1; AL+hErE8uNEv1oIEmGKCSYo6nagANc2jBMskIPq90RKEV6+XZnLhgcEkDEOSqI2QaXGiut6Y3LJJ0FrpHgmJL8s=@vger.kernel.org
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588959685a.8.1794826398320;
        Mon, 16 Nov 2026 02:53:18 -0800 (PST)
X-Received: by 2002:a05:620a:4541:b0:945:afc1:a73e with SMTP id af79cd13be357-9494ba601efmr1588957785a.8.1794826397898;
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949825e08b4sm125151785a.37.2026.11.16.02.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:53:17 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kordian Chmielewski <kudzo51@gmail.com>
Cc: dev@deq.rocks,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	j@jannau.net,
	marcan@marcan.st,
	sebastian.reichel@collabora.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next v2] wifi: brcmfmac: msgbuf: count tx status only for the current flowring
Date: Mon, 16 Nov 2026 11:53:13 +0100
Message-ID: <20261116105313.3479803-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261112175754.396469-1-kudzo51@gmail.com>
References: <20261112175754.396469-1-kudzo51@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Thu, 12 Nov 2026 18:57:54 +0100, Kordian Chmielewski wrote:
> brcmf_msgbuf_delete_flowring() waits for the outstanding_tx counter of a
> flowring to reach zero before it sends the delete. When the wait times
> out, it sets the counter to zero with packets still out. Their tx status
> still comes and takes the counter below zero, and since the counter
> lives in the commonring of the flowid and nothing resets it, the next
> flowring that gets the flowid starts from there. With the counter below
> zero, the next delete of that flowring waits until it times out as well.

[...]

> Reset the counter when a flowring is created. Give each flowid a
> generation that goes up when the flowid is released, and keep it in the
> tx pktid of every packet posted to the flowring. A tx status of an older
> generation still releases its packet, but no longer touches the counter.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Kordian Chmielewski <kudzo51@gmail.com>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/msgbuf.c  | 36 +++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
