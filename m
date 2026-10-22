Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792695174;
	b=wNHzs+ADbdRC52pd850xBWcumGSe7hP+7MX6Rhn+invXnyOT49Lt3OCDjgl2ai+XAgu/
	 T8us2NwwOcPejZsi9CHfxjMM5NHVrac3bDh7Fd9bqPXrZae/grphBNtfPn9lHyCE5B97O
	 9tCUlTV9P1n7oDa3yxp+GVFChn8RdyuD6/EUe3cE2KxhiTesZUXT+fReej52ZltrymRi3
	 BxA5EgSF9RuzoLKZ//tyCV6MwqisVKctvUhbbrxcBodyEs1xmRFe+nK1miz4OnQakPLBm
	 0huFCCyqrBv9UbGMBnhn9SdDtyYZ6JMHXbcueY//UW/a/NUHTL0qavFtW8pHB0MriAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792695174;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=AWyBv4fpq7McuxLCX2w8h8EJeKQuEsSj5BIooBiqeg0=;
	b=lFbYF0v+Jh48lNrrXpXCAVbm0KV73hXDQHfCiF44Y8mt7vVXeEJeM5AZDE4KsH5EInss
	 wyk68YIyfrtCVhCw/0JOJQLRNRpMhiXEkpfTrG/m9cr6jvzfyAeG/2yh2vj1govkcSAen
	 sgvImgCjFzft6jYPZ/SqsL0JE9AdGd7FORR8o7PBMC9Q+HY89jzXv+sb+xY1TZukb1+VG
	 4hl4ftFoUrUi31sPCLSrQXOLpxKEBREHFSou1jnU6zgCWU4aJqRJYMcEYQlER0jV8xdM/
	 IuLYF7TwZxt3HXB2cO4Fkpjqq9VJaKuVZVsqTlXx46B043Zow33G4khWtB8EXW5KmdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R3IALzpF;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065D606A33B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 18:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B065D606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=R3IALzpF
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-98c8cbdb9daso54090241.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792695173; x=1793299973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AWyBv4fpq7McuxLCX2w8h8EJeKQuEsSj5BIooBiqeg0=;
        b=R3IALzpFfM9q2REeIpNq1MyfsrkB0pUuq7o7l9hl9XRIDRt9s5HSHTVJlOvLflYF2o
         4vcMymW0nior67vJggTTcqFbeAe3PHWnx1stsHLHa4EvjnvcOc31O3pP50lJglYBqEo7
         9R1xzovT7BQrQAENWN+58JTGi5qH8mm/7gbU0Oh8n5mg38dFI/OmlM8o19mmEVc7Ldec
         CIpOUMWfbhduiIHrVYPEfpu+54ouaCCWNDCWlWx8MTtbg9SJzqCcF1xZws+VDbdH+6mX
         uDVBoEJYibe+pAJCpRxoV1tjJ2/qsfbe19yblLSiD2hxepP49u2C9esuVyYDpwegwIxV
         EvVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792695173; x=1793299973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AWyBv4fpq7McuxLCX2w8h8EJeKQuEsSj5BIooBiqeg0=;
        b=vbQFu/POv+bL0BZxXVRQPXGnXmscKzDmtnIoNsILrpI2EEYaHbWVvbga99hZkBYReC
         NQjv/eogkYHPOEZ2EsfA/dDIin06JEGIqdeSKSEWxYY4gn/Y53YNl2on86rhtl8813gL
         u7EdpSarCLCknGmK0ksD8N5ScRsmvCMbuoruzVfV3riAashWapNgMM4gvTxpUJlc4ZWV
         qaIv7HjBciT25VWVUAk4TWiR8BaxvG7/O0mn888UXRxtFjMYHe7VmdEqQDNZ2HiKMg2h
         PDJ6nAbcCSkzawb6whfSJLtouQJfnuSs0nGNTlj4ks98DK2a6s7Viv90hhegOIVV38bk
         CvCA==
X-Forwarded-Encrypted: i=1; AKwUvBzruxh10rM0ArC3Ae1Ie+8UL4rv5v9wdVCUGeQp0fQIKdQb1FZgEQC5kl3RDhK4x89CHtP2sMT04yXEyh8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLF9sUmKpNNkbwbCfPZ0gF+4P2AbxTLGJRrK+PmY6kavFwVRuUV
	f/oS6VrsYK3zyqB7Nn683I+NHspd2vCTAto9BTSbhbJWp+bpe0ZZusDy
X-Gm-Gg: AYBFou12EgJ/0QWLA+k7lDI6xY/oJ7i4cKUEJAjWOzmVtdomG5ezzqTzsGByhjylAr1
	42vLWOJAaQ6aFG36klDcwvagq8cgSpkJYXYXdf+h7Ob6+sswBgGGa3U+BV4lxRG3Ft+3oTUaiAI
	pZ7vF0SKasfWjZQNvpnWUwQzGYGC6kjCcbG4kr6gfH89VRQuh2tlnnDlIxl4LndJq8MncAvAVg8
	wo5i/TMKMJ46jYGWXz6cjNOTEQBT//ds+oeeVbiwMug0LfYRN/sgsCdThwEDv2Mb9PxFFJ90HRM
	u42+oRZ/C2bDWzPfJum2pGBzPH2m6HWa8pb9CkqUMjppJX0MjMuss6ueRV0y4qynIJ5PiDiHrlp
	oZmzaqE2VxEEz+MKrOKnKBDqim1j1NuPjQOIYAKg7Np3MasPWTN08z7/oSXtLJryHkB4Qu2XqNK
	pu7nNPGylzBk8/silwKyor4/6dOZHFe4Qbu6co9UA2YSY/x+Ks7WgT2jokymT3j6CtIau+H4KV3
	aytChpE5N5ZyVb1Llro81q8yH1tsDdalbMQJgmXu4C44WOa2ZFjDYIfeaS5+JOkAFxHUgRb3BeT
	i7sqnrTpUae+cency0JD
X-Received: by 2002:a05:6102:2912:b0:7c3:7286:b7ea with SMTP id ada2fe7eead31-7ccc334dc12mr133557137.17.1792695172635;
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
Received: from Biostar-A520MT ([187.94.15.233])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec124a7da8sm508980e0c.5.2026.10.22.11.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:52:52 -0700 (PDT)
From: Breno Rodrigues Alves <breno3011alves@gmail.com>
To: linux@armlinux.org.uk
Cc: James.Bottomley@HansenPartnership.com,
	mkp@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Breno Rodrigues Alves <breno3011alves@gmail.com>
Subject: [PATCH v2 0/1] scsi: arm: Convert acornscsi-io.S to C
Date: Thu, 22 Oct 2026 15:52:23 -0300
Message-ID: <20261022185224.60700-1-breno3011alves@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022183658.58090-1-breno3011alves@gmail.com>
References: <20261022183658.58090-1-breno3011alves@gmail.com>
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

v2 addresses two issues raised by the sashiko bot:

  - PTR_ALIGN() rounds up, but the assembly's "bic r0, r0, #3"
    rounds down.  Use PTR_ALIGN_DOWN() to match, otherwise an odd
    on-card offset shifts the entire transfer by one 16-bit halfword
    and can walk past the 4 KiB card window.
  - In __acornscsi_out(), the trailing byte loop advanced by 2 bytes
    into the unused upper half of the current card word.  Advance by
    a full 32-bit word (card++) so the trailing byte lands in the
    low half of the next card word, which is where the hardware
    actually samples it.

No functional change for even-length transfers.  The odd-length
behaviour is now correct for both directions.

Breno (1):
  scsi: arm: Convert acornscsi-io.S to C

 drivers/scsi/arm/acornscsi-io.S | 116 ------------
 drivers/scsi/arm/acornscsi-io.c | 168 ++++++++++++++++++++++
 drivers/scsi/arm/acornscsi-io.h |  15 +++
 drivers/scsi/arm/acornscsi.c    |   3 +-
 4 files changed, 184 insertions(+), 137 deletions(-)
