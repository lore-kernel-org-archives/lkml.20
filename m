Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794057664;
	b=ae4DcGEm0hypJYLznBstZb+8Z4zVwIZUgndLgjzdJfp1w5KVFZhdVc19uuzarRPVI0h5
	 Rt0A6NY0MT1JRH4nbsHsZiC+O3/TB4kDm+MLn3nAPcxB2wPJTpolKG97WPdXmibAp3wt5
	 ozi/ce0U4Jsxp53oAxFjWXzGUmCYS/TTwntGxN0u2AYuQmv8CQq7OW+mQehiE4AAvof90
	 n3e3pkEVy7v5YKeFBLE7DhBYMrydA0wDUfRklRpE+tlcmYqcuMH9GgUH5n0xVP8/QH9xr
	 SAjv+H4NxvZbPgjqKVcK89aicDhelPZmRzSTWwZrWBtLz4Nhw5P6OfWjswHrLo/qDEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794057664;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KIiaF2zkqraRDaGzuBJLS8MFpCqmAqCaUnqld6tkcbs=;
	b=ROz61YqXP7rcZ/Y/vvvDjQoGZ72vT1aunHvINWv7RkKege2Np7AbiEA+LiXYeyh4XC6b
	 /Aw7ohjexXnWdFlkKTXthVfHlxVHDU7gZh16vtrZa994zATqXwcsC9o+QPpK7ESqd3Lwg
	 BAjZtRNc0SZDVMui17YsUEkQpcTYvhfvpvz1HHwjtw/s0NhqTHs0OXA6av8Knx8Ke1plE
	 vG73SL4ofRHNtvF9Dc1F+lF/nF50vw2ctT3RnflnVNk8lA/yCQwAX2DS8c6NxESPzj1br
	 KaLIJAnfHncU/a5fWwElLaBlhHMkUSfyMD4xnBcnPffwg7xVWUtbT/XCNEcGuyLrBNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuRUFPIB;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D88F606A333
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 13:21:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D88F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zuRUFPIB
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3ace1f3897cso746890a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 05:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794057663; x=1794662463; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIiaF2zkqraRDaGzuBJLS8MFpCqmAqCaUnqld6tkcbs=;
        b=zuRUFPIBURw5fma4XvmlZA110QqjHir5dvDOtsVdk1SnAPOE/dpyFbLYrL2J7oYxGB
         Irm5an5jBmBDZoXU/LWxYSU49zezFCuZSGV2RYr5H7LaAVApbMGe0giR8U3/9Tw3Bv72
         3reMDgC//9/WxWVQEZRmvtxx4BmruyPm39XR+vZtBsmY5Xi2xH4MFlb/PTAXdfzEVtAh
         ZBaVBkTSjxNrYN3SDIDEZDaw1bdX8BBaxFM2aGqip1LYSmm8NPm/ulZmraFuBZepX7oR
         9L2KIFuRAKrKJ1xRFYqLFUjpGB8sbGqi85tF8XiZZzB2tYUPgQxl04cIwTFJtejjUWzW
         PtKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794057663; x=1794662463;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIiaF2zkqraRDaGzuBJLS8MFpCqmAqCaUnqld6tkcbs=;
        b=hSMI9gKctfEsmlqioCV6C/pdwJAaGILuTTLJz/WSqalf4+FioKRPXNBIQU9qkSnn3o
         3RvApXDpew9Rn9Ys6WJA91jaT2ySXHIHWwqNVfIr9pnVhllL4XvulORwpYy5teMJursw
         4SDZntceEn3pX+q11XUISuc7dGTURtZJezs9jfa/HAp5yIe1ZG/dbG5d1nIk5+Ew0ftm
         9UCS3A+ZBLmA+zDxQkG8YUaiQgmxKOaOE8LLyeG9uTmINovCT/Bav/VBJn3MUMu/JPVe
         3ty8LLx31xAtcBEp3ydrUVpYd9kFy33pvwtlreQUfDYm4BkpUfJdd4kELr9Ws14ybb1r
         lP2A==
X-Forwarded-Encrypted: i=1; AL+hErHqm6BSOYiQ74YfmZsgyZC2dK9e8G1yy9pMJE5OtkzVuNaIynWsfCTqbjFnHVuxruu0qRKNKEir1OjZReU=@vger.kernel.org
X-Gm-Message-State: APuU4Z80FRO+AtMGFa8TtZ6RPOTQDBFubvGqpoYbfTdLSWTPB1eFAVDz
	/ixscrbIiHgfeEkIDdejh9p9hWN+dQhSLF/c5iAX20Vpl4ju3n72jjZF
X-Gm-Gg: AYBFou2uuqm7hD0RpMAYc7tEjbl2rY4dZbuGcaYvsbUEuSaabD4YhhdVPgaGQOBgkV8
	QlEUsetYhm3wxVP4cVDxN7Yk/1ucGriiVHg5dGHemm3ycrlxgp5SJePtB6wNMDQpyzU4UMvs4J6
	OsDDqvUVLyd+kYYDc+j2FFJIbWZfUM+tMEQ9dBQa7cICWW6ixjcGeYA9wzL2JDFvDuoSorxalqU
	ez2swidMiuRLd3iZNOWPQcZeeWXF72lm5c/OV2r4CeZICmbtD368xtqCAo285hB6yz0MLuXbyYf
	RkJPwAonWXu5vlrHv0p6OfdEI3eQuXFwYUzd2DAXZV6Xv0QvL4g5HuDlEhAEd+m2wmXrcF0EYmp
	RyDh6nfUv4LcEPx23BjZk82JmvveAtx7xwI4/JA56YSeg1pAXcp3WaKSX1SAkmVFE/yshHhxeNG
	ZCVYCNNAJxgt2O3yNpjMfUxZg26nl5vyGpc38yjpVj8jwu6x+9VXmcuJ9kaZ8xtDCCzF3FV7Xy1
	XiJmZ8qAsTExzbODk3Mv5UIJd7Q9edPEbBecpC/FmB46xi9mhjnakebeOLIYVn9YGwy5C3O1y+W
	nWl8oJnEoo0irMApRoS/WGt1uP3MDAxEqZFYfLJ7jgB0Y89sOaKkU86wEP+B7Fpz99s7g7WFVfA
	=
X-Received: by 2002:a17:90b:5307:b0:3ae:898e:a123 with SMTP id 98e67ed59e1d1-3b0db6c9909mr5456999a91.14.1794057662730;
        Sat, 07 Nov 2026 05:21:02 -0800 (PST)
Received: from d.home.yangfl.dn42 ([2a09:bac1:76a0:28::1d2:30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b101d3d0e8sm1626521a91.3.2026.11.07.05.20.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 05:21:02 -0800 (PST)
From: David Yang <mmyangfl@gmail.com>
To: netdev@vger.kernel.org
Cc: David Yang <mmyangfl@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 2/4] net: dsa: motorcomm: Fix RMON fragments stat
Date: Sat,  7 Nov 2026 21:20:34 +0800
Message-ID: <20261107132040.1066996-3-mmyangfl@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261107132040.1066996-1-mmyangfl@gmail.com>
References: <20261107132040.1066996-1-mmyangfl@gmail.com>
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

etherStatsFragments counts frames with a bad FCS due to fragmentation;
report the dedicated RX fragment error counter instead of the alignment
error one, which is already exported as AlignmentErrors and
rx_frame_errors.

Signed-off-by: David Yang <mmyangfl@gmail.com>
---
 drivers/net/dsa/motorcomm/mib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/motorcomm/mib.c b/drivers/net/dsa/motorcomm/mib.c
index 5c027edb71e3..90b0ef670aa3 100644
--- a/drivers/net/dsa/motorcomm/mib.c
+++ b/drivers/net/dsa/motorcomm/mib.c
@@ -336,7 +336,7 @@ yt921x_dsa_get_rmon_stats(struct dsa_switch *ds, int port,
 
 	rmon_stats->undersize_pkts = u64_stats_read(&mib->rx_undersize_errors);
 	rmon_stats->oversize_pkts = u64_stats_read(&mib->rx_oversize_errors);
-	rmon_stats->fragments = u64_stats_read(&mib->rx_alignment_errors);
+	rmon_stats->fragments = u64_stats_read(&mib->rx_fragment_errors);
 	/* rmon_stats->jabbers */
 
 	rmon_stats->hist[0] = u64_stats_read(&mib->rx_64byte);
-- 
2.53.0

