Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644AA568FA8
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 17:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791999684; cv=pass; b=ROl2gxcCMVRZuguTaeqhPqclJ5x3mhQLhg8dBwHywFVJqoP0m5ye+OWDFgZNXriVmT9IguD0L/Xr5A9PKptf2Rp7nrolg+PngRAJkUdcCncXAbx5KUy8hU9e75tdSaZcGsqQNhrnDWtwuwV6CMmik93vHfeIoXatZIXSTwsdBPA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791999684; c=relaxed/simple;
	bh=f0SLdWL9E138QUb2D0PGhvwvPjEMduNm3zGCMH/mn/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=po39vdFke23yLq1j4JPBaG64AgpHvbQ+yzluperNxWUYgLRlHYKB32+tHBtYEzKPXLRpXVxn6PkfguH3DRUsokSxcX+VYcYop6pUOkPl2reLd66SIcKRxVR/38P4iFuf26yoSAbnCB/PMspMsv6E5fN1AAhXZ9odq33JyUjFTzg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pVLGjhlD; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pVLGjhlD"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so46841a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 10:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791999675; cv=none;
        d=google.com; s=arc-20260327;
        b=e+HFuwxjKTvTAR4PSa7wcn4WNA7k95WChkjTKELxYdM3mx5c0iU80teDRCLSSYfuxo
         2bX3io1FMIOY1ATk7+dZjeq1ibTKxyRbYSWDIIqJoRENGWhPZjTNpaDFZZhaXhaWfXB/
         2Jt7GTmIJaHqaqXZGPS6w/eepkvV5MW7HLDRorQH2LUA8vZJl5NP87gAuk8hlQ8H0w94
         6Xb7SAbBznMzTC2MIHWaGgmzHegGXZdTHdwwdZyv9Qe7+mXk+EoTNCz/YeCfdN/GbseZ
         EHDLqy+W+EgHJJ1IFbKSh/D3EaXm04cTUmAIAjZvb/1/fNxuLlkiLfQSx0PsrXrJTgXQ
         2xSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+j5UmZVaWpFsAwC0ISTNxThhbI3Vq0eD5Q4MhuTUhG0=;
        fh=/xqMa9uLlUYi/frnNqt1AciXHZ0Rmb0E1hlsLfzek+Q=;
        b=ayXpQW/UbjCqHmOJOD6j7quL7Ah1nRPhptM3D2gcd5jp8Qvsf9+RPnc5iktlMy1aUu
         XeTXKMjORwhtUIZyYst4WGjQ/OdhxhxEzR3cdGFvCLc2xZKafYnDGCF/cGTvKAM4kjM7
         TbQHwA94kZoVnLPa1gypwIrrJEcatfcBssRaEeDpyAHyP41dM9YGTluK/TJffgrwWF0z
         SP/IDd/BbCO1KA9NewYWu2YToNY2E+z6SgYajaxbihPt0fmFehoL5wgmLFc+pH36wv5W
         RFvUuNbOA1xAUhjcmtGboTxarGLrhFpm1OHfCHus+acZHEu9WuGoo9jZorWiD249qZSL
         qRCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791999675; x=1792604475; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+j5UmZVaWpFsAwC0ISTNxThhbI3Vq0eD5Q4MhuTUhG0=;
        b=pVLGjhlD/ng4/MZG/9X3p/9SFV0WgyW+x59aATXz4CwBXINi3ynT4Vb8v5Ae7JuN0W
         75HkF64U6eST8ymsODdXzHCJ2xslcUlpDGCkgPteZx6PD/qva7n95x4PmoOAyTIevBqJ
         qyogjQfPdlIMojhE3KqszoC2DIARgRwkBTUetC2SbTMI/x58T7ofVcXyXzMSCmmwV7sZ
         xRMNEDoKaaKso+mn/K4913D1fMFFKCkhuMQrH+dWz93kJJlyzt9V/Y7x5p+vsTQ9st2I
         EJ/8K3IL3FXO1K37gUpnLcHvczv5xpEkR47Blsi1PsN+mMAWYFDqqG48tbKAhb8OGWoZ
         6/QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791999675; x=1792604475;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+j5UmZVaWpFsAwC0ISTNxThhbI3Vq0eD5Q4MhuTUhG0=;
        b=s94qjkbCOVBLNkzHzxDG0RJAVMmddZzS/jye58bugukPDN2CPQq/3ALTrOiIQUz9K7
         DWwFesKTX9/wKSiWduF3ImnEKeiaVZnaZ7rTSpUr+nELbMmnC7CnixTyT4i62aENBA8Q
         pj+4Vghw7mPKECXacGxghjwaEAzjtpS6XYRrhWf25xns7e6MlbRXm4fImrtFOG+GLeW5
         t74E4otih12sVvTZlLGci4XaaANKewk0MEkVEYUclPuFMlrEiXbRG2BoxIxbFZV0reV2
         iA6D7iN18bGbgGuneDwetoUR5W+/paweJHM/k4dqGiMOkk0kTvsmlJ0gal97zkvXxx7l
         h8JA==
X-Forwarded-Encrypted: i=1; AKwUvBz9+hj+d3evaicV9LXKPDpbS+nwn+BfIFgM995bBMIy2Oq3oLzJOB4rmxZtShK6HT2NnpSW0bUKUWDTt4o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSDjxZCkSlhTJtmviwmBWCDvMcMbzZAKCklDLhHcT7azUFjFLF
	ztgQdztmVrDN9bY1nXRVfzoHaTzTTUcYOc60X0pwUw4+dos9PeYMa4yOCoV4SNqDvnsc6SXiRJW
	bNd2NUFHLrtK6wCBeLG/nrPOBgoBtS69A2EPchYHu
X-Gm-Gg: AYBFou1cEscXEFT7IgTHjzJhcLaM8K4ZmptG/bhUaNdwadd8UgKTFFfa3A+ph6xxyrR
	JwXMnnGECiPtsYRxtelr5LBB80rFab9dXaCTDa6pyKJf3jVAEEmmclPPVzNLjg5DVnDzaxuLIAc
	zvoNdxzvKwtHa/4dHFQluaTD+nSAmSYNpwaudGVVwVyu0UZ+l3CNeiCHTL/PMg3b3Djr74HynQT
	McUyHUfe0EWiTaSqJ7k9BFxqkZ/IbT0aeKxL9Hni04dpwUTrDhvwy3i4XHDYj837D3qKp+0UTHc
	z6fkwDA6Xn1TedJGJR/hrya4a1g1RgAk7sjDcxkmlbsIDWMIqPO54Q==
X-Received: by 2002:a05:6402:20cc:10b0:6af:97a9:224a with SMTP id
 4fb4d7f45d1cf-6b2096e7803mr65994a12.2.1791999674865; Wed, 14 Oct 2026
 10:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012174300.2338784-1-almasrymina@google.com>
 <20261012174300.2338784-2-almasrymina@google.com> <as-uBvRisS7HxLHJ@devvm7509.cco0.facebook.com>
In-Reply-To: <as-uBvRisS7HxLHJ@devvm7509.cco0.facebook.com>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 14 Oct 2026 10:41:03 -0700
X-Gm-Features: AclHuK8u69N7ew0pAEQZHwLPBLn5xdE_tbIzLnNp8gBabvanxWdbaZUh8Vuvjwc
Message-ID: <CAHS8izM9E3YTi19LdNSKY+FWyLtesTAjEmCRHxhgiu=y3t7jaQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/4] net: devmem: unmap dma_buf synchronously on
 queue uninstall
To: Stanislav Fomichev <sdf.kernel@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, David Wei <dw@davidwei.uk>, 
	Pavel Begunkov <asml.silence@gmail.com>, Taehee Yoo <ap420073@gmail.com>, 
	Stanislav Fomichev <sdf@fomichev.me>, Paolo Abeni <pabeni@redhat.com>, Kaiyuan Zhang <kaiyuanz@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Nikolay Aleksandrov <razor@blackwall.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Tariq Toukan <tariqt@nvidia.com>, Kaifeng Wang <kaifengw@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 14, 2026 at 9:34=E2=80=AFAM Stanislav Fomichev <sdf.kernel@gmai=
l.com> wrote:
>
> On 10/12, Mina Almasry wrote:
> > When a bound net_device is unregistered while userspace still holds a
> > netlink or TCP socket reference on a devmem binding,
> > mp_dmabuf_devmem_uninstall() clears binding->dev to NULL so
> > netdev_nl_sock_priv_destroy() will not touch the unregistered
> > net_device, but leaves the dma_buf attachment mapped until
> > __net_devmem_dmabuf_binding_free() runs later on socket close.
> >
> > Because dma_buf_attach() does not take a reference on dma_dev, device
> > removal frees dma_dev while the attachment is still mapped. Closing the
> > netlink socket afterwards triggers a slab use-after-free in
> > dma_unmap_sg_attrs():
> >
> >   BUG: KASAN: slab-use-after-free in dma_unmap_sg_attrs+0x76/0x2b0
> >   Read of size 8 at addr ffff88810fae64b0 by task kworker/3:1/53
> >   Workqueue: events __net_devmem_dmabuf_binding_free
> >   Call Trace:
> >    dma_unmap_sg_attrs+0x76/0x2b0
> >    unmap_udmabuf+0x8e/0x100
> >    dma_buf_unmap_attachment+0x145/0x330
> >    dma_buf_unmap_attachment_unlocked+0x96/0x130
> >    __net_devmem_dmabuf_binding_free+0x156/0x2e0
> >   Freed by task 9:
> >    kfree+0x1b8/0x550
> >    nsim_bus_dev_release+0xe/0x60
> >    device_release+0xcf/0x250
> >
> > Add net_devmem_dmabuf_binding_unmap() serialized under binding->lock
> > and null out binding->sgt and binding->attachment after unmapping so
> > unmapping is idempotent across queue uninstall and deferred binding
> > destruction. Call it synchronously when the last bound RX queue is
> > uninstalled in mp_dmabuf_devmem_uninstall(), except when a leased
> > queue is unleased: the physical device is still registered and, if
> > restarting its queue failed, may still be using the binding.
> >
> > The same use-after-free happens when the netlink socket is closed
> > before the device is removed but RX tokens or the pending release work
> > keep the binding alive. Such bindings are no longer installed on any
> > queue and were already erased from net_devmem_dmabuf_bindings. Keep
> > bindings in net_devmem_dmabuf_bindings until they are freed, hide
> > unbound ones from TX lookups with an xarray mark, and on
> > NETDEV_UNREGISTER clear binding->dev of unbound RX bindings for the
> > device and unmap them, unless the device is a virtual device leasing
>
> [..]
>
> > queues, for the same reason as above. net_devmem_lock serializes that
> > walk with the final free.
>
> Can you explain net_devmem_lock a bit more? In
> net_devmem_dev_unregister, why can you not net_devmem_lookup_dmabuf and
> then rely on the binding->lock? The rest looks good, but the
> new lock seems a bit excessive?

That problem that my feeble human brain can barely understand is that,
in order to revoke bindings when devices go away, we need to hold the
device somewhere. I decided the a good design would be to keep them in
the xarray but mark them as unalive; that seems nice.

Now xa_erase the binding got moved from unbind time to free time,
which makes sense, but that generates this pathological race, where
net_devmem_lookup_dmabuf for unregister can actually find a binding
for which the last ref has been dropped, but _binding_free() was not
called yet. Fun. I tried to work with the LLM to find another simpler
approach that gets around that but no luck, the overlords find a race
with every suggestion; this seems like the simplest thing to do,
although it is depressing to add yet another lock.

I uploaded v3 btw to address the 1 non-lease devices issue. Seems
we've crossed paths again, let me know what you think and I can spin
V4.

--=20
Thanks,
Mina
