Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627617;
	b=xQKz9+zMfmFpVfy7lQ/j8T7MhCL+/d1eAw2FzPVA49KBpf6QnnkZNTVGkACpZHWxJfYx
	 h/YIj2v3yIbngKtwLUda/7WibQgwfyI+njkwxYeeaZs1KAWPpUiO8bAPX96HppNbdqsrJ
	 TlFWwWS3XSEVmlWWQ2RcDTuJ3EbEU6bdYbGusxdkLD79m2blh2AnoNt03W3F5Wz9L2P2L
	 5E+gYTfXsFOpcrw7R1HJ7BSO+yUv1gUNRkpfrGKBuf0o3cg6Z+RKzH/W1NvoighpA0ImN
	 8ifRCOrparMUfEXV6sbwZ+GvakcD6wB/TOyY3Pep1mJNJzIwa6ViZyce4aVwnBehAnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627617;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=E/QJ/KMx5WyVj2J4TdNqaAQXU0rL7hIGOlDe9g33IzE=;
	b=cEEna+MwgtVnTwWp5IFMhM/fr0L2YTg4vfDEHnaYJzD6PKXnaz5G/saxkzEUOJEv0SBb
	 77BDI8E2lk7A7vSZgC5/HRLyoA0xOMl2Bc0UevwKIp0tLOXRg8EbT7pSUrTULfcZQJsn7
	 Wl2JlshUbRJvXWDli07NxntREfQL6DmApyoBVAtOjdu7DK3GTo9e2uchsNznpU+Uw85WT
	 bzbMb5ZYVV6+Phl31373nMYyL3YTMqxM6CM5FMWy6AckqKjkTbbvb5fPCTX6GZ3hQY9uW
	 ltrj0fSIfah35qp7EHmcgMz2IIi/FWAFvBX4z3dHg6fbKhEkcfLwEegTBRcN20x/3TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Swbm8bhZ;
	arc=none smtp.remote-ip=209.85.210.181
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC6D606A327
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 03:40:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FC6D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Swbm8bhZ
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8a05b210703so758714b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 19:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1794627617; x=1795232417; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E/QJ/KMx5WyVj2J4TdNqaAQXU0rL7hIGOlDe9g33IzE=;
        b=Swbm8bhZoLVt463haIQp+R3/P1wcnkOFskVWDfwhp0AZfE6Lxuem+EtPdpusnoeQH/
         8UoqDEMI0SE7yJDpFCdUfDgFebiZL4vQMVax+1ZFiCivI9JJUgP6SYwRueJ4F/i2roat
         jsOhxPQ5dkrwm8pm87hdstcKmZPXz3MRilSiLkAQlC2529WYAKjtDkdkT9zeLd52WX8I
         QA18p6gOIHq32OxypSxxTV8xkTYdzzuTLFKeiBURfrVblVnDKJ7T8dG/eIerAe8d3Ziu
         568M9oQF/MXiyFbArVgE/fl39OQELrkco+txj1RRz+5YiBOiBrmwNy28OQOQzGEISnNP
         mp0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627617; x=1795232417;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E/QJ/KMx5WyVj2J4TdNqaAQXU0rL7hIGOlDe9g33IzE=;
        b=tULoraAD/H5m5pkHfl44TiQn0vP96jjLnB530eXysL5QLhPun2ksyk8uMci1SKEcao
         BRkrrgqAJGjZx4ErJnt2KRCs0hVli3m79G3VYHsHHknSi52SMwMCQfhPzz4j610X9LDE
         WyAJ7LCXiMJy7/GXm0oPNMXwGVDLvGnVOMsVwmCxdKUaJHGJ5juTv9Ugj24CBp/OtYNW
         QW9ds1y4g2XGD/Gnomhc8r040zez6avB17N2VmT4xkSilGObUM+M+jd0HaA3tsbqhb47
         Q/IBiJjeidQTDRy8aGg1DSSrsek3O29dU2JNB1neZdR/eVdDU5INvl6kMEhmwlPt7823
         h/Xw==
X-Forwarded-Encrypted: i=1; AL+hErGCvHLSpD8u7d8tG5xwWc2y8dO4nY4Qs4jNXreALnNTe5ZHW5oNYja7Wd1glKa0Hx3fvFnmww6kDaA9198=@vger.kernel.org
X-Gm-Message-State: APuU4Z80R2PhEpCtLDgPi+PlOt2J44dSlt1obMBMFiboS75OejQGlWcD
	1ofvt/wmZKvhiZ/xhaMnoeNGtrrvZrjO7Km8eYP/lNpc54UUde95A4qR6wKWQP3CX8I=
X-Gm-Gg: AYBFou3iPBFQINlEjqOz+sehxgHps+so1hTW0eI1wHRR/vNXxpAzDN23iNxeuuBsNQZ
	J+JBQCQT4BtVto6pHXqCImw2FrMuHxX8MD8e/7PmP2941roL5nMb826LjShvy4tNZFOMcdzs3Rf
	dPdInGQPUIY6WiGVyEGs7zl6LRosgJO5jPd90ozIkcQvaqrbLLRtXo/NbXl/PtWfvSVALvMM2FP
	3DE5jQmisfFFGAn/ozH86k9MSAtguVmXnpssP6FTZMrqo2vE7wcqAvYhPIDSlWoVbYlKirA873f
	a8i9rI/EI1a91GMv2I/KxyZb2Upg49uJ06Gs2M1H5D4PWdDURr8uUKYwEe1mEtmFDlacDB8+hF7
	H27tEqDzk9jwp3M26+bBLn3NxytancUpwNQMaVXr7qrs5Tz82wfO8m6dh9eFLacM4Dyap2OX2RJ
	qBWW0DxtPMYjxd5UZ8ikhQyb3QgfUeCCSW11ATUa5wJ9ii1R4nJePtXVyAfA3lx5Ri5fzm5bXjx
	0RIO3efMt9QyhScJiQpG+8+JAAXuUp7ZEejqoiAJKDNeAZcvLeNpysqXBij8SapULxDvDIDmqGQ
	6wOXyTnREssZbsmp6UbO+0BgMllG2TcS4fx3FHRaTeD7AGv9wYHtb2jBuyIM3lNQ8gshkpXdZ33
	54H7w0O6vmvWGuNfmprZe5rHKVDVgkhmtZUA6vg==
X-Received: by 2002:a05:6a00:1995:b0:8b6:d2f:72ae with SMTP id d2e1a72fcca58-8beb53d9ea2mr4567673b3a.18.1794627616742;
        Fri, 13 Nov 2026 19:40:16 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:f861:b117:6318:c068])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263b648sm1705244b3a.46.2026.11.13.19.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:40:15 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: ching2048@areca.com.tw,
	mkp@kernel.org,
	James.Bottomley@HansenPartnership.com
Cc: linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	thenzl@redhat.com,
	erich@areca.com.tw,
	yhlee@isslab.korea.ac.kr
Subject: Re: [PATCH v3 0/3] scsi: arcmsr: bound adapter-supplied completion indices and message lengths
Date: Sat, 14 Nov 2026 12:40:02 +0900
Message-ID: <20261114034002.549899-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1791803953.git.yhlee@isslab.korea.ac.kr>
References: <cover.1791803953.git.yhlee@isslab.korea.ac.kr>
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

This is superseded by v4:

  https://lore.kernel.org/all/20261114033810.549787-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
