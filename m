Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792664492;
	b=zh3/Pb470XD5u5OjwBQIkd4XLUvQa0qxRY8LgOYKCptOX7lA7tOqIXZCD9I4+kC5XchF
	 N/jkH2DYXCTmk+9Jepr5ZsjcJNNj1jfpXFNgXwbGR3AM0azmyavZFvBCHkdmukzhFQN1s
	 N5sI0cxJKy2ZJ8LJxmj9dklMRaJBHckNqYX8fuWyjpuRbcfkCao+hIpNPRiLBwFpLkzLc
	 P3FvCKUXDD8mbz6X+UHxdXPMpjvK5RvZ25tqkqVpisfyAYHN2kS2Dd9ydopoQlbIf4PRn
	 y1ntmPlT705z9U4LUP8PvYum+FQlZ2CabkvJrk7cww9HmlyzxjQLv14MJM99S8XgMmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792664492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=;
	b=rX1eb6kdP+RauVESAP/rWH3233X0BEyXxy5MXUY4WB5zB7rgBsHhk3ov8j4/1rCxaXXO
	 rCHCUoL5pkNAv3IUMiiv8wPmVZqeK7tCTcW+OLlm8qgNNOO9aPmB+UP4uzu5tyT+71TcT
	 upR0vdEnw7RhdYa6XLHqLqYUwzRuGT8wogdug4BTHfKnNpVOeq78Qc+d+cBda7ebeZmld
	 T4Agkb+JnOtxSYelWeTztEfB7XHuGuMecjJ6srfGY8qFb6AuxyhYWkJmZ0Y6rZVYqbXxr
	 J7MvTWTW3W7O2D+1P+0Zby4t/oIJuy6sr0Qg1TgtnnUGIrgoKWXM/5m7t0nj9HscA4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E43OUbuz;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3993A606A31D
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:21:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3993A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=E43OUbuz
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a06e79e152so782983b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792664491; x=1793269291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=;
        b=E43OUbuzxm4EzJfgMySiC8Ve7HyD5qb7yTndMUJFtP8nICC6fK/ULXi/5juq8CwXim
         v6c3TTMTNpJDP1HOJ+e3WWn6pUEqKIC/HT3NnsMEuzn0rxAqv+VoZr/GehiaKMOu25d9
         fLHj6lthUA/XuW/ZN9kSxD3P8nB1r8dFcXySzSrBEAHADpgqKC4ri8ng1eIkIW/VZMeW
         UE/j9sCuTYjtq4WSg6YxhWhf4EmDHC9plDTdgq7CpP/AP7fPguoc204ZEDlGXnuJpjIb
         hn1bRWEIQGT9qMsuolIJtU/fgSn6re69SBr7Zg1LWfwOidMh7L6Yk+h/CN4fMBBEkYuc
         1wzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792664491; x=1793269291;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YBxTUn7ywMgpmSnO6blmLwOaVhY7BWSoJVdPqCPYsuk=;
        b=EZvBi/YTJNHkm89bOOkRCzA6KD5EWDxY5Du8C4OpH5ecOWKqVZqoTYXke1Jl5f2uN2
         Wl2k/rEgzOm7gOKxSWXIg7wgd+rya2/gU+1q5302fjxArgNFrx8APd3MJhE6wklYxs9u
         RCloA0v3CKgXZJ7gCLgKpPbg2piMyytO7RXJJf8fOLghqMJfUNwKFxP1MZKzTiioXbof
         b2cdi22yl8FcdNKzL3E2fJzgUrYiANErvAD/yVwJWm16rUw5jxI1bAKS0aTWF8U+5T40
         iG1TU77dMn9swheehSLHaMDByTzf4JX4fYLiEgfD28lGuh/PctXF65xQ7WcK0LCGsNG0
         oLDg==
X-Forwarded-Encrypted: i=1; AKwUvBzHJvx8j2A8YoZd6b7svh5yDo64roTUkmEwXbf9Kr/bQf+cYLSEgSKMh9uqslRYoCjqxs6z7RABESkEcss=@vger.kernel.org
X-Gm-Message-State: AFq9FYJei/XjUjAT6KHlwrZX0Re/NYDuQxBhqA3HeTSp8thcwmXzziVL
	ChFjIVqhi/v0G532ClcZaXuubjhGrEyOYYDQ9N0qF5JqqSNpLU+SgPDEouiG322LJqilSQ==
X-Gm-Gg: AYBFou2uze/L9RfIJ2X/sDEE65Kc3ov6Gw7N6KwXSg3hK92CMq14pjboCwGBK6yfAUZ
	LCUXu6fxK68DOdm588rI/IDENBY8crOISLhErwFr34gSx/XPflAef9wftMSKDtLzWA3r0gvtrVW
	T2W98kvzgD2nrqZIOWimhjJzaZRzywCVY74KCaG1I/u8KTGCjVnhSipslfYh54qZ3GuPznodc/q
	IpiylLqb72xWU90FdGrg5gg5dl+wXKeZNcYIo75NPelSlzn12HMmeG+YhoHd/efkRMhYChbuLRY
	hd+OqduPnxXPeXCNJp8CcFrEi2Nw4e3At4awDPbrfME7WlV4Zzdgn6HUCcpQwa56YnHSdqe0Pgp
	k0GdDEFybYn2bnema+mXQYwT82BWB/UudX33EBzpH8J29+ab+dQhfDbDo/+MS0hyKtscCaO5wTp
	AO6rUSgp9YEsr3/XB4b/y70wpKATaQUNo4Dyx4R1lXJQw9g60v4HblWyftZfGdWxf6I8MZHM8KJ
	7/wXW9arRd+12Sj0+LF515CyFWdvU6SXWJ/6ZoRfhoiyHAiLC9saHk5V0bPVngUlixKc0kePOZ4
	OtUH70UkNuCJCq59ZMXr3AlcQ34hnn0oF6qoWO9uBy3ZfhYszK9g/IqKgIRzf+IxAnkdrk4Dwug
	QLJ81C5QQrx6SeOKXNSfwvTymPQG0RFGE
X-Received: by 2002:a05:6a00:2e9e:b0:890:bd5c:5710 with SMTP id d2e1a72fcca58-8a089f6585dmr3709575b3a.41.1792664491420;
        Thu, 22 Oct 2026 03:21:31 -0700 (PDT)
Received: from fedora (aipl-202-179-95-46.static.ankhnet.net. [202.179.95.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a08933c9b1sm1943324b3a.3.2026.10.22.03.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 03:21:30 -0700 (PDT)
From: Ninad Naik <ninadnaik07@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ninad Naik <ninadnaik07@gmail.com>
Subject: [PATCH] spi: mtk-snfi: use min() in mtk_snand_read_page_cache()
Date: Thu, 22 Oct 2026 15:50:20 +0530
Message-ID: <20261022102020.107609-1-ninadnaik07@gmail.com>
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

Replace the ternary case with min() to pick the smaller of cap_len and
req_left.
No functional change intended. Compile tested only.
Found using Coccinelle.

Signed-off-by: Ninad Naik <ninadnaik07@gmail.com>
---
 drivers/spi/spi-mtk-snfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-snfi.c b/drivers/spi/spi-mtk-snfi.c
index 6e96e50fedad..bbb65a21a684 100644
--- a/drivers/spi/spi-mtk-snfi.c
+++ b/drivers/spi/spi-mtk-snfi.c
@@ -1017,7 +1017,7 @@ static int mtk_snand_read_page_cache(struct mtk_snand *snf,
 			if (req_left)
 				memcpy(op->data.buf.in + snf->nfi_cfg.page_size,
 				       buf_fdm,
-				       cap_len < req_left ? cap_len : req_left);
+				       min(cap_len, req_left));
 		} else if (rd_offset < snf->buf_len) {
 			u32 cap_len = snf->buf_len - rd_offset;
 
-- 
2.56.0

