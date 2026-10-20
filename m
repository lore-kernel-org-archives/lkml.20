Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528022;
	b=OFHTqLfod0C02miuTRC/TS0+dpmiKhMqzIjpaPjOPl4lwZkwWw0K8yh+KsPrL7VOXM95
	 BaY//mD5arLgeRe1VoMkVz8YuDa+gxAvM7r5svjbVqUP2biz472yes5K4JiUTNRme2hwF
	 ra8KOOg1UpT1ewPT/mcIrbhnS6tqb5bkq2Iv7OkSJX0y7RHrfAcvWVmaw8fDCtwo7q1y6
	 VVU7IG1fmhrc09bOCQnklrHdk4MwS1jFbp9T52Cf6QINa0gs0Gl5iIzexmKQLoeeHqIWr
	 GtrcA4MQ8Qqh+RIyvHPaxyFjfiPutgVkLRI9I8WbE1PwnJyHkA8MT6753igsvln3BHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528022;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
	b=plrboMwaidmj0SGQXXIdKxCyPoHHJYfcdVZLwKp0ojhT13fDES3sWjRQQOPb3piRYNh5
	 G+cpEtrSA5iIRH4TSndSPxnHhwgOpXw6O2Nut5nkoJzDmqOI0QhofmXYiR8yMl4pQpHjY
	 YOxYQG+XhCJKhkUPXEW5mrZHR5i/gUXyAfIUZ1Xg2D7XtiYLjzM2NKHowwA7InFzS1H48
	 Jgl9zv2izkahVsozi6DMzXNIlssHd0cxE4BGN4es8tHmjE5j9Xwl8A50RWPwrBF6tCzsz
	 gIz3ty3T9Ir2BKUqOinf/NV+IlajU30rvtWVPZ31QJqzuJgrLFakEFy+WiV/XUXA9XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cBondb5e;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qD38TerE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5C3606A324
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B5C3606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=cBondb5e;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=qD38TerE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792528021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
	b=cBondb5ewmwkBTgocX4KT+IRAcWkpnglE2k9a+guhzkjL0l3HiGU3mRRKnoqZBrww8KRfm
	p8iQr22VI04YGdeVb0gvuLiGWNY/6OdxGx4KWa0qow4pNOjbT1/Ykmid5IEoNfMhCiZEtw
	1LX+sg/XaKDjbWK8junLGu0B8pnfhYs=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-y94JwAomPR-SlzqXehvfcQ-1; Tue, 20 Oct 2026 16:27:00 -0400
X-MC-Unique: y94JwAomPR-SlzqXehvfcQ-1
X-Mimecast-MFC-AGG-ID: y94JwAomPR-SlzqXehvfcQ_1792528019
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91785bd637bso2807946d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792528019; x=1793132819; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
        b=qD38TerEvM/xhI2qcwInD8LEBlNiS/MBERmWwGQC5j/F3NqlwIYxOxFx+IhZPtkzkN
         ENXcCbTXRt3YC1+TsNbtx8fk1Wa/YWXLzTMop0W/2wJp9WXUFWddex/QXJTAsa+5Qw9H
         wOuqxeg5sOeXSxlF/KGmhV5KeTmXP4BTJ1Jb8/F/WP9JIqLYi37WziXseeVZrgNx1H0g
         PUME3/C8kIsuYH3WTKEHidYhfPHMGK9/dymDN3G6qlRaAG3PUPlxfXVijFuf0oNiPsXJ
         BCHRJ9iMD1Q1YRPqw306mNMcy0AgwRjMaLtlodFe8ueKeSqNptMuj2UClBSMSVMSutHG
         4JLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528019; x=1793132819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RRNHwuzxK2uMbz7SC9yJ7WKgsG9c53Ltjg56svJJIY8=;
        b=vItrK1Rn6vakgBBM+559+TP3BD342x3tqT5M5FgLWekbshC5QacleyzzD93JOQ9d8W
         df71wZvFkR1EhcBcqVrOZzDVk5nGxhwYW9g0avdWOAtFUpBE4lhcZ9nyVOwpDh4AeEdy
         gI2e3ThOeoMPxdHsPaiGludZF/EOuFVsU8UIZ9zuQpRm4LV/TEnYzhMlX80fSgGYpZA6
         BE3KjozvEXua7aUh/asRdDH3yecvHodpPZGEao5rAN23bXBJpME9B90iMKfobDaQbZtc
         gS1NKh77j9ISYQUztaXlHx/IYLYjB1SNQ0mZUv9T15O8/VbOmfbt1KMJmb4pQWv5QlIC
         ZpmA==
X-Forwarded-Encrypted: i=1; AKwUvBwTqMMgwL9Qg+I+OfmVJOxPjaQBEIM7cqsgePd7ijo1HdxtofSPK2xzoa28sUtX3nMNGPdF8BBIf5ZGA+A=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkr2owpJ4MzFp7z/TyWjhdi0HVByUrDupV1DAiX2BomVw3aqPC
	JgS0BTQ3oJIzXLObEBDBC6pXIaMJ0PLrDtceAt2jEef2v8Pd9mbnR0mpBSuCrE4ZcNwR9zXEMXv
	7Cdm2n4kmeHUKSYXGXAwgVjy+UaLYCWVtVHCh3lCJpNAn85CJycL0gzXz1spBWDFG7A==
X-Gm-Gg: AYBFou2sbPcFO+ZjsSGEdcReZfnNpMBLi3qyW4djMRIFV36iBTzTs+kDJ0DamGHsW7s
	OwLC8DfaeQD0ExMKsmNdZjOJ52PuKXwmHhW7BC60+jVksO1EZlrn7s4nSjpdymIXSd0fQHGfxWG
	VoinNYKU1Lcd/+GryOBxYgAtOiMhlBr2aZDz31ZcPAUzyWOHs7/IlVXgZXil0jwA5M1hsjdY/+m
	PSoQwdII0E5rQs8nBptz6sd3ZUUf1f3Ni1oRk/y3jFdW6Ivtdofci+4SWSTo6NcyRgfQLlsydjx
	wHeYw34LXXed3MtumIml6PdZ2loz/3dxkWnZ8PGklnBK2RGZU1VqzBU4h8YjICI667a8rSkjVgE
	yDuoBq5oR0dDUgVymkHFDAxkO4bDR4z6u0CuDSYYysvnZ9PusZNoUXYPiN9chiBSIxfd/WKK1Ln
	ujQS8HkX47hJvPhLCL6kJwu8CvINQ6mXpILFUscmJgaFA5Gi5xWS5CbbHZYYwgTRo6VVP3HP4w2
	fk=
X-Received: by 2002:a05:6214:6107:b0:91b:f9ab:3944 with SMTP id 6a1803df08f44-91c01f39390mr65133166d6.7.1792528019298;
        Tue, 20 Oct 2026 13:26:59 -0700 (PDT)
X-Received: by 2002:a05:6214:6107:b0:91b:f9ab:3944 with SMTP id 6a1803df08f44-91c01f39390mr65132696d6.7.1792528018761;
        Tue, 20 Oct 2026 13:26:58 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm7461436d6.3.2026.10.20.13.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:26:58 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: Alex Markuze <amarkuze@redhat.com>,
	idryomov@gmail.com,
	xiubo.li@clyso.com,
	slava@dubeyko.com,
	viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-fscrypt@vger.kernel.org,
	ebiggers@kernel.org,
	tytso@mit.edu,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v5 1/5] dcache: export d_find_alias_rcu() for modular filesystems
Date: Tue, 20 Oct 2026 20:26:46 +0000
Message-Id: <ad1e9d2c5ba4803f1c7dafc6687638b0489a7265.1792527529.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792527529.git.amarkuze@redhat.com>
References: <cover.1792527529.git.amarkuze@redhat.com>
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

The Ceph subvolume quarantine ancestry walk needs to find a dentry
alias under RCU without taking a reference. d_find_alias_rcu() provides
these semantics, but it is not exported, so a modular Ceph client fails
at modpost with an undefined reference to the helper.

Export d_find_alias_rcu() to GPL modules so filesystem modules can use
the existing RCU lookup without changing its lifetime rules.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202610171220.i77KPiw5-lkp@intel.com/
Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 fs/dcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da6..13ba553081b3 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1248,6 +1248,7 @@ struct dentry *d_find_alias_rcu(struct inode *inode)
 	spin_unlock(&inode->i_lock);
 	return de;
 }
+EXPORT_SYMBOL_GPL(d_find_alias_rcu);
 
 /*
  *	Try to kill dentries associated with this inode.

