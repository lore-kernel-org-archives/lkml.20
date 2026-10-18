Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40920349CF3
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 02:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792291097; cv=none; b=owMGjtQeKm4XqHA3Lh11rGIatJMakLczKpzPaO71+AA/oFPAr3w/ukE103UMLf/eLseQ7flBB0DICAFRgDlaU6nNEEiUMOgeWFSBpVZyREVcVbwFXCDNlJhdBq5qMMte5Z6fsq4CgnhuUuTnoo5uKTK6w0ByT4/SEEqAKJaagog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792291097; c=relaxed/simple;
	bh=OprDKVD3dlInOK+EtkJkBGY3nlx9HocRm71U+En4ns4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZX8ebRiVISazO9MlxNb2L/6p1oOF4SnVupS59CwKc9w+442uuV4RN1P/PczYhEo6foAMxZHsW4cXtzU2yLP3YExjuGkGpRXcZve3ETOFBTQWtCvQUV8Kz2goWfI5OSm6xHoVGsDRs3/U5K8CfDdcnd+RzuoBooV9SbS3iyxsam8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de; spf=pass smtp.mailfrom=bairaktaris.de; dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b=cFtqatdM; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bairaktaris.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bairaktaris.de header.i=@bairaktaris.de header.b="cFtqatdM"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b1cc392d8bso1134789a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 Oct 2026 19:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bairaktaris.de; s=google; t=1792291094; x=1792895894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=cFtqatdMQKgmQSYSq39dS9PbMTjb/oOnEnOFu2GDA4z+ZyGbjIyySV5az4gfb4NtR9
         AVD/yCtLpvN0/YjkCU76bBR4Pnsj+PgIlEzafq8WYIpazHeQh6l6rsLdenVSs2FMa2ja
         5uhksrEELgmHbcewXdjdG3shuBifY6ia8hdn1DvWvYQvp3eaqb8Pck0qAPrhu7tFOfIa
         9YsX4OvnDOxe9pDGLESLlwC3Tcxur2p9YkEXHh887S3AN10uKePWr1El2P6t3TQUIJf2
         a9s+SJsSn8KYtnawo9kY5Ca0RkzAsPej6F8ZT513+kjcsYEmcE6zs2Si6xnd/tZUKuk3
         oLkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792291094; x=1792895894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uuVxX/jLPtohDOq387cSqeqHjD2U6i5S+xDw1QtsGiQ=;
        b=eZmCfKVj5bVTKiR9wiBDStB5wojkjrQcyjMtxuPUHcaOm34/AyOF+PQ5kO2XaKF7kn
         my4qgJqCBNImjWTmc5Bif2bPgw8goH97pbE75o69oDtlcdsH1tJUjGxpT4oNzbJHANzK
         JOTUJ9Vq8Z8GYcWKf7a6ex8Qt0akn69/rX9MqZ7ddpue8VhhvMhjKqKJ9s4zlVRnPWb5
         f2VO6Ey3ScNieRUUBQ0yGkqbWdf6E8L185WQ0ftBTAcqrTWZx+EAKAtvC494satOXz6M
         /HOoePMWqIi4/fmVAYnX88tkoH+1ATCeaSasEEwCQjWaYikukr4wSS2bsWI/QEkT0qS/
         xIhw==
X-Forwarded-Encrypted: i=1; AKwUvBxbvAZAnnIh/FmlNYoA1V3/UN7w/npoLRiqMtXokDN1qRef+wYSldGHrACDKHE6ImcdTG+Ood6SNXNjNII=@vger.kernel.org
X-Gm-Message-State: AFq9FYKmeWkHiTO7Lcp01W/a4OkWdUn3CcRGJQVERPBvtdBYejgKKUhr
	AawXWTxEhrJTg48QtJePvdfisIoTCwPefm5AD2KKhInOlnu2EPrvK4X1tXrif+SbfQ==
X-Gm-Gg: AYBFou1PnR64pWrGg4XPrhi8zD4SC0VmYZ9hzk7XpExf7YPXW4exFo2O6lxOIfdG8BQ
	cfWi1URKZYXQwYNwe/a2ICfP+Y/seoeGyU0CQ2KkaTAyOwuNRSjAHGoLlnLedWMmHW27FW5gH5N
	tQYQzvkPdSJWwnCNdggsPzCMgFc88H9LM1b67i7aArHax9ZCpLG7bG8Aw6SnLsOqD+tlhhWr8s5
	90unO8YEGWs20SrwhjhMXkH0PISnmUJZ0+Ju9Iq5R8wRvmfVa+TnIX0X1weZbYnjh8LFOZYYURZ
	OT0w7Wdd//p/dcwMNA9qY6YeVFqAA3V89Dup2g1CxjL4PUu/6HC9y1f3ONRt/CWw1JmHWSgWS/B
	pKQMGyllv0h0YSckQtVcPovWoUTYf5/wcq472U4xFth9UTAyaVNGe7T3yiVauPJsLZLbjLC3IQz
	M/qZ61wxXv7tEwsYQT6LkJhEkJXa/O+WRIK0dX2503XDplcji5rPWuLLa+8HZgtE08mqGPU0QxB
	dsFnGOJN7+k2tydUOdSjveEeWtvKgQcvUiKpZYdodGyCNpQwrzF85N2gJPxmiG56n52+aC6uO66
	U0/DDB1lDnJs3n3fK1c7svKRvMUQ6WDSQ1p1QILZvzPLZ0Y52j6FEDTfZ/HYuxuUX2X4tOQBmMb
	9k53oz+oWCVxG/kvQCjRujz43is65rhceE3E0YZPhhAXdCYpQEHkXuBwLBtrccsnvSpvimy7lG4
	nWm2vpyXJcoQ87+0fZtOQ=
X-Received: by 2002:a05:6402:2489:b0:6a9:850d:bb38 with SMTP id 4fb4d7f45d1cf-6b3a81766camr2392870a12.10.1792291094015;
        Sat, 17 Oct 2026 19:38:14 -0700 (PDT)
Received: from Desktop.fritz.box ([185.181.130.213])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1c80desm2356771a12.20.2026.10.17.19.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 19:38:12 -0700 (PDT)
From: Julius Bairaktaris <julius@bairaktaris.de>
To: pablo@netfilter.org
Cc: fw@strlen.de,
	phil@nwl.cc,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org,
	netdev@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	saeedm@nvidia.com,
	leon@kernel.org,
	tariqt@nvidia.com,
	mbloch@nvidia.com,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH nf-next v3 0/3] netfilter: flowtable: carry a priority into the offload
Date: Sun, 18 Oct 2026 04:38:04 +0200
Message-ID: <20261018023804.562323-1-julius@bairaktaris.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <atQk1d8Tv03iPN7d@chamomile>
References: <atQk1d8Tv03iPN7d@chamomile>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sun, Oct 18, 2026 at 03:45:57AM +0200, Pablo Neira Ayuso wrote:
> I don't understand the "one flowtable per class".

If the priority is a flowtable attribute, every flow in that flowtable
gets the same one. To give sip 1:3 and https 1:5, you need two
flowtables with the same devices. nf_tables rejects a device in two
flowtables of one table (nft_register_flowtable_net_hooks() returns
-EEXIST), so you also need two tables.

With the per-flow priority it is one flowtable and the rules that set
the priority today:

  udp dport 5060 meta priority set 1:3 flow add @ft
  tcp dport 443 meta priority set 1:5 flow add @ft

v4 waits until the fdb series is done.

Julius
