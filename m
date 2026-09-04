Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1832403E9D
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788524696; cv=none; b=sDeumUARJyz2dgRlB6xhGEwz7PIgGrwm3+SNxCK9mYQIFJGT0alMzZqCiuNTrmsuAQwS0yIK1HrZBf4h4m6zoT7QwqSflBIXlPM/b6VTVGxfmcqmzMMMb7LyMnB0dDH3Pciy1NOkmr622qXflH44J/qL4fRFvM8FsaRsVkwGVhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788524696; c=relaxed/simple;
	bh=f8aGNyC4hhuimPFgaao0DU0lrWnNx6TAWDdKIId6TYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lnotAsXm4XNGoLktzd1NeQ6x7hyZpJaChLbEvmdl+Sh+EKYYi+Ph7JexXgxh6HLELWj894JfNdheGNXRifZ7MqigPrPsSJLQ+QE0rh/7h6wXLXPB6cyRbaE6YRKCkWnTOdb9PEaE6JAViuVritpC0jg3fVtLYV/Hii380z48oHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kb8axn1E; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kb8axn1E"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so839362a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788524694; x=1789129494; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dSrYA1DkzHEof4sMwyJ4ZJLRu5Ytzn/ZSPLCLv7l2KM=;
        b=kb8axn1EvPUUrO9QNfTNhUVrcoOrzabbK5BFMG1+7vrtxcIr8lezWYx1jKT/DNDt5g
         H7+HSMrX5tsVyX1QuN/EsDXn8hEsLXUFwi+Uiq6KFPGabIgJZe3Yob780t+3gAd+ZcBG
         fJZFfV1A+7ltjMDQ1DXwbZ5ReIk3fv4c7EPWrG4V5tD7zGtcCqiF7lU/1fPBjViltvJ7
         HbQ5E1RuvRBGvNcF7yQzPFptB5yKjSEsIsDNzC/nA7Jj57vOlhyKYUY+MmhxVa0Ywsxc
         j63vlKdzhkl9EcHU6/gyHt6R/bUwnzq+MOliycD64WxBY3Z2lXO7yqyS+eibUpDzP6R5
         D30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788524694; x=1789129494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dSrYA1DkzHEof4sMwyJ4ZJLRu5Ytzn/ZSPLCLv7l2KM=;
        b=euR+t5DXyaPsmFcVY6/bwxEgi+WkI2lgbJY8R9zbor0DvfhG86+Gv6ZIZyj6Jp0YQY
         39UiH89m1qxFH6IDk8/8kQnqzfmnkM5QuOunbYGwYUsnP8UXeFcVRZoB71poDD2NiIMh
         zx5B15uh1eWkDQF/YFdQdkhXsVyOqI11BCtQ7J3qrLi7THd7vRBjOmwPrpbn1UU2MTXn
         O1HtDl1wi5b6hstZFXHRDh6bK1aLKijLBjAK4dlnKzE8f2z6tCELzRpZoOXgEb8odxI/
         qgRSWVA+1eJSXChtuxeDDO978NWESZWHLvrPh/HVLB5RngE6J5ZbWhldrZDNpp8qtB1L
         0oOg==
X-Gm-Message-State: AFuF++nCWLE7jiv0pDxvVLwzTR8LlQq06s3YjV2whKR5ciROvvFMoAe6
	7TjbCPEh1xWFDV2dZSb/o2+l9qE0t0tvCzVQcj0yCPejJIhYa7pI1QaZ
X-Gm-Gg: AYBFou177xk6McD4AnrOc83Z/O5PFV2rsmipC0lyIoorlRo8YS7K54/OVkkkZYZE4GX
	iHVr7na5E6Y7QDWGq1sFue96YIcyhSQgUr2LVZ57lbL+4yQ+IclQ/KAzN1eXBIB/bcLIVa8/Bdn
	35sSkJu7VragCxa4lfjMAJVOTtQqltgtjmVed9p2tNLqyunEV4pM1S7ji6rYNrarfRb86RQWuYz
	H0+ezJBFUX2dBEGAciqw57FWLz5x99KwEZ8YTGbN9XBhD8VZvlMvquNdHcj7qQFZLLI8qQ2+6Dn
	zxWVhELdsdSpfwvzjm9+endqtmOG9AnwTLrib/k0OsQnJrS4WI3KzxbhEBmYPuTjHIts/aKJIP9
	j/BwFig4icrfKexf/A2NeTeS0nLFbFvHpLlUT1tkkTfABIkC1/OWwKntTje/XYGPtcLE5iRc74m
	BP9Gkt3c0lUBwO6486Jq54GM46hv2/asEEYugXlK4ubLqdbxtDmfUFNuIvpjQwZhbQSKu66qG10
	5CjFgkUW0sPPRtfND6h+GlXQHg=
X-Received: by 2002:a17:90b:2e52:b0:38d:ddc2:7ccb with SMTP id 98e67ed59e1d1-39b260dd3efmr8705280a91.1.1788524694319;
        Fri, 04 Sep 2026 05:24:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f787esm5880860eec.23.2026.09.04.05.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:24:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH 1/3] arm64: kvm: fix typo "synchonized" in comment
Date: Fri,  4 Sep 2026 17:54:40 +0530
Message-ID: <20260904122445.31163-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904122445.31163-1-hemanth.selam@gmail.com>
References: <20260904122445.31163-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct "synchonized" to "synchronized", reported by scripts/checkpatch.pl
using the misspelling list in scripts/spelling.txt.  Only touches comments,
no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm64/kvm/hyp/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/entry.S b/arch/arm64/kvm/hyp/entry.S
index 308100ed25de..9709905f21b5 100644
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -46,7 +46,7 @@ alternative_else_nop_endif
 
 	// Ensure that __guest_enter() always provides a context
 	// synchronization event so that callers don't need ISBs for anything
-	// that would usually be synchonized by the ERET.
+	// that would usually be synchronized by the ERET.
 	isb
 	mov	x0, #ARM_EXCEPTION_IRQ
 	ret
-- 
2.48.1

