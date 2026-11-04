Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810724;
	b=A2RMUEZI0dKERX7AjJFGMSdMGVrdSS3xQKs4lX2d5N1sJga2CGR1p3zIn3X4FIjq2HFd
	 MS3qYC1sxJaDE0tKijc1ysGa0VWkQJr793la8OrhkNCqhmJIHsYuqXVmHbmpN0SZs5yGb
	 6yviPJDoKKKdJgFkDhwJ4FYl6N2ZMfY5RZxc5pzhW6DyeMPAimWGpzzVULVWuwOUYjgab
	 DS9mpq18lyqx59mWbuNwZVwHR/XnR6AgQl0bvfZM/1IGHv9sxkLO/8062QyO1qRJKbb95
	 v7V+T8n10dB4LLP8QyDoVSeJ+KvP6jcemvXbjRmHF1HJrLWN3YYk+MaG79eJNKPYT8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810724;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
	b=dKUH/oKuUdW+xGTynf/JbgBNw5m5eht/YJfcFAcI+vdD5TNzRw+HUKGotkCFR5+ZdjdR
	 UeRU/AfLQRq1c4Vxtzk+vxfj75gnswyN336JOA5LUdQrg7qWBvIS8RNlsJDHlzZ72DCKh
	 GGM4+NF3B+DnRgwhoxBsdXfsCCSdl2kOfDVmyYgE1B74Zltt5VNo4SE3ktIKe5UwkoK4s
	 NcazBLf6gwkz7BoR4wXwC7CTjfKvR0X08bqhApzSibu7O68m9TY0g3z+eAFh1YLEs1MKn
	 rNlSn0LcD9xudejCi6Nb0iEECtCygMjn35vsW7Qf33YarVbF6wQsK1ntXZgxBCxyVQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="aCJZ4/Xo";
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACE9606A32E
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 16:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9ACE9606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aCJZ4/Xo
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1980390c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 08:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793810723; x=1794415523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
        b=aCJZ4/Xo9jKnaTImkPsBsYrn3ZiAHaVH5EYy0bf6wENa9Kq1tc6D6GlpvX5t0fkziK
         wiAUHhfbnFo/FFaTP7tTCp1b8oDIUKJNqcc31oM/cgw5UTvGs6A7zVMmehHfmeh/jSh+
         aDMBdXQ2XaaFhxuyQ0m4HZvj3Ao9VTgB4PbCAGxyOrHJNWc5imT1XVJXThXCSeckHrd8
         FzzYh+R/uLqI+X/n4CgmuKQVIF6q2obULzITNmNETkMsHpPdDbK4/aeIAPeBTPshpCmV
         JHCKzrf2gIhUIPftDnZYbaq7Q7rPcyllVwxNKOtUTIfy/Q3gqhTysqJh3PWEP0QYSyc+
         8r7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810723; x=1794415523;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcudQ4a1QKypHuZuwVny/qv0KumrmKrAsLkHCKA1dD8=;
        b=Hjnvz1GQ/D2CSX9qCAdsEFU/A+d7LEAxAXFrlDXelWagMgQZghtz6swixCytyxdXhq
         pWACC+Qw2UKIruVWztw5kfrZhq1T0wg928ckIMAGoVlQ/mHqdnETFR91E7U3zt/EGxZe
         SOhQPg6F6xanjWDfY9VWS209dl7mhlGm/yuzNyp7cw6mcR3FyDwRuVCzG+uQPdTLl+7F
         +bCzhdQp2ekuHuZNXyktP4bGc1dsNuy76H1XiSALvSTdF0dt+gaDjcsGkE/JWq8cWRZj
         lc4MR1We23vs0HvuaBKWbLcMvlnH1iAt4wlqgzVCAcAg9nctrdmMmP+dp03JubKHRf/V
         BYXA==
X-Forwarded-Encrypted: i=1; AKwUvBxXOJazO3v85UlCch6a7vBs8RvAgfClLdJyxhlaSZzdGJ6UE0Xyz+x1h4TogVXAH2NdR2SElKc594womak=@vger.kernel.org
X-Gm-Message-State: APuU4Z9q/9rOVy1gv/6cAxlbS5dkbAPYo67XAONRlaQegkqgsZYGJf/E
	1n74HspowBEU6EwfGcG44oeP6qbxlGNM5yYlZ8AvtKgpkW8IcKXtzbTL
X-Gm-Gg: AYBFou3rf69c3q+XrcA/8Ie+hIz4Gy5hRA1jmprewqniA+fgPCyortb9nEkWPettR9i
	X5L6rb5NX5qOnpKliDt3EA59A2+WyB8fWF+RVNfjTT7yxWxJ7ML3TWoog9RKGrCOYu0/a87i1gi
	KqHbyF63avWzvqAbUEm0OAdB7EAjYELsCWugI9ES1/8BxoVVQ+3iaQB8H1DVKV5e0VkrkwV7a6R
	ZB3muHggO6Dom47FmrbcAUUKyi04JDv6z4M25o30j9EaMg6HqwlOqp4+u+r9oF/h6aKgjWYLRVN
	50eyJZZH50Msh6n2RjBwhAYDHBoBQilM3FGRRHGqhFvFozjn5vmZ8gIsYBSLdFTmsqNsUxkSMx3
	kCRfgEV3Igqijimgx8JvKPFAR7M0DTufXq09TN+VU5T0sMIoLXPok+mMU667VyFWDEDoTuc0E5R
	jGkyjvCd7h7pIMLy1AyYcISSWKO4+0ghm0CIZ6G740On5DvWkPRTLj4O/LBLKvjspA1CCiPgWp4
	3jDlY1BmbS7tcpREqSzw4ZVbZjYMNo5jR6vMx+6G4EAyQ/CDN0URYF8uHuSkMVHG9G2wTW4Jq+L
	LbS4ZSrNulms4MOyKVYo9UWX3ZEpOZ5HTP5zgpqRO14bwlIArqrt9i5zQKoBTZPR98+bI9vvOaM
	5td0viy54Ms3r9Yf42KpX4SqZA89nZl43ZwoduQgJIjU5lO4r1Qot/+sXcP9vH4lkeyHYqMVWpB
	9d4cOfhzt7mzyQqQbqrUr12GEqEobxeC+X78+8orDij/XDl2f1y4eHCITvrG/rTqs=
X-Received: by 2002:a05:7300:a8f:b0:368:4c93:544e with SMTP id 5a478bee46e88-36a422084d2mr25419815eec.1.1793810722385;
        Wed, 04 Nov 2026 08:45:22 -0800 (PST)
Received: from kapoor.iiserb.ac.in ([203.18.51.212])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36a1sm10368825eec.12.2026.11.04.08.45.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 08:45:21 -0800 (PST)
From: Arnav Kapoor <kapoorarnav43@gmail.com>
To: Sai Krishna Potthuri <sai.krishna.potthuri@amd.com>,
	Conall O'Griofa <conall.ogriofa@amd.com>,
	Jonathan Cameron <jic23@kernel.org>
Cc: Salih Erim <salih.erim@amd.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	stable@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels
Date: Wed,  4 Nov 2026 22:14:59 +0530
Message-ID: <20261104164510.105359-1-kapoorarnav43@gmail.com>
X-Mailer: git-send-email 2.53.0
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

The driver sizes its channel array for 10 fixed and 21 external PL
channels, but accepts external channel nodes numbered 20 to 50, and it
never checks the remaining room while filling the array. Channels 20 to
29 are the fixed ones, so listing them adds duplicates and overflows
the array.

Patch 1 limits the external channels in the binding to 30-50, as Sai
pointed out. Patch 2 does the same in the driver and adds the bounds
checks from v2.

Changes in v3:
- New patch 1: limit the binding to channels 30-50 (Sai)
- Patch 2: only accept channels 30-50, so a channel node can no longer
  duplicate a fixed channel (Sai), and add a static_assert() that
  ams_pl_channels[] holds the fixed plus the external channels
- Patch 2: rework the commit message around the duplicate channels
- Rebase on fixes-togreg (now on 7.4-rc1)

v2: https://lore.kernel.org/all/20261023185652.195025-1-kapoorarnav43@gmail.com/
v1: https://lore.kernel.org/all/20261021225356.625288-1-kapoorarnav43@gmail.com/

Compile-tested only (W=1); I don't have ZynqMP hardware. dt_binding_check
passes, and rejects a channel@25 node in the example.

Arnav Kapoor (2):
  dt-bindings: iio: adc: xlnx,zynqmp-ams: limit external channels to
    30-50
  iio: adc: xilinx-ams: fix out-of-bounds accesses when parsing channels

 .../bindings/iio/adc/xlnx,zynqmp-ams.yaml     |  7 ++-
 drivers/iio/adc/xilinx-ams.c                  | 57 +++++++++++++++----
 2 files changed, 50 insertions(+), 14 deletions(-)


base-commit: c293f0db308fe76a0a9b0f6674cd2dea149b03aa
-- 
2.53.0

