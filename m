Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438F416F288
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 05:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789795861; cv=none; b=oaCr7GV7BrATr/SmavGL5bD1PrpDhWgGRfqLOuCGdvMJY9pySKgUeMRNIjf8Wi+xZyw0LSneeYiwedzh/WZBe9boXb09336cVP1h7bzY5c+BgKvrOxeuqOf0mDWj4RwnRzYB9ROSTXQ2FOvplR8C2OAyuKTRvFCVzlSEXABAhVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789795861; c=relaxed/simple;
	bh=iDSXDPQtwjL7QMN707DL89rqjryGZ/GwAAl925LsBhA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IBGvc1JWqWcwAJ2Q1rrbr5gB2SD3KWs0OC+LB4tv8oGE7l71dKhmbUJJ7BUc7OuprHltAff3/maH8UjsImXAAakZ7wcjyrOUO9C5kLMwBV5AX+har8gRHMjkal9VEKJX9gJgv0Ri5aan7M+XXxC0jkPDXfHF2JHeRmx85FLJGPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n4+HSJs9; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n4+HSJs9"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ccff31419so11732495e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 22:30:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789795858; x=1790400658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iDSXDPQtwjL7QMN707DL89rqjryGZ/GwAAl925LsBhA=;
        b=n4+HSJs9YYXZAwPP6XZ2i8UtCsi9yVwqa7Ceg7xmZDoGy7loBAR3TKDXfyYdWn8gTK
         REI/dRWLIOMDYAKo8DFpR6A0soY4BnFXEY7XBs/nXKYK2NSmlhylyr3LTtBNio49J60L
         9D/tGwhiYYgwNAIBRP9EcT8+95iVYE/KoXlCt4txxZqBPVbEXLpTZ4Ow1UVKSH9ovXD/
         64F9487Ow4QrDMZF0OqoNCwpZP/c31WnCEu5TQm9ZslHsB9ayFZFsFrjEt918UrbJRnU
         0AYBdpRYK09zyDoCSqTWtu8tCWOnYZ9DLVExXw7/nL9NWfpAEBvx1FzZ52UjCCuRk9eS
         jUhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789795858; x=1790400658;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iDSXDPQtwjL7QMN707DL89rqjryGZ/GwAAl925LsBhA=;
        b=Tb++9jk0/n6iibeAaXg4XBoD0OM15nAmNoBcWnMDAylceCWHcu0WZsMemZshO6CVV2
         SCmHMzcRujk+uVZYMpf11BBsP8l5g5lGRJuRYo8npqRvGownX1AQexLfDygIpP2YovoG
         jz6Olrx9/lxGjKFh7X6driuXOGMJ0cEH9xQIWzQlOO511haM/GisNsjFXNXXMLNGuzE+
         /DJ3pSaOP9wKA1z6L3Xx4eEoDvC/sBPC93nbA4P1n+Equ5J3FWOgj76To+gtyrw/a/oq
         JSEz1X04dK9ytDSYvhXKP6gL9O9NR6BhLDJHW/oVS7HgSz3SOZYOVS50WxK0EQm/pZua
         CyZg==
X-Forwarded-Encrypted: i=1; AKwUvByYs/eFfaR/mWZsid/T7y43y56OTW0iKMV0RtPo1Yjt2gq/Z19SYB02rSbHQpw0wgcnZIhbLB0EyC/skl0=@vger.kernel.org
X-Gm-Message-State: AFuF++mzD/5A6CoqMlOTCf67cVkMCW90coBRrigWFoCYKBfvipQxAVgS
	lwbqGvZ0dqy+MgZ6axtmfZcjVBG/WddY7WY464oOW9S2BYNnGaOBDmnW
X-Gm-Gg: AYBFou2g3RGTUtOUgJyBFZHQL49Ziw1V79+PjbUqquIzJFNqEA2bmyrNih1zivRnhht
	JuIS+XsVoWwyi0p5JpKKB/+KGi1avHvPMYXon82hIpHePeI4DRA4g1NbaPPBemwdvwHtfFxlX3m
	9xDTkyajC0hYd0ociF1ofKnsdXhuOa+9qE1bqROJgGeanmGeUh1vcrPeF8dCgEx0XPQnYjiDRcH
	MjeWnXphzGi7VxEW9uAO6xFiM8AqBYmwdv5Kg4em6ruseop3hlgNrOuy0f0VRujmw3Shpdix+gV
	DBa7bAyl83oKdtAtN3Yb5SJazPQeXWn94way1JYV4+xj3Ba0nPTuvLdy36KRNV1805l8fM3OPL8
	tA5yNG25vd7puQSedqF3edltPW+7kOTgopdCgo7gfDNDlvajvbDBcgV82L0SW4uMx+qSQ2BNaj6
	tFix2qp2YjqnprQlleQSTwlE+k70MDbdKEJKPHdwFhEHVtAjfINr7DLc/sNyaKW8QLwbafP/uzM
	VETO3jRgHlGN4Osd5Y8Lt13eWxMz+M6etZVf8/DrYBbCv5gMBrV7W5YdZdqeR9nftP3mRoF9aiM
	Ib30ZxJ6Cjihtp0iNtdFmMDo7X1+XcGmfXrHL0Z72Nfx5diLFwiRlyjE4bkf6ulg2c1Vt6jTrW1
	Vt+X8pP/9ia1Ra/BsQQ8rHnImFQ==
X-Received: by 2002:a05:600c:1989:b0:496:c1f3:e8f8 with SMTP id 5b1f17b1804b1-49fc5673292mr67378265e9.7.1789795858091;
        Fri, 18 Sep 2026 22:30:58 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a017-2b01-05fe-203b-7cd2-a640.310.pool.telefonica.de. [2a02:3100:a017:2b01:5fe:203b:7cd2:a640])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc5748e56sm107214215e9.2.2026.09.18.22.30.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 18 Sep 2026 22:30:57 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: David Howells <dhowells@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Jeff Layton <jlayton@kernel.org>,
	netfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] cachefiles: Fix debug parameter sysfs path
Date: Sat, 19 Sep 2026 07:30:54 +0200
Message-Id: <20260919053054.26169-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260822075005.74963-1-kmehltretter@gmail.com>
References: <20260822075005.74963-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Sat, 22 Aug 2026 09:50:05 +0200, I wrote:
> The module parameter is exposed below /sys/module/cachefiles/parameters,
> not /sys/modules/cachefiles/parameter.

Friendly ping on this documentation fix. Is anything else needed
from my side?

Thanks,
Karl
