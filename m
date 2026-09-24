Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B98B3B6356
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.205
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243819; cv=pass; b=YV32ih1jvQESRTMGS2K777pI13GpOKiwm8mo/02VoJ7KAu2f/OSonf8bB8OuwzA0g6LLYoU1gMYf/Uoi85q5nngtUxdIpE1STUx6PKOAEPGW7vWsUPDFDX5rCzfqNRa0wsxwqpVdDEAw9ybtzDy0ztlIeWwL+uD57obvgTcdhcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243819; c=relaxed/simple;
	bh=P1ndA+eBVn+zYbAgTqPlA5s6bd2yOGM1nW0tBCwcEQA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q6s8vm7oLVWH5789l+g9YREmvzYbYxgZNKba+8Vj1iuhjCPReQQeoVc6L3JMFR1j/A1Aq+vqKqEqHHpC/rE8XtUcnpjYqmA0O1ioL/EYHEiLl/x2V7JoCq2iqazsm+up8r9XDXcIv9Bg1brsWaI/WZnqAAaVKJOqCJGRng/wJP0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PJVbFSWT; arc=pass smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PJVbFSWT"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-52fb7692a57so23806421cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:56:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790243801; cv=none;
        d=google.com; s=arc-20260327;
        b=TRdcq6tqf4G5tiZLdupzsOP4RtHzPitJgfKbyF4uKGPeEmkv6Rmjnr2LxC+Wj6zggu
         ZXyMJfp1lZphGujtWlpw9LGv619RU3VdPur1ELwKxZyNTI5n81teCgWTevMi3LvvmJbg
         OFENrBQdX8G41VOiHo+GF0xJgttEt8zadt0Jd0ZoDhMnm+toQXkUD7XhDc1OSZP7yDHt
         9Jck+pmLe2l8JIeijvlMgMyZFEcmq65sepEVCEn2ueg6XeBJpNRX2TTmuTd8tWbVS37T
         B1CiiujQpI3SiM7TunEW9zEk6bReFadIbKNtRHFtOACXcAVrusfxmwo2tFBFhrXFZZBc
         eQKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZIYNgjeCL0OsYc0prVytzssq1ZX8j8EgYAM9VB1jIEI=;
        fh=G0oDFLn5Ip/UIefo9hBWIuqgWFZE8JcERvh/Y5TxI7A=;
        b=Va353Jds/Y3uKJGNJL7VxfpKaYkDZOXxCVct2G4t6DGgXSFmb5xALEea81HJYjPEuR
         f1ShGPC03HMjEI1Y3odyDBbRMHSLNOMAPcGaeg8ftAfF4RoXM06d4/xN8SySvuJxUHdJ
         5kUmvF17/oyHzFmw9lMCqnm39G22VHt692SAKxbw7a8Kd+XkRXAHGtYEEcGRBVFew2NF
         CDRO7TRVBn0ky7baa7u8OyvBjuudFllC9TbwTnxhqICmDSpEFHPz9Ou+EepSeYuWfzuR
         FwMH6TDMu4oS17bQWJoFYdUYW8lR10/iFOaHw0ZQa005EzbyUcUl1tojflQ4FgOSF4pf
         jg1w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790243801; x=1790848601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZIYNgjeCL0OsYc0prVytzssq1ZX8j8EgYAM9VB1jIEI=;
        b=PJVbFSWT1X8mh3hx5PnKzYW0FA/5H4rTYypMG8e8iiFO5+aj/nMoI9Gyr3Iu0eiS0a
         ZaaWilagYC66hqDVHeZrt/JkpRuoFook6AwqndEcd9wc9iKuSc/qkSEA4OBN1vUN4A6E
         SPbEJivIzQWCLAgHdwfpXWFin95GtMqkzsmw7Y/lPabc1SvRNmaAs6/UEfvMWBAzsVKT
         /YRgxIyEqzYo9ZzcInvBJwndjBRVcoeIYlqOm12/vGG55nYbJC+qBj2inSaSB4zHV4jY
         EzcG4Fv3KSfA1uX9XE3lOwQwhVmJjQeKaDTbbvgnl/i5Lr52Hm272rIZRl00vaFuE1/V
         sgGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243801; x=1790848601;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIYNgjeCL0OsYc0prVytzssq1ZX8j8EgYAM9VB1jIEI=;
        b=1JNv3oWgBJoEwbzHvACdrC4aP1iO/IdoYbVP/NMoAzJKTJmJLvmcQk3e6hOXAVbfYH
         SIUgTUxhpcnAvs5p7/T28Z9jzQB4cxeMwBJroBlqU89dQB+0gd0XO2wbtvG4sTBZGcV3
         PQ07T7T7kNi/L82Ru5KoOp+K49y120reBmUUav+ltcWBnCmK53W3H/DctsMWELOe3hTh
         pvq5i4x1CHVw0nNvfOcplDabkrkrZ9Hi9CdvzYAi+f0tQMoDz0biRRKgZTgvgK8TaN2m
         m8ax/455d8vq2J+32BbUmM+X1E/2T/Pqh5fgOPVk4Q5+8WAITfoDcXZtwH242ZFfUvQw
         nywQ==
X-Forwarded-Encrypted: i=1; AKwUvBzae9IrQQ0ErpnTxjCx4k677EZhj1koaXJYCLZ1R/JYQM84FWmjLqHRduEzp0UIYf8fIJrvwMXfDvM4gEc=@vger.kernel.org
X-Gm-Message-State: AFuF++nvo9apv/en9bPBD65ATO5Rw9PMp0HRzzxATExYfSEGC/hN90gf
	xBuIO05fK+i/ItHxJGzrdUB7eRx+DF3RvHSj+sjswb7MNuzOVtB2Lqey5G88b3Oi8EKaS0SyWj0
	TxhS5rYFsAO+pb9eFD4R6/PKMp2w8JnQ=
X-Gm-Gg: AYBFou1lnzCf0gKBnTYx/EAvVqqZU0NcClB5cwTulO3al03QpnSffejpAP47lnFzaxB
	RUvDBHgEw7At8fMqYMBzXU7hfjZAn53y+LYQFGsaXCE8jH7eOG+kVWOKF3PX+DfNAe81bNj5pZb
	PiN94bkGdFabRomz7c4wF5TXLCS498cdEbSxCwlskDzYQn2QpKi7nX/diZf0JdwLqU+3M1RSHt5
	Mfsa27GRbsvRhX+56uER9mUU1GiWcH6pKPFZRecnlL3iWvgV9BRjcQFpzMbN/NAABnViKca7cwk
	m19OZ/Jas4V/WuGSGKy4IK3JBCPcs9G/DGGj1k+7ijhtooUWjl69J2lv
X-Received: by 2002:a05:622a:410:b0:532:d838:12dc with SMTP id
 d75a77b69052e-532fe9eed7fmr14187851cf.3.1790243800860; Thu, 24 Sep 2026
 02:56:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924095152.3069-1-nsvatoslav515@gmail.com>
In-Reply-To: <20260924095152.3069-1-nsvatoslav515@gmail.com>
From: =?UTF-8?B?0KHQstGP0YLQvtGB0LvQsNCyINCd0ZbQutC+0LvQtdC90LrQvg==?= <nsvatoslav515@gmail.com>
Date: Thu, 24 Sep 2026 12:56:28 +0300
X-Gm-Features: AclHuK83QQU4UjKE_sfTN9cHFKc0YIJOfadhF_smKbWELBPGpi5wSU3S_A9rXeo
Message-ID: <CAJ_tAk7VFvsRk-suqg7-JJHcm=N1kEt9-qgg6sD+u5oAfyB03Q@mail.gmail.com>
Subject: Re: [PATCH net v3] net: e1000: fix warning in iounmap on probe failure
To: anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please drop this version. I accidentally sent this without staging my
local changes.
Sending v4 shortly with the actual code.


=D1=87=D1=82, 24 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 12:52 Svya=
toslav Nikolenko <nsvatoslav515@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> When e1000_probe() fails, the shared error handling ladder attempts to
> iounmap() the hw->ce4100_gbe_mdio_base_virt pointer. If the hardware is
> not a CE4100, this pointer remains uninitialized (NULL). On architectures
> like x86, passing a NULL pointer to iounmap() triggers a WARN_ON_ONCE,
> which is fatal under panic_on_warn.
>
> Fix this by conditionally unmapping the CE4100 MDIO base only if the
> mac_type is e1000_ce4100, matching the exact logic used in e1000_remove()=
.
> The hw->hw_addr iounmap() remains unconditional since it is guaranteed to
> be valid for all error paths reaching the err_sw_init label.
>
> Reported-by: syzbot+ca1ef9e2e234b8d3599b@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3Dca1ef9e2e234b8d3599b
> Fixes: 13acde8fffc0af ("e1000: Fix the CE4100 bus type for the MDIO/PHY r=
egisters")
> Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
> Cc: stable@vger.kernel.org
> Signed-off-by: Svyatoslav Nikolenko <nsvatoslav515@gmail.com>
> ---
> v3:
>   - Switched from pointer null-checks to checking hw->mac_type =3D=3D e10=
00_ce4100
>   - Removed redundant check for hw->hw_addr since it cannot be NULL here
>   - Added missing Cc: stable tag and Closes tag
> v2:
>   - Expanded commit message to answer reviewer questions (reproduction de=
tails)
>   - Added appropriate Fixes tags
>   - Added Reviewed-by tag from Aleksandr Loktionov
>
>  drivers/net/ethernet/intel/e1000/e1000_main.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/ethernet/intel/e1000/e1000_main.c b/drivers/net/=
ethernet/intel/e1000/e1000_main.c
> index d7f5c6f16142..156903089fa6 100644
> --- a/drivers/net/ethernet/intel/e1000/e1000_main.c
> +++ b/drivers/net/ethernet/intel/e1000/e1000_main.c
> @@ -1227,8 +1227,10 @@ static int e1000_probe(struct pci_dev *pdev, const=
 struct pci_device_id *ent)
>         kfree(adapter->rx_ring);
>  err_dma:
>  err_sw_init:
> -       iounmap(hw->ce4100_gbe_mdio_base_virt);
> -       iounmap(hw->hw_addr);
> +       if (hw->ce4100_gbe_mdio_base_virt)
> +               iounmap(hw->ce4100_gbe_mdio_base_virt);
> +       if (hw->hw_addr)
> +               iounmap(hw->hw_addr);
>  err_ioremap:
>         disable_dev =3D !test_and_set_bit(__E1000_DISABLED, &adapter->fla=
gs);
>         free_netdev(netdev);
> --
> 2.47.3
>
