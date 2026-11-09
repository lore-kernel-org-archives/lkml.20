Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794231874;
	b=PRNMlwproV5k3pllEQ60CbCZK2iG9oesganMwG0st1hMv9ddlK6Im4BA3KQETcuyR+36
	 OLZ4NH/e0kGu3rhmC7eD0cgOK4pN0THfayOz9aPn56eEiUbkEWaijISGjUJujBOxkn7N5
	 PdqNd4in0tfDOJN7ob4jsq/xDBQ+jYnjGAyuVraOGAt2UqoMpAuVz1sD8t8iraM0Zhnjy
	 D9sJ14yrq2hNDXjWIYLb2Mkc/tpDYKBxgv61QrIpth+GrUl2Wv2S0oHthEZm1HQJSyZkF
	 nz7e+LJm5EriXhfNAy0jid3GOL+7Ya0Ros9IDx4KbUfN1tZhmOdwUTBQoRQiQrNaZ4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231874;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
	b=B8bWBDpnCBicrEO4U1nNNUs3LZdcVaUc3StgTl0x97nhXPbl1IMYLpbJdW0y2tNBm2oj
	 8/mZiN+D+1vOw+eBmDz3DXfUEButoMndTB8VNidEBbVPyyTgme76k9gMk7gcY1LqRb8bO
	 38H1x/A08BBfzet+oOo7t9FHKwxJ9A+Nhhepzty9kJdrYaOx0zRdxVm29nErV5V4gBSMt
	 R8vEGXjcXrUWCuyk0e9a4DS5foMSK4gGsxuqXj2xMP+zJq4XZPLdjLF9Vk+aHYxscAnn1
	 xQc06P/E2iTLzMjEqQiDH0+Spub7gd4kBhV6VEiAt3biw7Z7j52jrqNO5m9PaY0wVZQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Q3rez/hv";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YvJeU9XV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A27606D82D
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 13:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2A27606D82D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q3rez/hv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YvJeU9XV
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794231873;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
	b=Q3rez/hvuf6SE7EigJ8D81zFVYceNbdOxcqN5PnvQucu/zuNS9EYAa5Q38LiGcvWx+7+ox
	7JMIND6+4OMezdJYZyKK3XC0NhBBmhOd5On8cTXtbbiXmCIvrsmsFt1IeYwV2DmYxyGQzY
	oIqDpNAszeQsDKfiLrOePH1DRG/jplk=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-aBkfrikdMuqmB2tvhE6CKQ-1; Mon, 09 Nov 2026 08:44:31 -0500
X-MC-Unique: aBkfrikdMuqmB2tvhE6CKQ-1
X-Mimecast-MFC-AGG-ID: aBkfrikdMuqmB2tvhE6CKQ_1794231871
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-8255327a28fso1383221a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 05:44:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794231871; cv=none;
        d=google.com; s=arc-20260327;
        b=Bpiglo5q4kIleG6XxrptqGn4oXirqdDwoobQclkYz2oTdeCSSHyuJ1hEsWk2iBuXMK
         zWdFrIEVNpq/o5mGCYOu+9q35Fx0rrO2RxaxNsi5HM0qi2LsKUdqL55wZSP7jlybSASJ
         FmLaW/RBoLH3lVH0jLPXYXnYRy0rmQf6OdKDJLnp93FfEfjVzvGXMY00kEbifCyfD1iz
         o4axt15t8Uwcjn6/YHiCcK8SkXnNxX5IVCV+RpnD4U1VIuOxp1zI0fdVZ+gWG7mfEjVO
         WVLOFXnYfI0lLtvvcXAkNy+aMElvUkRUbpKq3Glzv9eeXlxBf+hqeaR5MBrtkmzpFy+y
         J/cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
        fh=8d4BZk+5k1pUaT1R0l00GSDsjEjXGlbzs1g/yabOWdk=;
        b=kjfiATq8AHfoZW97ZkxyNlHV7mFA+QGkgiU2uBRH60uDhZbXbEMjs4NLWuBM0mIWhz
         Iw4R9HsErZ0Po2uE8vW2Ijri93D8F0IueeV7sTshBzMRQhe796dK4XCKuQ6cVoHqMO6i
         g4EfEhh0yIkxrfybYR6TEMB/5FwUEj9jlYovGXiuHUNmcR0ubQVpvUMr5EIaXevtWSjH
         l4Av8+eDP1NDQVd28guVTlk28UZo/AKwxQAhlnfRRP53zqzXd6djF7Bv1KshBX4Yydld
         JTOi5siFL+OX8yOdiLE2/YAfEgzJAZWSibxNjIb8+xeP4sW76y6sHAmtD0Wo7EX7ErMs
         eUOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794231871; x=1794836671; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
        b=YvJeU9XVwfRisHtjyrCD+g+YGGD92Y4vF2X6jtfhy6ghLt1eFKkMwEPTldRNTAcYwI
         GItFYO/P+dcWYTGtr8Jy81fAkwVcwgfbfg96bG+xjrb/OnsMZLb+hZW5MN3U/ZKjDpC0
         BOcktFnfPUXucHdwF1+UR4tDqvpRyDMezw8t4YfkxvDhMjaakRyGd2bAZ87J4j/v9ugf
         hJ2UzlhDvtuOcRc/LSpuVIkVHAqmBkkuIvITMWlo8AhVzCCkUw0C8YPHftpTxw4nf6N3
         L7byH35l6GMhiO9yNgS5JmHr9mlH1MPlA50sUGYgHyc+7k5qS/eYAJOO66qnWTunj81x
         ywUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231871; x=1794836671;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bghOY7pp4PqTwolmTpdD1zvT8+4Tek4EN2nSOV+gjQQ=;
        b=bRyK0YggVsa5Dta+PLKYKigDoXswqhYe8WXjyZBJvMCiA9b5uHW2WbknLXKGcKW0Y1
         1S/rFFlA1hYVZ7rXxVRWOLNwkkm6UrBovoO2N7bXmTIJ+RxB03YksDRqueQyiH0sx//Y
         JwujjefXcEeCKfuijiX7uZn2NrFr2hy9F4LKawmwu2CTRSploqcmU5KKBT1P0AtXyvPV
         7c1KZ7Rj/5bqK3B63drd2CCan05mmVQ2N9/2eoEgA2MZEgZOWLtDJugRrOCIUAWqjeAi
         m+/iQqH+XfAW2HLT/HYaEcSXfig2M1d+wxVw7Yqs+8B4MSSM9JCA3buQ0FgGmIVosjsH
         NVhA==
X-Forwarded-Encrypted: i=1; AL+hErHSRoiDjmS8Nb9MfaPSKRjdnFEOzvQfX8CySkRQs5lms/Ww/GLmUrE3SjuTdAIH0UH2ubfZHLqyAvVrFyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8q2mTPk0Xq6d3HglzyrLeaqzMhL0/2WZLPOL9S+t3bzudRlJJg
	kZByCeWkWMIe0hiTAOG6G9FXJfQUO5l+4AeliS43bIcHnAxyDrVpFwyF5e7lFKH4/IgJFGeb5co
	ARIsI0u6WjNowE8uNfabuacaHXaYRweuUwrpo2n9XGHDIlv8ZnMPNzZpR+taz+IFSLiSPoSv9FU
	2/xrvOg8GYBYdE54pMLppY+cyw92Z+rGAGayASX5Fz
X-Gm-Gg: AYBFou0+4wXYOhMDLrmPUAsy44GKIu8Tt1xFAcnTZj0dlYm3qt4Ecsz4bs869BD3Wa9
	g1QbRgNM4KoBOc4L3ffsHtk1CPlYuucTIXjDFsPkw6AbCgiVeQHNiYyHJWhWttTIbVOtUKx2HVR
	XYg966KOlMZm+4LpT9WX+s+XCwwcedpcsuXhPrFwHhDOPeTc2eUAX8hNIv
X-Received: by 2002:a05:6808:4fe9:b0:4d7:17d5:6c9b with SMTP id 5614622812f47-56814022659mr2709796b6e.9.1794231870755;
        Mon, 09 Nov 2026 05:44:30 -0800 (PST)
X-Received: by 2002:a05:6808:4fe9:b0:4d7:17d5:6c9b with SMTP id
 5614622812f47-56814022659mr2709756b6e.9.1794231870169; Mon, 09 Nov 2026
 05:44:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106131829.3228926-1-cui.tao@linux.dev> <20261106131829.3228926-3-cui.tao@linux.dev>
 <1e18fcfd-785d-43cc-afd6-d181bf8305eb@amd.com> <CABdmKX0nCB2hT+iMh=BB-nC=fUBPof8YvjvO-gtEw+zcHZgvZA@mail.gmail.com>
 <b0f530ef-bbfd-4112-aa51-82fdad6c4ba2@amd.com>
In-Reply-To: <b0f530ef-bbfd-4112-aa51-82fdad6c4ba2@amd.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Mon, 9 Nov 2026 14:44:17 +0100
X-Gm-Features: AclHuK-kxgj3T37bjFOZ7HtSClpdxsaDMPyjW53dccz7zE1_ZSRFcURRmSZwzSI
Message-ID: <CADSE00L3AfcnfcboK1TdPQiW7ZW1KpxG70b1oyWFqpLciOG6ng@mail.gmail.com>
Subject: Re: [PATCH 2/7] dma-buf/udmabuf: account the page array metadata to memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: "T.J. Mercier" <tjmercier@google.com>, Tao Cui <cui.tao@linux.dev>, akpm@linux-foundation.org, 
	dgilbert@interlog.com, mkp@kernel.org, loberman@redhat.com, 
	jmeneghi@redhat.com, kraxel@redhat.com, vivek.kasireddy@intel.com, 
	mst@redhat.com, jasowangio@gmail.com, eperezma@redhat.com, 
	stefanha@redhat.com, sgarzare@redhat.com, rostedt@goodmis.org, 
	vdonnefort@google.com, mhiramat@kernel.org, jgg@ziepe.ca, 
	kevin.tian@intel.com, axboe@kernel.dk, linux-mm@kvack.org, 
	James.Bottomley@hansenpartnership.com, sumit.semwal@linaro.org, 
	phasta@kernel.org, joro@8bytes.org, will@kernel.org, 
	linux-scsi@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	linux-trace-kernel@vger.kernel.org, iommu@lists.linux.dev, 
	io-uring@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bobbyeshleman@meta.com, mathieu.desnoyers@efficios.com, robin.murphy@arm.com, 
	mason@kernel.org, harry@kernel.org, vbabka@suse.cz, cuitao@kylinos.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 11:56=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 11/6/26 18:25, T.J. Mercier wrote:
> > On Fri, Nov 6, 2026 at 5:23=E2=80=AFAM Christian K=C3=B6nig <christian.=
koenig@amd.com> wrote:
> >>
> >> On 11/6/26 14:18, Tao Cui wrote:
> >>> From: Tao Cui <cuitao@kylinos.cn>
> >>>
> >>> udmabuf pins the pages of a memfd and hands them out as a dma-buf.  T=
he
> >>> data pages keep the accounting of the memfd they were instantiated in=
,
> >>> but the bookkeeping around them does not: the page pointer array and
> >>> the pinned_folios array, both sized by the buffer page count, plus th=
e
> >>> transient folios array sized by the memfd folio count, are plain
> >>> GFP_KERNEL.  A 1GB buffer costs about 4MB of uncharged SUnreclaim
> >>> memory, and size_limit_mb defaults to INT_MAX.
> >>>
> >>> Charge the three kvmalloc allocations so the creator pays for the
> >>> metadata it induces.  The system heap in the same subsystem already
> >>> accounts its buffer allocation;
> >
> > Only if the mem_accounting param is set to true. We (Android)
> > currently depend on it being disabled because system heap buffers
> > don't have a single owner for their entire lifetime (ownership often
> > changes immediately after they are allocated), and the kernel doesn't
> > have the ability to switch who is charged for the buffer memory quite
> > yet. Albert is working hard on it at the moment.
>
> Good point, making sure that Albert is on CC as well.
>
> So basically we not only need to charge the backing store of a DMA-buf to=
 somebody else, but also the housekeeping overhead.

For system heaps the housekeeping size is fixed at creation so it
kindof fits the reservation model nicely. We'd only need it to account
for the overhead (as part of the MEMCG_DMABUF stat probably).

>
> Mhm, this here also complicates the charge transfer Albert is working on.

The transfer would just move the charge as a single unit. But yeah,
the complexity will come from lazy exporters or any other exporter
where the bookkeeping grows or changes.

>
> @Albert not something we need to take care about now, but please keep tha=
t in mind while working on that stuff.

Noted. The issue already exists so my series does not make it worse. I
will note this for a follow up series.

Thanks for tagging me!

BR,
Albert

>
> Regards,
> Christian.
>
> >
> > Could you update the message to note the mem_accounting param pls?
> >
> >>> the data pages here stay with the
> >>> memfd.
> >
> > memfd / udmabuf is a little special because it uses shmem for the
> > backing store, which is already tracked by memcg under all conditions
> > (except hugetlb). We don't currently use udmabuf, so the lack of memcg
> > charge transfer for udmabuf is not an issue. But once we get charge
> > transfer working for the system heap it'd be good to follow up with
> > udmabuf.
> >
> >> T.J. needs to take a look here, but I fear that this might break uAPI.
> >
> > Thanks for looping me in Christian. The buffer allocations cost
> > gigabytes, but these metadata arrays are only 4MB per 1GB of buffer,
> > so I don't expect charging them to break anyone. Leaving them
> > uncharged is an accounting gap though, since someone could spam many
> > udmabufs from the same memfd and only pay for the memfd pages once. So
> > this change is ok with me.
> >
> >> A lot of the DMA-buf resources are intentionally not charged against m=
emcg.
> >>
> >> Regards,
> >> Christian.
> >>
> >>>
> >>> Signed-off-by: Tao Cui <cuitao@kylinos.cn>
> >
> > With the commit message updated to mention the mem_accounting param:
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
>

