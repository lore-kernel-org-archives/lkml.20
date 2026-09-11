Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBA3425878
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789154289; cv=none; b=gzJUpEnZ/JcSa7vvfuBgIwm3LI03tOdDw0NU/UednntkIH46NzROi3HfvdeSq4mdCvoEJVd5FJI2htiBSH5wW5uYCC0s8kjarKCre+WskIEMqZZpoTEvbmgT3pt4exElHlYcBjT2DYh3gU77m/l3f2j/a7Y5RDuCcNbaZHq2TN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789154289; c=relaxed/simple;
	bh=SRMwsgUexmzprwrFlgUO6xcV2rE6qcb3noncoGHDRnk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gZlP6xn2AssUn/cE+zgPVaouKrnFEv+FyNipkgAN29VesoIX/9b66pJR+yYeKwOePBX003BptHwSXfiqIKCYJcU/RD35MMaNAVPqrneS3jza0WcykXTjxeUlZfbrsgWo0hHschmOiN5MkaNipFvQaqcxD1xV9/3ns+XOqezO04M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HUR+5LED; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HUR+5LED"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-482ea739de2so840486f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 12:17:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789154276; x=1789759076; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKEYaA8MPpN3256vTbdDB94tx+xGQJifixgezeh9NA8=;
        b=HUR+5LEDIcgfhWbRYCGHpmRwHsCfjGjQZFeF9Tnr3l1/K9fo2K0YC25yvPmPt4Y5U4
         v0LHnnnIbReuSeYepsTosZI0CDa/2YLGV5NT667XpEtPDPBpxsnSNAazChQuioZt6ImK
         uJPoz9CDzU99p3ObJhayxWUFtC/nx6HjfTj9tDbN3OUAWr8sVZtem1+4mYlkjv5972oO
         SjSqychnJX0Khh8DnS7lYCC2eYRev1uuvEY/W+CqQUi2mDi9oQryZKY3t6Km4Uxu8Vka
         rEnY8Cr+s9nvuLBGs45ljAE+F0WyrqFGWlvSkhHilspwIEiZ5HftO2TN9f51oVzzDfB4
         r+rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789154276; x=1789759076;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKEYaA8MPpN3256vTbdDB94tx+xGQJifixgezeh9NA8=;
        b=FyTRxYBPq0yU+89uTyyITeGFAxRZgumhC+I2v6tTeH52zv2qAkaSt+g68oLtTmUgJh
         Abkl5RXXXyTjKj4/aGhNjG0UCuH0sjPl2AfCZAveKML7ptrob2hEd8UfXJlsZJId2jp4
         rJs/MDJ2JoV0asNgeTtn2knst2aBz09Av0iopwJMAg0fhxoHgB5c32mxbG27id3caOGs
         lb7IilNPn3eUGgg4NFzythmM4GG9JGFijzV8QZFxof7nzDNwF8xtRV4mtWswzqJvaCU3
         xcUna3fFhZ24YESvPcZ+exVLG6G+7m7i9+zu0untxpuVejcSujZPYu6xtCKu0my1yUvW
         S3QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwh8b6iG+zuZ0Q9+8mnZxCypIZqCG6pmeaCILi3UsVLIchZD+8QA5hK+5jwrQYeo8pvHAkDCvCyejgOmhs=@vger.kernel.org
X-Gm-Message-State: AFuF++mywk7q278DHbYBa/MXFxyt3SZJeaBL+kuWf7HG48TMn1EC3Sfw
	ojSMFQOy7jqmsxnYfHCuO4VwpmSWPSKlvoXZOKUf3Bso2IJ/aF9EUAme
X-Gm-Gg: AYBFou2UcjZU1M5sCcDRRKS8cYRUBXXqy2VWqhxCUUQI4kvl1hAwia3DvjQdSODZwm5
	u++xvD6T42f8MkTO4cLPL74N5aWSa955vt8kd5/KOQSMdlGCVgttnwy2toDoMEWCjvaZ9hPdNDr
	Zur+myoLm7PmlIlVwGbpsk1R70yPYzbd5/GE3LCosAHH+tLbt9AdERHQTBQKAXK8Kz8LDfuS7AQ
	LK/YJZcVI1OiQ/4tZOV+tsBTBqsavIj9xndfToDt9E5gmmPqUlorvVNAQ2PB+2Zn8boauHtqqpk
	wFpc5bfJxUudw1o7AEcbaalPIbKvkAULAK2c2nn+jttMlURdK46jeflN0VDPJZEOnVaThRaJjhq
	QbqjlwvUlgZr2pr2fAgrFIXbKN6t80mAzyKaMImc3w7wO//XceCKEKaja2g4DCVRxdB3ZLqWnuD
	kQ0e3sGM4E/2m3gDOkeNvwx1Lb5RJHaQslEEGzPr8cD4w/McbYbWZSBNjhpUzjUlO/wOP9USOoF
	Ep6LwXXizPlOdAvKuPkR1+trVEhiqtFZ3ZkFmPE6oF34K+WXEtkBaof0F4xS0E7OOiCZGUzqve5
	ZnPXgowNWQ==
X-Received: by 2002:a05:6000:2c03:b0:486:f3be:2a68 with SMTP id ffacd0b85a97d-486f3be2c00mr3174196f8f.53.1789154275574;
        Fri, 11 Sep 2026 12:17:55 -0700 (PDT)
Received: from localhost.localdomain ([41.90.145.1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ed106sm7658971f8f.1.2026.09.11.12.17.53
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 12:17:55 -0700 (PDT)
From: Kenneth Kabogo <kennethkabogo2@gmail.com>
To: Alex Elder <elder@kernel.org>
Cc: netdev@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	David Miller <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ipa: validate QMI sender for modem-only server requests
Date: Fri, 11 Sep 2026 22:17:23 +0300
Message-ID: <20260911191723.46172-1-kennethkabogo2@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <178915233401.219967.3094305844336909787@kernel.org>
References: <178915233401.219967.3094305844336909787@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the thorough review. I checked each point against current
source rather than taking the summary at face value, and they hold up.
I'd like to withdraw this patch rather than defend it.

The short version: the check I added only verifies that a request comes
from whoever is currently cached in ipa_qmi->modem_sq. It doesn't verify
that modem_sq is actually the modem. modem_sq is populated in
ipa_client_new_server() from whatever address the qrtr name service
reports for a NEW_SERVER announcement on the modem's service ID, and
net/qrtr/ns.c:ctrl_cmd_new_server() says outright:

    /* Ignore specified node and port for local servers */

A local process able to register that service first becomes modem_sq,
and its own subsequent requests then pass my check cleanly. So the patch
narrows the set of senders the two handlers accept, but doesn't establish
that the set is the right one.

Separately, and independent of anything this patch touches: ipa_qmi_ready()
also gates on modem_ready, which is set in ipa_client_init_driver_work()
after a QMI_INIT_DRIVER response is matched. qmi_handle_message() in
drivers/soc/qcom/qmi_interface.c matches responses by transaction id alone,
and ipa_client_init_driver() (the handler completing that transaction)
takes the sender address as a parameter and never reads it. A forged
INIT_DRIVER response reaches the same ipa_modem_start() outcome without
going anywhere near the two handlers I patched.

I looked for a stronger anchor before giving up on the idea entirely.
qrtr_endpoint_post() in net/qrtr/af_qrtr.c reads src_node straight out of
the packet header, and it's only ever called by a transport driver
(smd.c, mhi.c) handing off data received over an actual physical
inter-processor channel. A local socket send goes through
qrtr_local_enqueue()/qrtr_node_enqueue() instead and can't reach that
path, so a message's src_node, when it genuinely arrives from a remote
processor, isn't something a local process can forge the way a service
registration is.

That suggests the right check is against the modem's actual qrtr node
identity, not against modem_sq. What I don't know is the idiomatic way a
driver in this tree is meant to obtain that value (devicetree, a
remoteproc/glink binding, something else) rather than picking it up
in-band from the name service. If there's an established pattern for
this, I'd like to use it and resubmit properly. If this class of gap
needs fixing further down in qrtr itself rather than in each service's
driver, that's useful to know too, since it changes where the real patch
belongs.

Thanks again for catching this before it went further.

Kenneth Kabogo
