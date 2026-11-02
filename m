Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793650074;
	b=lJKUnijFeslaS7HsP6WNFp76hYvo23aQeN2zlizmntX/si8i5wLDIOI3no9ik9vPkLFm
	 SHpN/GOQKirZl2qj5rUFiaGzE2+rZ2K9xF4y2NYPVmWrcxi+H0bszF6d9N3xcmNu0QqVt
	 9cFUXcNlLwG3QmU3HT681XDXLV8AcEp7pYxUyu0li01EKlVsSbKGeAxQLMNMg4Z8djeX1
	 CWHS+soNkMRb5FYnRiw0qh/nTD2VBtq9IJzhK+7lojJEffxnNbUeqPCYe9AdgKP2kFApK
	 vQlgCsNHirDZjMJ1lCjLvZgSdP0SZNZzQXf89Ts+Sn6W3IggWKC7Gztx3DAaiFyxZCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793650074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
	b=nqwpx0ZWDdIfCFz+gG0N7oga2jMp7cbxQyCaWozxSjqnbvv1v6uaghZQOh2WNQ9ju89/
	 e5IMfnz9+voD+2d8VDGe+lXD+6Y3yIOkvKDa8Kn8kt+UPrKSYBm2EEo14A6rCxQvKXvxI
	 h4DH3YqliUod6lP60NamB9NFcbJlvfRwzooGWvqcPuvFGK9Gqv3GSKhi0KAaGPgd5Gz19
	 SvNKpHW276+vp1fHwMCMW6PPK+Gol6Wwgmqrr09H/Z6vivLEqKcijzUgi5WwerwqTZfhC
	 vOvqpT8o0lZWHXUdTxxPfLq7aexoQvKjmATk5S0Y495Nt88PKlvS1a3W42pceLZWzaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jk8TrkOl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.44
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AC6606A329
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 20:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AC6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jk8TrkOl
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso1780a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 12:07:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793650067; cv=none;
        d=google.com; s=arc-20260327;
        b=A6ZrNK9sSyyrjIybYUbiyXWvLRUjRf0bvhedKAC2v5VzyahCXOO8imfZlOl9tCO/eR
         SoLwc574LE23GmjdO3cbyPi9YTar8XnKJk3chsIpkRO6ktpOp/81NzTVMbcL0Amip1ot
         t3SLYC6kRZDGio/MXDjS3jvyVllgs08WBPP2sFncxmQ5xSPM4yzpbzUI5Q6QLjw7kVHv
         zBCyQYON0q8fIdD6atOf0dQCy66TFWSZS1MPtWA37BBQt4DU5yZV8bxzcimjTJ7LWcR9
         +YfFriyRsyIidF6la6/gWeXB+6oImX6vsZkUdsJLhjvME+i82e4FhtKuRxUu4P5XRDwo
         94+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        fh=9Sl5xBDFXKX0X/n0RvJSQCKT3+XqK20DcvLpG/aD//4=;
        b=iOOI//mTXSyb5kpRzbvy9j/G7n7zY+3bdebRR4A6WwvVb+I29XG4Stm94dvtLjd8Vg
         qA8Q4ZjsnPA6TpHMnPtqydSSbfUJRB3P47A7kBcSm+L9wFqoMUMVIxEduMo+Ku+frqem
         CBgOg3r4TTQWb7LpyiIHe/1kQGPk3gXVXQI8Z3j0LXmx7jlJs6zNS6bHQfdmGPTudglC
         PJE/qFLpJ7GoUKo6NcnHk/CasoFqxukIUjD4Vp5+Wv73eazntNpz2vyeH/t1dC3Y+wEP
         rZw40fZ5v7LA77tUGvk5HdrIrL5OwAGRR1gaPzTp6zuNVpSGEonas+Vd10r1FfdtjvXp
         V/yg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793650067; x=1794254867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        b=jk8TrkOlsW97Uh2N2lxEQCWSr5BDOlLraKDAJDImF5X93emauVjuWCB4kRG5DXJ2mg
         oXi8tL+XOW49nPtI2u2njp9hmZSDUMa6G/1KMaO9Q5qzNu07fJxBg+FGZwHSPkrB/3+p
         +n35tr9rPg7bWoPu4eX8xtne358FzfbxYLhTbxaih9uGNnm8EspyFlcWvKfSR929T1wP
         PdhuKIXNMBvyc8JGPZ0UjLnzK8d/ugvhnqcVfKUScJJXgrIRL8SofUmBK+358GTHLXn6
         4DOPImXL7BUxCQKWkh8a6VYnY27wG/hPyzEY2mSBDHGTrMVjqQIyvUjbN5Mtc+HYQcjd
         XJ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793650067; x=1794254867;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2y2WavsP8svBBeJai9Uevzqpj1fQ7NNZDo+HgkQhGww=;
        b=VAbJxQxOXHdC09xmmWnSztqminQpUTaIQA16t0VviNIOdgCbDV4NKgUX67Oq47Wr1s
         qRCTN+OyZGl0U3WFYpu7aAw8+2JpLca/1Ur5E8xmquQKBTsJBaEpujISKGWlWD9rzVoG
         HdSQmWSZ/AQltG5d1tiDHVOglmdY3E/5YWafnAVbACMC2NVLaSO6Y0v9Vl0grWXqj/KG
         bpCe4HHoxqncjXQY373zAoFj2qc7Iv+gphmjL6qa3mVRfhAtlWqnvKRyoybMdIYU9iCx
         8L6leprPpUFW4WgVf5dXHtpyMZ/CogDRzZc9LNheiEE2PBHKkwLlmqvTxhKewk8e9t76
         Criw==
X-Forwarded-Encrypted: i=1; AKwUvBxxdUzFw2zU8A0LwcbObxbJ5lU06oNNCEjhWLtNi0k5UdHO1kA90juQMNWEta86zOnHddLOr2myg2u+BHM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8oPrcTTu1mnx/QPRe11fzh717VPR08O3C5m389cHKHQAkk0STI
	ecNHQg1E6En88D3MrONl9khMaVE3eqa6eU+sHCfhX/eDIlFUw0ZrOOYg83dMzn/qmAERpiqXGtK
	MQkuK06b/nd/yQ8LcWiheaeqlgpAvu2w6JKYU58LP
X-Gm-Gg: AYBFou0V/w2VYl4JtF3z76Czlh0DuLNXF01+ZDXrI4Jkf2b+bCnrv0PU7jpkO7k2ABE
	n8wuZ4fmQdplzW53sf7i/yRySNmaT3bnAcqljh1UI9r32yPMcaroqvDC8aWUZRymolhqSPDetsd
	FVnk4H6AT7hyq2DvpeV3s38Xi4XLUZkgRUTeK2F36gZ7hTIx2eAiyoTHaVOfxL23evS97AWKHbF
	mEItXfH8WueIYyvOLQ4S8kcQ1bkoWIi08fCJo7s4LB1gQ3CnIYx/S7GTkLMj3Gr1Ublivbp+1xY
	hKSTp1LOU1AzHcBWuweoeI0g5DdeU1K5rbuWxILdn9QwK7hoVpQdrN9KAPIKH+/lAjoQ0zv0Swc
	wFO4PjVyH3M2Nx5i/WY5Uy4giqzWW8BwQYk+W33f7ANBkd65VIY6pEoNRgyq/8a5HfQRKjf9GXs
	MUyFXGHRv/Xbkd
X-Received: by 2002:aa7:d752:0:b0:6b4:629a:6352 with SMTP id
 4fb4d7f45d1cf-6b539cf7661mr6374a12.5.1793650066614; Mon, 02 Nov 2026 12:07:46
 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102191438.1059771-1-sdf@fomichev.me>
In-Reply-To: <20261102191438.1059771-1-sdf@fomichev.me>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 12:07:34 -0800
X-Gm-Features: AclHuK9gfr07IGAAZ9tA7d9yIuAWy2wfQLlcGX2KzOTTr8xZ9Khn8LIVGKzus2g
Message-ID: <CAHS8izPAaA5fNGmA6TTAuo7z8T4-+1xmR0yF=OZH6EAcQEF-RA@mail.gmail.com>
Subject: Re: [PATCH net-next 0/7] net: devmem: size TX net_iovs from the
 dmabuf layout
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, andrew+netdev@lunn.ch, 
	edumazet@kernel.org, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, rdunlap@infradead.org, michael.chan@broadcom.com, 
	pavan.chebbi@broadcom.com, sdf@fomichev.me, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, daniel@iogearbox.net, razor@blackwall.org, 
	leitao@debian.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 11:14=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> TX bindings use PAGE_SIZE net_iovs, so a frag covers at most a page.
> A 64KB skb needs 16 frags, and MAX_SKB_FRAGS caps devmem skbs at about
> 68KB, which makes BIG TCP ineffective for devmem TX.
>
> This series picks the TX net_iov size from the dmabuf sg table instead:
> the largest power of 2, up to 2MB, which aligns every DMA segment. With
> a 2MB hugepage-backed udmabuf a BIG TCP skb takes a few frags. There's
> no UAPI change since TX addresses are dmabuf offsets.
>
> TCP still bounds skbs by size_goal, so frags get larger, skbs don't.
> A single frag can now be as large as the skb, which matters for
> NETMEM_TX drivers with tso_max_size above 64KB:
> - mlx5: 32-bit length per data segment
> - gve: splits frags into 16KB descriptors
> - fbnic: keeps the default 64KB tso_max_size
> - bnxt: 16-bit BD length, devmem TX frags are capped at 32KB by a new
>   per-device limit
>
> Tested on two mlx5 400Gb/s hosts with kperf (udmabuf, 32KB RX
> net_iovs, 2MB hugepage-backed TX buffer), series backported to a 7.1
> kernel on the sender only. 4 flows, MTU 4200, 6 x 60s runs, medians
> (CPU over the 3 runs where every flow got its own CPUs):
>
>                               before    after
>   frags per skb (sender)       16-17      1-2
>   throughput (Gb/s)            389.6    389.6
>   sender sendmsg CPU (sys)     12.0%     6.7%   (-44%)
>
> The link is the bottleneck, so the gain is CPU, not throughput.
>

I mean, test single flow please so we see the throughput gain. But
CPU% reduction is good enough reason to merge I guess too.

--=20
Thanks,
Mina
