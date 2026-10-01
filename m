Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11C1F37F33D
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 00:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790816266; cv=none; b=FWXByY9INYes/m0qG0tqIbDTt2iuN/vKJOaBJ8m6cd9H+kZtXkjBaomtQ1PsHVU8Rt6MGesygXRABD9t05FVkbfM3e2tNW731rUFzE4CeRzMEoiGdertD4YsBsBrpRbe7j028bIC7+6jfw6KfgLJbKyrtdjOCQLdWbTghVHrKDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790816266; c=relaxed/simple;
	bh=qSGYQSJVxOIJxrVkVYyfN+2LorVimlgQzgDdlovV0bc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=AUq+Z+Fruc6zLuzXxBFXNZVnOu0anK2iLrdw6Bn7kJsbXSxfV8/4g+RmK5lRarQO46WlDY828O5/DiJTYyepdzzBIlxeIJmykGtTivuUMgLETyNH+KKkD3FrOAMGiuuKlu2KKIFguN+I3GBbl0ZPH3J/j/C80fbX6D/xuBw5VLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gvsj0pKP; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--skhawaja.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gvsj0pKP"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2e7d08ab7so8588545ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 17:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790816264; x=1791421064; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/jlCmxwp3o8421DzN1IIl9qClV/YI1XzKtXgp14OcM=;
        b=gvsj0pKPnjMBLO8TvAurYjjwxV49+M4+50OiiQ5bdaTIvLA2EhNcSFmfEBN8sbcu9A
         vOMS4vrey0OepEkOSqNsferxB+ZSycNmfi1s6yyPRCu1HYJTMmlltUICLOC2cKR0bd2V
         1Z6NTzuVNdLYB3H4VwF2Bci2hfDe/o0rxQjVrSs1hxZJLHbfpxD6VfueP0mlYmhFkk8n
         6TeNYP/nYWIxqU/qJ4Om7Lbix9aChtFcb86YdYZtcynzjnpfJdkkLiGWij/G4BP//pqY
         wWEgp9NJm/7bBpV4FPJpPY3RzBZaFZXXNmol5d82AvbpCXrB552LoFLVuNlmuAfJbba4
         u+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790816264; x=1791421064;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/jlCmxwp3o8421DzN1IIl9qClV/YI1XzKtXgp14OcM=;
        b=C+bKmhWewJSFa+w3rN153e/H6gaz+nxr8/0SFbwhijh7G970X2dW2euyfxvrfuPDXm
         SonrHQAlqz/gY46XizZHcIz2jUVEyelVO2ahMQ1XfoojCapM7g/HWkczwi/hP5005oW8
         UcU4lVQ8WpsGYAk6PNpMF5NxhZOUhu85SXTFWecf2GS5RL7OQfzkod7I5quEMSgFOpZ6
         uADgtNAm0TDKWhqe9jvEn/jLjvBQ0l+P2znLbSz6Wf/S0EwFhSVoxlMBmd1W0neyIwR5
         qVbBzvM5GGsf2lKWB1RKIlCadW2G/1uJL3inRH26qkwgEbsCN9/4ZbhyjAPZYQSc0HZF
         Dn1w==
X-Forwarded-Encrypted: i=1; AKwUvBzUJ4+p+b2r+3YZqLt0ZyG24KzZm9NBoxLyaYAkJs0CNRg+WX0CWXKV0jGUuHqxw4vQU94iQvcVN4KcajE=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkraQ4Ay6TGqlJMA6qL2cgX/Og1+7DH9hi17CnJ+ZosYRrLPsV
	ltd2rSizfiSAelXvbsL25VDZFFrDB4pxNpaYjtH0nx+bqGRiASp9Z+dcE8ckWGH8vV0I5ks7fUq
	2SEyhieDwljD/7Q==
X-Received: from plar13.prod.google.com ([2002:a17:902:c7cd:b0:2e2:d259:863])
 (user=skhawaja job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:f603:b0:2df:8e69:1d5a with SMTP id d9443c01a7336-2e2e49fe3b2mr22721995ad.21.1790816262839;
 Wed, 30 Sep 2026 17:57:42 -0700 (PDT)
Date: Thu,  1 Oct 2026 00:57:31 +0000
In-Reply-To: <20261001005734.1033516-1-skhawaja@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001005734.1033516-1-skhawaja@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001005734.1033516-4-skhawaja@google.com>
Subject: [RFC PATCH 3/6] iommufd: Set liveupdate file handler level
From: Samiullah Khawaja <skhawaja@google.com>
To: Pasha Tatashin <pasha.tatashin@soleen.com>, Mike Rapoport <rppt@kernel.org>, 
	Pratyush Yadav <pratyush@kernel.org>, Alexander Graf <graf@amazon.com>
Cc: Samiullah Khawaja <skhawaja@google.com>, David Matlack <dmatlack@google.com>, tarunsahu@google.com, 
	open list <linux-kernel@vger.kernel.org>, 
	"open list:KEXEC HANDOVER (KHO)" <kexec@lists.infradead.org>, 
	"open list:KEXEC HANDOVER (KHO)" <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"

Set level of iommufd preservation file handler to
LIVEUPDATE_LEVEL_MAPPER.

Signed-off-by: Samiullah Khawaja <skhawaja@google.com>
---
 drivers/iommu/iommufd/liveupdate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/iommufd/liveupdate.c b/drivers/iommu/iommufd/liveupdate.c
index 423369e3a8af..2f2ae1a52be4 100644
--- a/drivers/iommu/iommufd/liveupdate.c
+++ b/drivers/iommu/iommufd/liveupdate.c
@@ -351,6 +351,7 @@ static struct liveupdate_file_ops iommufd_ser_file_ops = {
 static struct liveupdate_file_handler iommufd_ser_handler = {
 	.compatible = IOMMUFD_LUO_COMPATIBLE,
 	.ops = &iommufd_ser_file_ops,
+	.level = LIVEUPDATE_LEVEL_MAPPER,
 };
 
 int iommufd_liveupdate_register(void)
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

