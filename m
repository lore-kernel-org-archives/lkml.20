Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.225.138
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645024;
	b=YuToTdqfWNrY4uocXJ3HG/NctXK9uYAH4hSI5kumdAVCmPVNXV9EomyGs09JYJplhReG
	 KfnE5KbYIPPTZTOP6EYZiG8j0We64LhJteJ8DmJ+RsUUI4Od+ogFkQQUC3kSxhz72vxWt
	 1Xg4NACcLu/N5j+rmizhc6BtHoFf5o1shjQMCJobc6j77e9qvuYsIPqPuor69n6878zWA
	 yj12/IqJ3LLgtFNlPhnp/23K1It7Nk7NumUiFezE2VAxMHklpqIYUY7/YR86PGk7vI5gK
	 UhUdbl0qx0CTs9p2dGMv46PPjnH133v2u5l/I4j5g+v4sWbrZrvy6kLhePSDyUeg4gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Content-Type:MIME-Version:Content-Transfer-Encoding:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Disposition;
	bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
	b=EvdhcYc+lq6Hlf4xg52OJj4sydgx8QU2PgTtWlfrdcIXcmVfprDOSPZCI8ouYAFjZv/p
	 IjfOy1jwtOrSblVWoANA73hfO9FtW2f8r4+8tN60oUf+/36JlTjsnKfleBAerlHeBBX0j
	 HNfQ6ukvrScLNQ38biLN6eNZANFUKmvjfXH5KjdaAzmyNXwOIl9S4B0eO6XsdFU31oNg0
	 b9Vb1cmwQY0YGTKCAmaPR/zK4w+B8e3527Q1bNBY9I5x5J58ZLI1CkpV6ilJ7n4u7WmFT
	 OL7R6yYYLS9IhHiXgXUeR/RO60voam098K8G+C/uOuM57uA0sr87LNhay9oiN2VjJXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY;
	arc=none smtp.remote-ip=74.125.225.138
Received: from mail-wm2-f10.google.com (mail-wm2-f10.google.com [74.125.225.138])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20882606A337
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:30:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20882606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0qR56hQY
Received: by mail-wm2-f10.google.com with SMTP id 5b1f17b1804b1-4b76ade741cso5595485e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 00:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794645022; x=1795249822; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=0qR56hQYIKWdOxVpc5j13KSOTAd8LvtSa09xdM/++9azQASY01VaY2/N7bIxkzHVQV
         uneV7DRJvWG+VRc6KRO66LSYMhG9aTuwpSiOFSv73W/DzetcCerEDzEnoxAr8js528EH
         nUTPKaAk8M3xhZbjAxaodYkT3bJ3vZzUrc8MD3nwb5I89mxzZ8VSalVq5w8Os3SC7Yv5
         Qab1tXA+MtQNKeBlFZJ32hBa4E++V/vEjpv+ymFD9oARpQcuAHbq1J9fnvsG2w1J6B2B
         xudgu0dFaFOYv9/QgA48S9Cxy+NlxC5paDnWBPdOaMkesuzTTvsuRwlZ24sDoPMGS3qR
         kEbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794645022; x=1795249822;
        h=content-disposition:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:content-transfer-encoding
         :mime-version:content-type:date:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ma8eOStbqsLgqHn7ahQBI4zgMkUeHZjSXOgEoYt70mw=;
        b=pUArK0H3u+pE2uygf77pBR3XcIr8fdeb8IXwUqDZJ2n8F17Jo1UZ39+D+fSyiVghgR
         K8cn3cegKentBkTNjkVTt8MzXbQx2tNDQNcwWDM7pu9fEBIXFLdEaDQFSoeeKvWO97qc
         R3OnaEVzhSrRfPk3FMZZNKofh7cu9npER44z30wH/yBOJvEOYpj6heR7/FBMedFI+TMU
         gyIZF/6rt2adsEbHwgob0aNXTGmM+gKhGYI1wnWJcGWm2HBldhhWrT/ifxdIXMUSwiJY
         QacVoJTUG54Ix6rG6vw5o/aaG+yyrwxB99zOV59+4y3x8zljvaqVMj7+CLIRlKdWgTT9
         Nvhw==
X-Forwarded-Encrypted: i=1; AL+hErEUBFko1xSRGui/NLMtey+MqXMwR6C+7fP+I+KIpfoXKYj2qYj1A+/Tc3fEqXIxg5+rlwfB2NQeKuNyOUk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/mZQHF1cvLZUzfQH4cknC4+T7Ma38/Kc7IXVbux5z5kg2N9HgI
	O3ijWi0fyfamr20Kuu4ufU1SyBoPYxwCcwkCZVWFFusN7AmLvRxD5eBL
X-Gm-Gg: AYBFou2zJwv+XLbWXPkJkZF5lJfe00/T+d2o0jd8RqGkGcK4/u59obFi6ov6y/n+ueS
	KCvK90kAnzhrE51ZRjbOLGF10l3hPMrlMmpts+8WMaz4q5CrH3L0+p2laxfHOuRf+UtjjuLlfbA
	T1boIk2U+dn6Tq3Ci28FmlRrpIpo1tlJgyxWhHICM+Rz1eIbamGq+0inKKYKrQjLRWPYcZ0Q30X
	j+fp3I5pNTjeMiIw/eJy0yFiTtAfGia0/T1ois35bdR76dtS3jKEmTeX5a8HewMAIf4A545BAxs
	7thAxbMvDP14Hc4LCLLFHceKAVIOjHDefa26mOl1PaH/4Y21melFDaiEsOd+jng2XNX3ihIoEUl
	YG6lOr+fwLAFfGtga4RkDMOU4Uh6u8Cl9N/Wc5YUnADNaf2ctxJaZjr31MGNVjI4pLNaxnmxxOl
	zAvzvExFImggG9hAdroyWJOyWD+iZpW9duemnHd9La4O6/FLjXQO+7aqwYVoWn44oqB2yytY5Uz
	oPhsPpRkeqUKxwZh9moJkbNKsrp2FggBfr8uUO3A9b8Qw/BUyj6
X-Received: by 2002:a05:600c:2c7:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb55a71180mr65200945e9.28.1794645022425;
        Sat, 14 Nov 2026 00:30:22 -0800 (PST)
Received: from [127.0.1.1] ([165.50.16.69])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c8a77sm9834201f8f.49.2026.11.14.00.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 00:30:20 -0800 (PST)
Date: Sat, 14 Nov 2026 00:30:20 -0800 (PST)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Daniel Carter <yass27106@gmail.com>
To: krzk@kernel.org, andersson@kernel.org, broonie@kernel.org,
 srini@kernel.org, konradybcio@kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, tiwai@suse.com,
 perex@perex.cz, lgirdwood@gmail.com, pierre-louis.bossart@linux.dev,
 yung-chuan.liao@linux.intel.com, abelvesa@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, yass27106@gmail.com
Subject: [PATCH v4 1/3] dt-bindings: arm: qcom: document Asus Vivobook 16
 X1607QA
Message-ID: <ffa1da6790284f668c860bd21203014e@gmail.com>
In-Reply-To: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
References: <2dc9301fc1ec46cdb66dc49a85f721b1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Disposition: inline

RG9jdW1lbnQgdGhlIGNvbXBhdGlibGUgZm9yIHRoZSBBc3VzIFZpdm9ib29rIDE2IFgxNjA3UUEg
bGFwdG9wLApiYXNlZCBvbiB0aGUgUXVhbGNvbW0gWDFQNDIxMDAgKFB1cndhKSBTb0MuCgpTaWdu
ZWQtb2ZmLWJ5OiBEYW5pZWwgQ2FydGVyIDx5YXNzMjcxMDZAZ21haWwuY29tPgotLS0KIERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9hcm0vcWNvbS55YW1sIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvYXJtL3Fjb20ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9hcm0vcWNvbS55YW1sCmluZGV4IDEyMWNhNTU3Y2UxLi5kMjJmMWIwYjRlZiAxMDA2
NDQKLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwK
KysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2FybS9xY29tLnlhbWwKQEAg
LTEzMDYsNiArMTMwNiw3IEBAIHByb3BlcnRpZXM6CiAKICAgICAgIC0gaXRlbXM6CiAgICAgICAg
ICAgLSBlbnVtOgorICAgICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stMTYteDE2MDdxYQogICAg
ICAgICAgICAgICAtIGFzdXMsdml2b2Jvb2stczE1LXgxcDQKICAgICAgICAgICAgICAgLSBocCxv
bW5pYm9vay14MTQtZmUxCiAgICAgICAgICAgICAgIC0gbGVub3ZvLHRoaW5rYm9vay0xNgotLSAK
Mi41NS4wCg==
