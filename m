Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793113096;
	b=TsHN55Nxo6TxxKngPrJnwrPizXldnMM8lmE1HIx8SSyxxb05seSKg8KU0t5FZlrUTJ/z
	 lBFKEc9DYXYgtSjFcSxd0xPuTqNdpfUGK9u2rT5q5P8uuWURf0q+PT0HBV1PZo6DneL3f
	 BANg9rk6ZbLx1KOX5SK0xUMgiOArbhhr6JzRLCF2JTuMpPg0RWqiCpRAlOGUmQ6cXDXzc
	 SxAtw7gFUZm1Ow3bClv0LqX103Db7l4hMEy/zCr2Hq0B6zJ8e6TT5drn5jPvuRkviHY6k
	 QKLjc/ckNWB8WN0RyVX3POh5Fp0RSCwt8dWYmAOUMAM/nrhUyFNpMJG5a8mATG1T+oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793113096;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=rnMUnWWPffS++hOsXp/Kyq9werZ6YItNlpeRLg7n/WM=;
	b=q+FGHk14zz7oSpJwPRBRBUF2FYtjqXayiyppnI/KNkzOGME7rPCNa5EX7lKV9MGBmvwr
	 zDT0nNc05OmjXFuuaGbbgxLwVdjDRNqVjZuM0rQvGCW54mw1GWQX3jGb4hk778cqcZoNg
	 /1KWOoTXike+0zmGc2D6AWquQORdCaoE1ipT5C94MfCKrXpfjVkifGzob8S+QO4aqIitJ
	 PTv5QYkV49bp/Uei/cfryjCJcTRXBPKG4d0upyqtwksQZ731Z15DgqeCsaGmKN+RoMDOZ
	 wpI7FQFSV/PJoJ+oByZjWQFMqDf+Ym3FoYNQiEZ5eFHBeWuxK1iyEOA6fY0Ns8RDh7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X006ghZh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422A7606A32E;
	Tue, 27 Oct 2026 14:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=X006ghZh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84CAF1F01825;
	Tue, 27 Oct 2026 14:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793113096;
	bh=rnMUnWWPffS++hOsXp/Kyq9werZ6YItNlpeRLg7n/WM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=X006ghZhm5SnR7m8/YqKLRmFH/IlbkofbJUXejpW1mX/hCiCQgJgDS5iTpsTF7TWs
	 fELqAwAzDgVQ5Rkq0hOxi/fr/WUAzUgo2zyNmF+HkEPIn7ajPzeYZ8eFQIf6DH1Gi5
	 aFEq/CC1SL8Uy1vUmTIfpHuIEUEEslezYdYMgWk4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 27 Oct 2026 15:57:48 +0100
Subject: [PATCH 08/19] usb: gadget: uvc: fix oops on a premature STREAMON
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-llm-usb-v1-8-b9751ddb9c7c@linuxfoundation.org>
References: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
In-Reply-To: <20261027-llm-usb-v1-0-b9751ddb9c7c@linuxfoundation.org>
To: linux-usb@vger.kernel.org
Cc: Alan Stern <stern@rowland.harvard.edu>, linux-kernel@vger.kernel.org, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Josef Bacik <josef@toxicpanda.com>, stable <stable@kernel.org>, 
 Neill Kapron <nkapron@google.com>, Xu Yang <xu.yang_2@nxp.com>, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.17-dev-e5168
X-Developer-Signature: v=1; a=openpgp-sha256; l=1584;
 i=gregkh@linuxfoundation.org; h=from:subject:message-id;
 bh=4CY5DFP5rjF5lFCamPxVIwFn9xR1urC9s7yfLEr+IQM=;
 b=owGbwMvMwCRo6H6F97bub03G02pJDFkPdr9jZFLMktHcsk6Ln/HCLluulPsK7722T7/z1XyJM
 2v3q/7XHbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRr/0MC7ab6K67e++rZKm3
 liSHy3Gnl+0eeQwLDkkzaN3yVlESDXTcuttdurBWg38DAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp;
 fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29

From: Josef Bacik <josef@toxicpanda.com>

VIDIOC_STREAMON ends in uvc_video_prep_requests(), which looks at the
descriptor of the streaming endpoint. video->ep->desc is NULL after
usb_ep_autoconfig(). It is set by config_ep_by_speed() when the host
selects alternate setting 1 of the streaming interface, and UDC drivers
such as dwc3 clear it again when the endpoint is disabled. An
application which allocates buffers and calls STREAMON without waiting
for the UVC_EVENT_STREAMON event dereferences a NULL pointer.

Return -ENODEV, as for a function which is not bound.

Fixes: 48dbe731171e ("usb: gadget: uvc: set req_size and n_requests based on the frame interval")
Cc: stable <stable@kernel.org>
Cc: Neill Kapron <nkapron@google.com>
Cc: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Josef Bacik <josef@toxicpanda.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/usb/gadget/function/uvc_video.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/gadget/function/uvc_video.c b/drivers/usb/gadget/function/uvc_video.c
index 9ba09118bb74..2a56536c3481 100644
--- a/drivers/usb/gadget/function/uvc_video.c
+++ b/drivers/usb/gadget/function/uvc_video.c
@@ -770,6 +770,10 @@ int uvcg_video_enable(struct uvc_video *video)
 		return -ENODEV;
 	}
 
+	/* Set while the host has selected the streaming alternate setting. */
+	if (!video->ep->desc)
+		return -ENODEV;
+
 	/*
 	 * Safe to access request related fields without req_lock because
 	 * this is the only thread currently active, and no other

-- 
2.56.0

