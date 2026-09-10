Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC5B475340
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 12:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789042429; cv=none; b=ZBbHKSLLEpAEWAGlsYQkuHpqTe5yVYfXK5U2orljkoWQs0kruwdNnu+wfGzlGOcnNVRnrToBXoSpdpsqF5JpkYqh7TRjFpFbajtM4EFXRa7h/pPkMvzSjxbOndnADzrPgRoG171VKVImrFuNmBclWJ/+5SLg3SCTAdPOVn2kOnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789042429; c=relaxed/simple;
	bh=7AluFq65iw/e3a/VrEcoJyeiRqVzarE/IVafDI3Q6/k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tvrbzZ7549Kjdtk/ytLfAQPhjBzQoUrtBq/QoZkw+FoiF/H/y/Gjc5JUL/XI86GI1mhQlgJHVEmTxGpXMNk7N43O3UEB0Z3p2Lei58dpEtJAPbRKgBSsMMPNAJ0hk5rmUpwi1/BL96Lo2sNnF8AY5Qc6/2fDphuaRrr3WYBZKSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJXX2exZ; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJXX2exZ"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910c3e6b1so123294585a.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 05:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789042425; x=1789647225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4hqhe5nL5m8h0oyKqgGFnsjXQH8e2lSBQ7XG7ZTQ+wA=;
        b=IJXX2exZrIZPkHnsW62tS6uZP6t2AGS9WazFiux2eMlt55VaIisij1vhS0JKRC0xKn
         JtrZX5H/C3FuP5DaJ2mV/bbF68zuKPPys2FoAc7SyMcmi1C6h48usHNmhy/2p+f+8oJI
         eumLzKEnl7Bo6ovc427tlD8RnQhpCfb8br4wF9uDpPDhea/TabZ4JEmn6BBmivAVIhVc
         8P6ioV67Xy8Fq20mVs3wirbY4Y0D+gQM8Hw8EsgDBJxOeAWpX1X+Uhr5i+XlOGQsO6nD
         oGcMgkqAaNgmEaz3Th23pswCKQ9LsQLVOEOID1Dc8KO62hOKe+hdHSjPcLRMzCK3Y32Q
         61Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789042425; x=1789647225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4hqhe5nL5m8h0oyKqgGFnsjXQH8e2lSBQ7XG7ZTQ+wA=;
        b=JAC9FF3byvnEl6heTg8uMw5nEWJ0DSqAiVhyC+ZeVHVs2Gj6qZkRTBbS320CijT3PN
         bzOFtaIEmWByHQVJ2MNGiMvKA9extAfHmwXbogSXHP0Q2rO3U4KctebqFd+Q9pxU0N8H
         1gf3/WSZWpKO7axI52w1/azl8eIu0thEMKFjxUNB2cIpwKUrqLE/WRU0SY06Flv4oKkc
         qaHKA8rpp9NgrDMpYY5at6ncdaTO1ZXAf1vvln/txfmLf9xJfPXZZ6lFabgGl7KQNnoN
         m+TYBEnKlzhsr3ydUgPj/eLLngZQejEmO6w1z1mlR1/p11eo4ORnV1klL0rgfSD402Hx
         BlOw==
X-Forwarded-Encrypted: i=1; AKwUvBy2fGzjuWaD/FuktRLwPMwVqffakqpTb80F+grASGvhhLUJLWD6OtIPppGgxP8VhAWbwmcBZe6Xf8qpRc8=@vger.kernel.org
X-Gm-Message-State: AFuF++nZiLi7oMtumKvwCPP8N/YL3HitnTWyKKmNLnrGUKnrp7T8gUx2
	85OGweKhxkd/+TuAc4KBaf9IJ6GZpDSeI8on0OdArRgU1m9bhdyNiSff
X-Gm-Gg: AYBFou2M3zB7twIeVlXyCPv3FYGrG3rOmmduXBtMrrRoJ8+6lT0ifS/n0ZV45VBPyyN
	fkjS2DdXb7AGDVLxdvqK/ErfBq1/ud7pj5gAjxXoa4nt7pcqVwa2RQnPcvDBcFPdhnwmbkg8/SW
	3/Rd/GNR668R625/6KFcvy6nOqkZRM2mQbnXYJYyB6MMpfHesiNYaKyexXg27QDC/X7bAgjb9hA
	MNm4lq1/9cpOcR95TtFsAs1ejv4EnzLau7qXfHkQUvtRB0sigxo+xh6LhSbgIKCxpHcSXyPzZZO
	JJXhiI5+ewGLVQmxfsiEqTsZxetxNQFkPu2www8zcdlF9+BEgICNDLqWZj9g5jPBEP2VmrEWher
	e12DPAtIDCRzJLvonZyuU10QZZiZyzdahBtksXtEwMsO21S8jG4rh/Ratu5z5bN3JlsgjZv/3ry
	NHTnbDetIg7WGJBldEgRWe2ef7qoaNBJxR3QNv4zRGw0mPCQ099rcjke1gjSmvXP1YBoSVk1Vu
X-Received: by 2002:a05:620a:608b:b0:939:934b:dd61 with SMTP id af79cd13be357-939d7fa9584mr459351885a.22.1789042424724;
        Thu, 10 Sep 2026 05:13:44 -0700 (PDT)
Received: from adriano.lan ([2803:9810:3d22:1608:a801:3f8c:3321:84a0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fbe31c6sm1691021085a.46.2026.09.10.05.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:13:43 -0700 (PDT)
From: Adriano Cordova <adrianox@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Linas Vepstas <linas@austin.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Adriano Cordova <adrianox@gmail.com>
Subject: [PATCH] PCI: rpaphp: report first slot registration error
Date: Thu, 10 Sep 2026 09:13:30 -0300
Message-ID: <20260910121330.339150-1-adrianox@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rpaphp_drc_add_slot() overwrites retval on every loop iteration, so a
failure to register a slot is lost if a later slot registers
successfully and the function returns success.

Track the first error and return it, while still attempting to register
the remaining slots.

Signed-off-by: Adriano Cordova <adrianox@gmail.com>
---
 drivers/pci/hotplug/rpaphp_core.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 2316de0fd198..af7241d526cf 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -376,6 +376,7 @@ static int rpaphp_drc_add_slot(struct device_node *dn)
 {
 	struct slot *slot;
 	int retval = 0;
+	int first_error = 0;
 	int i;
 	const __be32 *indexes, *names, *types, *power_domains;
 	char *name, *type;
@@ -407,16 +408,18 @@ static int rpaphp_drc_add_slot(struct device_node *dn)
 		if (!retval)
 			retval = rpaphp_register_slot(slot);
 
-		if (retval)
+		if (retval) {
+			if (!first_error)
+				first_error = retval;
 			dealloc_slot_struct(slot);
+		}
 
 		name += strlen(name) + 1;
 		type += strlen(type) + 1;
 	}
-	dbg("%s - Exit: rc[%d]\n", __func__, retval);
+	dbg("%s - Exit: rc[%d]\n", __func__, first_error);
 
-	/* XXX FIXME: reports a failure only if last entry in loop failed */
-	return retval;
+	return first_error;
 }
 
 /**
-- 
2.51.0

