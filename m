Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500769;
	b=kzzyJXRSSOmCT5eSmVsTVhE76k1yFd7luF8ejVcGxMC/XT59mgxtlbR6fj5RvqYnzgIy
	 KH7eZaRluaDQMiiL6hu/lTtAxRjIvCnd6HLeCJaRAo760kQ/5ePk3D4UszFHBLzLHebnu
	 wIsdrTpR/KpTyJeXXu6QNBgE1ZLnBu1D+EAxYNk4uUEzjtD9x2eHVw34FOIcAVwODDU57
	 dbFvTxZLDPYxhLWPlVqSl+e8L6TEPUe5rHiCaaGjGjBAIzR3D8NYQokS//+cu3UY/K1Hl
	 FEbIfRP6mxV6zg18ozhXOpSwnVQ8ZPn+CAacwgieSOCK7M5b0DNBYTnOCzhwRl6sX7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500769;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
	b=d7GUP0yTFZcV/Jr7gSIuGYfwUBQVvZxZYXlObrbFEZQs5G90vqh7KG+ul672BXpFRl+a
	 SfRRjjOLZpUmAU6jWe1ywMWVK6+xndqsK81ht128T4vQJFoyFJgVMEtJRX1N+SJZHTqvf
	 Gl+8KJgiQT6MFUHnztUwuvbm5GXZXLSPQOmuNqZKVzZklObmVYz/Kmc2jPZqhAKeGftK3
	 +KdxNYL6tPWYGu4/Q/PKf5xL2hXxx/MQsQWx7D6a31oY7QmPg8AZCmnHfigE2/3HAgrWX
	 Tj/IiDUaBhfyYlltmo5s0XRyxR2LkElYikbeuPQOx0O4xf60Oz5mdB4siITuIzAXfNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E1XcbEq6;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Sxz25ht1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A49606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 12:52:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A49606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E1XcbEq6;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Sxz25ht1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792500767;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
	b=E1XcbEq6O/bTQGd+LT3G3ni2v4sVUxfWyVevoZuh+1d+t6BD0+pjD20tuIiQVRMpg2D3E0
	hk5MY8IDUA7ADyOUEZ0G4b1pFCT5XSzy8MJepXzLM76Kv2NOstXKWUOpqQSWUbschWdChk
	ru1bUSHZXalvCWQsJdUJMCSAAHJwK44=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-MfMEKIFCO4e6IT6Qk6qqOA-1; Tue, 20 Oct 2026 12:52:46 +0000
X-MC-Unique: MfMEKIFCO4e6IT6Qk6qqOA-1
X-Mimecast-MFC-AGG-ID: MfMEKIFCO4e6IT6Qk6qqOA_1792500765
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b1d818b501so3604374a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 05:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792500765; x=1793105565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
        b=Sxz25ht1Di0z0S0fBCiVHyEB+3U8FDm7nOw6Dp2jL7y/hbR6XGpeZLHl4bYl0D43KI
         tAnRtDQYY3auDzClqzE28MPikFSPaYWUMQJENFSFBcmqt4Fhe+mx0Uolc2+nhLW6B81g
         fiTiHFeYs74ZT+tYm6/6pV9vJE6yKouKnm/NSZlkDlQhDL98LqrfbRc1GQ3kjcoBvbPh
         9hskZZD396IG0fWkb1cp9u+MCrQCWMPmQou0fj6lr5WcyTaWCWShgY3fZk60RxbPZULd
         OFdrcP1TBpDVJZNLjDFkgykxyQ1Cit41kDMdhVr9mvia6KqPTGUy+wFQygToifbBaTAt
         I/bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500765; x=1793105565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/eb/I1d03/gtpLIJJSwv9VD8j2S7RruxMe6k1xmmguU=;
        b=yd+UCVeK0jK+tFBoqu9/7oMyIx/HkojftxW0Qwp2s20at1Gcj+imEtfkR/aZhVBHnk
         eEfyq5OdL280ww2kgaO7+wys/jg80gPrgMe7bkZEBy1yS4wLJkS4UKjCEZWqBYdnjjKg
         AuoXCm4G/HR+d2SfmenqG/Yxrs/vQFzp+YnDnaNK+Coj9bZZVk+8cl3wwxQfS4fhf2H6
         mcBXRnkt/FIzu59XNDjoL9KfdnoRYIuyRHs6UyuNrJcHpdoKG1ob+1uvgLJRxxijwsPG
         oCb9vNFiTHR6lHzbGVy0cKTABvUjHAC6B8ILLBtRdz8cNXWrq9qFGXnorWtVK01G2wQI
         vX2g==
X-Forwarded-Encrypted: i=1; AKwUvBzHCdSRdoVgg9CDVk/wFG8DDaDlb/MfHczH1sAU6jDgpmnKzmsO23/kDomfvtvST4wV5X5oF/Sf8en33Q8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLGKrECd+dMdX8oWXvlMFU7iQfDYkGP6NdyGJ3bDd69CqcCP2Hq
	XYu87eKxDvThWc13P4hWRZXm8WAcDQFf8r2S72xHzwVBTeR7dga8TK3/OXr7xFmjDuTE2NDONMD
	fjunsFWzzuEeNZBPpilT4di/W3M65hJRdpqm1qYFDspS6xBoa/pwa+Gwy0sKb4qs2Zw==
X-Gm-Gg: AYBFou199AkS5axsdUlQH8/vs0KcYvuKVjHh8vT3paIDbYPkL+ntVdti1E4Esr1FPgg
	TnCkveAinqpBnk7aHnJC8gn8scjnpP0Ayl/Qz7NB1+tKfLaH/0AdBOI8DBEu1W0rt1PNeDkmkk3
	d55BknLloJ9ZNbrHuBYZSkP1zysMB1yovqSwpKHMupbeT3C0btoW/AzGaEkfYHnFYvDOomB9M+4
	JsKhIStpL4Tvl+X7f3bYpALGx9pBDtsEtlyc2KMtOSyfhvy2jkCFzSsSRDPB85eg4Uk0Fuac8CR
	pYDKqzqSBlihI3aA4WoTr+jD467kutPcxvbAGugExe3p6NgDudKqSMIoWXZu1c+29qmhPs/Aud3
	zAzOBaq3gqpdfZt11sh2MiAoyciAi/Lp7O9AsY4wgsC+CntgW4iNUmg5SxevaJNmUzSwF9ewGDh
	R2Lt+P9dKHpuhse7v2R4xQqCPEexEbiJAnM4sbtQqeezuFVWFNzOm1KDiWSztWaWXTJxRKERp2p
	gk=
X-Received: by 2002:a05:6402:1ed3:b0:6a9:9766:59ad with SMTP id 4fb4d7f45d1cf-6b3a81d9dadmr7485396a12.43.1792500765141;
        Tue, 20 Oct 2026 05:52:45 -0700 (PDT)
X-Received: by 2002:a05:6402:1ed3:b0:6a9:9766:59ad with SMTP id 4fb4d7f45d1cf-6b3a81d9dadmr7485370a12.43.1792500764752;
        Tue, 20 Oct 2026 05:52:44 -0700 (PDT)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b3c74eb8a7sm2982781a12.2.2026.10.20.05.52.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:44 -0700 (PDT)
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
Subject: [PATCH v4 3/5] ceph: add subvolume quarantine wire definitions
Date: Tue, 20 Oct 2026 12:52:35 +0000
Message-Id: <774d53d774a44724c2ab8876a28cf51247bcd0c3.1792498351.git.amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1792498351.git.amarkuze@redhat.com>
References: <cover.1792498351.git.amarkuze@redhat.com>
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

