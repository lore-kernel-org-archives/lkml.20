Received: from mail-pj2-f33.google.com (mail-pj2-f33.google.com [74.125.227.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629D433937E
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 23:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789859909; cv=none; b=boeGLJSVwVPEH2T0oJaZova4qKQ9hXrGX+VFybMxqrS5SDq9Jg0ChXGc+KAV10WJaLQpAMIYvWhj5wNDWybsib3o+7GK9f3b2nRK5o2n+0k3KrfTyqUpfKZRJHV8Il8+Xh/AoLUyFy56IFyQvq2faQZacirx67f3TgNThbv50Ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789859909; c=relaxed/simple;
	bh=afubjmtK6J69d9gjWzx00ieDaqApuKhjmcImG5ymlNQ=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=AZywS7KFXBYkcKHNzefR+QwC8Sc7473EKZHNyd4Yg5vH7c3GLXVRRj5xFl8eg6eAzKTACaAQvRo9FK2hL0eBJjg8xb23SrLNLV3kXudI4udcnqf0FCMduur/kIJ3EtN+0aNXrpPZi+Fq0Ku06C4F+HRhth5zqeg+6yJccy8qvRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JxqgL+89; arc=none smtp.client-ip=74.125.227.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JxqgL+89"
Received: by mail-pj2-f33.google.com with SMTP id d9443c01a7336-2d747ed1368so23848275ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 16:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789859907; x=1790464707; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sUuoRL2/TITlGn0R3prNUIqDwgNFzk2wNFbE6aU/ybs=;
        b=JxqgL+89t+ENA8TbE3a9gpcPYolq0+DKEIYpBu7SK/0p1F0V/dRsYEeZBBYKWHP+gm
         qciIgVyuXllKAeHHMxGWtIF6546WUBGjvus1rS68gpmTWJSythf/kj9HNtpUpxP/pD89
         bHO0eErW9C29GVzCHHvQJCwTQwdHL8/Da7Li6gzw75mt/GkarUIJdmq9aZeepWyWvCjD
         pc4a0bni3Z0sK/+i6o8+m/etYsS0B+SSHLJPPmGLWugoyg/1gbZLTzBZnmAWc2n2zIei
         O0kfnWJjyZROzQR8kBuYot6au+sOO9VACQkOCQIgEO4/g+A0EJWlOtkwc40mZH8YyKUN
         2P0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789859907; x=1790464707;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sUuoRL2/TITlGn0R3prNUIqDwgNFzk2wNFbE6aU/ybs=;
        b=jdp8ff21NCx9O87VYS4llabqAQukEDi63Fp1jOGDPjRu9QPL06zTfRTTCK2KSJOeoV
         j3u54wM3xMensBRncyHtVMCuG1njikAVocs7N5qWJMkIohkzHvyj8wpc9oEbksmBymup
         AKtmgJfyJg+g91paYXAh84EnXAB6R99NBoaT4J0kRvdTXJR8ybVFru60jEcP0747NnGU
         0rrPtON6NzwqRW5TqUw14Ry1STDt22ZAhuIT12gJxlLFtwwa0DDwSDhdaOPZZoDy3rXC
         8pfD+twR42u7IlSmR05Ln08xrhcf72a/AF5vflZIDHjtZCdtf5EX/hBZrHsr/7GlgMPn
         gSWQ==
X-Forwarded-Encrypted: i=1; AKwUvBydXDzThyRT48ltbchnzgVvMhTInEvJPkdRSgvJzeKrWxi4kFv8eMsgZf5hGpzQ2Z4JCxcQu1a7zJa1D1c=@vger.kernel.org
X-Gm-Message-State: AFuF++mBsJ65Atwc7TXypNKq7dDoMGgR/cPNHiYEgzkcsIWzY4lPx9Eh
	ZHd8C7Q0AMIARpTWgQsYhxl1TLrZQISaD2/+Q3rvdlsf4WPn/Hcb3ZXz
X-Gm-Gg: AYBFou27L85r6FYG5CpkXGVwFL99uXXQWLF9mLcArRYiiK7WPuKdbH4KIceGhoFRmpE
	v2y53fPHKeKdDuY/BzgGCkA7b6lR5plFk/j+VUL2bQezKNqf9itivJO+tgYqVkF2Eqr1Was5MLj
	XLiJysGmOP3WXtZMDkd0Zoc0yRrlwfIBguC6ukjYgAhmB0sO3kixGTd2nypsEETHijFHxfQbEqF
	cj4eYGfX9XrBIuwCysT5oL9IgbtVB6Ggxgv8l0QZFOz1Vdguj45OCCzbvRPLeGLwHJ9h+tJo1ee
	LZdPDhdqwEJve8J0jIaOmGpI1WCg9zxQBDw4iv9MDm753wb0A8jFsUGZ+I1XiHtYqJYauNEk++h
	7m4TbgO08JKk2ORQjUPeJqVxcO6RrRoeISFh7Lep6G81Hpu6/4qaBQGq2E8hBorg2iJLN3RcAkp
	V4svp+xXggisq+Hc5pqR2WvBOr1OsNoUsfTJgIDgZL3zo1/A2XEzShMex85G0n68UCMLvmhI9Ck
	C0rXkJuHkvx3nkvnhWpZ+wtSvf3Jf8GZ9inDCFToAnt/E8L5q95P4uyQfBh58UZDClEymXV1qAE
	QdZK
X-Received: by 2002:a17:90b:2d47:b0:39d:f4fd:8075 with SMTP id 98e67ed59e1d1-39e54c9c7b7mr11531713a91.19.1789859907264;
        Sat, 19 Sep 2026 16:18:27 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c164c18sm6403791a91.1.2026.09.19.16.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 16:18:26 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 19 Sep 2026 23:18:26 +0000
Message-Id: <DLJODTPSL3IT.1LQ0SJ80PGO1M@gmail.com>
Cc: "Willem de Bruijn" <willemb@google.com>, "Martin KaFai Lau"
 <martin.lau@linux.dev>, <bpf@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] bpf: reject unset network_header for SKF_NET_OFF in
 cBPF load helper
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Hui Peng" <benquike@gmail.com>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>
In-Reply-To: <20260919203517.2581484-1-benquike@gmail.com>
References: <20260919203517.2581484-1-benquike@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Sep 19, 2026 at 08:35 PM Hui Peng <benquike@gmail.com> wrote:
> diff --git a/net/core/filter.c b/net/core/filter.c
> --- a/net/core/filter.c
> +++ b/net/core/filter.c
> @@ -231,8 +231,14 @@ static int bpf_skb_load_helper_convert_offset(const struct sk_buff *skb, int off
>  	if (likely(offset >= 0))
>  		return offset;
>
> -	if (offset >= SKF_NET_OFF)
> +	if (offset >= SKF_NET_OFF) {
> +		if (skb_mac_header_was_set(skb) ?
> +		    skb->network_header < skb->mac_header :
> +		    (skb_network_offset(skb) < 0 ||
> +		     (!skb->protocol && !skb->network_header)))
> +			return INT_MIN;

No. network_header == 0 is a valid value when there is no headroom and
skb->protocol says nothing about it.

When netlink_dump() had this problem it was fixed by
skb_reset_network_header() after skb_reserve(). See
commit 99c07327ae11 ("netlink: reset network and mac headers in netlink_dump()").

pw-bot: cr
