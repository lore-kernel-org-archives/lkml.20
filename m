Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DEE420E9D
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789455720; cv=none; b=pgePN3I/kQZhKu2oi+3w57F4BrNVKJ+pTwXN247UbLGmRO7zEye79jlCbsdOiqP3bS3Ph4fj3Su6gmpIGW4GQCn6T/mOCm0bXKDTGtWbb9UU0NKjCUaEf1MCGhFNKzssngBLKPueOeGXLt7IJCcM6NqM5FVUT4aWy5oot+pHORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789455720; c=relaxed/simple;
	bh=SmVFfhSX65tUNLF4crAjZPrJT+oXElV9Xhfp3R7sQr0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dzwH4GlXbpp4cxttL7iXkYoojZn02aWmnZ0Usa4TZjOoT1CZsWFm+iANi/rxyT8oBPPmUxiKwT3A/Mzkm78riKGBTye+AFkvWqoxqCHvYXqgr4TVQCeDXr0ZEo1J35dbOTeXkAhgoQAd+lKUhIZyfJ88F5Pep083u8dywykRuls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AnV/bUZX; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AnV/bUZX"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39dbdfaef3cso2907719a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 00:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789455719; x=1790060519; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2hXwNzmZuh9VGj26rZAssJYXJ3fSJyHCnF9FFfAHDC4=;
        b=AnV/bUZXN3SEQVnsE7bKDVhdW1CSEubeM7H5Sjyan8+CinWRj2BYIfq8V0MSVBfSUi
         AN5hNoCPvPK4B3s84pStsAU/JnrOSMzZkuUWi+aCfs3GngcLmQKIFy/S3tFDxx+t5uWn
         S+idbYFAVWyE100qyyPdOMaZgmTh6vOF/UIBdoYuk7gF32v1kQKY5B3e0na/5hALz5Fu
         oz+G+T47mD+Siy9rcBGeVev+UGinLUlbRbzDEqBL9jryLS1KifMI+e83pzCTQVqDNYjI
         jA40FFaWazxaJWZhT94boUD3zSnqjheiLqrqQRqE+0AEvV48WCTVrNfql9w9mSL0ENB3
         VcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789455719; x=1790060519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2hXwNzmZuh9VGj26rZAssJYXJ3fSJyHCnF9FFfAHDC4=;
        b=HumuC6vXTVlCtm95eRpWiLniKWsY0zgQcULWo1igmCe9tTwfqqzN8sGe6CSn/54eW1
         zGjnmvFqMpvBGBfHQLNcTHlBeKoCIb4liVg9ObxlRcUNUWZYPEz/04NYtnMTNQXgjBE3
         Wp8m/VMmzvANqvxUDo6djzJNjwewkW7zeZM7Y+P2JiJlrx8IhXo3PPKURY1aOgU1JPOl
         yrUtE+5Kh1GWEUWeeALb4PeB0JTuL19WyeFTF6+ab5dPzs8Eu0Ol4Qp4GzM7wpGw+P6b
         EwFbRgZirvbsAVrYOyz/xZTxgdPJ64xKGLO2A5pIwWwHJGZzngtKt+IWPbYXyyc9s30g
         6RGQ==
X-Forwarded-Encrypted: i=1; AKwUvBy2E6CmkUaQevFBz5v677QMHY4n6FD2qVX8lN0JBYIe/x4FjVT4ZDuMKQ9VzHD/UBS0NimKjqrenaNBaF0=@vger.kernel.org
X-Gm-Message-State: AFuF++kB6XKWq68RidHHdNd0aEs5zd5rd4h7RUQJrJxGab/N3v7ox+4K
	g5qEI9UdTs5ic1xHQKlTn1mmfm+hogYkrgw7eUqsfUQ4hVn04bIwwlOx
X-Gm-Gg: AYBFou3/L8CnlnAuXW8Drdp4hsZBjxhypwG+BnJzCODLexM3FKhlrPYTgOC/d0Y7lDO
	WwTgXNxtOA+VDaR/X0CBbxlP//ytFKc/6q/4q5s0LyFmbBgKg/zItS7hXa0BCsz9s8QZR7Y5fh5
	XS/sk625KO9xhJbrs6fqk9DbM4dC+t5suVSbxBcQ0qlKQ23NhWU6Z4UuWequG6V0wb93c0+w/AK
	KtfOgju5DWE3MuImXX49WVHJj+H9wvE+DEIqjaBbag7vNrhhY/9lepYXQLNZHy/0jNXTMb7nFKV
	YM1g8WMNQV4mNgOXeGr1eKkAkFXO9X61snvnxj8pGQ8TjBIpDy0LQSBHS6EEHP+UgDSh6IZT/9D
	m4aCnQa/vIKa9Fa3c4paJdqsBoEQiYUueGxhoTqFE1B3q2DZWjyHtcRU3m3p8CNRXC6D0JPE71I
	FUqpWVO/eEjsDzB3Lmfxf44RVBIJ1fYfAfMhwfB+NnJLOeZVUypbRe2j+XL8EDMSBvYUVCCAV9y
	07G0wpoNHDWpPdo+J2uFgm6LKk=
X-Received: by 2002:a17:90b:264c:b0:39d:f18c:1ad1 with SMTP id 98e67ed59e1d1-39df18c1bb5mr10762706a91.3.1789455718837;
        Tue, 15 Sep 2026 00:01:58 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365b97994sm56553791c88.12.2026.09.15.00.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:01:58 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Wei Liu <wei.liu@kernel.org>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Dexuan Cui <decui@microsoft.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	Long Li <longli@microsoft.com>,
	linux-hyperv@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] tools/hv: fix typo "retrive" in comment
Date: Tue, 15 Sep 2026 12:31:45 +0530
Message-ID: <33db65bfcef30cb347a3e00b152dc4bfdd0bf288.1789455635.git.hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1789455635.git.hemanth.selam@gmail.com>
References: <20260907044946.10813-1-hemanth.selam@gmail.com> <cover.1789455635.git.hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "retrive" to "retrieve".

Reviewed-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 tools/hv/hv_get_dns_info.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/hv/hv_get_dns_info.sh b/tools/hv/hv_get_dns_info.sh
index 268521234d4b..288821565eee 100755
--- a/tools/hv/hv_get_dns_info.sh
+++ b/tools/hv/hv_get_dns_info.sh
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-# This example script parses /etc/resolv.conf to retrive DNS information.
+# This example script parses /etc/resolv.conf to retrieve DNS information.
 # In the interest of keeping the KVP daemon code free of distro specific
 # information; the kvp daemon code invokes this external script to gather
 # DNS information.
-- 
2.48.1

