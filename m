Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612591;
	b=nKJjixBHnjYFEauVWRi0fZGG2vQht03sLVJNgJFkaw6gNkHNjm6DYcW81dxfD3nsvZ6Y
	 VpYY9kr+EFMdlZX915jmKCBVuJ7Tp7bviFCBB87ESRxUljc72AI72ZmvGANvCc02lNhtq
	 UZs6MYoUOpxJrv2scpTiDLJBo15D0JoRIGVoSAFZ2U9ls+TkCZjoPwTFtIbQbMzp0aN0j
	 sb1n2REDSIuCH6etk7x5fus822gFQ9PgZR5/N9CMDDwHfd4RYUDeb/oqbeO67Taq+aOzx
	 LZ/4zkenoywcWbN3vXQC1GdsxhWwFg68gANpDTY8kgiOtVxfx3nvFk9Mr0yinAG6Icg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6B409QdOnvI4K640/GRyjBqzLJCAanW7cL4zy0aAKRk=;
	b=awM+vZMSiQy5csEwAmsTmYZXtD74AuWdZEe4ziLjU3Xo8CPSBiCEMfAgVxMmrNmMynpx
	 xAJN8pVp5cVoe0WhXukf/enUxjVtrhQW4iXR1ZaDmqvQ/APogMUauQramtP8jfb+wnTND
	 urBpM+p377JbNXFM2u03ZRlGceBSiMyQyr2ebmRosjcwXmFp95/EfJq6juztMjP51i3fd
	 LP9XCdlJ6UHsxGa67FGKcQsdDFpR5wNYP/O+rNl5GwM3YluzXcggLiEQUIqmjRI7SO6hB
	 MAulG69JG359IQUyTeBkuZHn9KIYqAtH1bHxDVgVlMBGxFQcGP5RK1GpLROvLDc44og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJMJVYuA;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA63A606A327
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 09:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA63A606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cJMJVYuA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a214af2076so20643135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 01:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793612589; x=1794217389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6B409QdOnvI4K640/GRyjBqzLJCAanW7cL4zy0aAKRk=;
        b=cJMJVYuAWVoaYwkyiNjlAEONxZr6+M9ML6SRyadMccsHMImZ0MWRheq7Xdn3ZkwFY2
         q8U0K7yGEvv6dqDplu6A877k6T1uSnLg4bmATjrW/rFSU2rMBibYOph6nDiHZmC6BNuE
         DSGuDaJqy9b75U+Jyt+m+KTMX5TKhHzAF2vghZigjc+CeI7aQb1MnE4jIHnf71fHRfZH
         HH63OuS9qRr8APwHgkCJXq9WfcfgAP/MDTKT5yMwIhZMyc0KWHFNd2GCjGKGPXv2isJC
         nAXtMn/1OQMf24+GbSLAM4N/r7yu6O+XLqXt2V6nkxl8OA+WAoIyRJPT9K8+UX+NDGAO
         VILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793612589; x=1794217389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6B409QdOnvI4K640/GRyjBqzLJCAanW7cL4zy0aAKRk=;
        b=gOTqXwJZC7hcznuvT8Ekc+tu0JFFEe9Klh9qRd7x/pXRdYX/ezOlOSyfZr5RCp7gAH
         FH8A2bai+j/iV3XICN0/CuI3kTaTpH4A7yv1K1dpf05lq1/r95Eq0W2/PwG8HQh14pMP
         2hAWNoj832evb+NBd3lRsQB8GtR8AR/CoYFuILi41Aa7u1KvAdPoipbPIYRO3eK4OH/P
         ySf9OjP9ysi66GVhwjDosA5x+PvQlbiaeik7Uq6D8HN+U66LfCgvY8WIOggq2GyZoRVO
         r+otEywtnaLthj3hadv7qsyxznOguWbNPFYzGcuJB4xVrrZRm/8HLI/ySJ/xzjVv9+Ja
         CsMw==
X-Forwarded-Encrypted: i=1; AKwUvBwXnmcEMAPj0CTksXQW0MZ+oGzd4SFAeqEtyjWmC2+eNFlR025vSg1A6kD2Gm/odAp8iyTfc5aYTZquUoE=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/qJ7erlvJ+SpXuozYo1QeKt9MdNQQFW9t61GtxBcw2MpOgsCK
	ixDupZXmjjoeFbBa9fPlrJYHTxvkvxholqxmxhYKSrv3kaMM1WcNUhx4
X-Gm-Gg: AYBFou3ljz8MQcYhBOisQM2L0eB2FyU9M+kWcUOgsNT0/qgZNiXwlY8/PGQFJg2tbif
	2eDpXFgQ7eGiAZA7XvrY1l2whT6UKo1M+zsN68Qe3ASbKT3mtNhwQl2L8x2AjlzwB8OCERbjc1l
	3X/m7asWoHZm7pXz2Exqy/LIJHwxL0YIjVf2uPm4V05X9+iCxh21CRl1iS4/mlv2/YXqmtsHxTN
	lpXI1h/lNqOwsT0a80tvRE7mbo1fnzVPeKjDCkZdVb0FHYY1sVMGi4JenvyQFF1b7fmIxJ0xK9P
	ELGxPZPz/fn3GMWsCXnxZYSonETzXUR93QKVQgMXNRh/78TXyYMp34V3c8cRvlQJo8Wdzn88Rm9
	AZarFG4I+rNoPXPnqOSTfGCgjxnuPbxfKqQhxNEEVkgFW42088/BLUZnByMW9BbCfvUjbl4Jsy4
	pYBjCw3tQNsdP6O5ydK3rm5T8TmtEJqh34TYiv4MkDj1E7qHXFvO6pzy+pFblpb3y3Cpdkrtvvj
	rnMGkzdq9MpxXdpq2zJbw82cxLXTXKRHCSFepSm/36whlReyQPgcbQSRRcogytUIe9d4gQh2KBm
	xaf9qQdPI4E0VA13M04RVZ1Z56OeXGM63N4Gymk=
X-Received: by 2002:a05:600c:b8a:b0:4ab:c447:49df with SMTP id 5b1f17b1804b1-4ac182dca8emr210351705e9.23.1793612589183;
        Mon, 02 Nov 2026 01:43:09 -0800 (PST)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm332507285e9.7.2026.11.02.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 01:43:07 -0800 (PST)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	Joshua Crofts <crofts@kernel.org>,
	linux@analog.com,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v3 0/2] staging: iio: addac: adt7316: clean up header inclusions
Date: Mon,  2 Nov 2026 11:42:34 +0200
Message-ID: <20261102094236.57757-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up header inclusions in adt7316.c by following
the Include What You Use (IWYU) principle.

The series is split into two logical steps:
1. Sort existing header inclusions alphabetically without modifying the
   list of included headers. Keep subsystem <linux/iio/*> headers
   separated and insert a blank line before "adt7316.h".
2. Drop proxy header <linux/kernel.h>, explicitly add missing headers
   (<linux/bits.h>, <linux/err.h>, <linux/errno.h>, <linux/kstrtox.h>,
   <linux/pm.h>, <linux/string.h>, <linux/types.h>), drop unused headers
   (<linux/i2c.h>, <linux/list.h>, <linux/rtc.h>, <linux/slab.h>,
   <linux/workqueue.h>), and maintain alphabetical sorting.

v3:
 - Split the series as suggested by Joshua Crofts: patch 1 only sorts
   the headers, patch 2 replaces kernel.h and adds/drops headers.
 - Explicitly include <linux/err.h>, <linux/errno.h>, and
   <linux/types.h> per IWYU following verification of symbols used.

v2:
 - Address review feedback from Andy Shevchenko: drop <linux/kernel.h>
   and include the headers actually used.
 - Split the original patch into a 2-patch series.

v1:
 - Initial submission.

Abdelnasser Hussein (2):
  staging: iio: addac: adt7316: sort headers alphabetically
  staging: iio: addac: adt7316: replace kernel.h with explicit headers

 drivers/staging/iio/addac/adt7316.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.56.0

