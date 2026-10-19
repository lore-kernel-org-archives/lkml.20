Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792453570;
	b=nodecPTRRpT/VNUfaouiwRjfRxB3PXe07rmPKWuZIxYE0GSINvKBLebHS7+gB5tplT8K
	 dtEcdilQi+8Sam3qijg3Gd+EX5QJfsR2CYa3Q3ztxKNGxawHmlTUG++5ZlgRiS1AFByhn
	 JlpRayyhbZGSyGwX8AzY2/5URdNCW/F7IaSlSSX/hD2WbLHi/BaRwM3JxW42bdbt1AEG0
	 W9mm3oeURSlvtXnI5L2TJ5ScBymn9P+t/xGt7cM+wGHyipD8/jrss8hxaNRq3fDpKAXwh
	 YKf93HoPMhL7s5yeUNjyGkQa3FjrYG1foxWEm1CyIBhNJdeWo6nuV5gFXtA+gN5Y6eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792453570;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
	b=d6JDxw5O3aoJhd8U0AW7jdFa3fbsuJrsZ/lm4GO7m+6m4uQ4tXRDFLZ7Zd1KATIDyudo
	 FDq8iRrzkhfnkIFyBjy64pOl0VulZ4NWx+08MBVyfT6I/eJQSFyOAdVhLBukGat3YXM6n
	 4nDp4ZVam1LYcAImYfRg1T4x9/N6cyYkHRHAg8bDwwbUk0+PjO/I89XOIcrmfk2DfilK2
	 ldd+uO9bRgyWdtd4o1RUAkedjqg+mwGPd9J1JUN8nDDNIIW0/mLl9eqrl46+pjdX0YRKk
	 fHQ14zP+twmmD7Op3wdykfa3t7UH9ZEDeb2nP2VVlwDmAIM37bfJDWq20Vv2XYA2Njw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F30W39f+;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oFtonO5i;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751CB606A31B
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:46:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 751CB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=F30W39f+;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=oFtonO5i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792453568;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
	b=F30W39f+TIXr/Fp5w8uuXB9BQWFgNgayBKcU8lpItwX4Cg808rbuFGNJl54mVfJwMwu1+O
	+E9RwfNhVXOOIqQF+HIAW6fvWCgqPYyJRmvG7+Pg64bdlOrt7fRfnbf6KXvf7jW0BgCY4k
	XH3MmN6IIcQg0Gsqa6ZupKIZqrvinSo=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-OUc6Sgl4NeChYcNxz3OKvA-1; Mon, 19 Oct 2026 19:46:07 -0400
X-MC-Unique: OUc6Sgl4NeChYcNxz3OKvA-1
X-Mimecast-MFC-AGG-ID: OUc6Sgl4NeChYcNxz3OKvA_1792453567
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53664911d46so53589591cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:46:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792453567; x=1793058367; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
        b=oFtonO5ixPlR3vxFaRqLn3+WT24xVPkgQUS5ET7DSkZfVdvfmmNK3ytZG5RnjtIe6X
         ApIeGRlhJAk8IrzJgQdAGdl74Sx+2U9afcby+XVFUyV1PxBK8Nh08g1i6LX0oxpuxiid
         Gl++jGI7o6ylJdbu3JSmpXv04GqK6/KZSneSNIaarBTwIqfqIxUHCal+aoPvjmEAgS2c
         0xp+F7b3EZNPa0C5sNOBk2Z8JAOO9b46X74In3ERhO27Tgw8f31wrc/6hm2u7tUSVDK/
         7p43PHLjcU96A9UEc7sBWCmi5IjWb8pF2XawNTvVdPP9rek5MWUaihsxaF59O5yaTQNy
         4/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792453567; x=1793058367;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bANbvSVZXQhEXhYP3TP2TElb96lJqFoxNQuXKkY137I=;
        b=CYgDQZEvv1M3uRQrVRNh26BH0PPiagXnFzAkWee0ESi7o0Er8j/okOvZA3qS/prd2o
         SFrZjmz+EwlhxYff/e3PVPSn367ZVwwEUb6kkMbtn/omg4n+1P8q4T6U4Rr3x0Aa/TiB
         qHFLyTEhllxOSg1paqXdj6zFjnaJRt0ba+J9bl9+bzLvaJwPlyoSwFJdP6Dp0SJRZkTq
         7M/BqZNhsyEGYEW0uED9uYkOzq/ZKS4MoF5Qj0elrnvnRCPl+iiY1fKVN1gfsnzTIVmV
         O1QIq5TCPmT8SEoZd9jKnJ3VdYhb+V2fhumKKftvNZ3HPg4bDPbiOvNp6mxsswrlM6JA
         hn8A==
X-Gm-Message-State: AFq9FYLZjTb8wuCKmnMLcnFKzF2mQ82tgFDSc2ybTwyx1N7UA5KjL1s6
	wLoOgy5c0/SQzbJY609KuaIk0BN86fCMVcZuj2c/+wX5FkOFlYWWNNZtfj5roJD3s+UFLXkNe4s
	xrgHVcsVkkKzqr7ApsVYJ76ZPWUB8xKAdyb+4m7uEIWSjpE8kqboP4TJiq2y8CRydxw==
X-Gm-Gg: AYBFou1UEsiSpnJNcmYBqPR/1dcc4TxCzqMrGFd1Ei6Nm7DBkUSM+NBarIHxrw7pORZ
	W+wvuR/Lvr4hVewZa0yot8RnMvB7XwyjlOONhR+F+zArz5ddSKcmnbrYXz5gD2lh5nrHJPjtLqc
	l8UXH44qn1/4YOc+RQ2QUf9XxyIU9cyZk8oGPPAVYmd8s8IENV1PusmQqjg3iD3sjTWPsWRXPOt
	G76GlibQ/bTSB6daUTvn7Og+M2SFjMIXLVdFHq47a2EFRY7VHAnvPUrBNKTNQ+1IUnOJHnskAH0
	yUYWbiy3VzHAEab5F8wXw5uG467q8v3A2UNlYk6xQA/hIVtTZK1WDpTO6QzcXfSqhlmNGiv9oFR
	5vWX+b4+dr8GJ/6WaCTgRrmEMwBYs9XQ/NuIfFCtiN2knxmzXuHNzBwpo66K/0+2/RcehOj37bA
	m4zOsO/Xk=
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027621cf.46.1792453566443;
        Mon, 19 Oct 2026 16:46:06 -0700 (PDT)
X-Received: by 2002:a05:622a:a17:b0:536:695f:bdd3 with SMTP id d75a77b69052e-536695fc526mr73027101cf.46.1792453565913;
        Mon, 19 Oct 2026 16:46:05 -0700 (PDT)
Received: from bmasney-x1.rmtuswv.csb (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53656bcf751sm66755561cf.14.2026.10.19.16.46.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:46:04 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: linux-kernel@vger.kernel.org, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: michael@amarulasolutions.com, linux-amarula@amarulasolutions.com, 
 Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Sebin Francis <sebin.francis@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
In-Reply-To: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
References: <20260904101243.412006-1-dario.binacchi@amarulasolutions.com>
Subject: Re: (subset) [PATCH v14 0/4] Support spread spectrum clocking for
 i.MX8M PLLs
Message-Id: <179245353543.117654.7478218308853360546.b4-ty@b4>
Date: Mon, 19 Oct 2026 19:45:35 -0400
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-d96cb
X-Developer-Signature: v=1; a=openpgp-sha256; l=720; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=1Zr0ZL61ygpUZIVKFPvP8VcvRE1XoRbIaNzvBa5Hves=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLKurd5U80jc7qBgokvY8r53frNq2yaIPGd6+GGbZZjne
 n214wyBHaUsDGJcDLJiiixLco0KIlJX2d67o8kCM4eVCWQIAxenAEzky0pGhs+LnM6uiHrk9rr4
 0/4fMZde/7r+b8/7skUtx49bnjbmeXiY4Tfbf8k6TpPFLxOWNKb+9OppWtzn388WYsB+4mNltFr
 8V14A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087


On Fri, 04 Sep 2026 12:06:29 +0200, Dario Binacchi wrote:
> Support spread spectrum clocking for i.MX8M PLLs
> 
> The series adds support for spread spectrum clocking for i.MX8M{M,N,P}
> PLLs (audio, video and DRAM). It has been tested for the video PLL on
> boards using i.MX8MN and i.MX8MP.
> 
> While at it, it validates the spread spectrum configuration in the clk
> core before it reaches the providers, and fixes the i.MX SCMI OEM
> extension, which converted the spread to the wrong unit.
> 
> [...]

Applied, thanks!

[4/4] clk: imx: pll14xx: support spread spectrum clock generation
      https://git.kernel.org/clk/linux/c/1ca4bd0c6c0d

Best regards,
-- 
Brian Masney <bmasney@redhat.com>

