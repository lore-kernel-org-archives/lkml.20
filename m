Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.189.236.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793739713;
	b=o+wD+ag7GMEor+Aygmuec80Hc985nCmO/uBosn1eHTJDH1FndfErx7BJY2HM1Znpi9nB
	 GITPSuGbJCMhun1hIQTzmS2zgaYCohw6TK8WM/c8U4UtLbXqtwTtK/DjPaxu2ObEF1jS8
	 C/fRTnradNaavW4BKeJkD8oQDAn79iKfrW6WVJSaqjAVNhBee83yzAkNcSvieatToDgag
	 TSELjhIEVZToy0CsbsydHyWV1mrYbq1XR8Ostzg8IE5X6bX/PcSg5LKib/HnNIleZNCX6
	 m0tKVddbpPvCjepqxMLm+4TF36KcmgIYlkYBdIEhVOAz2UfNgzn5QTe8IyT+8r5EnvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793739713;
	h=DMARC-Filter:DKIM-Signature:Message-Id:MIME-Version:From:To:Subject:
	 Date:List-Unsubscribe:List-Unsubscribe-Post:Cc:Feedback-Id:
	 In-Reply-To:References:X-CSA-Complaints:X-MJ-Mid:X-MJ-SMTPGUID:
	 X-REPORT-ABUSE-TO:Content-Language:Content-Type:
	 Content-Transfer-Encoding;
	bh=99BNe2ATmoiv6MkGfulWJTv1Uz34GDHfOl50x43wT/o=;
	b=mf9e4wxpZ/pw1xRkDKymfr6xXp32BrfB3fzrl80z01BjDteVLMORYlavdSh6mDEWfTXf
	 D9maRIfD4c63zjRM0o/9aXg22uLXuX2mtzH4zpAR51HogPmeqVT3aeFJsDIxwFnMtMz03
	 orPwGqP68fIr8OezmZ5yqJNPogePsc+uqAGe4EtLDL2AxpGF1Z/KcOtNFWf+TUwhhg5B6
	 98Bc5kXMPzfAJe/UCRxwEZJZwX/l8sQHftVvh92hUli2vYBakJtKFwAaBaNC9r/VIaqF+
	 dWNSoziofYUskM3/WRxPDrIlGiAqOh43dR7pDjYnIfonYPNTYKOi3I1/jZGcM40s6SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=hit-on.com;
	spf=pass smtp.mailfrom=a665032.bnc3.mailjet.com;
	dkim=pass header.d=hit-on.com header.i=technosf@hit-on.com header.a=rsa-sha256 header.s=mailjet header.b=uc96wAem;
	arc=none smtp.remote-ip=185.189.236.29
Received: from o29.p25.mailjet.com (o29.p25.mailjet.com [185.189.236.29])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 7DFD5606A326
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:01:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DFD5606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=hit-on.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=a665032.bnc3.mailjet.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=hit-on.com header.i=technosf@hit-on.com header.a=rsa-sha256 header.s=mailjet header.b=uc96wAem
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; q=dns/txt;
  d=hit-on.com; i=technosf@hit-on.com; s=mailjet; t=1793739710; x=1793746910;
  h=Message-Id: MIME-Version: From: To: Subject: Date:
   List-Unsubscribe: List-Unsubscribe-Post: Cc: Feedback-Id:
   In-Reply-To: References: X-CSA-Complaints: X-MJ-Mid:
   X-MJ-SMTPGUID: X-REPORT-ABUSE-TO: Content-Language:
   Content-Type: Content-Transfer-Encoding: To: From: Sender:
   Subject: Date;
  bh=99BNe2ATmoiv6MkGfulWJTv1Uz34GDHfOl50x43wT/o=;
  b=uc96wAemX5lmwVp8p4uW9B2vbZJTv/rCnD79F3jalIDQNmL3xFsHTthna
 +2udtCggTIP0QzqqnNqYjgPBtR8iwRekytKkAiLcJ8aU3NgEjP07yJvjwCJJ
 ahLKK8YSMrDPFntmmG6VF5t+ip2n14LIJ1OhWwWzsfBBJEB12HxDb4=
Message-Id: <52ea1bd5.AW4AAKmzGcwAAAAAAAAABIOZQb8AAYC7iywAAAAAAAolyABq6ku9@mailjet.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: technosf <technosf@hit-on.com>
To: Marco Ziliani <rylos78@gmail.com>, Daniel Scally
	<dan.scally@ideasonboard.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v2 1/3] media: i2c: ov5693: Program the mode registers
 on stream start
Date: Tue, 3 Nov 2026 13:01:46 -0800
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: linux-media@vger.kernel.org, Chris Simpson <chris@nilk.net>, Tony Garcia
	<tony@loafecho.com>, Simon Kruse <simon0x+git@proton.me>, "D. Manresa"
	<dmanresa@gmail.com>, linux-kernel@vger.kernel.org
Feedback-Id: 42:665032.636407:MJ
In-Reply-To: <20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
References: <20261029-ov5693-fixes-v2-0-2526d7b13030@gmail.com>
	<20261029-ov5693-fixes-v2-1-2526d7b13030@gmail.com>
X-CSA-Complaints: csa-complaints@eco.de
X-MJ-Mid:
	AW4AAKmzGcwAAAAAAAAABIOZQb8AAYC7iywAAAAAAAolyABq6ku9JxIsQMyJSzqkaz6P73m1JQAJtfc
X-MJ-SMTPGUID: 401ba90e-fe83-4148-aa59-d4bdec013fac
X-REPORT-ABUSE-TO: Message sent by Mailjet please report to
	abuse@mailjet.com with a copy of the message
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Tested on a Surface Pro 8 (Intel Tiger Lake, IPU6; front OV5693, ACPI
HID INT33BE) in a 7.2.14-based linux-surface kernel, with patch 1/3 of
the v2 series applied to ov5693.c. The tree also carries
linux-surface/kernel#180 (MIPI clock lane gating), loaded with
clock_ncont=3D1; that is not in mainline and is needed for the sensor to
stream on this machine. The in-tree 1296x972 and 2592x1944 mode tables
were used. Raw captures from the ISYS video node (5 frames per stream),
one module build with the patch and one without, each run from a cold
boot with no gap between streams so that the sensor stayed powered
(autosuspend delay is 1 s):

- Without the patch: stream 1 (1296x972) delivered 5 frames; stream 2
 =C2=A0 (2592x1944) timed out with no data and the pipeline needed a
 =C2=A0 reboot ("stream stop time out").
- With the patch: the sequence 1296x972, 2592x1944, 1296x972, 2592x1944
 =C2=A0 delivered 5 complete frames of the requested size on all four
 =C2=A0 streams, with plausible image data in each.

In both runs the CSI-2 receiver logs "Transfer FIFO overflow" and
"Inter-frame packet discarded" errors at stream start; they appear on
every stream on this machine and are not changed by the patch.

The test scripts and this summary were prepared with an AI coding
assistant (Claude); I ran the tests on my Surface Pro 8.

Tested-by: technosf <technosf@hit-on.com>

=
