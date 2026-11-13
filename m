Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.244
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794557247;
	b=SycR5uqo8mH7iWNYwC/ZRibGH8Gk5U17NsKRcWtq/eyncTz77gzYaozMx30qWB+eGvNX
	 al+1C0AXcj9JiXmlUTJLZmr3rvaGHe137ms6YOf0QDw+ahZWcx+miVmBh9AN5QjrptODz
	 UdMxI1hGPiq5yzPWxMhjUhrFAMtLjnftmsUSzMh06Yd9wwuBXDeiWTyDy6BJV318Tm0Lp
	 HEnURSz46G/yT3uUvBj6IJTKFSo5N8muVTicEaJ+ohxPiWgxqpEALuJe8roXOllj2Kk37
	 VKM05GGmr6r51zRCs3OvCTNXJ2rHKa4iP1uNcQxw2/rK/VTaAN0kgURFZL9ArT4BdHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794557247;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=tNefIjwz7AA7/H8DkYHy0wk5vV2caB5RWewDPLU9Lak=;
	b=nJ/Yyb/O2vq3arbV9MrC3AFZ+T37s30uzHAm0ilsNEvpYa8L8WAk3w9jgoh4hHWArE7M
	 PpQuLdI0JdhvvCPnIHAWxdGd3jMstIZHBxq9NIjC5xQE/sj9kKqiCW3tBsUIKZ/W0HL9j
	 Z2DNl7ePe+TYZ6arPMEIxJj/Fyxyr/Z/Yv2ZDVPKT/wFWEzooysXjN5d2Pdh2sNn9Mvrp
	 XWZcXqSMj6PVTqYf/bi3cbx7kvtiHtHLzSGbG4gck+aDoUJd6jk3RtlZQG20y5045oPqP
	 inxqbgAxXtbqKwI2TjnOW8RMrs+qjcsUFJI5vqe+AUxewlxKvi/CbhlD4u5lCm94hBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XbZzLr7+;
	arc=none smtp.remote-ip=95.215.58.244
Received: from mta1.migadu.com (out-244.mta1.migadu.com [95.215.58.244])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F9A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 08:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F9A606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XbZzLr7+
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=9DE1365ALDhXj6IqBoaBlJfBuw3YvEXDUteTjttM0Fg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794557244; v=1; x=1795162044;
 b=XbZzLr7+1htSR+lHBpGgIGg7glewfW/T5U/eTCylGNQps3Nsctuoe2CUdWMA9AZv+JSHSmvw
 SvgTdLYZPcFU/LxcwpvVlDhAgO6mkNdTApKfjYa+i3EFZi/9FkPICFHopGPaoSlBiAV+cYlnYar
 WJ1EcqzB9x5bN+hAjTLubD78=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 42a173bee6e33c10;
	Fri, 13 Nov 2026 08:07:24 +0000
X-Mizu-Trace-ID: 42a173bee6e33c10
X-Migadu-Flow: FLOW_OUT
From: Youling Tang <youling.tang@linux.dev>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	Chi Zhiling <chizhiling@163.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Youling Tang <tangyouling@kylinos.cn>
Subject: [PATCH 0/2] exfat: fix iomap mapping vs truncate race
Date: Fri, 13 Nov 2026 16:06:55 +0800
Message-ID: <20261113080658.2440516-1-youling.tang@linux.dev>
X-Mailer: git-send-email 2.43.0
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

From: Youling Tang <tangyouling@kylinos.cn>

This series fixes two related problems in the exfat iomap path.

Patch 1 fixes a race between iomap mapping and truncate: i_size was read
twice, and a shrink in between could make the mapping length negative,
which underflowed the cluster count.

Patch 2 fixes the handling of the EXFAT_EOF_CLUSTER sentinel returned by
exfat_map_cluster().  The iomap code used to convert it into a physical
address; it now maps the valid prefix of the range and reports only the
remaining part as a hole, matching the old buffer_head code.

Patch 2 relies on the non-negative length guaranteed by patch 1 for the
hole mapping.

Youling Tang (2):
  exfat: fix iomap mapping when writeback races with truncate
  exfat: don't map EXFAT_EOF_CLUSTER as a physical cluster

 fs/exfat/iomap.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

-- 
2.43.0

