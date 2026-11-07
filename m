Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.70.43.166
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794047307;
	b=wfz1H2AjHqQ4i1Ppr/ipJ/X8pCnP6fxjj3z0+CaEjY9Q4IJva1Itg+BkGE9rmbqiSCop
	 u2bYU/bnTvM0OBJV+D4HV1qNKW2OO5eEW69UdpHmulncRbvo4IzuRu66EZP/PeXYS51GE
	 YVR/iW6w73y/gzW3+WVoM1Tf5QGSi/1jeOuwv93im+vuas6u6fla2kcYjs5j4R3m2C/5I
	 npJXbG1rOVqOTSJZ93FS0ixT8hSAumPMLtYZDZM0BtmKL73Et0HQlrEIED0rY9YbYy8aH
	 Q+16HCy61ZUeIPiZBjDJz604ib+pQuuB/W8xnzlEfNxe+UR4u0rOYqAPqDi4g+vHa2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794047307;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 Feedback-ID:X-Pm-Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Y0gp1aD0CLCs2S1Cy0PQr8PHHU9s8brn1tv6Ae6Fqds=;
	b=YHLvqSFtyxzIsVPf9sujhMpfdETRbcO0qaP40ERvmZFJ1JfNy+3lvqrBYphsNHyD1J/x
	 KrNTlV42f9tFAYHs97XxrOFBCQ7cziONLftTSzW6nv2m7cx/dTzJKFDm1cOjqw0NauzWV
	 oXmD1nHzGwlpdw0ISpqItSpT/3/ngjfttjmeXAXN5WhcmFqtAwlIloYWxnkUHYiBFbP5X
	 IcpF23Xym+tnN8eieBOpOIaTf3v1kT/v9lSHVSCO5ieVcRhG7bt3uCz+UoWNilztrEGXU
	 Shz3uAf3XDLRFX1/tBorvCGJP03IEjaeGfLEHvKzwpY/CC2TXG4Q2e79Y1LPLFNlgyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=protonmail.com;
	spf=pass smtp.mailfrom=protonmail.com;
	dkim=pass header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=a2kwHv0t;
	arc=none smtp.remote-ip=185.70.43.166
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A88606A32C
	for <linux-kernel@vger.kernel.org>; Sat,  7 Nov 2026 10:28:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00A88606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=a2kwHv0t
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1794047302; x=1794306502;
	bh=Y0gp1aD0CLCs2S1Cy0PQr8PHHU9s8brn1tv6Ae6Fqds=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=a2kwHv0tdovAVhtetkd+PbD+mhJN8m0DSLDoiHnnKxNR7CHlxMSWVVw3nuEgCffoN
	 PzlnHNO4G1bVsQkPjnB5VhsW6cxxmcm9NaZHJozW5XWX6bKKY/rm/BeSLqMQ7s0YBw
	 xG/c8I3EGMMg8u5SWPFrYTUTIxvA9K1LD639MLpsNaOj0BLAAeuwKI272N4D0QyB0a
	 jYcn+HfxgHG/2Mjl9jr3OFRNtfZR9qJj4Vd7YIRJJXHH7O4CFZCYQFjuGKPNArHljC
	 tRk+k19JISblFWF//yoqwlZPNRM9oCU6TcrgRZwtm0B7Iq9a5uCylY8Oe2oqkwRfJ9
	 8JQgbnVum35Sw==
Date: Sat, 07 Nov 2026 10:28:19 +0000
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
From: Turritopsis Dohrnii Teo En Ming <teo.en.ming@protonmail.com>
Cc: "ceo@teo-en-ming-corp.com" <ceo@teo-en-ming-corp.com>
Subject: OpenAI Finds 948 Local Privilege Escalation Bugs In The Linux Kernel
Message-ID: <dU4rJjF0Pw3wup68khDH2Yua1NZFP-CuxLoRM79VqZ_MTOap65TYk0a9ipL2RhD6dynQ5i0gme_MMa-DMy9lOlu0n2CuXRFwlx66pqhBml4=@protonmail.com>
Feedback-ID: 39510961:user:proton
X-Pm-Message-ID: b0f6444338376e328813ce8e591a31048903819d
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Subject: OpenAI Finds 948 Local Privilege Escalation Bugs In The Linux Kern=
el

Good day from Singapore,

Here is an article which I would like to share.

Article: OpenAI Finds 948 Local Privilege Escalation Bugs In The Linux Kern=
el
Link: https://www.phoronix.com/news/OpenAI-948-Linux-LPE-Bugs
Date of article: 5 Nov 2026

Thank you.

Regards,

Mr. Turritopsis Dohrnii Teo En Ming
Targeted Individuals Singapore
Government-Induced Schizophrenia, Government-Induced Health and Medical Pro=
blems, and Government-Induced Extreme Poverty for the Past 20 Years (Govern=
ment Persecution)
Why is the Government SOOO ADAMANT, INSISTENT AND PERSISTENT about maintain=
ing Absolute and Total CONTROL over all of my Android (Linux) phones for th=
e past 20 years???
7 Nov 2026 Saturday 6.25 pm Singapore Time





