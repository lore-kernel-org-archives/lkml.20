Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830835;
	b=L1M/ApCqSU7KPfvh5M+JIy2mCXbQREv2fKqwmwk9Xx8UHMZ7gxa0oXYXKaYkHhr/o7iL
	 dc/m9UZi6FMCfMmmXOE+XeKcdnGfJ1Yn4jYHJCwVkuKIwzsJ5Cq/OKyVIPD03ic1HGqO/
	 Kl3DcEVVvZtzGa0mxCXhIWDvvDF2Y/xyukkLDjQRunypPTZltjoJ8AlENFfMHW1mU5kcE
	 XAO/Egwb4dZJA6lPTFh4JXXuPcrTVHWVHmSZz7Ti02p/u87C3LI7aH5t2VFXvbygcxxOS
	 Hj/E2+hSrE8dcFHbnD+3THVMrpgPIYSRHHSFmsrYBRL/4uS8T0DiEUSdURE9Z/S2FMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830835;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
	b=2bXNSrcx8qE/ma0vSylRENardgGFBjats9sS1xoDqGpKmLhudHMTFyDnP/l60NKFM79o
	 aDxlNJcA3bQlsHWSNFfJNWQdCWP8YzILSDAtrXScR9lh2zCYjbvE+TxVjsIdnJtoMEy6v
	 C1nZbOz007y77dH4Vrf2igA174HNJC9TxzphVvrOlMc2oeLYXQg0JVZ/MtAvUdZXL3fPE
	 Bd++aEdtxenMwFtgeJ/Lxa1TjF5fqerTCUj+tlAbxgfdABG1pAW7kNwnssUMrCrnfg1yh
	 QgkaHmVhnl4J525pr9S+caPU7I23+0CFlKvWYln8AOyvLP7XJ8MHnBUEDLa2o1bM4ZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykvNzgEi;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAA4606A331
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 12:07:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFAA4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ykvNzgEi
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1b3b4bcbfc9so3730896c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:07:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830834; x=1795435634; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
        b=ykvNzgEiJ5q0JKeVEZZqNRc0lE639nRlALND3/BRGCL8lxABCc4zBZh+ojT1Bpe3QX
         0lsyl5sjFVvlwA2EYhY+Se+DV6rOPPPG1uM22uGfBZ6rWneUcgRDp9zjlWzI4PQD3qXf
         VRO71udgkwhGaBA7fk7X1yuZW5/Xa0fM0ZjAZkcRC9c1PBRaYiCceAvsrbwbOHTh5NRj
         NrljSQDO/I2RoX/oUPm6GiGrkYC1cs7IvbgB4gYXDAcsO/hqqrJ9Muq+tI1WvjJXAaJy
         J+x+iE7jxVUultENc2WHPjfooAAmcCUATIKabY4ZQCHxnPSZOqVx/u/luhUdWwCHLFCr
         yHrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830834; x=1795435634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YTgCfMhAtura+nyFnS5QD3/WgVT4AUiTNomC6btACpw=;
        b=Unk7KWeX/F7s7aT1vdy8MKE8O3+FMt7wCL0ksSRiDcMw4/JOYVYQakdNt3posdGMaq
         R3VeG8+AkqmnuHXpQkxxngUXxj2oyUXdT5qPAc/KoTtYq3EuKz4u+5MHgXzjdGpVxJgO
         kAURxidAm8kgG0BSzQ36M7BemMfHNkd/02lQffPQ+FxR/9Ymy/+4n5A8ho0oWgMBfsFT
         NtsUeGXFgs60yHVqVN5KhXAjRIgLhFAR6KGcAfFaQgaquKuCQZCuVe9ss21bO5hsOkF7
         2XthvypjoPQYvgraSjA3WXnI1YjjSZIKwl3DiiH+BgocORIl+nPhQDSiTih/PA/qiPd9
         du8w==
X-Forwarded-Encrypted: i=1; AL+hErHDog4CUCVgsyuh1nO+UP6YBYr1XvYNrMMoqUsMfgcCFWEK/5Mv91d/Rvr1SKrmn3j4T1JMm49PDoc3umE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fIZmwiT/dG7W6qNxNTxSRse6nsNYl9Ks/jjN39NICLVe9ZXVc
	2N5P57CEe75na7caFXl3/+rbz9y8qg9zhAYsCZ54vPGabii7vimgfHLG
X-Gm-Gg: AYBFou1NvWSRtY8xK6p2wxusJrsFSgpLJCO2yD3BGy77yXcns2/IBF8f6D23+jxmaiI
	wdHRkrjoov7wde9bPIskaQFnKairvRIb6lK4DBilxhJ/OXvy9VhgWmTr/qZbdZRR6/z77r4qU2z
	FhdaMbRsX0tCb+suMyenTP9N8tp3tFRQAYSNeW7b0dzEyAFSzQQ3xXcC3UQ8EXN46/yZo0X3SFT
	9z4PkTCPcwZKNScXZ49FMLCiMch3Sq9AqZZawbyS5uDrKRSKU0xwhfIPKsYeEYxChXDM4MgcuEg
	GPc2P4muQH9340JBizJ98+lIcaV7A6dCGYy5f92qVDPzQwypnzbsbVmoeKsu+I2lHBwRpY+qFJI
	ylE2QCLID//JjMCZH8bU8cP6FmveAivCr76uAvrL+TTYVbQEP9asADymNLbYPx3fM7JXmsrypcP
	ty4h3AmyWk4bZMVPuXoE2F9IUJxMxtig2BD27mOLkgFp6uktZny9FpxP+vemOXOXVVx0FEjf2DY
	O86SqIRjUwkvwfqMHP8jo8KqZimpWxdgydUsQdYIq0O1vzxkZMl4yUaBOQrRIwNz7B8BP2ZmZOg
	8yFT2/LPCLSyT9vyrS9cNUUYwHvxh92+7GK5McuaeLoUoLaO1j7QA38wi6HdYBscq7hhlbRyCA=
	=
X-Received: by 2002:a05:7022:926:b0:1b5:2bcb:8691 with SMTP id a92af1059eb24-1b52bcb86d6mr4763177c88.42.1794830833599;
        Mon, 16 Nov 2026 04:07:13 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:13 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 2/3] media: atomisp: Remove unused get_sp_code_addr()
Date: Mon, 16 Nov 2026 12:06:57 +0000
Message-ID: <20261116120703.6681-2-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
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

get_sp_code_addr() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h     | 1 -
 .../staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c    | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
index 3cd69284f..e00308818 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/interface/ia_css_spctrl.h
@@ -26,7 +26,6 @@ typedef struct {
 } ia_css_spctrl_cfg;
 
 /* Get the code addr in DDR of SP */
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id);
 
 /* ! Load firmware on to specfied SP
 */
diff --git a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
index 78f00f07b..49b986351 100644
--- a/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
+++ b/drivers/staging/media/atomisp/pci/runtime/spctrl/src/spctrl.c
@@ -104,11 +104,6 @@ void sh_css_spctrl_reload_fw(sp_ID_t sp_id)
 	spctrl_loaded[sp_id] = true;
 }
 
-ia_css_ptr get_sp_code_addr(sp_ID_t  sp_id)
-{
-	return spctrl_cofig_info[sp_id].code_addr;
-}
-
 int ia_css_spctrl_unload_fw(sp_ID_t sp_id)
 {
 	if ((sp_id >= N_SP_ID) || ((sp_id < N_SP_ID) && (!spctrl_loaded[sp_id])))
-- 
2.43.0

