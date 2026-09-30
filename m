Received: from e234-52.smtp-out.ap-northeast-1.amazonses.com (e234-52.smtp-out.ap-northeast-1.amazonses.com [23.251.234.52])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CA53101D0;
	Wed, 30 Sep 2026 07:08:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752098; cv=none; b=lGjR2qetS+9VxDibZtHGpWE3pTjRkt0TvivKZMWHvnzrIKeM+bq+jKLBH7VrQlsDHlSXd8U232bPAIeNYjmfvPl+MxjuBXBrvLiQnr+ZZmOS8/jHWsi/NraH3Dz8iqxXcKd9krwl40QAkMzn8cr/27JW2tI/YXhG4pdHOqrUMfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752098; c=relaxed/simple;
	bh=vuuj/IMDXQsN8W4nA6Gfi7PIV/dfOhfdQQGMxNontHY=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=ccUY9e4HeCrw+jFoUC+byDHnR9XKto8EC5f39BwxICziJC4FsDae5sx8f/PuFykUKIOGxDAoiwvBFALUTJmpj0BfI5bEf5Cx4Gp+Blyl8uffrVNMVXUpicgyZvEowKwy2f3ypQao/skKS2Y6sMBTRN0e+xQRFl27FhDYKIxZ/Xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=MLhrnhe0; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=rqzRm3RG; arc=none smtp.client-ip=23.251.234.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="MLhrnhe0";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="rqzRm3RG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1790752094;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=vuuj/IMDXQsN8W4nA6Gfi7PIV/dfOhfdQQGMxNontHY=;
	b=MLhrnhe0XE4F+Y26XtjtwXxaKN4xfVt0xVXD3wWPQTHZUGHn+qJoPfPazRC7kyZb
	99wEnk5tMe3xY3PrNoPPPS46Lb0BdEifnWLTYaq8GmkmYEccnTEp8u8WcaAvOOYJPKp
	nvcO2wHz4CmLL1JT3iXlv714AYuOCYuMIK6JiKbI=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1790752094;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=vuuj/IMDXQsN8W4nA6Gfi7PIV/dfOhfdQQGMxNontHY=;
	b=rqzRm3RGpJK8rVbdUUTJt1WakGykvc4nSuATDBeDLJ63aNuKuAbO2tLlfTSlStII
	4LRcYgtvBfNZyz5YeWBurASPuSUodsMaygO0tbX41bzfHu8htcSfYFIXxEVsGkEsEeO
	KZ+LGhhevvOkMpf1THrHTJ0OX+NZ6ULbEZBudX6U=
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930070802.102127-1-fqwqf@fqwqf.xyz>
References: <20260930070802.102127-1-fqwqf@fqwqf.xyz>
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] media: i2c: vd55g1: preserve the stream-start error
Message-ID: <010601a0f124796f-bedf55eb-df52-48e1-ab13-f59cd2dea8e0-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:08:14 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.09.30-23.251.234.52

The stream-start error path replaces failures from register accesses and
sensor configuration with -EINVAL. This hides the cause of failures such
as an I2C error or a timeout.

Return the saved error after dropping the =
runtime PM reference. All
paths reaching this label already set ret to the =
error that triggered
cleanup.

Fixes: 5931eed35cb6 ("media: i2c: vd55g1: =
Fix return code in vd55g1_enable_streams error path")
Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
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

