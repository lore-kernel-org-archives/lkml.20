Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE54A2621
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 11:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519938; cv=none; b=W1HvWxOn9eA1ZKUVT/A1d2mAriHpgmVNn8wnbyAKs7Apa8V9NphazBgMaZW+xY7a+lWC7Vnxfn43jYUKaDsuLZGgyWRdBPsy0l8osERX8MdB6eo0o4bSP/s2Q8hxoMZpM94rDBBDt4nGkIxJA948hS96RYKD3FY221IGOR1qHrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519938; c=relaxed/simple;
	bh=vtvlCiLIxNVZw/5tzOwmDK/FurtYgAJDRHsxvGLZK1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNy1+A3FLqazgvMFas4XKtEsJ5iJw1dt7cPXrLo2O+jEFeI4zA5emMmd3Xv2SaRSnX5QGjjRhtRLnBnXtwo5L9oqVvJQVgTsx1KzPWUSFbc8jKV4Mkxf5scHVqVAv36/D7Y6DzyyfbzG9/AVR0KfADDrRjn00IN4MBLWtF2IwQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n96n9eBW; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n96n9eBW"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-495b27007d0so701585b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 04:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788519935; x=1789124735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UuWL5RJF3Jl/ekyrXLP7vBFpUV2c4qa2+/pFXhLEnNU=;
        b=n96n9eBWd5RTXg/+L84GDOsKsCleOUZTimiROQlbsK6fW8ldv4X1ddSU3tg14B7ya4
         kEyCgLMDna137RmAx6kasTLOl+l3rKNYseaS6atqEtpIntMrRZe8G06cU2S6LeMkRqDM
         2CmS73fy/t4qfU16Dgg01ITRhOYmI5r63VnAurSh2aE+C2lvT6IkCd5MEcSkuQqVvZ/D
         4r3m9fDEkX+dQuoYRtAmYbUmqGitEncBZ3e6aWiIvaIV1xrCqpG79jPxMd7lS8BOzGD4
         NSlBXIEbBiVYhmNPc07wNcyUHB2ciw7gA0SiehlZHTvnzXCLYc669+QJgOQNr6TP50ph
         +8TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519935; x=1789124735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UuWL5RJF3Jl/ekyrXLP7vBFpUV2c4qa2+/pFXhLEnNU=;
        b=OuhwSm36J2tCh/Clk6HvBf9k8+4ggOrnjXrVjnyrPpnC/xwb+U668mTbA40IAZ2VV6
         ND+pXhEyl74TgLyP5Sfno6Jqm2kBaXEm/4DcpCyI/ZRfPVCycmfiLqn6YiNRy5Io+OaQ
         GWCFo1YY2E+cuuc8hkb5qOR8zfbN7nTL9EX15T+sAEsf8l8ikt61QxiaixVyqk48ZTQw
         volFWVHeoo49nkU0u8hKAyk3/88Fo7edV+DaB9P4GRjSoSuGcRCibb8036QVkq2Rwqvi
         ed2iCcn4Cat5ybPElH8wuf7b1tR0SCPHanrU9Popv3TRsZjTXDkexLcfNyh6woOdXSHB
         YBKA==
X-Gm-Message-State: AFuF++lerdAi19KBYMo6AIqBumEP12nWrSqf7kPe5UzGhqnvhbfD++ry
	hD1GOVDcw51UANZfp5cIxmrla+LE22gYT36IZvMIQfXaWso1KJL8Hf7M
X-Gm-Gg: AYBFou2E6ZTf3Jj52/0smVOGVPuFvEkWgB+6Un84RvOWH4ClegyMO04EVrbRZJQ5fEj
	jDliGtfR4WGC4NmxjfZ5Wfnj3jJ04Zre99nlvb0iUGG0BPTbHRIbU9K6cE/4gIwEbhKSvRO9U1T
	J5RnNrqNrRsvsnZ/gTraoDA+XSrfqKR2Db/ihRPQAw8MmZsbecX9okA/KSGG/tmCFTp1ScVqppf
	hQkEPU8NMvWeOAg1YY56Lwy2xfTuxNbYX7NBzsk08eIrx8NgVTsMisFTtD0NOgNjGsY3EIxZeoa
	M/gmhMPgxjZ/GCJz7WVY1/c3KnujNPFgzJBb6/orrqevhcaqnI1UwAKU0YW8PtRYgacC84Mv7lg
	LZaBD6Z2MSx0L56Pt3449lCUEHC48GJMM5BZjxXtBKrXiS5XIgYKsNW5JzWMMIis+3DUcORHRYZ
	14fMgz8XYxz8ZkQDtjpwo1BpZewr3LJH7vrjjtg6lEEuLOxtle5PpPejgknCbiOaKVeSmAa0nh3
	owLoVWGjj8FdbEgjBRrZKL8YQ==
X-Received: by 2002:a05:6820:f015:b0:6b1:445d:aaef with SMTP id 006d021491bc7-6b6fa4e0611mr3688897eaf.2.1788519935275;
        Fri, 04 Sep 2026 04:05:35 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333c9db92b1sm5220280eec.9.2026.09.04.04.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 04:05:34 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Chuck Lever <cel@kernel.org>,
	Jeff Layton <jlayton@kernel.org>,
	NeilBrown <neil@brown.name>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Tom Talpey <tom@talpey.com>
Cc: linux-kernel@vger.kernel.org,
	linux-nfs@vger.kernel.org
Subject: [PATCH 2/2] nfsd: fix typos in comments
Date: Fri,  4 Sep 2026 16:35:17 +0530
Message-ID: <20260904110519.15207-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904110519.15207-1-hemanth.selam@gmail.com>
References: <20260904110519.15207-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 fs/nfsd/nfs4callback.c | 2 +-
 fs/nfsd/nfsctl.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfsd/nfs4callback.c b/fs/nfsd/nfs4callback.c
index a901bbe67e03..d616bbd66b79 100644
--- a/fs/nfsd/nfs4callback.c
+++ b/fs/nfsd/nfs4callback.c
@@ -536,7 +536,7 @@ static void update_cb_slot_table(struct nfsd4_session *ses, u32 target)
  *		void;
  *	};
  *
- * Our current back channel implmentation supports a single backchannel
+ * Our current back channel implementation supports a single backchannel
  * with a single slot.
  */
 static int decode_cb_sequence4resok(struct xdr_stream *xdr,
diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
index adb032b7311a..489de0c0f0a6 100644
--- a/fs/nfsd/nfsctl.c
+++ b/fs/nfsd/nfsctl.c
@@ -556,7 +556,7 @@ nfsd_print_version_support(struct nfsd_net *nn, char *buf, int remaining,
 		supported = false;
 	if (minor == 0 && supported)
 		/*
-		 * special case for backward compatability.
+		 * special case for backward compatibility.
 		 * +4.0 is never reported, it is implied by
 		 * +4, unless -4.0 is present.
 		 */
-- 
2.48.1

