Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB7F3126D6
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 13:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788615565; cv=none; b=SUA2sjETlhRRIeqhKImXfhTx78MtjORgCl9upeY1KAfwcdrLd6ZllatRbga8znnKBkpMZbRrj933xf4r7LuR+AwjTqeXJHcMJJUAZ8XL+7EeZqaAm3FXxaZbBp8N1HHDxmA0XjRYKMU51OBTBSMjAl7+lWgQXtkbqAmMmkzi9cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788615565; c=relaxed/simple;
	bh=7Qbzw+Tkhg7HfUq38C0BA0wWTWKC88J0cbC11SZTjPk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l19dyaIL6ARjml46gVyNcT2yaLwc5HDPqhBRUvOi2r7LbW8j3x1y6cPi6cRCwSw+E++yi2sH5TYLVN2uW15qnI+sr1S9g8PoxjHFUw4qWH0a1CqrPFhvRUYzj/uJ39H0//mD3DaTGNAb8AIhZuI1MYc30jHAv0oYLWv8iwQikYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=TICd8S/H; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="TICd8S/H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=gg
	7yGPoxmOER5IO+qS0nz0EXCl4ZbJfKsrGtP/+PZC4=; b=TICd8S/Hf6akrFKnns
	Qzg9Hn3X+BW4if5c3xiO5prSgs19MEXmnHwxLkgVEGtseZOftFi2B50Ly+48XhtD
	0PHv4PvNLLsKmlwVC7hf7umxRL9p7RgoY2GOEHPbKsfBuowPlL4I2ZbpImIMnz11
	tRGU/7X5ltsjqh7epUOIogUTM=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgBH5ABXG5xqgnQWOw--.14941S2;
	Sat, 05 Sep 2026 21:38:31 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Leo Yan <leo.yan@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH] coresight: ctcu: Publish the OF module alias
Date: Sat,  5 Sep 2026 21:38:29 +0800
Message-ID: <20260905133829.65890-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:PSgvCgBH5ABXG5xqgnQWOw--.14941S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKrW7Jry8JrW7uFWfXF43KFg_yoWDuFX_Aw
	1vqF9rZry8GrZFkF1UJwnxCr1fGrZ3urs5Xr10qrZavr9Fvw1fAr4kKrW7Aa18CrWvvF97
	KF4DWr15u3y5tjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRBHq3UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRedZmqcG1ct1gAA3o

The CTCU platform driver binds qcom,sa8775p-ctcu devices through=0D
ctcu_match and can be built as a module. Its OF match table is not=0D
published for module autoloading.=0D
=0D
Publish the table. This leaves the TMC dependency, probe and power=0D
management callbacks unchanged.=0D
=0D
Fixes: f78d206f3d73 ("Coresight: Add Coresight TMC Control Unit driver")=0D
Signed-off-by: hpp.iscas <hppiscas@163.com>=0D
---=0D
 drivers/hwtracing/coresight/coresight-ctcu-core.c | 1 +=0D
 1 file changed, 1 insertion(+)=0D
=0D
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hw=
tracing/coresight/coresight-ctcu-core.c=0D
index 9043cad..a7caa5b 100644=0D
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c=0D
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c=0D
@@ -295,6 +295,7 @@ static const struct of_device_id ctcu_match[] =3D {=0D
 	{.compatible =3D "qcom,sa8775p-ctcu", .data =3D &sa8775p_cfgs},=0D
 	{}=0D
 };=0D
+MODULE_DEVICE_TABLE(of, ctcu_match);=0D
 =0D
 static struct platform_driver ctcu_driver =3D {=0D
 	.probe          =3D ctcu_platform_probe,=0D

