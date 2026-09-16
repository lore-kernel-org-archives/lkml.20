Received: from mail-pz2-f41.google.com (mail-pz2-f41.google.com [74.125.228.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED82350C282
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 14:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789568591; cv=none; b=UbL6qHS7cXBrOtUrYM8GZ4kf/Nabx+2GDM+q9UMxsgaR3WEXnMMimcQPvjy4hDzXldzTpMgFcBuG4gZaGbEWu0nzEZArYWGb8OGAbtFe+pdpKOVJQ/R8IPbDLZlbfRbulKJmLujS+ebBRgi++eEceUwe9B8cTWVl6jIdFO7q1U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789568591; c=relaxed/simple;
	bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=YNBg52nanAHhoyBZ1/lvO3NA4rAVAciq+8iMSRqi1id0/VdzWAd6hemWZnxWKL0YeQZVC6P17o9xKs3NX4p1EgfGXhzGIAmPWz3OADOnGNXjUo/gIxACJEHykjEM44cPTGUdh0QebkUwHlgpMld3V+WFPGULtZlt071PWN8an9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qj9pMIEL; arc=none smtp.client-ip=74.125.228.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qj9pMIEL"
Received: by mail-pz2-f41.google.com with SMTP id d2e1a72fcca58-8633a38df87so599696b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789568589; x=1790173389; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
        b=Qj9pMIELu9/Z7qdZgggoZb49QLwcDo6Mi/KtnwMKoJubDdtRfKr82a78NUEEidapOU
         gRdoKNBFCBB5Rk3NKyy+PIDtZ6FQber7z2p7Kxl6TFSU5PwAX+6UsZuBWZVSRumVO0l/
         0dUxkfDWa3LdJnGqRjpuhlXETL7WG766aRzpKFu5vybcBQNiJWso5MJQDa4/+3kPKI0A
         kcAFVzIuJ7KSj2CNn1f2zRAU3Avyr4L7oenmLccvb+CLxuiKxRjnaQYN/mQIsypS6l8h
         zcPgnM8Ibh0qOHiEc4z2sJUDzvJ6r1lmdxDBXMGU2X3s7zA0i4uHe/PQ15Otit+0PZcT
         3/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789568589; x=1790173389;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EINPtHVOyicGbgZE3wPjEkEjWD0JYoqcp2SdCRHcjKc=;
        b=O8trqqoS4wgYy9AITz5/znLY7T8RX2Hb4SiyMAoT5oP52U/uW8iQze32/flakK3p+i
         i4ZI6NrPg8EiyI4yTT3sD81f1JRrCTgd1y/SoA8EKnizWB8Mu2Se6EIEW+r2JW7fXMKg
         NERIy1g03ZQ/PG1PonEXqmNUQHMiCkYjMnXxoHCi3ZaiyYGz5QzVT/irb3TIAhzbHGfF
         wJqStYLp/laV4dX+vabGTvDSWHBvMv9wagZXAUp3aPb0ybgjSF5/YwY4jY/qjlh4osrp
         570qeVkFJnblHuNS8AexfZreL88eLxvRDu3/BKhQOp568GMFyCNTKZjUPZ0vhEhuRXfI
         SIRA==
X-Forwarded-Encrypted: i=1; AKwUvBw2Xrno9tITs9hebPMhlr+4I6pC+yOkZj5/v6wajiaLvqFVgwGYgC2G6YbPo2GMzhCRS8BKYmzm8bScYBI=@vger.kernel.org
X-Gm-Message-State: AFuF++mBYOhWgeW9hLR7QKb5OLxityG5GpuFnlagHnui7N46m9L9hEUl
	dW7cn25xVYIJic+4tLGXRxa80lBYpIGv4gOvB5kTX39FHVWyI8TW9QDD
X-Gm-Gg: AYBFou0Sks5LW41MpqnyOvftthkxVD8iG7jcLrasVAL3TRQeHuInegLw1gavri41Sgg
	j+X6oM0LLixItATxVAbVAPx6ET9+wqOimYtHy1ADoMwn9zMO+kes6F8adzuUqEbQJVZX490JUtl
	TMa1/h2Ig4Wa+ABuZVIhOBJhCtwKgcUGRo9f15aazV+lPiTnGSNTIvPkHBxA8+dYRWpliMCALEe
	Jn7dVGa712d0mMdQfSbC/HwYTrsmHXX7JsyYDr2gjQ0K2gAqUqAxXOK+L/FaPO0HAhHnA3/W2uG
	lHqEBsX4hYtfzSK6UkGTCmWupePKRg7vpJqHd1eTmUB+KcdnJHZK9eqXod6tUtujERmRYQcqkAn
	cB+T0mQD7ApQ5CcgsTrsi3sOGywPnUuCyIigr7+nJFs0pFuYn4t2G/zolpYwzlxI3g8HA/izvYg
	fJyWwx4zY+LED7NRARdyws2mt9le790gBaP9/JKbN3QCeuuSEj+qMtBUSarnmGUMUqDG/OZYg=
X-Received: by 2002:a05:6a00:4c81:b0:86b:b308:b926 with SMTP id d2e1a72fcca58-87238c81c3dmr5081392b3a.14.1789568588753;
        Wed, 16 Sep 2026 07:23:08 -0700 (PDT)
Received: from [127.0.1.1] ([240e:b8f:977f:f400:ec2a:b15e:fef8:70a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87201d179aesm1390884b3a.50.2026.09.16.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:23:08 -0700 (PDT)
From: Liang Haowen <nbg2974@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH RFC v5 1/1] leds: asus-aura-scsi: Add ASUS Aura RGB LED
 driver for ROG NVMe enclosures
Date: Wed, 16 Sep 2026 14:23:04 -0000
Message-Id: <202609162200.ReplyLee0916b.lhw@gmail.com>
In-Reply-To: <20260916130602.GS11487@google.com>
References: <202609012200.RFC0.lhw@gmail.com>
 <202609012200.RFC1.lhw@gmail.com>
 <20260901145204.2BF551F000E9@smtp.kernel.org>
 <202609032000.RFCv2-0.lhw@gmail.com> <202609032000.RFCv2-1.lhw@gmail.com>
 <20260903122408.3CA6B1F00A3A@smtp.kernel.org>
 <20260903161357.GX2133376@google.com> <202609042000.RFCv3-0.lhw@gmail.com>
 <202609042030.RFCv3-1.lhw@gmail.com>
 <20260904131503.355C41F00A3E@smtp.kernel.org>
 <20260910093232.GO2133376@google.com> <202609152112.RFCv4-0.lhw@gmail.com>
 <202609152112.RFCv4-1.lhw@gmail.com>
 <20260915130050.E8CDB1F000FF@smtp.kernel.org>
 <20260916104305.GM11487@google.com> <202609162015.RFCv5-0.lhw@gmail.com>
 <202609162015.RFCv5-1.lhw@gmail.com>
 <20260916122740.921E51F000FF@smtp.kernel.org>
 <20260916130602.GS11487@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

On the three sashiko items: the naming one I took as a fix. The doc
says sections that don't apply are left blank and shows "phy3::wlan"
for that, so v6 uses the empty color section explicitly,
asus-arion-0-0-0-0::led-0, with the "-N" ordinal the naming section
asks for when several LEDs share a function. v6 goes out as its own
thread.

The other two are the same false positives as in every previous
round: kzalloc_obj() has been in include/linux/slab.h since v7.0
(this driver builds against 7.2), and blk_rq_map_kern() takes four
arguments on current kernels, called exactly this way from
scsi_execute_cmd() in drivers/scsi/scsi_lib.c. The bot's reference
tree looks outdated; is there a way to retire these two from further
rounds?
