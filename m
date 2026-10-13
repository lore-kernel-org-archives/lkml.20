Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749205293E2
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 18:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791915504; cv=none; b=NQcxaz/bhuT9YAPii/pPmqd9hiW8Po/hsiFeJGPSMjuxB/GV2iBSzBlFSkwGuBH6AML1U5n3zuGFjUXJHrKfgCfwynrl5aEic4ewTzBpOHWdqoF0aXEFFmdojcOak2WNBy9jg1c8NWFMv/T31zPthVQ/o4ySH4jSvtXCxuhmzjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791915504; c=relaxed/simple;
	bh=8P8wMFD51eL/Z26XPFzVuRJ6ptZ4ugBGIA3pAZ7sK/I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdz1rGxzaz4Aarr+f5/DHqDc8Smcb0Xx20zuYe4mBJnKYtzDHxCXJnF8AH/IWi+lUqgOLulFuNa9I8hbVooLVmY6xlXPo2MyR0ZY/3Ug5IlRCCvjXaZrXQWkVTV+yzAWB6HO7E7ECu/3NpemGAgid8rqdro6LfE65rNFXANbkdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SsXi40xH; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsXi40xH"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48870973bddso1996573f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 11:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791915497; x=1792520297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPweYRO+AA51z02Botwdqdgd38/WeFQ6rWWhfhO+GPc=;
        b=SsXi40xHvzG8/XruY/yhZP51+L4CumK6Ohsc10c1BLaywh9/CmgDUNfehe5U4brPXe
         E8naqRZQ1O2qaFG8wtra3VlBaVmrbzeuB2RQfJRB8broMdNl+2/lgjyv4YhCd58kP1Az
         YNSQvNamn+fv4t60rVpEOav/jkpv/uC55VWay/8JN59cI5/VHr3XrHUiZeGDnIPMcSZV
         mPgExRIVAu1XOLWGmV+lRBn/uljcWLGLRiRQBaQdAT6+Y1xI3hX744nhhE4D+CGXCg5a
         N7NjR++FKoGbooLCyrzkdNtxlW4jyVOlC+QfN1eptmHkw5U78M/KD/qTZcKLFG1oEJTH
         U69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791915497; x=1792520297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPweYRO+AA51z02Botwdqdgd38/WeFQ6rWWhfhO+GPc=;
        b=hHVVA6BVNLtqvuCmpE8JOGi7vUsWPQJ2dx0WG9gL5MdTS9TSOHX0wzQ/Mrmk0314hv
         duJzpQVxbU7WwHMhUkx+LTHpGacQO0dZMwWjFB1XkKL/WVCQrLafryI8tUUHTeF2wDVX
         uc825Wcov5sv9HMJqrXZ2+mh7bRP/lOJBCsgVHv/ybusz7SkSo+v4rd37aLu8FbOhKg5
         D/ZeFJgy+BRerJ+VM9I0AcWnps7+6DhYiFUX77GA07WVjNIIjifYHa+yAi9PGsD3xWRA
         BJsLLzzmJ22Nz5QDqqRSyZUw5VFf3jNDzuvV4cDhaZLJU/9NBkDh+tHjxR7h6FhskIQh
         TxOQ==
X-Forwarded-Encrypted: i=1; AKwUvBzR3nzIRH2ZjzONiGXqbIEF8sEZDc5dn9BTGOFrulhvyL3P++p3b9epkoR5Bri4+aD+rmEaullB39A1kks=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6Qc2/YFzVvGB5rDiboT2Xle7XkjxQxOpQJesd2w9teV0/KO8j
	QEW+uIyey8qdgd+/itwk66mYmKx86zJ/SLCJ5kBLOMdsSY/Awj8Jirit
X-Gm-Gg: AYBFou2nRvTA8S21+rRs52JF80Q/fZH2Sm7PsaI7M0Sb79SuZTCdKnBItag6PbC1oU9
	lexRomygLgfL5doSuxabW8iYUFw551DqORYKUbRm+9WKTFogUYQ2szDBvIEdvnKDuuM/ZiAvuJd
	UW4/DQsEYp7mhoi0jgelzwlWXmq1i46nPmXHmkuYdRXnvI9bFZStAXa7uQ8tglsrg5Z2kMCkk8h
	pRw7IRpLwy+ykec2KNKhE5nWkAnw6cXH//ymGZzH77zQiXC9USJ7lcb8ezRx6jX6CfPBxAp76xj
	3rzR7v7qBtdL9nAfF++Q0MSx3YIvlIs+UDKzo25XacO5sVhlDTei8VtLk/1kiJ7ZcYr4THTC3Dt
	4GrAEDLbO5YtKfw7T1Pi3qENhQinVRJbaLGoJHZYrjse54nLfTPVn9j4wlHLdjDAN036hx7QjEt
	VQi0TmcwQU3bKV9y+WpIzEkPrkwcPxr7LttzwyW55xn0viMsVvuAm3gW0UYSLzyiLFw7r9k9d4F
	frOHyWBGhTCjGn0qRY=
X-Received: by 2002:a05:6000:4553:b0:48a:fad8:52a2 with SMTP id ffacd0b85a97d-48dbacf732cmr18793821f8f.23.1791915497390;
        Tue, 13 Oct 2026 11:18:17 -0700 (PDT)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac36f9sm6379903f8f.36.2026.10.13.11.18.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 11:18:16 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: leds: skyworks,aat1290: Document AAT1270 Current Regulator for Flash LEDs
Date: Tue, 13 Oct 2026 21:18:01 +0300
Message-ID: <20261013181803.496627-2-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261013181803.496627-1-clamor95@gmail.com>
References: <20261013181803.496627-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The AAT1270 Current Regulator for Flash LEDs has a similar configuration
to the AAT1290, but it uses a different programming model and requires a
separate compatible.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../devicetree/bindings/leds/skyworks,aat1290.yaml       | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
index 65576dfdca110..7c26bb135c0a7 100644
--- a/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
+++ b/Documentation/devicetree/bindings/leds/skyworks,aat1290.yaml
@@ -19,7 +19,9 @@ description: |
 
 properties:
   compatible:
-    const: skyworks,aat1290
+    enum:
+      - skyworks,aat1290
+      - skyworks,aat1270
 
   enset-gpios:
     maxItems: 1
@@ -39,12 +41,13 @@ properties:
       flash-max-microamp:
         description: |
           Maximum flash LED supply current can be calculated using following
-          formula: I = 1A * 162 kOhm / Rset.
+          formula: I = 1A * 162 kOhm / Rset (for AAT1290) and
+          I = 1A * 81 kOhm / Rset (for AAT1270).
 
       flash-max-timeout-us:
         description: |
           Maximum flash timeout can be calculated using following formula:
-            T = 8.82 * 10^9 * Ct.
+          T = 8.82 * 10^9 * Ct (for AAT1290) and T = 21.5 * 10^9 * Ct (for AAT1270).
 
     required:
       - flash-max-microamp
-- 
2.53.0

