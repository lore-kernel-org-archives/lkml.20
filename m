Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423B630FF36
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790519715; cv=none; b=X0xJU6WtFgZtG6znB5P5leGPSGtp9+xsy8hB5qEuFqFBJ+NRimf2UPaZV6TYCcdCiRKjtA4+V8uRDsUcIxoLXJGAIa2Q1Hh+/G2u+1p6Clnth+nzXCmG3ajRbegVOIf/5y6aCt02dEKT+gyGiTU35cnUxALZ41Fe6hrbhp9/JtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790519715; c=relaxed/simple;
	bh=XZ3zcgSXOFc0oPcXm2xYqWkYO2EkgRoqPX4eVvIX7mM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qgWXmHaIywJZGbDIpDiswrR6EwqvrvtFtib3IfbcP4Wj2bta2uN0qaKDD1WSjkz73O4Wxxf4w8hQznQBwBjdRUIK4x/UmUcry7PyJJfOqMjNvmIIq9e5GziK3Q9NY9IK12cwcW0kU4o/oOXkMcrUE22IDKhyyF4WzBazDsbtsE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0maIMWw; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0maIMWw"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a15703so2017277eec.0
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 07:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790519713; x=1791124513; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
        b=f0maIMWw/6oew679nNX53dNUMtm7DI4fZ35hmdffDoTmtU2Qp8YxJufTBSnYeNE3Aq
         WSisgzazY3PSfA7Xd07RbAyCSvqk/3PKg1zrmxIB1gzUEPj5xyjcc0UzKjmRUJVU0Az0
         mge6LICFAv1jmRXOQmgXv5ubhJ4v34guOxR+fgYqv+mFLKiGw3g4cOBhYa+YjfBS8Yx3
         qXnAbBDqwmvK3vK0tWr9DLqah+ZFZUT6ZbM2CqXEr86loRG5B3fLDBzhFaRydhnPF2FF
         +Z2kVt4dQFAok1/Ci+ZUnBd5QbLvedMR3+6lfoJZLyzIEj7pURNLP5n/39DlPhRcKXGj
         ioUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790519713; x=1791124513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OEeeKd8/7R6Ji2+yPy0bODVrPI/c25RCAh5o8xRTnOk=;
        b=tMjspu9tqLioI2XpLO+mIEj2UJzcleJV3l5NL4GRMHVauulSMC6uRhI9dOZ2VWTA3I
         lkuE02NhIWPgRgzN9Os9zJVATF96GbHlbd/0U2YfVDQJhKhrZtwSvb3avbqI0YuUaqMh
         6NlNW6nKT+xGcck/5SHsRtNxmT/MQJ9Pw0FiEa8DLSyvV1XsVKkhD5f70+SCuUrYiELT
         5nXVzPgXMlcAK48PJ+zzIGJCIC5VCs2e8eQQlHz1kP/hFpVI8sFjOU0vNwG8MaOTBMoK
         GBmXy+luChyMdsmO5X19E0yPJG8EhDxdCwsF1AhKh+3hY0Mo5FptFFLdCKS6BqlP4rr4
         41MQ==
X-Forwarded-Encrypted: i=1; AKwUvBzWoDtKTcqSkYZjsxD7YX5pq7/nal5CKUlrBEy7zcPoN3df5Rnf2T5ULanehbZ9B+pd/1cqGu0b+OIIpqg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmAUX9qlmEBg7dlyMCwBVMP+wWXkdK6KkvnAjJLfD4BfPCzyl8
	OLptHKWZs2R+VDCph56yCn7Gqmn50ePbKguAhVCj+vDBmqztXmpCnSKx
X-Gm-Gg: AYBFou0Q4JcuwgKgWeAXCqhXHSlFqdVvWPiSbZDskNkpCOwQtR/asMnsjwnumIKBTfp
	47iQ73+P28q9lu1JzyGUN7Df7AZXnaDj7P3Dh5oixZdvzTP3CSki7pOy5Pr8uO5DXCBBxZpiEid
	cC/YVQLpmz93zbT3009WTNLR/Ct0GoHu+ar6abGNdHkqobRgV0Y770yq9CSZ7UbdCLs1F6XKaIp
	zWr+vvrcCsWEnoQxut6HK8J7zwN2g9QN3eSLZkG/htquosW3ufHhogErw89fuc+yJ95aE15us4R
	QIzrV1DH5ahqBFWdTVxG0yoL79NKPvFMsKUJWE2e15hr7Fy96iVzumWkoiEF3Xpvb9LMvEQxQdo
	HMiZweumAPxTtNt8P6s3GhfV15dlsn47I3+IztMZjP8Cs4Zh8OakYTGxmAz2zvZq0L9QOJbLstb
	i002GnU+1RIzWf/+DP6s9WFUzV3S/TfkHO6blfWCCcOILE0bR7YryyX4s+kWcSK6hOJj+qHKVJP
	jhar6sX++44g4yih4c6ey7xxITGZFipTyVvbNONdlH7tuKkdQXuyVwCeYoX
X-Received: by 2002:a05:7300:d10a:b0:33b:f062:a674 with SMTP id 5a478bee46e88-34271d8d329mr6641182eec.21.1790519713269;
        Sun, 27 Sep 2026 07:35:13 -0700 (PDT)
Received: from pve-server.rlab ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144b4ae50sm21869436eec.17.2026.09.27.07.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 07:35:12 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <chleroy@kernel.org>,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Marco Elver <elver@google.com>,
	linux-kernel@vger.kernel.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC 09/12] powerpc/pseries: Disable context analysis for the CMM hotplug notifier
Date: Sun, 27 Sep 2026 20:03:50 +0530
Message-Id: <39297f9916c1eb80f4835ac33c7200fd7b5ddaa2.1790517984.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang's context analysis reports:
  cmm.c: error: mutex 'hotplug_mutex' is still held at the end of function [-Werror,-Wthread-safety-analysis]
  cmm.c: error: releasing mutex 'hotplug_mutex' that was not held [-Werror,-Wthread-safety-analysis]

cmm_memory_cb() takes hotplug_mutex on MEM_GOING_OFFLINE and drops it
on a later MEM_OFFLINE or MEM_CANCEL_OFFLINE call.

Add __context_unsafe() annotation for cmm_memory_cb() callback to avoid
the reported build error in order to enable Clang context analysis.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 38e22125b96f..159efe734785 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -470,6 +470,7 @@ static struct notifier_block cmm_reboot_nb = {
  **/
 static int cmm_memory_cb(struct notifier_block *self,
 			unsigned long action, void *arg)
+		__context_unsafe(/* Conditional locking */)
 {
 	switch (action) {
 	case MEM_GOING_OFFLINE:
-- 
2.39.5

