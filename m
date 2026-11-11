Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794401574;
	b=fYlDWCbD5JknatLECxopdunmust74i8Df354EijFwAIlOSOs8i0zDAIRY7OKaNB0s8ur
	 tqCvI3P3kR+0IdIWK+CD1Wh0omqmJcPqT1+A1jfzAg8tQEFCLH4OvxNXN6RLOy22QjYw5
	 7+bFtUo1v+m5ZIwcliypcWWKIXaR2TFCgEh9iyZd0+cIjDLbS6lNAXlnJb/CV2L0gCpwO
	 4AfYdzZc8pvoHzFzJ3l7Y5NEscBxzA/dePYJZkMm6DGa5ZuBE6KsY2m4uYNhfn+67nPKN
	 niyzHDc4Gp1tUPqzggMtOxX6ZVxm5168nmAsA5jXbQv7elhpun8SUw6GbevpPAJILUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794401574;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=WUIiY6/aqEcIQI9igCGxNqtAW7lC+kJkajoHFMnyrno=;
	b=odQ9RwUTlDkmyOOJSdhxJg264zAWnEDJJt0sAVRdQY1nKDidhmSjUbBJxPSzzesuiqRd
	 lnI305QPayk2nt/jDQjN6NCfseGvZRG3gZQuEkyuGMkyu8DrPb9prd7tjEp+gE60oI4eV
	 BgxfhXRusFjARuPRGgfbpMWB8G/SS6Qb93PBtMCyvSaHyOngKj/G06QCr21JJ6j+cR+zD
	 kmHWX90OJXrV6Yq8I6wxd41VgJHiSpwsw16YSkKK6SaRD6WWOh1MMezs3uOq2cCBW0ebJ
	 9wThCFFC9AS784SCAb+l/+YgIwjNYS/F3DCr0skjn7GNx+iqv/8RTsTn0JQOOzXB5KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ionos.com;
	spf=pass smtp.mailfrom=ionos.com;
	dkim=pass header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=cBL0sfsp;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20492606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 12:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20492606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.a=rsa-sha256 header.s=google header.b=cBL0sfsp
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso27251815e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:52:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1794401571; x=1795006371; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WUIiY6/aqEcIQI9igCGxNqtAW7lC+kJkajoHFMnyrno=;
        b=cBL0sfsppJmbAWH3u6JYGpy00djNtx9prs+tozwdSBTBJ7ZfbuCJ9y10EHpF6her5s
         aCkBHSXO2HzYP49eKWbKuFLt1bINOAkNXV9aWjYgCK1vVId+ezyewSlHDQMQVt/isZrF
         y4g8G01XaAXj5WbYxXaKDR7ssGDjlgYYjHTC9fQ2PYmjSjJngWsUxPe3zUdJaomt7Ktg
         y+I8RHHWiDezcsley7OiYrLssMTlasL3jekpFk7vVRaT/Qq48w/Cs76SEbXgFtbcrbeH
         sNA3b9QwYTX9dEdQZh1VzOfjzDRaLE+d0ebGh1sHGt7gjdEmw3QTrjkRSQ27ZaqYg6xC
         iVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794401571; x=1795006371;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WUIiY6/aqEcIQI9igCGxNqtAW7lC+kJkajoHFMnyrno=;
        b=1TRCtzMTtiCpiu2GTbHSkClWmblNQ7cqQu5qFF7R+hgS56lqGu4LbMFCN8L/HJyTrY
         gMzPxlCKevUjPxr+SKoaglBu/G1YZMzVHYpM/XHdZ3p42M4uZsV9OdokJQJSyAzQnSwt
         HcpNbmVMPG4+GaWBTlqJs7uy7JNMCGmZGRUSG98cDp/vdTxqjtWQTBnwosmJsFxGtLxs
         Ws5vArqm5t5ytq+myvrb6gEpmZzHmCqoPHmRWcUIXX3Takbr4ZCBoEeyX86gAZrSSxcM
         9mt/LiP6gY4sIhzneH2p1leGCTFj45hr8SaX8XALFRdLEe5l4K08Mbgx0TV6qBKwmbHL
         PRIQ==
X-Forwarded-Encrypted: i=1; AL+hErFcVcOxGqCVDPH5+ruXj4y3/hFPYzC6wVsLtsp5c49LiG8pLuW/WYqSBXg5gYH8wsotkhnsxMy3a7Kw1FI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rO4TMIl5YiwVCcVkXLemOuvLb764yj533ZxMpd2Lwmo5oS3Uq
	ZijArlP+QvcOCSCdQvB0COD88/JelCWzNQulNHxt+qKqBjReGQEqbhVg7kp/Sf6Eiog=
X-Gm-Gg: AYBFou0qudff07t+yfcn5wJQJyYTddRtVcrIhe2CSzhn2eUe9nPkXUp483FWB8ePgQf
	UTb43GbV+b0B5aICQxSN60ZKid1RgIQsEXczyioQRvOamcOA6a4v7fE9eeC/0Q4wCiGAQYZsrxJ
	/QlstqrhG0GLzKufqOtvoWs5NE2wZmlzc3MdfrmjWCK1Oi54EVxXyk/2kOa+jH3ATLF8kcSRsM5
	oWP44SInKJFpxVjDydjzB406v3krJGD0YEP+2fzp5hiio4VSi9dvruK/bdAoMJLJWl6NQL1QIrC
	3AVIXSOzDBiAUcn+A4SdyJagBQmQVtp5z8x24i50pn1xnkvCLZkwykbEaEModuF0X+EixSTrK+e
	PzJ3PE/9SyBPhYCa6NspB5ql4YIDOKZ3tUW+l1CCCortri2n1SXDFb5uWRtlPe47k687Q9p6c3V
	GQmbcILwLK8cqFzD6xuROoKnsiGcUyHlpdAeunRNBaiQlrjQFAn5UANzbhEgSFXd+FFNPPhvxl4
	6scZad4iGlRN2Xn83z+Rw78sQkoPmrVZwUPvMgBs3hWdeDeNhr+udJuoSn9+2bdAD5OfA4F3X/A
	Pd3y0cXHncpE6VojC2vkMTQZ0Jbu86kOClCraLJbhPm1dpoxTMRPnRTjavEBuYjJ8yW6QWBFQ/y
	JIDT3DJm+pExWMW02MwwUsz/noDisZg==
X-Received: by 2002:a05:600c:3554:b0:4a4:4d57:8487 with SMTP id 5b1f17b1804b1-4ba0936c8admr40498745e9.5.1794401571502;
        Wed, 11 Nov 2026 04:52:51 -0800 (PST)
Received: from raven.intern.cm-ag (p200300dc6f4cbe00023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f4c:be00:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba020433casm132712185e9.7.2026.11.11.04.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:52:51 -0800 (PST)
From: Max Kellermann <max.kellermann@ionos.com>
To: tytso@mit.edu,
	adilger.kernel@dilger.ca,
	libaokun@linux.alibaba.com,
	jack@suse.cz,
	ojaswin@linux.ibm.com,
	ritesh.list@gmail.com,
	yi.zhang@huawei.com,
	linux-ext4@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 0/3] ext4: reduce per-inode memory overhead
Date: Wed, 11 Nov 2026 13:52:39 +0100
Message-ID: <20261111125242.1078620-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.53.0
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

This series reduces the size of `struct ext4_inode_info` by improving
timestamp packing and allowing fast commit and bigalloc support to be
omitted at compile time.

The incremental reductions are:

  Disable CONFIG_EXT4_FS_FAST_COMMIT              48 bytes
  Disable CONFIG_EXT4_FS_BIGALLOC                  8 bytes
  Compact creation time, with fast commit off      8 bytes
                                                 --------
  Total                                          64 bytes

On our production server with 35 million ext4 inode objects (a big
fscache partition), this saves 2.1 GB RAM.

Both new Kconfig options default to enabled.  Without fast commit
support, clean filesystems use ordinary journal commits; journals
requiring fast commit recovery are rejected.  Without bigalloc
support, bigalloc filesystems are rejected before journal recovery,
including for read-only mounts.

Max Kellermann (3):
  ext4: make fast commit support optional
  ext4: make bigalloc support optional
  ext4: store creation time in separate seconds and nanoseconds

 Documentation/filesystems/ext4/bigalloc.rst |  6 ++
 Documentation/filesystems/ext4/journal.rst  |  7 ++
 fs/ext4/Kconfig                             | 31 ++++++++
 fs/ext4/Makefile                            |  3 +-
 fs/ext4/ext4.h                              | 83 +++++++++++++++++++--
 fs/ext4/extents_status.c                    | 44 ++++++++++-
 fs/ext4/extents_status.h                    | 15 ++++
 fs/ext4/ialloc.c                            |  3 +-
 fs/ext4/inode.c                             |  8 +-
 fs/ext4/super.c                             | 40 ++++++++--
 fs/ext4/sysfs.c                             |  6 ++
 include/trace/events/ext4.h                 |  3 +
 12 files changed, 227 insertions(+), 22 deletions(-)

-- 
2.53.0

