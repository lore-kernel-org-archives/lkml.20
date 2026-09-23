Received: from mail-qv2-f43.google.com (mail-qv2-f43.google.com [74.125.230.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBBD2F9DA1
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181352; cv=none; b=HxlK8tHIRJC9bgaZWJrxXFg0xa/TaZcK6g5GjKQwQhPUHrKsLZMrhUy1TR8xGTOlGyF1Ia4Xe2e0RQa1BDlwHu45NRVRdkczHhLeEfhfnvrbhd/V5sz0tf7qmP+X+QSkoUI6t0u7SCSA1+6UthEbynKZTAW7LfyE0MNQTgowNV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181352; c=relaxed/simple;
	bh=u5gxEPDdMGngagwxyI1X/73gU3KsM7oagGaXMiOMRnU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GI4BZ0BuRfq4uD4cK6zdlX/fj+kJz0AYVbqqsJIZOWLRHWQxGLiiKGCOG2kn17JvLhaoyh/oxTY9+G6Nttu4WMY2UvFcPmefNRMN6jPWDzsAqqmb3sl72VnQnclg/xVrriEJw2BujEGok1NkStMeDgcDSzwnxIEOjcR3vKaGUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HePB/U5H; arc=none smtp.client-ip=74.125.230.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HePB/U5H"
Received: by mail-qv2-f43.google.com with SMTP id 6a1803df08f44-91058dd77a2so10686266d6.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181339; x=1790786139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b5p40yKNXmiRzyWRdpfFOTFd2Qmr/Bgk6kI4JtztrGo=;
        b=HePB/U5HoauN6XWUCvBoFV79vKwFxYmHiIHEDnqvmF/37qhXM/z7BJXcVW9vsd3neK
         5DNEIIEFdacunUW+DaoZNVPIXGN9VifwhqBtmug6mqC/1b9rVfRlmgaNYqB7xqjyLis9
         G1tRpEM6RmmnUn4uPnb+VwfJ9DnpMbIK9vYxP10ZstTRAN5PKiBUCHEMx1uUmS19p1xm
         OOyTH8rP9xRXPmTDPqCj1WZMqhFsChn7fAP/ik5NFKCRUYuRJvUutTHXXTiFZe8bk0pz
         VIt5abi+MzEGmm/dp8Hyr3exXJMnC6FKrZwl6OWN7ax3SeoMobJ4FxYj50c2ue63T2h8
         SPRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181339; x=1790786139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b5p40yKNXmiRzyWRdpfFOTFd2Qmr/Bgk6kI4JtztrGo=;
        b=n2+j8vHWVJMdj3iVNoGQTB6fEkpgzW2pIxlI0eqWjgIhAHo/0QcEz9VcFrlMFAR6m0
         sMsl8IdhHCdI4/roMZtBF/CrYPxAQY3DQAkHrCoGXjH/3+2RbbeoLA1Dx2S5Fb7oCnEP
         qpF1q79oaKzszxLdbN1nOZdx5JjxaqljGliTEUlyrhSorTf18XrVbZm4hDqVk9jryHIG
         eMi9OdnPY+r1mhb6Bf2ByPslGazP0FIrTMqX2AMfpRgfoq2RFA3fIrDrleC4VfugwVA4
         1NgkBNY+OUqZX1vkbwbSmgF9Qsb12yR4IM0X65PLEEgZp8uom9iZ2gTRrojmIG0VFrt3
         FHsg==
X-Forwarded-Encrypted: i=1; AKwUvBy7yQf03U28U9T8kwRufQqkxGhun2KCZco7ILxw7n/JWMSS0P/pGIOtgX+MriR7z66ik/3LCcNePGxTBPk=@vger.kernel.org
X-Gm-Message-State: AFuF++lMLgK7ncnMXnEvUOrIZfZhc96dquLNFYvxnXYMVi3R3Rs9nfjv
	6unyBe8+ognyco9TTWtlA56ul0OhVRxVKh0H5D5t045auxW+yyITtNvH
X-Gm-Gg: AYBFou2R6FK0+bgqe/cC4futQilFwv7p6Ln2KmyWw0AwEjrEDdzydhVA5mFI3w8n/jM
	0ZdWG2VRtm4jQSwm17Os+7NVRbom3Nq7c86/NeEVJ+pdt1eolzs7qymc3mS/Id0XdDATIrvEPb+
	gwYKrCIC4i8tzDkLH1iv3GhquFfRtgiiskr6yW8DBO611ZTTCVVVPPL2lZ6tpyBgaOk3+jxZB7y
	xEJAJhrzx831//YRJTmDaIxHx4rJuq/YJXprHGkYaZKHchRh1poa/lLe41gw59Yk13plVysklIh
	Jw0t1/u1Lr6u1J1ry7PVJKa8TvZ3ds6xhjilZmmO3U3fOQoa4Eh6oThzv/bDNgsixN9pST2itl2
	UEJMzKsDqUMcJPgIHFJ40Srgbdh3ZQw+8ScGZa7S2JwqtfKEICFhEZ/pkoLLqCKuSHZ1vCYwB7O
	ZbZWa5+pHAmgvJtkMT279uGov4VtyxcXTVUBJH998PsM9TgOs3Su5VNSYkqJomTyh3ThqTpKYhd
	9jiWncTQLszKiKHgfsqYg==
X-Received: by 2002:a05:622a:1cc9:b0:52d:28f8:578c with SMTP id d75a77b69052e-532eada4922mr49461241cf.31.1790181339344;
        Wed, 23 Sep 2026 09:35:39 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532eb210527sm23066351cf.12.2026.09.23.09.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:35:39 -0700 (PDT)
From: Yuho Choi <oss.patchbox@gmail.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Nicolas Pitre <nico@fluxnic.net>,
	linux-arm-kernel@lists.infradead.org,
	soc@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <oss.patchbox@gmail.com>
Subject: [PATCH v1] bus: arm-cci: Drop CPU node reference in cci_ace_init_ports()
Date: Wed, 23 Sep 2026 12:35:15 -0400
Message-ID: <20260923163536.596107-1-oss.patchbox@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cci_ace_init_ports() looks up each possible CPU's node with
of_get_cpu_node(), which returns the node with its reference count
raised, but never releases it: neither when the CPU has no ACE port nor
after the port has been recorded.  Before the commit below the loop used
for_each_child_of_node(), which manages the references itself.

The node is only needed for the port lookup, so drop the reference right
after __cci_ace_get_port().

Fixes: 78b4d6e0fd26 ("drivers/bus: arm-cci: avoid parsing DT for cpu device nodes")
Signed-off-by: Yuho Choi <oss.patchbox@gmail.com>
---
Found by code review; compile-tested only (multi_v7_defconfig, W=1).

 drivers/bus/arm-cci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bus/arm-cci.c b/drivers/bus/arm-cci.c
index 7f2baf0571286..076ac8e06bd01 100644
--- a/drivers/bus/arm-cci.c
+++ b/drivers/bus/arm-cci.c
@@ -199,6 +199,7 @@ static void cci_ace_init_ports(void)
 			continue;
 
 		port = __cci_ace_get_port(cpun, ACE_PORT);
+		of_node_put(cpun);
 		if (port < 0)
 			continue;
 

base-commit: f0100363d8c374bd8e9ea7c9ba02744f0b802ca4
-- 
2.43.0

