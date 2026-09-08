Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98168595747;
	Tue,  8 Sep 2026 20:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788897840; cv=none; b=eXBsPxVHvZHHAFRG3VcMapflJxXs7ZO/J3qfh75pY/veSHR1DFZDUeK8Eey+LTInmduLhJMRumEOptF5+es42MSrVD5SC5myXMd866jjMLfDHcXfpuXw2sPENigI7ZNGUkVWqlXFvqsM9FIa9c3Qlucpj/rk7K9wX5SmITvO1Xg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788897840; c=relaxed/simple;
	bh=yQk/3LLnSNuDdY6idqNbnHriDzzRXxc7ZmuAgsGzVDw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g2cNP7CIqphioJDKKyer4O9VQb+DGqPlooYTbBKD7krCCTJTarIGHTHFwW6JYPkJ6QoiA7zDAQoxnv9VU46+5dcvIhGOJrsdayryWcLkdBtIiJLB6YwmfkfiGiUBx88RsSIxomquErLeFFKKv8utoNgSA+ydl1+zSHr5nvWIs8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=BUK8RQOn; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IjxBmMlJ; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="BUK8RQOn";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IjxBmMlJ"
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id B57E5EC0187;
	Tue,  8 Sep 2026 16:03:57 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 08 Sep 2026 16:03:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1788897837;
	 x=1788984237; bh=3JImWNChjLHr5NNBrC/HTM5lPxR7o7hgTk1HeoiMGQY=; b=
	BUK8RQOnuaS1dc89dk10bzA0eEhf6OPnfaceToTmiF/vlvM780ABZ+b9M3PQl0LU
	/H+IxxkAw9t+daI4DjqmCQfy6Q7WjFNhuL3BbCvUqvgojz9zkkQd1SgqQwfpl9Xw
	DdsB2WFxqiMaaHby8e19aRzc9vF0yaKJx7aUvqpbnqiGiVcSkdQpyEVN5XYtQO9w
	RJ1jAK+iekPMovnriIvKWmRbg+R05Zmbj30yuSHii1norvkX8l6vh7m9H5Wp0Kg6
	qRlA1AZwloyOsFVGQPIJqCgvF+4zLdmfllrnjCdRwc10vVcmrATNOcu8XZ5ScD0L
	Z0AuTIPiLvcjupCk/2EH5Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1788897837; x=
	1788984237; bh=3JImWNChjLHr5NNBrC/HTM5lPxR7o7hgTk1HeoiMGQY=; b=I
	jxBmMlJFYBjTeiKvcqgldYFhtd1T/GreTTKo0TJ6SplIzBx8t+IdvAP77CQ/q+5U
	N/YABS8GcuFdEHslPJEZyQHvYA9vOxxyVVJyA0EusRfr9R3Bu+pPxnpcbt2DR0rW
	cjcfCpOgnxFkMCuefhHQnUEnmcJ0FjRFw70vA+UiUxHEFRVdCMwghNC4bBe3JO0p
	Urbt66Zpe2+MEhmlWwHEgFaIsaUGudlFSL9HMycFeeu+KmSfz04OQ4n3Z/RI0N7k
	17uoIOskjcu7pm7DuFMisk0FNZ05PLmfMWa9SnWi/tlLOlWWaW8FNJksWVZ5GPLT
	rlm3iZp97Yde90dqmwXRA==
X-ME-Sender: <xms:LWqgak6x5rSWimO5VCUL0CmyvNZfDPI9SkRswEoAS6-uIaTVTYx7Mg>
    <xme:LWqgaj3aprdP6flZri0IjUCo1NqTSx1IxfN1LUz9yB1b4O0_kwuoRMi6iBiqr5Cnn
    ZF29dGprjYtvCSQ7LctzLuXDreOHgRhGL8XSolOPg8gNbNCxr5ZoQDL>
X-ME-Received: <xmr:LWqgalz7yidBkAEkrQqRBLKqUIesqdcnALyXnS-rKRAt3KW5ZVd6L7X-sZV_WpMcQDrphRiGAD7QgTQdpmmxOV4jk9TjnfE>
X-ME-Proxy-Cause: dmFkZTEBy2eHQpvq/s+2ql84fEWy7qMHtdaZUb0eeNJD/nFyuYHB54yg4RsApO4enuVktZ
    TqqSz+ukLKAq1qmf6DggrLSv1nAK5QSrN+Oc/CfYtr8VlDddE10kpIOgDcGHpl/IyHPrnh
    QzY/8XxVrY+ZGNJTuVLtxiEgy05jgKYHF6odblr2EYYLjhKP42YNOLBXDp2ZJ93DG3Wem5
    5EerpegaXRdJg2/nvh7Nblh2ohytpyrI9a9oses6Ic1lQX4FgOvbyB7ekql/h95a2SjPJx
    XqhafUIU8fRCY+Z2OhRhE2dVAObFYYR3vPs2xlkrhzQApu22Dv+K4PYr9vjodUzSArIcRM
    ZhjyJJHumSwQlCv2NQetPm3ByHvkI1yZtHCLfLwpfZkZ1oJQvhhAOTtZJzpsRoqtgSgjc9
    uvjzd3BbrwJH6vDlee8zMOBXnbEuWDdvuu3y254VZqrILX/SIiLTWLuMBpfGPL1OW8eSb5
    KSv7jYvLhwtS7PXTsFiE58C6LvsBQA8U9gZ/HLXoQJMb2AyOE1CU3xvxaTzx4c9idnMgwH
    TE5ZsyuTtq4lt/KoSFEWjgTeXiKAYCxLJBTUSbiPIH7c5rXdJdpexBduq5wAzQhPplIO0c
    7oFA6h6wgN1lSmkAiEiEz6FOH+WyMOErKxPfeyk1xs+rG0S/lyMkP6S5uttw
X-ME-Proxy: <xmx:LWqgatsI1Rgw0OhTJs2O2Dzbx2mx0WVAocnKbuISxD9YragSC_QA4Q>
    <xmx:LWqgavz2evCy7vUTrQH0Eo7NQ3aK2DPu3MU4HIh_nAkDQ3r7qP4ITw>
    <xmx:LWqgaoBgB30skPFV8dAft6Di3JOrcGi7pQ9kPPqbEEZaRWdVGxzznA>
    <xmx:LWqgalc1B2LnukZjjjgoPOh9qRJwD3L15WzbphXI9GKEJMb8hEQONA>
    <xmx:LWqgahZOtcyQJcIhdUvwheVTSAaFNUl46qFHyMBjs6llTE9J6rbjo8-B>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Sep 2026 16:03:57 -0400 (EDT)
From: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Date: Tue, 08 Sep 2026 22:02:56 +0200
Subject: [PATCH 1/3] media: uapi: Extend bayer media bus formats table to
 28 bits
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260908-v4l2-add-raw-mbus-v1-1-6973bffa5b80@ragnatech.se>
References: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
In-Reply-To: <20260908-v4l2-add-raw-mbus-v1-0-6973bffa5b80@ragnatech.se>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=12378; i=niklas.soderlund+renesas@ragnatech.se;
 h=from:subject:message-id;
 bh=yQk/3LLnSNuDdY6idqNbnHriDzzRXxc7ZmuAgsGzVDw=;
 b=owEBbAKT/ZANAwAKAQm0/3kE+U0kAcsmYgBqoGoowD++QzsrHvGwC1PFl8Ox/L/WlfK4W0yj4
 ukJw/lPhPuJAjIEAAEKAB0WIQRwy9J0OLNPX3a0+3gJtP95BPlNJAUCaqBqKAAKCRAJtP95BPlN
 JFbJD/j9kekOVCeAJneYh+c8CDzNv0gjeFS58/pOKcr/6+cnjckpCZO85009Sn4LKAc/LTr5ssf
 3oM0Mn0hnn34dt5E7JNC4TEWoL8kEsAmRdMVE4sZcRztgJcqQGTbjQYV/iHpjKcSRgDDJVecXXx
 0SZ2nZAsFC2PveP0sAr6na3IDuJkhnaUoajeb/Rivq2nw350+nYEFYJNNzvM5u8GU41g6gbkGeW
 fkHK68+w9uG7mUtpS+DrKib2UP599OiGVZ9WvIu8Cp5Tbp5N9M+7ma0FdeA2Lt5JI4l3qy88kQS
 PI8akwq8cXKDAaZvlbJdXFuH24IFFtdyTj89fHw2aS+zMiTFQ2DCzXVS4Mdsxn5S3s7Sgl7/0Dk
 M8+4z8jooyd77CDt1HqwCMAh5ImHzdgl8X1xkvUi75EPAJ+7UtFv25l3FrK3u+qlSU4q7zbfA3Y
 TH17ZoXGRPeOMw0AeCZ7fTMbhuE1bnNinBdAGF6cPzUtVN3rrWZcHuoDr6oVGrUt+Knbig+OSNs
 GOTcC0Am9odkp7NVuqS+53kVlxAVdNexspmjaClEcNMj5kOrTjgTFMtCdVaSlUjTRoj7h2k5oDy
 HS9+BMUDKjP+YqD3ojReTkPRRN7kdKGeJBxB7RDfaHJ5RqNI2JPWdHGnq3hyL8a3OllfsB5FvE2
 6XJ0kGZUjEdRi
X-Developer-Key: i=niklas.soderlund+renesas@ragnatech.se; a=openpgp;
 fpr=9976695FE98693307BF360A2F1591ABD9588DA5F

Prepare to describe 24- and 28-bit media bus formats by first extending
the table and existing formats to cover 28-bits.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 .../userspace-api/media/v4l/subdev-formats.rst     | 332 ++++++++++++++++++++-
 1 file changed, 330 insertions(+), 2 deletions(-)

diff --git a/Documentation/userspace-api/media/v4l/subdev-formats.rst b/Documentation/userspace-api/media/v4l/subdev-formats.rst
index c9999b929773..892562ab48de 100644
--- a/Documentation/userspace-api/media/v4l/subdev-formats.rst
+++ b/Documentation/userspace-api/media/v4l/subdev-formats.rst
@@ -2821,7 +2821,7 @@ organization is given as an example for the first pixel only.
     \tiny
     \setlength{\tabcolsep}{2pt}
 
-.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
+.. tabularcolumns:: |p{6.0cm}|p{0.7cm}|p{0.3cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|p{0.22cm}|
 
 .. _v4l2-mbus-pixelcode-bayer:
 
@@ -2834,10 +2834,18 @@ organization is given as an example for the first pixel only.
     * - Identifier
       - Code
       -
-      - :cspan:`19` Data organization
+      - :cspan:`27` Data organization
     * -
       -
       - Bit
+      - 27
+      - 26
+      - 25
+      - 24
+      - 23
+      - 22
+      - 21
+      - 20
       - 19
       - 18
       - 17
@@ -2875,6 +2883,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -2900,6 +2916,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2925,6 +2949,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -2950,6 +2982,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -2975,6 +3015,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3000,6 +3048,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3025,6 +3081,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3050,6 +3114,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3075,6 +3147,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3100,6 +3180,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3125,6 +3213,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`7`
       - g\ :sub:`6`
       - g\ :sub:`5`
@@ -3150,6 +3246,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`7`
       - r\ :sub:`6`
       - r\ :sub:`5`
@@ -3175,6 +3279,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3198,6 +3310,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3223,6 +3343,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`7`
       - b\ :sub:`6`
       - b\ :sub:`5`
@@ -3246,6 +3374,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - 0
       - 0
       - 0
@@ -3271,6 +3407,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3294,6 +3438,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3319,6 +3471,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`1`
       - b\ :sub:`0`
       - 0
@@ -3342,6 +3502,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3365,6 +3533,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`9`
       - b\ :sub:`8`
       - b\ :sub:`7`
@@ -3390,6 +3566,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3415,6 +3599,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`9`
       - g\ :sub:`8`
       - g\ :sub:`7`
@@ -3440,6 +3632,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`9`
       - r\ :sub:`8`
       - r\ :sub:`7`
@@ -3463,6 +3663,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`11`
       - b\ :sub:`10`
       - b\ :sub:`9`
@@ -3488,6 +3696,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3513,6 +3729,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`11`
       - g\ :sub:`10`
       - g\ :sub:`9`
@@ -3538,6 +3762,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`11`
       - r\ :sub:`10`
       - r\ :sub:`9`
@@ -3561,6 +3793,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`13`
       - b\ :sub:`12`
       - b\ :sub:`11`
@@ -3586,6 +3826,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3611,6 +3859,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`13`
       - g\ :sub:`12`
       - g\ :sub:`11`
@@ -3636,6 +3892,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`13`
       - r\ :sub:`12`
       - r\ :sub:`11`
@@ -3659,6 +3923,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`15`
       - b\ :sub:`14`
       - b\ :sub:`13`
@@ -3684,6 +3956,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3709,6 +3989,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`15`
       - g\ :sub:`14`
       - g\ :sub:`13`
@@ -3734,6 +4022,14 @@ organization is given as an example for the first pixel only.
       -
       -
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`15`
       - r\ :sub:`14`
       - r\ :sub:`13`
@@ -3755,6 +4051,14 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SBGGR20_1X20
       - 0x3021
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - b\ :sub:`19`
       - b\ :sub:`18`
       - b\ :sub:`17`
@@ -3780,6 +4084,14 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGBRG20_1X20
       - 0x3022
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`19`
       - g\ :sub:`18`
       - g\ :sub:`17`
@@ -3805,6 +4117,14 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SGRBG20_1X20
       - 0x3023
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - g\ :sub:`19`
       - g\ :sub:`18`
       - g\ :sub:`17`
@@ -3830,6 +4150,14 @@ organization is given as an example for the first pixel only.
       - MEDIA_BUS_FMT_SRGGB20_1X20
       - 0x3024
       -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
+      -
       - r\ :sub:`19`
       - r\ :sub:`18`
       - r\ :sub:`17`

-- 
2.55.0

