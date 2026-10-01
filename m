Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB59356742
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816264; cv=none; b=gv3+D6rQ7cRCaDjkVCwPtfWMD0oCZs8Ur21ZiTm3LAuokXqAcE7qIQ1ap8i5Gx+jWvBCyQ4LIYYViRaV3YTa/hqgMja1ZDaoGPKcUADa++E3dhnyppfZqzBgoNPvs9uklrNw2AqwhoNs3Enfd0hN2x5VgM9oWSiLIl9PwFXAFOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816264; c=relaxed/simple;
	bh=3yX9N7gRsZE2T//T/LG2eAQs1r/y8GAZ0n6lbF1+AMI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fAJHsV/ADTu29VXhIVucpLWDQJAYQ30Jiqjkvpq8N0n8GPElphjr0WZDdUuLYYsCukIG/Db4ux+NbeQ9R+1JjhLPCF8zqZ7/cjrYu+XTuir2tQG+nErT6LTyArhVsHiwye/vXDusBIxgUF3ubC91csdq50Q2uyRpRaIhccFnPyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mfBd4KXp; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mfBd4KXp"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e2f2bd5256so4553455ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790816262; x=1791421062; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WjMDzPbxoDZc0HcBqdKOJdHnNAywAZ6wV/0yHIoux9E=;
        b=mfBd4KXpcOCoWhDBQQdF55Q08WDUd1iktcAtSB0fQn2ra7ttfSWH5e/yueGobJIM3R
         6witI8dM0HnDU33mewp0289KMC3UZrL3L9nicMWA9KmRTO1bHq3tAZDMiAOKViZ7R2fD
         2MY5bDCHkkViJgjP4u5ylYpjZp4AIVBfymVE2ZoZYn1L9XGIAg3ZY/h9f+d8xXuDPXDG
         pr8hFpqn1U+qOWEm7Zu1ckFEfvknAAAcYiLdvFarSQLfO4pOyopGrhh7YOnjkSl/0Vxs
         5N4Tk/3/WCkBfcHK//Zz4hQaB3u9u+qHAXRABLT7M65WoGIKW8mHAj9woRDG5LyirrRj
         ucig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816262; x=1791421062;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WjMDzPbxoDZc0HcBqdKOJdHnNAywAZ6wV/0yHIoux9E=;
        b=kA9P3tdr7yFEzbyEmupg9fJR6DUpteMQn8FbPY5mplyQ+mxQydzUlHpCFWRoI7F6y5
         0AOVtpWF/Ir9BkzIYNF8VchtGL4/aZk2875XBNys836pg74m2C1yhMlVM4ClGf8WZywE
         0vCBu98V9aH+aTccs0PRJurWV8cmgFzTKq8mULgy/xrMcePWCYOG39U4X7x19nofDYcV
         ev97WyCdkqZfPvCVOk64MwR2WzyFgdUmeQdGNLCA7vhTLVnM5fi/E4yt9KhFQ3xl8xFn
         1t59cs/wHvSGAqqK20W0FqCWov2BypX5yPftntVuiSpP0c9tiLmEyLI+XhQLs54cOGOc
         1ATw==
X-Forwarded-Encrypted: i=1; AKwUvBw2y6gS2qK2G7U9eeVOG4YfMYj/GwJ2tSc3mg5abIT5jsufv3rM4ClKmKgBhBLG8Cb8Txjt4LKbhfAXJlE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKDOByqm4g2TImjRSiViecXiGlJYwVav6KbZsxvA3Sd4q88E2Wj
	ND1BoFcuPTPn6QaKgh3U3UHuHlAb1Hkc1RurCfjzBxICgWlleNyofQVHons1G9UakfJDN85wiOw
	EldYp9eRkAq7HJg==
X-Received: from plcr5.prod.google.com ([2002:a17:903:145:b0:2e1:324e:b311])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:8cd:b0:2df:7e40:6f6c with SMTP id d9443c01a7336-2e2e49f818dmr25929285ad.46.1790816262111;
 Wed, 30 Sep 2026 17:57:42 -0700 (PDT)
Date: Thu,  1 Oct 2026 00:57:30 +0000
In-Reply-To: <20261001005734.1033516-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001005734.1033516-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001005734.1033516-3-skhawaja@google.com>
Subject: [RFC PATCH 2/6] mm/memfd_luo: Set Liveupdate level of a memfd file handler
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Set level of the memfd file handler to LIVEUPDATE_LEVEL_MEM as it is a
memory provider.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 mm/memfd_luo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memfd_luo.c b/mm/memfd_luo.c
index 59de210bee5f..91ddd7ae64b3 100644
--- a/mm/memfd_luo.c
+++ b/mm/memfd_luo.c
@@ -604,6 +604,7 @@ static const struct liveupdate_file_ops memfd_luo_file_ops = {
 static struct liveupdate_file_handler memfd_luo_handler = {
 	.ops = &memfd_luo_file_ops,
 	.compatible = MEMFD_LUO_FH_COMPATIBLE,
+	.level = LIVEUPDATE_LEVEL_MEM,
 };
 
 static int __init memfd_luo_init(void)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

