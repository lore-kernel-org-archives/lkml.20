Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7456F1E22E9
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788126082; cv=none; b=WOF44b8KhIx1FJWa2rAEKrYSuLLNb7xG91H4PX6r5l2AwMpiZIzUaiIk7T8rGQ80aMsJqNwR2G8dPTp3rTII3qp6Z7f08whriJD3klFkfrUpawEcsWWkQlG1fJ0NnIojvWvOS7fz5EyCvK2HnSlRZ16RMMzh4unrfYULDpf6kHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788126082; c=relaxed/simple;
	bh=hA3frRkMVLT8yqScNMW6PNFs2EYBzOF0cHoTo31xgD4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To; b=eplr1sppP4d5EDJHh9bPiQ0VFCXV6n3UUb5NhtNoRBsn9gefEBFRHuutLA5EYCE5s57DNRI9aYJXKowu58J5Yiq1Zk8RuP9EyBb+z+k35GSKRQCCY0wjdHGC3PPUFpGy5Moyd42o81nOl9Jnj7fzHWzwp2REMhLMPAeI8g/5RGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lR9N4Rpm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lR9N4Rpm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D30EC1F00A3E;
	Sun, 30 Aug 2026 21:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788126081;
	bh=ZJPCNcXSmhdWPBMlLZP18snAyY6mpXKvcYbhbom1sBI=;
	h=From:Date:Subject:References:In-Reply-To:To;
	b=lR9N4Rpmx1eAO1u0XNWAwvsfAGRbTTPYhLEcI9tROVdeux29b8spqJIP2OUgKI8MC
	 BYougaCwWIKXARfF+ljnRFhJN6rF5/GIBnGHHC/kKkOUYhcudop6cQMrdFzDYEHDAH
	 Mmj0C3tc5jduDUsAcv4kU9CyQ3hHs5aFNqFblCMznqfJK8T2+KoTkZe0nkw4tZSTmy
	 9E7tlUKtJy5+Z6N/CvmhghaTLy98F1bWeFFx6gBP17ApqotkjBbvge6Jxl9tSktWjE
	 cBznWird1fZQorNImrPQ6zTAj3PCct//48lKtw+NhYZpMDvgx76y1U//ewQUKVz2uy
	 q5Jwt/2K5V3Bg==
From: William Breathitt Gray <wbg@kernel.org>
Date: Sun, 30 Aug 2026 17:41:13 -0400
Subject: [PATCH 1/2] MAINTAINERS: Mark microchip-tcb-capture driver as
 orphaned
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-orphan-counter-drivers-v1-1-3b10ab8b3876@kernel.org>
References: <20260830-orphan-counter-drivers-v1-0-3b10ab8b3876@kernel.org>
In-Reply-To: <20260830-orphan-counter-drivers-v1-0-3b10ab8b3876@kernel.org>
To: linux-kernel@vger.kernel.org, William Breathitt Gray <wbg@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=868; i=wbg@kernel.org;
 h=from:subject:message-id; bh=hA3frRkMVLT8yqScNMW6PNFs2EYBzOF0cHoTo31xgD4=;
 b=owGbwMvMwCW21SPs1D4hZW3G02pJDFlTFjdUfn/lXr97T+f6+rK0zxJB4ZZvd20ukLTq9JOfV
 GgaHry3o5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZiIXjYjwy0m580VDVf6274b
 OfSKrVr8eeG915fOG+hwyPhvfqex6wjDH56lDu8Y23+ln36z1dJW8ud5sYQzc3N8SuZOe1W8pSP
 tPisA
X-Developer-Key: i=wbg@kernel.org; a=openpgp;
 fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B

The maintainer has not responded to pings for some time. Consider this
driver abandoned, remove the maintainer line, and mark the driver with a
status of Orphan for now.

Signed-off-by: William Breathitt Gray <wbg@kernel.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 15011f5752a9..f5bfa46536d0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17813,10 +17813,9 @@ F:	drivers/misc/atmel-ssc.c
 F:	include/linux/atmel-ssc.h
 
 Microchip Timer Counter Block (TCB) Capture Driver
-M:	Kamel Bouhara <kamel.bouhara@bootlin.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-iio@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/counter/microchip-tcb-capture.c
 F:	include/uapi/linux/counter/microchip-tcb-capture.h
 

-- 
2.55.0

