Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098260;
	b=Qie2zIG66zRuhcrNs49Nf9zFTcOF+Cm3Uw+fis3c2euoXC38VfwAlf/qoFkV9LY4aDyc
	 AUeSVyD0cuORZf5QGqLkuqblUKNeDKhG+Ulfe9LKTyMHhV194hh4SmIBCOR3TZkYXV4nc
	 Mt5Q50p3URLTXOXK9htVivEbHdppz8Xyfqwc+D3l7LqGTVfdPbwf3RtOwWap4MrPEu/xW
	 mWksbozMKIZjTzguXvUV7yNGAc0QIwR9WlWqQn2Hq3HExJzeNP5FjliwTfNR/zj9JZK+T
	 ho99FHSLia2k+9LtLtSQcgtaja4mr30eIZN3jiqjxNqMRrMJp8rq2SOaLU3dP+m4gNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098260;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
	b=oh0caeW2W1RKGoNTMwTa9mIxu1FKMKyUPyd81pu2UjQ3tGO+dFR2aCZwd27wIyXjXpc7
	 zi+sD83DmIrzAaOpE7SidS2Uf0HrIrX4Tz1xPWoLx5LWRACDAUGGGc7Rgc4ufXyzDAlu+
	 f9DbBPMzA949NG9CDBqDbAZMkDr0CladTVUmps95ozM0fVGlKL8qyL45ju45DsenEgqzK
	 fvRKwhYupxLKVLAikJREdSIVO0P4/2Md7MoPbkW/ANiCRsK6qmmvGrRYvAVT96beaZGNK
	 ZSh6ZhgX3+Yat4MaDVyM1JoBh1Nc2Hd1LOPfRuCswVoXUMUhjeFjIH/uFHx6mRvcazA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1x1oHvK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KMCg6sd2;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B61F8606C270
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 10:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B61F8606C270
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=M1x1oHvK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=KMCg6sd2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793098258;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
	b=M1x1oHvKdnIBq4GixcEKqPW5wmqA56zOuot9Vo2rL1/70Zw2XR6Wspg0SKXsmPXLQ3DKIt
	TdGEDVhJF44YAD0FFygcP/UJwLt2xhCkJHTQK6ZX5g+OridUn4hCMZGKXhz6qnkm8wu16V
	t3JvkVa3wwfCZJEGJ7FBOgL2oTgJotM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-663-JX17qlNSN9Ca89zEAz-a1Q-1; Tue, 27 Oct 2026 06:50:57 -0400
X-MC-Unique: JX17qlNSN9Ca89zEAz-a1Q-1
X-Mimecast-MFC-AGG-ID: JX17qlNSN9Ca89zEAz-a1Q_1793098256
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a0284121c6so37282435e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 03:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793098256; x=1793703056; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
        b=KMCg6sd2uzfr06Cf8EuzBU1QcQUFyPlvIcgI/ErwXC64VTS6z9rkR6S4PUYCAru+C9
         HdLiYh8kRatzLDeyZZ2coe/SN3qvkHBdRN3bUueHXy4Do8aKeTCVHlQ54CJSjFoTSmK3
         QCLqGpDiuTGE8vc7CpK+qeW+sG8vBECGqAyWs7DG4u+RtQoBjwQANpCAmwu6NARfgd6i
         60fwOHGrnz9LOJPgazOFwGl64rZi3l12JxprNhZqRmNJ50CoN60gGmv8hXENz8OCOX1B
         cUza4xPV/rXSvNnfTIiFl6kTQmNQLDRo4Qo8FAJoHb+LMTklJyqH8tAsXrF+Co5lIazV
         sH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098256; x=1793703056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AwIRDSVIZlaoTPRqqTyp6BwANPNi3GUs2aLH5r38dzI=;
        b=cmZeioY7aSqTvh3gfoKGoo4xJXid3Rw3Ds84KQWSXNzNMypkA70m1k13nNCC++sTzI
         FYW0wSzXgUehRkP7qnuT3GpuVa07IWHqJYmM3JrjHP+GC0n0NQFhTqGvagcOYtjBSH4z
         RER65qu29bNXgqZgKVVTsWEEYJL90UTdi8wCTz+f7uhUo4AZKVJpBEa9KJZfDu1wEQBR
         6eixlPQjdu6jQB5uoJXB8Abccpn8pDMhO8AtMP/0c4afCROrg5zNk89s462MAJWDfbt+
         VWtc67glqyk13fgY7CfTK/JRlLfQ+cfYZdHksO4mFs/cHkZkqtURrF5Z7RDf1raOLPUe
         O/vQ==
X-Forwarded-Encrypted: i=1; AKwUvBxcmR34qwXt228v9Fy8SjsmdaM/BnzvtoL1cn+dAH3W6AwLaBvtUtXHcuxuGRdRJyPh28HTVncEtn06smQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLJKf0c0ccymyfKDkM5388agsPSJM3iRWcoULvBSl/3+OzAQ9eu
	2kNzt4eAeUEjgieIRONf6pejJGYoCMZVMCbZqcKVoGr4pWB9JLI+taraBMP9kV9y0iJML2588Vg
	7j7Tfd90/LBFq8I4yR0ivYR/SBqrBAyhQF0Pcss0TAxkZx2US2qYPJqMx7dPAGFlwcA==
X-Gm-Gg: AYBFou0gcbOwJLXkQw5I5F9IPxISal2xmoWyhuf1sP4EjGfHeAcvoqpzugGwp+ToMBW
	bMvfa55zxhxuZcgF505iQXZhbLq4EveN5k4nBWSqPTOx3jBtwOT9IZMVySDXqRnKzDiGi2QxLDK
	gGDFmsMurAF2TwSOnf7NBKtxvGFux/Ch82MTSxy6bgum5aiz4YWmd9BGZb76DiQoXfL6Oxvbh4J
	aVy046NYsL/8LO67xNV5FmuOhObyaLcmCLJ8Bgfm3EgpYIl7B6AuVxuJafYtrkk0BkPhmtTD7xI
	cnOuLBpBdEFAfrpCXBC/L4mVbJO5o+mHDCDx8LjEYTXcujhyhYEQBoOwcFyIUyAHRnI=
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr178192175e9.8.1793098255901;
        Tue, 27 Oct 2026 03:50:55 -0700 (PDT)
X-Received: by 2002:a05:600c:4e0e:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4a35ac9d227mr178191625e9.8.1793098255318;
        Tue, 27 Oct 2026 03:50:55 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm171269355e9.3.2026.10.27.03.50.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:54 -0700 (PDT)
Date: Tue, 27 Oct 2026 06:50:51 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Francesco Valla <francesco@valla.it>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haixu Cui <quic_haixcui@quicinc.com>,
	Jason Wang <jasowangio@gmail.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, virtualization@lists.linux.dev
Subject: Re: [PATCH v2 0/2] Add devicetree bindings for spi-virtio
Message-ID: <20261027065001-mutt-send-email-mst@kernel.org>
References: <20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it>
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
In-Reply-To: <20261027-spi-virtio-bindings-v2-0-67927b24b9d4@valla.it>

On Tue, Oct 27, 2026 at 08:26:32AM +0100, Francesco Valla wrote:
> When a virtio transport exposes a non-discoverable bus, the devicetree
> can be used to declare its child devices (if any) and/or other
> properties. To allow for that, the virtio framework searches for a node
> with a suitable compatible in virtio_device_of_init() when registering
> a device [1]; such compatible takes the form "virtio,deviceXX", where
> XX is the hexadecimal representation of the virtio device ID as defined
> by the virtio specification.
> 
> This patchset thus does not introduce a new functionality, but allows
> proper validation of nodes tied to spi-virtio devices, aligning SPI to
> what is already being done for e.g. I2C and GPIO virtio devices.
> It was sent initially as part of a different patchset [2], but since it
> complements a functionality that is de-facto already there and is useful
> beyond that specific use case it was sent separately (also following the
> maintainer's feedback there to separate it from remoteproc-specific
> changes).
> 
> This was tested both with virtio-mmio using qemu-system-aarch64 and with
> remoteproc-virtio with a Zephyr backend (with relevant remoteproc-virtio
> parts still not not upstreamed - see [2]).
> 
> I added myself as reviewer for the spi-virtio driver to be CC'd on any
> patch involving the new bindings.
> 
> Thank you!
> 
> Regards,
> Francesco
> 
> [1] https://elixir.bootlin.com/linux/v7.2.8/source/drivers/virtio/virtio.c#L488
> [2] https://lore.kernel.org/linux-remoteproc/20260916-remoteproc_virtio_map-v1-0-dac8c5eb4aa9@valla.it/
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---

I hope this can be merged through the devicetree maintainers,
I have no idea.
MAINTAINERS changes needs an ack from existing maintainers, of
course.

> Changes in v2:
> - Expanded the commit message to better explain the functionality and
>   the chosen compatible.
> - Redundant pieces dropped from bindings.
> - Link to v1: https://patch.msgid.link/20260929-spi-virtio-bindings-v1-0-6a0eef3213b3@valla.it
> 
> To: Haixu Cui <quic_haixcui@quicinc.com>
> To: Francesco Valla <francesco@valla.it>
> To: Mark Brown <broonie@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: virtualization@lists.linux.dev
> Cc: linux-spi@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Francesco Valla (2):
>       dt-bindings: spi: add spi-virtio
>       MAINTAINERS: add Francesco as spi-virtio reviewer
> 
>  .../devicetree/bindings/spi/spi-virtio.yaml        | 46 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  2 files changed, 48 insertions(+)
> ---
> base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
> change-id: 20260927-spi-virtio-bindings-f4e350b2709a
> 
> Best regards,
> --  
> Francesco Valla <francesco@valla.it>

