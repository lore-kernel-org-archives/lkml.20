Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B0C3624BC
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196115; cv=none; b=SYxa45CaAV+3XEXAuwhJaC9B15dsdHNgpmnKBE7bt4/OKqt0KjoET927P/pZ0BwWjWIrJR3aai8lknQY3KRppT2JQ1lFLssiOSR+CTuo2NlfLFsJnb2ta0FQeoM7Qz/L1rJusBaXn7DwFdC2PdiZeJvLbp6RN4l5kFOaSuDyvts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196115; c=relaxed/simple;
	bh=8EB250JlF6h4Nml+6sYEobeY/gwdRlUb4QTBCsN0GJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=idP6IjUzmLJKArzqo0D3Oby8o2ldTkJ73O59k/ZZeHVoH8cBvpfKhPOTOgVyWw7xJr1o7TgkVGd0/sET8vfvyCQ5Rq76uvI+Kpd2R0U2MenCI8i08WF6MqehmYzIN26E6doIgK+8z0NFFN6+H8PtwbXIoOxZv+wBOBc2f1yOIGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acFhQ09y; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acFhQ09y"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so2278805e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 23:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789196112; x=1789800912; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8EB250JlF6h4Nml+6sYEobeY/gwdRlUb4QTBCsN0GJs=;
        b=acFhQ09yM6XEmfXhcn8vAvRM85UYqu4WMM3Fbkpe1pSFvF5aaGBVZlM5RZnVDek/b8
         0tlIvFoKchW7vVnAMlmxo8Oiqb1Zsu0iQSUfACwxuHzYqRmrBWSef3JwsHQivo0m+gGV
         NBgngNgLJyT+diQiaLIo+Eqzv6gzl8TaQvZ/PAqhuC7e4WSVJdUml7C6xMOZD3uo++jy
         ebHpPqKZEyq84+Tcmh1AJqEaUnsm0pyI5jWTJwdwgaHwI6Ad2hOTXVceBdQuMocw09VV
         tEF1jYoplIvT/2MwUO2fXJjCAHj0T+K5jIPDux9E75AroH2ImekXurusABR+0BsBR6zq
         QLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789196112; x=1789800912;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8EB250JlF6h4Nml+6sYEobeY/gwdRlUb4QTBCsN0GJs=;
        b=sHso2D7dFKTuM9kLz5OyFt98lkCsEXIclhOKwfeBqZr6Kn7+Y2x9oOkLrPrAYw0azA
         cBTE4Vvqn/WWjIUO9JSdTGdiC39uI9ycYtn9fg9m58AKB3C5bqZRLaMTU9PQ/vqYLG+E
         aSJq4EkCrXmyMxP7OyVzWQG2hfXV+Hk0NYA3lgBT14pq79bACuzDelh9+neGt97gXzIW
         WCIk27y7Qh+hPwnjkHdD052TLc1C+UikZUM0lLzlKpvraRG8h5yfLjVvquPYDbrKnrOm
         iqTUMxRwi4r4RZ3WzyX7D58/bZkk7woZkpAb4KkET+Bw1W0QJeEc7Gy8UnkbPuN4FWYW
         MDaw==
X-Forwarded-Encrypted: i=1; AKwUvByIiz0BGMP8Dp+iEQGvgauzEj9pIFoMZmx41jtz9LYmfRMLMMeZhEv3kJynkH+ham4BTAb97+8OS7/R3t8=@vger.kernel.org
X-Gm-Message-State: AFuF++nFBNFOLE8OLAuNHG+NhyOVi8Q2TxhxRaswmq0vtnmaOnJ0pBOE
	QShbTnqM8tckvDeP+bBqgMehG1cMhtTFWp2E/o2Ur84S6e4Wgv5JYF4t
X-Gm-Gg: AYBFou151SpiadBzTiTGxJbMBnVVYFKATgtqA63EyO9Q1nO2yYiaYRw0y66abRBoQlV
	oA+Op52GhaurCw/g2qwzwcWOl1r1B0JthlA6AwVpneOdLCatJ4ZKDDKyFH8iYGDy1iWPNlTLkSQ
	3xeoDGtm72Uvc018UTPwphYG2+0dpFd/ntC3ugC+7pwFHlOJ7oqQv0FKXU3zvq8VGbfp45DkGqZ
	qnIbuV9mmmAyX+5i9CoWoTCqHpiFVvaLaITHDmZuFlI4CvPeNEC1DunDU8wwoXTHsu7thaN9GRu
	7U8vE1+yUDHShvM3NnhxH7iuVj1srGljCnNRMKAze77g4mDAbhlRzkN/to5CPiRif7CO0qKZquf
	HdEDzU0vtZLBti/3gdj6h3/VM+1vM9ws6Jw477Czpe0WlDO7RUF7PVVLawrdmBLg8nWxkTdaw77
	fL+ECkUeGh4jaYiQvIuE30UwrfrUYzmLHR5oTCLFJfny4UFGAXeu0lk9q3npzFZqlLD8of4a9Rg
	Aqvn9X9EQ0940ezTM4fGdcg2rrez8Cd8zlC8W3FrNemDYa6q3YCvSkHH7GRaOILiquyKkpsBNT3
	NLaAyP1ZRBrgxsDuBUMbZfGOIvbOI4UCnjskpTnNg7nS2VhQLXxra2dg9Bvxtf/v6X26+Zo/JH7
	uGDbXLZ3ujvA=
X-Received: by 2002:a05:600c:3492:b0:49c:fa21:1c8c with SMTP id 5b1f17b1804b1-49e6cc233aemr12337045e9.33.1789196111526;
        Fri, 11 Sep 2026 23:55:11 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-b260-f201-9983-e8c4-aff5-7a36.310.pool.telefonica.de. [2a02:3100:b260:f201:9983:e8c4:aff5:7a36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6576122bsm145786115e9.2.2026.09.11.23.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 23:55:11 -0700 (PDT)
Date: Sat, 12 Sep 2026 08:55:08 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Robin Murphy <robin.murphy@arm.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>, 
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] ARM: dma-mapping: flush FROM_DEVICE buffers on
 legacy backends
Message-ID: <aqT2kBGIQJLWEqkf@gmail.com>
References: <20260910063620.17768-1-kmehltretter@gmail.com>
 <20260910063620.17768-3-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260910063620.17768-3-kmehltretter@gmail.com>

On Thu, Sep 10, 2026 at 08:36:20AM +0100, Karl Mehltretter wrote:
> The legacy write-back cache backends invalidate DMA_FROM_DEVICE buffers
> when ownership passes to the device. A plain invalidate can discard dirty
> CPU cache lines. If the device writes only part of the buffer, untouched
> bytes can expose memory contents older than those present at the handoff.

Sashiko flagged unused *_dma_inv_range helpers in its dashboard review
of this patch [1].

I can remove the unused invalidate helpers in a separate cleanup patch in
v2.

[1] https://sashiko.dev/#/patchset/20260910063620.17768-1-kmehltretter@gmail.com

Thanks,
Karl
