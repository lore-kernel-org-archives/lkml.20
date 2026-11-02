Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793592267;
	b=fDnrN++csADlsWBb0/9bmJKR0Z+AXW97mJLYnj/ixJL4w580uiUZDukbzVgGtXAG91p9
	 EZ0UghxqmZ+YZrA1lI5ADjKpmsRb4aQZzwruV+KDjqustnCIi/6C3vRx5/MG3VP6p7zTW
	 5ULJR5107gC7PN71KRBxM5B18evg4kuP40o6oJ93wV0wI/var+DTkGY/4I4vpr07tTx2J
	 aeIVLudTR7AP7+JWVZ3lgVz4FHlQ8CxSYh7sDclxW+nEk15ewQnBvZIPwClHoMjdnRpsi
	 KDjeEdM+nqnit3PDajJyuwvEhzxLR8uZDNPrMQ0aEn9/DTi4tf5Wc6Z85VXqpxUZLGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793592267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
	b=s85JhsWX2WJI49tjUFe9tOw/Jsnwjm6xywZ0hPJ6lanTEg5yM4mkoGLTUtASSHlg7v7N
	 ybwGG4HtpvkzY5iKvjaWeuuRbUjnvIbTa8vKwDQcgOZf4vcqOcl6l942htTh5L6gksmSa
	 PcpAbVLDKnL7dCsluyWkVk5ZMssVnZzUITT32mgzsDDncslTCMG6Tf7YiY+hsawEdUqmg
	 0yZv7N7iBv4RcCC5Q8nDDmCyK5zNR76WpoJUBdDGTRIEumjwW0JHgSgKPOfm0VN6gfkUE
	 3EYzVMBOL0+yMor3R+fxPN0/soPGluZqxrY9/cBN47KyeA79gGBR1arYvvc8zy4tCpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njgNK7Zd;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23206606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 04:04:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23206606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=njgNK7Zd
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-170135e43c7so140654c88.0
        for <linux-kernel@vger.kernel.org>; Sun, 01 Nov 2026 20:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793592266; x=1794197066; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=njgNK7Zd9sPBHMbCEZOZr6eVDUWt5KBuD+VTP+s5bqmhvtslQ8ZL2sG2+HN6HyuFVC
         /+Z5tEizHBWdkrRM0OF5q5WMfZdalD9gQNPBs9DTYP+elbCql0MeR7kzaPyPDea7kuAT
         rwnGZvYRrJBI+Pc4kguE08MyRN2WT7+LTczIPZGGvlCNlpXvU1OhXizINJ5HswSnqv+d
         2u4SiKplJO46unhLgZ4QD3txxVYKeGcT3nN3r4xkqMllZmAdCYg0NEnikkTh4oJX74WH
         PzS2RMW00PUFXM6veBossspVxxZmczbNTrIwJf9qvZWkUw8Pn2s/XmyVMZsNwtZizWxV
         EJRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793592266; x=1794197066;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoBL1fg1knaJIkUVWNPfYfv2x4Q0uTv93/Tn44/ErLk=;
        b=VgBqDbi/YdFoql38UdU8UxCjaxx8FwEmDyrlyJrMQsIytIxS7nVHGlB7trJ1Fsfkbz
         JsFdqgHYjPJ5B3NnIbL4EC0E8jAo0Aj2bYeslGFOyGP8LUpvuAKONUtCN1vauhhzO8DM
         0x9D1t3k2flfABJq2TZ7TDVoE3OOythTlR1cwrlksszAB6pH/p2FtC4muGbwpDOkXotS
         FOy6yyNWuoPb86OPxLp58WVqAZkROGj8PN4KvyiQbrJdiy8WGiZs9PJSKCIY4E6Iclvj
         unMIIIXM7vOTlb2oMzw5Gt0Zr+S18HBzMTPZln9kUzQ9yHmZB9EWnw0YCTpRIaePiXNj
         WBlA==
X-Forwarded-Encrypted: i=1; AKwUvBz2iahsBC7aTmzTV0IMUfXlmFTQo1DoajWY6ED5oStouPqBz5d8fzR6Zxc+oyhLbpMdUTdGE43VWLSMQ/w=@vger.kernel.org
X-Gm-Message-State: AFq9FYKlpJzBJp0oxv8etc8gIPqzbC2GmB3/lRzlRmHO7b9bjy5AdvCF
	TqErN2Y/1fOPgFQ3NMoDEfbBYMm2NhwsKHxEAsLO2mkkxajJi9mNk64u
X-Gm-Gg: AYBFou2VnhPb/nicI93JeaYVKr0palW2nn2ddIfnUdNjxISlkfh7hkgwoFUAQRzrDVU
	ZmFOfnYT4rMMFwUWBoujkTUp7g9PipAEb2nEkCAU/vYuE1LEh+LSlRUvKUW6KNx1bF7O56PS3fH
	+802YxgoD5ibyentVJg1g0pBrErUPbMLkMM6+nS8zyHyEtCbG+0Lc/tBVz2SgswE24RXB5S/DZV
	JP0SVDt5clV2ZEvoXuTmY7xZqiT/Dl0HChTxOHN5iLFzXeO9AZBNPpI/SysGQRQKMEgrgA2jpFe
	GQO1DN1MJ1HNarnPvT7p+8WSSx2WtRLOzitmJRrk2HDSP8ul8y/hlLfdVBsqqehw+120N3WJqcf
	gJjxQHBNnyZDs2RmdxK17ZnBPGpplKFAm30QQdyUeT/nkGniECJVw50wBp1Qswskt34t2KZmx8e
	N8Y19B8NTsXvC3v6ZXCgkphl56QfbF3lUaArWRcQ41eJwvNZZ/6TULHZN+AmrVvRxvl2aCwmwDl
	CRjgL6hkgCsoj4HWx4sjLIFYCi6cGMMww+UsCEtq6o4mnpPNYuOgrbahfr9POYeyHnWNxGwSoIY
	zPNEkXu2eh0yTMK0tWhQaQgTNOuOnINNLlB2yL/pPBDjm4HA0pHTbJz670OSkyyVnqfl2NA=
X-Received: by 2002:a05:7022:b043:20b0:19c:dd9b:d09e with SMTP id a92af1059eb24-1ac5cdf9b17mr14479268c88.23.1793592266054;
        Sun, 01 Nov 2026 20:04:26 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:d75c:a9d8:6c00:c5c6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm29283682c88.5.2026.11.01.20.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 20:04:25 -0800 (PST)
Date: Sun, 1 Nov 2026 20:04:22 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Ryan Brue <ryanbrue.dev@gmail.com>
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add the
 MT8173 keypad
Message-ID: <augLnMBF7Mbw9_sL@google.com>
References: <20260915-rbrue-suez-upstreaming-mt8173-keypad-v1-1-96c325efacbe@gmail.com>
 <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>
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
In-Reply-To: <34cec90f-b6f7-49ec-a531-72150891dbb0@gmail.com>

Hi Ryan,

On Sun, Nov 01, 2026 at 09:24:58PM -0600, Ryan Brue wrote:
> Hi Dmitry,
> 
> Gentle ping on this one. It has an ack from Rob and reviews from Mattijr and
> AngeloGioacchino. The device tree for the Amazon Fire HD 10 (2017) that I'm
> posting for 7.5 uses it for the volume keys. The patch should apply to
> input/next with a three-way merge. I can resend it rebased if that's easier.

Applied, sorry for the delay.

-- 
Dmitry
