Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557847;
	b=Nt9lwGWr4LHjpbD0Nbg74flmUpRekNmJbQtDu38ksjZNOVQZKI15BYg+krM2RZKiX2+U
	 rY4O6G+Hbq1js3rG5PSUYOXVHK5s0ysccr8jPCsYIcbHXAsj76oGg3B0AL+4Ku/IUEK4W
	 ShijKEM7+RP1u1v+gaz2rGtfWnCj3y8DSvmIYF4m2raJgeFO2Vtxlhj2pSjBhkNsklOJP
	 fDyZDZaOMw9TRnH5R4W/VmxNQpUT6GP50DvBeVcxX4y16tEaOgbvSSeHFd+U5NTmAgmX0
	 YvwomAlseiFpub5JPG/Q6XJ8Sq/M/FxTzeFpATzXYbi460uIZCDk0OmC2hEZBofhQ3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557847;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=i9YncqY8Myt/AnoV6KAesBM+DBBngfLDYIytLg96Euo=;
	b=v2wQiQ6faB/BVj/6HyIgATKSHsaofoCKOF/wpYd3BX7D0d8mxeCjHnI/WIhpNhY+MEks
	 HeoTEQkfudMmei4EzooZHo2QSUYEFUDJOvzwW4eIasb1oIRxDitLj0PoCRDfbNQNkiaP4
	 mEoC7Md8Y/yNYJ9N9eu1uvyAqdGSYIn2QgnnsBUDfNyKY62lJJ+++n+iuQl1iZf4bUwWa
	 llzhSpFtYEBAs6e4DhUGJWwDVEwsJyo5hRyQKlJ5nNge5n2Ko5fVyU/DCEQXwTYt4TeBC
	 nAckRp/Qqh4M3qkLwBdkzBR1ND/gf73dtaESb9V/TCDjidrha1q9Wv9jsKuz+Za/Q3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k10CgQrD;
	arc=none smtp.remote-ip=74.125.82.181
Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3A0606A321
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0D3A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=k10CgQrD
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-36fc0a3fe93so1424711eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 00:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794557846; x=1795162646; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9YncqY8Myt/AnoV6KAesBM+DBBngfLDYIytLg96Euo=;
        b=k10CgQrDYczHjcgUWWa3CxLpyv2pLiCJJ9HVt4SXQb/Bde0Tawc+d9tsZkIoAV71Th
         GED58T8JTP4yb5aeqIjOKsJEDY2QMGMoU3oABtybqHIgoyvhW8egh++NNa5dg+zT2mVb
         w1lUX5F3YpPVr5qjwGGehjFLpqMjl9UBtg0VJauKYi4jsaEuRYbnh9zQpnb6zIr4LQmi
         aVFVW4N+aEDsS8fqr4GVta4m+Xjt6SKblnA5YpyGdX/1zBjhwH4+vvCb80fapDI43W87
         ImJ5a8Zb7rcZvot8LC8/crn1UgrDXEDzP7BPhKR5zQxJ2bO9sO43f+jd2qCbqDdc824P
         euJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794557846; x=1795162646;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9YncqY8Myt/AnoV6KAesBM+DBBngfLDYIytLg96Euo=;
        b=XcSorgwzq2ovecBNxm3fTUR753AC2sUjQmxM74vZyO9OMtiSeie3qSHK6KTrZMqlaT
         YT/8kkQbJnaHT2RvE08hTqxSAVHHrGZRAmuUUBGNz84YhaTR8Um5NG0JOi7cyM9FFEqb
         MuSj0PaE5AnWGzC6CUfTFol5WFqzGapR1Enryn6x/3j3j+Gq3J5Rv0+Sc5AE1x84zLXX
         o06jJu7yuTSqHeWMqSd+ykcPjAqIegRKVrP2bl7XOZNj0pR3ZUnIhHaM87tea3+GqqY8
         IWvsZRyV2CEFq2B8IhZWLD01kyupizol4oym0CVX6KX2bc1XmueZbKjqyzo1Os0NvHxn
         1T5w==
X-Forwarded-Encrypted: i=1; AL+hErE7W/bI0jh1g+2aOdmfVhBWYvW3bD0+H72pyx45EpzzsywX6lKSpk8GSIroo8UA9yVIOpRxnNoeA4darlI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8WQqffPIQVCNBC9b2rvB7JlEMMuSere2YdRubVLUR3i3jV59Sk
	ZcngJwsU99eKBAiFxxyM2mJm9eXHRhcxUFZPwbCe5MKJl7L8CSOSu9b6
X-Gm-Gg: AYBFou0u6hneteS9pbvrBvjD9lQyCOOzwzqpmux/7Z4OpgXWW/oEPQKemG76abIbM4y
	rVCm4T/Rt2OGiPL1ZmxLZ8ALc9StFXhYqve6ITorpi2bHJFV6CA/LSdBnc6/76Rkx0z2EC7IYVc
	Sfod7/7NcHZ8CIIVYGEv/YN13ydRc6g4AETIbM3hYooBLumAa+pefX6b3I1mHUBU6qxNTCvuACm
	uT3LlwUlf8KKwq/RbOgiiVa2lCeeL8/jqrYbHfB7YEtmapUqL2ASUj2quCaUFIKG+xVYoASCyS8
	K3qqGAXvXS0aW8L9ZTPXZFctM+afUWTUsi+Ac5Y+C/Xivio/xmf0bQwG0tsx7knvJ2dey3rVgIt
	0eQHmC64uE35e7ErLq9Esd2pF33K5QbswLT/NxhqYomfSAPb3Um8u4fuZZ2CREJPhY8lUw++5N/
	kZRVDJo/HcUz33MPB5RJqJAtuxiN3W42mJXPOcLSNIlKJyD5nPWFaNYbWFRlDZ+2WZTmyqJWsWH
	rE3NDDrFscHH3+WiK1z0lgo0nXUbcbvpxS7gocqi4jR8eMHLJOrgIlAhMLsNCPV5HDpnlWDOAiR
	G2hrazW7hNvwd+VbD5jTiUqsktGJsiVb4bXdQKbVPxqP6KLuGNF95yMnNNkAyvkxekFjaP7lXJ2
	sOwHgexZVszmRLKoiA6VkDiHWq28sY3DzMYLbsCqZa6IohJyHui8Fjkld6DjiEgdGWVe1seuj17
	1CT9UexxROro+Ocka2r2aBAIJqRMFj5alPeDQY2hI5CQ==
X-Received: by 2002:a05:7301:5f0b:b0:378:7434:a526 with SMTP id 5a478bee46e88-3796628f413mr1531760eec.14.1794557845941;
        Fri, 13 Nov 2026 00:17:25 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3795533170csm5403337eec.7.2026.11.13.00.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:17:25 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: =?utf-8?q?Oscar_Alejandro_S=C3=A1nchez_Lucero?= <aleszlucero@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Matti Vaittinen <mazziesaccount@gmail.com>,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] iio: fix kernel-doc warnings in public headers
Date: Fri, 13 Nov 2026 13:47:19 +0530
Message-ID: <20261113081719.10678-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
References: <20261112-iio-kernel-doc-v1-0-e382fc9a47c2@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 11:25:31PM -0600, Oscar Alejandro Sánchez Lucero wrote:
> Fix two kernel-doc warnings in public IIO headers:
> - Rename @consumer_channel to @name in fwnode_iio_channel_get_by_name().
> - Replace repeated 'NOTE:' labels in struct iio_itime_sel_mul to avoid
>   a duplicate section name warning.

Reviewed-by: Arnav Kapoor <kapoorarnav43@gmail.com>
