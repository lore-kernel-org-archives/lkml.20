Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794337739;
	b=iWJ3eK/U16HuaJX+CgzFY729Rv6ymdwTmHUPH56Ur2lB/vcWaMdA4lOcsTEkjSZVfDsI
	 lWqh+tlZX5M/Up0ihKl2+OTwlSqAKYyno3qiUYPsQbtS3YfBO3BOHqGTVHy1IQBktZHLv
	 Cwrh+lH/fqaYniGenLnty5OZPvTzHR1KKACN2RxXX7/Qg1+0JpLjj5zsfXBARoA7ng9Ll
	 qGHezbJeqOlQxxDfVqkNOa8AaeAltS1/eyqgDi7AjrcrvomIgQFRbgm/AMvHGxtZH8e+K
	 PoUG1BPi0IJhlhcJoj7f27+uC3zBgmBkKLdsaeKJ6eyBn4F+YRcSwj9+OEpbz+xuolA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794337739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ckx+N4bSL1Sy4Kr4O5DY4ekZlwIQydqD+jQM72GHs9M=;
	b=oxfU1FF76nCggYKyYbxG1ez9w3vDlXP2GlWbd5mOZGhn5D/v05LQmvumCRpQbxPzvLRw
	 DifiVR+z8Ill/QoI4PjTJ62ccx+X4Zrw0xt3qdDFqPDLMrcQ74f4GqFCj0+XBld3vxVXO
	 9cCHYaUKZlWOU0vOvk5n1xGxmeDl5q+59A2V09oZbp1mrfSTZzU6ryrZ7Hv6DTbWTiWZI
	 vZCe+xjKsHxAkFWbfMyQJoH/RRMRDNdRebd+3Lvv+vM7AEZ8t04A6tt5Y+9mowit8qlD9
	 g6iZVW++QGa3kALqvFtTkOC7o3mIlLfdiI7qr1xHyxuPrYCNorhN4bwO5avE4I5y8dA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="u2pzc9j/";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C3606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 19:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246C3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u2pzc9j/
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a208d93758so25654845e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 11:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794337737; x=1794942537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ckx+N4bSL1Sy4Kr4O5DY4ekZlwIQydqD+jQM72GHs9M=;
        b=u2pzc9j/rBBTAtJ8ZYrNlirFENZmp4mnp9FL19qUnrJAjT7JsmPchU5zOoOWPvPofG
         zkVPS4pGj6vqoCcEpcnFkb69tmgAK0OwwzS8mg9jrKRGPlnK8h4sCh62lIDp0S3vSVVa
         itAYwqoFb77LK1RtrCuFk/wxiBhpaQYKjz4/3aEZXQ2+mKl4QlsdwbPXDR/KWQttayRO
         X1+CAos7N9j7JuFSPf2F25kwcAfJTq58BMJuAO8WmM+vdBzp1RF56Sk9TBtwD5zMOz4F
         6pHS29fh2wbCINYFCej7ID52itYwIpYjdpR7DNTswVyITtm4eke8A5UvuO5M/mlr6aW6
         wIpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794337737; x=1794942537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ckx+N4bSL1Sy4Kr4O5DY4ekZlwIQydqD+jQM72GHs9M=;
        b=ilzXuXO1KxO+JF7730zXIHIrNTY4FcmJ9eT+9jMwbspCaA23j2ehhYRGkYAlMGKG3Q
         IYSYJH0PMxSrRW/DfCCqLvr0oHvZAny0u19SEcMwCmJX9TyE/o9W/pqSJPEAXwtu4qDE
         RX49zyIIweMAul2NXbL1XCwBRN8j7zDcWyTT3nqW7TwWHd6MQJoijvaLHf5djEUB1Z1L
         npMECdAXdF1Gr7s5wXsaEQ554Uv1ILE7d5rjx+pz9aCQdSxnReaC4KP5pkill3Z3aEy8
         fRymhRCGkOJcq8WPu0b5WqEX8+xNnwNwxsAARRqwTXRIu92PiS5pS+14K9zCTVZ9WiaP
         WpEg==
X-Forwarded-Encrypted: i=1; AL+hErF2WS6Hy+K5faY2gyLbZcRh3Unvf+k4VdgtVhvugs0BtCUu8zFwLZoRR+tcCYPf8rOmOuoFqW3rtDqZS2c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9P44DJt/AT1QVvOruoNCbvcfVUVtOdIFwZaQk57UZM+c9xlHGX
	9yP0zGwgQacVeR3/8w/py6R1r63QGt2Gr4OqFIFYg/bY8OtptcCSAVWz
X-Gm-Gg: AYBFou06ZWAUId0vMxAS+jXURRhY5nlI371miLV4yy3hDfyfZJM711ZdjS1zhnbs3aP
	0rwJ8ifpuAvUkHkbOtyOJ9eMWJBzIXTfUVjdFTu6hNTVcqFrTxKWju8BsHky17AdGFRV/PY0QOl
	PgyWQ0ZZK0J8XYzFAL5UWCD+Jy7skBgk2V75F4yD/FQWC0QOEPnHDtCGe8mwAq5t9FNyIhupoX5
	scmA+4Y+96+iqgCJLcPhcelPLOD7uMTEB7TqkjznMpjDxEs0EmRd5X/usURgKYt2OAZwAD7KeAO
	UAyFbZGivIdS+lAdVR5Z85xXrKbBq/B7MhU43ZYEEKjDJp/8qSseVYdnSDD6b1jc7CfMdnyxQ8a
	qFIXYZR7pDWdTFF4FnNV+Kzzef3uTITO7DDWXXo6rfldjeyLmT4pLt8HzC6KP/ylN0RvX4SDPP0
	LGoXGRQYVNRdprhCx4IwPaPDLIlR3y52AjpKN76Oaj4ktFTXIxXPUg1f/UaXZnQ1V63aQPRBsjN
	ddTWFDQN5ewjvX+RT/u60YFwqESpZeoJZLSXbfB/Kc8QteUuLyzrmd9vHxMccHuDioAmklMEKw3
	Jkp1J1Ajiwm/PTD+1EQMKkOi4rofwCriG1bD6b/gtVgr7l5R88Mh0QGyu+O5t6HGpqKuOhVpIt3
	HIVIUz7ShuMPC+5oxcRZzHhQTambobQmPGc22IH2sLwc9fH3ILHnw3p+GEXSR93jsRMV1eybnyD
	c/uhTxH2EcbFjGuhRDSJ94mIj2XTjVLvUK1XTwyaClvUAUmaFiUW6DcdYdQF5lNH6L7sI7s71ig
	jU/N/+SMEiJ56ktbg==
X-Received: by 2002:a05:600c:34d5:b0:4a1:e672:5721 with SMTP id 5b1f17b1804b1-4ba0936ee3bmr1168935e9.13.1794337737420;
        Tue, 10 Nov 2026 11:08:57 -0800 (PST)
Received: from longitude (2a02-8434-fda5-4201-64a2-5e9b-f89e-f448.rev.sfr.net. [2a02:8434:fda5:4201:64a2:5e9b:f89e:f448])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba08e35e44sm4309775e9.1.2026.11.10.11.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 11:08:56 -0800 (PST)
From: Eduardo Mucelli Rezende Oliveira <edumucelli@gmail.com>
To: mhiramat@kernel.org
Cc: akpm@linux-foundation.org,
	rostedt@goodmis.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] bootconfig: Preserve values and key paths during parsing and output
Date: Tue, 10 Nov 2026 20:08:44 +0100
Message-ID: <cover.1794337724.git.edumucelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794333957.git.edumucelli@gmail.com>
References: <cover.1794333957.git.edumucelli@gmail.com>
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

Hi Masami,

Thanks again for reviewing the earlier fixes. This v2 addresses the
issue Sashiko reported in the first patch.

The parent array in v1 assumed that the parser always enforced
XBC_DEPTH_MAX. I reproduced the reported overflow with AddressSanitizer
using a 20-component chain where each parent also has a value. The
existing verifier skips the subkeys in that case, so the parser accepts
a deeper tree than the formatter's array can hold.

Patch 1 now checks the key children to determine whether a node opened
braces, using the same conditions as the forward walk. It no longer
keeps a depth-indexed array. The existing verifier gap is a separate
issue; this revision removes the formatter's dependency on that check.

Changes in v2:
- Patch 1: derive brace ownership from the key children.
- Patches 2 and 3: unchanged.

I tested this on my Ubuntu machine. All 137 focused checks pass for the
combined series, and the full bootconfig suite passes after each patch
(86 passed, zero failed for the complete series). I also checked the
revised first patch and the combined series with AddressSanitizer and
UBSan using value-bearing chains up to 95 components.

Review: https://lore.kernel.org/all/sashiko-outbox-207566@kernel.org/
V1: https://lore.kernel.org/all/cover.1794333957.git.edumucelli@gmail.com/

Feedback is welcome.

Thanks,
Eduardo

Eduardo Mucelli Rezende Oliveira (3):
  tools/bootconfig: Close only opened braces in compact output
  bootconfig: Trim unquoted values at end of file
  tools/bootconfig: Preserve values containing both types of quotes

 lib/bootconfig.c                              |  5 ++-
 tools/bootconfig/main.c                       | 43 +++++++++++++------
 .../samples/exp-good-mixed-kv1.bconf          |  5 +++
 tools/bootconfig/samples/good-mixed-kv1.bconf |  5 +++
 tools/bootconfig/test-bootconfig.sh           | 29 +++++++++++++
 5 files changed, 72 insertions(+), 15 deletions(-)


base-commit: 677f83795fdfc25ddc51b665a9111f5ff199f7ca
-- 
2.53.0

