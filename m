Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793069053;
	b=BTOw8r2GrTOMQQR0uc+t4cAKafpjqP3D+2/e3IWbK1Dnxd+YWxasl5XLzk8K4NNQEjJu
	 1HE3vUkUrCOutM8NIQ+UZxksk/zuhqqW47ooL55gpZd4fYKuFsa7qIbiZuQEOh2DaYlFN
	 +L3vvMnp+rw41UergspBJe4rcSUT7cm0q0suVIeMFJ9XNOEmK/NIVySIUr0CcK78dk7DP
	 xF2zhFNy7Z3vaL1nK7IDbIFMaXtTzi8R0W0znEEMIOLvBjngYzv4IhTh1Ed2ycER+efb0
	 cCKxeHvwc9J2o4xdrfI9QF2pAaiV3mS7t86QUo9ra1YZqJV91WEFnXoAshBvYPjBTfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793069053;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=N/k+IDv8sIi75JOW8Ht1HpeWXINGXQx4B+WYQOoxHKU=;
	b=ClI8bJBmQSqtCBYyfIBzl8ex0rxBXgsK8v5h4nS3QHVtKeSQdVUcw9g2TEf45Ur2VMpu
	 9wPQSv+BdbU8pbA90pSpQ4CX3oxRw9GuneGWRmPB3632QSAnkOcliNiK0XNiUmEBJE1p3
	 r+MBc67klnogkJQTmeiCtaKz4eZx71pJRLtrX5QrXqRdw0hRr1nzAnYETrtVoL6q6f7ou
	 5W5/mpaJ8BL8zyjZXm0jmKimE69Fhn4E/2QNhjvfdASxmOtiCzN5Ck++QqrAaEdyS326i
	 yQnD8sXkyKaGCywfVoDbcsqwCOVxBoMkf9iC0/cebZG2+s1ud1rM6B0TOAyqUstdZUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QZJS7Ii6;
	arc=none smtp.remote-ip=74.125.82.52
Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C832606A31F
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 02:44:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0C832606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=QZJS7Ii6
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1430eec0070so132011c88.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 19:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793069052; x=1793673852; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N/k+IDv8sIi75JOW8Ht1HpeWXINGXQx4B+WYQOoxHKU=;
        b=QZJS7Ii6zu5XVWgGNt/1sC3PsicC3FVdAj4Ef5bJc0Dd2kRneEaKIDKRyVyMgMenm3
         p3RFIYJMOAm1axva+FpXqcBprc/MYnL/dkFciBObe7aIOOZrJZqKFSLIoynm2ghwJoMj
         N7sqzRMytnXpUH0hGIQSqp4kqKJhZqTVn4/qeWMb4l2XhaJfhxj5hoFatiYWIjslxxWg
         N1010rstYsfcJYOoqBa3QvWfgd3NXbZMb9V7pnx9G6MWAH1hhOne64xP0wF44seVYApp
         fPoIw1jeWCY1Xeaank0iyJ/Ynb+BqIzU5eKgH4F5Q/hxSNvG/4UXzyQfm+CXE8eX6+t/
         +biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793069052; x=1793673852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N/k+IDv8sIi75JOW8Ht1HpeWXINGXQx4B+WYQOoxHKU=;
        b=fT9KWYFIUV0fNaBDPNPcxc7zXtbZYiqPK9hyDBgwj1ZEjZfUVgInltmijOAcIOA8dl
         0MvvKodGpYK013SO/YgSEqLW0V8C5EwMl/aDSY6BSqH7C2mJ7wQyVoMKdATuWe3TzoMs
         RjrtM8CNVBPaIQNbhQ7Q5Pk8DiXKsEXrFEPFOdoZt4yturRcUBHw8T/8Jx3VdUT0yVc4
         rwHqI2jjsRD9PttnpBGKkH2SHMw56Y/SXpB5IBZkyZWKaLF6pYXjYXDm1yiH+cwTL8Xm
         +BC1n63UBv0DP1mB9b3F3TGThzoqQz7hGJhPLCpsO/pjdASjGSQnc0QC97Sznu6JZj6+
         Zaog==
X-Forwarded-Encrypted: i=1; AKwUvBwSBLPw96YLzh5tXpP4esFcUeWnzKT3Sh5PeIMzRy4n9069LsrDFSL1pVG3QIA+qfhs4nDJ6cptzOkgLXI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIuNF+STOP/Pb2RRIHbOgSgCQAYk4gnv8ugEis5GsufH8/ruaPU
	/tnnzYpTBLTtGJM6IW5vFaGYI00DH8+zwpY5d9MaRJ+pb7gxSuSH2gaP
X-Gm-Gg: AYBFou3yB/Di5f2vrvT7jgRYt7nHwumSO09zX6/+NUn6EgakDcw+HNm9CUGsXBsdSqq
	Tpkm/NlreUq+j1p3l2VA7S7GEMxFaWXm9I4zoyao4EM6MRW45InD6yYPA7bxAm+RKueBEiZdZqm
	imQ+CJHIX/tanPfS7xOmgkWe5Lb72uInqOCO08RNDK5M++jDdcDQ2UrUPivtYDx/DMFjIYJqFwk
	QfOkexUuCi4yPi8b6fZFPvVkvr+MepOLB5f0QbKz7e5/Efk/vlrS/6HH7bBKoj8ZPDemGc/8AT5
	gkn03J2KI+iRqjpNk94BthPBwAMrG2CZE6KjOtYCBF9eSTkkvwhJxCYksRQNObePD11hkBH5hqX
	YBWvV0eeR7gLMker5fCFUczil0RXY7qahKjgC4JWgtE7RfMfbm+cAnTXdVyv9wj3feiwfsaQc9Y
	Wmq+W314xpql95jTg3vkbxfVH7FEyaFWwP0jz1FuNvGqp7gzOkoyrVbiDf4XbDPb4aD18MdRPvN
	TAv3Tb0CNHLTLWS4FSvoH+t+nRPePaARhAtYl7SGgsDB8XQXt2unDGMz6EUQDUVj9wunkp7MixW
	xLT4CAwUYYoS1Cn9dAo39LbZ0OPTMISGxzCSCeurHhJkiDzzr/dqhavNdnbSJuOIG0GW4n1APa0
	aqTg//D9uxw4S7smNWTJVciy2QyNbyIXswnxB5fEKsKeAJR4=
X-Received: by 2002:a05:701b:4308:b0:144:fd17:3b21 with SMTP id a92af1059eb24-1991bbd19eamr19551190c88.0.1793069052008;
        Mon, 26 Oct 2026 19:44:12 -0700 (PDT)
Received: from esteban.tail1178e6.ts.net (132.20.31.150.dy.iij4u.or.jp. [150.31.20.132])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ea25sm27596670c88.5.2026.10.26.19.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 19:44:11 -0700 (PDT)
From: Antoine Pichot <antoine.pichot@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	djrscally@gmail.com,
	dan.scally@ideasonboard.com,
	hansg@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] media: i2c: ov7251: Add strobe output enable control
Date: Tue, 27 Oct 2026 11:44:08 +0900
Message-ID: <20261027024408.354057-1-antoine.pichot@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <at9uROkXwXmNzFyh@ashevche-desk.local>
References: <20261026111032.88355-7-antoine.pichot@gmail.com> <at9uROkXwXmNzFyh@ashevche-desk.local>
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

Hi Andy,

Thanks Andy for your comments. The first two are fixed in v2; I'll
take care of the CCI accessors in a follow-up once this is in. I'll
send v2 in a few days to give everyone time to comment.

Cheers,
Antoine
