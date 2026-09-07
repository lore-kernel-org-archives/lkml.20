Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E1F46F497
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 14:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788793002; cv=none; b=rrU8ffxDtd0F3naQzRLh5TAjFXc/souSB1MJF1qJAu/v+NV9yudM5GhRadvGtnJrrL5wid84KbBfDluZ2lg98OYxzYo8/vwUxXUF+d/uVsZiWYFip7/O8eHZ4J5vyhopmTnl+g9qHnHjynxVbstKybAuTjmzrItuzhb/7b/gPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788793002; c=relaxed/simple;
	bh=+J14SNkIJcgl5o5mcOmI50R/KCvTRGedgzOnLKvHaJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kpLaIULRScphQzTtBbvTtZHOdSK0/e1+y/M+vZWUh2gd8o/QdqRjiAfouXVdLc4HUYY/hUFSLFm/6YBDaAFvoAmEGTCh9xgYH5Eu8rOz4S2A8WcWnbRiZCy+7mVGTeC9918tYg4jivKmFnlE725HMTOSAPirQ9g3I8B9l+QmDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fgjuLR3R; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fgjuLR3R"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b8e527d63so43406215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 07:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788792999; x=1789397799; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g48hwSF5lt99YYul2mb7fuDrefFoNQOf9CLbuEcDZMg=;
        b=fgjuLR3Rca3kO4RlH/vo4Hb/mEb/LPfmGQ8KHUN8IHeQin5ry34aTwMnCXjP8zqAwM
         iFssGqEepIpzvQA9N49/UqwuNGVfbXVNlrrGsnpw6NOujwjBv9zUIKux7WTSFr2KfbiQ
         LcdLUfBrqiwF3mNFnQckkzaDSzV2wsXSylcVvkmbW2I0o4QP9qeR7wanX8Nz+cWVfGID
         Jhfz1rNYHQYlVGPqDk9Fpr37pd5xilBAZkl78dZWZ5ij2RRZjZElVzzLZ3p2FXa3bJhl
         0STBKQTpOQZ7D4z7snpn6LJd1Q9nZxmhDjKuKh16Wdd3B61xS9OXdHjjAk9dU2gEfU1l
         dDLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788792999; x=1789397799;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g48hwSF5lt99YYul2mb7fuDrefFoNQOf9CLbuEcDZMg=;
        b=OeScppW59cxfCY5BE97eJSWpYbzFjz/flcQogpfgOD6cIawP60ZR/ZDB7oBWVPqf3v
         58rA1anAVvYovJURuOBwYobMnFEO/iP7Pbx6foGqk26zyki+Qwh/lClsT3GTjbDbPEVn
         OKz+P5qfqmLLuXNbySweeg1Bo4EAmyLU1m7YAGHZRtnumYeGTlBpmf1/PdMT+rmx+iHJ
         irZqsoYgzR1fM+ygwqWCUECsUqernDj+7ztJaitSt97OdESy2rnIwNqgb6Jm20Xvuw2r
         uO3GIM0zzdxQCikvLD272rfhAlABpExJO0NfYReZGWm4lG8IvYa7H+Di7sIhLx25nAks
         B4yQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5Hqjhi5o+aAz9M+uVnKP6nWzSdeajulE1fpa8+X6dYwwOVc5/729EUUcl5HkqihfJFBpFYCFUegBtjjU=@vger.kernel.org
X-Gm-Message-State: AFuF++mLYCpQxLYwBr0T1cqgW4QseYUFUyflUPLBFjvPdeBqE0sL+2L4
	T9qqE3A0YP2i4uyAQWeizJnEYW/Tl5G75rrbhwg+/Yh1QGTSUdAfNZPi
X-Gm-Gg: AYBFou0qJXp6Qj1D6aS2SSmdlf2sK2tJ7ctKj1Y1ORS88L1maePHFtSJrV+1y2bLqdt
	7UjOTtEY6xLU60DR7oL58iRmRXKPTK/qQeqOMSdzXEKyMXPYG0wiu8M/clOnrGRYaZgliw9s8j+
	OOHnt6Ubce2XrSoXbLtRzs627F6ISUhTrg/5dLscQWZjob/2yZagOv4JXdxU0gCka29yfKUOKlH
	ZqJfDM7lJvldDGaEFMA7oUpbbaX2ZCn9DWtsgi/Rbz0hANU+AeuPDlCBG/zW2fbgLNN/QXKwfLc
	YFsC00MI7eR7zz7ksDvKGYBuUkQ3Q2C6GLASmHtd65T0j78j4x6FTpYhcv6cdjkZEpPTTiGeNck
	FH/08IDu8gVKqdIZFgVh2nPC8TAU+Bp+apRuvJHlIyFB02fsuU5iN+YaXfWTX7FDINVj5nW0R1F
	trjekEvK8exSCWBGqFGP6Eui5q0y+xOsSsLT/YY05x4uCbhhIkblcz0FYaglp3rAd5wcXB2gJCu
	iM3u9EVWQpoXrrOftRPlZEgy8iWkEuCnsJQ58fAe41WuE3izJfcVXELYlAmAxjeCjkHiawPuKLB
	J4tZh2ZgJ5ifXq9eZ8NCTMnhjS1xXeadZX6JAIqz08QzzyBJF7fjt/am/x/THQNoUdA6QOYszB+
	N+bFcu8BwAG52EO+WQHnQjefaitSClXqKW6X5JBPh3kbkRljElyAycHauKW7CKo7NxIby+Q==
X-Received: by 2002:a05:600c:1914:b0:49c:ff23:a6d5 with SMTP id 5b1f17b1804b1-49cff23a70bmr191567445e9.0.1788792999098;
        Mon, 07 Sep 2026 07:56:39 -0700 (PDT)
Received: from localhost (90-182-112-124.rcp.o2.cz. [90.182.112.124])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf755c22esm316801845e9.0.2026.09.07.07.56.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 07:56:38 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:56:37 +0200
From: Joshua Crofts <joshua.crofts1@gmail.com>
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, Nuno =?ISO-8859-1?Q?S=E1?=
 <nuno.sa@analog.com>, Michael Hennerich <Michael.Hennerich@analog.com>,
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>,
 <linux-iio@vger.kernel.org>, <linux@analog.com>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] iio: accel: adxl367: resolve interrupt mapping before
 device setup
Message-ID: <20260907165637.0000348b@gmail.com>
In-Reply-To: <20260907082313.3054-1-antoniu.miclaus@analog.com>
References: <20260907082313.3054-1-antoniu.miclaus@analog.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 7 Sep 2026 11:23:13 +0300
Antoniu Miclaus <antoniu.miclaus@analog.com> wrote:

> adxl367_set_int_map_reg() uses fwnode_irq_get_byname(), which can return
> -EPROBE_DEFER. Running it after adxl367_setup() made every deferred probe
> repeat the reset and power the device up needlessly.
> 
> Move it ahead of the regulator enable and reset; the lookup only reads
> firmware properties, so a deferral now returns before any hardware access.
> 
> Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> ---

Reviewed-by: Joshua Crofts <joshua.crofts1@gmail.com>

-- 
Kind regards,
Joshua Crofts
