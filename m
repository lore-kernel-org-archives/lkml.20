Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792833741;
	b=ayulWWjCs8hi/n2PaNqK0if7MeoCI8XLNPGnCgeyIRormN6b7Qr+RHGq/yzaGoQb9aBj
	 +Q886ccViyFQa6+LQf5q5bQJMFQL8EXqY1JvYsO1W/g8eR9VW49nWGJX3JixruVMHgp9/
	 UXfuWKmJmsKP7dtZpPIRbxXjYRAKNrNMzIY/V50arPOW3QAjLQh+A078BTrXe1Ekfdzvd
	 GwlLmMqb+a4LE6NiGTPou9POV2oWSWyNrW4EMA/SSaiKvE5B8VGh1w+UVRoZBm4Fbdo/R
	 8ovqLhOyVv3B21MH0ZVfXsi1CMbOtzFkqvSIX1hIhjqpXdWXmD+7NAPMGeekIJ2YjSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792833741;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=39sy2Cofz084B/ibmtf8XrBJzGPCGIsdEfHYkkJWmIc=;
	b=m8P8TD73sWe8VPEbznIS+nyfhJ5ABp0xHXq9cEtiGvLNQCz+CJl3cblTuaiFBomPMeEz
	 jQzb+8kUU6K8js8wvBWiQHLbn9/C5ZW97uzRzN3UGbsksNkpvFXGWxAfXpkwvZ7aJ2vi6
	 IlqdbfcT5dKivCpnf6qYNQ0QbI0Fg8bjQqIzOM3WfgI6TO52VOjAOOgMGjn9INMBbnrOK
	 6Qm6C71q5LLY4BhVSYvUoNLz0iGE/huBymvgA4J/dF1UCOLvHpjpizwrzQp0WQn2/zBze
	 SFc1r1Ty8InfUFgk3lYObo0Xk40pK43mMOijdYTonCOK5/8zVB3WS2oFuMKJyR5aYDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPCxSyX+;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF1606A320
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 09:22:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BF1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=SPCxSyX+
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-35943f55c06so2034173eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 02:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792833741; x=1793438541; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=39sy2Cofz084B/ibmtf8XrBJzGPCGIsdEfHYkkJWmIc=;
        b=SPCxSyX+jEW+JjX1D0luJjAT1B8Px2feP5F7J84EMMCpil3ULhal5bIHca4wxQUTOn
         ryGw3XEmtDVf7JlUcx2RlB4iX+rXRhU5szixJzGQXS5oUl6Vf+jDNx+C8HUc85h3N/5y
         oD0Ez277Q1vqAfcj3FhIjjOAihJqltpun8w7rGe4Em2KlaPFiAIqpyipZMtLAU/IkOQt
         pgiBnIvvVOewemINVwZhJqdX2S0KR4UGOynflCRayXV3s5dC6qL72e4qmUJMvftxNPJq
         KYXOPlcuJz2OcHX2vhPw5kO69ZPB++WvZ1o8GCa7aeHOc/Akj8j5uJWH1qoXUGnrUmsj
         k/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792833741; x=1793438541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=39sy2Cofz084B/ibmtf8XrBJzGPCGIsdEfHYkkJWmIc=;
        b=wNoHkpjDbEfHSwofEF0u2MYv9kJJiQdp0MKoIeN6my81H652g2dRpd75qBuE03oiPJ
         me9JAsmGEEuChCUOtrdtRXLGWM//1sk88VNRTnKMJ5SZSjl0Irwd/87Gvlf4wX/8NyWQ
         9xOcVY0TXekpYW9EFqbWr1F6JXWIANBY9TJbeJmQA9A23m8LMi31iCMqD8k60VCq+vhR
         xyFyXQGX5KcMwttDjJwkDxgQEK36jPWI6Tmvp11Xpc5vPCuxIYohX40oFk7o8W2vdaXy
         APbJATzUva7fCRq8CBSnnSNG6/pDZigSsi0nloBtxdK+yk3elOd5ZfZT6E1qKqni1MtE
         IVUg==
X-Forwarded-Encrypted: i=1; AKwUvBy/IUOdzKvkoxPfNotj51+WMSN0NYLWJ5qiUHs8xk8IVq1ijdY7X2rRqNG77nprrar5mcI/pMQtHUDkPec=@vger.kernel.org
X-Gm-Message-State: AFq9FYI69pEXHbKMc8IUdkCTsgpi07EYZvjhMp1BuK44I0CMKZLww5iz
	yZRiPo5N6iT4mxanOX++fpQ3ufsOitrXhTq0xNyv1CA5J6pNzXJRczQa
X-Gm-Gg: AYBFou2KWFTTRqdcWZm0EhaHjIoO0Hwyu+f4gai1u0XV3firie/JC9wzm3XLW7MbVMs
	dZW+V8qBm6b1HkovO6on/dyx8iHxcRrIPBjK+tziKfg2IjnkX/FRZeemKCMX0tNMp7OVkZaOe5D
	KbOkwoK1Njy+eLO1/8bYd8PRG6npk5l8aaeSK8jX2MD0PNHYFCmh/o9p1Nx8v4BRdCDNhwVqNgW
	SGU9LhQZ9bLviaFCZMY/vL+vVgBIdY4NjIkAhmjnsaIsfg/E26OH4tb1wmmZDw9U5blVVs9c2HF
	nsdqDQog6ZvaJHSovf1ksQmC8tTf+XBqJBkZf8crEBxGY0DbZKrezbYrWl/QTqRR16RqohHmWwg
	DqVKTeRxktQME/2hyTOYVBwIvKPhUwCrZZWinLFmJiAK9JyitV8QL0JCJm0lppqpwfpSWD7hEaN
	MHznBr23/gZ+kXql8QOrVef4qaR5rE4IrLWC7hZNqGr+4jENAcQ81p0kEj5DTxMQhd9fu/z0pRZ
	yHG+2K3YjrYYR09ByP5TEAdUlO9rGYtiOk03k1OFKSWdW3KJrwgW3g+mB28v1anuUwoQdu241EG
	ddSrESwRbIZaHbdoVc+qJ+fK56oyv+MFeQKg1+hzsB3EiF9dnDASnMoMTda0Dfv5pBONda/jois
	cLMd3gzpGWdUoboNACbawJDbnQQ==
X-Received: by 2002:a05:7300:fe09:b0:33e:61ab:8309 with SMTP id 5a478bee46e88-369e85022edmr2030334eec.23.1792833740612;
        Sat, 24 Oct 2026 02:22:20 -0700 (PDT)
Received: from LAPTOP-VN8JNK11 ([111.223.26.246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8db450bsm5108584eec.17.2026.10.24.02.22.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 02:22:19 -0700 (PDT)
From: Ankit Thakur <codeankit.thakur@gmail.com>
To: Eric Van Hensbergen <ericvh@kernel.org>,
	Latchesar Ionkov <lucho@ionkov.net>,
	Dominique Martinet <asmadeus@codewreck.org>
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	v9fs@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ankit Thakur <codeankit.thakur@gmail.com>
Subject: [PATCH 3/4] 9p: remove duplicated assignment in v9fs_fill_super()
Date: Sat, 24 Oct 2026 14:51:53 +0530
Message-ID: <20261024092154.1844-3-codeankit.thakur@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.3
In-Reply-To: <20261024092154.1844-1-codeankit.thakur@gmail.com>
References: <20261024092154.1844-1-codeankit.thakur@gmail.com>
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

The declaration of v9ses assigns it twice (v9ses = v9ses =
sb->s_fs_info). Drop the redundant assignment. No functional change.

Signed-off-by: Ankit Thakur <codeankit.thakur@gmail.com>
---
 fs/9p/vfs_super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/9p/vfs_super.c b/fs/9p/vfs_super.c
index 795260446..7b67193d9 100644
--- a/fs/9p/vfs_super.c
+++ b/fs/9p/vfs_super.c
@@ -34,7 +34,7 @@ static const struct super_operations v9fs_super_ops, v9fs_super_ops_dotl;
 static int v9fs_fill_super(struct super_block *sb)
 {
 	int ret;
-	struct v9fs_session_info *v9ses = v9ses = sb->s_fs_info;
+	struct v9fs_session_info *v9ses = sb->s_fs_info;
 
 	sb->s_maxbytes = MAX_LFS_FILESIZE;
 	sb->s_blocksize_bits = fls(v9ses->maxdata - 1);
-- 
2.55.0.windows.3

