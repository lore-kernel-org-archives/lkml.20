Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.92.39.34
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794206221;
	b=Zu7xmFQsRwmDTojr2jPvAXZrik5VfqTa51R6LMBLrazzNwR90h3cghTg055sQ/692ndk
	 uygP0zkyaYbbj4QcrhJKYuYRdELrZZnYQH2X7DdqgNJge7dwMYIQA08xjKgAWaB4nDzwU
	 198T6Xn0MLkLhW2shegaR0s25YyzTQcdnNe3wHZWQWG+LsjmKKug9xf7pRcTsMxqO1oVq
	 FHdS33Avi7IIln580FMQlXASA5FfbsGwegbaM+PqAzyJ6Ph7bvRku1wzzV8Ic6agkoiJ0
	 u7vz3nYuqd+pEAuTKvvYf8XTMF0yboluygTD8eq5ygfVnt+UzMtHfOVEd4abwt9EM/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794206221;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:Mime-Version:
	 Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=63Wz6ya2Ub8ladEeQkfoYbpXC+w/iRW/EVIKhqbn83Q=;
	b=pZHBhs1hcN1cY7+AOO468FbNK4R4WvrIjDArRrHl88xGfEBtMErSXPq2A/LUosSgdK8v
	 4Gvg+yZgn/6TiIeSzAZ7LKKiRdf8WSs3Sd5kilnZ062b830KjmklbMoshVdm8/lCQgtyW
	 n0bz7xg1WxKnE2a76dtd66/90OYjSX039NPCNkMR0KdJMVqMp6XWTBEa/I/m2YdKMoZOV
	 M0ocGqOHFFxKr+DtfXuwfrc8MRGsz9VjtTnHSgF9rud+ghe5CBw+taWoekDeREVZ09eP1
	 29nyncNzsNnat1iOKsNqd+ErhujW+1zIKwHhOJLH2Q5qnvFSiyXH4MDRCBsFvY2iW/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ax4+Nkf6;
	arc=none smtp.remote-ip=54.92.39.34
Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA3B606A321;
	Mon,  9 Nov 2026 06:36:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA3B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ax4+Nkf6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794206210;
	bh=63Wz6ya2Ub8ladEeQkfoYbpXC+w/iRW/EVIKhqbn83Q=;
	h=Mime-Version:Date:Message-Id:From:To:Subject;
	b=Ax4+Nkf6SlyJQVrqU8AOFCa29lZAIFOq45qmtxyFF3ZkKV/7vD8kXbksR6cRDDwqD
	 MSK3ifLWilMBhigQnVA+nle3PZ6byPJmL7KXdiHTX692AJjF6sjvdIRFEGyc+iBLXN
	 U8O78SZkH6OnHUvShtMHGWqSqN8E7nysNpND3aS4=
X-QQ-mid: zesmtpgz9t1794206208tf88a23fc
X-QQ-Originating-IP: 4Kw80jsSiSoIoW3m3hnDtE89tjQ7Tcvag4h7VzdEA+o=
Received: from = ( [183.48.247.17])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 09 Nov 2026 14:36:46 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2280427375327430452
EX-QQ-RecipientCnt: 14
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
 boundary=07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Mon, 09 Nov 2026 06:20:18 +0000
Message-Id: <DMQGO2MLJM8M.27VP8Y08N5IXY@linux.spacemit.com>
From: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
To: "Sandie Cao" <sandie.cao@deepcomputing.io>
Cc: "Yixun Lan" <dlan@kernel.org>, "Troy Mitchell"
 <troy.mitchell@linux.spacemit.com>, "Conor Dooley" <conor+dt@kernel.org>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre
 Ghiti" <alex@ghiti.fr>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <spacemit@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] riscv: dts: spacemit: k3-deepcomputing-fml13v05:
 add USB controller and USB phy support
In-Reply-To: <20261109033310.361435-1-sandie.cao@deepcomputing.io>
References: <20261109033154.361399-1-sandie.cao@deepcomputing.io> <20261109033310.361435-1-sandie.cao@deepcomputing.io>
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NYwvw9/V3eZZKV8THLA8T0nNKyBUNeV7yzOiPqEwYAhKuSaaRXmDTlOW
	3vagwLTbEy14BMcp9pjZRPbnhfPU4otFZmgTYtE7//Ttvf7PLuntEjnYxs3+amDQEqSoQ1U
	kBxBLlrwxLSKo6frgVk6xFUqAKToR1me2bCWCklbS/wMJ9+Mu72PszYdNNlDVijQFFEyecd
	MKK5p2zd/UKpxLj0RUVUteptxVR20sNpYMVaAZ+1y0PbANxYXF5dgxBIz4pwMR/7fWbwAyS
	89HMa2hGQYAwAq2sL9zuDNixj8o0fT3EA8yh1AIX9d/mKKiT/hdLdqUQvPHT9vOZVJw2ztX
	7dzs+Go6A4KuuU4FlAND/7eG4u6+714T2FePwP5DVWMizHYjpg84RJ7272Z5eDLjIlzrtn1
	6kK24ZFCEvlP+xi6Q+Yg55hyF+xSYpYTJkLIoIAeZ92cFk+PCT82Mm2rrPO7zQhYsErGzGP
	vZvmcZPhYOQoh5vET9JITXZjgoLhAQ7jrt8GTQtJ60qgyD7jDkE0TLBysFTsjTjt6JpZJVO
	eCjVQi3C6Fo3P+Xo5fSbcpvMfXjEfp80xN0cq9K1haSRTKCG94jPHQzIKSHeAIbdb4tVObG
	zFn+8Ot7WXWs6qoCY71OIwMOL1K3kO5YDwRzMq5AfwSOyCy8wVZqehPpqKTNlTPCB4r+7kr
	7oeS3G6zckVKme0NKI2BV1mAxp5nOy5E+M8+ZO+zse78k4N/KNLYDOBb9f4oTVkDhhA372l
	a6+ucDHFcsQS2iTIAieo2osT74gknh5diy6oJcjbF96cqOHJhpswuG2il2cOaN6pKnisvoa
	Kla7JgfDSKm0Mst9MfafjjMUgx9TlLEjYFmWgPHa0CL0DupBqVqMg12YK71oFNyk2fq4CiZ
	2OiBCZqdEIfBd2cCFpVc+xQ4n0RrEnQVNhF6d5AmwoWznjNGK92L3nH0HszPa1KcYaCEkmS
	8Y/hdxoCt+SP9VyBEw0BsxsCcU/340pMAYefOLURkOv22Ovo/ovVx2PeSjV2TABYt9R6CCB
	Veq6dLNuGRs0Y4hpObBBZjNjOizcvKiux4Ot/fW0bBf1WQdjgZYDqnWycmOHeUPcwi8QiHp
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon, 9 Nov 2026 11:33:10 +0800, Sandie Cao wrote:
> Add USB device node (b, c, d) to DeepComputing FML13V05 board.
> USB A works on otg mode, it isn't configured currently.
> - 4 USB-C Ports
>      - Port 1: PD 3.0 (65W Max), USB 3.2 Gen 1
>      - Port 2: PD 3.0 (65W Max), USB 3.2 Gen 1, DP 1.4 (4K@60Hz)
>      - Port 3 & 4: USB 3.2 Gen 1

This patch also enables usb2_host with a GL850G hub, which the commit
message doesn't mention.

Otherwise, LGTM.
Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>


--=20
Troy Mitchell

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJcEABYKAD8WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCavFmIiEcdHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20ACgkQmAnvgPkzNC8tWQEAvywcD7bi0gZG
WU0K8onUqh+/3IEyc9XrO53vzNr+45sA/jcO9Mg0Q8AqUYEJVihVUDygV2P5RiZj
MjJz0ZzzqV0A
=YdL4
-----END PGP SIGNATURE-----

--07ff8aa27cbd94e52b83dc30c3f2c614bf3b214041dadeca72e11e5b6b3c--
