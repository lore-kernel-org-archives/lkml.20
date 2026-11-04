Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793819663;
	b=3ojTHzxOUYQGVDPRMmXRA+mPe2E6I1feAkJBzJEBGnCF5++mq+CXIr7NfU9eVuZw3WGn
	 gQmjMsQzTVBWQoCxOj92ZJ0+JLgGRPVP2Lo7/gJxIoehCtfRZtmlrLJp16r6XzQ8OFyTX
	 udDnJ0byUThDreYPVW48rB7Z06cSyqJHQekDX1p77i0qq6Ow8Xr2ErJove0CJEM1A2kGH
	 YHnXGYTIer3ZwXQesQh/ACQTqLLvPdmu0c/S0psuMCsa54yCfskDKfQkAao1UOU6zG79s
	 s47y/a/428t5Jepf2ifPCHmeMcZ/h0yviw3H86eHYIao+XAdtQ+qThaZkVmGbhY2wvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793819663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xITUvna++NkI/eBI/dmyMX8RAsKhHBfiqDAe3Yile2E=;
	b=wj6M9bMwN73C64/BJ94oH0pbke+B6GR+crYqy7GSaH9v5vIsumBvw07XQ99bzgQUyZwn
	 MQmzzLyOqnUHXrP6RfqpijIFM4DiDfZ9G1z5ZZSGcyMCaMq/40J/VMR6mQ7BowqdwcTwr
	 lBFqcR0XnW5Lj9UYP/OpdMKjpYqjuTDywjUxqbx0T5d8U8sqrSiD+clqSn3ozzSVA6uiU
	 vPcvUiXV3yVwlv5gSVVV+BZwpou84Z3Zz2Ft6su9LwMCFtqltShq7kIXzBZHKRAQUhqIQ
	 W5VJqk7Q5v1uoX3nsYZ5tZG+prxBPpHdzxWGbCIR80UKlZyjI/J0zU4DxRblUd0aVig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcfxRMy1;
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1309606A32C
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 19:14:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1309606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qcfxRMy1
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36e06480786so13456eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 11:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793819662; x=1794424462; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xITUvna++NkI/eBI/dmyMX8RAsKhHBfiqDAe3Yile2E=;
        b=qcfxRMy1w09RryqXTW51hmWDlaOIQBBSRpMLN9d1F9lfCHcDP3GnDWzmpdHNb/1tvw
         BBIvcndRsf9hqsfhSYOHR4TiJD2P4WEPRTp8YaG41eKfG2CReL5Up1YXdLXRlEGkMKMs
         E0NAcm8YmnUKi2eln6RQ3TuOCrQai+bY20NLZJvtILd7aGT9L1+bplWyRIlF0VoIJGOg
         qqso8LaJ9LCKdOOnmDlHV45q8u5VMF5DYUQ1EEwMIjpR0MY0hL/4/AqwZr8MWplcfvvk
         bItWFr7ZjDZGig92HszanKDHuyAqv/NByHnN6ke7EqNlgrWC4OfGvek2DA7is7yjOtWa
         kQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793819662; x=1794424462;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xITUvna++NkI/eBI/dmyMX8RAsKhHBfiqDAe3Yile2E=;
        b=LORgqzeqRQq6eKXLnyAQy5/RTKzrN82Dgf4O0U0sUolbh1DGGBNqAVUnQtIgn/DQLa
         xHbiBx7oHz47XMf3iee+fF6jgCSWo8UJlYdTYvxOn2K6y4XXxm+NWUWtdD9MDkCWDBw8
         oPmq3NejmbgeK686kq2oSco8QVWxuR+nZZJ/pJXTiKk9M/Sz+iULxCydfi9SiEcigaog
         +l92hh8ri1cO/TgseLR+8XyiU2buDK2O10ax+TMwZi0AE26tCRK97zgaBzUQQXfdseAb
         QrgPQiSmb62/+Fct73Afox+iHRDlwp/rhmP+9NOaLZGka8htMWyQY9vufMvoLUpyzD/S
         W9Dw==
X-Forwarded-Encrypted: i=1; AKwUvBzdzuK/urvnex7bnwpkhGVyb0HYyRPbQdmlUEfEQKwl7b0XYY5AZJP7HwfzaMzTyjf7PSAnOKshVtjA8EY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8cjIp4SmS6pZOEXTF57Iiuv+epkNpUsUxi16T84avrcXZtvdgh
	WXDd8wJgflN/UD4AcTAvc6+qa+ybPGq+trg1/rsIxeDBUT39S2NFUmxs
X-Gm-Gg: AYBFou343bsSS3lF4VJPSqbAbBG2RIcsyCfbnDUkAk6Kl4XfWUODaFtN/PcRHv71Zx2
	b+T+0z4k2rkV0oZ2c/gouu0yoKTx+OEaBvU8fccVaAsfx5E2mdoRC+J26RyO7I2UQ2I7HrPuWI9
	DX497Eug0dP0KFlxjMQBejh0cPJtwP1pE5ioxdSGfeLG3vXxBVg5GF8CYtaWpL2FvtB8jKGNZgX
	DZ7vaoeNnT9Fh33wPBl81aYCvLjLM2xWEWlN1HEVb+aOwHNRnZ3LgqXd+chdhtmrw/M77tuiT2I
	UY29bNdJCp8c7RREI9/62oQJHtB9fjLNfMCiMlgbLPDEzBMLeDy8wV/ZbjnwlOS/oZ4zoLyhpUH
	26HdmZqP8ZaDFCK3P5CJtlTHawjV9IrOLdDxLCtS2cSul35uplcImod0Ba1Bu/NTQrlRHXmuw5r
	xNTp6y8Xcp7uAvZGqdff1Kyzqn5n3QVfrZ5zABAS1Gw1nWaM38U2jDRhV8VkxxUo3vgYCviuPJA
	TCRRab8VveWQK2cShP6cm9A0HbRpocnRAEXXAwdppsHHO9D5Z1nx5O19IRo7M9vnBRMnVpyrGzP
	1gYacba7qydMgzsialTP4137kWKAgrWcJLu94TGkMhOdqPLgjH430qDbp4kOByGEXc0hJTxJJrP
	OD+WU26oJguFGFv3LFQ15JxQLSiJsyLEl4UF4Pg==
X-Received: by 2002:a05:693c:8803:20b0:361:6884:78b1 with SMTP id 5a478bee46e88-36a423bf728mr26751356eec.28.1793819661646;
        Wed, 04 Nov 2026 11:14:21 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6d3dsm11367318eec.7.2026.11.04.11.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:14:21 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: jaharkes@cs.cmu.edu
Cc: coda@cs.cmu.edu,
	codalist@coda.cs.cmu.edu,
	viro@zeniv.linux.org.uk,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] coda: honor the append state of each write
Date: Wed,  4 Nov 2026 19:13:55 +0000
Message-ID: <20261104191355.89544-1-dennylin0707@gmail.com>
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

coda_open() adds O_APPEND to the container file's f_flags after it has
been opened, without updating its cached f_iocb_flags. An O_APPEND write
can therefore overwrite existing data instead of appending. For example,
writing "Z" to a file containing "abc" produces "Zbc" rather than "abcZ".

Pass RWF_APPEND or RWF_NOAPPEND to vfs_iter_write() according to the
incoming IOCB_APPEND state. This also honors changes made with F_SETFL
and per-write append overrides instead of relying on the container's
open-time flags.

Fixes: 164f4064ca81 ("keep iocb_flags() result cached in struct file")
Cc: stable@vger.kernel.org # 6.9+
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/coda/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/coda/file.c b/fs/coda/file.c
index 6ca8bfcb58f2..ae03f0b30d84 100644
--- a/fs/coda/file.c
+++ b/fs/coda/file.c
@@ -71,6 +71,7 @@ coda_file_write_iter(struct kiocb *iocb, struct iov_iter *to)
 	struct file *host_file = cfi->cfi_container;
 	loff_t ki_pos = iocb->ki_pos;
 	size_t count = iov_iter_count(to);
+	rwf_t flags = (iocb->ki_flags & IOCB_APPEND) ? RWF_APPEND : RWF_NOAPPEND;
 	ssize_t ret;
 
 	ret = venus_access_intent(coda_inode->i_sb, coda_i2f(coda_inode),
@@ -80,7 +81,7 @@ coda_file_write_iter(struct kiocb *iocb, struct iov_iter *to)
 		goto finish_write;
 
 	inode_lock(coda_inode);
-	ret = vfs_iter_write(cfi->cfi_container, to, &iocb->ki_pos, 0);
+	ret = vfs_iter_write(host_file, to, &iocb->ki_pos, flags);
 	coda_inode->i_size = file_inode(host_file)->i_size;
 	coda_inode->i_blocks = (coda_inode->i_size + 511) >> 9;
 	inode_set_mtime_to_ts(coda_inode, inode_set_ctime_current(coda_inode));

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0

