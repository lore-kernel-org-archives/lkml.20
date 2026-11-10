Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=168.119.38.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794343408;
	b=lq3LsmeXK8fsqIqD73qzxqfAgiIig9RfwHFT1k5wgNdXFV9Lh3V0tJ59sKLVeZjJ9lrf
	 Bt5FxGoZzFlWnfLi2+V1EyleczQL/I381GLcVOIH9mUCWN/OfuAmYnbJ+7dlnU/alEcM1
	 7760TDtKslYSSmWHsURtAw/1y8bGhUam/+eqCSgfv1NTUYlir0sTMXhm664VB0JwtbaFy
	 T58wHvNDv1Lq6z1sMngrAwkCrYRIOPPlwC9CTQSRyWsspdXzGh17119aJlyvIM0GJ/WZd
	 7baswJzjAYIsyKpO3bHxGNH5/xIj5aMo+6BwHJoXy8lIXhXXl0AovKepILiUAyIS14A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794343408;
	h=DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:Date:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-malware-bazaar;
	bh=KhONeFyBAKOOk/pNYxkiti0WnXz8EHXVBZeE8YpgHVc=;
	b=BD6VQxu8QnIgrUwVqSQKMt3ZTixh/CRvjPdcdHtTeYvL4B1XaPt+GHCquIhNot9peCur
	 ryviR5OguusQSMQrFOMmrRqxPwd4bHtyrQ4a2yOVBLGvXDZ2nVIt4XxkxZkfDJ8A6gZOn
	 ta0rEaFIXo240nIq1EeXIzjLSi3xStTO/imhvaxs9u6NLJ6WXMSrxwyGA+AyXe57vM8OC
	 4Sq6T6AfIxKImI9IkMZ5EQ5Dsgtmz1uCKV3JV6slhpn8QYuNhdapW0Tf9rmsghn5F6eip
	 +HJK34C6CS9SqSu2n1z7oHhESQbWgvwD6ePvjxU6LImERRjSvzgNmEEIf3FQcUad6nA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=permerror header.from=sipsolutions.net;
	spf=pass smtp.mailfrom=sipsolutions.net;
	dkim=pass header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b="VrzXCi/K";
	arc=none smtp.remote-ip=168.119.38.16
Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00C2606A321;
	Tue, 10 Nov 2026 20:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=permerror header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=VrzXCi/K
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=KhONeFyBAKOOk/pNYxkiti0WnXz8EHXVBZeE8YpgHVc=;
	t=1794343407; x=1795553007; b=VrzXCi/K2kpEx6QcShpz1hGUWcXpIei/D8VQG5EwIQZm2SB
	SWpLnht0pIWvgl445tsNC19PGg+l0nfDSNxMr/cc1RKqPJjNEjEV6JiS/a9zV7x3lR7JG14YBZeJW
	cXyho0bANTPA6Une97oHwjAIAeRXLNUAhoAwrpVG3Ucy0hwnCqGXgCCpmxOuCWJzC1PwUmbqPzC3D
	sIVPUmLD3IWBLAP8kihZoggA0Fo9YzEq6uIqUukDbwM70o0gU+67u2Jwy0IevRdpvE+wcnSPaFwun
	Kdy/v60KVAFl2nS+2aL1Q77BRxbSs+yhy1phvo2LwnoPu6/OeklXwEfFPU3fhSqg==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__ECDSA_SECP256R1_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1xQsgd-00000002KDE-3gzm;
	Tue, 10 Nov 2026 21:43:24 +0100
Message-ID: <dacf9b17cee00430301403e64d8353348a747d46.camel@sipsolutions.net>
Subject: Re: [PATCH wireless-next v4 16/21] wifi: mac80211: send BlockAck
 policy in AMPDU action
From: Johannes Berg <johannes@sipsolutions.net>
To: Pooventhiran G <pooventhiran.g@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2026 21:43:23 +0100
In-Reply-To: <20261106-smd-v4-16-62e39487f51a@oss.qualcomm.com>
References: <20261106-smd-v4-0-62e39487f51a@oss.qualcomm.com>
	 <20261106-smd-v4-16-62e39487f51a@oss.qualcomm.com>
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

On Fri, 2026-11-06 at 13:28 +0530, Pooventhiran G wrote:
> While sending AMPDU action hints to drivers, mac80211 does not include
> the BlockAck policy extracted from ADDBA frames. Drivers may require the
> complete set of BlockAck negotiation parameters for certain use cases,
> such as SMD BSS Transition, where the complete BlockAck context needs to
> be transported as part of the transition.
>=20
> Include the BlockAck policy as well in AMPDU action so that drivers have
> the required information about the negotiation. Since the policy is
> extracted from the received ADDBA Request, it is valid only for
> IEEE80211_AMPDU_RX_START.

This seems a bit strange. Doesn't not knowing basically mean we don't
really even support one of them (delayed BA)? We also don't (cannot)
advertised delayed BA support.

Pushing a bit to the driver from mac80211 just to have the driver push
it back to mac80211 also seems odd?

johannes
