Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=158.120.86.30
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792457837;
	b=zK+tj0ZaOGTH+0Ksjbt2o3EQZlKiFTsGVEGcGMvwdjdq5mnTsIGw3A6oXKI/V9Ujxjqc
	 nyPh1eyu4V+kEkZqF0NI3117djul/72QTg7Kr57Ph+yZr7teLfjOFCegA1hyzln4S1n9a
	 4E8otWTfwMf8DnwGTp09S3kmM6+Xun9M+qIfPe6EqmAucuE2Wvk03g2eECzlMoKH8UJBd
	 gbUdDuiFynWS+9GntqRTXFvjKmmJnXviGqmwv34VUDp9VIZZkXxoDs+dS4fLjBosk0aLL
	 7QvcDD6+vqiRESx9wvz5cOtPCIxS+T3H12ogw2xdAynoCrdto43mxmIgnmr27kSnLuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792457837;
	h=DMARC-Filter:DKIM-Signature:Received:DKIM-Signature:Received:
	 X-Report-Abuse:Feedback-ID:X-smtpcorp-track:Date:Message-ID:From:To:
	 Cc:Subject:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=baFTI7feHfHjUs2Z1HfLPGTNQHlNGEUNjb1UhcudQe8=;
	b=dxLqLRtbXbdqsJxDsr0poyLkyhIuzwqYT1vFddeTTkpeh6PPrCC781IsTNWRl9Rpc5Ct
	 oNqNcXxTzLATluWk/1ns8Hu3UtZt+e/D+2lHjU0hFYnXWJNb4LRb8G+6k0WwmVh7IGzi5
	 DfWLWJ0JK6xAL7BNhYvPFCQZ3EbGRDsGE8gxQuyrivvnr4bfVP+vlvk/wKL+tMFHLqU5f
	 zAgBstiOaKsGsIhKWMleewr3mRKS8RCQxMbgS7TiGeYoNegieJUxb/X89shzJkaguNGfN
	 lGylBYLBQuXJ+P8DjafLJmk/I2pJTcLD8dFQtsmg6Vcm5KuvZWgyrNyOp3DYEtQUeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fkr.dev;
	spf=pass smtp.mailfrom=em1020969.fkr.dev;
	dkim=pass header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=s1020969 header.b=h4KyXZIj;
	dkim=pass header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=default header.b=X5G4kOiQ;
	arc=none smtp.remote-ip=158.120.86.30
Received: from e3i542.smtp2go.com (e3i542.smtp2go.com [158.120.86.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DD0606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 00:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40DD0606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fkr.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em1020969.fkr.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=s1020969 header.b=h4KyXZIj;
	dkim=pass (2048-bit key, unprotected) header.d=fkr.dev header.i=@fkr.dev header.a=rsa-sha256 header.s=default header.b=X5G4kOiQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fkr.dev;
 i=@fkr.dev; q=dns/txt; s=s1020969; t=1792457829; h=from : subject : to
 : message-id : date : list-unsubscribe : list-unsubscribe-post;
 bh=baFTI7feHfHjUs2Z1HfLPGTNQHlNGEUNjb1UhcudQe8=;
 b=h4KyXZIjCaaYpJyilEk61yTemmdv/OY44P//HdYFd1h4tYrADxw4CaviBQ1LJNIHYiV3b
 oq7vrq+iinn1xCIF6W6Bv7+c/rD9MEu642KCdK+YkaSWwegrOAs8ASbMcqlTef92VFPHQPM
 XiO+1IyF3Qip/1aD4SR2NwFf4dw/v2WfEFn0V9CIHvd8YlugASNhW4I/DPDsQcdorSSGcca
 rz4yPsREEBCCHnUT6GotsfnQdOWfMYTAtndsjQKYeugZV2NAu4QaC4o2W6v8zR8tEkkxLFr
 VUwMQdjNWwxfnRFl4vxE+jGgynmiR6LHnxq8ZT3doJepGrI1U3fJZaUv+Scg==
Received: from [10.244.246.9] (helo=fkr.dev)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128:X25519)
	(Exim 4.100.1)
	(envelope-from <florian.krischer@fkr.dev>)
	id 1xIyA6-FnQW0hPvgRA-l4b6;
	Tue, 20 Oct 2026 00:57:06 +0000
DKIM-Signature: a=rsa-sha256; bh=baFTI7feHfHjUs2Z1HfLPGTNQHlNGEUNjb1UhcudQe8=; c=relaxed/relaxed; d=fkr.dev;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@fkr.dev; s=default; t=1792457824; v=1; x=1792889824;
 b=X5G4kOiQaw0oaWEFVOVcN8ACj5el/tE15KiCmx5ZmF7yp1Y1qajbyAJEPkpol0Zi4Sn4Yqfm
 L2HfKgXtNB5ChfTtM1CH5qd5GYisvgI9OSrkbowFKQeVZ1VJHvbEiFgCl8OqYPTMK+08+sxKgEA
 e7rd/f+ZnnyqRl9kNPUOQ26jr5a6XXaAsqqiirg4B3NzcZzWCau74dg97dlR0vE5cFL7qxZ7Y2U
 PBGn3KJRVR8qMQPV80hFuvk2ijpXtIEQZb4CpbNEptimpTHkU3JcNOgd3bQUjwEoDDcJ1JcU41I
 RQ8crMwUucd7sO249fwKG3ugn+c9wOUG9v+hGmYbCY4lg==
Received: by fkr.dev (envelope-sender <florian.krischer@fkr.dev>) with
 ESMTPS id 5b88a664; Tue, 20 Oct 2026 00:57:04 +0000
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 1020969m:1020969amTSgpp:1020969sMMvfpqAzu
X-smtpcorp-track: hK-gxERgt9dH.klDvqhVpwxfg.hpsROA1MWbe
Date: Tue, 20 Oct 2026 02:57:03 +0200
Message-ID: <70f4c4d7f6263385d29ed8baa2106769@fkr.dev>
From: "Florian Krischer" <florian.krischer@fkr.dev>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Ion Agorria <ion@agorria.com>,
	Michał Mirosław <mirq-linux@rere.qmqm.pl>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v12 0/7] mfd: Add support for Asus Transformer embedded controller
In-Reply-To: <20261019100406.103687-1-clamor95@gmail.com>
References: <20261019100406.103687-1-clamor95@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

I tested the v12 series on an ASUS Eee Pad Slider SL101 running Debian 13
with the 7.0.1 postmarketOS Grate kernel.

The system booted successfully. The EC identified as ASUS-EP102-DOCK,
firmware SL101-0202. I verified keyboard key events from the EC keyboard
and touchscreen contact and coordinate events from the tablet's maXTouch
device.

Tested-by: Florian Krischer <florian.krischer@fkr.dev>
