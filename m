Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FA355C1D6
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791992671; cv=none; b=kufCes0m/FWU4E1ZzzUNOe2m3tV2t4zPAWf/GMhfDunvSSqcS9o4TW76uNYKk6yEnglwSjpu1daRNoaekS/PDFNxpVlU6B4YhBIlOLOUMcx+evcOWZZSrLRVT2xnsZ0+4hGUvU5+fOeerthFtovhYbyG8O3MSnDT7HYDRFe1Vzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791992671; c=relaxed/simple;
	bh=zXOfJVkGourMk1IuHRjPQLpc7OaveEbn9wcmnNP8TJE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bg0wUoiunX7xiHwoyxv4rCZhFuPrdOQJ0K5L9zwHrGYFP+EIbK29ar1mg02xNxGM+tD2ZR6kum1mh6M6rj0rZowsKLReFinzzSHV8fxvj6mnDMidXlgnyaaAlJlat5zCS89ExEWpaV/3No982OgYo19MLfuei0U1kDShE0PNSVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKJ45ai7; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKJ45ai7"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-398b3c37877so2174946a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 08:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791992668; x=1792597468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t1mzg2eBTmUC3buluIr2dQW3TRTEDISyF3jDKMPaMKI=;
        b=KKJ45ai7+hgdNl6oZKYUGw9NBJTGdUqBZfZgcbowTqOyfV9CnuU0mZyznNpFACN5ms
         syoM8Jqb0E3+yLPnsAeboYjIdJSODQPMZTD04wI28SFnj/olbkwQd3WsDEjgryXkLSgV
         cEsTh7AlrFqS5nmznWBerxVLXUKPb/EEO9yrNsW7KldxzgTkszVvapDD9Y7D4NmVCbYx
         6tmdD4a+tRlOOnU94lkqKZsjcbVU/Ht382jzVaRfXia5RF16dJIq0FxGZ9+V2b9ABgeP
         vzekwhsLUn2Rk2ft5x0Vq2ICweKFtA6NsDrCBRRwNW13RRCPdxKYqVHUfKhLI3uDGYnQ
         nI4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791992668; x=1792597468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t1mzg2eBTmUC3buluIr2dQW3TRTEDISyF3jDKMPaMKI=;
        b=hbWL7ynTfz16PfrItxzR5UNvYMtVJxWtp8o56TmAlmrArociWotQ/4gj4vSdETI5rV
         HzY5IBthwE6FIgZwjo5RKUvrMoRVVPQPT2TMNltMG59P2POkun2Q3XIrhGytDouiYjDq
         gnNKeiRxq1vfz5xi6i7y9UcuPhwp7XgeqRb17nZGg2qKOAcsCrzqXv3UyBE/8RBN2oNr
         eWhzEDI94SC7nkg2VwLslFmeHbgNGvajmIwAEZEcLNaQ1vd2Bv4WdWqxIMw8IEp737wF
         Liu0BLdUn/tsxOYdpyte85UarLAAVW28fecnLtTXBLurE3KlZ4+sE7UxVvYVj1MTpM15
         TDhA==
X-Forwarded-Encrypted: i=1; AKwUvBysGvHIuft1CAAc5LT4HAAQQ7fPWFnICAebt36pfRi/XQ/U9H3bHWiSx7zfc4dVFNj55N2Kg8ooufM90oY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJsTnRoIkXox47pzA53tDH2OK2g9P+6G+vQ5xnv18TDbo6a79J6
	JYJLerRDGwFbojQjlylJYlloAacEVVxYuq74EJqA92+BWCnT5NH+t9Wo
X-Gm-Gg: AYBFou0CeJPbnJu0hsGhSEcA02/xUeAT7lR7SpOKsC+P126mpvK4dSugA2RTOJnGiop
	ee2biyioI8ZBC88XWFSmO4i6JNK2uED24Xq3we8Nha08xyMIOkHVTBUBDCM/b8DxEKJAjC0oL0J
	sWV/aWoHd+C4u7Wpzd8OMSeIbsLNssdKP/uKYt2Wj4LJo8+tuw78c9f1aFzRPTTa4nmuh/+rdOW
	r9gqNL5wAwcMClcvdjUhb/34vdTbRFD34TrLKxrjlqiFiTVj/2eWddIHcIP4dc4ddzVnWxmKQNj
	Y/PnbtHzBQTCexeUw/oh0jQRF0OHfwguO4iCH6PlgqaFiGsqKKFpzSlflvwMNyrnTsd5wQD2ExV
	iHTrU62SmUMf5chVYEO+B3FUPVHAQ+vD7Ys3lsXM4O/OqpBgt9JuBKIiOAVGdmc/ZQFsskzrrfF
	yOPkvAEcXIhW46Of7TxdGrr5WURj3WReRBjQPd4AuX6ZhfafTLhwhrJ4CgghW4GYeX2vOg/+nS
X-Received: by 2002:a17:90b:3a48:b0:3a4:acde:1e3b with SMTP id 98e67ed59e1d1-3ab3ab5a652mr14111933a91.13.1791992667531;
        Wed, 14 Oct 2026 08:44:27 -0700 (PDT)
Received: from thangnn-ASUS.. ([2a09:bac5:d45b:2e1e::498:19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac5f202d78sm4896722a91.3.2026.10.14.08.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 08:44:27 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Tejun Heo <tj@kernel.org>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	linux-kernel@vger.kernel.org,
	syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] workqueue: annotate the lockless nr_running increment racing with need_more_worker()
Date: Wed, 14 Oct 2026 22:44:23 +0700
Message-ID: <20261014154423.20915-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261013112905.9673-1-ngocthang2710.1999@gmail.com>
References: <20261013112905.9673-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Oct 14, 2026, Breno Leitao wrote:
> Isn't it better to annotate the nr_running field in the structure, rather than
> at reading time?

Agreed. The lockless increment is how nr_running is meant to work, so
the field is the right place for the annotation. v3 marks it
__data_racy and drops the data_race() in need_more_worker():

  https://lore.kernel.org/all/20261014154342.20661-1-ngocthang2710.1999@gmail.com/

The trade-off is that KCSAN now ignores every access to nr_running,
including the locked ones. If someone later adds a decrement without
pool->lock, KCSAN won't catch it. I think that's acceptable, because
the rules are documented right above the field.

Thanks,
Nguyen Ngoc Thang
