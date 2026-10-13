Received: from e234-56.smtp-out.ap-northeast-1.amazonses.com (e234-56.smtp-out.ap-northeast-1.amazonses.com [23.251.234.56])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DCA1384242;
	Tue, 13 Oct 2026 03:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861051; cv=none; b=K2amqxDKFsabb2k57udg0gen4+lnXwNT6V+5PFmiQ2Q19WEhoqn5KZ1j2KhbMl1Kxrlurw/RRAsqCrhe4J2lik7cAzM4SzJAl4QJpTYAvYgycfK03XxIgQBLLHUMtZ3GesC04gkyd7WTBo4BYELHlSFUHAE6g60LlwqazEJHM4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861051; c=relaxed/simple;
	bh=MrXWUWSvo73LMkspDB6vAj/3AvDcGyYphjyUE198DMQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=a2eREZ8YN9izS61y7p6uyeqoU0qUqPyodD0Nv/xrKHqFL9fiWCOMyO+Pp6bwmeUV4O7qM7pSrydF76JVrx3mW2gbabyOv9JS1NCU4ICHhnHKdEqIbRDN3jfJwfNucDs38BbSoAOyjEXGXGcsqlCCMCQYpgLG9M6XEC5JEXdS7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=S06JgioF; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=cvbCbXMW; arc=none smtp.client-ip=23.251.234.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="S06JgioF";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="cvbCbXMW"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791861049;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=MrXWUWSvo73LMkspDB6vAj/3AvDcGyYphjyUE198DMQ=;
	b=S06JgioFwkWQNpYZ8hfXjL+xjKDIcD3ThTHf8jdvKWLvgpzq1+mLmOlvWywd2fDZ
	9J9XAktqxMs+st1wKc0K8O7zohWsY5pf7+Fm29LSsEhwaHhj9GceAcMkQF3rQqz4GnT
	v7G5Gaymd4htnyU6u7B1xlYOkn3FcXHKzDDN+/qU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791861049;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=MrXWUWSvo73LMkspDB6vAj/3AvDcGyYphjyUE198DMQ=;
	b=cvbCbXMWDgYIEhbk/LmWHmF9Fhw90B4/OzfOsS1yWWmfRGYry0hH7i62rSSnunMl
	T7tO+1A1Q0ePX/cVFBozBNAGqfYI76MCh4hZ7g0DTN13SK3jMrlfUSWpc3GDtLllSyO
	9oUSjtmrZDgj55KpCgA+aE9xmYCyjX0zlI91ZyA4=
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
Subject: [PATCH v3 2/2] media: i2c: vd55g1: stop streaming after an
 exposure read error
Message-ID: <010601a1333dc788-a5673ae3-b4b1-44a3-b10e-9698fc58f2ea-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 03:10:49 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.13-23.251.234.56

Stream-off saves exposure settings for the next automatic-exposure cold
start. If that read fails, its error is passed to the subsequent CCI
operations, which skip accesses when the error accumulator is nonzero.
The sensor stop command is therefore never issued, although the runtime
PM reference is released.

Log the exposure snapshot failure separately and=
 clear the accumulator
before stopping the sensor. Treat the optional =
snapshot failure as a
warning: a successful stop returns success, while a =
stop failure is
returned to the caller. Completing stream shutdown takes =
precedence
over saving exposure settings for the next start.

Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
Changes in v3: reference =
the CCI error-accumulator API in the
stream-off comment. No functional =
changes from v2.

Fault-injection harness:
https://gist.github.=
com/fQwQf/60bd12627e06b10a2fc159e545f85dae/7b21a7d3a1b676a0e4cdaba06168ede0=
9a2949e3

 drivers/media/i2c/vd55g1.c | 8 ++++++++
 1 file changed, 8 =
insertions(+)

diff --git a/drivers/media/i2c/vd55g1.c =
b/drivers/media/i2c/vd55g1.c
index 78e4aebfdd3b24b867ea4d077dc1b676c4a595da=
..e78835f014e65bfc2b3dcc2aaee7b054fb5da390 100644
--- =
a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1190,6 +1190,14 @@ static int vd55g1_disable_streams(struct v4l2_subdev=
 *sd,
=20
 	/* Retrieve Expo cluster to enable coldstart of AE */
 	ret =3D vd55g1_read_expo_cluster(sensor);
+	if (ret)
+		dev_warn(sensor->dev, "Failed to save exposure: %d\n", ret);
+
+	/*
+	 * cci_write() skips writes when its error accumulator is set
+	 * (see include/media/v4l2-cci.h). Start a separate stop sequence.
+	 */
+	ret =3D 0;
=20
 	vd55g1_write(sensor, VD55G1_REG_STREAMING, =
VD55G1_STREAMING_STOP_STREAM,
 		     &ret);
--=20
2.53.0

