Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828018;
	b=ih8ydb/L7sh9a6jLlMvE0d9bTv0Zw7CQR0zOLdmE4bXzELV52fTTEVs3j1zeMgf1TLxa
	 +TtO2iZxMvLznQiAQnY7I8pXkhD5EKYJNURRjqN2H8JKjvxeSXDJoyzqsrq3CAbYI3lg8
	 gNzkZGEimh2qGJs7PrPsT3WHygXZebMBGzgH4gKaosShizB/xLvnfvyurA5LxByh1uwQb
	 f3SA2R6dqVmOUj0wn/q5ZGvDe/SnC47pANTX/dbt/WWJKW9eNVwuWMpoMwm5gbUkbi2Dg
	 V6buSpd2RiUMYgsBVG2f3au0icPzamT7TD+zbvUjfBIg0VuTlZ+UpJ/lbOCc5C+UmQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828018;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=Bfvf5kdxyLDGuRC3fc3q3S11fL5OIUcHZ64sgUBkSj0=;
	b=cPj3gtVIG1ldwDAaEryjgU/Jjhs2dXuqIQoMF0q9J/nltA+0TQqYmtcltkT54Zdc7tUF
	 cRxw7gmMI8Dk+UutEZQoKgGcJfnwVc6y19Hx7+jB9UytU0NxHW/mhORhOnokG0nrOt6SU
	 JGF5gPL04l/KFjML4M+ZvqSNYmw4rgn0GnYhZ4JIli8X5Mdz3U606WExbJcQq6U2BPED6
	 jlshk8MsZcIuyYbFhqNd8ocy1NbPvs3m3QTirlS/uc3hudYMUwFW7hqd/lRqqm4OWW+E7
	 +A1YDFLaDKTGIpXUdcTIDCE3NPqbexFaHt2DcpDdBlQadJiKvr+bN6u6P0cvkmy5Orw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b="CM/CAGpT";
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3A606A7AE;
	Mon, 16 Nov 2026 11:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=CM/CAGpT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=Bfvf5kdxyLDGuRC3fc3q3S11fL5OIUcHZ64sgUBkSj0=;
	t=1794828017; x=1796037617; b=CM/CAGpTFl8AJP+BKFqGJ6KimS/TTzJUnInV/t3/HwpKDel
	jmtId9aij7i5W9k9Pe0F5i35Pmmh1XDgIMaAyH7k0hjHf4dgCWwRiYbbXu067zbM3dhtUI0RbEqam
	R5tp5nT5rfUBc2njW54wucRwiuTzw6YjqtFJqWwWYJQAr/X0VsQ2BMIqjg0KyecbBrrMy2HxZK2na
	1fMbd3qK7S1hsK2+Fgyuu9zudMCAvjOysZcQdoNSuHGciIXVfVjdNJwtVU6TqWwZW566EZuZ5TZYz
	UI3AaZ8T95sx2UoQYCWqnCdMiTfxdST/evVhp2w41DTXbdP15u1yGI90AeN/a3Bw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xSukw-0000000GZwQ-0rfQ;
	Mon, 16 Nov 2026 12:20:14 +0100
Message-ID: <a31c882bce704ef51c71f16c63377a7d234d1a67.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 10/21] wifi: nl80211/cfg80211: add
 support for querying SMD context for target AP MLD
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 16 Nov 2026 12:20:13 +0100
In-Reply-To: <18544db8-05e9-43b9-b60b-bf24e97a1225@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-10-62e39487f51a@oss.qualcomm.com>
	 <29b38fc6c8a5f1b2b58d81c1a9046308d2ca9e2d.camel@sipsolutions.net>
	 <18544db8-05e9-43b9-b60b-bf24e97a1225@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.2 (3.60.2-3.fc44) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Sat, 2026-11-14 at 00:03 +0530, Pooventhiran G wrote:
>=20
> The netdev reference is held to prevent invalid accesses to wdev/dev whil=
e
> reporting the context back to userspace as there are no locks in this pat=
h and
> another core may be servicing a DEL_INTERFACE unsynchronized with this co=
ntext
> report. Since the collated context report comes from atomic contexts, we
> wouldn't be able to take wiphy_lock.

No, that's just not right. The driver provides a netdev (wdev)
reference, so it's its job to not call nl80211_notify_get_smd_ctx_done()
with a stale netdev/wdev, however it achieves that.

The address is also already provided by the driver, and cfg80211 doesn't
need to track anything.

johannes
