Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793618126;
	b=zGefqtq7hwAWQyfVqtqCjWRbqib451Ggzm01io13+uOjdB0710k4egzKllOUMFbAyN47
	 5o7YeKzDpR9xNm6mZz3psiJMPJo0Z60JV7ercoINCswG1Ov/eenz4SGGTOVJ2NPRiwt+p
	 6RSeEX2tEBUpc16QyUQFOvjR0hAFOPHJx0k0u7JEMbXwzUDFaKnvFsW/ATMATktx5lrsJ
	 b+gNr1zJ190SAhOzQ99ngXBf/uw7miVtc/Gsh/4i2Xnu7NMlJRwpVtwMByXdvEAaqwtFI
	 MIdjYHbvY21JlQAT5RO504+hlJP4TdSA+PNvTqilZPx7BL4q7cUAMvvaUKRQggC5rSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793618126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=6SzHi6q98Zf0qdkiRBybrf+muUBlPpBVfDjgB0DMVkw=;
	b=Q2KXGYio6FULWeZB3yP/bwTUSipOiLTiaR8iuQp4EQ+FsLhygflRp/WnjNDKRuenh6eX
	 GmFjtmooXWXKmue/5ZfGaEWT/nCpSVPsQYvwaW2HxssZAh7iTFkZpeNCSF1yUqN1qEmzk
	 H7/lQs2pMneYk3W+HX+Jbc96f8VDXnaZiBifZXCsIbwn4AK/9z7CU8kcxvJj3+jDCffOK
	 N3QHd6eGyC9cPXoqM3RA5DQzNaLX97OLqeLUtm+LFof0ydNMT0Vw0sdEFc/31JjfSRB9R
	 Dgd8MPRVePwFYDzOPWwm71kp1Ny/DfUSa41mKMBCjHXpKkBJ9HdUCjCBFltNKkNQQ3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HCdkd8N1;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AADAA606A339
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 11:15:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AADAA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HCdkd8N1
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a208d93758so30488515e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 03:15:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793618124; x=1794222924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6SzHi6q98Zf0qdkiRBybrf+muUBlPpBVfDjgB0DMVkw=;
        b=HCdkd8N14dhw0wD76Fi6xYluJmi7zfqdDU+bd4lCW+LOcHyVT31OkC/sUlkbmCxyTP
         kiMh3d6FVUO2vjKqGXQYbYDxLXk9Dr5zhOZRqZGtz7ZgX/D2ClpXVpbyJTADnv8ViCDw
         cvziZAbTssbrRwJZCoJMzs8zs97k2K6y9BdwH2c179M2jN+GaYkvNa5k8D4Ck9WtjiUC
         kk9PaluE9YxpkJu/sXQSpR1DJVn04nCjWcNJUtKIw56sFYVq2BHujRXerBK1NVk93Ju2
         iW8Yk66kGYFAfzGJsABvDfOvp9/gwq6gFysjcQa3bfOBstgYPj2tUAalMbZx0pWrXg4L
         rVyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793618124; x=1794222924;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6SzHi6q98Zf0qdkiRBybrf+muUBlPpBVfDjgB0DMVkw=;
        b=qh2kXJO0iIUcffwrjhmcuI4iF3pgIBsob9FKFqJoluiJFta+b84ovVZ6uPpkZ2BPXu
         HHUdEs9JxUhd2PCL6nvH8DmWLsBWU6JausSRdXjmGVRihRNfXkHOlp+FIVOmY5eHvJfo
         /eRdZA3meF9fXtNGWbKU/1pZeABjbzVqz1qBbKhGiYg7jy8lwRziHZ48O59XoA0TZqQZ
         J2X9GW8ycwBeyHnrin874KlzZvdafehjPRy7TGhu6NE1Uik3bqcrzRtO7wa1gdknDrCq
         COS9hiP66M7ve+jc7JXaquXwhHZAcGM/01UVzXy37HBuAtAtrpTfEZK7Os9BwZb8Syx+
         8u1g==
X-Forwarded-Encrypted: i=1; AKwUvBwSN50VobAxYUeV4Szg3MDf0Ujletl20/C4x/5/cBJCJZJRTxC+q3yWmOTHhg8BQ779eWEODGb2wPqaI1E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIR1IrX2uYVuZdx33rQB8s5NapDCcHkGYKVxoNI1Ak8ObQZ4X7m
	QL3D0UsaUm2sXU2c1Dp5x8RsMFEmP3S6dpomvRFIZiwuavNdt5ED37FEHFLlY6u3roY=
X-Gm-Gg: AYBFou2Zff3QrkBZM1IAWkd8R4KnqM4hN0YAJONqP7latQl5XWUxpkWa8RwE9wRbE4b
	NukFPyx1CBW4b99ctkZXE6yLhlYekH9613wSu9C70tFA2a/IH4cZz7l1fSvz7Ust3DIVxZcVSYT
	82WfRgLoulGBKK8hqAC+5tpM6Yf+eJnCxIo0abEzCETvvCrsJYn6dirPGEQ2JlH/U1b8SF0vWnR
	/yOpvmd7FHAHP4T5sRV/T47IvHLO2gkXthv/6Z2DrixjANpfbH8s4PajwmlcHwyxp9abhRWyB6n
	VhoLzE7cvjYOCwLwI1c7Ndcv0/DOxbURz6UMWPdXvmgfhNqlQVnYPY83yBjSxu7ImqQr+phEBdA
	OFc1rZmoOFDUG2+fZV9+U3DAEmUBp3amw9i9FiAHuC1geSUCT7nP2I9eGY+dYlWNs6IWwWo+Frs
	RKxb95/H4lq9K691m0duGNib9qYNdB4PlHl7unC1psLBUYi/EgRzjVlfAFFpKnPmfVroOqt7Wj1
	KfoU+Vn7VAMEgIjwYURfyI6ji1I/6A91TJu6g8hIe7FHWTq7hPLi9XcjOCLzz6NI7NauVP/+pTJ
	t+xnrbHaUMRpF5hTZIYReFehlYTF2g6p/d02SkT7jnHyS41FPHmTBNhG8JpLpk/BfEPYIPvbXyP
	qOEh2
X-Received: by 2002:a05:600c:1907:b0:4a2:1a:a116 with SMTP id 5b1f17b1804b1-4ac16fa15edmr223689725e9.0.1793618123741;
        Mon, 02 Nov 2026 03:15:23 -0800 (PST)
Received: from localhost (dynamic-002-212-042-085.2.212.pool.telefonica.de. [2.212.42.85])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e71ba4ac6sm20690038f8f.52.2026.11.02.03.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:15:23 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH bpf-next] bpf: Use "new" URL to show if net-next is open
Date: Mon,  2 Nov 2026 12:15:09 +0100
Message-ID: <20261102111509.357269-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1437; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=kpOfJ1TrfdZHVkYvKgtWh+AXcSeppGLvncABlZecPo8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq6HC93TXUT0SXrPrMSnYvXjPvFbwfwFOJYXn43 P33eb25CKiJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauhwvQAKCRCPgPtYfRL+ TgMvB/4pUxHXRzHQ8AGPJ4+Lp/xNQIHb0Cs4nPBQ+/e8+9kS1mMWqvZKaCxJDgfo4Uyc3LNOhBU Q5SFNd+oAZ9AG7cN+tLK2kRrPXtGCXT/rRswzZC4bwIcv/60jCJyLww9H2dFvrOJb1oBqifNyHd 8evI3/4wUM/7Rqqgp5xCQgK9vo9ASpmp2pDTVHkF1NJRLu1OiwX4cf6Ttjl+72IVtue3osS3P/d X/uRWPVKGlbCxK/QsON3JyWBIj9VAsHBmkpdxQ5fFrcxU54ZJktd476W0vlmXC/zREfTjKON7kr 7BdmWpKHO5d+vbXEzSrvvj+j28aEiTxDTfHoCx7sgJydJGQS
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Documentation/process/maintainer-netdev.rst was adapted in commit
524500873802 ("docs: netdev: update the netdev infra URLs") to use
netdev.bots.linux.dev as base for (among others) the "is net-next open?"
tracker. Adapt the bpf documentation accordingly.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

I was unsure if I should delay sending out that patch, because it might
be considered a fix and I could have talked me out of sending during the
merge window by claiming that the (old) URL didn't tell me to delay :-)

Anyhow, it's not very urgent (I think), so I waited until -rc1.

Best regards
Uwe

 Documentation/bpf/bpf_devel_QA.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/bpf/bpf_devel_QA.rst b/Documentation/bpf/bpf_devel_QA.rst
index 4729efd657c3..7f1531f0848c 100644
--- a/Documentation/bpf/bpf_devel_QA.rst
+++ b/Documentation/bpf/bpf_devel_QA.rst
@@ -243,7 +243,7 @@ a ``v*-rc1`` after the merge window, we continue processing of bpf-next.
 For non-subscribers to kernel mailing lists, there is also a status
 page run by David S. Miller on net-next that provides guidance:
 
-  http://vger.kernel.org/~davem/net-next.html
+  https://netdev.bots.linux.dev/net-next.html
 
 Q: Verifier changes and test cases
 ----------------------------------

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.rc1

