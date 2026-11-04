Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793796944;
	b=4EejIaq3YM1lGi7lSk9PlgnsUYhpnpKp1P1+TAw5xdRfED5XkwCSlWdZGuWSYbnenWYe
	 eUdKbBWTiY61tRD+V0mnWbWOr5MpVPLk82ONiimHHhLPvp3mL6uxO5KLcyN6plgUeFwni
	 t4Ibffla/3eGm5lBgi7jKTX91dl+1yhZyDR5nT1n1TsByfypszwI4Q3q9Wbu/ZmjWhgsZ
	 iIEyLGESLEp14iznYoSKR3/MtTVLZsXW/CgcgzOdbSSLatnt3Gc8MJ11vXbgrFjnPul0B
	 /PNYK3/sS2IJUstzNT/MmGjg21sVXw5fAYfvHHzzP237NnVHGxcOH2tjEmly/YvIVVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796944;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=dOploYd0FkyIvhpUCMRxj2PwQ36WYdPWJVaVVhdaU4w=;
	b=inusfQ4DXF+gV17LGiyBbGY3Zb0hZnegF8F/AtCOqm4Sn6QQ9hD7U7MsUW3V3u/uRzrO
	 yh8iijaBEpCfw0WMwbwiaesDWDACBZpqrVvvgCV6/GJWw0u56MQuqAKH/GvPhxDPFdIZn
	 ILd4xxgBPZa8X8Y6uDbWoce3kdETo12lq5a9dF5zCeMTFQnn5/dkL9pDR8fuhbgPKmXd+
	 IX9+AQx1zF6I3RTYqjuk3iDeIekYl4nzRuAff7yOpiQuNrLjixH7oF3lfT6qUN+rb6O/q
	 9GznnHWvQgEQj5iN6JwU1jojo1P9uknargp7EuwrYnGmsFTKSg+NE8rZXWm/8OVdqiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDyMZbMf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4703D606D803
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 12:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDyMZbMf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE96A1F00A1C;
	Wed,  4 Nov 2026 12:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793796944;
	bh=dOploYd0FkyIvhpUCMRxj2PwQ36WYdPWJVaVVhdaU4w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GDyMZbMfjQwq9EqyS//PyAgd2F7SPQ1x88TrVnjwqjVimGJwPNMC8D0fRpGCc056n
	 mKPDTIDvLw7Xx3aJFMKVoIYE2Y9yw3ri92RmiJxKg6u+w7xwY/EThW+IdnfxM8KEE4
	 wRv+81qHvMaIkvs+gtbZXxvwyTPxTCdEA8cnJGZoKUYRnCsW8bM3fEUpWdH9xOtv/I
	 AZ+tktni63/xx8unhZq5neGgH4IVrT35jlSuf6Po8Y6ihmSEkO8nlUJHGZnqkc8loi
	 rHSGSQdVT+GeVcCuvpG7ClKmCQIEd2vhNAPxVV3KDhqTo3BS8r5CbibJHPvISIF/GG
	 4zTbLh3yGR9qA==
From: Sasha Levin <sashal@kernel.org>
To: Hamdy Abou El Anein <info@daylightlinux.ch>
Cc: Hamdy Abou El Anein <hamdy.aea@protonmail.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] scripts: git-resolve: ignore non-commit objects
Date: Wed,  4 Nov 2026 07:55:42 -0500
Message-ID: <20261104125542.3769389-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261104054332.10869-1-info@daylightlinux.ch>
References: <20261103164202.129624-1-info@daylightlinux.ch> <20261104054332.10869-1-info@daylightlinux.ch>
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

On Wed, Nov 04, 2026 at 06:43:32AM +0100, Hamdy Abou El Anein wrote:
> git rev-parse --disambiguate lists objects of every type. A unique blob
> or tree prefix is therefore returned successfully as a commit ID. Such
> an ID cannot be used as a commit reference or Fixes tag.
>
> Filter the candidates by object type before deciding whether the prefix
> is unique or looking up its subject.

Thanks for folding the argument check in.

Acked-by: Sasha Levin <sashal@kernel.org>

--
Thanks,
Sasha
