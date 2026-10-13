Received: from e234-52.smtp-out.ap-northeast-1.amazonses.com (e234-52.smtp-out.ap-northeast-1.amazonses.com [23.251.234.52])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1A6476CDC;
	Tue, 13 Oct 2026 03:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861050; cv=none; b=dQTNkEFOAC3Y8pzN58SpQl5BOBL+du7BqxBiMgGLYm7dRCWfPc8y2NWdbazZBLcjh5g1qB/RfiWHXbmzpOCOrS/1drumBMMjTaDdAFO05QF28RZI0K1JrDoi86/3UXpYjeCUZAzUdCgimPtSm16qiMtLvCFMhRXlws+MGUP80hQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861050; c=relaxed/simple;
	bh=p8ZBzczcPDukaUrfbGAGk8bPt973EVeT3VqpSzYuBx0=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=YYpgBrzHQJw7aHgRztNHptKfzJKw5apwOefCC8QLNkbVTEFw/TDLQFgRw5hKXBBy1w59eg+e75PFavtu92aleY2j56EnFQ3a77TTcmViYMEtxRglkM4euK/smq4SU0fUlOnC/u2cIeRPuXRxRoZNQnTJUQ14I54y8Pysd2dQ7+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=XXUfmJye; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=CSlv5xP7; arc=none smtp.client-ip=23.251.234.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="XXUfmJye";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="CSlv5xP7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791861048;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=p8ZBzczcPDukaUrfbGAGk8bPt973EVeT3VqpSzYuBx0=;
	b=XXUfmJyeJFOV7gwo4rd35L9DVLOgvj1WKGGCtS4bvxj//BvzZsyenZD/cxpHk6/b
	i+0bnfrhTMK/NGGXVoYZSvGYcs0PvQmnGt197s+XNWqObc0u98p173bYgR0Z4qBW3cr
	e4iy+a41mX7IMto9uGgfUJIX9sSypzV5Ptz9Cqd8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791861048;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=p8ZBzczcPDukaUrfbGAGk8bPt973EVeT3VqpSzYuBx0=;
	b=CSlv5xP7W+YUK1gLOYLmgh/Rps/LE44AG8MibZJ7MwQGYopHkdlX5lcMdFo/jl8c
	/SZwSRHickKGLZAvstUFtxM8BUNgyQmkQY+MOp8FxEgDq+dVQgzzy4jPax7KuR/pIiM
	CDS3XHM6iSJVNEPnFbfxOLa1al9ks8Ax3ttH5nFk=
In-Reply-To:
 <010601a1332f1462-5fb80a97-80fa-4d49-bed0-555152da0354-000000@ap-northeast-1.amazonses.com>
References:
 <010601a1332f1462-5fb80a97-80fa-4d49-bed0-555152da0354-000000@ap-northeast-1.amazonses.com>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] media: i2c: vd55g1: preserve the stream-start error
Message-ID: <010601a1333dc2ae-f24ce995-a0a2-4d38-80a6-43a3696713ef-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:10:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.13-23.251.234.52

The stream-start error path replaces failures from register accesses and
sensor configuration with -EINVAL. This hides the cause of failures such
as an I2C error or a timeout.

Return the saved error after dropping the =
runtime PM reference. All
paths reaching this label already set ret to the =
error that triggered
cleanup.

Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
Changes in v3: no code changes from v2.

Fault-injection harness:
https://gist.github.com/fQwQf/60bd12627e06b10a2fc159e545f85dae/7b21a7d3a1b6=
76a0e4cdaba06168ede09a2949e3

 drivers/media/i2c/vd55g1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git =
a/drivers/media/i2c/vd55g1.c b/drivers/media/i2c/vd55g1.c
index 6f458f611f63451c97c708e187a313cf7b2aab4c..78e4aebfdd3b24b867ea4d077dc=
1b676c4a595da 100644
--- a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1178,7 +1178,7 @@ static int =
vd55g1_enable_streams(struct v4l2_subdev *sd,
=20
 err_rpm_put:
 	pm_runtime_put(sensor->dev);
-	return -EINVAL;
+	return ret;
 }
=20
 static int vd55g1_disable_streams(struct v4l2_subdev *sd,
--=20
2.53.0

