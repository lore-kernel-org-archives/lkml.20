Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280214;
	b=WkocUiEZ2s54nmoAWIwRgLCOFNPwNaXMc+2lQ6uuxi30dxP/esj7iSmkq5fcd8Z+q7Qo
	 iYa+JzBUUISHDZ8v7tauYnucnkGnS6CKc4HqYBFvzQCAEr4LsdMgKZ9OjNmx101T7lW1K
	 3BTBZVBVUWS4HKKcBPLyeMqB5YDI4yDn8WoP/dASNrC0Mq8fHVe+UDsxmI1Jz6qZE1WoO
	 /WIt8JbPnPniBeXShbt8Pn2UmoOK5maJQZzhH2y72H4Laz/1mP4cDIdxeZnUCQuLo5CSW
	 Beu4qxAkD0DQG2uryf7Jn8uLveLrBvGb3P/ubbLnpdI69pWqOtOUdH0WoB6QuqC9KBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6QYJzw9Rr63XbTuPHrN4Cbad1UtYv7xxIdUtWOpl04I=;
	b=UakEDeRNIZ1ZEDE3hf81OnkSJ1WzLDR97vrTsDegmedjgrPhYfWGDsOiGf7lgyJCj1xa
	 nKj40/rCHC4rhls1TO/PgxjbkiPlTu6j8mkJewjyu04xBIWVuOKY16hyOR4+wWd3P0xxK
	 Qur95XVeW3YIgzjuQXwF1w6r0ZXar3jI5/BmyDrwGHtHq1JncAtKE9O24LQsPwC0zzoCV
	 zhhOvxrFVDp98q1ZVuL+RZq3DFjasGjt2za0vLeoEQ2L/S/auzEydDJVxC/7Y4XOoAwo1
	 Gfqx48PvEC8Sl8e2bh4kqbGkFfknMSHn6CL4r3EPfeC3HeMpI0+9pQqNG3kwWLXwS1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+yttUZi;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA6A606A33A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:10:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AA6A606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L+yttUZi
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a0880a46e7so857022b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280214; x=1794885014; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6QYJzw9Rr63XbTuPHrN4Cbad1UtYv7xxIdUtWOpl04I=;
        b=L+yttUZiKSMf9NvCb+E1pLmj8OeGaaYw08dr2RAirE+Lz4npNIabN93ZWVbnQvBOmk
         L/yuJyZBJXk+gbkG3Ff9GbaY/UHwWlFTW80K5LASoZSSlGlA+HKK4+3kty5gpse5xRY4
         TI+pERF8HLHwUyjXVIkZqzQHRQNiZ+4a9ipfpMf/81jymsAP0aUBrdIzokuk4ZY/WnEu
         yxiBGwyFRYuoSKH4xpoBKm6g86uUhQq4pQbB86n6O8c6bHsYhFkKH+5rsFw6uBhO8JV8
         YWitWZAUHAoOpHd6BhxUuy673W5AKuYLbtmnvskoeROhohACc5FBdnN4+re4uTlbXTZ+
         3PnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280214; x=1794885014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6QYJzw9Rr63XbTuPHrN4Cbad1UtYv7xxIdUtWOpl04I=;
        b=DS2fe3cDWUzsrzCqPeyyI451IfEH+JSOz+MvvhFgpZ6jTg2sZjW9LvQoKh12Ap/8h8
         T08B3apRlG5I+mLN6cAHP6Py6JEdiERn8CTHBiSN2SfoQL5qitLdvsFQakSLgviO3fAp
         jeTXaEkdSveAfm1BpUDKZtBS+j+076sPBCH5662iAQlCF7h5G+q2XL3DSTu5UVhbtz1H
         lSPaFb2EQaCKYAVyTn+lZlz6JCsU7/Yn931TnCNqQNC12QniKyrH1To7VAmnJm4W4SlX
         mXIrKTYfCHwD9/lKi5pmIsZOCrfm9Y9RC6I7vjTMmWROnqPuJxZq8oeJqD1qNr/253/R
         B7pQ==
X-Forwarded-Encrypted: i=1; AL+hErHe87L9Y2I3unQBJ4s+jmtBDracDte2kxjKGrPqeCZCs2tSK5qy1GIy6coYl7trSJknx1M8q0K/W1Y2QPM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g0RfOFoF9n3En+SteSFbvUaIsEu1nT1WKW6C1KrKXcScMu9vP
	G6ePOLeUr9VRl9WDVW9R/nIWJOwo0mKSvl2JtEdQSw7f3CKzoHr1k6Ji
X-Gm-Gg: AYBFou2d7wdXBQGUHMIwX+PDEFJCZFLIgG/J6Dx02lAkONvynF6q9jenswAH3OXcV9a
	+yGgYIxiZb6rLbwzLZxQz+keXonkMxjAg02M+74nB+xLc0NJgD4COBzUdENbYTnCSK9v3sB6b72
	BVpE9ku/2vaAbQ789R83Tsn19n+PB4IyfEAtJzwcsGGi+tEWERuplYNVt5w+XIhRVPorQ3RJC8I
	aGMQKZtIpvtt7C+IVNhtAwBZm83P39wEeDYoau+kqtY55cCnKWyyj/1kXCxqnMN9JPaT8sSmN9i
	C0wP9z2JdSkQE/fiSQJTCjzjwC9FCYUSS6jDFFYyJbh+Ds/lpzqv3N3/JFfrG3Fw5u8j7RNvmX9
	DXLsZG6sEisZALDGpidb0Q9Td/mHS6Jzq1u+qASQPy5UGSKkmaXBLVBXcjoAenwHDlQOzSrn+qA
	xDXv2XeOxAjKsUi5WxIG98T16Uv0yuDPpyFFc/dKOQPpD7zVDjrPcmdcemg7WDbo5S8NUDLUX0G
	RQznjHXWhNW1qDaIwHtnsyfNAGGR0UOKrQpW+jUYy8upOtHJM2Acm9+purHLjjBuWwANTfDYtUd
	dv24Ep7DWsM46yK5OITTtN3VQlK7QXLNTlZhSVZjkQ==
X-Received: by 2002:a05:6a00:9287:b0:8a0:12ab:e29 with SMTP id d2e1a72fcca58-8ba97ac0667mr920272b3a.9.1794280213567;
        Mon, 09 Nov 2026 19:10:13 -0800 (PST)
Received: from localhost.localdomain ([183.62.176.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dffb5sm308939b3a.55.2026.11.09.19.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:10:13 -0800 (PST)
From: liuyong <pkfxxxing@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	linux-rdma@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	security@kernel.org
Subject: [PATCH 0/1] RDMA/srpt: Fix read underflow information disclosure
Date: Tue, 10 Nov 2026 11:08:05 +0800
Message-ID: <20261110030809.913063-1-pkfxxxing@gmail.com>
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

Hi,

This patch fixes an SRPT information disclosure that allows a remote
initiator with LUN access to read uninitialized target kernel memory,
potentially exposing sensitive data from previous uses of those pages.

SRPT creates RDMA contexts from the initiator's buffer descriptors before
parsing the CDB. For a READ underflow, target core reduces
cmd->data_length, and a backend such as rd_mcp fills only that length.
The prebuilt RDMA WRITE requests still send the full descriptor-sized
buffer, including the uninitialized tail. The underflow itself is valid;
the problem is transferring more data than the command provides.

The fix caps the data SGEs at cmd->data_length in srpt_queue_response().

The patch is based on Linux 7.4.0-rc1 commit
f66469d9905b39d2c260a15d7d6db450f4db67c1. The issue was reproduced on
the same commit using software RoCE and an rd_mcp RAMDISK with an explicit
ACL-LUN mapping. The triggering READ(10) requests one 512-byte block but
provides an 8192-byte data-in descriptor.

Relevant target kernel log excerpt:

[    7.496367] ib_srpt Received SRP_LOGIN_REQ with i_port_id 5352:502d:4556:494c:2d49:4e49:542d:3031, t_port_id 5054:00ff:fe12:3456:5054:00ff:fe12:3456 and it_iu_len 512 on port 1 (guid=fe80:0000:0000:0000:5054:00ff:fe12:3456); pkey 0xffff
[    7.528685] TARGET_CORE[srpt]: Expected Transfer Length: 8192 does not match SCSI CDB Length: 512 for SAM Opcode: 0x28

The patch has been compiled and verified to fix the reported issue.

A reproducer and additional reproduction materials are available.
Please contact me privately if you need them.

The issue was discovered and fixed by Qihoo 360's Tulongfeng multi-agent
system.

Regards,
liuyong
360 Vulnerability Research Institute

liuyong (1):
  RDMA/srpt: Limit read data transfers to the command length

 drivers/infiniband/ulp/srpt/ib_srpt.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

