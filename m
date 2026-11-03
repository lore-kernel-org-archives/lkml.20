Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793698121;
	b=fTTFImffQfQPDoGO9fTEQJEIIVYkI+6ImXlBNe8o2kL7/9d8RtUvrKqBwbxTwrwM+E/L
	 l97r4eYjOb7G/1MVMHxG14GXnHxF13cJhOtA/G3ekS0ZFK41MpTo0H0o6cqWBwO/uzhKb
	 VqaDW3lSOvStpXjWSLNMc+6WfJEe+CCQpUz/rZVWXIgavs4x9hq8KYFOL6YPY/115t85h
	 JaEYgTI59vilwIq1+6Ec/u+bDdOvlzdOBGymqhykakj/KwDk+0LNGLIglbfoSfzLQucnh
	 3twiUnsOMvaldNwXFGayBblL+9NMasMguFUcwX6wlzWhiQEVU3YaV8HBG3rHoM388QQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793698121;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=djWeyKAmzvHumcW3vVwjMEgaKbSeFuhq5krXPWVdimM=;
	b=2jn+b7dwNfethF57YN4zFQVscZPbfrotr022uFj3J9RKqK1JR05Wy5erSbtQhRVPpZcS
	 4RluYs368ANIFZa/QBW/XVfC/vUHlg7MfX0P4AIt0hOG0lSjLv67XDzXvomnHI0hrBGLY
	 rSyszizYGoby+b3HKAHOS+ehsJ+f3U2nL0axCt4eWDXcrKxsTG7+CAjdRLQp5H9O9VFoX
	 2tN+/0uHS99GnYxx7cdjik0ptdbS9P9OkCeQhgx14aEGVFjg4CqR7D+4yu91BkqDc+AQJ
	 E/GnyjIVTrwuCMAxh7kQlXR2g/dJH6J6iExt5CVNB6PHSekkBx6whiwBXXsLP1hh6IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwdrxRgA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B71D606A333;
	Tue,  3 Nov 2026 09:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MwdrxRgA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE901F000C1;
	Tue,  3 Nov 2026 09:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793698121;
	bh=djWeyKAmzvHumcW3vVwjMEgaKbSeFuhq5krXPWVdimM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MwdrxRgAc6Qd5scsbKxMGJWQ1NZsemtG9tJpvjgYmsEq8/wbKHlMLBykRB7H4Ouyj
	 SqbfRwogiBRc7VaPb+WqNrO90/Onb/upJO/YzlxXyT9gk3EYyH9d8pVOCzjy8QqwZD
	 YcWgEJ7WEUtJ9TsY4E+QCDRsA/mz9W+NJsaDOvCFggn6LPbCh3z1Af8gPgZBH592HA
	 Mz/YOxT+7HWBlFR97Scl+cQNQLJYBvXXhnwpr36k7SjQeR0YJmvLM1C4zeGQ4uKx5h
	 FN0UfvmabFK8UHqaSo0NSSIptNub5/ApF183td0afUslG+wnOvO9FjnnDZtTQiVdcs
	 5dMx1HeczN76A==
Date: Tue, 3 Nov 2026 10:28:37 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, mpe@ellerman.id.au, 
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com, 
	maddy@linux.ibm.com, sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/2] dt-bindings: vendor-prefixes: Add WatchGuard
 Technologies, Inc.
Message-ID: <20261103-rebel-vanilla-mink-e7c04b@quoll>
References: <20261030125024.612396-1-lefteris.koutrakis@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261030125024.612396-1-lefteris.koutrakis@gmail.com>

On Fri, Oct 30, 2026 at 08:50:20AM -0400, Lefteris Koutrakis wrote:
> Add the vendor prefix for WatchGuard Technologies, Inc.
> 
> Signed-off-by: Lefteris Koutrakis <lefteris.koutrakis@gmail.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

