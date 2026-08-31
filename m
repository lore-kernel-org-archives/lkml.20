Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64253DAAD8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 11:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=170.10.129.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788174588; cv=pass; b=N9NCI+m8nziyHMxb5Rtts6WG9fAk67Oq6ua0r8Y7v1CCf/b3s/DPCtYBt6b69ZLh/nnxDSlpwF1pNSIivGOgX8mHD9QUfWQC90+e0TVYS3IG4wF3kYZdFkxMo/MF0ftGbVx4WJRciAP6XDX+Rk7YALsmr/iWxYL65RNAYdOpSpY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788174588; c=relaxed/simple;
	bh=eNEEQlIjrSAO0DH2OmgK6lfFH24wmDnCRfFdxuXXBJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bS9LIIuxSErF4S8NYa0mfcIS6Yb6S5ni/VJtTNeqCtNtUZOxvcvzQwNy9wN99NEJ00glMeKhjQxLgru2IHitZceZayaVcp/IjqePmO0YDetj7usIeVxSy+u8uXlLhllL7/mQgegmVuCLEy3r09IP/ltQPR8+DmxPDEowXNBv0Zk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YLM3H9Nm; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=rJUtAZsX; arc=pass smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YLM3H9Nm";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="rJUtAZsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788174585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gGVDSMHx5ugj+9ChPGD41hmHDHU/4Z3alFYnki4dZYo=;
	b=YLM3H9NmtVSJM212PJpYlFbhWUJe6r0mbqJ9ZFlQ9aXIoNffhqyNiQV6ywvN+GQb6MhTts
	jpbkhgS+dW6lBN4Shg89pj73ERBNFJaZNe9Nxk3c+BNr6txQjTo+lUb7HTnT3LmqTGQsXg
	HfQtYypm0Wn4j8iEhymMEnUQnTG+1h0=
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com
 [209.85.128.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-299-JRb5SIJONrOq-bO6o7yczQ-1; Mon, 31 Aug 2026 07:09:42 -0400
X-MC-Unique: JRb5SIJONrOq-bO6o7yczQ-1
X-Mimecast-MFC-AGG-ID: JRb5SIJONrOq-bO6o7yczQ_1788174582
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-81eddfe28b4so42353117b3.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 04:09:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788174582; cv=none;
        d=google.com; s=arc-20260327;
        b=q3Ia8qrvlNQlyweQooPAnhbbsmkU27oZk/A8MqHVmkzdaogSvMoZDQEcwAp2rzn2gR
         o5hdHT1qF2ButQSUmgeJAWVeyUjk45yS1moBpnc9paQC8v95khg2cF2wDUzZdMp4oUT4
         euUn9WqJ7VsCwX+YWZsaE9hUCe9pD19quCuHBQpo3uGFpw5cCYvNkUw3gqWvA/XuNVWG
         Rh1E+KAGXJe8SDqO3StVTYmatCXMWXDsrxd0ki9L/toYsB8aqlf/l4GqlJ9V9oyW6+bY
         Lio6BCCXhBWBkIF0YEmrTzQET6cf6tbNDYel+ah93i2NkfB//Xc4PxH/gP0y666i2w63
         KOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gGVDSMHx5ugj+9ChPGD41hmHDHU/4Z3alFYnki4dZYo=;
        fh=4cQoO8ed05BhulHvoC82zVKrPsGxNffc1C+mtQPTL8U=;
        b=b/n5Cu91ArR2IE9hfmSLTVJlgaMZU4zFymAc5El0siy10I8CgZreKS+Kr9QA9Ch83k
         XFs9DBRpGLbTOMmLtKq5le9CiIrsxrSiyQKLVzeVvI/6clU5wqM3Gbn68JBe/IDJHJLy
         khmakcwrCELeavv7DcCahgY4zfm+aiLg0Uc2xUFEHW7Yz1EZZu47ffYLhftdnWpAqnid
         SvYMhlC2lyJAlemhgXjyo41RJ9lMHlhxb8wjN+1UXO2osXjV9rHGToLjIfEZS937/Pj9
         OIASFlTEO0/OXvHGWXFKxAzcEUZ1pccteiKcUtW9YQOn4yGvEDWx4dYg+Hb4M8ftkNKg
         TrrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788174582; x=1788779382; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGVDSMHx5ugj+9ChPGD41hmHDHU/4Z3alFYnki4dZYo=;
        b=rJUtAZsXdtGTgU1G5jIWVW6DLV4vW+VKK0Q7Z7MBVGbXnabO5lLFHSOFdXItHfmSzt
         3fTiXEymJ4I+WYGLTIBx/dvA9Jqw5YBHahhcbf4n3gDDlbpF6PwYWNyS9vUoZlk9Ye+Y
         fP708RmOULS++4rsSsyDNVZL+6fqWMNAcLwijnPr5HivmuzMfnJaC1qIru9yD3hXajeH
         08Pp6/aCrJiknhGldgoev/Ss9Y6XomHk5+T6b/hSOGvaNhDTrSAdLecSSwb1MhjYk6Ei
         1hqM6kqTxxIgc7t25tT4PQVN5QIRUnR+C35DGm7ClqhCZEVI5Xlfm5nGGFqJUqLJKgwx
         fH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788174582; x=1788779382;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGVDSMHx5ugj+9ChPGD41hmHDHU/4Z3alFYnki4dZYo=;
        b=fuE2FWUIct9S272YsKw5p18Z4aFI20z8TI62q5ho5udL+78qvPWz8QGDver6wsGT0f
         PNgSzMPhWmfrpPQeUQr/9903kK29aUI/TRJq1bfeiV1OvplAxY0m85iWCSjFjdDuHcY6
         LFusljpMrqF0G5eV8S6xJa6gK0ey2TRrAjWPfJkbG5+Bq/ry4no0/tdFk7F9hPRHUBc3
         74QK7IK1IEb90XW9lPXdo84CBTHz01l35BOPoqloUSzbRwHhLv3de/TjgeMhcZio4msL
         3lyLYF+6JBSRFM9CisytYvk/VCmPcc6C3wLMlKApYq5YWJpByEYWwuVaHeCAZwOQDwbX
         p71Q==
X-Forwarded-Encrypted: i=1; AKwUvBz3BGzQDiZq4fnsDRZhZFyRQjixUbTjcL0vknWPQRcmqux063aQtn1cvmYWgu+MCaTTBVc4S5BqfNJMK7Q=@vger.kernel.org
X-Gm-Message-State: AFuF++kpCGxasd2EMY64RP7R885wCh47FUj0K0LCD5K5idre1/QrR0Wc
	w5Lug3xI79XjMB/l9MBmZi1AJpSoJxqGDImNpS7dhyRYabBp7H9yDzJ9QuUbHdFvCX2ITtm1XHc
	wY8NyL8SsLweET2jOT9gEpQXGXsPdj1BW5IPHPV2P3zxLCzcg8iITcgFOTjN/Epkul1nuHYj1LR
	y/b9f/6sHVX8OJM1pQFr3FvHrm2aX8R0n3mMxZlkhD
X-Gm-Gg: AYBFou2YGoNNSBOfvOBtxTUAUP2rp+Vp1E846xhDDINbysKOiCYJxIP8Rm96nNPMU2V
	IVyw2fQi4bd3Td18cEy94UMaz7EPAWX7xjmSO/mxIaytwoxZsZHDOmIpPKk3zNuW0rfaJaZRGcC
	4tzfk5tqrS28mM2e2/pOdTzJT+6Jc6ro7A7m4cIcMsPxhIwqs5o0ZjsOZ2pxJK12CP8O/7mRWEW
	DoMZflMTZE1IXGhNyyVasvyhodGzSSJBgFcc2xB1YWv64kwdG6SK757Awo=
X-Received: by 2002:a05:690c:c4f1:b0:81e:7d90:5673 with SMTP id 00721157ae682-85d6b84749cmr86908337b3.26.1788174581607;
        Mon, 31 Aug 2026 04:09:41 -0700 (PDT)
X-Received: by 2002:a05:690c:c4f1:b0:81e:7d90:5673 with SMTP id
 00721157ae682-85d6b84749cmr86908167b3.26.1788174580953; Mon, 31 Aug 2026
 04:09:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260827055850.26951-1-physicalmtea@gmail.com>
In-Reply-To: <20260827055850.26951-1-physicalmtea@gmail.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Mon, 31 Aug 2026 13:09:04 +0200
X-Gm-Features: AcwNN1VgorMGLHjUu2yMfvgBMefLlEZdtOPgiCl06CVBpYpTFVo6Jeh18PCESXs
Message-ID: <CAJaqyWfjjSe19z4TrPbJfBBQZJXuAzqE4H8bik6UAiSgogzfmQ@mail.gmail.com>
Subject: Re: [PATCH] vhost/vsock: batch RX used-ring updates
To: Jia Jia <physicalmtea@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 7:59=E2=80=AFAM Jia Jia <physicalmtea@gmail.com> wr=
ote:
>
> vhost_transport_do_send_pkt() calls vhost_add_used() for every Guest RX
> buffer even though it delays the Guest signal until the worker finishes.
> Each call publishes one used entry and updates the used index separately.
>
> Collect the completed buffer heads in the arrays already allocated for th=
e
> virtqueue and publish them with vhost_add_used_n().  Bound the batch by t=
he
> ring size, array capacity, and worker packet budget.  Flush before
> re-enabling notifications or leaving the worker.
>
> Each used entry describes one completed RX buffer and keeps its actual us=
ed
> length, so set nheads to 1 for every entry.  This patch does not change
> negotiated features or compress multiple buffers into one used entry.
>
> This patch is limited to the current skb-based vhost-vsock RX path.
>
> Performance:
>
> Tested with a QEMU/KVM guest on a host with 4 online CPUs, using 2 vCPUs
> pinned to host CPUs 2 and 3, QEMU 10.2.1, q35, 1536 MiB, and Linux
> 7.2.0-rc3-next-20260713-next-debug-kasan.  The vhost-vsock source is base=
d
> on linux-next master at 49362394dad7df66c274c867a271394c10ca2bb8.
>
> Current vhost-vsock does not implement VIRTIO_F_IN_ORDER or
> VIRTIO_F_RING_PACKED, so both configurations used packed=3Doff and
> in_order=3Doff:
>
>   baseline:                 RX batching=3Doff
>   vhost-vsock RX batching:  RX batching=3Don
>
> The test used vsock_perf.  The Guest receiver was started with:
>
>   vsock_perf --port PORT --buf-size 64M --vsk-size 64M --rcvlowat 1
>
> The Host sender was started with:
>
>   vsock_perf --sender 3 --port PORT --bytes BYTES \
>       --buf-size SEND_BUF --vsk-size 64M
>
> Each workload transferred BYTES=3D1 GiB.  The SEND_BUF values were 256 B
> (SEND_BUF=3D256), 512 B (SEND_BUF=3D512), 4 KiB (SEND_BUF=3D4K), and 64 K=
iB
> (SEND_BUF=3D64K).
> Each state used a fresh Guest.  Each workload uses 20 paired runs, with 1=
0
> runs in each order.  The reported values are
> Guest RX throughput in Gbits/s.  The baseline and batching columns are th=
e
> geometric means over the 20 runs; change is batching / baseline - 1,
> computed from the unrounded values:
>
>   workload   baseline RX    batching RX   change   faster
>   256 B      0.0795724      0.0831509      +4.497%  20/20
>   512 B      0.1194885      0.1210297      +1.290%  14/20
>   4 KiB      0.7208273      0.7242053      +0.469%  11/20
>   64 KiB     2.1712797      2.1951941      +1.101%  13/20
>
> For reference, the table below gives the 95% normal-approximation interva=
ls
> obtained from the 20 paired log(batching / baseline) values:
>
>   workload   paired 95% interval
>   256 B      +3.985% to +5.011%
>   512 B      +0.206% to +2.385%
>   4 KiB      -1.442% to +2.416%
>   64 KiB     -1.474% to +3.745%
>
> All transfers passed byte-count checks, and no kernel errors were observe=
d
> in the logs.  The 256-byte workload improved in every pair.  The 512 B
> workload was faster in 14 of 20 pairs, with a small gain.  The 4 KiB and
> 64 KiB workloads showed no material throughput change; the difference
> between their results may be due to scheduling and execution variation.
>
> Link: https://lore.kernel.org/r/20181214082146-mutt-send-email-mst@kernel=
.org
> Link: https://lore.kernel.org/r/20220901055434.824-4-qtxuning1999@sjtu.ed=
u.cn
> Signed-off-by: Jia Jia <physicalmtea@gmail.com>
> ---
>  drivers/vhost/vsock.c | 41 +++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 39 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> index 9aaab6bb8..d8050cca2 100644
> --- a/drivers/vhost/vsock.c
> +++ b/drivers/vhost/vsock.c
> @@ -103,12 +103,37 @@ static bool vhost_transport_has_remote_cid(struct v=
sock_sock *vsk, u32 cid)
>         return found;
>  }
>
> +static bool vhost_vsock_flush_used(struct vhost_virtqueue *vq,
> +                                  unsigned int *used_count)
> +{
> +       if (!*used_count)
> +               return false;
> +
> +       vhost_add_used_n(vq, vq->heads, vq->nheads, *used_count);
> +       *used_count =3D 0;
> +       return true;
> +}
> +

I think that the used_count should be updated by the caller based on
the boolean returned by this function.

> +static void vhost_vsock_add_used(struct vhost_virtqueue *vq,
> +                                unsigned int *used_count,
> +                                unsigned int head, unsigned int len)
> +{
> +       struct vring_used_elem *used =3D &vq->heads[*used_count];
> +
> +       used->id =3D cpu_to_vhost32(vq, head);
> +       used->len =3D cpu_to_vhost32(vq, len);
> +       vq->nheads[*used_count] =3D 1;
> +       (*used_count)++;
> +}

Same here, why pass it as an argument? The caller knows way better.

Other than that, the patch looks good to me,

Acked-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Thanks!

> +
>  static void
>  vhost_transport_do_send_pkt(struct vhost_vsock *vsock,
>                             struct vhost_virtqueue *vq)
>  {
>         struct vhost_virtqueue *tx_vq =3D &vsock->vqs[VSOCK_VQ_TX];
>         int pkts =3D 0, total_len =3D 0;
> +       unsigned int used_count =3D 0;
> +       unsigned int used_limit;
>         bool added =3D false;
>         bool restart_tx =3D false;
>
> @@ -120,6 +145,12 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsoc=
k,
>         if (!vq_meta_prefetch(vq))
>                 goto out;
>
> +       used_limit =3D min_t(unsigned int, vq->num,
> +                          min_t(unsigned int, vq->dev->iov_limit,
> +                                vq->dev->weight));
> +       if (unlikely(!used_limit))
> +               goto out;
> +
>         /* Avoid further vmexits, we're already processing the virtqueue =
*/
>         vhost_disable_notify(&vsock->dev, vq);
>
> @@ -134,9 +165,13 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsoc=
k,
>                 u32 offset;
>                 int head;
>
> +               if (used_count =3D=3D used_limit)
> +                       added |=3D vhost_vsock_flush_used(vq, &used_count=
);
> +
>                 skb =3D virtio_vsock_skb_dequeue(&vsock->send_pkt_queue);
>
>                 if (!skb) {
> +                       added |=3D vhost_vsock_flush_used(vq, &used_count=
);
>                         vhost_enable_notify(&vsock->dev, vq);
>                         break;
>                 }
> @@ -153,6 +188,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock=
,
>                         /* We cannot finish yet if more buffers snuck in =
while
>                          * re-enabling notify.
>                          */
> +                       added |=3D vhost_vsock_flush_used(vq, &used_count=
);
>                         if (unlikely(vhost_enable_notify(&vsock->dev, vq)=
)) {
>                                 vhost_disable_notify(&vsock->dev, vq);
>                                 continue;
> @@ -230,8 +266,8 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock=
,
>                  */
>                 virtio_transport_deliver_tap_pkt(skb);
>
> -               vhost_add_used(vq, head, sizeof(*hdr) + payload_len);
> -               added =3D true;
> +               vhost_vsock_add_used(vq, &used_count, head,
> +                                    sizeof(*hdr) + payload_len);
>
>                 VIRTIO_VSOCK_SKB_CB(skb)->offset +=3D payload_len;
>                 total_len +=3D payload_len;
> @@ -264,6 +300,7 @@ vhost_transport_do_send_pkt(struct vhost_vsock *vsock=
,
>                         virtio_transport_consume_skb_sent(skb, true);
>                 }
>         } while(likely(!vhost_exceeds_weight(vq, ++pkts, total_len)));
> +       added |=3D vhost_vsock_flush_used(vq, &used_count);
>         if (added)
>                 vhost_signal(&vsock->dev, vq);
>
> --
> 2.53.0
>

