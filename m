Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE0F49B461
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 07:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791963783; cv=none; b=MCszQ9JFlnArskspsT1HQPqVjYbJXVOMtR40vVqidsHo6NCQqBpWhbT8xTaxtkS702QHXsCYoSZ2DalqBc1cPp9EjwPntwKWLEySWwiTHhWXVOyfeVU9A8JV6wyQ8zrlp9y9f2ZNTbl1ljgFsDJrZSLmhT4YHC7g6W5NtbDCKFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791963783; c=relaxed/simple;
	bh=/LAPMn+LWxuycSEybb1879FRpu0FakFGn+8dsX3zR5k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CN8tKwabaeaPj5h8ReLyw6mOIXwswdyR1mwFm7wPjK991Cre+AEj44dyj3plqyFweZeIGLLQNGgvvFFwKWQryfS1rmhA5Rpy1FglZiYVbfakg2PRtdyMB+C3BuevL2xcEXchwrqUhy23TaAkwIsXtkyvf/+tgNeygv77APgWUb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=cw9OEKGZ; arc=none smtp.client-ip=209.85.215.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sgsatyam.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="cw9OEKGZ"
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so2300445a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 00:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791963773; x=1792568573; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5L1lZaRwvy+lv6sOFzSh9Dh3O0FNoVx6u5lQ84NrzXs=;
        b=cw9OEKGZQDjapvXQrQ7BnYV7I2g1xiAE420CsMUh7ZnxBl7l82hlgPrcDG5H5TusjO
         I/8PxRkHuAdipGVrBUUpVTbMFDSr6tWsA3iOw4bhLIIWQHXfL916MCFtu1N5urGAIHLY
         QtSDxJLS2ger4rlR9eQeyGgiL1htY5B5A7/F6EwJ6QRTuq7hSKNCY8NFTmlYHCdMV5e2
         6c9hXiGy59O9Nj96BqB1BIBcv31xD6Ok25Xl4hsJWLVd4h+1lEgDBRE7wOqBcJd84FXl
         nmom2V3x1hKugJLwLtUpeLkSmapx/8undcl8ChADBMZUWx+/NzYcaNytajwEu02Q1B/F
         e73g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791963773; x=1792568573;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5L1lZaRwvy+lv6sOFzSh9Dh3O0FNoVx6u5lQ84NrzXs=;
        b=Ffa8hE1dv2ESVbfzghMskKVX8prGx8IqMqy1AOm3aJFt8jlvPmNr5Bnys94w5Q7HCj
         C4ZRpQ1VgOcLQHZJnrBrcPobHkzjbuluvh5Hqru4W5E7y++s+xQZcVHSxmlMtcFHyc7j
         sAzplU7lS/6T6EGTh2kKBhRxAdRc62z9nlEGpm97QHBO2/UeacfeQgYepY1y5hajJkak
         y7pIa7sJX2X6jKADNy43qmymzvba069b/EUlwkntxLY78CO6E+nJi+5JpAbpb2MPevnp
         epDnrqWa3ImPgSpTynDg6aQY0ZWIa1vJBg+I2p+3jf3CETjQgf1ON7sgZSPO+CWoBpvL
         q7fg==
X-Forwarded-Encrypted: i=1; AKwUvBw1PMGuUK+HjGMUs11rYg4EVlGxa4PkNNsgN67Gp8Q2jM37VReIk7Bq6lZZ+s2HFjgtiWZuU/DicWxFf9o=@vger.kernel.org
X-Gm-Message-State: AFq9FYKVoNW2IrTy86/5TR00y72HDjraESGzVUnYef9Aq7og94eJzv6G
	Kc4SZ85hY+wIpco+AQWFIspY/sdZoDMaluFzMsmgv4aRp+fZq17DHSENSAUDltjjnYp5CLSQcoP
	1xnpYN5EGab+v9w==
X-Received: from pgbcp10.prod.google.com ([2002:a05:6a02:400a:b0:ccd:a8e2:7ab5])
 (user=sgsatyam job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:c885:b0:3e0:d5c0:74b3 with SMTP id adf61e73a8af0-3e16bf265d3mr14483848637.65.1791963772206;
 Wed, 14 Oct 2026 00:42:52 -0700 (PDT)
Date: Wed, 14 Oct 2026 07:42:38 +0000
In-Reply-To: <as8l1oKtNsIwNHWr@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260723163838.1698125-1-sgsatyam@google.com> <amiBVdd1KvxbW5Ul@google.com>
 <20261013105713.1369546-1-sgsatyam@google.com> <as8l1oKtNsIwNHWr@google.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Message-ID: <20261014074243.2498612-1-sgsatyam@google.com>
Subject: Re: [PATCH v3] platform/chrome: cros_ec_sensorhub: Modify clock drift estimation
From: Satyam Gupta <sgsatyam@google.com>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Scott Collyer <scollyer@google.com>, Benson Leung <bleung@chromium.org>, 
	Gwendal Grignou <gwendal@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Satyam Gupta <sgsatyam@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Tzung-Bi,

On Wed, Oct 14, 2026 at 06:48:58AM +0000, Tzung-Bi Shih wrote:
> I'm not convinced.  I think they should still separate into 5 patches and
> form a series.
>=20
> > > On a related note, is [1] still relevant?  Should we disregard it?
> > >=20
> > > [1] https://lore.kernel.org/all/20260720110405.2127011-1-sgsatyam@goo=
gle.com
> >=20
> > Yes, [1] ("platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap") is s=
till
> > relevant =E2=80=94 it addresses 32-bit EC timestamp rollover across dee=
p AP suspend.
>=20
> Please resend or include it in the same series.

Sounds good =E2=80=94 I have separated the changes into 5 patches, included
"platform/chrome: cros_ec_sensorhub: Fix AP/EC TS wrap" as patch 1/6, and
squashed the MAX_DRIFT_PPM =3D 5000LL update into patch 3/6 in the v5 serie=
s.

Best regards,
Satyam Gupta
