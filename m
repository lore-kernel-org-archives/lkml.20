Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31DCE30C164
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788211322; cv=none; b=lM4fm4HuPi6tsa1zpQUubkmMOrmH0BmaGGeMlhpSEGcKrQYEfs3DDOF90O9x44wXca+EGyihRoQk4mrkO4itIz4K+v51gWW4NnHL2uN0QsMcLceAcIbM8CNd4ePR2YgXxCYl/DxW5M8Qkzpz3HPDsdC/wZ+lliDadzbzX9ltoME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788211322; c=relaxed/simple;
	bh=Y2qk4HBX1AlLiEEPrVMcaqicrDq823MQUt2643iTcUA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZN6gvPfzX8hxhtHP3HUQ2VI+nySfxr5S66vEQQaPPIVN+Fb++WMpLASMUEnWIch8AoJY9mCFa+Eo8B+iX8piNf7evcerM36Zt9pqCWvg/g+SYKHSK+2h/jdMdD6VdtFtNVFu+Nlr+NJm3g2HyZZshQiejg5Y/ZMK8+3mLB8VGK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rM/SIWZV; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rM/SIWZV"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b8f86c6deso23530475e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788211319; x=1788816119; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDiF/p4/pzvSLemuA3E3Ov7A4ABDMtf2q8xgprPA9ZQ=;
        b=rM/SIWZV8IxZzfgdpeeTmlENPqDc8O40zNKqjePbXAQWUkW0QTWID8T4w8XxjOEjpO
         yUCKi3OxuF8gx7FtduYUvueQExAUEdhj4f6GCCc7Ja7ecRCzptn/YN0rEZWrWFEHJjxV
         XNCgP6pGRxc7PUiw3MzSDH/8zOUfGNrn1+JaRvnOnJmIfZ85qaTy33vuzMFUulRZq9ie
         rwlpWyg/3Ot3JO9IK6v4VPEFL5qVccUSwDBET8gk5EFpvkA3m1ttw+GP4NgvWGNqfjbp
         4WZVf9KW/R2/bPWJnx7UlayYozSM//bWTxG8TfaqIbUYKmO7aLMU/z38XQ5Y1Q8G0GM3
         xjxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788211319; x=1788816119;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDiF/p4/pzvSLemuA3E3Ov7A4ABDMtf2q8xgprPA9ZQ=;
        b=l+/90WKHKE7cSfE8zE+aOhh5bnA2ozrZGnhJLDXXefdcaKMhyUmh6xSGoAe52XOREw
         Cr+SS/tlAqUYL+ccGP47QOst7Ds81irOY4xGak95N5SZYPURqE8q1X+19CufU+RHrhk2
         94IufewF+1gnT0hFN0fh3posMar5zWbf+a6agUKseLRf4mPUKZEUktNSTZCLeH/mvBQJ
         jEWtEtGr1guNTmc2nfjhf5y8LZn/RDCkw4dpTnkpVzR100VTWW3Qo3nXoXTEseMg1VU9
         2VKRz/Yiw8ILr6VYStp5gXRWAj/9gDu9/qXLVPuEFZSyuQEZ8IUGF+fQ8cPkqpTOYjsK
         Kenw==
X-Forwarded-Encrypted: i=1; AHgh+Rp1cbpTDDc3keBNguT2SnDwFfZZ3B+80YMp2rI21jiwW4cT+e0SSUfKdEoqPMmrT0bOlYMMPtyYJP1sbWc=@vger.kernel.org
X-Gm-Message-State: AFuF++kRjNpJYSJDdBSXU9RhWhyVu4BKMvMj0d6Q9ncnJT3TpJSnsshg
	yyPMcPHvd8vgzMtbc3vRFR16cu8aOIXPSA4uH+2gObM6txoJpyLo0bON
X-Gm-Gg: AR+sD10T6J4zcflV3HR5s80bnkVphE8PO3Mg9vwyY/j4kECPGWkSfk0Qtg4QiRgZ1kG
	L1NGptB+w1cK4QIjOdCOLsFrfqpK/5TyugFuKZN9ZilpeIxCrexIFuPJQjuMWYV0DZl1t92SJi4
	dhuipPLVT3Wzzm8mZbh5SHDFyLy5iAVS18dOK+fPbPBnDMwcXaVuxTfYZMDO2CWIKyg6iHjgNho
	RF9EVMGA6ZGn3qsB30oKWMLRxQwQLqltsqci5uilnh2yATPGXcf176fJoJv7QYNXvtowr12EBED
	W6ERGzwm5IBzTzrSwE+GEzQ44eAClYBB15or+dpnUHeXrl7mG5aoir165O1V0Duj99vlQ21jXCf
	Y0DpIac8vdaC+Auuyf8QYZTbTeFQE7uEuYTDFcc5+T86XlzwS9hPgMeg8Xl+CqSD5+AbwHmsHOZ
	ljQTxMu/dYihVo0PA9JLN6vLSNYbPRfYTfJSz/pBAIhHFhzLnc7mbU1+C+XCc5SuOSfY8uZ6sMv
	TLrr9cPIMhGuYYNd28e5+ldUO/L/VeMmvgitUHHiR56V/L2DZJUhfeSDIvNXBgcY1hhkESGIf45
	vDUymE6knaH0tgk0xDxdnx3KS1XZASh6vgHIH+9YXI9hT8V4wL8+O5oWt4L1lG3XryENV7M5Z6I
	l+b4xez6i6LSXioQvOknUva4fIXcnzgo=
X-Received: by 2002:a05:600c:4f8b:b0:49a:2c4b:403f with SMTP id 5b1f17b1804b1-49b91c46494mr383888935e9.13.1788211319270;
        Mon, 31 Aug 2026 14:21:59 -0700 (PDT)
Received: from systembl0wer ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c5a903eebsm196936865e9.4.2026.08.31.14.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:21:59 -0700 (PDT)
Date: Mon, 31 Aug 2026 23:21:57 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Akshat Chandra <notmissinge@gmail.com>
Cc: linux-iio@vger.kernel.org, Jonathan Cameron <jic23@kernel.org>, David
 Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] iio: chemical: add SGP41 driver
Message-ID: <20260831232157.27037a5e@systembl0wer>
In-Reply-To: <20260831151235.64076-1-notmissinge@gmail.com>
References: <20260831151235.64076-1-notmissinge@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 31 Aug 2026 20:42:35 +0530
Akshat Chandra <notmissinge@gmail.com> wrote:

> Signed-off-by: Akshat Chandra <notmissinge@gmail.com>
> ---
>  .../devicetree/bindings/trivial-devices.yaml  |   2 +
>  drivers/iio/chemical/Kconfig                  |  11 +
>  drivers/iio/chemical/Makefile                 |   1 +
>  drivers/iio/chemical/sgp41.c                  | 384 ++++++++++++++++++
>  4 files changed, 398 insertions(+)
>  create mode 100644 drivers/iio/chemical/sgp41.c
> 

Not only you're missing a commit message, you're also missing a
MAINTAINERS entry and a dt-bindings entry! Please fix this!
(Note, the dt-bindings and MAINTAINERS entry should go together
in one patch, preferrably first in the series).

-- 
Kind regards,
Joshua Crofts
