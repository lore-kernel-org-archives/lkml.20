Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=57.103.75.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628438;
	b=mhazJNrJ2QPipeoPOIUEBpp+7ogRiWVYzm1LFyMZO5GlclxzuBrXAGQl+axmWQQDQ7Zf
	 wbfZJtwQDbtU+hQKZE0pxoWId3Lmjtzbuug6zxik9+1ysVGKAXPygJjQA62RHGwSQcZl9
	 O8kZABeT1gl6LUf7VK+OknjSmjnWa2CNL7yxg6wP67JPjBxIgmsDc/g0cG41e4yvHbTCU
	 bwviijDy75+HrYGlc3tL5ICJvLG5TtfBnZlCUIxCn6xzr+7zonYn6hoCmqi5ZChdglVCi
	 +Y+GB29KzZqbEbFHrrttdGt/bMp4Xq/2TKZZeYt8ywp1+ruXilmKhOBrmMbcmc6eqtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628438;
	h=DMARC-Filter:Received:X-ICL-RepId:X-ICL-Out-Info:Dkim-Signature:
	 mail-alias-created-date:Received:From:Content-Type:
	 Content-Transfer-Encoding:Mime-Version:Subject:Message-Id:Date:To:
	 X-Mailer:X-Authority-Info-Out:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-JNJ;
	bh=IMS3fCDusizYFyrDrHb5itgye/wL4vcs04O/OzYRUM0=;
	b=005IbLM1u1Gq7GSQKis86QEHulMYHG3jKNX5Ya+Kl0w/0MKYF57YXrzq90nqUHZSN0Td
	 1BVx0QsEPqFFzwPuQnYKlCZGDAmpG+NEIOSXYqqNZ2gL4l0YLT6BvgsJakA9dt2XR/oHq
	 Sdd9WaJjeBqYJKeQVbcc5+qw0S20ob3ylFoRJx1JXbS6xc4EAiYNyUZZE+E2d40WEvZQl
	 9EAkipxgfN/8tP4MY4tf4KJotP2cCu75X/kK/cFvrHQASw7HJGDEtoOASj9X2DogBeW19
	 8Dfsg1sjgDNn6MXIZOgU4Gop6hFE8wwECPYWCKLZDF+/Nb3PKKrpQnj3/UCzSQtXqgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=deadend-software.com;
	spf=pass smtp.mailfrom=deadend-software.com;
	dkim=pass header.d=deadend-software.com header.i=@deadend-software.com header.a=rsa-sha256 header.s=sig1 header.b=MGMmBMtP;
	arc=none smtp.remote-ip=57.103.75.100
Received: from outbound.ms.icloud.com (ms-2006j-snip4-7.eps.apple.com [57.103.75.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A00606A326
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74A00606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=deadend-software.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=deadend-software.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=deadend-software.com header.i=@deadend-software.com header.a=rsa-sha256 header.s=sig1 header.b=MGMmBMtP
Received: from outbound.ms.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-0 (Postfix) with ESMTPS id B6E7C18005D4
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:07:16 +0000 (UTC)
X-ICL-RepId: 01a19c95-f8aa-72bc-8a96-e5978e9663bd
X-ICL-Out-Info: HUtFAUMEWwJACUgBTUQeDx5WFlZNRAJCTQhBC0MFXBxBAUAdVQZLVxQEFVIEWytWFVgcVgNTRkEfXwxEDEUOHBNWFRMLU1ZWFVgcVgNTRkEfXwxEDEUOHBNWFRMfVFYDUFEdXwIKBEcEWxdGA1NFXwMXEVABWB5WXloXXk1HH0BNYkkBWhlbHEAXSm5NUw8PFFwZVwhZDx8DVh5HGlYZV15aF15NWgJWTQVBAC4HLwJDClUBXQNfH0QASwJAD1N0QxQ+BVRxWAZDD0sGKHErVhVYHFYDU0ZBH18MRAxFDhwTVhUNTUMSQhUEG0YeQwRfL10XXgxeBQ==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=deadend-software.com; s=sig1; t=1793628437; x=1825164437; bh=IMS3fCDusizYFyrDrHb5itgye/wL4vcs04O/OzYRUM0=; h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To:x-icloud-hme; b=MGMmBMtPitXESOWR3VNt3Zi3OYkEf2xKtp1AnFL63T0n1VcApUiuL7WZU50ujQX0ez6QuFab1P4Mc7a9pgpz7KPHTw5/bD0fxcsjWlv+NXDXnYW3nNMAWqb+5JKaaUNm2IdlqcSlsTcM6tSj8qcvrWhcByOenj6WLLe2oGesw8+XLo9ODi6NUgkbRKFF087JuVjXCuO2Up15L+qxEEt7QOZiBZC9G1jplMuGEUsCjnMtkg38Tue2iEJA+jDT0JA8J9pGBhCM6+dJ+Bk4whqkOdjXwgjsgW5YfEvM/uRu58PW4CL03gABuj9GdjbJ0Sfd9Zzm1EujoIa/vExU+1YbLw==
mail-alias-created-date: 1769597732162
Received: from smtpclient.apple (unknown [17.156.208.39])
	by p00-icloudmta-asmtp-us-west-3a-60-percent-0 (Postfix) with ESMTPSA id 337D618005CE
	for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 14:07:16 +0000 (UTC)
From: mail@deadend-software.com
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Hi, just some helpful tips, hopefully this doesn't come off wrong
Message-Id: <93C0D033-2044-4931-88F3-F69F343635EF@deadend-software.com>
Date: Mon, 2 Nov 2026 06:07:15 -0800
To: linux-kernel@vger.kernel.org
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-Authority-Info-Out: v=2.4 cv=M41A6iws c=1 sm=1 tr=0 ts=6ae89914
 cx=c_apl:c_pps:t_out a=kRaGL2Q7qLiahLf3O6OaIA==:117
 a=kRaGL2Q7qLiahLf3O6OaIA==:17 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=TpttKBZJAAAA:8 a=iVODYf7wIq7EKrwxO5IA:9
 a=QEXdDO2ut3YA:10 a=gXQzQz9tlDy8H52AK5xj:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NiBTYWx0ZWRfX3yVuzIeHurVx
 JC342lt8U00RwP1UERiUsFHTQjxZA9l9J4z21tYpH5eqRbfhRAUmR+KARuOIgJWizLHF+1V4QdZ
 qegZ+lbzJpkoAZbAA+mrEQtiC1v6W8EaD1SHteF7w/ARNTmaO0taAT1Im3YM6/g5p4a4bZ/Qnsq
 QrGr8HHiunOrx1Tg61Kh5GjXa533da5uf+XepyHDPKnh8dxz5YrQQqwuviVdWGQIyBSMmRexLjc
 bU7N3amihsYBzsaABZ11hNJ+DmbvELW1YAqr4G/rDgRAhmXW2Rj7tEjtPg6nn5KFIjm4crXp87Y
 J3CK/v043I8tyMeEoRKJ/IM9OvAb5v+GrZ4cLzaIqBhjjvTC6Q8axPjzcjrZVE=
X-Proofpoint-GUID: UC-iFBFdSEPi_AVoupcxjEplJ24K2MAE
X-Proofpoint-ORIG-GUID: UC-iFBFdSEPi_AVoupcxjEplJ24K2MAE
X-JNJ: AAAAAAABvluEo7Ne/upuYzKh9nnXK3QgKFTtlMtiwAYqdSeTN1YtzGwv3iX6sWK0WWfUU8
 f+ObS0A9KDEuItNCyCrELP8+icQurXG4zw+kUQv7nttQBCDM3BpZ/xhjUgNmGVk8VhdRH0
 f5L4J7Am/qMPTgP93uMQ0tgQtMmQ8ilH7OInGgg5YbenWoI+4D41ueEQZjBrC521ZX1/1z
 gkm+fem24rt7tQHWQbW3meTqN58eYi1C+K/2gTHnh89Pqgtc0Duw1Smqs/cGNvaCI9Mq74
 dOSnVWmnghztGotl9SeEknxQHpVY+3PvKhzS98jG1NkfqMqsNJq9M9PROPtKK3w0oydaNp
 MryUpFE2q+85+/AHzUubgGjxM3w0Bl6pG/HAtgAckiaWqoRA7SJ5OstvStcfxsParUoK4f
 9IfigtM5LWUu4mRYPmqia5Lp7zXGDtJ8y6QIzBP2rC/zYG8JGProKlxWqLKz7H5iUABfWc
 Br5WeVTsGsghXWyIvZzBUky+oWrYWzb68gqRK7jNaAA8Keh7nLgkE2y3iGX/PcFNGGSD3O
 S7qreMtWVHGso1llxcOr1Noqe43oDxF00pKtEFImhi56I38/7IhzRVc2lPz8owT4K1ywcv
 j8dLbtujHgf5sqUzncF0M053WRRlyLRFG5C+y+ZdG2bydUlk+60Tec2xb6dWapzmlVVU4Y
 o6G0XoAUQ9XLTMjU+w8a/BVBjOUxyDVpWGI1+VxreNyZtAf7kN6xPmuK0GwBWsDv0/QQbF
 tcFM69OnVEWzbasvhs9DngiyT24oiKFdP1P6ex3QUOYHYjhFgeSLpWH0fowS+ymU3vYGJp
 XPErZjMc5WzeuT+1fU/col9HwOCxjc/lszM7zo3VR5O/QYf6Q1zn3LBJV8gECg704PMVeK
 hjgZHgLwHwO+ee1cAWS3kev066B+FySI8QMttRyt7vEKIfJfcw8/101z2ODqQOuNMSztK1
 J2U17aP+I44aXR/RsrQ9IWzG/EiNyeyM8Hw1W34g7+lsKhwMf4XruLPnv25AJdDQEJricC
 dvpLxWyZGh09ZBJ5bPvUg037n96UFtSszX/SAyf5vsrmjzec5S2lewbvTvwKXYe6vD4iLV
 Tr8C2khdLlNN48fpAQMapMO4KcrBl7F8p07ZEsQnAZAK/F7Pte4avF6atLj52Fr12sxRr8
 1nxjIbx/YCimJHtB17F8pOpqbmrh+dXbDg6IWVOS6Ut0CBRqcy9qIZCM50ELmvvVSgIrQ3
 OiYDEDCVVO8Lh3gGHF1ATo1mbmpWstYhIn0ePG5MlEPsfzLarfjGO1dhqlNdy+qDSjiUWB
 a3xxruB/lZ4YQjHg/AM/1w6K0osO5CAzhDZf6Q0D66xMG/NDxh5sPbYd7lfkJ6RzCPvq/t
 sf3+FpzoB4X5a4C4By6cl6jmqu0E4edA7d23/hgHVeccEeFlgbnLmhyUxou17A4HYv4wiE
 4=

1. WiFI 6 allows download/upload speeds of up to 2.5gbps or I think =
12gbps wirelessly=20
2. 10gbps optical networks are on amazon, meaning you can have a fiber =
optic local area network (awesome for high performance programming)
3. Printers/Scanners are awesome, you can print and archive or scan an =
archive. Also get a file cabinet
4. LDAP is a critical and possibly essential tool for Linux and servers, =
it allows Active Domain like infrastructure to Linux servers, and you =
can do cool stuff setup local mail and calendars, and you can write =
software specifically for LDAP networks. LDAP also allows domain based =
logins, meaning if you setup LDAP properly instead of user mail at =
deadend-software you can login under user mail on the DOMAIN, so LDAP =
allows for domain based authentication on Linux servers, meaning I get =
shared access to these resources on domain based servers, so I can login =
to maildeadendserver@fedora.org and get stuff
5. You can run local language models LLM=E2=80=99s on extremely high end =
workstations and servers and get free ai, no buying tokens needed, if =
you=E2=80=99re springing for a 32GB RTX ($5k) you need to use a small =
language model for complex reasoning
5a. I use Ollama by Meta, you download everything, use VsCode, install =
the Ollama plugin in VSCode, and after everything is loaded and detected =
click where it says agent and look for the sparkle

Also if you can really look into strengthening the presence of Linux as =
a superior server operating system, I personally setup Linux as a local =
server and use Windows/MacOS to connect to it, just like the old days =
lol

Hopefully kernel hackers can get on this and develop better fiber and =
wifi6 support for Linux

Sorry if this comes off as useless, hope you guys and girls find some =
use out if it

