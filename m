Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715E450409
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 09:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788774912; cv=none; b=SsJBYXXM99FCDIX5WVzoOKaWJ4uKsJum3FpBS9K28b/nyGf6AywvEDf1yE9JscSQFi0Ral5QjMiOw4zqmPTVqMlx1iRKpJ4Lsr4w0yjwQY4FAMf5aXOu9cgFReTbL9jCB4WCJGt7CSDc75ycKsUaCEnbmaZzGHFSF8QsRmdjCQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788774912; c=relaxed/simple;
	bh=i9d4Vftsku4C4hRtse/HfWlFXzHBBI2yaNFsrVGvuRc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8hPL6joPS756nB0UAfXo+BVGm5avyOrT0YVaMgja4A9h9KuZOfaI7Ud7tlvlfz7ErhpNj2/GdsNKBJGL+Y8xjadAbixY9sCHYJRfempq6jfO9JkDoU4jW0BpntkiA9bkiaxurbzScVC1P6AA54lw0WGOoY19Igp/8FLWe/bEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rYb/6dud; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rYb/6dud"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2d71ae3455aso49853025ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 02:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788774909; x=1789379709; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2PD03fl7XZ6y143t1i1zJonTPm8hoG59RG3FMhqUEKQ=;
        b=rYb/6dudsrjrCPnaXEiTRGPURgOsyipjYS8AN4udPKKPeit3KmvHYceI71Jvt+YNHR
         t9xMDNoEZgqz0TvN6PLNz5D9HYAobf/K2ftJr6OIIekQkQM4d0aFl6JXXW4e1wd2xRc4
         0oTHWIHp1e1CRRgkZwvwwFSN/28wIu0+krLDvqDjJRh8u00WdOdprw24xHPiBJ2WuNnf
         V3/HXpkUGKcJYt0qzzFjjr2slUihOaxFydNHBkqpBtCPXe3GrLvb040EE05GHdAaXJhn
         tNb1r6CYPNsDNGImbnQt8C2NyJsFCdXM6ckTgwRu55/F0n8chbnUN6eybm2/h28YDiUD
         a4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788774909; x=1789379709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2PD03fl7XZ6y143t1i1zJonTPm8hoG59RG3FMhqUEKQ=;
        b=EWaODa5aY+chOuTY/+g0U0ZOZqX8tf221k9aXdAPgcnKWjW60AKhDEhBRxUuzpiGkZ
         tyTO7DlA/bwwRv+2agzIyUUtCKE1h+Z6MTETIkwi5S87sq++ch3yALlyKJr08qT0aB0g
         kFfNzg0Y3QKCPxOOChydJQCgAqmKkyYMHGupExIYIdADeNx/FWejiCZ2PLoCdYRJWkd0
         rPXcor3PkDAPMnTM0ay50OKKOl9kkl+q/e+LO2e0Jn8G5eMhwhrYsO1ojFY396gnN4Af
         61RMVZ6oYa6FIhr4AL1i49Oxg/mMPQPiVSMePmeQWmMIU3kYC4jKoS5qTCzanCgCRR1O
         m6Eg==
X-Forwarded-Encrypted: i=1; AKwUvBxq2miUD/cfAsavUMN244TB7MEKw4zWXXTGwvKIluCUjncrtVA2LoT8Gqlno9Cyexf4WBE+qFBiMRKCwvA=@vger.kernel.org
X-Gm-Message-State: AFuF++n+EQS1UJpk6RVqMfwX6/qdUQIdQO5zp939kiG0Zx2JklLee0U2
	+E70kS241ZRDNPC+B453LLBsrmWS2Ce8yqdRBfQ5InUxNDgySAGeWchf
X-Gm-Gg: AYBFou0bMiZLd8x3G7fIsuJoL8x+tOV83XQwnpvGcp0+ep4bJZeMmNFtYe3uZxcH/Mc
	9a2j1Xy0smd2ZRriAcJolDwICN0YG836Wy0/4MQ9SloI/LvcAQsdgq8Gux2eq6WeBd3+NYAF1ec
	azC/unRsoXCm4wnvTGN8D4hM4Jh3D6ZgW+AKZsyrqc+569wnj4497EbEJDyZ4sWIs6Jljgcwvvt
	4+7fKeWjMG0BGEjJVQi4Q70m1XRowYu3QUKDKYomKgFYVjatCnM0ZlQ2bVpr4fqi9By+dHV0tvI
	PVHlfMPfhs7tPLl2uVb2ToWZMIFjq2JPkV3ckRN0peVPPlf5VFc4s4evIUMOl93x6PWhdPWJlf6
	5HrQRGElTvqAtrFLQa8C9p0at4lbIT5gcgECRGPsMGRGbKWrxoZ6+7Uv6S1ufFJvjiZcjawZHUA
	myAtEtCJMSC6siaP+nRcOqfsIXWG4kxwOTOoEhDBZ+z2MaX7lLLsVP2D4koQjpjAtoA3ru0hAHR
	c5XKLBScmS8nSY=
X-Received: by 2002:a17:90b:3803:b0:395:7fff:a08f with SMTP id 98e67ed59e1d1-39b25eef036mr31016094a91.0.1788774903375;
        Mon, 07 Sep 2026 02:55:03 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432424d27asm34831030c88.2.2026.09.07.02.54.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 02:55:03 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	intel-wired-lan@lists.osuosl.org
Cc: netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH iwl-next v2 2/4] ice: fix typos in comments
Date: Mon,  7 Sep 2026 15:24:44 +0530
Message-ID: <20260907095446.27290-3-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260907095446.27290-1-hemanth.selam@gmail.com>
References: <20260907095446.27290-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, found with scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt. Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---

Notes:
    v2: designate the patch to iwl-next and use a subject prefix naming the
    component, as maintainer-netdev.rst asks; v1 went out with a bare
    [PATCH] and a "net:" prefix. Rebased onto iwl-next, diff unchanged.
    
    v1: https://lore.kernel.org/all/20260907064528.6602-1-hemanth.selam@gmail.com/

 drivers/net/ethernet/intel/ice/ice.h       | 2 +-
 drivers/net/ethernet/intel/ice/ice_main.c  | 2 +-
 drivers/net/ethernet/intel/ice/ice_sriov.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/intel/ice/ice.h b/drivers/net/ethernet/intel/ice/ice.h
index db3c7015c56c..e5f940d324dc 100644
--- a/drivers/net/ethernet/intel/ice/ice.h
+++ b/drivers/net/ethernet/intel/ice/ice.h
@@ -1105,7 +1105,7 @@ extern const struct xdp_metadata_ops ice_xdp_md_ops;
  * ice_is_dual - Check if given config is multi-NAC
  * @hw: pointer to HW structure
  *
- * Return: true if the device is running in mutli-NAC (Network
+ * Return: true if the device is running in multi-NAC (Network
  * Acceleration Complex) configuration variant, false otherwise
  * (always false for non-E825 devices).
  */
diff --git a/drivers/net/ethernet/intel/ice/ice_main.c b/drivers/net/ethernet/intel/ice/ice_main.c
index d88835482d3a..fe47ec0ba809 100644
--- a/drivers/net/ethernet/intel/ice/ice_main.c
+++ b/drivers/net/ethernet/intel/ice/ice_main.c
@@ -6202,7 +6202,7 @@ ice_fdb_del(struct ndmsg *ndm, __always_unused struct nlattr *tb[],
  *
  * Features that need fixing:
  *	Cannot simultaneously enable CTAG and STAG stripping and/or insertion.
- *	These are mutually exlusive as the VSI context cannot support multiple
+ *	These are mutually exclusive as the VSI context cannot support multiple
  *	VLAN ethertypes simultaneously for stripping and/or insertion. If this
  *	is not done, then default to clearing the requested STAG offload
  *	settings.
diff --git a/drivers/net/ethernet/intel/ice/ice_sriov.c b/drivers/net/ethernet/intel/ice/ice_sriov.c
index e04de0215596..9ef1aa66fa2b 100644
--- a/drivers/net/ethernet/intel/ice/ice_sriov.c
+++ b/drivers/net/ethernet/intel/ice/ice_sriov.c
@@ -924,7 +924,7 @@ static void ice_sriov_remap_vectors(struct ice_pf *pf, u16 restricted_id)
  * is correct etc. Then disable old mapping (MSI-X and queues registers), change
  * MSI-X and queues, rebuild VSI and enable new mapping.
  *
- * If it is possible (driver not binded to VF) try to remap also other VFs to
+ * If it is possible (driver not bound to VF) try to remap also other VFs to
  * linearize irqs register usage.
  */
 int ice_sriov_set_msix_vec_count(struct pci_dev *vf_dev, int msix_vec_count)
