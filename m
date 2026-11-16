Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794870234;
	b=L7GUxIssNHghQluwsPUhtXfcW1HY1xgymJXhyJF4EF0Ol3qHDySuBmI7R7hpr2+3uMbr
	 W9j6YXzPV3CJRoqbxMLX0ovpAlDombl5rsFahzNHlbmVQk62O3V9u8pcHVjPVYynXT/t1
	 9oJdVfgC837G7g0P1hZmQ+lBh7nyFJbhoCXUYBtNSOcq8yqDGb7v+gPJb3wHU2BRkik0n
	 AgA6Gek5HR6nwMki0C3AE6f5q5pTd/KRHBZCO7nEYizTZ712TXCfvdd3Gt3BFWwfbup2n
	 nRPnodajhzlEzLlKzE3oSvikllJH5n5Sq6Wk9le9XkRcHEIKPnFF9eB6XfuBpsXbyfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794870234;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WvTyCYMyXgFacscnyyWNHd8Z/lyUXlU+ZL0TOkk4XGI=;
	b=xm1Hgy4km2ThV6ks2kojf2wtzZrNvJugEKDQO+EDzeCodbPlZ7tlDfQZuoAPuxOsvLpH
	 MeQ+BLkCrOvyn3PIKaowOCL5M8h6wnfnzBVoM4yCuZubw3zICohIU73CHNK8cCWiAkvzA
	 2MCOPfiZs6NfBaWdoAqtXJzrcGhmSgdFFbNTjbHic9/oa/7JeZB/5/+KE+12fC/OQH2oy
	 v5yKMB71r13fzHqYwakNg5ODtWmGhJ6l+/cdoHMWo4qhlbKQVKw41H5KXy5exu07u3wVg
	 QI7Ze/S4hkw0VFpxsZoLH2FIgz+D5uTyc1Y5UhJEL8BMNlJ5rVAAlyu8whhvkEHOxVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eY5uT1KT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC301606A330;
	Mon, 16 Nov 2026 23:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eY5uT1KT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643EB1F000C4;
	Mon, 16 Nov 2026 23:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794870234;
	bh=WvTyCYMyXgFacscnyyWNHd8Z/lyUXlU+ZL0TOkk4XGI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=eY5uT1KTA3oQumUKr0fquEuElS6g3VXSDKozm4YCcuJNNz9IJT7SP48UmEsG8qcoZ
	 9CwdAQGkaHYnepC4IDzBCXOsdHnSF/rX5BLsCmS0Z7dGh/62UcoFEqLZxhwPfe/naQ
	 SX9twbUR1mQeZt59fQ6C+w8f4v1Jfd1piYPJGc28yqNgd9fw+Cav5t3Ic6Cgf0F60w
	 SgEaB9U29TfeV1aA/wKhnOl3EZUQ/srpCr24yf80tCmkicwv1vj0AlNHiw/ygTt7hJ
	 g1PFVYNcvhChDcE1bct4dCQT8ZsAwdoBLd+pzx30wPpdG/Gx7ZmolM3nzZesg0JtUW
	 11whxYPd2mPNg==
Date: Mon, 16 Nov 2026 15:03:53 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Anton Danilov <littlesmilingcloud@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon
 Horman <horms@kernel.org>, David Ahern <dsahern@kernel.org>, Ido Schimmel
 <idosch@nvidia.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v6 0/8] tunnels: add core and gre drop reasons
Message-ID: <20261116150353.3be709b5@kernel.org>
In-Reply-To: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
References: <20261110202021.821224-1-littlesmilingcloud@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 10 Nov 2026 23:20:13 +0300 Anton Danilov wrote:
> Subject: [PATCH net-next v6 0/8] tunnels: add core and gre drop reasons

This no longer applies, please rebase.
-- 
pw-bot: cr
