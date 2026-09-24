Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E831B4519AF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 09:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790243169; cv=none; b=uqZsD1yHtv05qRb10rCFcxeoEEVjXL7+DtYzqO5ZlpymqPTwviqG6Qx95awqmtppMPiUWpgeVmoA2+I0gJrAn4PyUM9//9sEOSnjhAqCi9/GZu3B+9toV1j0UGouoczhsfJ21r8q4Ype42OfRCmnmaEQl+PFzvrYn1a8KMG5PRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790243169; c=relaxed/simple;
	bh=Lgdov1EQlo0fPsheuchJYvzfLXqpNsd19w5kuF3sCGk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l3TqMwtoAN274Yp46jjea00u45Zq3msAVREV4YpKe7qEiUe080l/b4J4lSf+IBeBFsX5jaD9LZy5ggk9tt40sosFAtvb24ySVQFvQjClrYUO3FVOdijimgGn0CrZ8Kg5ccghSH+AIwhQ+mxmJj6JLXvqohw5+zlBgRw3QQyoE2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KjCHOzk7; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KjCHOzk7"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49cd38e0f79so10254385e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 02:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790243159; x=1790847959; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQw0LiOPF1WW9oddWAzXJ82cJDcoK6v63Klwt0PVxSU=;
        b=KjCHOzk7puFfCZeijXVGM4aYpHLyWB41ldo15TXu6Rmzam08nOhFM60pxNhrqG6X+n
         UdLY+xu94h0rEdjww1Hj4lKiHXddLnb3c3MY3JWAYPu2HxYq2/sJEtfbD90DRzUc26B+
         FDO7Bvvp19tX3oKiEr8yvzQU65a0U8P7IDMTV6u98yukAxkIk/8JErzGAmNyZ6Oh54TA
         AmLdDLntiz6qdE9KNZQ+04jaq+cxuK94TOCHSHnAVSn1m9e1kuzIBFDFKp3fIMIWY/wN
         C0ZaqTLr2iag7WmXeP0sieJjiFHRgUdbToB+A7XGGyr4TREyidc5MUdRyYrTK6Ps+twH
         h3Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790243159; x=1790847959;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQw0LiOPF1WW9oddWAzXJ82cJDcoK6v63Klwt0PVxSU=;
        b=kHkEriJk3oNww/KAmawjfUCij2/zZ/q7ubBhstoHFWk+FL6DdlHH3xDyXW8YWYHsUF
         NzvBj3guNuTlNpXAXjx4eqV1FOxuISePJQuukq/MBqqtLVNGu47qiUG0e0MfvDbwLO9B
         RwS2N/HAD1cKQschWP8T6hIT/XvrqkodkuxE04L8gI4MLETMFu5HYQJSAjtTtKuJuHdM
         Gdy6DObHzTyEaMdG5yma4LHOlGAFTqOkUpWamCmUpXUGty0FXfcpaj6eQmHMCgnE+iH7
         DEJ4khLhcEXb+nBIJ6kxmAv7Z08MxuyWiK2dDKDqJKr+/6RwbW3u1CeM21dlwpznMuZ3
         usYQ==
X-Forwarded-Encrypted: i=1; AKwUvByAD9q38YvF/gROWDNlKEeu16TPFNTWA7D6s4vP5rcawvC0LBueH8K3MgrK1j/4D15tMfuLmiffMXl0QLQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mAqsm9EJRVMOSfZENFwWsqfTYhy6J1H9QIx0JP2Xt10YglqQsn
	DJQVkzFDMGfSoykJ33WEXG9UvObK/65Lc3IrRu0i0Sxdi5W8fe2pjf8l
X-Gm-Gg: AYBFou2UnjAV9tcBS0aC0CxrnbkME5QGuO+kABo6Kc9v2984BJqkfRVlYR6IoZsJDca
	YPtWq/RBbgZqjUNxcwYZxoUyK1Br0pGZQCyai6zOITVChdcanIfWzlH7xKFwBVMyoSpC/nrLt2t
	PqIFQcuXwxUuQX/y4TpkuqSwIhX4jdl11OSYvWjJflxVd5dx588v8IIBf65mKv/BBowINOZ0KRA
	poM+BAieP34siNzwJdY0w8sPtmrkdMhh5zSTGVvHNNlZXOF7kQVgkofHR+27MHoVtGcW/oa+2wm
	2MRJs6UL03kQ9Fb/YOoEQ+09kOEqlnmZmwwAgZBruKomsZvEU5bm5sFQI1rBYWZIZ/HysOD9Q2a
	zkkxXkeRaUU80TArcno06pgVH6oUFVjGtbDeO0uCPQq4h/e0YIW585C+0R4OV4Eue0ne1E4gcDz
	8UxuZcEyFXq9xakPHWCvjbKQb68w0NHwVDpZApykiWGSumjar/1haz7DcOm1fHd50kSiFWuIYK
X-Received: by 2002:a05:600c:3b01:b0:49f:ce78:3570 with SMTP id 5b1f17b1804b1-49fe670bb82mr28973465e9.33.1790243159120;
        Thu, 24 Sep 2026 02:45:59 -0700 (PDT)
Received: from fedora ([213.55.237.122])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c500sm13947104f8f.19.2026.09.24.02.45.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 02:45:58 -0700 (PDT)
From: Michal Szpakowski <michi.szpakowski@gmail.com>
To: Lukas Wunner <lukas@wunner.de>,
	Jordan Brough <jordan@brough.org>
Cc: linux-hwmon@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>,
	Henrik Rydberg <rydberg@bitmath.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (applesmc) Expose the SMC battery charge limit
Date: Thu, 24 Sep 2026 11:45:44 +0200
Message-ID: <20260924094544.324119-1-michi.szpakowski@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <arTYEAnYYyDFsmc4@wunner.de>
References: <arTYEAnYYyDFsmc4@wunner.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Sep 24, 2026 at 09:58:10AM +0200, Lukas Wunner wrote:
> Jordan Brough is working on similar patches, perhaps you two can
> work together to make sure there's no breakage on either of your
> laptops an no conflict between your patches:
>
> https://lore.kernel.org/r/20260918175052.85461-1-jordan@brough.org

Thanks, I had missed that series. Jordan's approach is the better one:
extending the battery hooks to SBS batteries is the proper fix for the
problem I worked around by walking the supplies, and the BFCL/LED
handling covers hardware I do not have. Please consider my patch
withdrawn in favour of his; I am happy to test v3 and add a Tested-by.

Two things from a MacBookPro13,1 (2016, 13", USB-C, no MagSafe) that
may be useful for it, Jordan:

1. This SMC has no BFCL key at all. A dump of all 798 keys has BCLM
   but no BFCL (the BF* keys here are BFCT, BFLO and BFWC), and asking
   the driver directly, through a debug attribute that calls
   applesmc_get_entry_by_key():

     BFCL (no such key)
     BCLM type=ui8  len=1 flags=0xd0 R W

   With v2's set_property, the unconditional applesmc_write_key(BFCL)
   after the BCLM write therefore fails with -EINVAL, so userspace gets
   an error although the limit was in fact applied. Gating the LED
   write on applesmc_has_key(BFCL) at init, like the BCLM check, would
   fix that.

2. The SMC silently drops writes it does not like: applesmc_write_key()
   returns 0 and the key keeps its old value (seen on this machine with
   the CLWK key; BCLM accepted everything I tried between 50 and 100).
   Reading BCLM back after the write and returning -EINVAL on a
   mismatch costs one read and makes the failure visible.

For what it is worth, BCLM=80 on this machine stops charging at 79% of
charge_full with status "Full", the value survives reboots, and UPower
1.91 picks the property up as charge-end-threshold once it re-reads the
battery.

Michal
