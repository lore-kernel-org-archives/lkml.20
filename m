Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794660888;
	b=YH1+fI4NNBpUl255gEQnpDmA3KjW21vQq23flWLAXjDBntywKY7p48b4yCsvN3Ozv1YY
	 YoFYs7NOO3V4xhLAqzqgpMVnuIj7UVV4JefuHd3XFYiFwPhALpiP7HiOoFWxDpCMdeMUX
	 Rn9VAu4dNF3yGTt2xrRkpELHgRxXKmIJaCQ190bwQqMeikusATwEFZMFMvvm/r9h7AbGG
	 oNsIDOIKWgU7rHCcZbxQfM9vE73Hjg+Ccr8PS8DbsEAUwKARGuASGbUkSZ7sh9hXPjDzn
	 Ivnu7eWDeWdF2wU+m6ofJXKKp6ATZGPGs0OkgPS0imPKzbDY/dvsOAvYxb7luXIJFnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794660888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
	b=m3aT/na04qvKcdbIFEsxdayMEH7gkIk9Zan0nEMlZoxFLfTxGbt+kEOhSBhKDE/qVLBX
	 ilUZD9W52S6ZId19Twi6qggaqmYaxhICJS5M1C92wxvm4s4mxdIZtJ0NzN+EN3kYpILXm
	 Hyn3FRkKPjrbmi/19WtkbMzbzwjMz0Ibotdypa/jU3AqIqujfwE0Z8ag9GpqcOvOPAEa6
	 hIpTcKqvi34gwS5RLez08EQFf1IbYpemNapIB+V/NpS2NBq1HPzNBDNsR+2+n/iTWaciD
	 59aoPW1agph/swHT3/Fngxuw5P9zh4pn/ZuO0h0u5n6GouaJNPV7Dc1p6GAZYSh4Pmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=furiosa.ai;
	spf=none smtp.mailfrom=furiosa.ai;
	dkim=pass header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=dkAxV1i1;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A826E606A323
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 12:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A826E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=furiosa.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=furiosa.ai header.i=@furiosa.ai header.a=rsa-sha256 header.s=google header.b=dkAxV1i1
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1a8cc11ac42so1756510c88.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 04:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=furiosa.ai; s=google; t=1794660887; x=1795265687; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
        b=dkAxV1i1akrX9/iclASyqOcS7hHX+zkUiZgtkaofoh/kUhm/eu0SPxn5wiFBiGK7Xi
         ZYBxOFfa42CM+EoxzQBF0yfyWPCPJbV40XW9Iohb5vEEav6UxAMpyR+0OW8rsB8qtGtx
         ZepN02yz7bQqdeptFJ6J8U/THVphPzbhr48eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794660887; x=1795265687;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kzZ572SYqNYS7AFbKEhSpyO0POmges/XmCJlcN/iV2Y=;
        b=fh9jrd9mFwOw5p03EUvhXir/s7elkeSzsyQZHtZZQPB+Y/DoALMuk2HdHWTEISGKbJ
         Adt5D/iXiR1Clxab0kNULTkyZ6EmHNxORyAaCTIgCUy6Blo2O1iTdY44P9KMqzV6MLtz
         FMVy1qtHETS4jom4irXLswWW09T/bazX5n0W3s5nYSb14NqIud0G1u334fA8rIOi0lG4
         RQcOKVvuU58KJEYINaVQXVix39pgeBXK0yKh/sjHXDR8SX3+5VxK0d1EHt4K0dHEpQIW
         rKjiOyEg6ynDNUHJIKdTtnrhgrPlYRocgHv2Z/OT47abRNBuQ7vkZvAhlVFkN8VPVTHH
         KKPQ==
X-Forwarded-Encrypted: i=1; AL+hErFNCW39nHFAl0lUtb7XGkW7l6mn6V8N1mJgcFaawVl1WBG7b779r/x9JrG2OWc/lP3m16FZB3UQuYchhRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xM+TI9P4ffohbK3HD8CjthZyAaJog8CQrRe17gnIGJtUNYQRw
	0JZy0NjX2Se8zQfA/4zXZ1cXPc2ZMMxTO8HBStkm0FF3E1DLrTovzz1uRhHsE+u8w7w=
X-Gm-Gg: AYBFou36cngS6PpO0uI1xSvQK0BSuzRJkkc0+p/1UTsHWb8lRfWEo6f/Dx72VjWBBXq
	4D7b20YTpZUYvdLCittJHdASsrGvwL7PzSqDMMMokc03pCr95G43B5vIC9B/Rrgn4fXPMcKHyh2
	aLrJcGSaA8hUyjyK9D4glfl6QjF1sWerW5Ok9iz2PRrDmJi1CPlR4lQInN724ry8J2KVJQTo9ah
	O+GqhNnZFDpdSO6T0ZDrtGeFZvqG8Ay5+IjS82x7gxSK0KGiI2voEnhpZUsVgtvVHgoaMJ/fozW
	ydpcAXnvUUwGzpCBmrGlxHpML1CxLGp6TUbos7uHSv8W1R/93AA1ddltS4RGdkXX6YAIQRn21ni
	XAfkjfE93CV6rQGSbPAzUpWepqmfbVN6PmKWoXjtgEuVy4kHTT4IhlpigAtaCyZ3TImffHm3J0Z
	c8NWPYsdMNjUdKIX3eRENr+rkbVtJCNXHKamMlkqBcJUNE8p3yDK+lYNUX+B1+JT0beDlgnomIX
	r93D+JFmRwFJetMhIvYuNKdlY6YWn0uUPzCCPZTLvXImRiY4GyPES5GBVYDmamS5WJQkklODWFt
	GH17ej6mjN7OU7mVKrIPaJocp5kF9iKKZedoogKQU8CMSgCRWs+vxyRPR+FQ2GQxD39P2HiYRnH
	KgSjxshdDS5xH
X-Received: by 2002:a05:701b:2706:b0:1b2:4c54:d976 with SMTP id a92af1059eb24-1b50311d3e0mr5111198c88.31.1794660886535;
        Sat, 14 Nov 2026 04:54:46 -0800 (PST)
Received: from rock-5b-plus ([61.83.209.48])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319e381sm15468097c88.12.2026.11.14.04.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 04:54:46 -0800 (PST)
From: Sidong Yang <sidong.yang@furiosa.ai>
To: Jiaxing Hu <gahing@gahingwoo.com>
Cc: tomeu@tomeuvizoso.net,
	heiko@sntech.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	p.zabel@pengutronix.de,
	ogabbay@kernel.org,
	zhangqing@rock-chips.com,
	royalnet026@gmail.com,
	ulf.hansson@oss.qualcomm.com,
	abel.vesa@oss.qualcomm.com,
	sebastian.reichel@collabora.com,
	u.kleine-koenig@baylibre.com,
	chaoyi.chen@rock-chips.com,
	shawn.lin@rock-chips.com,
	finley.xiao@rock-chips.com,
	diederik@cknow-tech.com,
	alchark@flipper.net,
	leonard@lausen.nl,
	vlwwwwww@gmail.com,
	jeff.hugo@oss.qualcomm.com,
	rfoss@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	iommu@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v17 00/12] accel/rocket: RK3576 NPU (RKNN) enablement
Date: Sat, 14 Nov 2026 21:54:35 +0900
Message-ID: <20261114125437.9986-1-sidong.yang@furiosa.ai>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794615324.git.gahing@gahingwoo.com>
References: <cover.1794615324.git.gahing@gahingwoo.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, Nov 14, 2026 at 04:05:17PM +1300, Jiaxing Hu wrote:
> This series adds RK3576 NPU (RKNN) support to the mainline DRM rocket
> driver.

I checked the accel/rocket patches for regressions on a ROCK 5B+
(RK3588): MobileNet inference with up to 6 concurrent clients, runtime
PM cycling, core unbind/rebind, GET_PARAM (returns 1) and recovery from
93 forced job timeouts all pass, with no warnings.

For patches 2-5 and 8-10:

Tested-by: Sidong Yang <sidong.yang@furiosa.ai> # RK3588, ROCK 5B+

Thanks,
Sidong
