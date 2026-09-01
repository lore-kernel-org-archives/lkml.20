Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F343C48165C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280693; cv=pass; b=KCA/E7Fso8l0BGXdQ5VykUx3Kef3++tgYdbr/VBvzr/pV3x2Ao47lYuRonFYUNxaQHu6JMx25XfqI6IkkWp9l/yqNVjRDit10atSd/qaIL+3i5k5WsMDNj2iGSDnxGC5nie/wJGgulsPp2OeYBJUYjqr05fn1R5+dBvmpni55Es=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280693; c=relaxed/simple;
	bh=TWx81FEISW6Uris/X1cZjWXSFqgewjwM0j3D6tSdUPI=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WAEvdfMZszGyCRE8hyxe6YCZRfAKaG2jUDuOBK+sv1hCBmX7dPUwz4sQFb74qMT8EWPBh7sR6rRlFcqg6csfKMkiiC8NOMPYVWsyJIGbBWch/QpeyHb5yjqVzlfjm0hNyKpYvkJT5osrWwoxozSpDSBKho1Qjb7mLFRMY2VDtws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H0IcHHRh; arc=pass smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H0IcHHRh"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso53845a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788280690; cv=none;
        d=google.com; s=arc-20260327;
        b=YUmOpPGXqZie5ClYb08I2p1lfq8SYHweqNhy+7O4q7KbTQlJwCQF3RaawfHt/T/kUO
         TVzuzcgH82rOJOflC3PBp/PTzFTSwx0eJl8ij4AsDFUvh8w+0b/rcPSRwyhTrTtoD2hm
         eZvr9zKRaiRvIWBotMrl6L//pg5wJVpz3/fN/pVqjdpUAHwy3+U02+v0lODHSzQmfxdq
         LZ6xoK5K9c2zGAMkbl0xxx5lwk41pGiLws7Vo2CJXSQvKzldwEMvl6AANAvJBGbF+CcH
         5aUFuaKOeubuayBtc3BNxHKMBXenuwOMTPwnKqGZRdFW3uNEu9vtIpU5dPQ9OsOpbQ2R
         3t4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=TWx81FEISW6Uris/X1cZjWXSFqgewjwM0j3D6tSdUPI=;
        fh=4o6B89oNyZmYbxI5NQcdNQb1z4QToZaV3eV763vakOI=;
        b=M/tGogYyEW9cLQdR70hQ4xY7V/KivmiEfjclq17yA3gSs171fV08E35kL9yMgwMgnd
         I8MgifE+MZqofnG+IFNV5F7hl3JTXgR9v8XTTWkCCK5U8zLrb2dlkzwJhbO51J90WxJT
         mFQZq4DiEKyqW1QrHFa+8gTPLhv4Q5MKfaplgggg6kwfNhbnZIZms06CivnpT4tBpGuT
         Ru0VbjdBDG9fxvkaTSNOXHgCRFPMI9+sP1E/AVzhzJ7kY/8EP9Jo0tR3pZBV/aid3reO
         BLEuw+qPwuA8MfNSMyYsg6uyUX9w66PjKIJdE0pcilMJ4X/6wLmFIFPRNjeIcHpdKLSS
         i15Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280690; x=1788885490; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TWx81FEISW6Uris/X1cZjWXSFqgewjwM0j3D6tSdUPI=;
        b=H0IcHHRhJJ6Of8aTnHsE16AhOrOWADAbQ7/PBK5QqSxpE6PpaxjKUTpDe2siH7VUXM
         tCZUoZt8MIo1Q1rp8QPVH7RGoOD2GOVntqSfkEtT6bWDBuwDA4Bz0kGTQnBeXIJo5L2Y
         uYSh4j59djdjJpYUEJf7xu40JREenHXjJun1lkZ/UGPpdPU33pzPmamcNMrcKdkx/mYo
         L7TcgVKHckglwu187Jh4MBaW4X6/eoOCatSxVijC1hsiJRcBpJLH/Aw1Dqj+9UEbi6h1
         SevCtmsSKKltC7K+5X8vi2vTwTVxNK1HJ3nrhcokoCyD1hY2Q7BM8Mnz66oUznhWObfv
         flVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280690; x=1788885490;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TWx81FEISW6Uris/X1cZjWXSFqgewjwM0j3D6tSdUPI=;
        b=UVHSPRRVLNSZtxhbj6rq7eiZfttkbXjDHkfbc0uU8/MqBoZzQduxDIBO5fSw47L5B1
         GrINdhxn20WtuzBGZ6PZ9ufs+0vFxyISdbWG482mH0hCev38HvvCU+dq7hPOETI9gKx2
         kjK9Qx8vsc4n7GlVibQOkDsyms5MUUGd+dS6oAE1DAyzvj3q2ZfwOQctSpMJJRb+EYeB
         4ukJQ/JkVmfnRWjar8QtCKFo9i0MoLLw7laVEZ7X9I2QRUwydd8FxZlNsrVcU5DjdX2f
         Tfnphl5CcrsEy2NeFqzfSfZMEC/JF9acTI9QhMBt10+uBNDvwMFJVHfSpP/H7Ax5OdxX
         qoVQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqp6x+xtu2rVGb7bsgWaM4Tc1VE0hxxFT5XjcaKUfxjFG8x8LYLaWnOSkoBpnxNIN+YUyF9RJ6yUaw3vI=@vger.kernel.org
X-Gm-Message-State: AFuF++l85OYf7OdMJcnhMoFmecEq57/CCwlYRSER7u4UHrvoLJgJl1ct
	8tFTOcO5hh7qjVccDZuxnsybiVO6tSK1NBeHIZl2uq+Ljli3VDo/ZnxV7Wv1zBgcUY300jZm85d
	CIyt6ZyZqv5qVdbogLr9UgoWsaME4HXk=
X-Gm-Gg: AYBFou1GQ4cFVXoW9mpdt11jOrdjl95GK3cUTSFWRdzJHtpqrnPfxHq7cu2ygov1cTM
	NTu2r+EZ4T717Fa7QTe4KLBBKTUl9dFc3QyLLi4q5Mn9/jY57SkSoRj0qvN5DgG8pmDZ4k5MvpO
	sPxjm2U5iLtWDZLShwL928f6TlIeJC21GrrnJV0sroWmDDUpwiCow1ChKr1iJwBptKa/WyJrbDA
	05b+4LYzLEaWX0QPMAsPS3pBfE1z8XMgrZ6cX3D5rh23R+qX8+m8IupnP/mEXxazEu9Cf+RSojB
	hRsW7Dx8jCFpelhMTEsVLxlgOesb45ok2fxVffw4f3rLT0pFcHSWGquVA84VDpCaXlqJtHDa2mu
	jZ5A=
X-Received: by 2002:a05:6402:52d4:b0:6a6:32fa:54f6 with SMTP id
 4fb4d7f45d1cf-6a632fa558fmr14172160a12.21.1788280689891; Tue, 01 Sep 2026
 09:38:09 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 11:38:08 -0500
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 1 Sep 2026 11:38:08 -0500
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <47f696a1-1efc-4e8e-90fe-22e1ea2feaea@kernel.org>
References: <cover.1788213716.git.zhangxp1998@gmail.com> <f05b57691fdc4c186b08010314f8085aeb868e04.1788213716.git.zhangxp1998@gmail.com>
 <47f696a1-1efc-4e8e-90fe-22e1ea2feaea@kernel.org>
Date: Tue, 1 Sep 2026 11:38:08 -0500
X-Gm-Features: AcwNN1XV11VopDCShECHorlGvzGYofNHlqZjoVBGv2kQODpr1LJkuM4JJCcVpS0
Message-ID: <CAH=xXfGWsm--F9zS-zfqSKy+7_aWFou++2+-uCB5_m4cF9=hEQ@mail.gmail.com>
Subject: Re: [PATCH v7 04/11] f2fs: describe orphan block layout dynamically
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thanks, this is cleaner and keeps the on-disk layout consistent with
the NAT and SIT blocks. I have restored struct f2fs_orphan_block with
DECLARE_FLEX_ARRAY(__le32, ino); the footer is still located by the
block-size-aware helper.

Thanks,
Kelvin
