Received: from smtp.domeneshop.no (smtp.domeneshop.no [194.63.252.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A7C2F1FDF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 01:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.63.252.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790646749; cv=none; b=q5UwfCyHR4lz2DFbFtjTq9fe8VEYSlhFL3K6eS7asiOxwOg264GOTpBW6r/sXCzwwk0qy8PmK940epbAR8IS3+Wf5nrduFRzWZdrhD7/5WRaDH9jqfSmVfdS8WcHnwLkubsggyE6yizdJWdem5bz4Xvc9j2VVpBY7ZYqiyisVdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790646749; c=relaxed/simple;
	bh=Fzjb0kWowm8Nq1PuwnY5SqlOIKjuNFD2ox3sEJnzSKg=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=AOHRRcsKAYw0+MNH2dRwxcnG65s0bvOe9oX+FqyeZiDIuMwaSRAyf/IuFtqBxdlDXjACNON9dA86ZYdrdwdOzlWljQMc2tJCw3wu5BJINbwJ7gLseSBuuKhWHXzdESuGEgpy6g6zk7HMeET6a5blsxDq3xQbKHgP5Q7KdIL9ydI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu; spf=pass smtp.mailfrom=bitvisir.nu; dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b=KRvi8whb; arc=none smtp.client-ip=194.63.252.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bitvisir.nu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bitvisir.nu header.i=@bitvisir.nu header.b="KRvi8whb"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=bitvisir.nu
	; s=ds202607; h=Content-Transfer-Encoding:Content-Type:To:Subject:From:
	MIME-Version:Date:Message-ID:From:Sender:Reply-To:Subject:Date:Message-ID:To:
	Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=z5+lqrWINR7FNvbQwjHGMR69jzq2WJQpTCcJjE64tRY=; b=KRvi8whbDiFbRgo/Q7ZwhWmU9h
	w0RpYGmcbVrfvxfkLHwP7fqR8Yj20tWuvAQ0n+YSYKKm438+Cg62KzdD8MaERo2TNW8ktg2djjX2w
	EtLadaisn0GleCkoVnoXoHHGa81Pbfom1SEVYpJkQsP4CfpPo0o/ix00+fVnQzggSG7Dn0wrCx7GW
	MyV4lHkkDLvzuwaeGjG9Bcppd6G4Nla+uqNYeok6h3fmH5RBemE43J/4inIdotYqsQIr/isMxCmOQ
	5phG7WwP64BUOt1Xvt19joK/eEip2hUGZrFnJNxBI5bzWqKC5Q0YbPhUeie38kLVkXhA89N5fqOUZ
	NW77MgtA==;
Received: from smtp
	by smtp.domeneshop.no with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	id 1xBN16-00EggZ-Mn
	for linux-kernel@vger.kernel.org;
	Tue, 29 Sep 2026 03:52:24 +0200
Message-ID: <584eb9dc-0582-4e60-8eda-b01e362f9bd3@bitvisir.nu>
Date: Tue, 29 Sep 2026 03:52:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: =?UTF-8?Q?Ywe_C=C3=A6rlyn?= <yn@bitvisir.nu>
Subject: Visir 24dB Filter = No GFX Card Needed (Supporting Fair Pay
 Philosophy Unity and Low Jitter)
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Visir 24dB -
constitutes RMS, Constant-Q, Anisotropic in one filter.
3 poles, 1.3 cut down pr pole
last pole negative in sum
IIR typically for Constant-Q (minphase analog) FIR other.

Used via Cache, should abolish the use of GFX Card, and DSP card.

This is part of supporting my work with Fair Pay Philosophy Unity and 
Low Jitter, for ITS.

Serenity!
https://bitvisir.nu/





