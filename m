Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794151975;
	b=qox94R/Dp+3AEa2FLCgtfbNXf2Ytt/s8CYY+J9SJpjveK2ervfICVHa68qxRWeE8OGdy
	 NSnCBkGOhKBBhdJP9QetN+0985BiWiroIBFH/A446gpkTNNEDyXIh6pMUY1GT6jUgrqe8
	 en3617v/YKvSHlkAo3VBof7aL9/aEOAFGghDbxGuzKVIn8rPaWQHpRhVQ8nmbPQlAq02g
	 g/Nps98Y3BMUxoKoKKrSHpfa5rBCqZLtBPYKVLdK3/wESz+vJR9y/DVwKtiPMUaUEoFzQ
	 dsF3mJt2v0NyzKzZBgp4GqENxQE0Y7zU0hXM4mPtLzCybZyW5ViSxkk0O8BFA14Vyrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794151975;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding;
	bh=IWjf1AfjlvBEBqa2V97/k6eHgPBBCNVpKuDQDK/AS+w=;
	b=ab1tahU+WQibbzvYWY0CoDT3/SU5B/afYzJmuL6Ud3OwmzPetyIMHDmo46D0bDpILKp5
	 gnB6xLCHQD0RAOcOFz0n4Fz7xrJKOzMdhYaQBkhWZYOul1qQ4z549l40RnQcDF841dmvp
	 HdJ2tnBNgUXgFNJcHkzd+DJTlJ8/3NCabz6MKpeKrPui4viy95sb4cfoOd3yuFRmApiG/
	 MNXhnjOKrw+Bop7d39uPpnN+ToC2IuVTckNnzVbhBHhjrlLkFzzq6p9GlOLyWC6Kb51Ha
	 ZLm3/y0Z6Y216Nsuai/IYNY4fJmQG5VPinOIAJff8OGVv47xI59NM8vSgJvisRf32xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fastmail.org;
	spf=pass smtp.mailfrom=fastmail.org;
	dkim=temperror header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=juanpmd9;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b="iLYsUZ5/";
	arc=none smtp.remote-ip=103.168.172.150
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9F27606A31C
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 15:32:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D9F27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fastmail.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastmail.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=fastmail.org header.i=@fastmail.org header.a=rsa-sha256 header.s=fm3 header.b=juanpmd9;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=iLYsUZ5/
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id E1A19EC0110
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 10:32:48 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sun, 08 Nov 2026 10:32:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.org; h=
	cc:cc:content-transfer-encoding:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm3; t=1794151968; x=
	1794238368; bh=IWjf1AfjlvBEBqa2V97/k6eHgPBBCNVpKuDQDK/AS+w=; b=j
	uanpmd904A/PKtjay1twWmVYn+LjLq8Z4EpSCpz1713N/MubOSxFNULLHzq+zrIH
	iK5w94fEB617L2DlUXnOzP3wtUerPWuAcS37P8+LgfrzsMAWN9Wr/ed3WzaGlIk/
	3hU2BdQLxwh3+D6tam8W9wA361NMGBAm8FYX+wR3nbNbTnCzuGIjVoGasDCjVrO+
	FLA87ffRTCmR5AGP8IQRUmFt3dYZ+ysKEBF+OYVIoxIorQ1HprWpcHcTe0gJ3yu7
	hxJu/sGmUgAjQwkUocudX+pA9Oj/sBGcHAizL7o9/LrpJ6pt51UvhAE/FZkmG7xd
	p9gGFHYa+c2wVcUerhgdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; t=1794151968; x=1794238368; bh=I
	Wjf1AfjlvBEBqa2V97/k6eHgPBBCNVpKuDQDK/AS+w=; b=iLYsUZ5/PZtwKiFq6
	hw6CkbPXwmcvrYFGXZMMqgsE0WD2zDvYBFaXXFoYjmOgMn26Va1PDALqZbAJ7n7V
	FwgLDIO+e6OrniC0ozeaXSQfgfqojINQ9bijecbXuW6L/bnJ4iazKJrjrkthhf2z
	xSYy1v33HLo7DxQibeQklBBeBr50JLjtnq89sqGCHVuc+NLMjP+z+T+fc/eSmGc9
	G44bOAxhIwlJoUumytfuSve/Zni97weSgaTqXb5X6jBUEpAXAdxLICkRf9KEHr5/
	n5GI9pi10v2kAAfMQqlsMIPMlfyZ6R8Rw6ADYC9LSbSPC58oVOJ3j4Jo03uPyjyD
	HC6ew==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=fastmail.org a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794151968; d=fastmail.org;
	mf=PGljYkBmYXN0bWFpbC5vcmc+;
	rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
	s=fm3:rsa-sha256:HA4cUh6qTwZkR+YUWQutiPClrg6Rszd8Vjfvf9MOOm7a2JK
	UciVdYrhJbMiw44xGGYb8zb5Z4VK37NZVsDLIiOyrPhTevmqPKwhHKxj4gLXLZ7A
	jeuGaOnP/8weWGYtZb0YsOBo0QKO12n4yx9DSOPUWFhR9RbG9WPEegd3+7IYNzgt
	nlaW1ev+an+CIj47CSpHi0vBK+txp31HZU2u/BhNpjhiXlAv08qR5EGhSUZIgiRF
	qaEm8s/RQ7/Qu8o3J+ZNj7oCRg5DPMpW8p9bHlEdUvUlnQEYKxEBCcKa3ChhaQh9
	0LnvaMUNPag1YneWJjibQ2kAq4Y2ORcJ1GbDp2w==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=11;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:RzI4OTwwEH3piNtUMQ7ntJzKRuMBmcmEVNm1nNW4LZI=:IWjf1AfjlvBEBqa2V97/k6eHgPBBCNVpKuDQDK/AS+w=;
X-ME-Sender: <xms:IJbwam2wBhsOibvXqMEZtRj-PtPuCayV0MKZflKMKB4uzXckK6FdCA>
    <xme:IJbwalEKj48axdrX4cKRkDjYncn5ArzxTlqX1CaStubIaxoqH2NlIAZBfCBUEJxIb
    NZff0U0ZCJzbmplAP2tWbGDSTL1LamWiHLa6xbK87krCpb8u_pMO6vl>
X-ME-Received: <xmr:IJbwahF7m-bVY0kPJEFw0ZhCTAQJ7KxFVVHh2MCNjxVwqSYjkF1ToD5-pdoAgFAq>
X-ME-Proxy-Cause: dmFkZTGXtPw9IbYjRI90tioqN+XYJaZFp9uHtO7kO+rf1dkgOSWkF+rSciOirlZyy3cUMZ
    esrl9uyueXiCArMs4gni4GuVdDbLwA17L7Poa1DD76yUiWBS1NKHC4LHtIabYvyakugriR
    NtOla0UhU8j7yvemQzzvBvHipnIXYuicfVueNBJ7PtyTX1TcNQTiaqDkU8Hwe2nKP3ONMR
    cNI06jjga9teXolAokOSQm0I9/6Cmb332AiOIqfJQ565CdiYhjc0ruQSpxbvd2Kojiu1qq
    rZkws9WF+1BfyAIqU29KyCx7Sx4PFcjTPl/CvXXWV+uX6jweCrjEzC9Tdp6eYtsM2yC3Nc
    39Bo0XiIr2AojjWVvq8Ct8H6OhFrvK1AdABT7nUChCx+gxlPF8aRhK8riqjk3IxKuZImFO
    Y566kfzThLwfZOgbux48Eg5SQZhxsQJZftvo3cSuxYVkbOYrH/0+QA6u3UnRMwvhMgryue
    CPdwkte4buyCOGKjlmc7/t9uBoeXBpcB7m+pUARCFwFFhBkKmYt73KcFZ5OhqyzES/jg25
    rB33Lc4m2j49ezJ1IXYqysnTybbvLJYstgcztOtP8pI9k4kVOKkdNYESU6dzRem1ZAfHtF
    9eF0I2rIixfVl7A3lYCMjuTbd7lyir7geAZaOiPPjNUvp2RhHsvko1sALRTg
X-ME-Proxy: <xmx:IJbwao6MJEUFfy0vMUJRKUAhFjzrKkdmmbRpF543a-z7b6dKnxP5iA>
    <xmx:IJbwamxB3YQ7R6k5aDqxcMrpqc6UV4g09FDh9xq3O0fpxGeucY7EBg>
    <xmx:IJbwanOYGGB1ASbQ1Ka6Y6pPGisE62ca23Wm-KnbxwdcP_1Y4ZS_kg>
    <xmx:IJbwaslq9MiXVYiuBxSz2uY30N3b4g5tZbZyYUCqhZRizGRcnFi3nA>
    <xmx:IJbwak8NyvbmMGLd1pJAxQgsCym_v0L_zZpGE2zAHZIuc1rQ4qudT9ty>
Feedback-ID: ib53e4b78:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 Nov 2026 10:32:47 -0500 (EST)
From: Ian Bridges <icb@fastmail.org>
To: linkinjeon@kernel.org
Cc: senozhatsky@chromium.org,
	tom@talpey.com,
	chenxiaosong@chenxiaosong.com,
	linux-cifs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Ian Bridges <icb@fastmail.org>
Subject: Re: [PATCH v2 1/2] ksmbd: evaluate the DACL in order for explicit access requests
Date: Sun,  8 Nov 2026 09:32:43 -0600
Message-ID: <20261108153243.1881152-1-icb@fastmail.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CAKYAXd-jNcP61uk8wm2xq6dtuw4_Cf-r1WDdUHSBQLJzdkOF2w@mail.gmail.com>
References: <20261107231941.1824289-1-icb@fastmail.org> <20261107231941.1824289-2-icb@fastmail.org> <CAKYAXd-jNcP61uk8wm2xq6dtuw4_Cf-r1WDdUHSBQLJzdkOF2w@mail.gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Namjae,

You're right, thanks. I confirmed it for guest and anonymous sessions,
also with patch 2 applied.

I'll send a v3 that records whether the DACL has an Authenticated
Users ACE and skips the POSIX ACL fallback when one is present, also
for sessions that the ACE does not match. The ACE still grants nothing
to guest and anonymous sessions.

Thanks,
Ian
