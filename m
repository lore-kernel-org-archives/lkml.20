Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FAA64BD10B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 15:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790005338; cv=none; b=ScSEpT4WlilxLOWdxQ8FpDPxuY7vt+gB8/FO9i/86fQnc90e+3OdbwaorV9aFGlIOjw1WLSI53K2IEuCNRNVUIsIJHJmfGFSLJP6o94Gg01DB4JCiQJOc1Wiv7Wn4qzKG/eOY7O02si1KE+EqRv1o6C30qbsHupCMN2DhPF+RFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790005338; c=relaxed/simple;
	bh=jpe40CSLnJR+ASP1Jg44D29KqeaY3jYEo9GeCz6HsyY=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=uAAWAu2+bmW3iSmlhyP1HR3cW7wz0YZtOhdott9ZFELmHMh9dc4z/3cu9sT6fs2fD7xG3LMGtvLShLfcuKUfBwqirtzt7yE2DrOW9t7kNV0oi48m6RoBdJr9FQzQpR5SC80TblEC1BUvZfrmunQyJZYb/nRwgbtkySj/jLLCI/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q6VH7ZXN; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q6VH7ZXN"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so2982197b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 08:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790005337; x=1790610137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oRhjynb+XOldg80DbanEpxDJlHVPgFhgfFcVSMcrcWc=;
        b=Q6VH7ZXNYl2ryaCaKiai35pgt4ftO5aur89FU1BBqVA8oFNg0j9Xcl4Dhu8HVirwpc
         YBsY9n8T1pHnCeiZzlfuH8hQ8tU2Kx7AIBu2crZRMcH/cCce/GN4jA5fkINWT6drU/Je
         NAYbfbsMqK6dlf+dwgJd9AXjj4Fo1WlL00jNIwlAUXT/7gPncj57r272Nng6w2jRh8R2
         l9idaJPYY7VYQhaklOoaKcisyfFeGUnx5w3J91d3u44T7dXVxc9XCPG+IMkhEWW10azL
         DktYU7565s27YKVffV5WtcAP3QLpbd1YGjvIEBuyIlRmXTkdG6kIY+7/t13IWooDnv6T
         oHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790005337; x=1790610137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oRhjynb+XOldg80DbanEpxDJlHVPgFhgfFcVSMcrcWc=;
        b=W/aVgSXhc+1HvW9F2tLOQ3MtXGvmJR2rJJtqZ00ZRfbQizVAJH8Act5WfWIHk92p4l
         fWnvFSiWy/iJn46PqvbXXIKWqSp8ncdvBu5R7xdpJqNUneFudb71qby7LAX7wjwMFopR
         AVhAV4nab9G8PpykwYXNvuDJBVL28UiEBAqi+W57CrOGC9h4jByVGCGHm2pa85w6wYxC
         Syn4yWTKt9g287HJX0ETUiYk4OqWX6TRctR7u3+ifkinnToHgU+aZ6fpkIW85Wl6GuR/
         iZZr8Q8Uh+l33dVgfn/ohlWvnwvEMbbdAtjP3yXsWlrKZyaYztncTiwTV3S/zD/sgbGR
         h9lw==
X-Forwarded-Encrypted: i=1; AKwUvBxQ6UJPPOcGy29PvP8QLBMgmjZPRw1s/T8Z+LfRudSi981fD0O1ywZCOxkhfO7wpqqpiqpKZYwEmeXr92w=@vger.kernel.org
X-Gm-Message-State: AFuF++ngUatLVR8vBBcD+5ObDuZycmbuufR+DAWCZmc0mIZhlDQ0gQcV
	wb6j6/ee9F7SbgMNQDytOvi9DlULqBPI0ydm31cqUwIL3jnuMxLmDsqe
X-Gm-Gg: AYBFou2fm/Arj7qUFcRuAUSynB3tIPmmyV+6SYRDPHSZ5WcF8X39riRYLmWGzojB0A9
	G4oGpe6qP1fgWCfl6ukA6/OX+SDFZCR6r//Xb8nKHBuvwFVbdsd92ne4Ye3S0OjxchTM7S9a+e/
	vls1ah957ihOpRrtngArd4ncwQl151vjf30L7cstYC3OTa9lzlq6Xvke25t4K5ahqE7Hp3y9tFy
	foi17VT3w++WGJRTIRsOZ0FXQis3fSOYs9+NHM3+CXcjTLSF2KAeDwDWLoZU654Pe+ZgBR8wcKR
	kG2LcJlR/GJcZUMxoIFoL1Y1jePORKfOXeJbGJbeg+W22kbHq3vMc8A0YvMVNTMQwbUjwwNgcBW
	iFwoTn0GygP6hGU/XxPNdpCL/2vpzJPA+YY0Uzs8FROqsIxF8RH2YPedNB8o8L4izR+vYU8TbHe
	T1Bk1uLATRj5sf7rvcowJE3496VZwalXVjmqqsxnjUDJktVAK3ThZmrQ==
X-Received: by 2002:a05:6a00:8008:b0:874:705d:f64f with SMTP id d2e1a72fcca58-874de006378mr14763780b3a.29.1790005336524;
        Mon, 21 Sep 2026 08:42:16 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877aa70200esm3449599b3a.61.2026.09.21.08.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 08:42:15 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Ioana Ciornei <ioana.ciornei@nxp.com>,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	Dawei Feng <dawei.feng@seu.edu.cn>,
	Amit Bernstein <amitbern@amazon.com>,
	Netanel Belgazal <netanel@annapurnalabs.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] net: ena: fix resource cleanup on probe failure
Date: Mon, 21 Sep 2026 23:42:00 +0800
Message-ID: <20260921154202.471662-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes two resource leaks in the ena_probe() error path after
ena_device_init() has successfully initialized device resources.

Patch 1 adds the missing PHC cleanup.
Patch 2 adds the missing MMIO read request cleanup.

v2:
  - Resend the PHC and MMIO cleanup fixes as a two-patch series, as
    requested by Arthur Kiyanovski.


Guangshuo Li (2):
  net: ena: fix PHC cleanup on probe failure
  net: ena: fix MMIO read buffer leak on probe failure

 drivers/net/ethernet/amazon/ena/ena_netdev.c | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.43.0

