Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37FBC38B7D2
	for <linux-kernel@vger.kernel.org>; Wed,  9 Sep 2026 17:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788975231; cv=none; b=OYXH8C5gNG00FRwOMVbRYZRy5LuQP3L9h8agtZhy8yHS3X6zFZmR0njnFTj5niP0dVEIXZpErqXgytrqQ5DGAzAt50TyEMxLUrwHx7T3r5JHBLTA9cf5O0+OHAcvCSZt1r5qP2EtdLKPpaN40lCIBI02LnONhbsEDq3JpIgB5Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788975231; c=relaxed/simple;
	bh=9u+KwAb1TPcFPVuhKhGmv1E5ZeXisuF3FsqOK0m16pg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ie4UVXhYVEv+rYnEf6ogU8jNmGd93wmFyWsd4KJZAMokYg6qaGtqgZ8usg0i5XRCWbkA/h9Ddm8SK9JrZK3bERES9BnR7HJ49RiWn0pk9xxnuTL/Jw2hN1+Cv9EN0NBBnych11Kp6Z8MVpbErE1h62ItcBi9jzwzvBD6T8OmiC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BI+FnjZm; arc=none smtp.client-ip=209.85.161.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BI+FnjZm"
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6b1b9c3af5cso4992498eaf.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Sep 2026 10:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788975229; x=1789580029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aRf99SMBmtl+VTLk0zBUOwJpiJLfRXga4UGT3MjWHTQ=;
        b=BI+FnjZmDneBYigR25MjdRJqjT82N3DMxlvSRxnLleKRhrNsFzyiWtVUUkkBOqlDMT
         atT1IM8X0NM8qhaagZV2Ogre+pM3MxzJuYxEd2a0NFRvyP2mhYOECMIBvuXmImqskmfx
         5yvQ54c1GYeK5i+6gmL7Gz4CRBJeRlQOmMjQOHdICW4Be7p4VdEaHZfRgl2fJXDMhLRL
         4OHQdL5y15iB25XvBVW23XVgg154eww9vmpkujop7JMV2hAIarJum4Vhn/nENodhEYBq
         T/FKoiLTrsk2Pr4fxJ2K9gT9VCpLAubC20KETyRqW24lt+/GIsDqjK4JH7qYObTAsE1B
         WV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788975229; x=1789580029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aRf99SMBmtl+VTLk0zBUOwJpiJLfRXga4UGT3MjWHTQ=;
        b=Aj6PSjR+NppxL78mnQ1T/JZBV9Pmjmuk9l//t2hnjPGEKVTsAWtfyjEwtZDDcT4/JC
         tr8tDztLVvJLPOU6h9eyfHPXMrl7iw6ZZVbUm4HyEF0vR5JgjV48hO40gtTk4xC3aJoB
         uxBMUCE9hdtbIEmZLSB/BSjoN1vYB5xP8XwhxElwIYqm5/JV5UGwQS6kKTeRKbTiZ+hH
         9Gq6R1/QM0m20CpzugWhOIy43bk4+QO3BaePaqESg4HaGALtpTq34pkFdj9lZqV0dGFh
         hS1e4lmkkjMYKi6Nx1zDjhtGy21YbK8Cj6qwC9mjOxLADZNGVHeZD7yewsTWSkApoEe9
         KXtw==
X-Forwarded-Encrypted: i=1; AKwUvBwet4q+eOgsybQBfBnUy5AKoQAKzyk3zfX6nCNNVndDTzZeeoKEjGNiEco6mk3+ZGifP2Zu1ef/XjUgH3M=@vger.kernel.org
X-Gm-Message-State: AFuF++nWETKmlShTTNAr7k1ggUM6IduOYjOQX+hbbnud11/cDNaGeHKl
	hUF6sUW1+LMAZhZw+u/vasghWiP9CtGiFQ6mewu/PxuLRMpljMELl2Os
X-Gm-Gg: AYBFou0Q1/2c0ilwdeVGFNNR8iH1/GVS3fKqCFPidtWKhgc2XrvwHEBkXH8AcDbYiSZ
	l2jYgxnR2wU5KOCT08MeywzHD3Vi5UN50uoMi3u+ThgF/yIDmx0FlEeciQEeP1lK0Ng8MbMiN/d
	ocZoAnFxB4r2LDuofdZ76vjfUCDigI1X1AO/P9DdMiTD96voOJw5RtQyCuKDMXfKOBxrvoKxwjH
	rqhHPqUJZ7RUu7hxClazLl5krVNLon5hEmelPobopMvfgzPEhpvTWu6Z0fQ4nYOZoAJf0pppZA+
	i70OJ4/1VsBZoxxb2uhCcHIiPJTOelbW7V1apgr0WAFG7LdBJs3CH3LxMvTbn7SHwUoAS0NH7X5
	Pf0rRghdehTT3wysNpTHMYzaETHy381pJ7yAb8nx3JOILMOsxnqRNqQX8nvsExRQd+aTbzQrkm7
	yeEN6HC+f9qsnaUtLM/SFmbefab3uROcEEEZHUSjiTN0QbdOGP27iMWbcucUEFWNDwZzUH7kKBP
	B+VHp4GZj744ZNTsdmSNZLFQ0LKOyf9rX05r997NAQDayIzysu6pzDDS2zr1TuaPBM=
X-Received: by 2002:a05:6820:1888:b0:6b7:46fc:1cb with SMTP id 006d021491bc7-6b746fc0236mr17849545eaf.42.1788975228770;
        Wed, 09 Sep 2026 10:33:48 -0700 (PDT)
Received: from memorizer.fox-kitefin.ts.net (47-163-111-11.bng01.bytw.tx.frontiernet.net. [47.163.111.11])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6bac11fc29bsm10396408eaf.6.2026.09.09.10.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 10:33:47 -0700 (PDT)
From: Yudi Yang <2000jedi@gmail.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Michael Bringmann <mwb@linux.vnet.ibm.com>,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Yudi Yang <2000jedi@gmail.com>
Subject: [PATCH] PCI: rpaphp: Fix stack overflows when constructing DRC names
Date: Wed,  9 Sep 2026 12:33:00 -0500
Message-ID: <20260909173300.1144301-1-2000jedi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The drc-name-prefix field of ibm,drc-info is supplied by firmware and
is not limited to fit within MAX_DRC_NAME_LEN. Using sprintf() to append
a suffix can therefore overflow the stack buffers used for DRC names.
Use snprintf() and reject names that would be truncated.

Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
Cc: stable@vger.kernel.org
Signed-off-by: Yudi Yang <2000jedi@gmail.com>
---
 drivers/pci/hotplug/rpaphp_core.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 2316de0fd198..39109a50fee6 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -252,8 +252,11 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 		/* Found it */
 		if (my_index >= drc.drc_index_start && my_index <= drc.last_drc_index) {
 			int index = my_index - drc.drc_index_start;
-			sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
-				drc.drc_name_suffix_start + index);
+
+			if (snprintf(cell_drc_name, sizeof(cell_drc_name), "%s%u",
+				     drc.drc_name_prefix,
+				     drc.drc_name_suffix_start + index) >= sizeof(cell_drc_name))
+				return -EINVAL;
 			break;
 		}
 	}
@@ -355,7 +358,9 @@ static int rpaphp_drc_info_add_slot(struct device_node *dn)
 	if (!is_php_type(drc.drc_type))
 		return 0;
 
-	sprintf(drc_name, "%s%d", drc.drc_name_prefix, drc.drc_name_suffix_start);
+	if (snprintf(drc_name, sizeof(drc_name), "%s%u", drc.drc_name_prefix,
+		     drc.drc_name_suffix_start) >= sizeof(drc_name))
+		return -EINVAL;
 
 	slot = alloc_slot_struct(dn, drc.drc_index_start, drc_name, drc.drc_power_domain);
 	if (!slot)
-- 
2.43.0

