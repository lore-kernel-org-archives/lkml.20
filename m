Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C1C25B0AA
	for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 04:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791691392; cv=none; b=izkCkOpKnMFdL+HiszNrB2XjE696JP92JEfaIIudxl6dynx+8xm/tHGCzTiUlzcJIR1eXMn90xzkcLHtbj1mf7MVTrgt4P4ab0imB9456GZkJTi7gnd6YjvYrQhdDNWhomci+m6iEtG+9sbrlP52elvbj3OiTHX360z9OovJ7oA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791691392; c=relaxed/simple;
	bh=YNo0nmhZdFFI5JJxf4mNrEwSqwmWNHiOAPm3U4bNRSg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMFIReKlliCFtJ0IWK7tOtzDjK+56P0OUjLCmsn1BIWChGfWwH1HW6POATzrwc7lDST5S4QGEqeucjC/zpjH0i/LJU5vhvvt/1L8aRUmePJOLXu1Qa3wd3bf1nKtRySpqCXaWjHkZQYTXgjRPlvFN6yv1Qr5s5OuJTlJm3gc4WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr; spf=none smtp.mailfrom=isslab.korea.ac.kr; dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b=IbDYi2go; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20251104.gappssmtp.com header.i=@isslab-korea-ac-kr.20251104.gappssmtp.com header.b="IbDYi2go"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ccc7a6070b4so334956a12.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 21:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20251104.gappssmtp.com; s=20251104; t=1791691388; x=1792296188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SmESCEDSEEVGWRUbF5vPlQHQGJwVBn1FgqLmhtDMxpo=;
        b=IbDYi2gobZ5v/icpfbvLw7sPIiS63lJKbFcuQ/4ni05ge8U5DDuaFtesdvijKrCu9O
         gZOj2JNwyIQgqeYqdv/SnYqrVBNA/vcKFH3z7//JUH2iQCK3ZW0gQkiH0Uw0bUrZqNa/
         cl+Y2y/SwePcxGSdPjbw0iQs9u/LTkwSwuEjhjRafzqIHfXgUigDuRWVrzV0QMak2nuG
         1VFL9RJXTz1CknbMw2DH5uov3uY/CgQRTiDA5jCilZqJxGix/5ThBWjl2aTc63UNxGMr
         xhc2p05Cg8Md6I7lXk1qcUto9IXlq3KVIyxnHOi39O98frpgH3ULYURSGr8C19iHJQj+
         vItg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791691388; x=1792296188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SmESCEDSEEVGWRUbF5vPlQHQGJwVBn1FgqLmhtDMxpo=;
        b=1WHUUv+I0w1iFq3Kz0UgXKwn1pTl2E3b++kVGZoB5HqU87zLOoFtp6Qfp0zJgV0oGY
         6F2a5Xh/iZWoA0WMtDwKNIIuxfnpqa/+yy4n8PSDV+uQmImdDOvz6lLmOAdXgQJ/nv5L
         E8ZHtRwajIecCNZ+/Vth7k0Op8DtkBVcAFjiM+f7rrE6ydjNHvjH2hgj0fZn0STLMX2X
         n4kg5pDW3sLd99mYhzY/uSmVzXCluyr5zatFndyCtIQZDCovqsHyHFBOyYu07HrMjwIn
         uRYcEasVFK4M8Vnn7Ucfg3VxWEfUVkpVOJK+ynmbn9oB2zxTcASgxzLVkPVreCQhOqOb
         3lJw==
X-Forwarded-Encrypted: i=1; AKwUvBylrH5N3FHnCjHAq54pjxy+fbOSEIs4+aHvWlg5kTY7WcJlOyKtQ8GJCUlJ73MluT+D9lNssckBKtJe2nw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLL3ZAemzjTVwupDgI36hl8wSPlLfb+zsgr+g+G4ew1GhMS8J5W
	f0AVKBZhg3qOJZAEZPXYbGYeG5R4pa6IXdS8Zspw6pzIuNG5Mwi4btpcH3L8JzwvmhY=
X-Gm-Gg: AYBFou1vDSrMJrxImAdkl5t7IHdpsqZRd7EtxG9xByuq/3QOAEni08jFHWT/c+2MpVo
	Rf9zdnAm3b0DzDRxKQDYXp4XI5zTDpCo39xkxdeOCpH0bQvG7Whv4RPUPkv6FAQRLoRQGyZqtKh
	Ahrjwc9bAHSbO5gAK2/Z6LdjnVdBhhmTF/f0ZjwlLncO/VkIb+m+WRkMW7+M3ZzmqZmUM4FqySk
	WWlkCKvG8XP1Rc4X3HW3lg45fQvg8mNFGi9ZFZ9+0JO9cP2WoCTNadEMxDqz12158fVjgvaaTSG
	5qDTFy9hHt3HXI33IgIb4VWUMhRumkRyQ3YmOn3wJeh/dhkDNsEN2aekc3xiItb0BmHzw1xgkGA
	qdDSb5GSalVoc4oJ81er46tSiTig/D9UhT2i3eF54qgviBpe7o1NVCN771QCO/2YJiMwd1va/uL
	Kurrj1Otd8sd4ShP8kl6V9tFeJxTCeNJxg3mGqwS6cgDjBxufG44gvzlbejf0NM6NP1RhboGyS/
	IefYjc63qXlW8bs5giagg==
X-Received: by 2002:a17:90b:524f:b0:3a0:d265:3647 with SMTP id 98e67ed59e1d1-3ab3a35963emr4673675a91.8.1791691388502;
        Sat, 10 Oct 2026 21:03:08 -0700 (PDT)
Received: from localhost.localdomain ([2406:5900:1044:110c:9657:9541:a576:7d2f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab38b981b9sm10519758a91.5.2026.10.10.21.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 21:03:08 -0700 (PDT)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: Nilesh Javali <njavali@marvell.com>,
	Manish Rangankar <mrangankar@marvell.com>,
	GR-QLogic-Storage-Upstream@marvell.com,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	"Martin K . Petersen" <mkp@kernel.org>,
	linux-scsi@vger.kernel.org
Cc: Mike Christie <michael.christie@oracle.com>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Yehyeong Lee <yhlee@isslab.korea.ac.kr>
Subject: [PATCH v2 0/2] scsi: qla4xxx: bound and correct the ISP83xx reset template
Date: Sun, 11 Oct 2026 13:02:55 +0900
Message-ID: <20261011040257.2017421-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v1 bounded the ISP83xx reset template read and walk. The review of that
patch raised two further problems, fixed here as a short series.

Patch 1 is the v1 fix with the template size and the per-entry geometry
read through le16_to_cpu() where the bounds are computed. On big-endian
v1 validated a byte-swapped size while the copy and the walk advanced by
the raw value, so the bound did not hold; the two now agree on both
endiannesses. No functional change on little-endian.

Patch 2 fixes the reset-sequence array cursor in
qla4_83xx_poll_read_list() that the same review noted. The cursor is
kept in a local and only written back when it reaches the end of the
array, so every read overwrites the same slot and a later
read-modify-write entry picks up a stale value. This is a correctness
fix; the index stays inside the array.

v1: https://lore.kernel.org/r/20261010181139.1911817-1-yhlee@isslab.korea.ac.kr

Yehyeong Lee (2):
  scsi: qla4xxx: bound the ISP83xx reset template to its buffer
  scsi: qla4xxx: advance the reset-sequence array cursor in
    poll_read_list

 drivers/scsi/qla4xxx/ql4_83xx.c | 117 ++++++++++++++++++++++++++------
 1 file changed, 95 insertions(+), 22 deletions(-)

-- 
2.43.0

