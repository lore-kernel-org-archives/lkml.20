Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793853936;
	b=hPDjmVEAsfHSvgV/DnBDV1RWqUVCFuP2PRb2OUA3uh8JDH3/keySpglYesswRuk112wa
	 UcsofVKKJtD+/9AxPwIDqFlmwyROn66G1+PVv6rJ0L07dIK6A8jhwFu8p1scqShn1HvBv
	 jv9oIhCt25Jrgv/BGDoGL7ddPhCHi771eS7HL4/htMLIFPSh5GKxL54m9VOE8BBPUjJD9
	 xIuazYfGkUPuU+Ip6NAfs/Fl6wxNASarFItY2X3ikr5o3OC3Zx/9WRvv275TDzn1aHpbh
	 UyB6omGzeOpve+njRy1c+XYb/pN1VgfvHOx+sqe37WvP+Hm2xBTDVjxIcq4SU529g/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793853936;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=LC8E1JU+xlKJH/C7dKOwhVxP2QcBytjIO6k3NitYgsI=;
	b=unjXvs3DP2qL4Pcal/hxani+p3b/WhzwwRDEn+xSDerZEz4MmwI93qyy4JOBabSAoBDS
	 wL5jJRyN+dRxP4ohMbQYrm2kUogN/6rj/Wx6FKCO8SAbK6qjANlBHm92pyNJTsCuofcqd
	 XmtRXBAu/Pen/JwGm4HYsVVGF6lPV5wR53fN49uVaIngn2SLaqM/lQ9yJl2SCKRHj3khb
	 Gelg+IVC7JLs2t4YJ+K2Z5A0XBTmYYhmolAj/32eW4Lb2HCTfE6LBM+Ddy+xhJBoAT8rL
	 N2eBhTF2OsLoqe54LD8EZujRPkbGskXn87meCis+9pd/8UICtM3l7IGs6GD9clCgEMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CA0606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 04:45:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90CA0606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so702654b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:45:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793853936; x=1794458736;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LC8E1JU+xlKJH/C7dKOwhVxP2QcBytjIO6k3NitYgsI=;
        b=1dSJN+pbgWwJv5FEgabKcs/9deccb8sQuuiCJB1QsYPehJOk9mrsG9Cp7zc8XsNfDU
         OD4q947RMYxGefTh3BHvPFb4cd2sD4UqXqcXgNYsvE0pIdW6nvDUfjGM7L+DIbXw6OAQ
         7i2NKG4ZOI09TwtPGfZ4hGsX6C5ZK6xgmEHG+ETg7lDzqWVeHB1rjOZyoH38/BZ4qQAE
         Bkeyn2W4HwNyxeZz64Qvkx+s/JQpjmgxpiQ9WdtyY5RcoL2Fc5z4C5adiFFenU+pLING
         3t5VLowb7SzjXDAyufl0kTAyoJVLZ2xPe9CjGc7Ovo9fFltZEfiwDf8ljRdB6fNre6XE
         uEcg==
X-Forwarded-Encrypted: i=1; AKwUvBws1TbKztvlmlmQZ2i+rGdNN4r/mzGgMGmY6Fe9p+ATY+sAzfY4DYUkLRRXn8iTxDX70cg+dpv2Vmn98kc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8QkVM8RHY9IpRlFqO7Vo12IYRPBGlRJ4vgXDd4TCdM6qTVgFEZ
	sfBqlTlBtsr9EFqp710Uy8+S5BeYWQ4NM/i0++/F9AFQ55m4wz6XG1+g4u83QfKL
X-Gm-Gg: AYBFou0fD9HVPRXMuK+hvDD/wTy+gwSgaUWgo4BqsDPGknVhHLEhcWcV2wJc7MASKqZ
	ikB/PgV6KaNT1fBfseg4e1AzhZpkVDJ87hymmJH4VPpIuQnnft8ARjeeXqff/P+zxpnIkTQoqJ1
	eNpoQM5NaVUyWlAOSh9WSTL+Gcq6VkPoMRJU6hAd37Z3waOxeP/elc+vZaIH82344fqBzMEEMKI
	JcDt9hnh1ntS9b9M+/Ysdv9Q7gq+JBYztqoa1Qfd+MYdWzCkJD4kZZmFxy/om4j2ZfBqe0JtNHZ
	mBBFm2hGS5eob7Yn1B1AOxm6yoL30vKhcM1v+hf9TUtp1vadladTkE7TmDVxyLXSXrv3L2g36EB
	c+m0wM3yQdHiI1yA0jdEssGZwfxqIgLpUThu6GRW+hoWvlkJ4GPlsk/YAcRoCg0JN4B4HxyshFp
	VDlBW/mQRWm5mShgVMwj1zhzc2ql93qUN0tlH6o2TW0NKSjTHa7r5UKtF0cV3vHI7gpmgcBe6rf
	E/qjCa7hEqBYh3V8eHxp+c6fgnmzHEApSwEEQq4Fejysvid6KRI8h0KDgpLLPi7YRPBkW/3PS09
	gZpXH1+FHlnlwUYyYSi+CfE+huzN1vAirmN6WYAkimbumk6EpKTgjFMAYlNv5sx0w5s96K2e88O
	H05QHVLTLSgKclBuKyB6ar+ArfMLW9HBYNUXKg5xFtRc=
X-Received: by 2002:a05:6a20:1f28:b0:3e2:3392:5408 with SMTP id adf61e73a8af0-3e928ff2900mr15054503637.79.1793853935832;
        Wed, 04 Nov 2026 20:45:35 -0800 (PST)
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com. [74.125.82.173])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb469b1f96sm1686436a12.30.2026.11.04.20.45.34
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 20:45:34 -0800 (PST)
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35b2c599f43so1159619eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 20:45:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByYpJWP+XUPvZKTLf0BC+9MldsN7BUSvbczZ6yhSmAEneNKU4a/vJNb58MCvGfpXIc3fCnguZntbk1tJ5k=@vger.kernel.org
X-Received: by 2002:a05:7301:488e:b0:35d:d671:933a with SMTP id
 5a478bee46e88-36a423a2dbdmr26720849eec.15.1793853934050; Wed, 04 Nov 2026
 20:45:34 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-sf19a2890-pinctrl-v1-0-4bb83afdbacf@telaak.dev>
 <20261104-sf19a2890-pinctrl-v1-2-4bb83afdbacf@telaak.dev> <20261104-geiger-handler-f6688647819c@spud>
 <CAPY4CJ5pBrypa1PKaKRPxb9uvaJBor+FzUXY0+gxLHOUy7W-Ow@mail.gmail.com> <20261105-cilantro-neglector-a4cdaf9bfb2d@spud>
In-Reply-To: <20261105-cilantro-neglector-a4cdaf9bfb2d@spud>
From: Joseph Telaak <joseph@telaak.dev>
Date: Wed, 4 Nov 2026 23:45:22 -0500
X-Gmail-Original-Message-ID: <CAPY4CJ6wP=NUM-vC6vadWk2sgsKV7HHBGzmX59SW_nWFcN6jsg@mail.gmail.com>
X-Gm-Features: AclHuK8dw6v-9VJE5UUbXK2KpxAN1TMyhZVbSc6sgeM46dW7QyrpEt_39Ek2lZA
Message-ID: <CAPY4CJ6wP=NUM-vC6vadWk2sgsKV7HHBGzmX59SW_nWFcN6jsg@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: Add Siflower SF19A2890 pin controller driver
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Chuanhong Guo <gch981213@gmail.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> huh, I totally forgot about that. I guess you don't have to do this if
> you don't want to so. I think all the generic stuff expects pins to be
> numeric.

Thanks. Then v2 will keep the pin names, with the driver's per-pin
groups and pinconf_generic_dt_node_to_map_all(), so the binding can keep
checking the names against its enum.
