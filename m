Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792953773;
	b=Ek9jSqgaT8ZT0inHJfiHXdNtIJs9i5GTIKyydnydwsKWzgYFcoXIHtCL6aN5aEbCa0ne
	 oHOBEN8jgP+ZcY4zc+ABnweg0iLJcQztLTxK3UkVqcSILKtyq7YZV3CgvjezlH6DB8+fU
	 YiwDHoNPUfy4x3FfqTiE20NMWpHghU/RxyMdOJtBXkdLDAbeolJIAJ3WSCOF5V+AfZHIS
	 CIzs0QIRi5Cp7aN4+lGAhI7QOaBJCo0fBSkw0fxSrvEe/EGdInX1zYamGtmwnQwqDej9m
	 mEeqOCdVFxWBZTe44Z6/HKY1tBucdbdPcQ3gMA+6cVIEz38oZWEYVdMdSgKyA88ToNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953773;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=MWImOuQ6ypazyDauHnpT+aNeaPFSVLwAEzW6QlQDKXg=;
	b=AO/OLisTs8PBP3Gxrr81oImjUZktmwohj9Wg7e11lYD1X1zsa5sWBQN+5ERy4/LYj9mW
	 J6PZzLDvlOKkVJWsILln+dB890EYZOZcXi1PRIiFDZ3XxxaJ72bfc3HsykPpxCvEHaZ3Q
	 DkRLwXhPlqb11mDUZc5dxKWMGXe4gducvtQTiNiWHjGHksoWeX+8jVEDcbQ6LosOHA3US
	 upiLoRLodTiyMWIt90lywExUVS/oUVVxl79oYxVA/PmndczHTwYDchEAdy6j0XsTx/rng
	 xe2KLw+GwVSJI/tAvLDp0X4Dy+W+D6Eeo1SFPgNNmku38eqE2ZqcSePnoW3ERYulAQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnhCpwT5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UM9gNfOc;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543C8606A322
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:42:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 543C8606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YnhCpwT5;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UM9gNfOc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792953772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MWImOuQ6ypazyDauHnpT+aNeaPFSVLwAEzW6QlQDKXg=;
	b=YnhCpwT5oQvz/xsrUA0NmjLzHab6GVhBdslYCvVwuNxMQiVjFWyHAAa7MZzA9rbsHGbJrs
	XF/ZiF3OT5B6xMZt+Gvat+tV5TS5jnaZ8FXoBApC3GYIW8tmKPWWGSgXJJtLxMpdQl5yTL
	2NlfnPpV/D7R7vAg/TCqQRF1aGmH29c=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-UyOM3XHOOA-UqcfM9qK-EA-1; Sun, 25 Oct 2026 14:42:50 -0400
X-MC-Unique: UyOM3XHOOA-UqcfM9qK-EA-1
X-Mimecast-MFC-AGG-ID: UyOM3XHOOA-UqcfM9qK-EA_1792953770
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c41e4057335so254860266b.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792953770; x=1793558570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MWImOuQ6ypazyDauHnpT+aNeaPFSVLwAEzW6QlQDKXg=;
        b=UM9gNfOcWXQfA6+mcNx2oOQLAI7uqUEEJFZll8z+z1ftL3/5ziQNEzQZ2OVoqKwM/Y
         SNSw00ojeXr7N5jtYuSeSmSMQgS9ml/ddfALqfu8o6Fl0t9twnlZBDuUOhPEg3IdskWh
         5TG0xGt5EXyDYYVjdcoduwqJEf1arIEMiBaS4EUdyhJm3bFZu9j3kccBjnwUuIaB4I73
         /W8AF1sw/drE6ylMDrWiNEaoHXUVzKHZhOBPHAVE8oFN3orLP9zqagTldlOmG9tmSFnQ
         ZjXQBNGhXrMnPUsHVVNuIF2Sia8pCLtK4Bbq9jNdDQuCpP4YAH9uHRF/GqeNBJkvB6sE
         dvng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953770; x=1793558570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MWImOuQ6ypazyDauHnpT+aNeaPFSVLwAEzW6QlQDKXg=;
        b=ZBTUfelROVFz2xcbnJC2yYexD7VEsgxg5g2GbEgoocdoilWjnHfKEKjiltEs9Ih6Vp
         HqbtHn1aAHuOw1oj/mzktqnHfokWDS9mRNFJyZ7kfd4WHll7KH5dxjns5yRjY+HJo0h3
         wOCpQ1Dbbd4deyyPuf+66jjWfbmekKNWfq2nfgT7YiFXrybT/poeQQDmFMsf1Pwh/z1q
         PD4t8xbVfMPNXKp0AMRWOaTJ6XZCr4mos7k52oExxNMWAXFPC+If4AErwpasn+N3WPOu
         1tc6K+LZlpecCZx71vZURZVwdf8F9zfsP4pAaYVPOJJ5o1ki3FlRNqnGUr51KalbeDAm
         BLvg==
X-Forwarded-Encrypted: i=1; AKwUvBwB4yl6FhN+LYO3lLuoZCUJ7JpsbcWIcpAgj1jZdsNJ3K5TDQRTZsC1O08GghJ1F6BngBPn3aBmmUwlBCc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKFvMhPYt+yPIshX3byCJhuCLubKfzZXGg9dcbO+s+H/AwcHxK
	c4vLXh4aqJQzdCL5OJyv9EN7xiyOO19jfrWSCQpf9G6I6PW/t0cUeetxIL0xXlrjTbGbfq8KOv5
	ltNTmQ8hYUf8ALtYVzyH+eU0BxMyptmxmkYND0H1MOaQ0v/wLT+TukfU4mkaZwEuE7A==
X-Gm-Gg: AYBFou3PFI5OfS3Hd60cTA3rUacmweRZAsCtOYWVukbBBvIgwUjMqhTpjX1Q8dTGlQW
	Mr3vtFlP+mKH24BeTuJq9oN7UHVpr0FxBGlrR27Oo3LJq4BRyXY+Sibu9XupWAz4qY/xcL2tX/7
	Km/pBu6cvv6UsUArCyz0TZptPco3VXXJrF2E3FBaelIbH/gchofxswTxLJ8roubH2NnjmQhaFCJ
	nFiWavGuV+pJ+WzkAU0X20vRH4wUhYs5Qd/RN7GWtMsMWg16fqfP5u4AFfgu58JHx85BLPwp8FI
	iHEbWdoGByRR2SAPA+/2cyPpuQHGd/F3E+Y6CWtOIC940KqkUuGzi7I/RY2JggBoGxMQM0nkjUO
	IMVR+HwROCcA5dHvorgkkLVsZ1VaKPiCA1k1bAfMEoBIpavEsznHhiQlOjW4Wi4CIXijFV5mIXU
	RH802kdWSX1iWI2xBR4sYVS+CbwS6qqsnO4IOpOZia4azNzRK2vNTEp/Sy0suDLESuaKNy7Vlo+
	hQ=
X-Received: by 2002:a17:907:a095:b0:c42:24ea:3227 with SMTP id a640c23a62f3a-c46bde93411mr663662966b.31.1792953769837;
        Sun, 25 Oct 2026 11:42:49 -0700 (PDT)
X-Received: by 2002:a17:907:a095:b0:c42:24ea:3227 with SMTP id a640c23a62f3a-c46bde93411mr663659466b.31.1792953769487;
        Sun, 25 Oct 2026 11:42:49 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm230750866b.64.2026.10.25.11.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:42:49 -0700 (PDT)
From: Alex Markuze <amarkuze@redhat.com>
To: ceph-devel@vger.kernel.org
Cc: idryomov@gmail.com,
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/5] dcache: export d_find_alias_rcu() for modular filesystems
Date: Sun, 25 Oct 2026 18:42:41 +0000
Message-Id: <99467b57d12e5b671246aa5e216ddce3a7dc3923.20261025T182649Z.ca9ae7a18449.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.20261025T182649Z.ca9ae7a18449.git.amarkuze@redhat.com>
References: <cover.20261025T182649Z.ca9ae7a18449.git.amarkuze@redhat.com>
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

CephFS subvolume quarantine needs a dentry alias for its RCU ancestry
walk without acquiring a dentry reference. d_find_alias_rcu() provides
that lookup, but is unavailable to a modular Ceph client.

Export d_find_alias_rcu() to GPL modules. The Ceph quarantine state
handling patch uses the export with the helper's RCU lifetime rules.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 fs/dcache.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/dcache.c b/fs/dcache.c
index 1b1a81f10da67c608704383086c3facb64ee3b3b..13ba553081b33a54fd8d1cac5cbc55d0149e4ad7 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1248,6 +1248,7 @@ struct dentry *d_find_alias_rcu(struct inode *inode)
 	spin_unlock(&inode->i_lock);
 	return de;
 }
+EXPORT_SYMBOL_GPL(d_find_alias_rcu);
 
 /*
  *	Try to kill dentries associated with this inode.

