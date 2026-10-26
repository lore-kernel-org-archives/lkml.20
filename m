Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020756;
	b=UusZqC4ZCCBiSkl1045G6RpxzKNb6EzYNRn9yvadMNnLE3QalHN2KMNIjQ3Ji1Pmt0Df
	 ux1E6X831/EfQmjb+TV7khk9L2lBJRVtMrVlUFCi+8+NCgNC/z9QnCeHmc0+yblsx0Ihn
	 M3EJV0pWyDcpE0DWKPaALb6KXiB1N6nK7VcDATWkl/3My0QHJn9ueW24a8m/0+jqcNy4R
	 VbeisxOubksRuNPq16YCcJZ44tCh0VD3XW0v9gG7Mq8v7KTWqAepL+/FJZP/QwU6a+mqY
	 cjiwIuLJT3Gyn/7sVAyS36HNtWPSwKySvINO+dKh7hsOdOXmZ8xshuQhSL0bqJsOgCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020756;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:In-Reply-To:References:Organization:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=HVit5yS5FXG3Lb+4n/EnT9AdlQz5zdCUWXFd70CBh1E=;
	b=B8Bb0mE0Y0sGVN+xWMvpzQlU21urm/G4xPhrNdWYxmEBvL3po2T2oM0EPt0tyYlxjM42
	 3f5sI40GzGjqP5ALaCCJs9aQ8T64PlYLYYGUgvSrS+uV0pvP3ntmWBjh7LHK4CVTvIods
	 MiejdblOh+sKZEZ/Myr/Q/A0F33BViwiRouPohX98Jiuw2pAUhdZIrJAXqJkC8NJNhpwJ
	 EkuWq1Ej8Fkjl7YtU6I7hJcQIUnPvvJAKu719uU791LGI5O2BQIF/8ESQ9+96LVelfDB2
	 E3XsnkxmdqT9vhiDFY0fZJ5b7z2vj9jjcgYx0wLGoRdbog9cXSbmfCuMujyKbhww9rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QFtS3uJw;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2C2D606A32A;
	Mon, 26 Oct 2026 13:19:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2C2D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=QFtS3uJw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 3872A1A130A;
	Mon, 26 Oct 2026 13:19:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F1EE960740;
	Mon, 26 Oct 2026 13:19:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 608711032904F;
	Mon, 26 Oct 2026 14:18:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793020749; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=HVit5yS5FXG3Lb+4n/EnT9AdlQz5zdCUWXFd70CBh1E=;
	b=QFtS3uJwz3TqGRH0w7dONHOjxBMpknqNrhi9HzhjCKGjVN5s9D8g+kQD2s5c+N71/gNkXg
	69qdB0bkayFnO/tOGTUL/wgPjn31JiCzVy56FmJ7aDcz+FAlJXhCdKOMeL5+/cqv1UO3Yu
	DQiMJzu2YVQnt/m6AlWDstdyulatgfWav8OuNIeONl53odSaaU9AaCQ51mUCletORqzXt2
	a1OIE5mP87jyE06lsObheznU1neI3z2sLOZFbOEitlg7Ekg69o/Hnx+inVbAFTCfdqCUvz
	j8FiSGi2TgFEoQUDM7sLx5iDi8uYfwLSnuRNNzgG8BgNWAFZL7ou4Yh+lmzsmA==
Date: Mon, 26 Oct 2026 14:18:57 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Laurent Pinchart
 <laurent.pinchart@ideasonboard.com>, David Lechner <dlechner@baylibre.com>,
 Ayush Singh <ayush@beagleboard.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, devicetree-compiler@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree-spec@vger.kernel.org, Hui Pu <hui.pu@gehealthcare.com>, Ian Ray
 <ian.ray@gehealthcare.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH v2 07/74] Add support for FDT_PROPDATA_PHANDLE dtb
 tag
Message-ID: <20261026141857.21e290c0@bootlin.com>
In-Reply-To: <at6tLoIGUblHcEBz@gractus.seuss>
References: <20260826094950.1088288-1-herve.codina@bootlin.com>
	<20260826094950.1088288-8-herve.codina@bootlin.com>
	<atgtw8QubzVfWMYP@gractus.seuss>
	<20261021192615.1f5b91ff@bootlin.com>
	<atl8nkrGFvhWRqDr@gractus.seuss>
	<20261022114741.31171b04@bootlin.com>
	<atq3H0Ts4wTBTVCV@gractus.seuss>
	<20261023132949.4fc3072b@bootlin.com>
	<at6tLoIGUblHcEBz@gractus.seuss>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
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
X-Last-TLS-Session-Version: TLSv1.3

Hi David,

On Mon, 26 Oct 2026 12:30:31 +1100
David Gibson <david@gibson.dropbear.id.au> wrote:

...

> > Ok I've looked deeper to remove the is_local field. It should be doable.
> > 
> > complete_references(), probably renamed to fixup_references(), will still be
> > needed  
> 
> Right, I'd expect that.
> 
> > and called from build_dt_info().  
> 
> This I'm less certain about, since the function needs to fix up in
> opposite directions depending on the input mode.  But, I'll look at
> the patch once it's posted.

At least, the next iteration gives me a chance to convince you.

Again, the idea is to have all references set to correct values when we return
from build_dt_info(). In other words, "transitional" states do not exist after
the build_dt_info() call.

With the code updated in the next iteration, this point will be easier to grasp
and so to discuss if needed.

Best regards,
Hervé
