Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794908470;
	b=SWzin1VZCY9CjQHkpCTDUOjb+lHw1bK3+rbxU3YDWTG6u79URLZSmWam4XPkVc7lR3RU
	 jK8trJN1lZahGlkb3M5SxW4mwZfz0nVJvnntTqT8iwDT4BIGNlVZ7/UF/Wy4KPqJqHyWR
	 NvaAiso0HTPH8bVncOh3Gl4M7ineVIxrr6VvUydCw8ohGvnVzJNyr9VJjXe3Qj2v5vYOU
	 A1kZd+tnjoEbFAhrd+qk2sXmmyUpwDVxJgfClPqf1xrwtHlzbuRFqKQJg9Ba8dDREsh+w
	 35tvL4o7B19Pj9jb1Py8E7bz9tGzLoGkqx2Bvj44Ymp7n7HmyECK6AAnyYmh+XvvYyg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908470;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-ZohoMailClient;
	bh=zPDUmskooNba626AtSoQybWEUpg6ZGRUsqiViS2y2k0=;
	b=i0b85g7FIO6HjZK+OOX/2uRqOQLb9V/+EeX90oPd68LKtdLE4vV/8VR++cs5fPGrM/P0
	 wn3G2W9JLGvVCEPdLt713MigVBUl6G1Mo+iLDA8o4Zb3Rg5U0yTrOzkJib0mVoQmGwLwZ
	 TyGsKv/0Urqot9m6He9C+MDjn/ZmIx/Pq9QXTR2tVF7gHObGO1n56zUjz09tQdBAvew1P
	 WpKLsC6+PjSRhrtnD8uEGxHbs+rv3d23KQ6KcUsmouhk6vKhSoMPp85sFmO0Z/2f0XJAN
	 McTHyQZHOKO0h/eykoWo6ljEU9PtIUWk18E8msu8Qhls+GppW+XbosqMMFEod281+9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ph4ntom-rev.uz;
	spf=pass smtp.mailfrom=ph4ntom-rev.uz;
	dkim=pass header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=dk5BxgIH;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.54
Received: from sender5-of-o54.zoho.com (sender5-of-o54.zoho.com [165.173.182.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D165C606A333;
	Tue, 17 Nov 2026 09:41:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D165C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ph4ntom-rev.uz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ph4ntom-rev.uz header.i=@ph4ntom-rev.uz header.a=rsa-sha256 header.s=zoho header.b=dk5BxgIH
ARC-Seal: i=1; a=rsa-sha256; t=1794908465; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=It3lNUtJtLw8shovqZsRAHBlC5ezAARZ/xWjJF5LUIPDBuD7dLTsFyJM42i6zCsmSpnuhxs8e9qHHtcm3PkOjAfEAjVK0p2aPpnQN6n9l2cbuhX6nRRRG7wTFHJtOZnMEvB/HNgp1ioXuMs9vz6nAu6sk41iDaXuS+4tgYwaLnk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794908465; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zPDUmskooNba626AtSoQybWEUpg6ZGRUsqiViS2y2k0=; 
	b=dstH2lGeCsstvVnUnVOQa4AV0z5wjmC5oy80yjr0cRXKJl93E3wlaUfPXafsMkBVFyFj/c99RFM8H2o5Fzuw3oN493DZBJNTxtwtwM5aco3tDhTg669v8oEhv+3jt5Vx1/FAZv80BduDD48bzOdCPHk9IpHJzv4Xqm9YGvcTAf4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ph4ntom-rev.uz;
	spf=pass  smtp.mailfrom=owner@ph4ntom-rev.uz;
	dmarc=pass header.from=<owner@ph4ntom-rev.uz>
DKIM-Signature: a=rsa-sha256; b=dk5BxgIHz8Ptd5ILHBN5BxSypsADUZ9x0dTqopov3DlgW2L2HEKEiKUmgf9HzTlmnreYhXMtu5JZhlu9J84dD5lwHZatDIHIaembI+OVfJ8LiFJHS6lhCLE5I5FJRmsWwQ/K3Cj59TpP30PSTHaDh8t4Y+9ATsKSFIQVI6YOeyedSdSFixIzJSTxa7WdOPmTgmoQt54vlBnAypvMieJzV8/Z6JcLs+5H2duhH0shcpwxr9kDQD+l1mz5Pc/g6HtK0k3IpFDd0TjEMcFdYiOA3UH64fiKWu4CXW+go+KjCUM5g3xiasdGQT0pCUPCD4IqKIGORWEUl0L5ZtjMQUzHHA==; c=relaxed/relaxed; s=zoho; d=ph4ntom-rev.uz; v=1; bh=zPDUmskooNba626AtSoQybWEUpg6ZGRUsqiViS2y2k0=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794908463191845.3174153458322;
	Tue, 17 Nov 2026 01:41:03 -0800 (PST)
From: Enver Ikromov <owner@ph4ntom-rev.uz>
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Enver Ikromov <owner@ph4ntom-rev.uz>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH rtw-next v5 03/10] wifi: rtw89: fix RX filter configuration for monitor mode
Date: Tue, 17 Nov 2026 14:40:57 +0500
Message-ID: <20261117094059.1744-1-owner@ph4ntom-rev.uz>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <51477fcfcbb7462488e2fa3f299328b8@realtek.com>
References: <20261113235211.1911-1-owner@ph4ntom-rev.uz> <20261113235211.1911-4-owner@ph4ntom-rev.uz> <0a6a486d052e43c0adfb7fc6445b2026@realtek.com> <20261116152804.781-5-owner@ph4ntom-rev.uz> <51477fcfcbb7462488e2fa3f299328b8@realtek.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

On Tue, Nov 17, 2026 at 07:17:09 +0000, Ping-Ke Shih wrote:
> I also confirmed when B_AX_SNIFFER_MODE is set, B_AX_A_CRC32_ERR is the
> additional bit you need to set. I think this bit can be enabled by
> flag of iw set monitor command, right?

Yes, running iw dev wlan0 set monitor fcsfail passes FIF_FCSFAIL to
rtw89_ops_configure_filter(), which already toggles B_AX_A_CRC32_ERR as
expected. No driver change is needed here, so patch 03/10 is dropped in
v6.

Thanks,
Enver
