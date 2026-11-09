Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184415;
	b=HbA9crrh8UYO/MKOYFt17d2/JU3V5+btD1bTwODG7mJ5Ov5CrUdfZKV5VJVopT221yI1
	 BW0gDjjynqhOrdAhhccpiBEuqwZsgaWPQqHejfl+UDAcOdaPJeyZY8Nk/RjyA7/e1blis
	 o0S2ylKgbE2gPSJ3Tym/at51N82NjPY9CgUJeH56kzPRPt9FVKkFFKFzeGRgi1QVl7eJT
	 jRc7nZnAL/EC3zjRqG+0Qlj95hKFc66kt/aKaf4dO3kAKLSiJg8D/1bI6mv5geU3rGvrm
	 HaOn4Zs6BT0c7/Pp/TIP74p/q16gZVaTkD7urTdBA0RZdkh1CJqPVk6BAzHDNo4/mCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184415;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
	b=Yidmvo7gLqiprKKhkBq3FQwi/XBhx2Ha1Q0GXzLTLOpxXa0fpZckEKnHMarKm+seUfYV
	 HZbG6hOGbHxutbxps8a0FWAYz0xCmJb8dMu32wekZz5H+PLFUUYXkifX71ZuIzWAj6rwH
	 VNCQBnTZ+X7s5D4KSS62PAVducKw4BSdc0FWd+iQn0Gdo0rTnnh8LmNzdLS9Ioio437nq
	 KF3h/qg63Uyu/Oa9YlYpG7+Ci6u+l+8uMILYf/BM4/CyX99YYj+4l4VEEKcm0rUwVSqsI
	 Ou3tSIYeFwTKTmD4qpe8AlB5WhT9oQBSuLGgpems0wwWiHGAofMlbMraY4cGnAV4ShA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="DVeB/ILu";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E27606D823
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:33:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70E27606D823
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DVeB/ILu
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so3477935e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184414; x=1794789214; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=DVeB/ILumBTLtGhAnK9SThmzeGROX65vDDXvaMLZaeOoYlcOfAZJzCyt6um5mYfHDv
         Y3VcmUpi6VTDyzOrubE+TKxzkEzeV7DSAlF0WPPNZOCE3moVlSnmkE+1qezIdsBohAmP
         a/93IAhud+Xk1IuhtXMMbD/9JTprYk8GiRs8RDQKDOz2ajUzeKy1jt8xEeKQ03ZHTNjl
         KWqIgDs77rGbxNx92twtTmLWRqapsVjV3jMP0O+gf6wVsaSd0oWYgtJXqPstZO6rnlkr
         fdQkYrgvqlA/v1Pb5mWvu8AR3xbxLkneLZ+FWfx+DKb2+C192KWMt4IWysE3CQA4Jrx3
         3R5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184414; x=1794789214;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x3Zvaf/6knxBP4r88bzQVxogNYmuURJ/Z9N4FNNEXXM=;
        b=XwsDXulp7qCFOZ5syZCWi+sDXgMglGEvoAV3hiMpV/RIU7sM7mwwIP1wrAxsW2XKTN
         R9wL2qTsUNonGKL5H5nxwhYE/hoRyLMLwdD/c5fHld//h9XFRyeQGgWBTfg+/Ilm6wOj
         se41OhdYI827WouOKABf6+Sdlh52SunyO2CvIm4evSXViGJAZYNKr75nIRdB+CLZKYTh
         Madzv7XfCt1fakov9nrSnuq+gd4JklW+up+16SPLeNbUkhIxX0jrNTPL5NcG/IklrE1j
         FpT6bnNNl50gmGkKCDf75fu35PTnTi5bnQQcStIioun4tObgFZSTpAvnwD6yRkXvyifo
         gxqQ==
X-Forwarded-Encrypted: i=1; AL+hErHvSLoVrqX9ft23F1zr2ZFX8doPR+s/lSDQy7vx+iBPE11TiRJBdztUn+BjN5urpspbIUyMSuuI/zth6EE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ArdH9doWBO+Fx/kTPXPShl4YftPogZNpbgrhe9x0k1B9IoO7/
	+e7gtIgrkDZra1NldqLZQTlWTFoaa7FzGMa1qZKR3OK4g3HtlsUSdEh3
X-Gm-Gg: AYBFou3wq4SrZSJLi7PcU3ZdCEl0cqcV011JkaGFje5MolUhNSbmDmS0dE62nNfjQFC
	YO/tgV41iLl6sRmuBFt3Pq4OYb9hNSVZvKmzjj7IEQtNrj4Ujl0h5+iLgpsbk0UAIG0Uac9Fy2A
	n7vnbGNMFUKzRgLJLyI9OirDe71cawxxqzgvm9mJw2dkrQYNglCKGZ6qxhy1Nj2dM9vA3Nqr/vv
	P5w/AWDzDsGwkou2cYqe6KKgm1PhvIV1F7afTVf5/7yRT8soUSmAmVxJLBn8I1/ss3MZ5Q7zC0f
	C2hdJ/1P+aM8rHF0VO+1PGMtPrQqnzA8Vaxq1EzH2Tppc3PR4id45lmy5ZCjPidmbVkmNX7Sq5b
	aMWhf1Ojj06euEDp8cFpNCI4HQ6iMBuyfs3+5hJm/0KPoekC7R+wAnjr9a3zcqTqn61Q5SvkcJ5
	hiYdApQC7UfZDv2F/ff604LOhMBbPwI8TUnAxQofCsV2NKR7SriRW6jNzl5YoVL9l1XXyDdu3xh
	89z8Auc+r2OaGRzPPn8V9LO3RGxh+Ys2irbrfa4vuEDFeDvpkzxPNQjgiQLHSIBllLcv2zetlzG
	1xCCcftbawT42tes18aL18NDBjbKnMN5VIfEdXk7
X-Received: by 2002:a05:600c:8506:b0:4a2:10f9:37db with SMTP id 5b1f17b1804b1-4b963c664fdmr50119595e9.7.1794184413846;
        Sun, 08 Nov 2026 16:33:33 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:32 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:14 +0000
Subject: [PATCH 02/17] dt-bindings: firmware: qcom,scm: Document Halliday
 SCM
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-2-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=1033;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=mntziyVI6wQ2kSkSteAmiaUttlX3LQ+YCHknAe0v+s4=;
 b=6KLs+gQMEgAdwwaI8XXKZHARhr4EIqJqXke9wpzWMnotth4jMEZlLGfBGwMvNoTpcE0tKCN8v
 aRJBBJI0d5iA+Opb629gN3RAQt1TeYIjZdEvW3ChlNmIbJyjVXak7Mn
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the SCM on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/firmware/qcom,scm.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 40a267c54b00..fb3da66443ed 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -25,6 +25,7 @@ properties:
           - qcom,scm-apq8084
           - qcom,scm-eliza
           - qcom,scm-glymur
+          - qcom,scm-halliday
           - qcom,scm-hawi
           - qcom,scm-ipq4019
           - qcom,scm-ipq5018
@@ -225,6 +226,7 @@ allOf:
             contains:
               enum:
                 - qcom,scm-eliza
+                - qcom,scm-halliday
                 - qcom,scm-hawi
                 - qcom,scm-kaanapali
                 - qcom,scm-maili

-- 
2.55.0

