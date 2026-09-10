Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD08C3D6CCF
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 21:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789074396; cv=none; b=UaqSD+EDMJ8DUcF3C5mqRXPIYRkDRixEbq7XXBciwezYyV2lFQ29kQFxzmkcvyyUz13uqMeENQlbwi7t2DvZnHgPTJs5hYofxzSIh6Yel0t0Tf8HGEXDFskwFAV87pg4rfZcIP7L+DJvvFNjRr1y8RMUjgahQIKlXy99KA7ES1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789074396; c=relaxed/simple;
	bh=VDPrQ6rvANCWQzB4x8X9HLIRs4IEDTr08YDsjMGRXIg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iRbz9kGnYQaVLTTVJqXIGnHUv7k6gsIFwF/+Sdyy2tm8YuaLfyY1J4CLosUcYFfkOeUoLLk4yMfLsPwciJukdJr/e4Wx2JnafaDQTJErwZCIqW+0NxIT3WbL9KxZR97oxHrX4t+6y3JwdX6H7uMhl2/Jr8uzZyegQ9vfqB1Iiz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6aqQpKs; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6aqQpKs"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-486955ae01eso223579f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789074391; x=1789679191; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=;
        b=j6aqQpKsy7MMVuX8kcnqQOgvL2NBMTQWYj0hHNNiLniFZlL3gZBkfC4iP3vBUkeAmc
         WnazSJMLZEX6By+VyRfrB/HFQgc01SIaXqX+LVAyOxLi4aZEYpexCM8rMwH0yprfg+eR
         4/APBVyrQHtUHv6Ugh0Zt1E4Fep0Inr5EciP9bVkOpYv7hgItkA5sYVbXeGXUYz9QzgJ
         w6sqDwnBof0MdUAR0U8ffRRx3Z/7ya7ekNvD6Ih44xVY+r2P4BsQJm0KCugU5K3z0Reg
         AeQzDvymzJ+rYfBtceo5llFE0n/qtnHNMX1pB+uUOt+70crk5CENeZO/FoZXIN+B4Nsy
         ewzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789074391; x=1789679191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zC/TwPpzsaghSj/8QRD9k+IasDdKbL8GKT8smkkknMk=;
        b=fjSt2F8YHZX6vFPEUx6BjfjCIkDxDVqGK0Q0QcbnixVru9LqXbL/UIpGSgvjHuY5W/
         0vwap5II7YEZwvt+IPFK5VJKfGSqFpVQAmA4FwT3PPaDWt0lXAHh+vv5GpsP7USBkTRX
         ybbdkVreF5IAlm7lzLU/m2f+GX4bhP2iYzW6yysNWry53q71EnOuQIg3cLVPslyPEH1u
         xnxZ1EdgEmO19kSasNCQZBYbpImitEvwNAoH7g3zPwyI2oUQx46+S4qRxj2Ea+RjVzpl
         zDGX8U+wqie1ElOi5VR+9VesZCRCplGSYvMVAtwhyqc/XAUc9jeAt0oQRIwXOrYbn42Z
         3qvQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3kJ2R7QVMIpA9cJR9RZ91P7spj96f2zROqAUYcsgAZIOYdy7WoiNA8W+koGi7Mb0rzqBv3u7q8BT+9S4=@vger.kernel.org
X-Gm-Message-State: AFuF++lUUDQ09DZ0W/2TNW1vg4mk81VtGVUPFZl+YU7ROSX8wrpVPBio
	1YtjZ2B57dgtmJJAwe0Pbk8BehFEjsVaNcPtPqpAEYfdV0V3hHP+hH0=
X-Gm-Gg: AYBFou3y+sX1ASd9UYrShtJzbRkSZgFmUy0fEDKPdCjmFOqpLujfGnSEvAVyM7xwzFK
	e8TvNJYrj5eHTZj2RKVsXE78Txfs0Y+qvtI8VisWbUmzRqa8XK9DbE5+yajtmJuomeGu4VNnHEB
	OTatvVKBnUYnLj7LzUHac99xR44ouExk3N/v2dM5b+P+ZuAXvNZh9SWL7EprjG5yfLRbbMbdABC
	wjzm2R2LfBvnXBGpZIlxbkuFnKLm6IR0Pimf/+iZvdEPINt5p9Ki5xSkJA2JzEWc+/KRnUlQqHd
	Y8z3xv4nznkyflXfYBDkpPe4urPthGwd2+SIzJsp0T57Ij78XXZoBppDLuYeutE5D3OHiKBPiVG
	G7I28mSLmJXdB73gnZcLZ8d45MlC0Jm+JvvYZt+I6DDXS6FVvRajZb1h5onhLe+kz+8eCXwuXnn
	vg1+ZOunTmIVL/0cgkCofA6/jL624wDxENGQGP42k73LX5U0cByaRKNhy1VqKliLYXFYF5OsN9
X-Received: by 2002:a05:6000:2f86:b0:486:e73e:abe5 with SMTP id ffacd0b85a97d-486eb2e269amr1118040f8f.10.1789074390922;
        Thu, 10 Sep 2026 14:06:30 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb330bdcsm1196375f8f.13.2026.09.10.14.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 14:06:30 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: Re: [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Fri, 11 Sep 2026 00:06:21 +0100
Message-ID: <20260910230621.730983-1-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260903173355.62780188@kicinski-fedora-PF5CM1Y0>
References: <cover.1788286284.git.sochnev.v.74@gmail.com> <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com> <20260903173355.62780188@kicinski-fedora-PF5CM1Y0>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Since you're not sure you should probably add a timer to retry
> later? Maybe the IRQ is not needed at all, you could just check 
> on allocation failure if the right is completely drained or have 
> a periodic task a'la fbnic_napi_depletion_check()

No timer either: the depletion path is not the one being hit. Please drop
this patch.

Instrumented builds logged zero NO_CPU_DSCP events across every run, with
REG_INT_ENABLE(bank0, 1) reading 0x839F839F, so the bit was unmasked for
ring 4. page_pool_dev_alloc_frag() never failed and q->queued never
reached zero, so the ring never enters the state this patch handles.
Images with and without it stalled identically.

The stall was RX rings smaller than 32 descriptors, fixed by 2/2 of this
series, e84b89f17a12 ("net: airoha: grow the small RX rings"). Details in
my report on the cover thread.

airoha_irq_handler() does discard the NO_CPU_DSCP bits, so handling them
may still be right, but I have no measurement showing it matters and will
not claim one.
