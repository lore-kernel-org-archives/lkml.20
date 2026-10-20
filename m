Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792528028;
	b=Eo6m66VZI8jYD6HP+iFTCmaf78pLrXu8DcdFqdaHICVLv93zHXZw1vYqb7dQ9hcdyxh3
	 mk89PptH8FTbF9IzVc+lZkZLNCYh6SdNLj/He/ou/A/YgLxYxsQYisFhaaoUeGUrBT+06
	 SHEYeJ6KWHlQExX7jtEoKKlT6MY8TC8aBLfZGl/qqdG2rOC8ICXi3l5LncpzX2McklHaf
	 AwlNBQnwSi9Uqmwo/mBTT4aExY+Pk/mwIVldV8uwa7MzH6CYX4uTAVWA3mMJn+7XQE8+c
	 QS9kzT+xJDEabH9fb7BU1OwHSEfxEolzix32jV4W3IWtBomaFL1Gjx6f52ZH7nKrVeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792528028;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
	b=THibyXEmZs+k2Zo9BKfjrGbNLIEViZIh1WnWQOyrBtaNIj/zAjvRiKPFiEmB31Cy2BCf
	 vit79/5k8WKWNm4gSlp1JKyaJIkN3EIGaKwKdlzM/hoa+lRuWMifV/IqMDN5pTywRfZnZ
	 eN7NIbFFfdRzYOOVOCqGMAfjifOAjJiY2d50/HGIwjGMaCJLJunkUV1xlnPg88R00FS7R
	 dcxf6cm1kV7qzDZTem4ZwOgjTIhnaOClqW9sTgNsgWXyZcI1Y4t1tZj6LAaJMaCfZNndW
	 I3nktEzlAX3tI2N1R06lwtzowk4BOJO/EWX9Ox6iHikIYMVEEgQXGj2YUZkAGI3TMrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KjBtcODc;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="PL/TEgYt";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101E0606A322
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 20:27:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 101E0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KjBtcODc;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PL/TEgYt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792528026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
	b=KjBtcODcs3nJbggHw1XV/8ddKA0OuoR/A+XaWxIb2b6qan+KpyY9XPePiqE6kMhOW5t+vg
	R+jTM/uzSLYD7P3LvtPQeoukMHwKhvE28EyWQEcBwiL9p29FI5PIgQ8+JhPgXUWsbF3+qL
	pK/s/hNP7yWbjCDT0BIc+dg6742FV9Y=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-mMH78EBYOqmAIKb-tc4BGQ-1; Tue, 20 Oct 2026 20:27:04 +0000
X-MC-Unique: mMH78EBYOqmAIKb-tc4BGQ-1
X-Mimecast-MFC-AGG-ID: mMH78EBYOqmAIKb-tc4BGQ_1792528024
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9197553d398so1866026d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 13:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792528024; x=1793132824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
        b=PL/TEgYtsmpwVYabHp5Gzx43TyRxZDYQcCFL6E3+JWQ28BKDj+fcpOM2mbzp3c9iYI
         4A7nmVWVPyaFXCCjN64EhkEDJUPY8Y3+8UYX2oi0T138zJ+oJKTJ60oa+7G4gq+/gFv2
         w7t311vSmLUwyicxUw69U5Mdofu/zeGa7Zodynn7HZHSwn7hFGI5mrhBHMBpi3cfrU9P
         OiNSIJ6EZwO3COTcmZPWIeX9MYf0UE/Z5B4l7kCH2PNe20g5E3Wfixy51wt6VaP0eVSK
         Orka+uKEqSQHbDlPRJ8LDHc+gprL50vyYloeRSphPxAMwez3YXxzqJgqaoL/g6OydAxT
         rl6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792528024; x=1793132824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
        b=EfJzfQvFG20VPSL6rcUOFb9TYZwGwPPBmBqwl2vYuTtjicPfrkezm6qSOlC5JE4RaW
         Z9ONdmjJs8wp1nXQ2CKNUfatm3z+J8z1CaK9l9oU8U1nhkOmvjEZra89D9nTlYEfKzp7
         xnQYUY5By7UiW2oIWGyylOlL+htvmlNxvlgfD9aTZTRbIhjSQjfHhiHvLpmRYTK64l/G
         3Z7VW5iZWnQ5GFP/PDWAVe5tD/wjscOA2kk6Tt1Pt3Jrh7WMtR8ILO227eMyaJ9p69q2
         hwBY+bR7ceFUeSJJ0TBYTa886V0TRN8Ncr4Dkzav422iAIIOse/6EABJ0E5fB/3JYhql
         4ZTw==
X-Forwarded-Encrypted: i=1; AKwUvBwN1wsCipvq9tp/W1DOJaoLfGnlg+p4BmHsR5W/Br5uAeuqZfGa2QxTmNrSCOErwNXZr1tSjTPUrPakCsQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJR166Bee8WSzedEP4Fz9OgXbdH4cxbQpotmfqlZiB0fJqTkBzc
	u2DY6XgRWr88jhcZ+5nM+laZ4mgTgs6/v50K4vrFtN8aNFrG82w5iL3MDrUfnFlxU4e73G20Rfp
	9AUDrkNUa7oooHhO34yzUa6HUDXhxaRY7b9MewT7Fa2kljbqd2g71smy1N2jtlml9sA==
X-Gm-Gg: AYBFou03c6o5P96n0KHRBPVt93PGP7fGA0zh4ErMhzEuUqt2kFhESVAq5po//5JilNt
	VrAs/KbfucGm7fSRNQRs0Tu/hdEwKykJupOaIXtHDDLJtIafWJSnXGg5mC1Ayp12jdN4EDJ9+1w
	LdDmDUtZvLPoBn5Xk1YgaDegC58+aGruFvwTL09dGa2bVxs+tq6eogb80cgKC5o0/Fu0qGZq9N4
	LCkHV/2Opz0GViNYInQChDmDQeHHoZd1kB4UBH5GQw46OI5iDx/JpdEPfuPxyOkukrohG8qaYNI
	TS2nk65/ZQyeqiJf4uQrYBKBKx1IB14KtYdjyCKqryKyegdhs18T2+pu66SRUaFPPY13SDhUryt
	eZ0e/VXgldISMk8LNhEQGVnu73Ec+bQZFZNf2/M/ypJ0+9Vvy+ZMKD151XoQw9SgYvx9vcKRIb6
	y6DDMuuMMEVLbyOuoa4KTAw199Qi2TnFkJxX3SRgfp/LISA2WjYBdeIVbVxyly4MiOopW3Kg1D6
	2E=
X-Received: by 2002:a05:6214:8414:b0:91c:305:a955 with SMTP id 6a1803df08f44-91c0305a95bmr51463476d6.31.1792528024160;
        Tue, 20 Oct 2026 13:27:04 -0700 (PDT)
X-Received: by 2002:a05:6214:8414:b0:91c:305:a955 with SMTP id 6a1803df08f44-91c0305a95bmr51463206d6.31.1792528023567;
        Tue, 20 Oct 2026 13:27:03 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c10a45336sm7461436d6.3.2026.10.20.13.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 13:27:03 -0700 (PDT)
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
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/5] ceph: add subvolume quarantine wire definitions
Date: Tue, 20 Oct 2026 20:26:48 +0000
Message-Id: <774d53d774a44724c2ab8876a28cf51247bcd0c3.1792527529.git.amarkuze@redhat.com>
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

The MDS revokes a quarantined subvolume's caps to PIN and reports
-CEPH_EQUARANTINED in MClientCaps v14. This wire errno is 1000 and
must be translated to EACCES before returning it to applications.
When quarantine is lifted, MQuarantineDisable identifies the inode
whose local mark can be cleared.

Add the errno, message type and packed disable payload, and teach
ceph_msg_type_name() the message name. Advertise the session feature
only after the client can enforce quarantine on cached access.

Signed-off-by: Alex Markuze <amarkuze@redhat.com>
---
 include/linux/ceph/ceph_fs.h | 13 +++++++++++++
 net/ceph/ceph_common.c       |  2 ++
 2 files changed, 15 insertions(+)

diff --git a/include/linux/ceph/ceph_fs.h b/include/linux/ceph/ceph_fs.h
index d70bbce1a1b2..5afccfa891cb 100644
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
index 67e88f30409d..cc3d21fd7d5b 100644
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

