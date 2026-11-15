Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794702728;
	b=OuMm5z1xuRwxEPnnAH73NvAvOsRlSHGUJS0RsVOfJ3tXXPtGQsOSER4847YAhDLH60O4
	 +sA1LJmiVLr1sOUp6nhvA4pxHEHfDtZZpQ7K61U1Sg3wlzrtGaAm14wapxM+/8n0Y1QCw
	 PD38OuY8eglwq14p4Vr/U0dSQpt6WIKaqKy9ihyzZ9L54mFK1LS8BNiRnsFqUCuYWmdSy
	 QzUsP+7ummlrbOYc+wuLsSh0R1xylcnxq5QbZahpKSMo9EaDkLPLD7K4y40c65pST723y
	 GTDlGY0aQtVvghpnhtHG3YNWkuhaEl/Z8i5f+lbJ5jkMEQ8QRiy8xsDLd5I1oXI8fvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794702728;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
	b=l2ZAkZe+c7UlgS8hksfIZ2MFqAa4rG5FAn5cJUNCaNmyRedNnwGrhexDMcDzsYIgI2F9
	 hZltGaWAzUC0bvxVwig/XwRD9/1OOPGFivZuohykwdXy2POBEL7MqKIK/dw4xylMN5rbS
	 jl4Ww13oNKm4EvNL0R1Ca0Dd/Nkkjj+a9lPC7nLGnjrPudWm2HnohWD3M2Ln5j+q0lysc
	 ENplWGG3Hk8o2oTByzKrJ3KBjChk6ABEb+ZfucFv6CdstEs4Jmd8uv4/UgNj6nM24WHFr
	 8aoAr0NG/r44ynR1k+AY16OUeHcMS3pZ7pwTt3VE2D1z6bg04r0k9WWEfvBfVTls3tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5NY6n4p;
	arc=none smtp.remote-ip=209.85.218.48
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB96606A885
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 00:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB96606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=F5NY6n4p
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4322d310e7so470632466b.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 16:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794702726; x=1795307526; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
        b=F5NY6n4pA3zJoPJKQRZ8qrnhPh4iiSBXipyS7ZZeZZk1Jhgi5od6w1ljHwxc4TFJP6
         N4RH5tiGrt0q8MU3f86r2HBDR9A6Xb9OViFPa5swY1F7qYvJquKfK1j+NbvGY5tQHQPZ
         Qj+is9aboixvTiNwW4IEIIq7cGKLrD1Xs3/n7mmKxauASaPGQFt3J5v6yzVGHvXvISEI
         n+KcHLw2WdJSS5FneYfKXWFzsDyGgY1I+yGZBgmkzshmKDFGEu/vmKNWG470+G6EE5Cu
         RIK8CCuHbKZLfU1KmA/VpeWOKvFvZAfEzS+jibYRyTkbRMqMKs9sIZ1s9KIcRGVogHH/
         5obQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794702726; x=1795307526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GVBi/BtHwXrMR59M0e8R1++dDkkmRGqCyH13CxDS4UI=;
        b=V5xvVub1plU0ND10FztvxSySryvOC45w4/rFIq4fIyHcMVFfCyXlDUZQdU68xo4gOI
         1HaD70Yi9JVpLYxWYeEariOH1p0pMgC2u6+g6pU9dj/hv8fmXD6JI5jTz5CtHxckVCbW
         IvWxHTMjy9NWv3luDVAxSqIJOWbUIXW6IDj6M7gJABW2tRKdxwBhTNiKlAjI2EJNZs/g
         RcounAHe2SYsPP3wwOu7Vh1CYFjGNAYvJerfn8qyZKhTpvMPZG9WusbVgt/PuqmNh6fq
         v9xB3kiEJpyPPrUc0+b2MxV2W8fZPpfb9yC1V0YScuTggxkFnOfFM7UgG4heFGoayK6S
         gHHA==
X-Forwarded-Encrypted: i=1; AL+hErGhr6pSeniOIG4tJovRso0YN/fB3np9EW2vR1G2YCYSvBQOrokocHyvxRpgXQi3TzmgI7jBv1uD0snP/PU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RgWZbjbWBPC0DKrHcIZfvsgB1n53I9VmjdVGyQy5qAh6ec/Q6
	7tI5fpuZlOzGABV6HYkVFCgIpq14HjZ4wnC46kgQWb4eiWXf9rJWx6Y=
X-Gm-Gg: AYBFou0Lntrps9JdTPrPSHdEKdwKyv+UfU4pH1Eiec3xpAOSr0UQkORznyorTdgr4Pq
	8oNsM3+Amwm2E5yqlOaie+bMNz1FIc93bAx2h8E42XLUqkeKI7DFa0Vye+4myWXtQWJlmFMkE2F
	pRyyh3tt+4m1fJV9QjFr5QwAPlO1fUWFyKnrrovduHz1ed/S0eXUApqoqU5KK0MLQAxwMM3vcKb
	7cRr0VhiMSVr6xY0PsN7+NvyuIqKqefvinmIBC4QNoE7hbLG0EcYXQAyccdkQELsxf2v0jDRikd
	i9oDyolG4IdNLqSWlUbYd8nZ8sqEGGoA5rHkwu26rRjvYPxYqJINDLyTo1WhFc8/sHqFRfNIg4x
	C+zJKmAYm91N8O+L4mIVzadRPUfZ8HV12wDXQVJQvzAUxegJhOLKxvPjNKoa0tohRwQ2JZQHX2m
	hJGiXklj2GUahiOGJ0kS00IjvQsaXrYFhb57wn79ANN03S8lUGVyRS9OTN//a5PVRwd5PnaKZG+
	pWNo7+ca+ZVAFIL3VCj+sJw4JHFDHxGsN3ZaaUehlUCEn0Qnj5TsY/FbUuP7uzn5wK9j1qqQbEA
	e1kEfgoju3cOl+wpTu/1yQf6ivBTzha5YyqTMRyykYZovtj/7CavOO8weOl344a8JhXak/JZOjp
	z7Eg9BA3B2Vb7BaXplSuwOAvUGiUF7gGrQKU=
X-Received: by 2002:a17:907:843:b0:c2b:4142:2db1 with SMTP id a640c23a62f3a-c5096387a3dmr518400366b.40.1794702725988;
        Sat, 14 Nov 2026 16:32:05 -0800 (PST)
Received: from sohrab-omarchy.taila18b31.ts.net (2a02-a44e-4ae7-1-c0e-6d5a-8ae2-915.fixed6.kpn.net. [2a02:a44e:4ae7:1:c0e:6d5a:8ae2:915])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5c4b7sm260695166b.1.2026.11.14.16.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 16:32:04 -0800 (PST)
From: Majid Hajiheidari <majidhhdri@gmail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org
Cc: rafael@kernel.org,
	viresh.kumar@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	abelvesa@kernel.org,
	mani@kernel.org,
	admin@mswin.me,
	linux-arm-msm@vger.kernel.org,
	linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: cpufreq: cpufreq-qcom-hw: Add SM6125 compatible
Date: Sun, 15 Nov 2026 01:31:56 +0100
Message-ID: <20261115003158.391171-2-majidhhdri@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261115003158.391171-1-majidhhdri@gmail.com>
References: <20261115003158.391171-1-majidhhdri@gmail.com>
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

Document the cpufreq-hw (OSM) block on SM6125. Like SM6115 it has two
frequency domains with one register region each, so add it to both the
compatible list and the two-region constraint.

Signed-off-by: Majid Hajiheidari <majidhhdri@gmail.com>
---
 Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
index 98eb36bff..8dfe77d08 100644
--- a/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
+++ b/Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml
@@ -28,6 +28,7 @@ properties:
               - qcom,sdm670-cpufreq-hw
               - qcom,sdm845-cpufreq-hw
               - qcom,sm6115-cpufreq-hw
+              - qcom,sm6125-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
               - qcom,sm8150-cpufreq-hw
           - const: qcom,cpufreq-hw
@@ -146,6 +147,7 @@ allOf:
               - qcom,sdm845-cpufreq-hw
               - qcom,sm4450-cpufreq-epss
               - qcom,sm6115-cpufreq-hw
+              - qcom,sm6125-cpufreq-hw
               - qcom,sm6350-cpufreq-hw
               - qcom,sm6375-cpufreq-epss
     then:
-- 
2.56.1

