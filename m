Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792953781;
	b=TIgCBEfwv+2LPOzXR5dhDT9fXJq2ejaerffVs2MD13WRMfPeaxKbrY+pWCFK20yHrNTi
	 mTgZybOecjkTc90NMBo78s4aFQNc2uUXEC2vgiLXrMMaqbE0L+Mp3eDcPuUeGE67NaJzP
	 7Oh1Nbkv5LNeC+nYIqqDqLLASRIHFPSPbx/vRDxNnaOG32jGKRblYE0Onhkph5wFoTvnt
	 gOzUf+cbEXA5eYrvIKrWumAZzOXqLlt3moa0UQOvc7gZ/nrag/pGV4D7H4EAaBarCkV2J
	 kZ03nbXIwrqkep1/R7pw4v+ZA+EVmM/ORPOA6Fa38rrYcq2QM0Ybzzu0Bopd6dOc6ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792953781;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6DaWHhYgIwuBxobGINB7MVgdVFMWECs1oxNBivuWWWY=;
	b=H1clBGP6Ah5apfQl14MY0L7oVLigyuJDLRZVyu5DfMsMuNJ2JmL4WrubRRyG9eLMLYAL
	 8CUSs0QqqsrH//ijg4kQ65LtMcHF6JIxPIQfTKgluBQfrA5ZLI+USCQ2VoyRt9ueNo/p/
	 0lT00GQEr36MIhHuYobmdLOFgXjqkxlyN+Rotn8VZA959wgtcBxZz6zbgUgk2arQLtLjN
	 6xiVkcU346SAzfNZsVFLgE3ETn60iVYQpY4AIqx0zvt/Fjx9u8VzgtB1515qpqKVxvuWZ
	 szndZZ/KQG56hUv2J06ROz9S7rGIuu6vgFefP3rjmWt+TmJagx9H5616J785r7w1c1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWzM30nI;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tVnVpHje;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5BC606A330
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 18:42:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E5BC606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PWzM30nI;
	dkim=temperror header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=tVnVpHje
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792953774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6DaWHhYgIwuBxobGINB7MVgdVFMWECs1oxNBivuWWWY=;
	b=PWzM30nImfpG/iYmlCpzvUYdOQQmJ4iNaTraeXXtwlzsG1pjPIdrAxO09o0kTImphRedTA
	+RNYSqx2r7jmA5NuCp6P0VCvtbk2BfTsltESCVfx3xwbfifSTUJ36shfqsjJ6tI1w8SAZ/
	dGg+wEtemjMOCf3+6mrmKe6S1hXJPQ0=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-Lsb86W-vOHe5_sG1u7hcbg-1; Sun, 25 Oct 2026 14:42:53 -0400
X-MC-Unique: Lsb86W-vOHe5_sG1u7hcbg-1
X-Mimecast-MFC-AGG-ID: Lsb86W-vOHe5_sG1u7hcbg_1792953772
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c4163a5400eso353355666b.1
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792953772; x=1793558572; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6DaWHhYgIwuBxobGINB7MVgdVFMWECs1oxNBivuWWWY=;
        b=tVnVpHjeJHWyc+4qBdBCZFpyXKtQY4eAqsiMZ32EjZFUTevWDLdNiNvMwSwpfIZGg7
         0wQb9lkF24BqwSHlNZfpqN0jPnNfPUnVpvB08ltclv2mxaLFcvMtqHP1dhyaU9eX9sAX
         7O4z1F26ZAtUPBq+TgPQT+X7YLevSZcHfr94BeZzxkJ9pKMxS2ErMgN9pEbE++DZK2nz
         aGwWuJch/RvcmHsf17XC9mKCzkVMcsphXS64TpmJajUWE04Jl6gN8Vq8Zo6b6VChSUBK
         ooaxB/hv9P4UaA0mY3TzMUiozKiJR2gvM5B3VkkQ3i7Sm6JWmmDwmzP4b6/VcPfRA+Q2
         xxnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792953772; x=1793558572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6DaWHhYgIwuBxobGINB7MVgdVFMWECs1oxNBivuWWWY=;
        b=wuOKmR7FKhCNAj5WAz0TT6tTwDxoCPbDhoHFKJQjg1ObT7nSsM+a10YB5NCYOhBMiW
         bCdxS0bgWtCkToLHDpacixLJavmdY/KUr6uOtCv5xQxpyQq25yHmJzlSR5rZ43qayUl1
         EuWJp5p1VHmQhvW/IFtTwUNLK9UEFNt2O/Eo2AcCo9c8n+/jEgEVeghvMI6gW5msFscW
         hNMvDy4R9P9x7Maj2EJPYsoFe7zzNlo0CKNVz1EhuzssPzgTbLKdFV9YKakI5Hehpnhw
         xUwcZwWoa0ySJxFf3XmXojuXmeME/gmfmbT9mBeqA+757XxKP77uWCXZJR1ERfRl2Aia
         cMIg==
X-Forwarded-Encrypted: i=1; AKwUvBwwNVvcOJKUXdypNNvqyKJIcA2i+A6H9mqi+G5+Sdg0f4O0ABgCAN3SZ18iLQ7K2b8Vhuk2wLLghPDQUr4=@vger.kernel.org
X-Gm-Message-State: AFq9FYIOBGea9PMmBO/LjR4Fe2zF/IQ1GIDg1ykPCQ8ROPsz8KbzO0oG
	HbQwnB7ukSGNBDzj10xKW85R941phYsr1J5g7BYiUnAC+B/elohYWfFmjjn34i9u6NpfoEttWDZ
	Wil+RDlGWIYAL8+SMHU7zqphPri/TknXigq7tTvK0KRiXx8ndaObGppvXeqj8PzLRvA==
X-Gm-Gg: AYBFou1qKimXA6RRUdKfK+pDRsMPf72Ju+XqcmvXRp/sS/zMQNIbwoo/N75IuFIAsyI
	Oi4pyILjfjeZkVRVpM5gS6jcIWQMCWNQQGWhd8AsMPihjQDXbdXZwvglaiLSKLdJP8k1QSchp/X
	s791KCPZXyj91YwX91ALX1UORMfsjF3Ps11DG0LmhQ2wa0OlZTrdlRNPfeMJSr33fGTPokgUeAm
	Gn++QSoF3O+Od3Qpjyrbgo/HLOkNFIJaN/T/ZtVxCAKeg/fLMSFnW9UofdowCGYZ681U9H1/SXn
	QWC4JUfUwshgpcEF2Vns0xHsUNnzNwLTcT/Reak51iJ5dxdTDSm7+m62zM8PphkqOnlN4epRJfj
	s65AIkzOVJBkatMOhC4Xpcflgd5uyidwxZtPufz/cymPKuHrAPa9Dz/yahMLTa9NkE72ewnpBF2
	Ei+1CLl3yO0F4ItnUpR4lIqwujCMMbyCsw6EaRiKrl8nEreqwRy99rMZpAGziUfzKp5aINiUhFn
	O0=
X-Received: by 2002:a17:907:3f8d:b0:c3e:d0ca:d30a with SMTP id a640c23a62f3a-c46be3866c9mr565910266b.4.1792953771960;
        Sun, 25 Oct 2026 11:42:51 -0700 (PDT)
X-Received: by 2002:a17:907:3f8d:b0:c3e:d0ca:d30a with SMTP id a640c23a62f3a-c46be3866c9mr565908566b.4.1792953771631;
        Sun, 25 Oct 2026 11:42:51 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd66e51fsm230750866b.64.2026.10.25.11.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 11:42:51 -0700 (PDT)
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
Subject: [PATCH v6 3/5] ceph: add subvolume quarantine wire definitions
Date: Sun, 25 Oct 2026 18:42:43 +0000
Message-Id: <63fbc27fc8339ee0744d4488016d76cc2cc73e08.20261025T182649Z.ca9ae7a18449.git.amarkuze@redhat.com>
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

The MDS reports -CEPH_EQUARANTINED in MClientCaps v14 when quarantine
denies a client's access, and restricts that client's caps to PIN. The
wire errno is 1000; the client must return EACCES to applications.
MQuarantineDisable identifies the inode whose quarantine mark can be
cleared when access is restored.

Define the errno, message type and packed disable payload, and add the
message name to ceph_msg_type_name(). The quarantine state and access
patches consume these definitions; support is advertised after the
cached-access checks are installed.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 include/linux/ceph/ceph_fs.h | 13 +++++++++++++
 net/ceph/ceph_common.c       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/ceph/ceph_fs.h b/include/linux/ceph/ceph_fs.h
index d70bbce1a1b2b4ffffebe896ef46eb6853ab354b..5afccfa891cb045e9784eda1cc4741749aac4c06 100644
--- a/include/linux/ceph/ceph_fs.h
+++ b/include/linux/ceph/ceph_fs.h
@@ -154,6 +154,7 @@ const char *ceph_con_mode_name(int mode);
 #define CEPH_MSG_CLIENT_SNAP            0x312
 #define CEPH_MSG_CLIENT_CAPRELEASE      0x313
 #define CEPH_MSG_CLIENT_QUOTA           0x314
+#define CEPH_MSG_CLIENT_QUARANTINE_DISABLE 0x315
 
 /* pool ops */
 #define CEPH_MSG_POOLOP_REPLY           48
@@ -921,4 +922,16 @@ struct ceph_mds_quota {
 	__le64 max_files;	/* quota max. files */
 } __attribute__ ((packed));
 
+/*
+ * Cap oserrno used by the MDS when a subvolume is quarantined.
+ * This is not a VFS errno; applications see -EACCES.
+ */
+#define CEPH_EQUARANTINED	1000
+
+/* MDS -> client: quarantine lifted for one inode (ino, oserrno). */
+struct ceph_mds_quarantine_disable {
+	__le64 ino;
+	__le32 oserrno;
+} __packed;
+
 #endif
diff --git a/net/ceph/ceph_common.c b/net/ceph/ceph_common.c
index 67e88f30409dd3ffba9dadb6fda529f4101d830f..cc3d21fd7d5bf251bd58ce19f8c7d8a5b02fa1d7 100644
--- a/net/ceph/ceph_common.c
+++ b/net/ceph/ceph_common.c
@@ -83,6 +83,8 @@ const char *ceph_msg_type_name(int type)
 	case CEPH_MSG_CLIENT_CAPS: return "client_caps";
 	case CEPH_MSG_CLIENT_CAPRELEASE: return "client_cap_release";
 	case CEPH_MSG_CLIENT_QUOTA: return "client_quota";
+	case CEPH_MSG_CLIENT_QUARANTINE_DISABLE:
+		return "client_quarantine_disable";
 	case CEPH_MSG_CLIENT_SNAP: return "client_snap";
 	case CEPH_MSG_CLIENT_LEASE: return "client_lease";
 	case CEPH_MSG_POOLOP_REPLY: return "poolop_reply";

