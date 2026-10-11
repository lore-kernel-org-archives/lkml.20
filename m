Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BABBD23E334
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 16:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791735932; cv=pass; b=j0/iE+ogyxHxtIH5nrB1jxLe5Bg8qa6V9LoyjEHsFIRIbnSB5cHxDtdLpVHaW0zSoLGa2CUUQOIAd0cj/GQ8PpQDJvAiLvqoQxIZ0cKnhrpUFngm+uNzoIDM+zL9Qp6eZwU3krLtxGBku96XreKkXZAevO6bTvA4J0SE8Y0r2lE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791735932; c=relaxed/simple;
	bh=ba9QqDkcrd3Mro0zu2+iADvo+PIFbtPGZiWLHSGlxdw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t0T1mY5ZjK2qhjywaOYD/9pkOojJTs81It5SBH7L+/T+zNm6Uo87EEEmfuN8guK5foEQSxvkc+NwEDEj9hitXio49uAokLvinZhZtxLxJSbC01Csp6IB0USwo24JGoxvzbuyQ8NOWfea2wUOzUrWZVa0KE0ouMQv7efzpv/NGug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T20g+rKu; arc=pass smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T20g+rKu"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-150ef97e790so3993c88.1
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 09:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791735930; cv=none;
        d=google.com; s=arc-20260327;
        b=j9aUBdgCml+5Ejs0ZgXnLWRd/zJJHwFa+zSBoi20kPTmj4cxLSGgPidtVTjIwXz5JG
         nqibVga+Dqs6ppULIqtMUsJHoVPhSxaUim8e4wkeMcBOmOaceFJZBKmKsTG8XrmShkry
         PkrKJ4AC2Q5jvMBTWRxPRYURibQ9K5o723b9kKbVJtmrPJGgmWu2XCJbIhuzx+n3NXyX
         7tpQCtbdUbIyq/BLO9d82uYAL/wOYZgkqn3pJl9v3zLQsNy2D7lRRJifcuoCCjh+bXD2
         17Zr8fFH1hCUVTXn3005fjgAhjQNbf52gx/39EstrI2Tn43DiRNKb4xBmIgV183+9FDL
         pVaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ba9QqDkcrd3Mro0zu2+iADvo+PIFbtPGZiWLHSGlxdw=;
        fh=qmFRCCS9nsPzamZXETTNrQs37cCWHQODlg+IQH/+pck=;
        b=mpx+3Z4zk5Cby3vTHKg1L4zIoLAIdPqPOVpgS5o1OEsaAXroHM66QVjAyIYW6tvAyx
         imnwlvFgHG3UAIHJXQ0vsT9wrGlt+MwdmlEGEKNFSxIiTcpD8A2fT+8JkZ4H68mGZfo7
         tOFROwAhrNyDp9qG9KigI+sy+8O7NOcldZWLxV5qG5RqL36ax/w4GHEoQchNjzpcOeAI
         S+TOoI+7TKsJis2zUTXjckI7G0bj9BowW22GDd/MOr1qgsTxsecvQxzqPn11TcAa97GZ
         02vKpri7bP2bUnyenLxdkA46ChpEWGoaZyktMMX4LhprpCa6R5bWJZoPECIZKhJ8i6tU
         +LtA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791735930; x=1792340730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ba9QqDkcrd3Mro0zu2+iADvo+PIFbtPGZiWLHSGlxdw=;
        b=T20g+rKuexDaHBgmTj1yywctFL+KVF/SbLOdMmQOURWO5WcdxJzpUSn5jxAEGQzMcn
         mhGExkzNY3IZnf+g73vFED5aod1Qm+TTlGeOCjNFtzZRbBRSRiBS7jHHXyIGlSY1w3Mi
         MuDv8ylqIpFxdXTW2adfi9gP4ZvpBTpSJgOPRi219FQczvzjyjdx/5ydP9h2oK5aJPqw
         ZIHm6yW3oZMQyEYHh6U6/Q0GBUkkDPL6Ss+gXwWLM0SY9xkcbO4SLjiXS0Nv17449WIY
         JgjKKR20mOoETyTtOhp3t4voU1/KkUQlfdYRcTJEMpEN3Lw7gudOl0ywbRsormauNb7V
         He5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791735930; x=1792340730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ba9QqDkcrd3Mro0zu2+iADvo+PIFbtPGZiWLHSGlxdw=;
        b=uELH5QjkQoQQmNhrw689iDehRv4gUD97wVnAOLoJKZujVqmPUsxrxhU+oLg+S+G0cA
         D8Dy9/JVnJg1FFx11ptWe3wRTFLCbHsk+yGHK7ILt1YMNz+zPntg2pfV6CNR9/9RVaXY
         E8iKCfCUaf8iG1DIg4HY2hWGVVZpe27Jf+sYQb4sqChrsuxGPcdhZM8WWapGcg0aoavR
         dAT66qPC6D7QevTyO9tsH30WqMVmF2To9OQRKv/XK1MKq4Ww1AUfvxnK21K+15lbrSvn
         7y0tH9bgHP5SDNyd0GVWUYcEhgKK+I4OafI3H8GTvifweZm6IAamoifESsvKWXADGq48
         +FgA==
X-Forwarded-Encrypted: i=1; AKwUvBzKF3cXmS1jXaZjjPjOq0aLUhCnTyIJQBfZMVA/n2+tdS9bxN9u3eFZkD1RTjBsqdwCuOPJlbNf2xSq8b4=@vger.kernel.org
X-Gm-Message-State: AFq9FYKSHKLM1M/a+573Jm5hXKzPkhCqb8a3dKnzafQKf0Zg6RohmtfU
	V8ovWisnCAG4Sh2KEoQeWIAqbXzEpEzsRgwKlx8pFQFplu2A/177VpGB7M6DZcrdew6uWEXu8JD
	TKwAxiy1wyeHUhUwuT7TBSd7dWSqNMwSxrLnocUdZ
X-Gm-Gg: AYBFou1+XEpzbR557p96o/F2l7RIR34yDWv7TgGnnb43luqrBr8S59YI4gosQmzQKlG
	smHHUbjIS7Ouxr3Xge0+lKcyucwOTQjDpiFPYYM1R0m6r7Rsy0tUiYOBKS1nHR7RX3+adZVhdxB
	uUBV+d4QmaVoN106s6ZIDM5VGwmXeQ57S+Due80XX+ffJAxjQHB48Uk5W2T3BIerkrNtY3soqA+
	MftlOv88ehWNEs9g2uQ9E3Z2pYMhXFLxWp37ZKNMqe9sE/ABGi1QzhGpHoOM/1786n4PIAQDdJ1
	CpbxRZVEuUs3weRj0aLWGE0qLR+vKc/qTAN89/mPksXGQJTn8D5OVg==
X-Received: by 2002:a05:701b:2046:b0:12b:ff98:1ed9 with SMTP id
 a92af1059eb24-16ef393e90bmr155257c88.12.1791735928492; Sun, 11 Oct 2026
 09:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008132815.654147-1-tariqt@nvidia.com> <CAHS8izNSo4YzXxD3C6c2HohdOfH2GK1M=51biuevLUk3vz5k4g@mail.gmail.com>
 <CAHS8izMKNeEmJM0wOgtoz9_3WRLUOqP0PEDMn5SZ+hXTKTwSyw@mail.gmail.com> <7a0bff03-2a7d-4819-b96e-a5ad8a5f6bf6@nvidia.com>
In-Reply-To: <7a0bff03-2a7d-4819-b96e-a5ad8a5f6bf6@nvidia.com>
From: Mina Almasry <almasrymina@google.com>
Date: Sun, 11 Oct 2026 09:25:12 -0700
X-Gm-Features: AclHuK96WOT_SJ9p7jbqKZ0R6AaK6MLbmYKOL8eVilAIXlLow0JHMppEEuz4fcY
Message-ID: <CAHS8izOPRjO54w0ehXCXahn3LPD7uqyJYX=zBeDDYG91Sm+DXw@mail.gmail.com>
Subject: Re: [PATCH net-next 00/10] net/mlx5e: Add netdev support for data direct
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>, Byungchul Park <byungchul@sk.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, Gal Pressman <gal@nvidia.com>, 
	Jacob Keller <Jacob.e.keller@intel.com>, Kees Cook <kees@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	linux-rdma@vger.kernel.org, Mark Bloch <mbloch@nvidia.com>, 
	Matt Fleming <mfleming@cloudflare.com>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Saeed Mahameed <saeedm@nvidia.com>, Shivaji Kant <shivajikant@google.com>, 
	Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Stanislav Fomichev <sdf.kernel@gmail.com>, William Tu <witu@nvidia.com>, 
	Yue Haibing <yuehaibing@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 10, 2026 at 7:16=E2=80=AFAM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
>
>
> On 10.10.26 01:54, Mina Almasry wrote:
> > On Fri, Oct 9, 2026 at 9:42=E2=80=AFAM Mina Almasry <almasrymina@google=
.com> wrote:
> >>
> >> On Thu, Oct 8, 2026 at 6:28=E2=80=AFAM Tariq Toukan <tariqt@nvidia.com=
> wrote:
> >>>
> >>> Hi,
> >>>
> >>> This patch series by Dragos adds data direct support for netdev devic=
es,
> >>> allowing a mlx5 netdev to issue DMA commands through multiple paths.
> >>> This feature is critical for improving performance and reaching line
> >>> rate in certain environments where issuing PCI transactions over one
> >>> path may be significantly faster than over another. These differences
> >>> can arise from various PCI generations in the system or the specific
> >>> system topology.
> >>>
> >>> Data direct for netdev will work with devmem by returning the data
> >>> direct DMA device instead of the DMA device of the NIC. Each PF netde=
v
> >>> registers its own data direct device and support for RX and TX datapa=
th
> >>> is added. The feature is selected through a new data direct priv flag=
.
> >>>
> >>> The feature is enabled though a ethtool private flag. When this flag
> >>> is enabled, the driver will return the data direct device in the
> >>> ndo_queue_get_dma_dev op.
> >>>
> >>> During data_direct device unbind, a re-creation of the channels is
> >>> triggered.
> >>>
> >>> A note about the unbind: it does not does not tear down dmabuf bindin=
gs
> >>> attached to the data direct device; the recreated channels will still
> >>> pick up the binding via rxq->mp_params and post DMA addresses from th=
e
> >>> data direct IOMMU domain to the PF, causing IOMMU faults. A devmem
> >>> revoke hook is needed to close those bindings before the switch. This=
 is
> >>> out of scope for this series.
> >>>
> >>
> >> Elaborate on this please. Are you referring to the fact that on
> >> page_pool_scrub we unmap the netmems dma-mapped by the page-pool, but
> >> we don't unmap the netmems dma-mapped by the memory provider?
> >>
> >> What's the impact of leaving this unfixed? Is the machine going to
> >> crash if the device goes away but we don't unmap the dmabuf?
> >
> IOMMU faults because the dma device is invalid. Either because the
> DD dev is still in use and was unbound. Or because the non-DD
> one is used and is invalid (due to channel reopen).
>
> > Oh, you're referring to an even different bug than the one I had in
> > mind. (I'll see if I can submit a fix for the bug I had in mind).
> >
> > But in general I think not addressing the issue you're referring to is
> > way too messy. I think we do indeed need to unbind the dma-buf if the
> > dma-dev is going away. The invariant should be that the
> > binding->attachment->dev should not change at all during the entire
> > lifetime of the binding. We already 'revoke' the dma-buf binding if
> > the netdev is going away, sorta (there is a bug there I need to fix.
> > The uninstall function in the provider doesn't actually unmap the
> > dma-buf :sad face:).
> >
> > I've worked with my LLM to suggest some changes that (we think) make
> > this work, but you may disagree. I'll post the suggestions. But please
> > I think this should be handled one way or another.
> >
> My idea was to handle the unbind part in a subsequent series because
> it probably needs some more back and forth to get this cleanup path
> right.
>
> If not acceptable I'll work on adding it to this series.
>

Since these are mostly driver-local changes I don't want to be so
forceful to block it by saying it's unacceptable, but if at all
possible lets try not to exacerbate the current mess. It looks like we
already a bunch of lifetime bugs with regards to the device going
away. I've posted this series, which - I think - gives you the devmem
'revoke' mechanism that you want:

https://lore.kernel.org/netdev/20261010025532.839559-1-almasrymina@google.c=
om/

Also working on that, I realized we don't use binding->vdev and
binding->dev correctly on binding rx. binding->vdev is meant to be the
device we do the bind to, and binding->dev is meant to be the
underlying dma_device (if they're different). That fits into your
model where you have the netdev you want to bind to, but have an
underlying device that you want to dma-map to.

I've gotten some feedback on my series and I'm working on v2. If it
makes sense for you to wait on my devmem core changes so you can
integrate into them better and avoid these lifetime bugs, lets do
that.

--=20
Thanks,
Mina
