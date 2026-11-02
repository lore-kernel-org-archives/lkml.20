Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793609035;
	b=hpETB9iRlrdlUzXSRxo+X/pi0XplnGUyVRXj9ZH/Ga+JbpsKJJdKsroWkiC8hR65kjEM
	 K+BoPK1NmUZHNe+8RFLs64lL6UCigUCf7xiaGeo5MxlCArsvY2hRmrUldQLQ8Nj6ORMWu
	 6tTZqc7YvuowF2SmgqkcDv18dMDeFYWQLqTlBUnrBumMYvWeWxIIzyizAOir1QjHRcViU
	 +XAK3V/XS/FPlziNJJk/240Adx04lnY8jfClN1YEwiwPDEdTHU2gzWcgbsLZ8t18hiitz
	 Pqdzyv2u9lesC9GuvSFzYMn/3FawTzk+X6upDdlQ/l2mdyREopRR9gL+BQB3tY0APoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609035;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Cc:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=fG2abAmmuFOSjhLHeWBsLETY/Qe+1L+bi7gdqteFpW8=;
	b=NtBfMwIcQgQn5QDjGazzkTliAFlohYsMWQpGauaIpciIYIjqhvRMbiL+WPJz/wztYVh+
	 7gap115paZCZN5JyDOiOdjtvg8JkxKaBkxXKz6YvYUE5O5PQhVAVeCf+BzJfbqtR+EYBG
	 xckF6xy1+C/0ytBHc7h8n5B0WtyyTlZUORjSqkcEYcLy8G2djKBfBTsnfX49lKRQj0vMl
	 5XGTLf/qmzvZoAmanrYczvYwSjbotdZBcwF6na52iPQhdRDj/GtrFKZLW8o3hmMwgzDgJ
	 CP9YsuPy90IyS9qhxTWP9dHp8Y84lbgL48WLrpKWhPOULmnUy9Ax1oHCX1O+foCsdLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arndb.de;
	spf=pass smtp.mailfrom=arndb.de;
	dkim=pass header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Hzpl4MRQ;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b="J2/De3I8";
	arc=none smtp.remote-ip=103.168.172.156
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DD0606A33E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DD0606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Hzpl4MRQ;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J2/De3I8
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 60CD41400147
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:43:54 -0500 (EST)
Received: from ams-imap-03 ([10.64.2.23])
  by ams-compute-02.internal (MEProxy); Mon, 02 Nov 2026 03:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793609018;
	 x=1793695418; bh=fG2abAmmuFOSjhLHeWBsLETY/Qe+1L+bi7gdqteFpW8=; b=
	Hzpl4MRQ0d9A3VAdiWSird2RevNF4QnAubwfGpnp212S56Q+KCeJ9DaLhX8OAwah
	OeNR/bFFAHszCgZFUmGWA2+45vv4xtVM4FEpVUTZ178g1JYhYmtIdQryzBn5hSGG
	tb3KqPsH83SqiVrPLhYqSwLs+j2zF5q+oE/g9nV6kZ9uDx3JLkvspngHpySAwolw
	+qvL0V7EYzx5BKaUY1j0aS3R6legrJKFtTBwiKebQDLwxgY1cSLIBySnPoGeBRrw
	vFh3Yrd1sgwvevAfMLzMb1mOipCNKtrjSz6MBYHbz87maLbsWOLQ6yS1Wtx/bhWe
	8jdCzBKFwcDz+jHN+2SrvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793609018; x=
	1793695418; bh=fG2abAmmuFOSjhLHeWBsLETY/Qe+1L+bi7gdqteFpW8=; b=J
	2/De3I8GCxdckMCAO+RkVZnXe9kSF30ZOc6oRBykKe29O5d0TYRFPpJEf1Ih8cR7
	Xv0pSfJshOG67R3Q2VCziO1pnVxg8sMjm72d3iIdY499YnsppElUvF4gTEHLO5eu
	TEVgP39QAg0Vn4ejKqoAmDQ1erMXNFGCWfdsRtFfeu4+BdxFvWlB1rwgjlSN4+F3
	ipABTNyC55Cc3UtfIpUI4Rzb6m/n3bVYflooGN1XLUOA1ND0nV1IyiX9rFNgecok
	p4r0PJAJjN1j0AxNRCo/zDgVjRHWAScuavNj4olHD6qryiSGY3vBPypIQqhw79wQ
	BSwUNzak3Zm4kJezugjpQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=arndb.de a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793609018; d=arndb.de;
	mf=PGFybmRAYXJuZGIuZGU+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm2:rsa-sha256:OTYmaJOOCB8qBM7FnDD6sJ6s/03vf4TBTY6rvy71PpfmCYM
	tY7tSOKIU9IhcX4IzYq9qsrzCNZcozdtOOpzq2yIuYo5kEY0pnF2/5+Ik0XAliJi
	sD0pH6sloCsbl81pAAhEZy/XhEGhO4VGsftGUC8o0bH7BwrA1CV2GvNxOK627ofh
	FDMJSpQ7GyrNa2dnp7TmoB/3NPKc9TdBxqdrtz0PljoCufPqUOyzBuntsxhyVY5V
	R7dL9+N9tx+U9hJh4opBfypFsS5R1c5ihTKxFrlM2xSQGh29aF6uVCqq3cK05/M0
	L0NM3oV4Y63BvGtUQZtL19OMRTQOSSGX0io/jUQ==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:UbSbDxYmqUgoubIUD7NQ8LwFC8vaE9Lq2XlhmDOjawM=:PtOnV2ENTlKDXqWCUHr9tzgMckn7gq/qbEUXje1ZUD0=;
X-ME-Sender: <xms:Mk3oapJKsprPZcvT-Qi9GhimS8m5xDjxXCOnUOSUHqyNOlyqmxT-Mw>
    <xme:Mk3oav-_D0MWjLb1v7-JwXdrqx-gs8HEqsfMtlUPJ-bxrSsCaH363p-TSuLJJR5Rq
    9yTlv7LaGL2CliRmATOX6h_P0FB7FEE5ufmM-2Nv9iRi7m-90l7Zpl6>
X-ME-Proxy-Cause: dmFkZTGOfKHahiPpH6V0HDjJhU6n87HVYNDVNFUCMQqDcM0Jmgzt14Czicd6YC7NaSV3Eh
    1AXSSl+5f+eqRG1aLsindEEmLs0aMzezs+ETIJK/rk436IXtN4Q+yYbkronnDOxD2A5k4I
    Dy7BEvReThoKmv21wsSKuFF5qd53VNRCECtt1Vp5Q5xfA0ugwJXA3aZ8uWHumfZXV8wZYS
    bEiU9n5WyUCmYPfqtjx/r+NharnyzpZZx0JIpKqIOZ1coRcIK5WkOaRoYOTCTJz3A4DrX5
    mSr8R/cmU300lznA3DUVyAe8mhRL2S4NeiMJTN9XXtnvnILl8IjvCyQWOtlWgp+6f3FAj8
    JBIBlxnlCRxmLZusc4ebrhmdZtRguiYQmRuvLQ98qSbZUHqAh2dTRxTEOjd6xIDc0uVErA
    c7ufGrwI0oJZku7fKCCoceqiqzTgpSDsyDcSMxXQ3xq6H+86d3Eu0QWmRcriN12BjimZfr
    XuiLM9cJBXowsKbbXB7pBrW0q8NZ2r6pejhLLUgjrMG59b0mFmCqZoja5h4e3tjERZJc5z
    SwT6d+2EqyKfENJfI2cYxFdyAbRJm7KNfNNN7XhamGAZBrpamOzWxanmjYhy09/IqV10p8
    COK+TU+0gYfEEmfgYM6uoP/okLXSnUX5IZn8rKD7sGALrVcCAaBUc2prWJVg
X-ME-Proxy: <xmx:N03oaqw8mnesf_SqhRi7nEDNntGshcc6FG2w9A-DYpiG8wMQG39a4A>
    <xmx:N03oagGlKQmaU2khx4b9-JuDM6H4jMohY66Vx7w7rWlrX-Dehnljrw>
    <xmx:N03oarISj1GiZuMSoeQhdud9qrURteYgme_xON_wj67WgFDAvOXtnw>
    <xmx:N03oar4LNHthx9iQ4Awmh2H1n-OrQ_XwcFzDaoUCCuh--gr5nQf42w>
    <xmx:Ok3oaiUkMmIasr5AF1lrfjpvlRNOOKKoh3jOEJSF4wXt_xDUQ8PxaCRJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id 5BD5D32A0093; Mon,  2 Nov 2026 03:43:30 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AXmfKZnIdKYs
Date: Mon, 02 Nov 2026 09:43:10 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ekansh Gupta" <ekansh.gupta@oss.qualcomm.com>,
 "Oded Gabbay" <ogabbay@kernel.org>, "Jonathan Corbet" <corbet@lwn.net>,
 "Shuah Khan" <skhan@linuxfoundation.org>,
 "Randy Dunlap" <rdunlap@infradead.org>,
 "Srinivas Kandagatla" <srini@kernel.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Dave Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Sumit Semwal" <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "Philipp Stanner" <phasta@kernel.org>,
 "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, rob.clark@oss.qualcomm.com,
 "Jason Gunthorpe" <jgg@ziepe.ca>
Cc: lingtong@qti.qualcomm.com, cacar@qti.qualcomm.com,
 sandheep@qti.qualcomm.com, "Bharath Kumar" <bkumar@qti.qualcomm.com>,
 "Chenna Kesava Raju" <chennak@qti.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 "Bharath Kumar" <quic_bkumar@quicinc.com>,
 "Chenna Kesava Raju" <quic_chennak@quicinc.com>,
 "Ekansh Gupta" <ekangupt@qti.qualcomm.com>
Message-Id: <ab387dce-fa47-4fe8-90ea-d0b8013d01a6@app.fastmail.com>
In-Reply-To: <20261102-v4-v4-21-88f2f24a5f0b@qti.qualcomm.com>
References: <20261102-v4-v4-0-88f2f24a5f0b@qti.qualcomm.com>
 <20261102-v4-v4-21-88f2f24a5f0b@qti.qualcomm.com>
Subject: Re: [PATCH v4 21/25] accel/qda: Add Audio protection domain attach and its
 remote heap
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, Nov 1, 2026, at 23:21, Ekansh Gupta wrote:

>  struct drm_qda_remote_attach {
>  	__u32 pd_type;
> -	__u32 pad;
> +	__u32 namelen;
> +	__u64 name;
>  };
> 

This is an ABI change in the middle of the series, which isn't
great even though it is harmless as there are no users that
would see the initial ABI.

I'd suggest defining the structure in the final length
from the start.

      Arnd
