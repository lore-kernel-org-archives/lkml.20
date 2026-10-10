Received: from e234-50.smtp-out.ap-northeast-1.amazonses.com (e234-50.smtp-out.ap-northeast-1.amazonses.com [23.251.234.50])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3683C3CCA13;
	Sat, 10 Oct 2026 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.234.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791624190; cv=none; b=gwAvGid1pg50S+GpNusTomSEJC4Rm3UAQTYx4b6IkEw0UlTEvu0qxsbNPL10l6qCTreYKrlG17QMC7FLFmMgdQnGn2CHZGhK40C+dFlfV7p+1ka+rCKZSv1rWCMPW1X2/VHETp+r7pqp9JOJdLJXDLArSJkjgwbZaeHJpWOTlFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791624190; c=relaxed/simple;
	bh=WcS12FKrdlFSIcQ4KMS899yzlWjA/PYmc+UZ1jpVTGI=;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Date:
	 MIME-Version:Content-Type; b=HKz6/JeWxziZsRz1/mrS+TdGLTaEhswPHJFuPGpUa0EZ/pMT9buszZ+o98UdAC8iqMxoh9JAzA2ZGeTyFgTccmPcdszfM9TRYtY6XeZxsHfynMVR1o99OYx892UF6y24wPIc1P1aJahJTY0daciGf2MefzQGCXOfrsa59ys+eAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz; spf=pass smtp.mailfrom=send.fqwqf.xyz; dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b=5qbYEBiy; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=UougfNFs; arc=none smtp.client-ip=23.251.234.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=send.fqwqf.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fqwqf.xyz header.i=@fqwqf.xyz header.b="5qbYEBiy";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="UougfNFs"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple; s=resend;
	d=fqwqf.xyz; t=1791624187;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type;
	bh=WcS12FKrdlFSIcQ4KMS899yzlWjA/PYmc+UZ1jpVTGI=;
	b=5qbYEBiyVliEgQFK7I6IpeLVNTtuGD618t+PCKtCbNoROAL3wbiHM/2gm9DQ9SgN
	Gl3/GO7kExFmdqjtTlms8VqTBrAshvDFdxHXCpu6HbPlxNHzTUbggDb/lwaiZQinfRq
	a7WtB1URc8CHZJ+4eljMFEXCmQOOlk7v5cM2uKus=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=zh4gjftm6etwoq6afzugpky45synznly; d=amazonses.com; t=1791624187;
	h=In-Reply-To:References:From:To:Cc:Subject:Message-ID:Content-Transfer-Encoding:Date:MIME-Version:Content-Type:Feedback-ID;
	bh=WcS12FKrdlFSIcQ4KMS899yzlWjA/PYmc+UZ1jpVTGI=;
	b=UougfNFsGGOE4snXWUt40twCe8I+ibGsrKly3sUPOykBinGptBK44lc8fJfo2XH8
	zu2wHoQrGezDtCYSZ9Ax5h2aHWM/pcX+rTNv86bAv3F4cXxiGQpBHCvlDWqat5nhVN6
	ZgYK0vjF5Or/Ou+e34AvrzqMyn39gQIt9r9htzGo=
In-Reply-To: <20261010092257.768685-1-fqwqf@fqwqf.xyz>
References: <20261010092257.768685-1-fqwqf@fqwqf.xyz>
X-Mailer: git-send-email 2.53.0
From: fQwQf <fqwqf@fqwqf.xyz>
To: sakari.ailus@linux.intel.com, benjamin.mugnier@foss.st.com, 
	sylvain.petinot@foss.st.com
Cc: mchehab@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] media: i2c: vd55g1: stop streaming after an
 exposure read error
Message-ID: <010601a1251f8ead-dacd1a65-e2ee-4d6e-9a5a-383c35b0631d-000000@ap-northeast-1.amazonses.com>
Content-Transfer-Encoding: quoted-printable
Date: Sat, 10 Oct 2026 09:23:07 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Feedback-ID: :1.ap-northeast-1.6BGMgStFQE7EJYq5syaCRzdneEHVt/+DAaGDrqUmDs9QLO4/SllUBZ3fHvnZ8rcAX/3IjUyTRgi5JFZsWrikFHwlPJqCkqEMlxDFM4JXh+ycxH/J5Tudg5bGdz6h4331g1L1EFsGR8kuYNfGLsrxz4Nym4YXoPcZxeVkrHry4Zx21n8vEVLEjc7s+OCM8PU9:1.ap-northeast-1.DTXDV/V9GPBWozcllKo8innbNB2qs2O/3F8XZSzd9ZM=:AmazonSES
X-SES-Outgoing: 2026.10.10-23.251.234.50

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

