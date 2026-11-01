Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=209.85.167.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793500709;
	b=zBP/egZhEITMpbjPVhFIziAsPy3mDWK5N2N2biXim+DMhQ6zQ8b1jwXlF13D16ThUgpG
	 Qi90U2L+Oh4cZTMWP7qX+uwccl4nuKY7jo930D1dWYU6xFq+qDL7cD62PbR1j4XJnIr+R
	 k0ZVuG68eVFTbOLvRaUSqGleHZDd8p27otlg/4rMfJoXA3XaX2TeFy/QOgffxgtq78fkP
	 Q8RH+xCZ/y11AcTHM0EbqG1y3cpv6hQO8StBNorzI7rcUvyTnOnw6jUef2VltmD720d2P
	 m24ILWxnsT0UbG7a7+zRmTTTaSj1mS4jG60wkX6bnF/Pyy5e0WNYZBSN/7OUQ3vxV5Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793500709;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IypvIEaCfHpiWS3R2dq6ogvfOiiT9ZVprPilvXJ430M=;
	b=he6fwpCGM3ax+iz2ORGcEW5fZqTM1My2Z6wna+3c3nc59MEEGFBuq9Jw6GJjNR/RUdoW
	 BC5RDIQG3L1g6Mm2l7Je59zkn1u8B+QVbVm6qFtPSCqCv6XTNuT9qkShgDxcjo9NHsrD0
	 r1CyF8MFHW2pF+onx1q0PizniN/GMGyjhu+LS9q+Q+U8vms81FLH9zidgwMwaGRJ2+ZHS
	 V4qJsuh87UbsQ0X5+hGL4WKTGJ2CXlplT4c+wWGBgVy0FS7Y3hcBnxKuusCiAXbWgU/9u
	 jXG+OBKRiqgGs8SDPfetLTC0omrifS3Y2gH7ITwgfLBfHU5ptg63clJLhNllhv97Mxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ez0Ef6Wk;
	arc=fail smtp.remote-ip=209.85.167.46
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A5D606A325
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 02:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5A5D606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ez0Ef6Wk
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so440000e87.0
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 19:38:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793500707; cv=none;
        d=google.com; s=arc-20260327;
        b=FRWH5YErTiwPwxYqnHIvnE2v/IRPLFenJ4Zib1OyjmoobxoN/hI5NjIH5IZHoszgKC
         Vp7VzK34XKEiD+zbqpe0eSW1faEiA2/X6lZAhIYcPB5w6j7eXCU+XrLNUPTFnUsxsPsr
         rbzp1QzeD81Tia9lpTRzeHyp4Qn4v5JhWBQubBU6F88yO+HO1gKGOFzxU8V72LXeg3D3
         +cfLcmiH4DxWD5QISi7EUjZ1MfS7RNyb5Mw4KJNyjisdINzBxsaTbipW8N02eceoNpiv
         7g6CfKxAzJr1fXginaukKmreYuuP58GGWc6qrkbMZObgdY40VygAjVCHBxunxbKXyugj
         y1ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IypvIEaCfHpiWS3R2dq6ogvfOiiT9ZVprPilvXJ430M=;
        fh=O9PeAzxbB1eil+4ZeqE9wBwRJeQWV0GXJTOm5/p9Ims=;
        b=E1HSMVyv/BIxrZ2VCE8CrI+MBdbdapHxNTzE55cHksl/aut6F6VvfCykYkPIBIeB8l
         e3ktOZl6n9qUhYFKGI1b6XybfunQoTN087Yvxae04lbfeklgu6yPBMRNOI4dpJCmgJcM
         ivVvLL+1eQE0zN32g2JI/TYQit+skGtpDEGbU66wEF68KANOf2djEVOBWAxqJkykmSrH
         RrjrNoybOnJnQ2L7Kgv7oscZ3dOR31rNmfemK8/yYq5ObYP+LnLelywxowg8cH/wMIOs
         2bWJbZxiBterZ6PIhfS1chXxre3VRgRgQDMh6fMmJnXxk1nchzOFbHuyOU8XSvuhMREj
         VPLg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793500707; x=1794105507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IypvIEaCfHpiWS3R2dq6ogvfOiiT9ZVprPilvXJ430M=;
        b=Ez0Ef6WkIyFnPfzu27thZzh22hC+1ma+rA5JcQudoseX3D8VYdwroGF3YKNx/ccGTi
         DSIg1lM3aZijUOTRaXDEOXa9pywWQUCX2fdMXHk5SSz2l9UU9tUsEvuZxYzooTvjMF88
         3rWQw5CgIdyOPb+EHWR04DSMTRgKdZPC8Qep/ba89p9VLNqBWpQpGhZpjzxDkrihMMB6
         4kM0tYzQyptUuvPthx2qjt/0JeMUNaT+Q33aIGbPBCaZgFVii3iCFf55n3MavyqL1QMs
         aeMu747SSY5helzpAXtMPtVXj/V6fnR8Yz62qiv00z8QMZi5MyDRTclRiwsKVo98Jlsb
         yHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793500707; x=1794105507;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IypvIEaCfHpiWS3R2dq6ogvfOiiT9ZVprPilvXJ430M=;
        b=DqH/9RrNQwGpKeSldA2H06OVc2SBgTr+UswXiuWFKzTfMWQ6Mj20Bg4FbdJBovHw9w
         Ua1I6nqQOhiYppoyUMzTXhAfhQHXOTN0OCxowEfISW4bxpNKlii3mfB6+uPOdJ3qxm/8
         dycrr4sRWYKVcaYOFciylK8Nw3hsYNM5TDT7VC/tXRSdyHldQqDpOu/3tSbLFnTvy+YD
         fFWBESnWhggpEZ1f2Ltu1aaALksBSonKgBS2wyAq9GiRNO+7EP+vl8H9gnf5LY+CZBjD
         b1HBb6YuSZnMQhh3TaApAP8iV2a1D/a/BPKk+EED2zF+HqVFeEqTyuWGfBqaely7m8Xe
         sXsw==
X-Forwarded-Encrypted: i=1; AKwUvBx+NV3bg9VzcIP+Bj1kop7p+3wS9+dvjv/jHT+0Sm6ErFD12MpmLpM95ZZNu4orRq7LFK2ITEYr4aZbLHs=@vger.kernel.org
X-Gm-Message-State: AFq9FYLprX6kpOmvvLflqHnLbNIEiV0qd7PULeKZ+5N4isPzLKtt9Qla
	azPUzpBIdLVW7xRYdbQuFDHObmLN06A/8naVT7KRByZWBSeLiIju1m1cW/4K4Ozeijk5SnZ+p/2
	TIWPUyoon9r3B5c89OlmxcwcZ1hiHedc=
X-Gm-Gg: AYBFou1di8u5Bcl7rIbnz0xg5kkClD+3ud5vO+7WbmrxHVdxOqhRPPTCd7JEqP43H2l
	OU84YSrBCagROi/CRYVOGzDEFWB1f/lO70MCQPCzv94wHKyCM4Ul1FAJHAU3CpUSZ6/Hpvc9gI8
	CFwSMuloBgEwdwsQv/MDKenLcS+rr3ZTQe/PrvwJrGxX6s+P095ZbO8BKi3RhbPk/XV5uH+WSd7
	9f4MZA+OC4Lz42boBDGMXKgEQ7bYLMOi+7wMcEhFOT84FBsCktLshmQ41Q5DF7ir7B3DYylnRJf
	agQ/8MMHd0LgLPa3dsobjniYvj7QUDSNW8Wln/0n6IaSZ6S3lRS5k/fYKrDOKw+Y0Gslnbwegqw
	SW/PViOkFk/EgATvaql+gy3Z7YaNYZSFClsG2Izrxc6udtpW0ecLJLdCwCk7L5pDlAraX6bpyTm
	dLtRTW0qhBTJbyleq1pp7hr90vYprZuMoX4DcWGlg9qaZuHciDPuI=
X-Received: by 2002:a05:6512:a96:b0:5bf:c9c7:eae0 with SMTP id
 2adb3069b0e04-5bfd9564f18mr1864662e87.4.1793500706846; Sat, 31 Oct 2026
 19:38:26 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-xsk-zc-rx-double-free-v2-1-cf01d4a9f3f7@vecima.com>
In-Reply-To: <20261030-xsk-zc-rx-double-free-v2-1-cf01d4a9f3f7@vecima.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 1 Nov 2026 10:37:49 +0800
X-Gm-Features: AclHuK-w2Xb5r-XGPIWLPa0peqPZ35FQ_khofZikgGeMh4wAdy4AzH-tS50Oovk
Message-ID: <CAL+tcoB=SG5WT0VrkhuPp_5VYtFHWDFhWMCNM421WzoU4z9=9A@mail.gmail.com>
Subject: Re: [PATCH bpf v2] xsk: Do not free ZC Rx buffer when the Rx ring is full
To: marcin.knap@vecima.com
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, 
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, jtollet@cisco.com, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Sunil Goutham <sgoutham@marvell.com>, Geetha sowjanya <gakula@marvell.com>, 
	Ratheesh Kannoth <rkannoth@marvell.com>, Subbaraya Sundeep <sbhatta@marvell.com>, 
	Bharat Bhushan <bbhushan2@marvell.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 4:16=E2=80=AFPM Marcin Knap via B4 Relay
<devnull+marcin.knap.vecima.com@kernel.org> wrote:
>
> From: Marcin Knap <marcin.knap@vecima.com>
>
> When an XDP program redirects a zero-copy buffer to an XSK and the
> socket's Rx ring is full, xsk_rcv_zc() frees the buffer and returns
> -ENOBUFS to xdp_do_redirect().
>
> A failed xdp_do_redirect() leaves the buffer owned by the caller, and
> most drivers rely on that: mlx5e treats the failure as XDP_DROP and
> releases the buffer when the Rx WQE is refilled, while i40e, ice,
> ixgbe, igb, igc, stmmac, idpf and others free it themselves. The
> buffer is therefore freed twice. It gets reused for another Rx
> descriptor, the second free puts an in-use buffer back on the pool
> free list, and the same UMEM frame is later handed to user space
> twice. ixgbe and igb keep the buffer in the ring on their need_wakeup
> -ENOBUFS (XDP_EXIT) path and run it through XDP again on the next poll,
> after the core has freed it.
>
> Leave the buffer with the caller on both the single-buffer and the
> multi-buffer -ENOBUFS paths, as xsk_rcv() and xsk_rcv_check() already
> do. A few drivers relied on the core freeing the buffer, so make them
> free it:
>
> - i40e and ice consume the descriptor on XDP_EXIT without freeing it.
> - gve DQO counts the redirect error without freeing the buffer.
> - octeontx2 returns false on a failed redirect, so the caller goes on
>   to build an skb from the already freed buffer. Free the buffer and
>   report it as consumed instead.
>
> Seen on Mellanox ConnectX-6 DX MT2892 (FW 22.47.1026) with AF_XDP
> zero-copy on 7.3.0-rc6 when the user-space consumer could not keep up
> with the Rx ring. With this change no duplicate frames were seen with
> striding RQ on or off.
>
> Fixes: 269009893146 ("xsk: recycle buffer in case Rx queue was full")
> Signed-off-by: Marcin Knap <marcin.knap@vecima.com>

Agreed with Bjorn the contract can be documented as a follow-up patch.

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

Thanks,
Jason
