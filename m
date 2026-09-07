Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F294400969
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763373; cv=none; b=kCNOlCqJ9kJzE6Sm04kgF8gEDQvOyRKGMRBm7uYJUWqNVtzfwKnNc4kqUJvfZcynwnFk1Ft0QxPBDF5nDvbLChvgwNikbREphMRnFjzFKztbQxRLwiWpHza+UkKkU5SEJnhyX68JJXS2c1j4cPraQMksscS1RpepoaaPZp27YOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763373; c=relaxed/simple;
	bh=obCt6dFIrhqK0L3cVGv0aYy1LeuBf7kuUudz81Z9e3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7qzdHUswd8YhxyHEpLtF1i+f/OAzuhiJak0sBoWK6dw1FPwT/4tWRfXlQuz9FmtKzoW8Zz1Q4HmcEtPvYwBqhHJH3rLQjBxLjTwRrY5ePxEU8YWC6XQ987DUViWO5E18Fr4IIDsXa7XaUwCR02lKS7Syl8OUvEapRMW9X8tnHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R2CM20xR; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R2CM20xR"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-395cf2535acso3355260a91.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763371; x=1789368171; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ar25cKs1gH5uWsuIBDWcu71MwwQW4FbjSNAQqbQcxuM=;
        b=R2CM20xRVjgggwT6RZ9dSkgejffFNsFnk969uwIletslHRlWM2AM0Cr8kzvGwf0yIl
         KwcsFLjVvcdoDeCfOsMvAm3K8Bs5OVwPjV8UDfFU0Xzggvboue9dQHK76Z5jdfGzpHXu
         BCZRG0b0yewzeZP5AsHry0GMqg41JJeyKlT9JtQR2UTY51q01WcvdTmvV/SMUorTz49I
         lpQoRa5E5ThOZc03Ojhal46F72whX7RZr6teukT5BaQPcxImtFYlzRS8+UKvJL7sO2E7
         Lo0ejR9ivA8OWn1sKu06ohAqoIt8XJC/6cdTjVRfF0plg+mgmkLOgxnHU1/jkuEGPf2A
         gQRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763371; x=1789368171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ar25cKs1gH5uWsuIBDWcu71MwwQW4FbjSNAQqbQcxuM=;
        b=M6apw3JaJ44yKGPljUm6Qlyeep05ZNZa//iWpyYFqcsbq+iqQHJq4FrBvTa2vxoLli
         BlchKPyR5oN1Z+zg6Es1wgLKh1s71kXC/z5j1J0PloOclJEe9SmQ7ELt/19NG1wjbsZf
         NLordRenWM4gNYHSuLTMG0boxsXIBq6Jw7WXeaI/RwNSawP2RU9BQtUHpT6XLlHloPZQ
         jem+LBXpFNvYOcxVO6jXezULtNc62nbR7cvRGNDtB+JIreupFqUcf2YWO37xHgGOvPUm
         8b8+Y6EkspH2iF86nGVKX/oqF0020TcsKQpFp23LEtu7qKkmqflYAHML+hSKqy0/fLdY
         tJ8A==
X-Forwarded-Encrypted: i=1; AKwUvBwitd316IHG8XOK9mQCs8ueWN8Z0wtgupYQq/mcmSyUlcxF4IWjzCTPrv382OHN8OOP5rOUrZrIJ7N6FZI=@vger.kernel.org
X-Gm-Message-State: AFuF++lpBKLTpeMHTsvZJJgGK7bp2KzHCFD1Mkp1KVox9GYbwotkJ+lr
	gaZ2pGDBp7RHQBmolGtiFAB4krr+tB5wyjPmx/I36POYKMPnhW4P+szd
X-Gm-Gg: AYBFou1wOXWZwj40pKQik2cb844NQr67rk9zs4Am3cXiJRyPAXzup/Oe+0u0xR3V3yT
	sXsv9/hqLKjwgU44lvAob5wbiQZMsjj1LVj1sYV1lnSPH6zfJI/CaRA++pHYAPChM/EK89J8Zf9
	9soiKZ/qhDBnIqdwJy7g2Y4jHtPWw5e242Lc/VkHCGGIX6Rg5OwQJUB61oMW+NFTyTVo0ChAU85
	zIRMdA0S0ioDhYBfhLDyFUzj4nfJxS1m6kLM3tjLREEAHCqylk6OnBNRcNolRy3kw0OmtorQbvS
	bqFnXVRIAyoWutMfIFqu/b1JVdx6lIzgcTTQFvuT1XMhW/JrR7rgFrj+0XRvkKq7LamSgT2QBfY
	mxldJWHBAOCXQUaiMo8F3ejxNKuKQ8OXYnubIz52aj1IP92ldDan+fYm+Qblpg43CmIJq4teFpf
	nDO1h0oo0H1mP3VWkFM47WbHk1GPSFuev1YJ4sVJs/D0YEBRTU9qccS8LyzT8GFMPW7AldDb2Bj
	jqkrN1txbtnZA==
X-Received: by 2002:a17:90b:4ac5:b0:398:9beb:a2ba with SMTP id 98e67ed59e1d1-39b087fb503mr30411442a91.28.1788763371277;
        Sun, 06 Sep 2026 23:42:51 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3356dc5c04dsm14377817eec.8.2026.09.06.23.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:42:50 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Pablo Neira Ayuso <pablo@netfilter.org>,
	Florian Westphal <fw@strlen.de>,
	Phil Sutter <phil@nwl.cc>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH 1/3] net: ipv4: fix typo "alignement" in comment
Date: Mon,  7 Sep 2026 12:12:36 +0530
Message-ID: <20260907064239.39910-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907064239.39910-1-hemanth.selam@gmail.com>
References: <20260907064239.39910-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "alignement" to "alignment", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 net/ipv4/netfilter/arp_tables.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/ipv4/netfilter/arp_tables.c b/net/ipv4/netfilter/arp_tables.c
index a87e07e80d0d..b680bd14d329 100644
--- a/net/ipv4/netfilter/arp_tables.c
+++ b/net/ipv4/netfilter/arp_tables.c
@@ -59,7 +59,7 @@ static inline int arp_devaddr_compare(const struct arpt_devaddr_info *ap,
 /*
  * Unfortunately, _b and _mask are not aligned to an int (or long int)
  * Some arches dont care, unrolling the loop is a win on them.
- * For other arches, we only have a 16bit alignement.
+ * For other arches, we only have a 16bit alignment.
  */
 static unsigned long ifname_compare(const char *_a, const char *_b, const char *_mask)
 {
-- 
2.48.1

