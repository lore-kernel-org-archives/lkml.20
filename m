Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794481277;
	b=1jmL9ZvdLSNz24wtCmA0Ipz/Sr7pntgd1sAnpPq9xhw2AMt29b0xDHTvYCASl8HzlDiq
	 nLXclj7km/zJmBjeaYB7Oeq5g0i8KGpgXMeTmGh/gI+S7bhTlVFIdSZRWJGkC1zZgru+u
	 /huRv+aahNkuwVL/i9ueeICuDEBGzioIWoF4Ia1Wz9OLGa8/xiuwgRDPt128QFcGnVEHH
	 n5mrnwTmNemjRZo5UM8DkRG2xXoFZbs+tkYpAwIkjjJy/Nfcpun6mw0IY19GiJSZfOCOe
	 M1QtNvi+lZYzIuiLgsE+xkOCskmobuFO4MbG5YmgCVozgNTc80q8sIQdAdxS4+RPHQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794481277;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=GJZQxw9zDWRdmABPU+9ukcbzOtmQvhuN4+cXGWOZDYU=;
	b=ffDTa3u+3YFyqf3ZhECy69NshFhuy6z5CdeDvJdi9wHnvxeB1mMlNMDGE1zCdHN2qD/u
	 BDo7NJ2TNP5Ad8iIboox40tj0Mft4emNUC0C19V7B94OBNHOXoENsRu76Sovp+m5LX6nq
	 TqCLvnus+EqD/AX3ut33gWNlKeOW++QMIG9BCQ9XCpGxB5Qj2UwFTI7OxG9fd9PkeMqOn
	 HhVXsuc+ywqBAqVUtCcZnhYksGGQyqc8VTTKxhQjGX7vLJi7tgmGFTnMQi+BbxurFCY9m
	 KI+UwZy6yWLODMAKbzFRu+k2TIzqhJrl+X9Drh1AgmNJKm0yKrA9FY7HqCri0u8sMPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=URemDzHK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9597606A333
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 11:01:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E9597606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=URemDzHK
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id C9F882006B6;
	Thu, 12 Nov 2026 12:01:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794481273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJZQxw9zDWRdmABPU+9ukcbzOtmQvhuN4+cXGWOZDYU=;
	b=URemDzHKEzKZcnP7DjrGSnTIbB+oeJByzv8XRaSrlgT8co8cBGHlaxatK11/OiwLQjD02n
	kqtN1MC3/trS60DEKaJb70+t5aFBoVQ6qJC9qtt5gvvssXbl7A947lH28ifO/5LWfIADMN
	7fu6W5jJ0q3mwlzHoUhucNr+H+k8LXwk6fmnVM5Z2zgrBqJ+itIztq/WsTIQXPDEndPBxV
	jd6h9QK9psBGt1L4jO06MwaUgJV4+FvEOwU81HnCexs/dNq8HnTXcK7RUnck34WqkjWqCq
	2kMo8UUGyv6fqhvoVCoM2Ni6mhlFbA+x77T1dAGImGNmdPYHR9PCFIuwE+w0ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794481273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GJZQxw9zDWRdmABPU+9ukcbzOtmQvhuN4+cXGWOZDYU=;
	b=UmGtaCRCYjlXOvbswqJo9Dat/MXlntHcwqR8H8hDVXCnl9IoCxtDOREtoBlfIDHF7kaBEP
	dvtW5fhL+63iOUjWgyFMZp1X/OYUPb1neskeNGRSGHcw4b/KYufYCia8KyIiCiM3UWMT9v
	W85fwtNcGlFeriGWXnNQ2QltcW3/hlkv4YkUl567X/1gSWhsL2bVvyr7bTfqfQlfVg65Yf
	syms4eoKqDFjyuqWYTXplSRxvq+cgOA4drt4Hvoaxtascc0QI21mZBnxmkRiRnUTywUj2Z
	ajQno5aehJg4bvo53+73gqSvHiY1pLJzVJt0INUJ7j5jyNTDmfQ1kNwCkDIq2Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794481273; a=rsa-sha256;
	cv=none;
	b=Ai9KxwBTPCcDV6TYrJCuErsOOfOOfzW1wE3RWpqq+ab71qjc3A1IhuRczj6EOS4qWALgh/
	yDNySx8EPKavx3ozZO9rg+YDpDRHFwm1qNfujKu25/UxzeG6O+xobkRPlwSBXzS0LNNhOE
	vQzijG6J4tMsvC+ys+NIAntIAPD/6MZlh5TGhP2Y0qred00RuentUsGqOPn8t+GrPiCnh3
	VqRRRuMWVICmPl+c3hitlrFndCNMzSf/bwNAndRG+rRJEd2A5EgdKyjaI/Zp5OlNowrxVr
	10WsDpBFu1K+b8XTafOG1ogbtIOqpIQb2d95rikjNL02ILfGatSTX4ty1w4gBQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <146c8dcecd2b976b5a9cd57e4db57dba66e12ea3.camel@pengutronix.de>
Subject: Re: [PATCH v14] reset: zte: Add a zx297520v3 reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Stefan =?ISO-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Date: Thu, 12 Nov 2026 12:01:13 +0100
In-Reply-To: <20261109-zx29reset-v14-1-1a05aaa7309a@gmail.com>
References: <20261109-zx29reset-v14-1-1a05aaa7309a@gmail.com>
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

On Mo, 2026-11-09 at 23:08 +0300, Stefan D=C3=B6singer wrote:
> This drives the MFD child devices created by the zte-zx297520v3-crm
> driver.
>=20
> [...]

Applied to reset/next, thanks!

[1/1] reset: zte: Add a zx297520v3 reset driver
      https://git.kernel.org/pub/scm/linux/kernel/git/pza/linux.git/commit/=
?id=3Dfbcd5a23e147

regards
Philipp
