Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794225215;
	b=a7QGtfMARpnaPclQZV4GSPdZSYIsBubdbI6as+/5802IkzzDKAJp7Y+8BMLCH0LaP57o
	 aRV2SsdMJrfiDpla4NiSPnoqsB1xbKkZ1ObsTty/9lC49jpVviyUKjm4BoizUFQwGy+zF
	 1QENK4/NWV5hdJGHFtm0aKAsYSHgYDpQ+fDhS5ffNESL/8oZpb21yLh2405ueL6jgTVNf
	 Pm5YXqsvCfB2BTq50VDCYnmxYy8SDc0DfMRiBmqJMarosxH77/MOSQgCHl7YvLjqv5uGn
	 nN/HVIK6S6LUvzdxAjoP2yGyuW1ePz07y1THdppL6iBVdTCM+bNkPIT9V3oloHmGAHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794225215;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=;
	b=oWl84YzsO2xHfCaG78TyC/5Sf6l2Di5XylIiRuGCniArd3Uzf3MkyqOqs9VOystj2tf7
	 OZXC6zQdnkKGXyRU6LBsOM0pko4N3mIQA88h4uOGixMjreI6sMgpRnMFgquIYPSm+0MUs
	 YXfjeNdgzJuOKeMBIYQSN9U2cd4u5xPU+f2o9Ec0AfGl/lTp51/HuBYUOpcv4D7x7M+G/
	 u7KNLzXpy0DdHN8kZg89qNlg4L6QVpTzDOGS7eaR8pLdCTrPkJT//wFDYRtMvJx3uQzJJ
	 rPfOcb/o5NmCS+ORAz9dhCKoRACEkV90bL1YStYgJuwkqjW7iVP7nCz+8Vb1KD9TBoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jEHfCUgQ;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C587A606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 11:53:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C587A606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=jEHfCUgQ
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490d59c3edaso586128f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 03:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794225213; x=1794830013; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=;
        b=jEHfCUgQMWo5r2n+CTycYsldFt3YUp7U27awzwfOKZhQ237WH0Cd/Q1qOmc/n75Nei
         d3hQYJ5jSUXi+dkdtu++oK/f2ElitnbUrGN5Vq64uC6Bs5NKP4nEpomn50Rgoa1Wusle
         caMfO6nsj7QI3zSHh3+EHDVTH4FvyWv7MqiHXM0bMdD+s/UFsIHVAA8/f6+UxuZQcfsg
         nQkr68aYFrDurQkOyCFiwinV5r09ALjTyc5MDFBNd+SEPpMVcaOqOwQz/2UOA/t4WFuo
         GhDXPDYcw/fAiJrA2anQczguHb3U12PsHfq/WYLqh/F9Anv/Uee5xUz9OH3MHyJ3W+gz
         yOSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794225213; x=1794830013;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PxtdLMr3sCtCgUOp13t31p5GiwnRhTgOXL5lwbYQ+4I=;
        b=Fw7OMe44pfQZ1QUWEn5wixH0A5xZgkt/fn3a2cE7rZygoGwSRtK72A+UCo/ffW9sqx
         xsRt+gc4QS/+C8Foap4M0+1K1NpGDCaa3Bv7gmeoc4QaUUI2Dhuqz8NPLfKyhc3vaVfK
         TeWTaSMz9QGSd6ss0rfakXb5W18pLh6wniT3XQL/BdP/iHRVt7vC+4dgdXoqmzVBUWhF
         7TxABsgU/IzmobtCEZH0XMCkakJN4kZd9t2lTSMyAzKQ3ZxX9R4eE1kryAWTngQTRsBh
         0zPsoCaZYKaDzvKIeGdhtPD9/RqVhnlXNEUSvPtEE5pWbgEre+rnBbfK4DS7r2v2SYXe
         zR+A==
X-Forwarded-Encrypted: i=1; AL+hErGIVNTafuVR7Hivj/OfFtSmLbtbIP6s0zDdpSYhId6rg5eb3vmpBkVL+8gPsByPOt3TPCxeNxm+6SuIyPs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8427TWhCp4/FV5uATtWQY5/+R69ok5tGkupZmSJfEybmXiqyEj
	TKsgxic9pfBJHJntYvfGR69/EtzL9FoEJyPIi21LH5ajHFsDnv41PnQBIWLqDQ9+emo=
X-Gm-Gg: AYBFou38fUGZH4Sf8yJBbyWkdLAcyKLq9ijZx2ab6OiRR+ho9vNwrzpYhDkOZoRgMH/
	XYsUT11cGBznbHepdj52nQHvkt7er8nKqWUllUG8VBPl34LLb4Z2LfoLIKZk+z0gtiadHRQ6U7P
	hACci/YUAwQRFsLCQEC0xViB0A9fEkDuoQdDX/fGbDo8syQNwlKn6U/mdv5FP8gRnmMZrsZo9Qp
	cLIyzyuMJ+a6f0rS/se8qM6HhNMc0UZ0aacDJ8cTF2VlbYi1oNNaTqpTzhRShTvszwYlstzh5Rs
	Nk88na78daKJAxjPzdes+JRxpMPRVF1OwYXkkIo0cjN77vVcwQ99L+BBU3HBHdjk8xQLuzd8cRl
	7P3LZ0Xo6IJ/eLrEy5PkrgC+wvp1A2EsHoDx1BHy7ITE91Lugd90Ey6rmefPBK7Aii45H9H5+aW
	6PJRIVXZgOIUJgFO4M0+eTb/8KhqxfzHQPhI+X0wB6cIx9te2L3Erx9X0GJ+ew8kwQiTOcT8F9l
	89pAgwSMHYH/56op5hqyjo9KZj5JLLfuiXW/4hzCyZl0p1Y/y1M6UWYRwgwMy8DsdB+HaxrRxQR
	+LQ+/q9s6bZQaRuj8rVH0i8Yp3X3zgmzbkiAbMSK3jM=
X-Received: by 2002:a05:6000:240f:b0:48d:f160:efad with SMTP id ffacd0b85a97d-49425566d13mr14507820f8f.30.1794225213002;
        Mon, 09 Nov 2026 03:53:33 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596ea5008sm9527362f8f.26.2026.11.09.03.53.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 03:53:32 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: linux-amlogic@lists.infradead.org, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de
In-Reply-To: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
References: <20261102212843.1213021-1-martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH re-send] drm/meson: add support for higher bandwidth
 HDMI DTDs
Message-Id: <179422521194.1645559.1387055395684042369.b4-ty@b4>
Date: Mon, 09 Nov 2026 12:53:31 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2

Hi,

On Mon, 02 Nov 2026 22:28:43 +0100, Martin Blumenstingl wrote:
> There's a report from a user with a DELL U3415W monitor and a Khadas
> VIM3 stating that 3440x1440@50Hz works but 3440x1440@60Hz doesn't.
> edid-decode Detailed Timing Descriptor (DTD) extract of that mode:
>   DTD 1:  3440x1440   59.972616 Hz  43:18    88.819 kHz    319.750000 MHz
>                Hfront   80 Hsync  32 Hback   48 Hpol P
>                Vfront   28 Vsync  10 Vback    3 Vpol N
> 
> [...]

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/1] drm/meson: add support for higher bandwidth HDMI DTDs
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/a5b5f29926498782f60441298e8a5442cd6a36cb

-- 
Neil

