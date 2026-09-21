Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21E75489FA6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 23:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790035063; cv=none; b=ohJMw2dv3Wb+KNevRgb0uXyZETMm1F9EyhUy1+EP8/cZIEC/o7j5HCtuDqcBVa1ofIrsTYNH8gv6o3t87ScagkI7g8ErCljzWrbTxt7RtCF75xzry0UaS1GKpQkFZmrTcLFLQ/0ssIS9Vl1NsVxCd9DKgSQIKrXNh3ONhsXD/Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790035063; c=relaxed/simple;
	bh=cnVBOVNcoBUw8knbr6P7SfsCy/zQCwhwUZU65FPLmlQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mPvZiMWI5/JN3xdBEX1hIsgojBePM58p1as6ATfJYjULg1paN+5dCBVZztoR+USW85bm27TUi/gZ/ymLqTWECAq0RDTZMsUpm40trMlrvhlcJIGEXvzOZrvxnUNudqY7Gj65F4gXPLHosHqjT5YxhIWo4zzsv88ZrteYyIK8uJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZughzlR4; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZughzlR4"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc750a1482fso467281a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 16:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035061; x=1790639861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnVBOVNcoBUw8knbr6P7SfsCy/zQCwhwUZU65FPLmlQ=;
        b=ZughzlR4wEjFFcYd1dgfTfM0rCk0M+Ag/meEzUQNIz/DzjJtontU7z0HvUO2blRi7L
         EZE16AAG8wlh0mO7ajaA0XvGq9s3/Y+2g2/jjFSEQV3Ah7v5AHP4USxl3pMc/53VpTyD
         aaLr4M7/bHqdbbwhx/12Iih2sEl/uOabUNwidCKbbGCK3M/cyCEVqtFVDjxbPMqCXKc4
         Mr1z46X68WDEmtyk6USa4QRLrGyDBf8gRIa8p9fk9tztX2etO2aUvtf0k5GdTWanBEE3
         fxASPqnevuZtCqhY3xOhheSDZeuFqI/8xde9/WGKy48kxbSI4w9Jov+6NcQW5nVIPxb6
         dBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035061; x=1790639861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnVBOVNcoBUw8knbr6P7SfsCy/zQCwhwUZU65FPLmlQ=;
        b=L9hrZpw21TAFJKbavLsIt5hUhmRZZR/Uv/QolbVABtfHMl2Om1dxeyL0myMNFr9JJN
         9Hh6aTUKSNpfjZQ4NcOSny2v10P4EHlEAuyizsobmL6Vp0yqw5FqlMcTKe+miclAFmEV
         7xpKCbd8kjwInWUf8377XJRa3QS7QqjofKxJ8aA8IGoeKxZ1+nQiKNNUOcnpRtf5ADFK
         /E2MtUF3Jepg2dJram6CbecwFE5+JWHU42RfnskUsiqb3clPO8p+cVGvBA2ikEadVGrr
         cdDFOkinKTXclyMsRHCxscNdB/drM+KbioOmsYwU8Wzwyb34uuHngwjmIZTEwaXTcBUz
         JpCg==
X-Forwarded-Encrypted: i=1; AKwUvBxWgnmInZnRVcnQLiDkyMu7sz74WeitHEEW72AQhr9avPJZmpE9kj1ziAJDz9gHUDQGrFaGhXJVkrl9so8=@vger.kernel.org
X-Gm-Message-State: AFuF++kd7RY/wxQV2GgvQotelOGQgYzRlE3tuq1lInYcJW2PUkYFI0Dk
	xg7I951wPaoUsakbE3AMsslPGc53zzCTK28qvs4OnACjK4hUGAu4hZpk
X-Gm-Gg: AYBFou0cgEOTG7dXLNVFOE2SjNec38dYLU43MDDwtk5JtC28X0Ga4ZGeia9WgB9jyPB
	OL+NlWDQVrgyqL2K249XqRFT5FJE+IMdiv9jZxyAmIVGFrfmxB8StvBTlZ+b+U1hLfTB/jwSzMv
	7Xc60twj/WON5UPzW/mgn0d1XPVTuRsc5lGTPlnn4mcbs1BIMO7rW2VzPj/fbVj2htg7AN2Uih5
	okory1gRD5p2t+f/P5CK+RVTaMkKrRu+axRC75Y/2nmWOLNK36hAc4SL+IeTaIfW/HInJdmpL8a
	QtJoMRYf22MNNdqjZhCg2YiAb7Y10niQjPUnwCvhwD2Cs2fpCjlZuX15VzRRa/RGIbay8Bzzl9b
	68PgxxtpqSVBhIp1WjxlVHSIf3Jn58qa/magpJj0nYLVD4cWQ4BbAbqhA5AMQ8VyqXdYAXJwXiU
	YVdSnKzPN3Uly0WBVUD6lbOmqMxt5pIPI0bZvCU5tb0hoPpZe8J5HRB/UNb38s4aA=
X-Received: by 2002:a05:6a21:a510:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3dd8c3fe2abmr20429703637.6.1790035061042;
        Mon, 21 Sep 2026 16:57:41 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::c570])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc754bc9c91sm88077a12.25.2026.09.21.16.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 16:57:39 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: liuc63@xiaopeng.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	liuwb@xiaopeng.com,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] usb: gadget: f_uac1_legacy: validate bRequest index in generic_{set,get}_cmd
Date: Mon, 21 Sep 2026 17:57:37 -0600
Message-ID: <20260921235737.5666-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921072551.3708191-1-liuc63@xiaopeng.com>
References: <20260921072551.3708191-1-liuc63@xiaopeng.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, Sep 21, 2026 at 15:25:51 +0800, Liu Chao wrote:
> Fixes: c47d7b09891a ("USB: audio: add USB audio class definitions")

Reviewed-by: Ivy Lopez <skunkolee@gmail.com>
