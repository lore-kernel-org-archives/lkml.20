Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793969248;
	b=j/1FKgXHa2GSOuAf3tnQWOnuPp4fxB1uOTxFs28gElZP5lPgckVJw+/wYNS886/lU2Lt
	 LzUmUQ7i4PJVzxkVqb17SMi7wLR4SsOy5W3Hej39uyIa3aMOd8wtbKOxZ7CoA40LZab+W
	 3439fAX5q4o5jdAmU3DjnDQR/Fv98cfEAmk53gM7D8XxqP1Fd94c6P6YUKNgVJdkG0QbD
	 oghc7cfdjve/WOQnpoqtk8ZIZd9QnoavjtfMHHvguV3HLWLdbkt7Yv/DbvKDJ0SNcBXpJ
	 c5VYya5EPPjCOTuIplircvF+EjZqD2iyAFXtYBQsmQwj/UKUKjU46OTK/wLKXR+KvDg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969248;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=JDQlWXIhj4bDbT0E408d2dPblh7qMmaIQbMP/LEkMJ0=;
	b=EW0EY5SzSHTexcj6NelC2y7As7i/qeQTDFwD7IXycH+UfVpF0faGUSNV3l034hKkRXMp
	 d5BvDVTIGdsA/nQWJV065pjoNNDPP4V7S4jVtsQCEMg20sc8HnZf2b3mOCfHahqZbjLeL
	 FGyL5VsvSkd+u6G2X3TFv75FI52+Nol2V92dOK1Gfj58o/aX8g+4whwCU3V5VZuQX5EKz
	 aW6JT6GeR5F8r3pk3cG2isqgo87swwqv0geC2CPToJYQKVkR1pC60oZScctHzlW0h4IBx
	 HiD4T/QbruEDpK7fhQ2mJGsviU4/dL7VJx3R/rWIPvauAk+tEAFbz9JG1no6+itjiAw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=X4I4OjDd;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355ED606A329;
	Fri,  6 Nov 2026 12:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 355ED606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=X4I4OjDd
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 4CE5920039C;
	Fri, 06 Nov 2026 13:47:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793969245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDQlWXIhj4bDbT0E408d2dPblh7qMmaIQbMP/LEkMJ0=;
	b=X4I4OjDdsllYG4OtdlRimzISbyTtQveag7ggP7owUeT8diYjGXs/d8XN+ncguhS0u+6t3p
	q1pVz1WMCKCdBaJSkjQqi/wEPQxXkiWr2Scr23eIWTABDWrvNNMLZ6q/FjqnHkOWtF0odF
	GUVXGgEO337Lt0OgJmgeSjhhwic09+Ki2X2qiph78hEphmle9F4O9p9e+BrWNHszq6nbQ2
	bf5Kiq7CiMS8C7uTO6uM+lBzprgdj1OpfzYr2VAUfcMxN5Ny7OZzNhYkUdxPtSo4vTe+Tt
	pUolAMZiCWREdFsmes9E/Dzxo4nlMya+FcuefGSJAPHZw7spl1mqWLmOI4Ss0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793969245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JDQlWXIhj4bDbT0E408d2dPblh7qMmaIQbMP/LEkMJ0=;
	b=SjCpucFmlQHFe9ZHdGha9xUd4Ai3OVe62Uw6SO0Q3+IzjbsussaOQ/vz2+V8NNl6qRMnyY
	TxWkBDJ3YbaSKPpxhaISqDQT9C1KMSEzF3Z5qHLpb+BTPa64kLtwRC6ndO7yk2OwUqIOtk
	67UiTaYphx0WgYrjOFXj+dIi5QNihweLxE26S38U4vP1Z0+5kZ29CGLoGR7zOBAk4NHxKi
	Dn64tfEizrpZoBFoo5CJDmwzICfYCIV3Np5FtwOAPrgR8kO36myVsK5zZk8l7j/9CoPTiy
	bFDoUFQeCfhMS1jwlawHbfnCGwzScy+h4pke+WBMAeVUrzjhNOTA8PYa4qGsbw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793969245; a=rsa-sha256;
	cv=none;
	b=aaqcpINBFdqdzL1v08AylhDLwcXndOEQybljd7gSxyUHA+a9uJA2M4FnBUONhPCJicNaLB
	xsCwSdTEBczeftAMG/rx2g7Q2UY9/OhalFaAyr7cGEjANPJC91M7LwEJFtKIeIyMlbKM5C
	QKDsW80eJ0t8JbsEeJZb0QPbSLDmk+lOu7VpCuM0RpIl7ssIX/jE+IEdr2nP3ZgTWqK8C0
	JK/HDjGA3ew4yypeXOO1hKM8CnZu3ZWbqh2hAal04HnfTCuaS46vjhJpbjiYPYwTVgLmOv
	qY0QAmSs9hlDXTszS31R3ofIHWAC5jvFNS2Du0BqdP6JyvW3khMM238CVQVgeQ==
Message-ID: <f259e2034a742d7c5d766e7737e901f22bca68ad.camel@pengutronix.de>
Subject: Re: [PATCH] media: coda: clear m2m_dev after releasing it in
 coda_fw_callback()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Thomas Fourier <fourier.thomas@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Javier Martin	
 <javier.martin@vista-silicon.com>, Hans Verkuil <hverkuil@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, "open list:CODA V4L2 MEM2MEM
 DRIVER" <linux-media@vger.kernel.org>,  open list
 <linux-kernel@vger.kernel.org>
Date: Fri, 06 Nov 2026 13:47:25 +0100
In-Reply-To: <20261029104812.26411-2-fourier.thomas@gmail.com>
References: <20261029104812.26411-2-fourier.thomas@gmail.com>
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

On Do, 2026-10-29 at 11:48 +0100, Thomas Fourier wrote:
> In coda_fw_callback(), if v4l2_m2m_init() or coda_register_device() fail,
> v4l2_m2m_release() is called but dev->m2m_dev remains set.
> v4l2_m2m_release() is also called in coda_remove(). This would lead to
> a double free of dev->m2m_dev.
>=20
> Clear dev->m2m_dev on error paths.
>=20
> Fixes: 186b250a0725 ("[media] media: coda: Add driver for Coda video code=
c")
> Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
