Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E608E3E3160
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906776; cv=none; b=Fysk2MaR3+Zmt08BeVUvjh52soiuynL+CbWUbVxZiAz48G8xSQqAA2QpcGRBfXRgITNouRky4W5uhp2yru2EyAAhmtFp6owDrrEWoG5PPdG/8qwdFv6L+1GiEaVrR84B3OkdNrFpq3+Q0saa86JZVr6R1K+5hP71lO2LEcDROU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906776; c=relaxed/simple;
	bh=+3+CM583FG4ZzIsftx+jCX3nthFoFjWph9HX/ia5tXI=;
	h=Message-ID:MIME-Version:From:To:Cc:Date:Subject:Content-Type; b=TeerxbGrR8tJtMjpeLpVpc/UNfJ2eEs/WFdDLvcfPRFEVu28zwVwVgmmpVpPyZouDcvWZH4263TkAyV6AApkXBCMblf/VA/IqwNdigdVCK21g0DjBAlm4x7Qhs4bAmNAhZFJPCXX2Wr+h5rSFAtn1boVIU30pTz4krh0HXorKHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CHGxXMtH; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CHGxXMtH"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84eb992a881so822370b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:46:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906774; x=1788511574; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+6qKW8jbCp6CLDtdCf0xBEJmto3LmtgiUcciH8T//Y=;
        b=CHGxXMtHmUd4qxdHK7PZekMNyaikzEMQ/n2TOMuXsmDu8H8Mjsxq7mN+jKDiqqJTtD
         DWiejpsjGV5VsZRf7ROEzPeKKEiSn6v76PBUNDFojjxfCTDmQVo2ysSAn88LcJBfrWbL
         OFiCMV8pM/14Wnpp+mut4b6G8a5a4UmejrsjwQ00yGmMjunVUy3wbes/G1boQqJINsls
         FcnSL8+rrfVKkrTTE6bpN4alcKEdBQjfSGLcDYiUO8pul3hX8chxepEg2/HrDZaqYFoG
         Dj8oaS/cvRuPmw0z0os0JTsDPzHkjAYlDR8YNHRiVXMlBmFyP7mUFLZnJ7HcV3vKdD89
         NKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906774; x=1788511574;
        h=content-transfer-encoding:content-type:subject:date:cc:to:from
         :mime-version:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Z+6qKW8jbCp6CLDtdCf0xBEJmto3LmtgiUcciH8T//Y=;
        b=I6AzTH91qngAM0hKzBELx/JCdfuU2wlZjnPqJLouDtMJ9I4XQJOfxhHnQ4603aA0qt
         6MW25XRHXXQxAF3NCRR9qLdMCdlU+sy9F1jtMnX21mEfuQkyFbPXoXquFKNvoLQFxguV
         tJF9oS9yAdV1ERFdPgkzOGDHKbJa8lF6ov5SnFMktY87Eq1OKJJNemjixRxwuEYBdKUH
         2ypyfbRBeJjwJbC8eIKhsKhzpqBhCyYwMrlifLYZrzinlUBoLliX6IgMy2570bCH/+B5
         B9gbsgsh8xmaX5EITlCkjIcLoXZMRtdNPnn5q/V1ywjac9YNfG+vF63bg0/uIOXIzfTr
         YEhw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+gzyvopYwuBNMLtoOIvQjzwSEuraXi8B4cRBKaZU2pyWDDFTLtpOZdCr8qb31XJ+gpEHMCRYK0FyNA/s=@vger.kernel.org
X-Gm-Message-State: AFuF++nj99I/pNJ8KzbiUclI0M9rqD24GrVBGC5/vJKgXBMqQfocUTHO
	wnaYmuWdFuSaj8X2jnRMuKO018dXyfyG2byvde1gPN/Au+dBYS2u98OD
X-Gm-Gg: AR+sD13f+WUbxInSLROnHMC21rlZqO5Ekd8b1EUbcW8StFiT2/HxUQcPbxEi8WOE8uX
	6yB2xkYKLv6ZFZ20ef7uZtZggCcpAqL+A0F7ElLQ4gnIf3nmyI4Rb0HXDM9LhA9JB1AVDAXjuSL
	5wnDMzHzV5g9DMrq0VqlDX2FtAeoSLw7b4s5NCeC6bTkJGjIMDSU+OyeOCK6tGDeSSUfGAD2Et7
	VuNxFjrbWXdjV/YL6W9qpKrrRCNeyAh7CdtnBn5JZjBwkN3KfDgynMos3L2oZKXp3kwVDjk7VNw
	OZMUVDqNY/IR+x80FFOhtiUHvyIdrwSugaYL9XaaJ3j3W1lkHvxvZUJ/RWXeB+FCEtZDlIq0Bgr
	C3T2dNj7zWG4JZiDQt1hH7RHhsFNCBY/cAeHennizulXmZFqqGCjSMkkIUu98llr05qP1gvfFeD
	INcuzWf58IebNVFivBWmoUTfwlJHJEIrHmLjt1aIdAfws7ESIrz3srBoM2jxdrdC/JSnR5vvg6O
	5UAEA5EDZaAgymYYtZ6zApRoc056mKF8UlnlgWZAzq0wdgnXM4bfDH6Sw==
X-Received: by 2002:a05:6a21:6e88:b0:3c3:a31b:3949 with SMTP id adf61e73a8af0-3d2686a3247mr12224666637.11.1787906773923;
        Fri, 28 Aug 2026 01:46:13 -0700 (PDT)
Received: from manush ([2406:7400:94:7a79:ddde:713d:7785:c4a3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7be440sm4241099eec.7.2026.08.28.01.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 01:46:13 -0700 (PDT)
Message-ID: <6a914ad5.1e1ac41d.2a3f62.4979@mx.google.com>
X-Mailer: git-send-email 2.46.2.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Manush Prajwal" <manushprajwal555@gmail.com>
To: cw00.choi@samsung.com, krzk@kernel.org, lee@kernel.org, pavel@kernel.org
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
 dsankouski@gmail.com, sakari.ailus@linux.intel.com
Date: 28 Aug 2026 14:16:12 +0530
Subject: [PATCH] leds: max77705: fix fwnode reference leak in
 max77705_add_led()
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

In the RGB LED path of max77705_add_led(), the=0D=0Afwnode_for_ea=
ch_child_node() loop over the subled child nodes=0D=0Areturns dir=
ectly on a max77705_parse_subled() failure without=0D=0Areleasing=
 the reference held on the current child, since=0D=0Afwnode_for_e=
ach_child_node() is not a scoped/cleanup-based=0D=0Aiterator and =
expects the caller to drop the reference itself on=0D=0Aany early=
 exit from the loop body.=0D=0A=0D=0ACall fwnode_handle_put() on =
the child fwnode before returning to=0D=0Afix the leak.=0D=0A=0D=0A=
Fixes: 3b6eaa3db567 ("leds: Use fwnode_for_each_child_node() inst=
ead")=0D=0ASigned-off-by: Manush Prajwal <manushprajwal555@gmail.=
com>=0D=0A---=0D=0A drivers/leds/leds-max77705.c | 4 +++-=0D=0A 1=
 file changed, 3 insertions(+), 1 deletion(-)=0D=0A=0D=0Adiff --g=
it a/drivers/leds/leds-max77705.c b/drivers/leds/leds-max77705.c=0D=0A=
index 1e2054c..a5030c3 100644=0D=0A--- a/drivers/leds/leds-max777=
05.c=0D=0A+++ b/drivers/leds/leds-max77705.c=0D=0A@@ -193,8 +193,=
10 @@ static int max77705_add_led(struct device *dev, struct regm=
ap *regmap, struct fw=0D=0A=0D=0A 		fwnode_for_each_child_node(np=
, child) {=0D=0A 			ret =3D max77705_parse_subled(dev, child, &in=
fo[i]);=0D=0A-			if (ret < 0)=0D=0A+			if (ret < 0) {=0D=0A+				f=
wnode_handle_put(child);=0D=0A 				return ret;=0D=0A+			}=0D=0A=0D=0A=
 			info[i].intensity =3D 0;=0D=0A 			i++;=0D=0A--=0D=0A2.46.2.wi=
ndows.1

