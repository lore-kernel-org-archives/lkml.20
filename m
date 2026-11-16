Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864302;
	b=iK9KuXagMPksJJ7giitC7Fmz1AUtCUGx4+rUM/1vpQuSEajAQICmaEB6/fNZSCParLdY
	 FIUn8T2BB0eeJ3anvFW79jIUSzKia64FNqMFRMJeKaGk16foNv74ffOWbau/AaolWJ+fC
	 jRhYv3tjgDIMHFw3Lwm8d5fsAoeMrReez/ITTm9eFHDE4C1+SiZYl+l9cEoh/B3pZrr/f
	 kCqSfH7xrCzZ10OXIK5BkD/HHxB4pkBwyzNH+0kL17HjC9pmdpLn+nezK9XoGAir0PWU3
	 5p6DNzcV1IHKQXtceQ4gHkpcG7d9PFnu+b9jJQuiOjU/gf3Gr4NfK/DNrV47ANaDwSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864302;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
	b=5VkJPPKZ809O54D5/y9No1ARkj/RVgwRl+hTxcDNnv2Wrb4CEuKgli29nJ3Ux/75AOdA
	 t4UKMjwH5v17bWkHkXgiSosbJ8rfmZ2wWSiklZHSfjmJxRNMZxt9FM+CzFZbWH5XhUjSZ
	 IvCohUFq6RCN0R94A30RpyxvFnhdCZHWP/ukluojw25Rwp0THoUmWfitnWEfxjSL8dKsv
	 ru9QLRFeyiFiOHtw/ppkCJdE18bYb4gwYGP2fBWEtiQGoI1+mvlQqf8Bf6eDLcvxIejtO
	 ++gPTdOUhLuumwaJ1BkYGAwltZnIAmSQLToX3OpzKH/ar3gSiFEggnmsSYJCTs/bT1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0aKjn/XL";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AA5606A334
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:25:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73AA5606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0aKjn/XL
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so14711235e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864301; x=1795469101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
        b=0aKjn/XLzFlq+ouSLmTYWiErYU4NZycee0SYeWHS9aLIe0k27WBTRX6PuWRoYn4h/w
         osp9TkJMyV4e5+eYgwb/9Uc/gLhNZxiGr/cttH5JB23s5talTINxpiOqouDaU3q7DwXB
         mwpU6hyeU/LjWu661kwdEwa8YWFnc3lth2ve0Sqe0d48lh+EH/wFJLkFUox+m6kZw0dS
         J92PxdfemEiGhqmuVA2SNm3IqPkf9BqTxF/YNUaHrDdDhx/nSjKqb0Hx0eq6ATmkC5Rf
         fjAx65WnzMYxrFtCFvtUBlwnbLTSo3jUeZRGoWgkIs6XsEOOy781KWog3D0urTndgUMR
         VDsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864301; x=1795469101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S29Bz2Ne+XPBujKOM8xk1WUI0xBpcjEJIagUum0EBnE=;
        b=UuXsL5jAFxuIruv0o7w5vIH7GSxMl0lsdYH14VpB6TjTO5DllqozFtLupHgAc32pPH
         a3xQLanEcvK2nEoPlhsYS86eBOifuHIEVQUNhwjz1ij0zIM4tDLNFd0/lb/KAvSdeSaL
         wv+gBEXvZcmaUIt/S+dDJkC7Q0lb/ei+Fq4fmGNQmq1tJpvHAIofOgvIbGZt6gSKpGpP
         TmCQDQmcP8u73HonyatxCju5iCcBWIMFSuQLRJa0vvX/+K15Pu5CvFsWLYvRlG9fNVpL
         wsdjJfeJF7NLlZ21FyjtQ+kQ+FzzEYI8lKlUknn3FvMRDO2YByzTLQKiF/Wo+VgOkniZ
         XM6A==
X-Forwarded-Encrypted: i=1; AL+hErF/opce+fYIfqWgGIBz4eDk9SmYLTjKJUR8pGwnlYkNs4nCuJrs1iXcFq8TG5mr6akeFXo1vXX43PAOLFU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+m1jMbcnrekOPz31leL7unKEnAtdUpIKLtOzllAaiJsZv/OcZ7
	+aw2VNprn/I3DH1oXTOawcwHIMRshFAFieP0RNZ2+SpuBxw0qcrDLqE7
X-Gm-Gg: AYBFou2Hzn5lxBqA94fJcAMSlx0QszCWqQjlQJv6aGSc8DH3NsUkwaabKtlgaukEgT7
	JgmE2rAM8Ovgd1FA+pglSyRbbtx10uaNB6fvF+swOXzCVPLlnQisFApiqFWLI0y2/239aPg3fS8
	Bq2eVn6ppNKSuuOn4YJwPCx+sJtC4jIWsVHAlNI3DrqO3ZpSQ07yHItFLh7/+FTqQsnE9E1gHhC
	eAxDEhnGX5vvaOI08o39MaNnmYqkrcIJAHu+1FbeE4zt0w15WMMxMOfOXCaB9gKO8OxLjJkn8YY
	P07mGkuWD0TX7kWlJBw/fmVp+vpPZF4otdNgD/KIgJPdFQ/XsvJ9tT1iD3ySPM7mBq7ZV2sEx9y
	OcR98wsROtwSgJQm91rk+gPAsr95ir4lGfoLsWutYW0c4YZxMFa6NCTUI6yCNWtKQiEAabO9SG/
	Ky/xf571IKaGJvxXtVPjaXAtkmtHkSyUaWoSb49V2LuUYU5iE15ho3NGl+AdRRGHLNcZvurAB58
	3/4Rp5Oo55t3JRrIzhR0pyn6bPLgBL6yHOb00r4aj5r4rNd7ncQW1KBUKZ0D71u5Hhr44vg2/dD
	C2nkvmOzm79g9tOCSHuTo2JP96pI0NZNEh594lEl
X-Received: by 2002:a05:600c:4e13:b0:4ba:38a9:85e3 with SMTP id 5b1f17b1804b1-4bb55a47fabmr248067435e9.12.1794864301100;
        Mon, 16 Nov 2026 13:25:01 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm61928305e9.1.2026.11.16.13.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:25:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:51 +0000
Subject: [PATCH v2 2/3] dt-bindings: interconnect: OSM L3: Add Halliday
 EPSS L3 compatible
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
Message-Id: <20261116-halliday-icc-v2-2-6df8fc0e0620@gmail.com>
References: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
In-Reply-To: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864293; l=917;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=wd90pl7MHpq8clj67rbDiWzxPjA0DsOg6ijADlg5gec=;
 b=pz/bm+cpBSVda5rEAkb9kL+2qT3hhvKvQmxholpBFeOsC/Cid0Qv8sM1w+T+AtXgxc4c8y4H6
 3jNx4bfGNe4DUgR0PLStj8HXNjGipU5Am3ti1DyClnFNFIdI5YKWoXd
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the EPSS L3 interconnect on the Qualcomm Halliday SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
index cd6685683bab..6c3475005a35 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,osm-l3.yaml
@@ -31,6 +31,7 @@ properties:
       - items:
           - enum:
               - qcom,eliza-epss-l3
+              - qcom,halliday-epss-l3
               - qcom,milos-epss-l3
               - qcom,sa8775p-epss-l3
               - qcom,sc7280-epss-l3

-- 
2.55.0

