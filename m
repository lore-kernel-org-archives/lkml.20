Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010473;
	b=lRYoFfn8WI39XpKRSyhKqX19RpdfZ6LM7nqH9IcqBMJnN2sS8KV1fcun9+eDpiPIKtwS
	 A3CiVA+wdmb1Anonbf4YiNC26HtJvXg6J9RwO2dvv1YbRWwPJM7kxwMiLd1YmjK54bEaX
	 hd7Up5fQFJUmP2tqmRx6Bk8AUrWNsbn8x8rrGCUUyLURhW7BxerL3FJgLI96cjT7xgVy6
	 ljGmK7r38VvA4ppF61praMshef0t+XXRE9iEoSIlUrJuudNSHkTUmS8hWoRHD1nPge8vW
	 BHFflIbmqvCr7tJd/YrPvRh+4hvUJEdKWcUqxrxLpMX7HGeFpDDlfep+G76zzmpcQKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010473;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
	b=tsmJXQ1CAdtZBhA8Zt2uJg7nQxW6m9V+8hLgDhlV9rrj+s/QAFhoAWd/lHie4GgSsVI2
	 pdtCIEBfQ6oiphR4hkQ2Hn3oW4VNlb5a7qzYLYXwXEH1W1p51TRW85dCqVr1EPxJq9sr8
	 9xxfSyUhqQaSLd08tzktfUGfl1Hh3UiZZ/jC/zCea3PnwWAiP5fgpeTCNV1dKnGcj4tA9
	 aatbkowj/KCXQscjLhZlnIb24aRa4jrb+xhKYvLNGPtXs+Q4J31aUuRiIdvo+mEtHVMIB
	 DmkzbCEzZUaRAXp0W6MqVHr48bJEVGQMXPwZdJzXXrvdNPuRQ1+LY17Knq2oGfFFceA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Khda7wlK;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sRiZt3m1;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4930606A320
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 10:27:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4930606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Khda7wlK;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=sRiZt3m1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793010471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
	b=Khda7wlKgBX1HquEHaj8T+sZqOpGHk5kuuw7ZHI2WFLxo5xOpHzBax3m7mEopkaEw3q314
	8+/WISFV3ROJyc/1GXSleRn8TNHJ4QEBWqylZne/hPKkFpAARDFwOFXTAXMO1r19zCKgQw
	GZBr7Vc2zLOwN0Luk8M42HpXqx8Md/s=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-O31KZMBwPvSZQW-tHZCHWw-1; Mon, 26 Oct 2026 06:27:50 -0400
X-MC-Unique: O31KZMBwPvSZQW-tHZCHWw-1
X-Mimecast-MFC-AGG-ID: O31KZMBwPvSZQW-tHZCHWw_1793010469
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so2517102f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1793010469; x=1793615269; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
        b=sRiZt3m11RfvggKftBaVvpS+01UETYAGyxYbWp73pAV7ua7Ps5NFUlEM4a3wXHp/I9
         Gopn4ncvcFP98lxb/IH+C8XyGBE+KpOAPDHUud2MBaCI7PKtVB17+iKp6qhqIIlNNZyW
         OpDCp3yWbtc+wav91MW6LdJLGHmlHzzAwGtz0lIVlZ8saptgEONYa+58D/0QKEotNl+d
         R1EaH+lYSglh+Wa3dnLIbrT7+eBQKFXpgzMOJ1hMQol0V+rTTGNuiuo6JrBZHeWal36y
         +ap3YVyna9gyYGJULDYNIRwhEZwjnGKt/iiWQOwQYIaKvJ6PqKAEg40IUIQhYyk7RTxZ
         C6rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010469; x=1793615269;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bh0VMe2Rmm+7gUOYc0+0D8DAZImYcthIyBuGozvhEwo=;
        b=VhVaPF03K2vry57OMMdtiRbhOd4PN5V21ViAXPcSdtENwowl5lSsJ/nVSVQKdAkKi9
         X5+hzNFMQ9hMtJb7zElCOWtKBK62LcyCAA/ZIYuORPKLU/LAfNdK/TDE5OfxM9wqJkW9
         93SiQGS55YRD6FKjNwIFYJXhPWBACrchqvSOz27BvMp1q8mTJEr29kxlDV6p93Z6YT3I
         dEN4oSd3fQgEkNbxoREZXOQQooiz7vgsXIQhoEEOe+hl3uTcLhIpRUXT1Sa/DiJxtGNA
         ktEz6OF6TMup0tMrFywhL0s3w0+Z94J0qlY3vpBJ/0nNvP+2HTsafp0VjU1RiqjuEp9G
         yEAw==
X-Forwarded-Encrypted: i=1; AKwUvByQsKFIlDn+0uxrwKN6KLhYGmRIXNt7ivSYIexKfUNAgpXvEleVpJV6qpmhZl2VepaUbJNI6sBgf+BHgBU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKgzD7ENjGjUTjtHY1QBAeSdBTSmO9jAi8J3t5fCgDaD3E5nP0V
	1cBxYru4qumq9WhaI+XTxgRKRIN3T3c4vZTenUGPNcdOU95JCetBxgM3ZVGOhgHaIc828zSDDtJ
	XF9/X/FTco73AdN92xhJSVGYNHbgQrc4LQtTv6MWnXM8pxAKsYcBSCmd5n5BbWIpMtg==
X-Gm-Gg: AYBFou388yNl7kgTf1hdvWFgkFB9Pk6MVpEiuGdOpTLNGv1AspFjw4XsV8V6rhFYoFa
	Z+hOIBO2U4HaBMpDQdc46AJx9SnuZg1vuytHGKaqNqkdMawxqrInab5m/nOCTXzMdUmZD4Ut5Vz
	xUtNnJY7J11LRV45fMfPTn4lpY7NUpMieKIrbDHIQ6wfyZvzCErhLe90GccZDOkGX1OhSX/sqi2
	gMNDlHdqLKewzVeG737EnrfvR64XIiV3faSv9rMW4nAPkMSuxXFQIH+BYv574VWV74YXhgW3FKV
	SLv1Y/cYids0mF05PQhrM+JI1Htx6cCeVTbwBCfZ3SGNnsM4pAyO+wAh2B6h7gs73zY=
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr11919760f8f.0.1793010468991;
        Mon, 26 Oct 2026 03:27:48 -0700 (PDT)
X-Received: by 2002:a05:6000:220a:b0:48e:20ed:27f9 with SMTP id ffacd0b85a97d-48e3eac10b1mr11919670f8f.0.1793010468317;
        Mon, 26 Oct 2026 03:27:48 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecde7easm15899811f8f.52.2026.10.26.03.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:27:47 -0700 (PDT)
Date: Mon, 26 Oct 2026 06:27:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Philipp Stanner <phasta@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Flemin Jose <flemin.jose@oss.qualcomm.com>,
	Mahadevan P <mahap@oss.qualcomm.com>,
	virtualization@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH v2 18/23] virtio: Add Qualcomm Platform Services Firmware
 Interface ID
Message-ID: <20261026062229-mutt-send-email-mst@kernel.org>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-18-7cf014efdee1@oss.qualcomm.com>

On Mon, Oct 26, 2026 at 11:51:28AM +0530, Jayant Shekhar wrote:
> The Qualcomm Platform Services Firmware Interface (QPSFI) is exposed
> as a VirtIO device with device ID 52. Define VIRTIO_ID_QPSFI in the
> common VirtIO ID header so transport and function drivers use the
> shared identifier.
> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  include/uapi/linux/virtio_ids.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/uapi/linux/virtio_ids.h b/include/uapi/linux/virtio_ids.h
> index f9056af0c622..6c6f283733b1 100644
> --- a/include/uapi/linux/virtio_ids.h
> +++ b/include/uapi/linux/virtio_ids.h
> @@ -70,6 +70,7 @@
>  #define VIRTIO_ID_GPIO			41 /* virtio gpio */
>  #define VIRTIO_ID_SPI			45 /* virtio spi */
>  #define VIRTIO_ID_MEDIA			48 /* virtio media */
> +#define VIRTIO_ID_QPSFI			52 /* Qualcomm Platform Services Firmware Interface */
>  
>  /*
>   * Virtio Transitional IDs

virtio IDs are allocated through the virtio TC.


Reserving this spcific one as a generic VIRTIO_ID_VENDOR is now under
discussion on the virtio-comments mailing list:

https://lore.kernel.org/all/20261022091645-mutt-send-email-mst@kernel.org/

Please
- switch your driver to use that + qualcomm vendor id +
  validating the device through the DT
- do not merge this yet, before the virtio TC has reserved the
  device ID.



> -- 
> 2.43.0

