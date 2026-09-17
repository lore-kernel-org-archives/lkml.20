Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C6524B19;
	Thu, 17 Sep 2026 13:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789652874; cv=none; b=dIM+V9DByK414IB0OhRh79ZuQMH5xl7ghfoRazuoG7KqqePElw/CRk8jxsL+0s3ZuMNrLF9y1GwTOES537wYVXt1TEuVM1qOoFld3NA64/FlFatVfo532sCV/So460gTfbMoJxop7IROXwQIVA44rs6br++WS83gzNrbmfICqSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789652874; c=relaxed/simple;
	bh=Y3/WTQ/l4oRXIFqoGJBY3yM0W6YAM9UCtn+ZY5zlgfU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W1aETvamxIa1h9ZptI0lRqidnerSRlC3UVyz3kx8N0GQxB9nvLVYqiTj3anoEwNM5NoV5iYOPCWT4YaC4bK2kZp8sj0xL/yCX23WyFdUi9XZYGibtXmObFqdvHaOMQ9css5g+tQ1d1GvZAVpg5OMHRTAm2pa9PY9QAuEMRrt6qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=BecBOv0w; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BecBOv0w"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=ji3axTtoFrhEc5dq8UvC0E5lffT8DbwX5FXf+6BtpwQ=; b=BecBOv0wr+SJF33yEWPpz0/lMS
	gBxdtd8yD0JdprD/49mqCczN8hQ3BEurmxw6+WMWwErUzDW60qgneU0sHcYFAjVah7z+5Jloou/9W
	e007wRt8/l4ZhXcN4N7g7AZcugEUaG7MRQATtIVt0s+Dfk/c0LhI2lf/sasaSmjh7vvvWMWa62NIp
	onpD8v9ep1WwTvmBTssezDx4p3/ouj7G9qGBXo8IeLeByjutW4b2druAlW+/0ZETzXIZWjlRwxSzb
	BjvcyOQsC0iFAnzQPPRkVMzvZufT9ceGzaWJujWj6ReKXqBfjcj9UuAIi4HFhktLdM7cmIL59LzU8
	ro77G/2w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1x7CSm-005zB7-19;
	Thu, 17 Sep 2026 13:47:44 +0000
From: Breno Leitao <leitao@debian.org>
Subject: [PATCH 0/3] kmemleak: fix stale documentation and raise the
 verbose default
Date: Thu, 17 Sep 2026 06:47:34 -0700
Message-Id: <20260917-b4-kmemleak-doc-v1-0-84fde6d1f749@debian.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHbvq2oC/yXMTQ5EQBBA4atIrVWiSyNcRSxohfKfbjORiLvrG
 ctv8d4Fjq2wgyK4wPJXnGyrhwoDMEO99ozSegNFlEa5yrDROC28zFxP2G4GFcWU6LTTRAn4arf
 cyfk/ltVr92lGNsdvA/f9AJ8ZQpdzAAAA
X-Change-ID: 20260917-b4-kmemleak-doc-1232546f4225
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 Breno Leitao <leitao@debian.org>, kernel-team@meta.com
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=leitao@debian.org;
 h=from:subject:message-id; bh=Y3/WTQ/l4oRXIFqoGJBY3yM0W6YAM9UCtn+ZY5zlgfU=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqq+97r6e00yIzYT04C5vSbseQ6yBFaKFGQ29FI
 1qWzRuSQLeJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaqvvewAKCRA1o5Of/Hh3
 bcXwEACGgqN4ui4VMPS+2k7A/7QdcBjYupp4IXS6chcEBFTfSfHOtyqJ/C2WSs3QFIbYcfomw5D
 1p2gZP6HGsjulqcvr0m9OMb9jE4BfSEF6jEybbzFfznX8MGXK+FMuaPx7jxSgPqVVyeKh+Maf8c
 TZAD7dmgyeo2tBPzT7tvVWU7vKc4NVwp2byLDpR1J/vYIhg3Rmq3QNus/mX1tu1r2mA6P2aUf3u
 4hdez/xTA6w7mqycS3j4w1LAAfmybNhLZoEOy0hILrvfIUCUbChX1S8u4+mrXRRCJSiVZ8mWla7
 qOI02wYiz7CqlrHNDfRniuPsVl8BCbS84z1Rpu0X5/VcCKwPNk2rDnyWsM5Nn7GeWxXkrPgrEJp
 2gKAlZC8BICqoRsEja61yHYVOHD6LSAh0fWZIZh2yjP+4BfutoBhYLiCfesNiZzsVyOY+7k/jXu
 f1nIFUhUpolaO2IyAVTTKg0ydMAqXTPb2iCw0FTsoGNQ+088ib/YM94qHoGgjqgK2Gr8B5Vzo4Z
 DEDs9caQpC5dibRK35vSqkBQJ1r5FDYe9tavCCH86x7pPsayDyBUvUJTqEiYHrJT7KCUZ83fFc2
 rfJ+mU1vGmmWqJxlzaEdZzmHIMITKmjaychD1W6ncZmqYz0Gj9rscR5ZIW4cgIu6KZPrRbvbtl8
 V8ELmV/ENTkYQWg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao

The first two patches fix statements in
Documentation/dev-tools/kmemleak.rst that do not match mm/kmemleak.c.

The third requires one more consecutive unreferenced scan before a
CONFIG_DEBUG_KMEMLEAK_VERBOSE kernel reports a leak on the console, to
avoid the last false positives I am seeing when running
CONFIG_DEBUG_KMEMLEAK_VERBOSE on a daily basis.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Breno Leitao (3):
      Documentation: kmemleak: describe the metadata pool, not the early log
      Documentation: kmemleak: fix stale statements about scanning
      mm: kmemleak: raise min_unref_scans to 3 for verbose auto-scan

 Documentation/dev-tools/kmemleak.rst | 24 ++++++++++++++++--------
 mm/kmemleak.c                        |  2 +-
 2 files changed, 17 insertions(+), 9 deletions(-)
---
base-commit: 587858367581b9c55c3690f4e63382ad622719d4
change-id: 20260917-b4-kmemleak-doc-1232546f4225

Best regards,
--  
Breno Leitao <leitao@debian.org>

