Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793701885;
	b=zZZuUwkuQ+zdqkQ8NnKbBzB92sLDLAY+rH6qHpK8gpV+kob4YJ028HOL5xEu0vBtDJ/o
	 6esbTDwGOS19BL0K7kcRsI+g4AV5NlJ/W1sMdsDSsdjquXyi6Yu0RK0c6d8RbcuofnuXX
	 1SBAUs1CGC/XuOXIfxHqn3c3iIOv1G3spiUW8XaTNnjRMlvKFYJw12fmrtVl0PWhe9F/+
	 M/n0WdJVaX/xqPx21dZDEIiB9/KWj6S3YKFvJpnTWF7XqeN8Gd72ikEFsKexWA0DGnBOf
	 ryQ9782OxWQQ46gf/q2TjnLyeh2GrvDcv811anmeBbCz6bgMwSX8iIhF5uqwzWQm0xg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793701885;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=s6jlXuIWGSzJYM+4zNXCauXxsYreYDY1Mmi3dicUxAE=;
	b=cl2vBuY7gvZmnCk3RGCVHIYcS97iSexeCvpKZgsrNhcVE4d5JsfoNKWZrE4XFuZe6HeL
	 wo5aMQ5Ytbqf/WRCSy84vDiHuE+35yM84RYct0UJDO2nrGYbL76b8doXbTEh+n2ebK+M9
	 qeHyXLZHlunVQmagTXC6xpS5vSB6ngtj8KY4+ma+CNDJcwJqIQA+c/5JAYklv1pbJK+T5
	 I/tLtrcXRLyExIRpR4leH8TynnV37CVcsjEuHYTuXRSKdpXAJCx+WrdPWiXZxREd98lIL
	 1y4Fq3S1oPlAvp/ghl88roSdbMBPBjRBGxVK0rga+NC2hsEhTIKKT9lkaw7xkNfOLTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Cv5RSPPQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B846D606C54D
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 10:31:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B846D606C54D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=Cv5RSPPQ
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 23A9B202831;
	Tue, 03 Nov 2026 11:31:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793701883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6jlXuIWGSzJYM+4zNXCauXxsYreYDY1Mmi3dicUxAE=;
	b=Cv5RSPPQn30y1ZTW4fRUry8ConHRnQrBGORFkDfAzF3viA6ZQkABwURFbHN/P3UKlCt60/
	UHTH6GI73/6U05YQezifes3e2SIxo92DpfBRp7WlFhA8Y6iw2Z40zBlqgRYG+AGJa5h8Ti
	8JXatTSGAuIVEykZcwEdi3JCT0C1xfefLOuQRDVnNqv59KLrnAsYqtcqvnawjM20kV7EWd
	OxQ7C0KzYfVwSeyQ/YIZy1964JcW2UYHf5w0yZ8S1s/SNeRvp8F8MIvCG7TW5nmxic2pAP
	vI04wZan2Tq7k5dhrikF5f82ZVEfAh1XPX58Z614I5k+HpTs8UwisAzZNR1NrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793701883;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s6jlXuIWGSzJYM+4zNXCauXxsYreYDY1Mmi3dicUxAE=;
	b=S5RDCzoMN3N/MZ8JQr9894KHAO9yFcGOByfeixcJmPZmt8KRys9OVuvpc3qoKbY9iROGuc
	4wTXY6hwvU9aY7SucQ/byD1p/pZAdw6iTW8685SnLO5xor0sQNOq1P3/Fa7/Q16YqQYuHj
	0wqNdgyhVztVi/0TgAzs9bu5SgfjFHOptyeTswCN3TCQ4u7pr98mbHGskPZdRBuPejJfAP
	N8w/BXroCHmkbdsc8GrHfJrFKCoSlLgGPGXejoIWvoCdF/Alr0CWubTaRPh3qyQnVbu5GR
	m0KGsVS4Pa9AeN2NKWs5svuwwsmETwbPPtCxrQbgxD+u7OJzuSil5/vUtNCadg==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793701883; a=rsa-sha256;
	cv=none;
	b=Kxv4zJElW81wD8YConWNO84wqLJucmL6gFWeGdzsal3HRDzmyTsFHaKZeYmujvBqh0qJKB
	RBmUXaX3RKG4JnA5EdJVYgmd7elpiTOV/mMyGj1Y5uphmlqX3U2kZWAL0uSGz0lSNBHvY6
	Qp7LOv4HEUT+iwQZfdk5qLXzyEffn4ZdVE1bN16wWGNT550AdLi6zO2OeewN+UviZ+kQKB
	h7bBPlw1NDch9vhJw7smibTTrGtctbcd3D2KJ2VkHuAgOOsD/+b6Uw3yyx22cYmIsqvy+S
	7HPsqQhMj/dYSfhjawjf9VI60189+BOYDlqZ4fhEg+lR923uDYfpk5dXtBTW+A==
Message-ID: <997efb02ed01baa188011d951724596a4f331184.camel@pengutronix.de>
Subject: Re: [PATCH] reset: fix racy acquisition of exclusive reset controls
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alvin =?UTF-8?Q?=C5=A0ipraga?= <alvin.sipraga@analog.com>, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, linux-kernel@vger.kernel.org
Date: Tue, 03 Nov 2026 11:31:23 +0100
In-Reply-To: <20261022-reset-acquire-race-v1-1-adab083d7274@analog.com>
References: <20261022-reset-acquire-race-v1-1-adab083d7274@analog.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Do, 2026-10-22 at 20:06 +0200, Alvin =C5=A0ipraga wrote:
> A given reset line may only be acquired by up to one exclusive reset
> control at a time. If two tasks with their own exclusive controls race
> to acquire a currently released line, only one may succeed.
>=20
> [...]

Applied to reset/next, thanks!

[1/1] reset: fix racy acquisition of exclusive reset controls
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3D2527f6a8cfa1

regards
Philipp
