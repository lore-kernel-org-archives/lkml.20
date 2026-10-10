Received: from e234-57.smtp-out.ap-northeast-1.amazonses.com (e234-57.smtp-out.ap-northeast-1.amazonses.com [23.251.234.57])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A27A3B6BF1;
	Sat, 10 Oct 2026 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624188; cv=none; b=a5qMR+LebU7apILosTn/uQuLIpEDyPtyXzqVnKPlemT6vUcM51L0gI3i2cSLvxr0p5WGhuHU122lZqvZenP+ZRL/bZwmit3sd1w6edx4iyx4QwrbrO2CrmgN+y6MHN4MbBnVbHpXTTWbr8HZj5gbWsmMCO3HtXruI2AJntyp5Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624188; c=relaxed/simple;
	bh=wpxiFPtm+hgso7c1h/Ow7mgJ4iNxMptvuwma7JMLEPM=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=drlXDzEpPTnNa0mPUz1cZO6QibIivQVgaCrQJnxQ485cpY8xIM2EykJZO0w9u24m46E7gGgy0iY0xmdL1uLvfWBIs+Tms7CeE/tuu68Z89LhPkgH+6bahpl71IngpTVVVnHYvheYrdZqTd5nr1ZfPdW/jHZ2+YYn2HC9eRTp7cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=01sJ6wDM; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=DM4Wtutv; arc=none smtp.client-ip=23.251.234.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="01sJ6wDM";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="DM4Wtutv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791624186;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=wpxiFPtm+hgso7c1h/Ow7mgJ4iNxMptvuwma7JMLEPM=;
	b=01sJ6wDMaIB4yAoiKCyVFFHbw8KVzDwcqHWJMVpF3qZMm5ySKyNos8iLC/Z+lvF2
	/ItHv2F8T+NXbpXL7MG3Knwr/VBHgdNZf9eHp51oOiB3oca6qbhjb8JMN3DL5rzszY+
	I3X1r7Iwco4PqQ99Ex5w5PpUfNvGO4i9zHihXZ2w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791624186;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=wpxiFPtm+hgso7c1h/Ow7mgJ4iNxMptvuwma7JMLEPM=;
	b=DM4WtutvWk8v2tS1rPw5vrRD1tkRU/4emvdpEingk1vQo69Hj5bF/o3GX2JZxN9u
	XGa2DrBVmPAhTWU3cvoZQ2yGlSX+j3NnzscTQS+4aWjIq/njvinXTIYxjt8q9Xj8B6V
	y8hi6O/G+uHggUsBYMPKxZ7yvI77V4Qy+aI/OR9A=
In-Reply-To: <20261010092257.768685-1-fqwqf@fqwqf.xyz>
References: <20261010092257.768685-1-fqwqf@fqwqf.xyz>
X-Mailer: git-send-email 2.53.0
From: fQwQf <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] media: i2c: vd55g1: preserve the stream-start error
Message-ID: <010601a1251f8883-b937c171-f430-487d-9731-46c73b3e553e-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:23:06 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.10-23.251.234.57

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
Fault-injection harness:
https://gist.github.com/fQwQf/60bd12627e06b10a=
2fc159e545f85dae/7b21a7d3a1b676a0e4cdaba06168ede09a2949e3

 drivers/media/i2c/vd55g1.c | 2 +-
 1 file changed, 1 insertion(+), 1 =
deletion(-)

diff --git a/drivers/media/i2c/vd55g1.c =
b/drivers/media/i2c/vd55g1.c
index 6f458f611f63451c97c708e187a313cf7b2aab4c=
..78e4aebfdd3b24b867ea4d077dc1b676c4a595da 100644
--- =
a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1178,7 +1178,7 @@ static int vd55g1_enable_streams(struct v4l2_subdev =
*sd,
=20
 err_rpm_put:
 	pm_runtime_put(sensor->dev);
-	return -EINVAL;
+	return ret;
 }
=20
 static int vd55g1_disable_streams(struct v4l2_subdev =
*sd,
--=20
2.53.0

