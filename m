Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823280;
	b=SazeT918HeNMsvG1ELv4LCH9WIaPemfCwrlR1NfXRngau1Fk/a2DBsyuYT/g64uL2zq2
	 0F8PgFarUD308TssbCmZA8+xQgEUL49RvpOqVd7bmAu8uPg23IA5oCkbKZcyeSXkDeJQv
	 v8Abh4x5fuNJfYo9V0TzAa7A7+2UtbuIRtjKeg9lIfgMrGUx/vunsd6iwJSdgjM/zOoZs
	 +ixoDO/ZshVuM3J8SQbcn+T+sCOdmwlqNLh7ulnkZaE2qrINa/KQ52hY4gf/KL9dQrnDu
	 W4rVtclMx1tmZ7Cpj5yC/eAcTD1F1ATMIuWezniewy8jt0cMcp7wEUzeze+hgLUYk8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823280;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=nAk9TdoYQsbnhW9OiR+BprvysYmI/LWBbcb+XpKe3i0=;
	b=0UW86Jwo58UdFbVBgEiq5Omgi9cU068WXRfKSL1g6qKYkUAVwSUjizE0mJkztoCqZItS
	 l1RQ/bN+RGvPbPHmd3Aefevy4j6imoAKTOYday3QBMy/a5txo9pMNUnjaES+4h7KCgvRA
	 S8jjrIS6SsnUtMwscPD42f/ewdgGVd1wx+6E3EshTAEk4A0ozDoqgD73r2m0y+/Kaop4L
	 6OGjKgA0Nru3bsClAaDpSkSNMksRsNCPMgz4b3BF0FNZ2rPMIFRS73ceE6ioFqZzBo1om
	 jhpRtn9m61nD+ht5zJ/KKKecsZEry4nN5YX2qu3QWZjR+zRKpCelK2rFOlDAOfsbCjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ql+XRLib;
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0459C60B88D4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 20:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0459C60B88D4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ql+XRLib
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3ae7626d14aso706481a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793823279; x=1794428079; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nAk9TdoYQsbnhW9OiR+BprvysYmI/LWBbcb+XpKe3i0=;
        b=Ql+XRLibDWnQ1LnoQjFEX/qf72hQkbUy+kGN/fXTX2FCPHDIlqSMYkBDf3lVI7MaKM
         VUWVMULjccrZBJ/djTGNKLVIVDpRmRhcEZUUQBwZK4+Rr8mO0+Bi0mkZfd2ZHBPpudVQ
         EPZbDUg7TiomNlcc7z64bbg+e4EE+2sg2iMSx3lmLZVHDo+GZSxXWifh1/SaayVPnaRp
         fgl3Wyi2yHuh+5k9k4PHZmTk2AbYt+1hHwsaY8Jwj4YkXCITgQsAVWUFq+2ocr269ahq
         tZeFIBtfeAQ2FlkWYd0pHUvZGR0OtNpSGdz2nBviXUv0PFsroYvJfhjYOzvU4/UdckL8
         DAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823279; x=1794428079;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nAk9TdoYQsbnhW9OiR+BprvysYmI/LWBbcb+XpKe3i0=;
        b=N1ZioLHC0SSulte1SG56VhufNSkhadwBG+I4D5d8Yfsx/IDDh6Bqlf/Oq6upfEPNEk
         Guw3/zNSFbO4o4tzt3fGCXCDHC1i9A68rfZlNmqnYd9Irq1MyNVusC9yRFGYb0dKG61A
         uLlOW28gXE1u8ksunuL2nLY2BGdG5XuYec9zT3i3W4ChK4L3IU+H/o8g68yW1FRr5EFX
         cQrXMYWYHm72pzSpM65fY5Vy6Bv/XSk3fAbn6GFZJcw0cj3gnlgdC4CX+s39iOVpZN9D
         aA6RiC85h+NrMAwCKhcaER5d6ELuqQC66jHafM8vvRoG+wFdxO4NC5fiA+6p0ym4Fiky
         XSDA==
X-Forwarded-Encrypted: i=1; AKwUvByLWHx1G3daiXzPo2La5K+7KyQ4i8Fcfu+MFC3WC66AR+J99twEcnd3Rv6gDkcsOUfXoV4GJKNy9ZJShZM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/W3W46ZPLLfo/KZVI3cr5TZ8GY0MB0h+O/94PPkJJaxHHMoGIc
	8NvWb5oaEIlEmUwd6/yBFmBSNBKC8Qu1l2t9JXb1b/UuvFkyHLuEbpyP
X-Gm-Gg: AYBFou1WS3kJMOc8Urv0KmTKQgaqTGWh/ogY0VAX+H7OGgclYCayeQKZVda8o5e3O+u
	5iSiysZoeKDuPpkH+MiKNNoQUD6YdyshBS/8b6o6/dAzDI1fvTmIW/N7mlgSqUNuWVU2hjgNDVR
	rNxWDT5Lr5QYWw9NEIMOpUyLtozMi7Zk5I9Eb1nGhplhC5KNS2GBpp3UyTrh8LD4jQOoz+qOxG3
	Hzd3yI4vRf+xnFlF+dIAB1oPfE7XUuMXgiiKpBI4xp/xL4P3gGUnfVMIKtq5++7ys52Wa2KcNr+
	syEToXb7sulqAmiThsS8s2noLaqhql34/JSaJ+UbPH1HfbWVXMd9zJJfmdJjzsu4lxNj/Ytf+Kg
	xXxbt306DOhEukwbiD9EcwF9HrkwG/cC4Z3OgZNf0EvDAykWwzJeaAVEGWZtNYyGYy2T/uV6NfX
	7MKi927TUVtDSEa3RvuiS2r3mTYy//Pl6OrNZ5Y9FKUTC4+3V1OBptjbpeBaXx+7x4sKxV4b+9t
	c4E8Pdrdzy1L29IHZwU7bas2JyPOlyAPVaN/zyXvO95zkUqZi1KcViJn3HU3KHfgAT9XowtRyHD
	AwN3tOHQ+AHxL5QjQOfgSWzEJTMifDhbqiNLtAcAhjCHyTlm/OcQhi/+N4ci1VKraJ7yKYyaQkh
	LxOIeV5GbT1QwU2z3coSXDW+HMz8wWrsHQCw=
X-Received: by 2002:a17:90b:57c5:b0:3ac:b44c:2d84 with SMTP id 98e67ed59e1d1-3ae897cc815mr14967216a91.13.1793823279118;
        Wed, 04 Nov 2026 12:14:39 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b094ce9f65sm2992245a91.1.2026.11.04.12.14.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:14:37 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 20:14:36 +0000
Message-Id: <DMMPA4SE5V7I.BQOTSW259XNA@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Antonio Quartulli" <antonio@mandelbit.com>
Cc: <saeedm@nvidia.com>, <leon@kernel.org>, <tariqt@nvidia.com>,
 <mbloch@nvidia.com>, <dtatulea@nvidia.com>, <cratiu@nvidia.com>,
 <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <netdev@vger.kernel.org>,
 <edumazet@kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
 <daniel@iogearbox.net>, <hawk@kernel.org>, <john.fastabend@gmail.com>,
 <sdf@fomichev.me>, <linux-rdma@vger.kernel.org>, <bpf@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next] net/mlx5e: Prefetch packets of upcoming CQEs
 in the linear MPWQE path
X-Mailer: aerc 0.20.1-355-gf870624f6c37
References: <20261103235823.536706-1-antonio@openvpn.net>
 <DMM0ADCEGAAB.2RFNF1ZI5TGWK@gmail.com>
 <f4bdb8b8-45d6-477d-bd7f-4ca4bbafef7c@mandelbit.com>
In-Reply-To: <f4bdb8b8-45d6-477d-bd7f-4ca4bbafef7c@mandelbit.com>

On Wed Nov 4, 2026 at 7:46 PM UTC, Antonio Quartulli wrote:
> Hi Alexei,
>
> thank you very much for the review!!
>
> On 04/11/2026 01:39, Alexei Starovoitov wrote:
>> can we prefetch 4 strides ahead without the CQE, like gve_rx() ?
>
> Yep! I measured your version against this patch on the same system (one
> RX queue, MTU 1500, mean of 3 runs, gain over stock):
>
>                                     v1      yours    yours + shinfo
>    UDP 512B flood, packets/s       +39%      +35%      +36%
>    TCP, 1 stream                    +7%       +5%       +8%
>    TCP in an ovpn UDP tunnel       +36%       +4%      +34%
>    XDP_DROP reading the packet,
>      NAPI CPU cycles/packet        -38%      -45%      -32%
>    XDP_TX, cycles/packet           -35%      -30%      -33%
>
>
> It matches my v1, except where every packet becomes its own skb, like the
> records of a VPN tunnel (ovpn from a development tree here).
> In that case I got only +4% instead of +36%.
> Dropping only the skb_shared_info prefetch from v1 gives +5% there, so
> that line is the one that matters.

Thanks for the benchmarks. Glad it helped.
