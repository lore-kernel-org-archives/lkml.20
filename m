Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794085433;
	b=jEpFuvMDrlTF0rpOAbx3wrH56mwnOLofD8L8XF1PgQgYhqTE4XmpNYX55zS5klhCztoo
	 o29jdOj5nSTDYYRTir181yGW5gAvf63y4pzdIhs5rYqs4LG7o5chRyCMM0/zKLPYBgypA
	 d9PJ3qu40JjaH5EuGbekY96Uw150WcAy7Ds2zh2R5TKsMkdWQvhXyPogI9NjVHWB8dsVg
	 OI3BoUdCGncTkRM9ecA58y5T5OidvmAQVD+Dbtm5oFWLfrhfZiGfbL9NcMrT/bEFREWRQ
	 reJaH1RwWg+JOJLmQCesHZa6YY9R4usb0dQaM1A7nXzaBM9bJmXTxVCOxtexDFWcPug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794085433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6ZaKA9uotmuigUO+lt3+1p4XtUC0uLUC5fl9/GAlSTE=;
	b=axogKC02dSwWr3NXsm1bXu03dk2QT+M705DdRfZJSvsi75y1cFjnvtbWEoNJBdYlcG3i
	 Bs8cDMK7LwTDynx21e5YHvnMPaa3Ac3jQJ63fny8FE+HjcC2N9qOGQVwxtasCq7wtaN7w
	 XgfLuEP/V2IEoe3wn/eG005jOGvkKKbiehnBx8eCCz/RT8n7WSzqRafJ5YMF9GiZyXOVi
	 Ik2fo+CSTxRF9/EAa1F0oOpUmd02sh6f0H6/baYlNLQBYPIRzrUmvI8+YrVrIfXxHunUZ
	 15MEcOrm1tKDPEX7Xk+4x3esCkayVKTMTRCmkopy/U0jZ1dv5xZ3FoKr0vMvFq0gT2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYkTBDCt;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21843606A32D
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 21:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21843606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DYkTBDCt
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-36ff9c9da34so75353eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 13:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794085432; x=1794690232; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6ZaKA9uotmuigUO+lt3+1p4XtUC0uLUC5fl9/GAlSTE=;
        b=DYkTBDCtMVKNjelCFUqz9yBXZcsxD5nKLsWCMfrAht//WWfHMadqiVfjcBRm1HLV1l
         WZmjcIkYk4aZvv/mfH3IaF6qqDliqGSacqrEn2aQ3H0cFZ+qFy1RUtm8jE71xfNEJFYM
         VsWaq4PQrJ26W2HLPK2HVEmxNPINLdjGHajOSJkovmx18gOAP62NMQqc/+lALT1FQvhS
         or7wQpJ+eyuoU75gp4ddVR9k62C840YtCzZZrODYeWcU43EPdSlBjXQfLrOqZZpjaF0U
         o5r/XhjrHbw4SA1RnVAn9YwRIw1/AZ/LkQFqhmIsBaeIzSPbEh5Wr0a79dLAkLwbIzuK
         uCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794085432; x=1794690232;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6ZaKA9uotmuigUO+lt3+1p4XtUC0uLUC5fl9/GAlSTE=;
        b=P9iSvfUKN4WKJtn6gZFa3fGjtifH1RD1jEU8bunFbFjtU/bg5SKxVDFFIAlbrmhIBD
         bOAZjLffIKZGq/OLv71W0D1FpuAyzkXbOA/jaVQZGt+PnmpaC0fg/JHHm7P+UFr/w2nf
         5qUsq4IPl8N5xJ6yvEHGrm4rkSxZ/w1ohj2piGFE+cuLkTc7zF2qwL25J8W/C0rlFLdM
         ZfUAgz/FXgT+Xkb/2yaqRZ90bhX8ztd13941csR2wY+3XWFVRZcoqkaLgbb3mTNS6GxU
         4AFihtIqIbQL3FDLopz9w/uDbaeSdqC75n+DDKAG0tME/nWKGTnZOxYHvM68m5oiBQRg
         uc1A==
X-Forwarded-Encrypted: i=1; AL+hErE/tw+dVCJBkgW5kSNwGHXXqebEkFWDexYAjnR9P6U6mfcPZC299TphVkoVIBhYmKYH6teiIGHH9Jeu8qo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/N0Lrxao5jmbWLltyImruOoUSq/cvrHckOC+FTsJMe0aBroQYc
	XxiAijSV1HKX0zZBmdYrB1MGxdS7uWdwdzMY3sTkDZwcX2jwyQw7z+Uh
X-Gm-Gg: AYBFou02ZYf7ldg4OE+EvQNeMOZSaCwk57/KwgwdH7QWasH43pKf9J3820e0MRIrzpA
	AXFm9gWpho13iFWguozNAr5KY0jPfteVgEKuRwjqZk0RDqUfffgHmBq8ALhg8/QwuMJggui6vMt
	H+qetxfCPAQV70TG6NQWOeHslhVEcAdmjJDc3o2VeNB87MB6h63ABROibxsf6t8l3MLCsEcEs6u
	EpzXSmNwMJqQuGzExhhUG+Kq84HhoC1u8B3u6T5LPWo7P0pHVU1ziucOq4L0WjCw80gc6PrEfUd
	8bCRgF7ZUPv0FpDTsmBNCcio8xFnL7JLZ3e5bucWmmCTsCWm8tBJih41cjSTssPjmFavswvtTHE
	nG2eNsNEyz8he4g90e0EKYbZ/sv2VJmdIWqxI2/iyPCAXZWeYr0BxoeWjAJNcO7DB/x/6bR3bnx
	AjA3BOz4r6fhTgljlGOxFH0LS3aevTft2AqS9+hmNWO5ywV/zT9z0yfmQDWE2SV+ev8vUUXw+CM
	oFwjOIfE0T+BfxOCf+AC796b4hiY3r0Gj3v8b5gO1QmbRbSiWkFaaOcxYUHLyg9uRK8aakvnn3I
	2LJ7OOvRckjqeAQ0qCH5eTGGAmZYsM/mA5tX50dUv4RVWFJbBnU=
X-Received: by 2002:a05:7301:f29:b0:36e:b3e6:ebe7 with SMTP id 5a478bee46e88-37256bf3a85mr367782eec.26.1794085431966;
        Sat, 07 Nov 2026 13:03:51 -0800 (PST)
Received: from ZephyrLabServer.internal ([165.162.64.148])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372660f444csm351114eec.19.2026.11.07.13.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 13:03:51 -0800 (PST)
From: John Macias <dencity7@gmail.com>
To: pabeni@redhat.com
Cc: netdev@vger.kernel.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	horms@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: dsa: clear the conduit RX queue on receive
Date: Sat,  7 Nov 2026 13:03:15 -0800
Message-ID: <20261107210315.2003645-1-dencity7@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <15433a8b-5e5d-44dd-a12f-f2074857c1ad@redhat.com>
References: <15433a8b-5e5d-44dd-a12f-f2074857c1ad@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 11/2/26 16:47, Paolo Abeni wrote:
> The diff is damaged. Please fix your setup and re-submit.

Sorry about that. My mail setup re-wrapped the diff. I've sent v3
with git send-email, with no code changes.

John
