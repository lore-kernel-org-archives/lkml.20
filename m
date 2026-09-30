Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0D73F327A;
	Wed, 30 Sep 2026 07:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790752099; cv=none; b=lkX2H1h7RN9mWufsulRqXyx2UdfxECIMTpgoL9d7C7PS16XwXeIBR+PlMoT37NqtIAFBrSe5MibNU6Y+benxrwxY5boNCiS1u4jiMVyD/C25e9p45CQ1F5RKT40Fe4QZ+PqEjPAMsfU6FJpvjl3YslHifq8dS9geDZQKbUP5TWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790752099; c=relaxed/simple;
	bh=s+VvPl86qMMybr5JWonr/fGmEFEBemXnwTaEkHAY3w8=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=lsKnUVp+v+dotxCVK8p5ruZFstA2JoHS+k+0dPtKns1gN17BUWwobrUbuy4kFStJlyhNCVadGSzaGnMkT77DgSIYejXQWwqDDExNGFXCSpK/fgqIpxifO/ihK660bKSftgzMZPNIwydeKOwlyaLd3pX3q7TSu1cT/Xxeiizw0VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=jfHciTTF; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=cou3JF+r; arc=none smtp.client-ip=23.251.234.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="jfHciTTF";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="cou3JF+r"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1790752096;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=s+VvPl86qMMybr5JWonr/fGmEFEBemXnwTaEkHAY3w8=;
	b=jfHciTTF3/1eAoUPBG/l2a1Xlgxv4A5/QIGUcOsb4TLmX/EFnoeU54RZHfOKAP9k
	Uy2jwldV/7SW/oHvur7ei1bBledDBzK0zKm+lELHuA9+EmC4T6O3C8lfMFCKkhw3eK6
	AB1evSgH6epwx6MwSxDwi8arnuq/0rRwwo2fgBvE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1790752096;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=s+VvPl86qMMybr5JWonr/fGmEFEBemXnwTaEkHAY3w8=;
	b=cou3JF+rsYp9dDpAOacn6aewRfu5mnnC1Orj/PBQXp4qsN8YCRxNoMMvijFSts4i
	z2dEs7GUJ/99JpXtmlRDFPdtiKRWcGXba9LUa2b+Z3ZtXmGhZopwi1Rfp4UPOx4aDc/
	9F3FlP11Qon2NmiyXaxd7/LbiaY0X+5V1fMv72s4=
In-Reply-To: <20260930070802.102127-1-fqwqf@fqwqf.xyz>
References: <20260930070802.102127-1-fqwqf@fqwqf.xyz>
X-Mailer: git-send-email 2.53.0
From: Jizhou Tong <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] media: i2c: vd55g1: stop streaming after an
 exposure read error
Message-ID: <010601a0f1248046-1374feb9-edb5-411a-aa6c-65aa27e01b52-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 07:08:16 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.09.30-23.251.234.50

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

Fixes: e56616d7b23c ("media: i2c: Add driver for ST VD55G1 camera sensor")
Signed-off-by: Jizhou Tong <fqwqf@fqwqf.xyz>
---
Fault-injection harness:
https://gist.github.com/fQwQf/60bd12627e06b10a2fc159e545f85dae/7b21a7d3a1b6=
76a0e4cdaba06168ede09a2949e3

 drivers/media/i2c/vd55g1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/i2c/vd55g1.c =
b/drivers/media/i2c/vd55g1.c
index 78e4aebfdd3b24b867ea4d077dc1b676c4a595da=
..c0839593460a55d4ef91dfc85e0b9b476fbb34d7 100644
--- =
a/drivers/media/i2c/vd55g1.c
+++ b/drivers/media/i2c/vd55g1.c
@@ -1190,6 +1190,11 @@ static int vd55g1_disable_streams(struct v4l2_subdev=
 *sd,
=20
 	/* Retrieve Expo cluster to enable coldstart of AE */
 	ret =3D vd55g1_read_expo_cluster(sensor);
+	if (ret)
+		dev_warn(sensor->dev, "Failed to save exposure: %d\n", ret);
+
+	/* A failed exposure read must not prevent the stop command. */
+	ret =3D 0;
=20
 	vd55g1_write(sensor, VD55G1_REG_STREAMING, =
VD55G1_STREAMING_STOP_STREAM,
 		     &ret);
--=20
2.53.0

