Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794883691;
	b=C+jWY3UtaDGtlJjLuzS5VZH1kJGmxVAg0meimCFQSxP2JO9o46HBEa7qq32cSR9qrobN
	 zqqCYE7eDOuVBpaSOf9yDhOS2C/oBfo7E84iXAYiW2Df3w78yncTbaYfC2JQY2H7IFu/t
	 4YCXITkmISq0rEJ9EnnjI30ZXAEtx23a+a2BIZLk6F/FhMjmVowcrYhMxFXqiZ/zbmP7h
	 gwmEdIQDxL0xOaRc6gZigUAirfEaGDtSVgN7wrAaMo705xIhPiqxFQSb+U6XD1YPhm5ZY
	 eh1PhH5Mbl8/+jcaYPviznPPJ/jesAI9+tMFzwbL9rnZl2Kdi2KUobdBa/jKgIcYDww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794883691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4t8Dxk7ZnBbbKz64urGxkXljcZQSrvG7czYCvU+jEOc=;
	b=ormDZsPACzIctlQtetlTaOwFh8k26HzxktU+HtKDHShe0wCunjsatjGix4fgtE/rJIZ4
	 DjckoIOvydSoLBx7gjBzeXFo69KbCWeb3VssHBoTUSvL7XakbmEXTP6AHHAC/F0QjTL48
	 rg5k72+CDJuk1dKfcbE+j/+BScg1ShiphXNjQp6hltJeKJM2q0YPjNdRzmPjdQW3eUmBn
	 9bQTTToet1N95gNb4gUCUJ+omCv1QgDJBPqE9VxuApXfHZ1fQDFIkZhzOSPvwcEeiFkRO
	 nuT0MyTfvSq/qyH1InyqSz0DVG+ZLS0vPRoCCttjNNWmodBnRyLijjtaIHMIkmOMb+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kApX0D8O;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1843606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 02:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D1843606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=kApX0D8O
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so5403532eec.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 18:48:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1794883690; x=1795488490; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4t8Dxk7ZnBbbKz64urGxkXljcZQSrvG7czYCvU+jEOc=;
        b=kApX0D8OJDwZh/CtQPB38h2IwjXuQ3A0/kcVqfYMpIUcGirtA45wcQomHDuVC7Nq0l
         35ndnHMyRIhpG9v2Dxeooy7igVSycYuJIOvLY6oXLwog6Gon6AQokrUufEzg7cVCZAM7
         5G6jAWB/W/kkdw93e2YvN1wW8wxbhWaLydxZKwhZXeV1ZO993Gd3kfF7T+z3/WRYDcXe
         enJkXQFpZyNjwb1yFezsveUX9kE+vJMpIPjzJTeSkLDwlVui+Z6Xmp1gc/oos2bmR+Sq
         YUrtdPQPc2uaHkElmt2bl9e1XVws4EzsQU95L61mw+tKTLZv9GvE2FSmRfLEbGWXYY52
         2x7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794883690; x=1795488490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4t8Dxk7ZnBbbKz64urGxkXljcZQSrvG7czYCvU+jEOc=;
        b=sN+OtEWCt9BGC8rRdtUiEbYEvzYDrsNOEr+FYEQmWHxwwD3nRkQgrjuIF/Eo7yLSC5
         LVGe0aIJwSZXFjfMxR/LCDIHNWxRMkYKWclTJk5ME/P311j87lu3Avfd5XJzdhMIm305
         uMPrAP5eRuUSIXPnooI62XT0Cjfw1y/nvbnLZ9sIWYvJM2mDLm7xy2OqPI9+hBRhpDUd
         sd8Zc5tMRUjNe6lA5vTxywTVVsibdJvJft+EK/19N23UePOKYu7PHDUkpDA85yHeFXdC
         nvi/Yq6Wr86uoChTk33rQmfhb0PchomoFJ61/L3nUJUH0PFQ7eK7AVp8EaFWrDviKxwB
         wcCg==
X-Forwarded-Encrypted: i=1; AL+hErFt55ZeX4/Z3ELFnAJhDiZFyJJKgbR5wtd32e8XK88FRld1wMqeeaOvajTV6IHSp+WCaVIy/8jwnJ4Ohuk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+3WF457OGhLmDYYfkaHv3OYiSniXJXjJqeUJ7wL7iX5AWztY+6
	Xo4YL0sFuTiKoRvyuZu5wrtXkHRkwqV6w50Grpn3MXkmu79+WR6TwXQLtgBjeRqkwx7kDq/L67E
	g9pl/tPE=
X-Gm-Gg: AZFdTZf7Ug0bA9+5Btb8xgCy1ZG9j9frd3qtAtr/wU+tJPVL4bjaLeY1biWjQmhqP6m
	5EQp6JfNvv/eFMG4p0zCu1XBcIMrzigFgV0QAxAwOY86U0RBl/f6hqpyWmOZYpn1tc/18c5CRug
	OP5kjFy43wS5lyM3HTefFSkv7B+Swq70e4Zc2bOyvuz05O40mCviXyMqJn4QHWCUNmgydjd/FcF
	c6u80QlFONWACoAs6Mw8Wd8UuN6JMnCxuy3DksiMI9YEb4NuAdNbnwMslBdl7drGb5oK1Xj1Zc2
	sUMtXceGDXcEQ1WqMirk36BBpxBn5irAYQHW6EsSpEvFLXk7NZXBwlyLTQLlgFBTosI8iK00qHq
	k6Gx4mq47bOf6ofh1tdszKcyxPojvCtDljfiLzjwJ4Uo3R02lwO/G5lBp25/EvuRGAzsmUyb/d/
	IEjfLXkxIM2p4vNDrG3ia1aIgrKgzanm3sSRQ531vidww7HxEt5ecVpiCdXdy+manf8AgsL4VhI
	zvogcY7KqUa8o7JhoX1BgSIsuJJ3OOHYgxNY7GyEYtFTkRIdBECFiMZaRdxGKwvlPv+ycxQSPYV
	t5WFFHzDj26SxFlLPtA19tzYQr2CFm4Grrkq3BZVvDhme5Q2Z41ZDZubRxKIw7dNZPx+bfBWisn
	q00Nwn72qrOOU
X-Received: by 2002:a05:7300:b284:b0:35e:2c6:d46c with SMTP id 5a478bee46e88-37966e3abf5mr13168307eec.10.1794883689835;
        Mon, 16 Nov 2026 18:48:09 -0800 (PST)
Received: from [192.168.1.142] ([198.8.77.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm34396443eec.4.2026.11.16.18.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 18:48:09 -0800 (PST)
Message-ID: <903b7861-a0f0-4b56-8e6e-3c7ec915c686@kernel.dk>
Date: Mon, 16 Nov 2026 19:48:07 -0700
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
Subject: Re: [PATCH] io_uring/timeout: don't rearm a multishot timeout on
 cancel
To: Cheng Yongkang <teel4res@gmail.com>
Cc: David Wei <davidhwei@meta.com>, io-uring@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116044519.281756-1-teel4res@gmail.com>
 <71233dfb-bcac-42df-afd4-45b65dabbc09@kernel.dk>
 <20261117024643.478059-1-teel4res@gmail.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <20261117024643.478059-1-teel4res@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/16/26 7:46 PM, Cheng Yongkang wrote:
> On 11/16/26 7:41 PM, Jens Axboe wrote:
>> But why would the app do that, to shoot itself in the foot?
>>
>> I think the fix is fine, but the premise of it is very odd.
> 
> Agreed, no sane app would do that. The only thing that made it look
> worth fixing to me is where the cost lands. The drain runs from
> io_ring_exit_work() after the task has closed the ring, so the time is
> spent in a kworker holding uring_lock, and the app can no longer stop
> it by being killed.
> 
> Without the bogus CQ head the timeout is still rearmed during cancel,
> it just stops once the CQ is full, so the change mostly makes the
> timeout handler skip the rearm like the other cancel paths do.
> 
> I can reword the commit message to lead with that instead, if you
> prefer.

No it's fine, I already queued it up. But it really reeks of odd
and bogus syzbot test case, it's most certainly not something
that any normal application would see.

-- 
Jens Axboe

