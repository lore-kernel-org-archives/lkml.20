Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.204.34.129
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559292;
	b=Akw5dLf5gc64l/3cF7tXQxu/5kgumVBwGNQ04d/hahbb9JaiWSkVVAiYzU/ZCqMLUDUY
	 XbtIfWYPyw4NWxbhCWOthfM9S61ECkly73sSgssQVgxDohHXWf8CHByl/4GmaCOzA8rgN
	 vcR7p6s2Yz3Towm/Or0r4cMYU5uH/c+VZ6iffHkJLy4uo7cI3DRpRj3kxEmc6gjiDDstI
	 gJld9HEC/DMj8mQDg7WHKF6pHQgRybCYKDIy5rK3sTIbHES5FAjnawdPPlHGKksUNXTGM
	 Djc7gjuL2wi5Dl5CXAWjLMuaYFiDhsHukoeaAOztBbjAgJXrOsJSTh9OF7xnbJCNCKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559292;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:X-Mailer:References:
	 In-Reply-To:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=V7eTuFZjA4PWQbmvW7OqH4LWvNJaPry6cfmPeAjXhow=;
	b=h6fs9O5Ea6x61Uvx20dp4W0efAN6sbnaX3nJYN2vk2wQ5yTMgJk2uep8oQ1F1eGBDIbR
	 m1Aooi8n2ThjcUloxrJsoxwzw9c+T+oWjkpmPIrelSh0zfN5Vb696ckG2fFqvq2qJtgCP
	 6ZblNky1AwTD/f+enbDutE8iKhnv985CR/t6w8+BpQCHcd7X2/qqaiaNxTlZp7WQqV5Jm
	 Oz8IqCbXoOYUo9mIl4N1HXWkKU24/uejKRtWq/Mf4q6ToKlGNn0DYsY8u3cZRemyAaxB8
	 khK9UiMSDdhu9HVCC1g2Bojkp4ZuH1ayGcD0E2ZlMJzm8BHIvLLjHm3qNnSCtoBv2lA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=GDD+UBy8;
	arc=none smtp.remote-ip=54.204.34.129
Received: from smtpbguseast1.qq.com (smtpbguseast1.qq.com [54.204.34.129])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB32606A32A;
	Fri, 13 Nov 2026 08:41:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BB32606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=GDD+UBy8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794559258;
	bh=V7eTuFZjA4PWQbmvW7OqH4LWvNJaPry6cfmPeAjXhow=;
	h=Mime-Version:Date:Message-Id:Subject:From:To;
	b=GDD+UBy890+t1OqxUqT6aVPC/Eci7C0ywc2RKPpo4OTJstzH9v8qRTqrT9cOeu0x7
	 ibnZKScrB9qkkDHT/h1JJ5BbpaQJxwRWrzhF/YqIlbJ7gHWvQ6BFJQFWihVGLJp6z6
	 Dqi3cadrQ/iUNosJjPmtz8EgESVp1Kj6/31ana0w=
X-QQ-mid: esmtpsz16t1794559257t5d9dba59
X-QQ-Originating-IP: wBSvX1BtCBZPqne4sQMbScd0WRDo3uqiRi+rcmrw9o0=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 13 Nov 2026 16:40:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8217629100914442193
EX-QQ-RecipientCnt: 17
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Type: multipart/signed;
 boundary=d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Fri, 13 Nov 2026 08:40:53 +0000
Message-Id: <DMTY5W1EG9R9.2OG78EAK5J7UG@linux.spacemit.com>
Cc: <troy.mitchell@linux.spacemit.com>, <wangruikang@iscas.ac.cn>,
 <guodong.xu@oss.qualcomm.com>, <jyc0019@gmail.com>, <robh@kernel.org>,
 <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <pjw@kernel.org>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <spacemit@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] riscv: dts: spacemit: k1: give each PCIe port its
 own DMA window
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Vlad Banea" <montrealtango@gmail.com>, "Yixun Lan" <dlan@kernel.org>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261113023158.2872492-1-montrealtango@gmail.com>
In-Reply-To: <20261113023158.2872492-1-montrealtango@gmail.com>
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Ndw/mc8X39Obev2zZ1A5EG8IHfjrQAbdcWNAb46z087/j3yzHaV7SbzF
	jhVGS0YYDZVdVCfwhWzkbt1u02/C8DmUqeVuRmMgWMwVc4nqrJQR+QtmV3keTlMDWbTFyPM
	1ySSydmiptj5afB+a8//jmcOOYUIEkaRpMSFnt41KFb0E3HsuWvS8Qo7kRgEXyZsFlU6WZL
	My5FdLl/QNpCjlmRfB1KR52ZPP6hrxvBdk1WKerky2pDgPj6kyesbDEmwJxkfBeaHCVAF/P
	p2wD4UXGEHH2Ze+x7HnbJGPSRa2MxOQSNx5Edkt7DdM/ab8wr+mRzVKxvAqkBhjy0Ze5mrL
	zI7PjgKQlBxStYyOWVPdR8yOxi/dL3aTrNGGuwFkdmY/oGPoNju5kyIZQNWxbfVBmjOHX0b
	iz168pmwVCOdvoNystu3xV+rkp3RI88PX7fGzbrdN2YDjk5cC7+cwbC/g4MGVuHnMNLJFhU
	/VIlBtNS/NqNNBL45MSUqzB0ePIwZWIna4UoYzUJVIy/OVoGgfWhtmjqAG7r8u3ekK7U1FH
	z6LWlkkfAATLtEX9iY6AaGi0qzotMykgslEqeZ2VlbE62PPuxS/HVreDo1t6jCE6tlmuFSo
	TYAWDRE7xUwxdOss6KHs+W9ebeAEsPNq7WxYin7tu13UpxFj2xdifO5A8SOtz+INB+bNcNt
	AO7GDyg7p+v+t0uIu2rQk32TByjMcUNsHVIUVLV03CbRUC360/+8kryKnUotK00SwQcCWMY
	IqQ0vczCGaStTn/ivUJuPwYOGRN6/+2G1SYbSHYTsqLC9g0kyepezluwqm7rTSK6i7mCRwr
	1JTrNOIJPqK9/ueeu+/tG/gFBrqRv26teMY+4i0lnzGkw/ZxkFF6qgjetpXThcs6LsEMjWK
	NQITjADyLn+r88GATcCM7f5Wei8zOuoBumNYIt9EcPb/Fb6UeABkJwYJVw7hU0fdMsThuy7
	fRJTiavsbW6gK1lFpcFvMQc/dKjPj59fIb1ucouqXHCvZKGVRAEJ1Nf93vb+QEc5HiIG9li
	wqqQhJ523Afj5oVO0QkVpSYPXRw6ajzQP9VC+6ZYdJKf7eOdlw0uklv3f4lC40ZtqRKrJl1
	g==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

--d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Nov 13, 2026 at 2:31 AM GMT, Vlad Banea wrote:
> On K1 a PCIe master only sees DDR: bus addresses 0-2 GB map to CPU
> 0-2 GB and bus 2-16 GB to CPU 4-18 GB. A root port does not forward
> upstream an inbound access that falls inside its own memory window, so
> dma-ranges must skip each port's own outbound window; the other ports'
> windows reach memory.
>
> The shared pcie-bus skips all three windows, bus 0x8000_0000-0xb7ff_ffff,
> which leaves CPU addresses 0x1_0000_0000-0x1_37ff_ffff unreachable from
> every port. Give each port its own bus that skips only its own window.
> On boards with more than 2 GB of RAM, each port can then reach another
> 512-640 MB without SWIOTLB bouncing.
>
> Signed-off-by: Vlad Banea <montrealtango@gmail.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell


--d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavbNFSEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC/H2AD/ZBD7XI22R1Ie
I6EnaBMP4TJ3LTUz+Sq1k4mPe76lNf4BAKulU+P4zOed+4ID8p+GEHDcy/ynwbZX
Ra6R4TzswjoJ
=nCa0
-----END PGP SIGNATURE-----

--d13001a16f081259898c54cd2d9bc8d1c58a841de8fa9c26a1bf406aef65--

