Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3CF64CCDD7;
	Tue, 15 Sep 2026 20:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789503905; cv=none; b=G7filaHj9iXGMvAVT/bpJ2mbaA12NKyRv1m+rqdj7K3/fAmsirylhKjfjfYd04UxxGrLj63GDoSBNRABNnNORETGRmAlQ7nri684DbdgtVnRpyJvW8/kM0Aow6299y6Cac+7VOZ54tV3etkA8JJVkDOs0ChZV813Cv6qltrwEP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789503905; c=relaxed/simple;
	bh=2DcnYg2At1N5Cr25JbjUCZQhYqC7BnHQoxJPdO/m+x8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S0FODgx29bRDMaOFsSjxKjbatFjQf9fV5v/R4UwM6RlCtGLQasyvWeVhNTkfhwscF0GvrDR9bY4NSUWk8HQTJ0lrUmRLDe7VgXDq4zsyBvxG0oJYH7oSwxpAtrU05vtoIqLxrH+5YLeq6yNgi+tZ9erTZQ/9mLubBSBlovZhjz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9rigXwe; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9rigXwe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82DCF1F000FF;
	Tue, 15 Sep 2026 20:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789503903;
	bh=Csd4l47tH20QHUGnUYb7+NRxShDy4/5ue3Dj0thUdb0=;
	h=From:To:Cc:Subject:Date;
	b=K9rigXwettXA+yylIwKM8irMnqW7H7qVINnjRp8lNjL4mvbFLVAKpXA9XTwh2tdSQ
	 j7TLH/nXMFVreoJufUn2l1Qhi7vMhwdOdJHjNY34sSy+ifGDXwLivfXReOMvbeEl7P
	 y9Ej3kC9K+khJpbztKKIJiSczaUqKjGno7yDAMRGL3RQwSkJmgmAY1SPjDWBIGwjKg
	 1ePUHzxbG6dMmkJVWIVPJVBElar7vauvBqXEptd7omg1xCio0Rito0YxlP9oLJdIeU
	 v+Xta46QMS39JCm1YKP5eAB8+6canNOtbJ0WY+5B295sSbyc7sz9utgvt8wMRlF8Rt
	 vGXSn+er1uLJA==
From: Arnd Bergmann <arnd@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: mali-c55: add padding to mali_c55_params_ccm structure
Date: Tue, 15 Sep 2026 22:24:48 +0200
Message-ID: <20260915202458.3673504-1-arnd@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The newly added structure has extra padding on the on
some architectures, which triggers a pedantic uapi check:

./usr/include/linux/media/arm/mali-c55-config.h:807:1: error: padding struct size to alignment boundary with 2 bytes [-Werror=padded]

Add explicit padding here to avoid risking information leaks
and incompatibilities between architectures.

Fixes: bb401df68c06 ("media: mali-c55: Add support for CCM")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/uapi/linux/media/arm/mali-c55-config.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/uapi/linux/media/arm/mali-c55-config.h b/include/uapi/linux/media/arm/mali-c55-config.h
index 84d8f3901405..9c922290e035 100644
--- a/include/uapi/linux/media/arm/mali-c55-config.h
+++ b/include/uapi/linux/media/arm/mali-c55-config.h
@@ -804,6 +804,7 @@ struct mali_c55_params_ccm {
 	__u16 coeffs[3][3];
 	__u16 gains[3];
 	__u16 offs[3];
+	__u16 __pad;
 };
 
 /**
-- 
2.53.0

