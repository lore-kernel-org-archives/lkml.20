Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184436;
	b=UMm+ZEYybzAjQNz9k+YFmiYMtMeUFOm/e7pedWgz5ZbE/IWn84oEe6LHfqCWUsAoZtW2
	 T5WrOKo3uZZCFN1YEBWn1qllF5pB+AJr8x/r+UVFvFIYJ52jCoCST51AATAjUTwVrwzU7
	 gCr+aPEbuJ4IGmePrvlp1zCWFFH9ClYILytKiQ8DsZasrjHee6ATR8lP5Hh9YhpbEOrG+
	 mzr9IkzVvULY8/avplKueIrXLi0Tpr+gJ7YYjred+AE0MgoOYtIIucn76NoFieeKrPuzx
	 lDOaMeUPtOiV24s7wNFKHd0EFXl17R5kUxddKZ0jWa8GRbJK+88ajqoLDqe37FJgIRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
	b=H5VitqZfgabgSlPufJQCDfEsoDmxOiKV3+u+0mizmYdm8ai8MvQK8sSDW3YrZLF2P3y+
	 DhLY/x16hmT0Q8a5rxYSvL7msI/vY+YaUDisJo7fn77US0T5v3A8eAvGmQQUvYRNBlYJH
	 NPsybA+ZTsODRUgHc4Snmp9jT+JU7qNUq2TWM8cUUy2OayPoQFDDbAnBWoY4SgzzMjucS
	 jbPAXu9RjPskY3/B0drpEVQQYbJ7iqM4TejeRCwnQzEj9r18rGnIaHXqH4R+gUWyE0x7y
	 j5lA7SYL5rp/9LVd6k/11YUQlD6BPZTx83grW3I7ZUfCKmpF6PgnktRwfAMSf6ocnow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCE6606D806
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 00:33:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ADCE6606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mqATGSDg
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso224058f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 08 Nov 2026 16:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184430; x=1794789230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=mqATGSDgOcyspCGm0r88zz2LKvOBuTSrflTy4G3x+OmZ3/e6m92wx8lwDFbkWU/2r7
         wF4RvcborS48J1HQFsH7E7pQgiQNwsPdfK59/AT1PhF1G8mvFKr+CfuUUZqZjulYaEup
         ouJz/e8/k/DLsRowKga8BFqAZDnPgMt29Cmqfeh1kSkF5wRiiYm0/AlufG1QlkuycLwj
         rEpBeHEkXJziqZintgY94/c64b0LNVR31luc5/F2R95zuMihuSOw0tSRvV08J2itGF5Q
         e6yNkFjWR7cidQVwBnB5dheZp9Tw2HuJb8BECeTsjwwMmrbGM5Ib9dRsZdyiCb151RhX
         5M/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184430; x=1794789230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vT2VNwBxc63eyIezByShTBVkpV/95J6JPEp1UHJT0Ow=;
        b=2jtl1bc1eHw0vOWaDoBbanyDLdSpkAwKdD2w7goRsZ/vDUKLTCxNp4etayMMtHJFUO
         Qv/MEa+SloyN+W3VOV8OQAvHeNmFMefZpSJnaaa+9IZHvxw+vsyhf/33KhSfaMAykmmi
         Mmj7wjhzJQkOVWFyKP7TgUZYnZs//+McqhSozVFe6oV8RuXC3wnYirlzDvWHgxZdWW81
         Ec6hwlzc6gOirmTgBOXgllwciPNRKisxL9Pr/4dvoTphKKqviXhawwydQrLbThj3453i
         2q4u2S7WgdBWY5EsCSDIgnfMTZirUXsufIKQXVYyB28l9NIchVtk9vyTjG9AjtMFDjnH
         ZeTQ==
X-Forwarded-Encrypted: i=1; AL+hErFMSqOuVbScjn1ZVAmnGhbcjbm2FdiXeNJXAZ1X4WH4S9SpK6nz3cSoJcbGlsHuyBr6+uqNI3TgqFBcE6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z/RJq/L9FCQP12j4s9s4gmtfsPYJ8OWm1TbBIQC28A+1R3mPi4P
	8xT26mz+exDILEdR5GeQWU7gv4qjjCG7Cste95/bwblsCY5zkgOmXsLP
X-Gm-Gg: AYBFou3K02DDP8JneRcw3pqzRq1jLTma5YV8i5S3lWOIVgMRxF3hI/TsK+66+BP91P7
	usZIjYSWqfvcdvNa9DLjfUTNT2jR7Z2MTNYhFyA4C9p6kACS049JHMBjiK7AMND3qbfqZGcrVWl
	ouR31yOz0MLTUxdK2reJD1U5PMf7hBUPZP8qQ13IG3sLgDjXA0azt0qC2gR8C8DtHQkbY9nowxj
	/dR2pnovzkJkZrk3C88HGE4cv7Bg2sY3WBBCqkLRx0d8QJHx5AxI5e7sSFaVkK5U9WzG0tlI2k2
	DNGcCi4uBCF2cGwW5i+5nL95dSl7+FMDQqr14l9X5+zHSDcOknQyg0VtwUpulPsarBeQl+OBymZ
	t1RPCORkOVfxRvudxa2dwLJYC6qJlBCKTqNhpegpgqxMb2WrbKKjOL/94xpWL0qMUcKvO0oN13B
	euMiMOTKup2AIzrWxDSqzJeJ7Y/fTozSWszSNcEBmgCquhOPKIU3TY2u+jY/v8KUBUFdKDp/kUI
	LzTT3mM4zGkCcP1235QBoxiAEXWsSH4fGH3wfoY/1YiQZEyCZUAG+612jCyj1B3WohuE5BFaEOT
	+PyrFWQJrojd5V6k2ARix+zt0VSUq0JlI4t0GLuO
X-Received: by 2002:a7b:c34c:0:b0:4a5:9224:fa10 with SMTP id 5b1f17b1804b1-4b8205a7b74mr74612065e9.18.1794184430004;
        Sun, 08 Nov 2026 16:33:50 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:33:49 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:17 +0000
Subject: [PATCH 05/17] dt-bindings: mfd: qcom,tcsr: Add Halliday TCSR
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
Message-Id: <20261109-halliday-dts-v1-5-289114ab8197@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=720;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=sz0jgm6yJ2qfmdfMMgsqR7Wg9ExS4UZymLewfvVCvH0=;
 b=uUjeKsqz31kCcfPZSa8Z47M4B7r1CADYAoSad8joeZDRvAbLwLDkhf9ZDymLvxVoerAVE+UqI
 g/farVtv7C7AYkuFx6U6v9lz+2+4yx0RS/OmA8jjU0ljraJ4I1qJLhy
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the TCSR block on the Qualcomm Halliday SoC.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
index a021e4dea486..e8a681b5e6ad 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,tcsr.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     items:
       - enum:
+          - qcom,halliday-tcsr
           - qcom,hawi-tcsr
           - qcom,maili-tcsr
           - qcom,msm8976-tcsr

-- 
2.55.0

