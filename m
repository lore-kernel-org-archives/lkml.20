Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA613BD65D
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 08:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791190439; cv=none; b=p3uTTBK3xoUu0vi/eWq0+Fv4ZpzTsKPDARtZNid8RSXnxgN75FqplnqYxLx/y9tkkjeYlJtkFUz64F1hSL0HCkGdb7l1RW+fYKNn6S7s/HQTrtgYDCjzKcH5gyY8HKglONSum4J4GVwv5+y3Z7pDfcnkHEKMNikSuME4r72+oy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791190439; c=relaxed/simple;
	bh=pYKbb9UXC1JXT2n3550Q9wl1CVm2XMWNl38H+mqjS84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FUooaWVr7wVBFuqryuYlt3QzDO0mtEPfCDz5WM4V5rIIpj68dDh0XhbDk3zFYbJbsdLIZjGI34zjNHXetvBCNkoM+TnW44NThRuKqIgNTwUp7ALbB0GMIEt57D7K6zaNWRocNpF1xuHcU/OAMyHK5qALZcButmgnRbJkvdm3N6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFJjMdD8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFJjMdD8"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a16aaf2067so15013065e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 01:53:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791190436; x=1791795236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pYKbb9UXC1JXT2n3550Q9wl1CVm2XMWNl38H+mqjS84=;
        b=kFJjMdD8Hw0TiGl9zBCi2ImEG5r24eryk3O6hdBzUvwwMuf6a/4LxKk7e3EKO7o8q3
         aY8b2SLbDmc8BQyo+mtdAvkGn42wQLt+fTUg4w/JnvwUZUpwLHydtO+EyyQm8IUKz5zk
         O7pC2G2QoK4lCnSiuXxrmgBGH+cpEQo5E38RfdxzlH8rGa+h9/v5krCL8FEUZ0O3Uy5O
         ZEzKv2bBWyybuYjMBlxIpDRjbhR1v2V3otoxu2FsBC/45xgvuOiCH2P6hmzjfnTpKHPb
         LRIdmN2HwLthXK4k53TjxJH6nBL+Rbb0v4o0ByxZyJVeO/8db/vshhAXnJGt2THa11w8
         aB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791190436; x=1791795236;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pYKbb9UXC1JXT2n3550Q9wl1CVm2XMWNl38H+mqjS84=;
        b=nroEbNoprJOSxmY/kz75r1/sQ2CZinhne7PseZIchHhxQcMLP+0JAHYlpKM0dKR9Nu
         m4GuWewSNb5oK9vnM6/H17mAx2InSwTFlCYwH27Di0MQ1rxDQT2rQJurzfY4LxUpGL2b
         s+Edd80OsHhfpudFuqY3tQQ2ovRx4RpIzkSqiNei7xlp0o6gEsLWkbuM5WqHmMydghy0
         jaX800Msw0/QBdM6ZY49wlpiU5M5ytrLbAEFZp1eHLQ23fJWpZ2vh/MwOFuuxvb02Zks
         reUu/waOPo7IuJ4kqx3WflSmvOvmrfHlOuZEdtoglFXAg5Z28KbJOxnGYvC0b6/43MRj
         SfZQ==
X-Forwarded-Encrypted: i=1; AKwUvByjvaVJ/k1hMjhlkeOv4UzPGKGrxhXZ3HgBbci0rnYXWYqcVXd1BKqpIysX0utjFwbrlhTLVwTP2NmVNNQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKvaHdu1ni9UWDf6cSHq5dGK7igI+wZNiNh+2xmLk1yOZqR7xkW
	yFB5TmGfk9AwFto0PchcLYQj9JVw15CK6TwKrxiTAMXE67SjG06dRwER
X-Gm-Gg: AYBFou1Pjmf7TvSu1TSM4lzesxWvHPmnBhoUeKqYoghN7lbkBFW0p0vTQ/KeX9h8mgl
	5FHXIun5TP5Tceao/rCc+23DZ7tH65Lb3iycutmjhcABGyHhH1BDi2yahKBkzDXcCQhUQiDykoL
	hKQirS+8Qp70/YuhrS8sAo4el7qWJ9eONThOxXMQ/gJ5HFSLN1W+BdEWv4V+J+02yoOyWqmUutl
	SZ1TQp32VexU4T/sO+eWX7xxVrWYi7O5HS8CTrDjmDYkmX0MpZAtD4Y1nHxgGlMxFjFISuTXT/k
	vqHO7akbefeeDww1rlk4L9oxZAwLwOTip6gFjy1WuymmF9UpPq6g0eeTsZjoDW7rxR+PAzh/CIH
	9lLm0ngujYIW9q+xNbEAS5E+CVT19+n8Yx0NAm9jFiiAt7QeZmVKbIZ3bkZt5xnVy39kJRRuglp
	rmPaGWKPC3oAS1BLhcpBCHGiTXBcxuVzaUM2gnum2MK5PXE/zzkTdyGoSji/x42s3tfSTvNPp9D
	yFCPA==
X-Received: by 2002:a05:6000:200e:b0:488:8411:1d08 with SMTP id ffacd0b85a97d-48c4801c7f9mr10007975f8f.48.1791190435824;
        Mon, 05 Oct 2026 01:53:55 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48c6228d716sm2371333f8f.24.2026.10.05.01.53.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 01:53:55 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Pierre Pinon <pierre@pinon1.fr>
Cc: hansg@kernel.org,
	jason.z.chen@intel.com,
	jimmy.su@intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v2] media: i2c: ov08x40: Implement get_selection
Date: Mon,  5 Oct 2026 10:53:46 +0200
Message-ID: <179119035557.32442.16855854917692483516@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261005081529.45697-1-pierre@pinon1.fr>
References: <20261005081529.45697-1-pierre@pinon1.fr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, Oct 05, 2026, Pierre Pinon wrote:
> With your Yoga feeding the sensor into CAMSS, I assume there is no such
> vision chip in between, which would explain why the mode works there.
> Is that right?

Yes, as far as I can tell. The sensor sits on a CCI bus and its two
lanes go straight to CSIPHY4 of CAMSS, nothing in between. The binned
1928x1088 mode streams fine here and is what a 1080p request ends up
using.

Oleg
