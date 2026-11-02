Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793657335;
	b=BBOzEeSgnMlGlXD/PLCqTeUBiVla05jdJV4vuq49NzyLvdxSjAeLHlrRztBEsd6Efwj4
	 ALs9t3pxVJXFpELibswsSflcnCL9h06wXfZuGsH7hLqNpYqf0MtaYBrBCtbRqrQxKoKrh
	 kAcmGMQlfESsSZG3TL+My6z89Trlo98xGg1H0RGwQTShuVT3gZrHuOTlyFXPiYgYgn72e
	 FxJ9wr17sjd5+qZlOBtoWnQfjNEclzyic+B0KyL2t+xcA6SWnqXN9jzgamOTkfOAwajyj
	 fGZG76ihWMIrh0d3vV4dcfa+R9Ax8Iuh52+UGAjy39+KdON9i/OIa+4FxlzeWagixMg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657335;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
	b=uQm4ww053DkAlO1XwvwLnsra78c8p3yRYwJTgqVher34i8huUkWNOAhB27mKcLNkvIIz
	 ZUQMmoj9MpWaE6JfHE93RguHwrPLsVWL+G8VAxzJhrsuJF4vq13sO9urS+4RS+dh4C1Qx
	 Cu4vLaKRAPedpahV7tO5zivrUc4nnIF8QS7clmRvoJ96tkXiKHfCAggBvT9+ClLwpRPNB
	 TNFlORRJ7xRlnPeV8rmzCWXtsfKKzCLF2JZYifRnmlfFI75YPopfF6F+oSRYqTwS9FuSe
	 Wax734eH1X3irrrHcAogcUta8yR7JkL0drL+tMbxcyoK7pxDZ2p7W67lTf/DqwR9nHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQVmmG6P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E967606A338
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 22:08:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E967606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NQVmmG6P
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6ae14cdc63aso787a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:08:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793657332; cv=none;
        d=google.com; s=arc-20260327;
        b=eTcjrc9xiP/c5NNwzJOs7nbegGjtjfwJh03Ac0SxvtfDVs/iHXqzQO9uTz6jRmB6hj
         kDyfT0iXYe7FpA2jkI7jt+oo372eEOwCIejIWF1GfF5kQmpy/z3QM3oSDVzLDGBZ9bKb
         14Er1eXAhpvdWaWMdNQH14WwSDzqqRl46l2hU49L08uqJeGRUe/ik3eo+Ei20yLlPnxj
         S31p1vS93swYMkYjqbwlSenX9HaD+YipKfuv1bzvfoym5NeoD6xML0b5pAmhlhH1q88g
         mXYhyY3jEbwAcjuYXCQfPWJlt65LmEco6giTzLQb4gNutFb3zlpWWoGIOmdimz5iodtg
         1zYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        fh=WK0B/Yn9hqWSRGZNC3iwKhi7DX5UmxM2IGY75wh5CcE=;
        b=enZ4+c+IL5S5/i1yOWpxOJoS8+sbgn+CPAyeNExaZ+eVxhV+Xq9GzZ0BJ/7AD/fr6r
         THiDZUmfjvufP752jihkdymv98fMGaaYjLXgYnr0cy1wFj4eo4C22hmhtVrFMzR6Au0W
         clYZGBuGCYC1aj1rFq1vdaAKn/rwp58Sbc3FFO930QO0yr8lCVxYQbCLfatTaGlRBYPp
         Yzgoob3Si+p8OjOTbhomlUbTA0cutpaEri1HHd90GTuy4g0cjrRAUatfivdfQ9FldrMY
         aw0FSqIAndhlRY4K00R6z3DyawowQvxJLp2YPSZrot8WHrArB48eMgcLnsSF/uqAW8fg
         YmjQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793657332; x=1794262132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        b=NQVmmG6PVNjIV2neyCA9M2St1Rsk5SaTQnqw5Z6BjHpTxwxLNWVY8mIkPbVqVv43Ez
         g1kwACtxFVkWQNTvKZae+D3NXZb1mGV/FYrWMJmL1ujN5VbI0phU2UUIvZ1RySl3e3Zo
         pSWAqChgMM4wStuo1gtjzteMY/kaOtiT6M570xyqph8/dEsROs5zKnwpOJAET9qepMSV
         vCdB69pn/VvgSV+86EtlwKhYvkM3M3xgeJW6A9qGry6TY6rHG0YTPrb0+QZyIpwScHCC
         ZGyoBcYE1XaKnaLT2NSoMPElQaaW3yDHAgebA3x6qLhgrJbVVPEyWmoctHmuVm5Jwrjd
         9rQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657332; x=1794262132;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=04iaPr/Q4xOZpTpewylydaBAPbXSsxNLl37nHemVSI4=;
        b=wXWJ4/EMl6/GXa4+gOhs3FJr7t4YfM/C6tNDLF/JjHzE9CXvVqg5YCYVOGN56cc9kT
         BmAhDuEVNKWhFcRVJem1LCUa389eQvujasJA52QZOxT2deks57y6vJh0JPpbsSnOaZFm
         RyJOxFItY4Bh/QaNIK7TVoua5Nfqusnkiyy/KLGJlAuVrOxLShpKKiVT2MPFsUk3ElqM
         rv2OjgIpIjVmnbo73QS9Njtgpt4XcsIMj8UtgHG4MbiHvKQQOk3n9njNwmt5ATIM1Q34
         QoJOea0+Zmq1Cgx0YhXEHgYbiMjm9CcKjmEg+d8FwsYTLVJVL+wqolM4eSjHNnG2zkC7
         0tIA==
X-Forwarded-Encrypted: i=1; AKwUvBxJIeFGJ0TvIUwa7LabP7Fb6erJho8k4ojc71EBk3EdnyEIM7z6NQepfd449tESViGH7qw9iUY5TQO50+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RNZFIcwDdMeV9toOZIZjmu52LuF1Tbu7RICW9AY4M541Bi2p+
	zjJ6ltqFiJrR1jYjYhAyhxF/OoADaLS2J82ESqImdyqbbWHjKqlWVaPv0i/1+XZ/LF9hN7YY5zv
	rxGNHRN6todXd2ZDS7T+xuam4ePZqIwORu5+cENMH
X-Gm-Gg: AYBFou1lVvoRM22yrWp0YkWNVRa47pCXus4oCdM0UBfe0Lc1OrjZksWYT2GXp/Us/RE
	pnpUaG1pzXI7oWBF+lmKt+qcscjdnP+M4coyJr6Xnr4Eh6/I4cfX4ZuxAdxt0A9WAqJG6XcJCUL
	7WzxpZsOHjg91QIdSQ8nuCBOt+AE6hR7wgAkFV5e8aZVPXYFU7Sdik+TSUf1vtuHSUgqIo7uuef
	jUSY0WJFutqq9cm/l8XnTgKOp/5ccibX6qcTO4LbMHsuEYTM/0ZbaDQhx/v2ASeTzDkQP7rmIwz
	yaV0s4UOlTG2Gf/GOS0wlAOtIv58o4S3m1CvsmLLXWP3s1iVk5CRhrUyAM2Bnx1zPyA6R24C8SF
	UvAYKHam2gJ3d66CDGg9h0nWDeEkKZL8TG183bg6f5+pIGZ6ymaqBkwI4FIdggzAqVHY=
X-Received: by 2002:a05:6402:438d:b0:6b3:f12d:7405 with SMTP id
 4fb4d7f45d1cf-6b53e778d41mr6126a12.14.1793657332128; Mon, 02 Nov 2026
 14:08:52 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030083539.777877-2-almasrymina@google.com>
 <179357408146.3131.2882435952119280563@kernel.org> <CAHS8izMt+5HBjkOOsb-FrwKoXxEBuDn=gf5p+64akYS=SAoQrQ@mail.gmail.com>
 <9afff44d-f8eb-4549-8aae-f99a53339319@redhat.com> <20261102185856.1824792-1-almasrymina@google.com>
 <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
In-Reply-To: <f4f0fbd6-63e4-42d3-87bf-9f888a8de1a8@redhat.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 2 Nov 2026 14:08:40 -0800
X-Gm-Features: AclHuK_l2m6u_KEy2pbXoZVvzOwIMj8tI1lJiwLeWg-R9MKJCqxW8rPbMreP4XU
Message-ID: <CAHS8izNQjF6nzPym-kXO2Nr6jv5oKsnFGCNYWZH_zBTGoT98ew@mail.gmail.com>
Subject: Re: [PATCH net v5 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev-bot+sashiko@kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, sdf@fomichev.me, 
	kaiyuanz@google.com, kuba@kernel.org, bobbyeshleman@meta.com, 
	asml.silence@gmail.com, dw@davidwei.uk, ap420073@gmail.com, 
	davem@davemloft.net, edumazet@kernel.org, horms@kernel.org, shuah@kernel.org, 
	sumit.semwal@linaro.org, christian.koenig@amd.com, phasta@kernel.org, 
	andrew+netdev@lunn.ch, sdf.kernel@gmail.com, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, daniel@iogearbox.net, razor@blackwall.org, 
	tariqt@nvidia.com, kaifengw@google.com, dtatulea@nvidia.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 2, 2026 at 2:01=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> wrot=
e:
>
> On 11/2/26 19:58, Mina Almasry wrote:
> > On Mon, Nov 2, 2026 at 7:29 AM Paolo Abeni <pabeni@redhat.com> wrote:
> >> On 11/2/26 00:16, Mina Almasry wrote:
> >>> On Sun, Nov 1, 2026 at 3:01 PM <netdev-bot+sashiko@kernel.org> wrote:
> >>>>
> >>>> - [High] The dma_dev use-after-free this patch says it fixes can sti=
ll
> >>>>     happen for RX bindings made on a virtual device that leases queu=
es,...
> >>>>
> >>>
> >>> I know about the issues with leased devices. That needs a bit of a
> >>> rework, which I have done locally, and would like to send out as a
> >>> follow up fix.
> >> Will such follow-up rework the code touched by  current patch/series?
> >> how much? I'm under the impression that at least the fix for the issue
> >> reported here would be quite overlapping.
> >>
> >> /P
> >
> > I pushed the follow-up branch on top of v5 here so you can see the exac=
t diff:
> > https://github.com/mina/linux/compare/devmem-teardown-v4...devmem-lease=
-bind-map-dev
> > (commits: https://github.com/mina/linux/commits/devmem-lease-bind-map-d=
ev)
> >
> > There is some overlap (~55 lines of v5 touched across a 6-patch +262/-9=
9
> > follow-up): it renames binding->dev/vdev to binding->map_dev/bind_dev, =
passes
> > the net_device explicitly to net_devmem_lock_dev(), factors out
> > net_devmem_close_rxqs(), and replaces the !rxq->lease / !netif_is_queue=
_leasee()
> > skips in net_devmem_dev_unregister() and mp_dmabuf_devmem_uninstall().
> >
> > I kept it separate only to keep this net fix smaller and easier to revi=
ew,
> > since the lease issue is pre-existing. Happy to either land v5 first an=
d send
> > those 6 patches right after, or fold them into a v6 if you prefer avoid=
ing the
> > churn.
> I hoped for something smaller :)
>
> I definitely would not fold the 2 series.
>
> I'm wondering if this could be considered net-next material? pointing to
> net-next will offer better guarantees for all the work to land in the sam=
e
> release (no need to repost in such a case, I can apply this one to net-ne=
xt
> directly).
>

I'm more than happy with net-next. Honestly so many AI-foudn fixes
requiring so many refactors that net-next makes sense most of the time
now, for me at least. Thank you Paolo!

--=20
Thanks,
Mina
