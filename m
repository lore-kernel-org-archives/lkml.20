Received: from mail-qk2-f41.google.com (mail-qk2-f41.google.com [74.125.230.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24132489FD1
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 13:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790947375; cv=pass; b=LMFFJlNHKdNJC/9qkiv7ICdlH/H+iGbP16Me+36KUOIibHBcNkKZkVC00AYiXCOx6BMmsTlqUYcdcvHWXAzK5q8spC3LVeL36vS8S04QcyhdLrpMBBLMUK7D7X8aBhzU6QivS1CrtBRAfsm8lEIz/vLDFEKuwwEDz/E8llsdfYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790947375; c=relaxed/simple;
	bh=bXv+OzGfGyUqcNVSEAB3EcnVmtZJQIIB5GyxKlXPwB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d9Kni7W+WXXrhN0AHptnAh1JGcTTiJ8HY+1kdb0cSy7CoCsOlu/mt3fD2USF9M9kSKOyLOwuCui6pZKiLvT/v4V4X9tWYzzadZFgjWTjFc5aebcftJ14Y1I8MCkT07Tm4i1tVVdSK8p4cgmnM5cJSPUTb/gOGxQsoAKLvJ7ncCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gFStWn1V; arc=pass smtp.client-ip=74.125.230.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gFStWn1V"
Received: by mail-qk2-f41.google.com with SMTP id af79cd13be357-93e49d7dc66so20769985a.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 06:22:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790947372; cv=none;
        d=google.com; s=arc-20260327;
        b=ksucSfOTiWMQFPslpC7JJUMfKfUiWfjP44PIOJdnS4S447vAOOjtP3nkQ0gWu2x0jT
         rjBiwFfX75rX+mu0OGoJVWW4fS/BjGcVs6Nbzyjsau3u7YpBygsIrunagWF8qw9WQxY3
         KQsIO5BD0vhVoC9q8AGiBzlA/l9fTRpsXIs3c1kQPqDCuHaf+0KSqjI10W7N/e1g1Ezt
         0zq/rEMierU2lzm+a+ukCkbKxhgw99ru86BIMVPnnOZ+GfjUdiFaQCwuQrW1wKJZqr68
         L32bNTzNlTMQbguprEaopZM0ZS50NQGxG6wMMzYw7MG8ZeCPczxAeOL8lsoC6UhVqaOD
         RK1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6snyJBSj8ioMJc468jkCyOEuW/eCFo/MXP5mA8YOdC8=;
        fh=+HZNN2gh2um71EDm/7xCznEkvPP6vJrLCdbc/ZexDuU=;
        b=TGECL6Za1emLCfNseQTOnvhGGNj5UhUoNWfdExZfD7vxx1duUBzk6S/4ld9C3u4naI
         7z3eFdXPVDND0/qJOKxtnczpga+robFs02bmJlhZuhiCjxCdyzEcfyBaTi43Pu/A1ldx
         l67ggtDesmWQERVlnsm8t9lYoDT7kALnWYmlRfSpSFLHBa0maD7XMkHHhPRA4902aETI
         TlH0bdaUCo8zxc4VGQHHxNWnFvgHLKVC2hblGaXxlfm9CIMZhwzDL3FMch8ZPoerPw7O
         g/BkaQIyhQPlnb2wmJ4iozd0gaAaxuKqiA3BWTl9Yoi+BZ3SDcGGWwiZYOHQC/e5rwqN
         g7tA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790947372; x=1791552172; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6snyJBSj8ioMJc468jkCyOEuW/eCFo/MXP5mA8YOdC8=;
        b=gFStWn1VLcvpWAQpW83UyCxHNj+LvtuwL998MB1foy7k4mFwWGl0sLAkL0EoJcJgdk
         nNGEYHdnlte9z6S2s15CYSYG07dTSTNXDYi/ks86sPH4N/N7zB7wHrjDActcVIygkobU
         Klltkv99Uq5IcFV/o5ZqrLlTDDC3X8qQkGp/PL5Lu6xkSWh1IwtIT6cbEoDJ9SqCaMbS
         kaB4RwHrWMKVINg4vfbozGCvsaafWi2yqsra8c39N2jn793CCL/8etV/Dpy+jTxMhgTb
         H4reUASzc2a1Ijoe8MZQ7LASwiYYMccseJ/S2c5fRzbQnHQD9WGnkKBbEaOAdvr3d/Ya
         Kd8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790947372; x=1791552172;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6snyJBSj8ioMJc468jkCyOEuW/eCFo/MXP5mA8YOdC8=;
        b=h56wh8nYBMXxVFcHXyHKRBCWWgUw6wAfHG3qOtq9SmoKl2BJNcssvhRtADxiiTtvau
         SCz+tECbOXjFtqP9y8H9HgiLgIEQXWdf/RWXtioYjkPaftQNfmqQpxNYsAUnX+bTQfO3
         h+bGqCt3DCAzgU3wcEYrsYhj3hC2AK7ntdqxprSm1m00q94q+bzrTFtK1ixrZ5HizcMr
         yfwOjis0aPjwXG4CUHkf/Eun2J/+Fi3tPpYFKIuvp5+QvZzhES1A4ejufWxdtGlgrTmL
         LdAF/fEnk8CduQECKdRyy0BV4TPA6vcsRO4onX454BPoR8V2NieFBBO9oXFZd4VkTypa
         1AYg==
X-Forwarded-Encrypted: i=1; AKwUvBwzYFDgQCA6EtiYvTGNZyULuhKqonJ3erSktQjSbcHSKsyIvBf7GXKbOC+BsVSS7tA/QLEQH2oxCqEJGrk=@vger.kernel.org
X-Gm-Message-State: AFuF++kbfPDQmUi5hFC8ZXlMCAQrMyORbYm700Dh6BkMRh1dy7uHdypv
	NtnEWmeFW1Jr4Cc8hX4R+d8EJonA0LxSiwsNSExqq19bWMgA+dzIHqUCOzct1Cvlv+RsVRwOeFB
	OguyCzEpTfDWjHyAVr3O4/AGkajBItcs=
X-Gm-Gg: AYBFou3BgvhADQy6XeNIx+3C3RlwfH6g3OnJL4a1ZpWVaUgYZG5XRl2NhDMiFg5p3Li
	lQH/xd8isLcd/ZO1C08sUOmfD8K4NA0ioIhjWl+4V9OvU+U6NgQZnnRMxjCgkCrqi2SxOHqdTdQ
	vpAXUJk8lXyrqSrcDmzgRHvbPNvXPjs6X607CgeFzhwYQ+WRaRuZOjcQbS1ilZC5uuV6kTb27o5
	jXlVh7NK/pUr7eetIrRTqAmLnZgxFcNeA9ysPQqZgicn1D6nm5GV5eOaCEtMSOh9bK6BbUu5JS2
	pfcEDzd2etCph/6Q/mqPdhMQNx+8ws6dyInO3zpLvFml66FPS9xVGyM=
X-Received: by 2002:a05:620a:4493:b0:939:ede4:a499 with SMTP id
 af79cd13be357-93ce7ab3ab2mr434910385a.5.1790947371465; Fri, 02 Oct 2026
 06:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261002074551.318789-1-physicalmtea@gmail.com> <ar95red76pmfQwvF@sgarzare-redhat>
In-Reply-To: <ar95red76pmfQwvF@sgarzare-redhat>
From: Jia Jia <physicalmtea@gmail.com>
Date: Fri, 2 Oct 2026 21:22:15 +0800
X-Gm-Features: AclHuK8I62AZnyoE6xfS86fnLkS54v7RxBiMcJlNIxeI4Z6FP8O_7gPM89wJ3jY
Message-ID: <CAJwVaM+uA0TSZuJFXyeK1-1HUAiqs0zOpK2rJ1mBGa8380_=yA@mail.gmail.com>
Subject: Re: [PATCH 0/5] vsock: reduce RX per-packet socket overhead
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: stefanha@redhat.com, mst@redhat.com, jasowangio@gmail.com, 
	eperezma@redhat.com, virtualization@lists.linux.dev, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

>
> On Fri, Oct 02, 2026 at 07:45:46AM +0000, physicalmtea@gmail.com wrote:
> >From: Jia Jia <physicalmtea@gmail.com>
> >
> >This series reduces per-packet socket overhead in the virtio-vsock RX
> >worker.
>
> I did a quick look but IMO this is hard to review, please try to keep
> patches as small as possible, e.g. where you are introducing ctx, store
> ctx->net in a net variable, so you don't need to touch the entire
> function, etc.

Thanks for the review and suggestions.
Will do. I will unpack ctx into local variables to minimize the diff.

>
> Please check https://docs.kernel.org/process/coding-assistants.html
> and also https://docs.kernel.org/process/submitting-patches.html
> ans also https://docs.kernel.org/process/maintainer-netdev.html#git-trees-and-patch-flow
> (I guess this is net-next material).
>

Thanks, I'll reread them. Targeting net-next for v2.

> I don't think this series was sent properly, I tried
> `b4 am 20261002074551.318789-1-physicalmtea@gmail.com` without success
> and also looking at
> https://lore.kernel.org/virtualization/20261002074551.318789-1-physicalmtea@gmail.com/
> I can't see the full series, please check your workflow.
>

Sorry for the broken thread. I will fix the git-send-email setup for v2.

> Also, is this for vsock core or just virtio-vsock? if it's just
> virtio-vsock transports, please use "vsock/virtio" prefix.
>
>

It is for virtio-vsock. Will use the "vsock/virtio:" prefix.

> >
> >Patch 1: separate socket lookup from locked packet processing.
> >
> >Patch 2: keep one socket lock across a bounded run of established
> >STREAM/RW packets for the same native socket.
> >
> >Patch 3: reuse the locked socket for later packets with the same
> >address tuple.
> >
> >Patch 4: coalesce default write-space notifications while that
> >lock is held.
> >
> >Patch 5: defer the default readable callback until after the batch
> >unlocks. Custom callbacks retain per-packet notification behavior.
> >
> >Performance:
> >
> >Tested on single-stream AF_VSOCK (1 reader on Guest CPU0, virtio-vsock IRQ
> >on Guest CPU1, fresh QEMU guest per state, 16 balanced AB/BA pairs per
> >payload).
>
> What the host is using? vhost-vsock?
>

Yes, vhost-vsock.

> >
> >End-to-end RX throughput (64K receiver buffer, SO_RCVLOWAT=1):
> >
> >  payload  baseline RX (G/s)  PATCH RX (G/s)  throughput change (95% CI)
>
> What G is? Gbit? Gbytes?
>

Gbit/s. Will fix the table headers.

> >  256B     0.5722             1.0286          +79.76% [+75.40%, +84.23%]
> >  512B     1.1464             1.9779          +72.53% [+69.50%, +75.63%]
> >  1K       2.2714             3.6368          +60.12% [+56.92%, +63.37%]
> >  4K       3.9095             7.7160          +97.37% [+92.09%, +102.79%]
>
> Why stop to 4k?
>

Stopped at 4K because the throughput gains were steadily increasing.
Will test up to 64K and include the results in v2.

> >
> >Fixed-syscall stress test (receiver buffer = sender write size; RX in G/s):
> >
> >  payload baseline RX PATCH RX throughput change (95% CI) recv() base/patch
> >  256B     0.2885       0.6737    +133.50% [+123.58%, +143.86%]  1048577/1048577
> >  512B     0.5631       1.2091    +114.71% [+104.97%, +124.92%]  1048577/1048577
> >  1K       1.5361       2.9678    +93.20% [+80.15%, +107.20%]     1048577/1048577
> >  4K       2.8378       6.1878    +118.05% [+109.15%, +127.33%]  538802/525645
> >
> >Request-response latency (Ping-Pong RTT, 10,000 requests):
>
> What tool did you used for both throughput and latency?
>

Throughput: tools/testing/vsock/vsock_perf
Latency: custom userspace ping-pong RTT tool (CLOCK_MONOTONIC).
Will document both in the cover letter.

> >
> >  payload  baseline mean RTT (us)  PATCH mean RTT (us)  change (95% CI)
> >  256B     126.968                124.541              -1.91% [-3.35%, -0.45%]
> >  4K       130.362                126.664              -2.84% [-5.12%, -0.50%]
>
> Whys only this payload cases? For latency we should use even try small
> payloads IMO like 64 bytes.
>

Thanks for the suggestion. I'll add a 64B payload test for latency in v2.

> Thanks,
> Stefano
>
> >
> >Diagnostic Guest CPU1 system-wide cycles (fixed-64K receiver, with perf):
> >
> >  Buffer size  baseline cycles/B  PATCH cycles/B  cycles change (95% CI)
> >  256B     15.287            13.630          -10.84% [-12.51%, -9.14%]
> >  512B      7.306             6.611           -9.51% [-10.92%, -8.08%]
> >  1K        3.811             3.458           -9.25% [-10.96%, -7.50%]
> >  4K        1.850             1.669           -9.75% [-11.78%, -7.67%]
> >
> >Jia Jia (5):
> >  vsock: split socket lookup from locked RX processing
> >  vsock: amortize RX socket locking for stream packets
> >  vsock: reuse same-flow socket lookup in RX batches
> >  vsock: coalesce RX write-space notifications in lock batches
> >  vsock: defer RX readable notifications until batch unlock
> >
> > include/linux/virtio_vsock.h            |  14 ++
> > include/net/af_vsock.h                  |   3 +
> > net/vmw_vsock/af_vsock.c                |   2 +
> > net/vmw_vsock/virtio_transport.c        |  48 ++++-
> > net/vmw_vsock/virtio_transport_common.c | 341 +++++++++++++++++++++++++++-----
> > 5 files changed, 357 insertions(+), 51 deletions(-)
> >
> >base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
> >--
> >2.53.0
> >
>
