Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624383;
	b=DdvVsvSYHNLKDXPMJCZdmxMqe5ItbHRqNUVz6lHCIbYAJxYjaliBH4bSr6Gu+UiWYaiB
	 Kdx2j6RRkUmc40FStjV87uJyQJqMrEbiFIoyGs7yRt1GHw6QCXQM2FwA5dZkkZST8g1UN
	 M8VmexZphb7I2fu2K+Utxi8cx4OmL82+QPlowLlpirMkjDTR6KexF5+0bYd7bXcEwCJJ2
	 jKL2G5rtz2TlwTR04Kz1Wdi/HFYnT/y7I/vIIje7JRdjVcWGaSigmUxg2nYMjgugKK2zt
	 T5dNJx7FiIq0SV1OpZ1r6n7dP1xvpJsdsaf0VwztmgKj2CGtrX37QDqraZfbcjAunog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624383;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0QU938YZmI+90ta4rBgGtrqwO0xO5MqL3TKangYRrrc=;
	b=AHg2AvNyqSPRp9STjWMnBaHWS8QChEwIWw3J9Y6uyYanNl9TlRTtOQYytAYPSpsaLVGo
	 OInv+jwAWFN3aXCZPrzdBYXVuKjyvMvPXQ7O2eQgl8RQtpTrZCjg2wk68mgrmXBzFR1NO
	 AGsx+PyvrBK9Q/n12tNj+FR/hvzmNQwBhgCvt0h6TAZ/OPQBOTqy+xaZc0rvK/WyiGXLN
	 EPPCeBjhHUcGx6Jk+IcOhGX3oXgBM3rFOZNoDvEKABOGXLB+VElzrI9H2ixDu0u5nMLWd
	 xGLA9q5nVAKmla/QA7dxevzQtp4ADw6QNNXWtdrSQEBs+AlDzCbjJFuetvmoYAZdwzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjDejfpt;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BRdkBEoO;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A202606A32C
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 12:59:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A202606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BjDejfpt;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=BRdkBEoO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793624379;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0QU938YZmI+90ta4rBgGtrqwO0xO5MqL3TKangYRrrc=;
	b=BjDejfptVFHF7RlmBekort2+3mQBsp4XNpAnGDgDVkZqsRWQazzzrpfFpTYWCLGTK6y7Ci
	eueeUT1vWR3Wh1dQX7ngtJGmw+4Yw3RRNKxmMA8WY/SlYOBbFBv5g2UxQTWhwwyNY+a3Cc
	k8n0/S4ZEPVD7FlM6MzBL082aw0imhE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-ubCkB9fJM7S-ESYkNh-E1A-1; Mon, 02 Nov 2026 07:59:36 -0500
X-MC-Unique: ubCkB9fJM7S-ESYkNh-E1A-1
X-Mimecast-MFC-AGG-ID: ubCkB9fJM7S-ESYkNh-E1A_1793624374
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48afcecb035so567168f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 04:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793624374; x=1794229174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0QU938YZmI+90ta4rBgGtrqwO0xO5MqL3TKangYRrrc=;
        b=BRdkBEoOnpUpyCXr2py9edkl8wcICrj5cvMtlj96Wlalrso9ci4qYS45Srfn+QiSXL
         u6jtW6sJGjXBLUZCwu0nAGwhCgJMi0i0ybPpdz5CbpnNDixxinChR6uFPcJotn2DZFin
         UwxXIF1wX6GKBvFG9oS+uMwcd7fVsFiMu0MxDiENApZUi0gsI8ovsmq9Ndy/iqAUb7W7
         1UjNTtbD6m+wiXT+I4Zwkxg59rFsg4/meszFajCIklqBT0l46Y3fIyiWAeSTVkVrrZ6w
         C9qLFzfrPRutjDrmm76C1+GlY3UtixDIUPPe7YwpiqngB5JUI5ld2REuh5eztViFfkCx
         HIfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624374; x=1794229174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0QU938YZmI+90ta4rBgGtrqwO0xO5MqL3TKangYRrrc=;
        b=VRsA9UzZ72Rf+eg/YuZPypsT21HJo4OV48a/5mdKfMZurywMWFPn5UgEofVnWVEMPc
         jjI2A5NAL2kCWz/h6Ti771ph9STkrF6WG8IiKd9PPHQcs0YRy8fgW6YEFQeS1uaY7R+4
         5WSCN4hlXBlS1p5D6QTdxR4Fq1XkcoV+VYPySJ7n96BMCt9bRdMaSMkcj0V2Fp5acJ7T
         e5FW3uF0T4zKxVS+MG6D3vg572vXK/eycR8nEjmvcYbA1YqMM9WXMS91vsBEmJ5lMK9R
         1YIbHoHU5gXkf2K/CRIgSY8/t8lKZRhBAxVMpW642ZxwOjuBD6KRVHZIWHBxvOWQ8LqW
         bOig==
X-Forwarded-Encrypted: i=1; AKwUvBxyoIKPqKA9VQ+UL7n3wlBR+HolvrTAuG8I4AgefrRk4H/4MXvq04/TlzZbvxI2VJGkjpe5DqI0ClBg8Lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q03rQFwr5DOXobX/gkiZJyFHWf/OIuG3B9dBukojU7peI8e1K
	75YF0spx9TNHgsXUXgN5mLBIESd0tAGO4p9uhJe8CNmvWwzRV42sv1aLSwJFI7FQ/wqtlLcU0Eo
	EoZjpGP6PRy7hEu5xIQB7tcbhLaT2k+dcMQALpED8xSorHgNIi+f7W5V+kTCdoH0R8g==
X-Gm-Gg: AYBFou0FOBAOTdCDVd6oh1iNQKwSUBG7pPqv8iLP61/v5JkFfDE5LqY7UldicTJTuSi
	1O/UzSHUTpZGh7h+6FBY2DKWzv47IC1j9+T0WNCoZpuOtQuE2oaq4tO+a0KabtkUwxBqxb31Yj2
	Oi4WxciPp9LglVgcbeaI5JFJhkfMTWHfOzUK2kEuBbYTqy/F60u55+AAQxE8+WyFkAZTckgqyJt
	tG+V2oyDY2H+GbC/q98WW6POGjpy/LIVYYSEzmkgZ6a4GL/puk7BQi/1F7V1nH6TjSPqufhpmUL
	ekevD8t0EF7ScTPWyWwC3bVc37WlTU7R5e0cWT9L4D8U9pyetK/nvS+Iml82Ji3yxJpK9ye9OHT
	+54pizQvUKi/o6QKNVnTETfiFiqYwVuOpaQ3p6Bl2eQ==
X-Received: by 2002:a05:6000:4010:b0:48e:55bd:9cdf with SMTP id ffacd0b85a97d-48e6e2dd3a4mr25444614f8f.21.1793624373989;
        Mon, 02 Nov 2026 04:59:33 -0800 (PST)
X-Received: by 2002:a05:6000:4010:b0:48e:55bd:9cdf with SMTP id ffacd0b85a97d-48e6e2dd3a4mr25444547f8f.21.1793624373259;
        Mon, 02 Nov 2026 04:59:33 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1501:b100:9ea2:fd21:b361:8dab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7270asm20090543f8f.11.2026.11.02.04.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 04:59:32 -0800 (PST)
Date: Mon, 2 Nov 2026 07:59:29 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stjepan Poljak <stjepan.poljak@gmail.com>
Cc: Jason Wang <jasowangio@gmail.com>, Jens Axboe <axboe@kernel.dk>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	virtualization@lists.linux.dev, linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] virtio_blk: fit requests to virtqueues without
 indirect descriptors
Message-ID: <20261102075830-mutt-send-email-mst@kernel.org>
References: <20261101165307.2557421-1-stjepan.poljak@gmail.com>
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
In-Reply-To: <20261101165307.2557421-1-stjepan.poljak@gmail.com>

On Sun, Nov 01, 2026 at 05:53:05PM +0100, Stjepan Poljak wrote:
> A virtio-blk device without VIRTIO_RING_F_INDIRECT_DESC needs one ring
> descriptor per segment of a request, plus one for the header and one for
> the status. virtio_blk takes max_segments from the device's seg_max
> without checking that against the size of the virtqueues, so a device
> that offers a seg_max above its queue size minus two gets requests that
> can never be added to the ring. virtqueue_add_split() warns, returns
> -ENOSPC, and the request waits for ring space forever. A virtqueue with
> fewer than three descriptors cannot hold any request, and depending on
> the queue depth the probe then either fails without saying why or hangs
> on the first I/O.


Thanks, I applied
    Message-ID: <20260918135120.1261150-1-sergiiushakov@google.com>
to fix this, as it seemed like a more comprehensive fix.



> I ran into this while writing the virtio-blk device of Hearth, a small
> KVM-based VMM, with queue sizes and seg_max values like these:
> 
>   virtqueue  seg_max  queue_depth  before                    after
>   ---------  -------  -----------  ------------------------  -------------------
>   128        126      default      boots                     boots
>   128        127      default      WARN, hangs loading init  boots, 126 segments
>   128        254      default      WARN, hangs loading init  boots, 126 segments
>   1          -        default      -EINVAL, no reason given  -EINVAL, message
>   1          -        128          WARN, hangs on first I/O  -EINVAL, message
> 
> where the message is "virtqueue size 1 is too small for a request". A
> virtqueue of 2 is rejected the same way, with either queue depth.
> 
> Patch 1 checks the virtqueue sizes in virtblk_probe(), before the queue
> depth is derived from them, and fails the probe with a reason when one
> is too small for a request, whatever the queue depth: the last two rows
> and the virtqueue of 2. Patch 2 then clamps max_segments to the smallest
> virtqueue minus two when indirect descriptors are not negotiated: the
> seg_max rows.
> 
> The seg_max case also reproduces with QEMU, which with seg-max-adjust=off
> offers seg_max 126 whatever the queue size:
> 
>   -device virtio-blk-pci,drive=d0,indirect_desc=off,queue-size=64,seg-max-adjust=off
> 
> Before the series this warns and hangs loading init, after it the guest
> boots with 62 segments. With QEMU's defaults nothing changes.
> 
> The seg_max cases were tested by booting a busybox guest that reads its
> disk with O_DIRECT in 1 MiB blocks, the others by looking at the probe
> messages, on v7.3-19954-gcbbddb6b08cc, x86_64.
> 
> These patches were written with the help of an AI assistant, as the
> Assisted-by tags say. I reviewed and tested them, and I can answer for
> every line.
> 
> Stjepan Poljak (2):
>   virtio_blk: fail the probe when a virtqueue is too small for a request
>   virtio_blk: fit max_segments to the virtqueue without indirect
>     descriptors
> 
>  drivers/block/virtio_blk.c | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> -- 
> 2.53.0

