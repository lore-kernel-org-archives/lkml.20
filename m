Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794371036;
	b=anzYy4bYx4QT5oDzlJ2pI2PzNzu27iKLpVzd3N0k+/SCBwD9MNWhBmqmMld/OvVj6Ata
	 sYqZrYL6wkVdfARzrJLhNTCscImMakBiU5+c7+jb31LL8VFmgVVEoFINqpGPc2/nFasjw
	 xJuLVAzbnFq0LAQGYYuIFGHalvx9PlhmtyRv3AWrMh+h6kf4oeZDh9WC8JUsy/W9ULvLa
	 jVZKCom70FNwND+HGn5RbukCQmnUh01df+qDzPbGddA3m+35IbHTnSTCyGXHH0obyUpyT
	 fCkrOd2tZYeEZaKixR1XCYTxBCcsTfigCmjDeaVpUrq2G5T1/jPIBtmVkUr6ZuJXR4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794371036;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=3/oMUvfjnRDqTYECREY0yvKf+oNzhYCqjwUaHTL4kiI=;
	b=S5H9mPLOx6Zs7fRvv7EXYWZrE1HBCfbDITskM6pD4RmbtayTIOvymlO+xDhM6mHxdDBR
	 f+hsAB0twurIqzadk1u3Ay/G2wZ1Rti4jSdaLubhreMgiaApYTdP4MIdcza2jWSEgoHkK
	 +12hSiCyK5tlQXVcSWNuAn4/CbfdGFejOEWKWXS9VU779LUk8w8QgMb1PVymUSI4v4o82
	 9LdxJT8RhuPP//kIj64/Osfw6V6X7cuVfPT+uZjok/TLcRkXGBl5+NpRi4tT4/Tur5XAC
	 xrkc9EsUDjDiwdmEfw2iM9ywBQqjg3dm0SO9Nt5CbBGfcqUNTTFhpFXvxgwSY85a4kQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=andrewgigena.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.181
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943EE606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 04:23:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943EE606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=andrewgigena.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-8b394e2af9cso11084037b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 20:23:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794371035; x=1794975835;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3/oMUvfjnRDqTYECREY0yvKf+oNzhYCqjwUaHTL4kiI=;
        b=VgZM84Qwl77PCN766DodcAXCTFXm8cu5D+PqFNb7WRsygU5TovZDxkLRlXNpZJO8EH
         KOhXVrtUY4eBdMdka0BoyqifMucLGqA2KZZs5ymQ5I7qYQL33ps/qX5+ndxGK84ytlSY
         yrdIZ8GrA3DOm9t8NPI5EMM8CbRbNN5boI9J3XV3VMk/r49eH2wn5ikoMldm8tLxtIp5
         QF9ruHIzz5r92fkgR0zgtzD5+n9cRgNe1AId2ZooL5Pl3ihtD3QwgKL2Gv8V0ZUNYmwS
         bDUC9J3ql5tyEkgz/FYixB/wyXxEh5dh7L2GqB8jaiInby45ydteNnD5oyw4Ld2c/CTF
         5g9g==
X-Forwarded-Encrypted: i=1; AL+hErF2uKtEvQMFW1vBNgqUOarnonvmkedPdzqOzqMg/ome9Fyst1df8NN44wb7piUQSGJEQ3PUFqKse+dd0Yw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zCJVBQwA5X9CC/4Uk9/PifgGWlqUmxWNK0l47ZfF+qN/tkB5a
	G6JSpqDZbldQsiWt1af4CbxQMas+HLBW1lPk/yyVEpmAiQW0bD+399aB
X-Gm-Gg: AYBFou19t7miXR4+eGAmeKrRW3ceLu6wj2zFybfzek5UenNGNDNCBobLXI+sbrHG+lS
	AFaXplgf8mfM/V4plHVfcXX7eGuopmU1Dv1U5zcxNw3F7xBdSDeJLyb2MIbS1BfknRAWpBex/yN
	T0y4dMpriTpND0khbJ+3j2A39IKe+wBaObwSWTRUkv1fYE2+J8RCBgLORmrvFUz852rRK7CWMDH
	Edf/OqEBNiG6IKG7n9N3taSZ6EXz1onncAiIFbCQwfRSTkRm3hW2BaIVnxoJIA9r4j61dnS8VbJ
	fBeN0Ms817K42oZwl0S/T1Jk0UdFglD5yJqlrhROG7xcazHyij5OcjthTunZYG7Ea17RL2ldJ6Q
	8GYA2ZNbczodqGbzUyHEMs2klroUhh/83o66Oa4b2rFaTlVB5GqQ5nnoghtV15yJTIoqU9H0TSM
	TA8DBPX6DMsuZbq8JCWW+DlEXffqNqAk/SRtLd8RRhlheAfGAk6eEM0ZQSr2wwbNTKf9n2vaqaB
	aYHRfSO65Lu/mfZ0V5yL36h++Pw5DMuh2ilxPjBrFwGoKl8AZQ8r3FYFTU/gJNe8jA6pzlDqRXi
	w8GD4ZLDNRze0XC3pOUn4QSAqO6wm/TZUBX44s1QiCpNCvVUJECKhqOPXqRXvmlrGddDJ7XF
X-Received: by 2002:a05:690c:7342:b0:8b3:23f3:134d with SMTP id 00721157ae682-8b3a80ee26emr9648857b3.42.1794371035274;
        Tue, 10 Nov 2026 20:23:55 -0800 (PST)
Received: from ?IPV6:2800:a4:806:ef00:6378:bcd1:64fa:19e3? ([2800:a4:806:ef00:6378:bcd1:64fa:19e3])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b3933a165csm36073107b3.14.2026.11.10.20.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:23:54 -0800 (PST)
Message-ID: <fb4d03b3-eb35-4aeb-baa1-f4df54653192@andrewgigena.dev>
Date: Wed, 11 Nov 2026 04:23:48 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: crypto: ice: Document sm8150 inline
 crypto engine
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Herbert Xu
 <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>,
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 linux-crypto@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
References: <20261104-sm8150-ice-rfc-v2-0-d697bbce0278@andrewgigena.dev>
 <20261104-sm8150-ice-rfc-v2-1-d697bbce0278@andrewgigena.dev>
 <20261106-offbeat-hawk-of-purring-50a8aa@quoll>
Content-Language: en-US
From: Andrew Gigena <mail@andrewgigena.dev>
In-Reply-To: <20261106-offbeat-hawk-of-purring-50a8aa@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

> This part should be a separate commit.

I splitted it into two commits in v3:
1. Add qcom,sm8150-inline-crypto-engine compatible.
2. Move qcom,sm8150-ufshc to the standalone-ICE UFS binding.

> And what about eight clock? All existing DTS will report warning? I
> don't quite get the need of this move.

After the move, SM8150 UFS no longer provides the ICE register region or
ice_core_clk; those live in the standalone ICE node. The only in-tree
user of qcom,sm8150-ufshc is arch/arm64/boot/dts/qcom/sm8150.dtsi, which
is converted in the DTS patch, so there are no leftover users of the
embedded-ICE binding for this compatible and no schema warnings.
