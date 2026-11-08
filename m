Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169469;
	b=xCjhOrur5xCenvOnBwae5hnhbMCtUcanmFtMA1HxpnEsBqI7f0QlToO2I1hUfbLXpJKP
	 xyTnOsPUR97mL+Sq8pXBPLuIqAd2Cgmo5pmYusMmAXutOKIN6Nt/jYSKQWxzjOMPCi63H
	 Gk+Vys0yKA9tOFq6uRKu6IxMA4d7PFrAJD0m2ZIectoP/SgCsddOHKMq1sMArRB+d0l4J
	 hrHzBq0/xNtCcIxvJQ8Eb6pX7RSQxlwrAuH0Q4tc8kx8Rcsr+3dVouNH0tKEaIMFdmQqR
	 /4NGKe6Fe2ZxE+YLAypk9gDpEfQcEKd0oJeLUmfQNWeDhbsvkNyorjLcKUfI8bAErrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169469;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=sl1RiSecafJJLjcGJkmLnXileJoqiVI5c1VnjtgRMUs=;
	b=xx0HXnxjQY/b5H6P+cXSW+ZCyLV5UaWhRIQbECBzRXIxcFuCd0ds2msk9c8hz3Dng2jb
	 dAekPZunQud9G2yBCM5nsWpvyb/+e/wteevPDhd7ooodJooSq3cD2Fz73FnKsBV8JE0VH
	 SVVvBhTo6BEYM4LDTfzy9S0zYJv001aXbqhwjR7FAZvMQ8QN7V+fR6UbTWNAdTAAp1dQk
	 SsFjKn4NuiUBDtXf0ezzkuBNdyV6VHZDxIuwtUYde80GKOIkT7PLX1vgswMv8GQ0XQN2O
	 bTtPvBeAvR+TYRzfg+ogD2Ol4A7TzAz4L9emoo/rAKOf52dslbThqzxtLGWPaU/RpJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qh/J0nAf";
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283AC606E036
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 20:24:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 283AC606E036
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qh/J0nAf
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-49134c8509fso212748f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 12:24:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794169467; x=1794774267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sl1RiSecafJJLjcGJkmLnXileJoqiVI5c1VnjtgRMUs=;
        b=qh/J0nAfM6eBV9ItcrhQzKqEOSU/vZC2wJNodHwTQe8F+q38Va1rm0wWiivcjb0p4k
         SJERNgoH+ND5g41BxVpsW92mxP0kfxZeS1o/0Coeqk0D5RJdR1XkTjkkXjMn/cXPFYfs
         4QK7REVIOvzccmpMVzMxDJrAXuaDnesijlli94ob0iI9HxJ0f3/2BHWYVZgb/mHIPrj1
         +59b3DXoHQ2HTRhHxhqiiUvz2P/x7YKj8dHjnbjbzGj3FkXWtAgVyr45TJr3KflskABO
         QlDVIVHUbVnLzUO2ssGOKKfaXDQoZs4T06oeB4LP1670qFZ/EYickeqF2B6YtyDEIg3W
         CyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794169467; x=1794774267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sl1RiSecafJJLjcGJkmLnXileJoqiVI5c1VnjtgRMUs=;
        b=XXjYeByJKcAoH7TjsUi1DdEoaJ+HLGrMr6C42rNaYMYu/MEYsRkBXiquhs03N37gp1
         HTHSw/tY8tbktgOHX3ta2KKTKy4/VPEtPwwG7IQmzZOntqYsY3Sm6U83tWkgM1uqHC3n
         ej8ncwfmXfXe8gzIBt1i/WuKhIlLA54kifhHRwvt15Zyge9lYR9rSk/tOCq33f0WW4So
         2lNxwP0UEBIUWKrvAHt8D29zQ+DI+zU50xC1TSCspj498l22z19pbGrjPlcT4SuNM2Lf
         lBQR2j4B0/uBE37z43EZWZelIYziPJ386Ozx9T0nQh4n5dW3IpsQwIXfWgwp5GciNHoo
         Kxhg==
X-Forwarded-Encrypted: i=1; AL+hErGeAztY07z/3FrqTTLlGyPc/NNE5kyrjJ3yhs5XmDlvxbNoJXgFpmjGn3HXlEKtGqcI8+LhFgSoW2Dq/+c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JRLraWWWW8/99XmbwmmY1N05QoiTO+uBkUFTn+E9Bpr45MfR4
	/SH7Vr4PxmcuxftUjekfWyumhChQkRYrhbQ0FanM8cv2T8stY6jj/krJ
X-Gm-Gg: AYBFou2jPQqRJ9y4PouqcpMeywnzkZO2oUE2OKwoVupjlirWvczbRav3q/bdNCS5Bin
	7xIXRMBUe3j0hbcNzfsVr01unQUzxXqAQ/3HgSq5SXJJ4e1v+YdQLy6fOlGH7wE0uOSQWTSkIz7
	obe/7oQebIFBaSpc0f9GT/GxsUsoftkNG20wGJX5iQaEB2btRd/5QfAkfPs6bgQqfLzpbQb+z5/
	2dPGegfrIjucLlxLc/K5hlV2gCn9tweHwrPZPpBVwle6xHY9wl9R1P7wJ0Bdg4NE1rTETbYnx/p
	PtgsGwlleLeEHZQiXDykEadIYaehC8QhCS2nSoxh/fYIJESbMZ1R3C0aqgFi6TJk5ksGqFMCq1K
	GPhteaZe8/D1vuNx/oIqzIcsWtTbkAhdoLqViWWxhoNRykCN0jsHmZxhCyd5ADGzszhV4lEjkYs
	BYP39Q0AJ6dxsT3sJs1AutEh4mgTNLIfTJlTMQuUuZogsB8GthDoo+Ozrr822/h9oHk5/usTH7x
	m/+zspWZPlcPMY7MS6TTBCsWnW4BVFflGnBitjKog/tfXEFLc6hsf1ppKRwRzsw6EqlhuXISZPL
	6hs8rWYZnE14cV6ru7YDkuvacub7zQxIjOu3QsnlFpO/cs4U57GTnA==
X-Received: by 2002:a05:6000:1a89:b0:48d:c186:dcc6 with SMTP id ffacd0b85a97d-49585f85ae7mr5659490f8f.57.1794169467418;
        Sun, 08 Nov 2026 12:24:27 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49596bc3ba1sm6034100f8f.24.2026.11.08.12.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 12:24:27 -0800 (PST)
From: =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
Date: Sun, 08 Nov 2026 21:23:50 +0100
Subject: [PATCH v2 3/4] landlock: Simplify landlock_get_fs_access_mask()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261108-b4-landlock-refer-nonfs-layer-v2-3-2b405fc1b3aa@gmail.com>
References: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
In-Reply-To: <20261108-b4-landlock-refer-nonfs-layer-v2-0-2b405fc1b3aa@gmail.com>
To: =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
Cc: Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, 
 Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, 
 Shuah Khan <shuah@kernel.org>, Dwi Siswanto <me@dw1.io>, 
 linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack3000@gmail.com>
X-Mailer: b4 0.15.2

Return the handled FS access mask as it is, instead of artificially
adding LANDLOCK_ACCESS_FS_REFER to it.

Since commit d6c7cf84a24f ("landlock: Simplify initially denied access
rights"), the merge operation already bakes the initially denied
access rights (LANDLOCK_ACCESS_FS_REFER) into the a layer's handled FS
access rights. -- They don't need to be added explicitly any more.

No functional change.

Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---
 security/landlock/domain.h | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/security/landlock/domain.h b/security/landlock/domain.h
index d9ebf4857fce..812c324cb6ef 100644
--- a/security/landlock/domain.h
+++ b/security/landlock/domain.h
@@ -262,16 +262,12 @@ static inline access_mask_t
 landlock_get_fs_access_mask(const struct landlock_domain *const domain,
 			    const u16 layer_level)
 {
-	access_mask_t handled = domain->layers[layer_level].handled.fs;
-
 	/*
-	 * Handles all initially denied by default access rights, but only for
-	 * layers handling filesystem accesses.
+	 * Initially denied by default access rights are already included for
+	 * layers handling filesystem accesses, see
+	 * landlock_upgrade_handled_layer_config().
 	 */
-	if (handled)
-		handled |= _LANDLOCK_ACCESS_FS_INITIALLY_DENIED;
-
-	return handled;
+	return domain->layers[layer_level].handled.fs;
 }
 
 static inline access_mask_t

-- 
2.56.0

