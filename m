Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422735;
	b=yTyvFqum01GW76paeQ57SnBlJuVvvaDmItb626TBSufFbirYkaRQK3LIPXXwBgOKaE3T
	 TE5520cmxQbsycJXCx+G1SbxvxhvpnCqNe77rQkfwzkiUtgbeSON2Bvv6OYz9Zz3vGQFW
	 Y6COd5k7g7G7wGXAdjn7ni3Nqwwzy8BZRmY0oN6Je1siVpp3asPsJx5P9P0KDtf9txHdL
	 R0jRUtFNbfPxYOlP2TpvqgpVBFScQuP/iMeCxb4PKd83Qk3JEqxH2TAHx8q7/D4jlwUEX
	 tMw9HGnqoYaAv7Sedd5AgEU1SYypf9gHPILkm9Pvg6493fS/brWo4A+nKWJXoYRi7vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422735;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:X-Provags-ID:
	 X-Spam-Flag:UI-OutboundReport;
	bh=CArIVjyNi1DdLLI1Xo+6NV2Inj4tLWeam02ZRhLj0sU=;
	b=bbGd9eKEixmsI22cm3XqkOcVtgo63sD2Ny4RDZyk+vMStXGgg3TOk9DVcJwDEswgeleE
	 T9rlhiQZG2BRL/13tyd3hd4wuLOdIQOu840m8PkZn29akr+Cd5hUe/fpmC0fMGvm9RvoE
	 ARireYANnMyfXZuxZhvH+pESAsLauR3V3EfIfvHcdR64hGdAXY1LmZ5c7oeM5N2Y+Dqj2
	 sRE0BtY65pousOGvoy9Cjf4athYM8iV2RUaArsuIWTz8KypPLXiQWbYQfiQahL6vJ5RFb
	 DWtxEF2rQCtbxETNyYk6JARDjwQyS0tV+EI1LNAx4G2JjRC0L8+Wf4NUHeoU878/aDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=henri.ommer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=IIyHE1Rr;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB1F606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:45:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDB1F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=henri.ommer@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=IIyHE1Rr
DKIM2-Signature:  i=1; m=1; t=1794422732;
 mf=PGhlbnJpLm9tbWVyQGdteC5uZXQ+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.net;
 s=s31663417:rsa-sha256:s61idu7LzBZ9Wwmk98dsIFgrkPAX
   twgGTRQfDs4nypVlkUyUagpcAPsATJD4j6EeUYzlHkdnx/yWB3GBjKdTdtq44Weu1R5aqyWi5sO
   XyV/FbY7N7coWUx6YKQpLINd9IMavIFlZCyD5i+xFcXmSMxs3RJFSEVLpvUxRYKWWDZzO5JJzc3
   OVjyh5PBRMcA8Qiwfds55QZwWfs6K/w0L0ya66tvRuyc4JJgyvt2x5h0c0ucHhiSmWBpDXVqEL/
   EG8o4Ae9GO0IYKg89+bafUosmScnApch7tZ9W+bRGzZb6Px+xLZErIB61b5STr34wZFGWiwGh1B
   j47hIEsbjur+uQ==;
Message-Instance:  m=1;
 h=sha256:
   0jIox0hE8fDimaYA4mhN99vqNNRAZqszq1ZBZYOgKpI=:
   R/D/xO9eKJZycpfyOOBKs/eVBuKuBDisXjAwbfIQ6ZU=,
  sha512:
   7vyaakJe3ADeml2roVr35hQ5yR+CsLic7eMRb9wMXaXB0jjjC+wyB/HACYb2/VFsamQRtymFO0i0thbaf/rGhA==:
   SR12AkSEPosM+u4tDqubMUuIQ2BIfx5+O+NQ2iU+lxRyB0R6Zf4WB0FQQAsUnl2FBnKXI4BuKROY2Ft7NgxqhA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794422729; x=1795027529; i=henri.ommer@gmx.net;
	bh=CArIVjyNi1DdLLI1Xo+6NV2Inj4tLWeam02ZRhLj0sU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=IIyHE1Rrqnw0UAAPyAGVNBFRY/SHPlLYM/Q4l26MNRoRm+eU2yN6TMq1Q7rt8dxx
	 p43A1hP8PQZADJZa/FqUXPRFdAzm3Z1JfeW9fjGyvyjsmnEB98YV4EPq3VmiNe3eX
	 Luwd4DH+4iGYsODVBK8+Ed2TMdKFdQIGGwUEIe4+Wr1FL3G2Hi7HEGK7IAGx2yvxr
	 KytRRMfUs0j0hsW9m+lA6y57W/g20jqkg+EY+pwA7/MroEl6PlSPrk8OzsT7Zl0/S
	 k7kEoK0kTOCSNhJrjGK9Yj0peK6OOfU9UxAJzxwRv1i7JFtsbC0qY38DFxf8+R/u4
	 c2zPv0MtdnHkDEQ63w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MsYqv-1wdNUQ1iXb-00xMpC; Wed, 11
 Nov 2026 19:45:29 +0100
From: Henri Ommer <henri.ommer@gmx.net>
To: job@noorman.info,
	dmitry.torokhov@gmail.com
Cc: phone-devel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Henri Ommer <henri.ommer@gmx.net>
Subject: [PATCH RESEND 2/2] dt-bindings: touchscreen: trivial-touch: Add hx83102d
Date: Wed, 11 Nov 2026 19:45:26 +0100
Message-ID: <20261111184526.5637-1-henri.ommer@gmx.net>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ruVcU816EEO1rMzjH/+LrqX82AsSZ0Bw83yHg2SIsAUWkAaK3Ke
 XJJvHeUzyGr+qOoUA7MaNSXcnkfKjdFNCn6dc3EFHWggLaDGUN4MRoJgCYswQyjw4WRKYUf
 9d+Aw0i7A+7W7hCU1KlerLJe4s7cyda2JQKUbbtTHzG1Mql4VOuxSXEr8TjA5xazRHynJoi
 b7AtxHYL8Wf4TrdUkP72A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4uW7Xf8ol/k=;tqA9BnsjsluDnHysMYZqBtfsI+a
 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
 S9t82IYGv6ZrJUQsFkggj9EvXwSWb+wbadnzg==

Adds the Himax hx83102d touchscreen controller compatible string.
The hx83102d is software-compatible with the hx83112b (except for the mode=
l number).

Signed-off-by: Henri Ommer <henri.ommer@gmx.net>
=2D--
 .../devicetree/bindings/input/touchscreen/trivial-touch.yaml  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/trivial-t=
ouch.yaml b/Documentation/devicetree/bindings/input/touchscreen/trivial-to=
uch.yaml
index 6316a8d32f39..d0ee79ba096d 100644
=2D-- a/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.=
yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/trivial-touch.ya=
ml
@@ -16,9 +16,9 @@ properties:
       - azoteq,iqs550
       - azoteq,iqs572
       - azoteq,iqs525
-      # Himax hx83100a touchscreen controller
+      # The Himax hx83100a, hx83102d and hx83112b touchscreen controllers
       - himax,hx83100a
-      # Himax hx83112b touchscreen controller
+      - himax,hx83102d
       - himax,hx83112b
       # Hynitron cstxxx series touchscreen controller
       - hynitron,cst340
=2D-=20
2.56.0

