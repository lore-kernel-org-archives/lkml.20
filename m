Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794570435;
	b=v+6YrQTxhIs3noc/+8oMEvYKnOypkmyiJGg4+0hR0srvHQHnxtgJmZy7xXCuRbRKhGa9
	 PhOCfTkyMkX4txWgWlI1Wa6N09QmsURn6Zjf8CeaKBQkhCDH1SgbWe06LXnAgsSwRHOKj
	 7HNdODHMRb0mq7UrpWaa7lyXyRjjVr/hbUtZu0CWTtYfgKDcserf4OSsAPSjlpar6PMw1
	 NhkyX6nNjlZiS117gcl8CE07y9CFC+wnE+tuWSFvfIBjn2mp2W91bEh7Cvx4ZoS18lFfU
	 Km6qRci+AxvYp16Dgys6NhREnaCuK/4BDP/8Iqb2fu5bddmOY0LSxV2HAcV0h4jDLgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794570435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zJDLOTFE0u0isGyPzocQAPEPdP69LuLwHlkdkktHl4M=;
	b=IGx9xiJR/DdohfPOGNs1v3lMyHduhPf6iPAjVDHSobbU2JJeJk7xWQpnO7SWktvUE8Iu
	 FNSDhRJxvNzk9ynzvIv3FyHQ/b7RziPEpUKOL3EUJnwJ05WTKHEFzxq5RvZ3tO8K4h1IH
	 aSEqFMouVgCZuPkVfZhpLzVm7h6dVw1GP45qaGsTo/fvz1ETxoAl2rUQOwDWXZkb+TWmQ
	 rTUmtqUA3rE4OLynXL1hSVW6zf3Lu6kDQrlbtNf2oorpfom8TRSgZQZVtrCP1oLTv+qbk
	 8Fpy1kXtqiatuEkFvCfaT0HgfW2XY5dJ+9q6c9SeEEQcDpan61ORgrl09qz4756VQFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=YNQ2wdn1;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02009606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:47:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02009606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=YNQ2wdn1
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2A782429D3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 11:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1794570433;
	bh=zJDLOTFE0u0isGyPzocQAPEPdP69LuLwHlkdkktHl4M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=YNQ2wdn1rcL5nMFfb7zp13BAIQO/t3DW/5SEUPvLdKyEFiek9pO/rvjUb8VfHrhqK
	 qjLCEsklb0xyMWvPeOnlI+oaD+wSYzCcjelerQ8PvtDaLLzN7P7yuZVTvjma+Zv2Bp
	 MU/divWw0nh3oJ8nr3DMLbLo9g+u+YJ1QTbl7uI4si4TQFfAheRSvcugipmI+/F7LS
	 lN7VAEs+FcnOJCiCv6ejMJpNoBcwXj9BgZGP45URIhK38s3f91CfqwYVGeBDNWAV+s
	 FDgkegFMPBfNUVz9IruBr6k1w11LKp10xsfY+QBf+8N948u7kpPUYuxTwZAPSYJoyb
	 TCHvnUwBtdQCMfTbbS0DlLM8amwlq762MdBD/tfR/TnlwiQlF0TyqjZRpMFKt+lb9e
	 qJpt4FezjcUDV2VLl9/j0QZJNadVd1/49leNI+aea3p6OOC0A+dRX9N9IuC5CIV+eY
	 r3Cr5nSAeuLfJ/t2tZWtstsCMIPkSF8fk31cpJSX+MIgHK9vb7eqOtCHA61Dw8PpFC
	 8A9bUn0IxoPjeNmkI6ijPbg7Fo2LRZLZrS6gMXrsa/gaDXmcuRHjww/V34+078bpi8
	 BZlSG4yiCIeparGRs4m82/6iJzmWTtePSdLEMwy3JedNLGEXH2SCiev+BTG97aorMe
	 LG8U1xJVnPWNdj6Pg3uifDRo=
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so725208a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 03:47:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794570431; x=1795175231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zJDLOTFE0u0isGyPzocQAPEPdP69LuLwHlkdkktHl4M=;
        b=wOLMb1GzYcvGfyygYQrGD5UWiewp2Q2SwQCCD25b5gtv2ZtFkeOP56TUFTSD6yHFAw
         9+aIiLCH5dZK4Q7MaoA7poCpjHJwZLkzoEYRYwc9NzUKtI98Yd5CXlw+fUPQP+0UzqNK
         Qlak3vJ8yWfeeglyiVzTP7DYncBtxIlPzPFdw2NxK/YIcXSirjamzI3F72Q1zzkb1QdF
         87TIJzntLY8/kZAoNtdDSXvGUfsStsUMtn2TWzPkFwNAjet7o4jaqArRk4zkPKhY1btd
         RFQ5NeKUy12lTS0dvZaRZdCntTAYqrMEZ0VsaADsk6oa4QLUYRW7QpDHuZ5gYquW8fF1
         +7xg==
X-Forwarded-Encrypted: i=1; AL+hErGIz8HJFXGo0xKbOkXyfmkD0bkVhP7K//CiXfHW7wrwDrDc0HdQyFwMTVxLMpkV+KTb/qiXFOWFGBfD2To=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ija9kgInfuJ3KmA+6XY7N6iC5VM3nRm+MH1h1GahUQfCrKR8z
	tCGbPgkcPW1dGj9Pj1lv3xJWpCRBXPsKgaZoXDQipHnAHBWi1Ixjt1ZNZtNzOg2j+84ZRG6ThY/
	Htl/bbk27PMr/xUT0xYJ7fydIFX7rLoMlnSUJk0upZkUjlj81vdK2DEa/Hqbtt13ltIKCRSFK5D
	SVWiFiOA==
X-Gm-Gg: AYBFou1kmc1gRJmXTwuYW+DbwMY0gWgucWbDBUOMOwU5luycEkcByHZtaR5vbBYRF70
	JHv9akenK7nzsJ6LpMi40a7m72MlRMBSYMxUqukz3hYIMO/IsOw70KaE6Tp3iHgFUBYab6xZtu1
	SgoZFEZHeVQpEM5r0jp5h/cw9RhrWV3AnXBD2exJbA9s2XeU0+hyPoy/Fl5X6e21jfrJ7wd8X0g
	tY6xRIcuDTkmfLqnwA2/BUnnkU6kM/QWUgchiu6FUwpesRetUmOPge/FCLrcFvxykK7V3PqwJSq
	NG57oTjSZT8J+aphS+MfLlXB6JQWB9O5Bhw4nfq80QDoMfDbIkps3UlNB7Azcr6vqqYXyW9z6EM
	TqP0jaD/8fqJNGtAYcdA0OP64RLzKGdZLuiMorWw2U3yicyatTEYQ96ZKd/A=
X-Received: by 2002:a17:90b:4d0f:b0:3ac:96a3:77d5 with SMTP id 98e67ed59e1d1-3b1b0a3c5cbmr1777215a91.36.1794570431306;
        Fri, 13 Nov 2026 03:47:11 -0800 (PST)
X-Received: by 2002:a17:90b:4d0f:b0:3ac:96a3:77d5 with SMTP id 98e67ed59e1d1-3b1b0a3c5cbmr1777197a91.36.1794570430955;
        Fri, 13 Nov 2026 03:47:10 -0800 (PST)
Received: from ZBook.gateway ([123.208.39.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aec622b6sm4563767a91.11.2026.11.13.03.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:47:10 -0800 (PST)
From: Changwei Zou <changwei.zou@canonical.com>
To: sahil.malhotra@oss.nxp.com
Cc: changwei.zou@canonical.com,
	davem@davemloft.net,
	gaurav.jain@nxp.com,
	herbert@gondor.apana.org.au,
	horia.geanta@nxp.com,
	iuliana.prodan@nxp.com,
	jeffbarnes@linux.microsoft.com,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lukas@wunner.de,
	martin.kepplinger-novakovic@ginzinger.com,
	pankaj.gupta@nxp.com,
	stephane.debusne@cynove.com
Subject: Re: [PATCH v4 2/2] crypto: caam - Use bounce buffer for unaligned RSA destination buffers
Date: Fri, 13 Nov 2026 22:47:03 +1100
Message-ID: <20261113114703.68219-1-changwei.zou@canonical.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112074903.462744-1-sahil.malhotra@oss.nxp.com>
References: <20261112074903.462744-1-sahil.malhotra@oss.nxp.com>
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

Hi Sahil,

Thank you very much for your review.
I have submitted a revised version v5 as requested.

v5:

https://lore.kernel.org/linux-crypto/20261113113650.63038-1-changwei.zou@canonical.com/

Kind regards,
Changwei
