Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=138.232.1.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792956325;
	b=anh/DPcR2gwB8sKWJDviqi+WuBdLjtjHVHeMUWpIW38H5kAcGv9q3pOWiBgiyoj2zfvF
	 aSvQ1zkGpw2t2ultegVQjK+DWsTlT1/Op4LQ0DpTBDyD25x92FsWQPw9k9MSW0zoTnIDo
	 MP9fLpjmwjeL58u/jI36ljtBomJsYpcIv2HL0lu5eEHtWTRRt19aiIpkO+kbh/JlpFRhy
	 FB85HY+9UudgYxtCqGNMaJJ2IAlq5n3quLuvFkSCGMT2q3A62gt8Rb0rrjemugEhiO6LI
	 fpU1mcmRkNGxoUJ1EaVdmpKS8B2MV7yAX5MtjHIRzszrZBvsYNzJg4jjSulMI6Z5QHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792956325;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Spam-Score:X-Scanned-By;
	bh=rQ62NhRXEl8KWaPyCXa+ZlyprhbCGbADcPcfNWgMGtk=;
	b=OrNONOfACwdlrFDkxwz+1YYqzg8q9crEMZ/UikLlkqxIebelGLs78gZrgbQ/UwZWOaZa
	 ODLhfOMOmiLgzEsOgUV96fiJ7lw8gaPmXww8vIS/ut1USzjW3UX+iV5M0+xHMLtxfYBe3
	 H5LzxqgiXwBD4Fbri+YlkzlBg19iT+O3/o3dva+jIJE9qMQsTeX5a3u26Uh8RcKItoR84
	 XQ7D7ySW11SqxZ7oRauFR6XkGRs01PvWL+OLrj2WgxK9dUdLtipPgXMrv+l2+ZHSWY3/Q
	 2wxcv5O3QY3dvwlgFhVF96lgjtN86YOqMKxkRKrVIb16Z82UfrdvjDxlh9LJVuWwcOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=student.uibk.ac.at;
	spf=pass smtp.mailfrom=student.uibk.ac.at;
	dkim=pass header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=qHet4wTw;
	arc=none smtp.remote-ip=138.232.1.140
Received: from smtp.uibk.ac.at (smtp.uibk.ac.at [138.232.1.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C425A60A2624;
	Sun, 25 Oct 2026 19:25:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C425A60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=student.uibk.ac.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=student.uibk.ac.at header.i=@student.uibk.ac.at header.a=rsa-sha256 header.s=prod24a header.b=qHet4wTw
Received: from surface-pro-5 (178.115.151.51.wireless.dyn.drei.com [178.115.151.51])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 69PJP8Ej519288
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 25 Oct 2026 20:25:13 +0100
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 69PJP8Ej519288
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1792956313;
	bh=rQ62NhRXEl8KWaPyCXa+ZlyprhbCGbADcPcfNWgMGtk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qHet4wTwygrpqBwmzDLC2oOH9Wl9AQ/fwT3erV9uFFTt/A+KW74QCkooLRfB70A2c
	 0n2kyuPyEY8NnIyFgLDJZ6vMYPnvUTVna268MjDLQn59YNbEL57k1xksmP4Q3PP2oT
	 KO6Bd9FrQ/ukwo27BlpmvI2sV0u9obe24Eg6cgg0=
From: christian.koever-draxl@student.uibk.ac.at
To: zhentao.guo@amlogic.com, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <ckoever@outlook.de>
Subject: [PATCH 01/11] MAINTAINERS: fix the Amlogic VDEC binding path
Date: Sun, 25 Oct 2026 20:24:57 +0100
Message-ID: <20261025192507.210058-2-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
References: <20261025192507.210058-1-christian.koever-draxl@student.uibk.ac.at>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Score: () -14.0 ALL_TRUSTED,RCV_SMTP_AUTH,RCV_SMTP_UIBK,U_RCPTS_11_PLUS
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at

From: Christian Stefan Kövér-Draxl <ckoever@outlook.de>

The binding was renamed to amlogic,s4-vdec.yaml, but the MAINTAINERS
entry still points to the old amlogic,s4-vcodec-dec.yaml, so the file
is not covered.

Signed-off-by: Christian Stefan Kövér-Draxl <ckoever@outlook.de>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0e0d332ec39c..8c4baa252541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1446,7 +1446,7 @@ AMLOGIC VDEC DRIVER
 M:	Zhentao Guo <zhentao.guo@amlogic.com>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-F:	Documentation/devicetree/bindings/media/amlogic,s4-vcodec-dec.yaml
+F:	Documentation/devicetree/bindings/media/amlogic,s4-vdec.yaml
 F:	drivers/media/platform/amlogic/vdec/
 
 AMPHENOL CHIPCAP 2 DRIVER
-- 
2.56.0

