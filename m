Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793803856;
	b=fPmy6E7I8TQwIQ3oxgpTTtAJQk6D0Q5056dbk4kAwmC9Z5MdPKfqUbknPOaPbzTrVgL5
	 D0VNqOtpBk/CHUi8Se752ywMwhFOdzn/T5wdazaGb5/48s1bBZ64tvamIbeyZSMgi1dsH
	 5Ae/XNbplzsXBuwid3QuTGaT7DAvqBoStkZpNSedbm+gTIZyusujxmAPUE3ef/XD2kMW+
	 2SCk+oatBt3lbbuOj+9eZvt5Qj8Kv1SxseQa0J+K7y8yQ4mdXPLwEmLeTQe2BdvjAbdOm
	 LGCEuYGxNcHX/1mZK178oDxL3MHQfKhsS3ddrWwNscIUV4heb0AOyzshCeZQNaCcArg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793803856;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding;
	bh=svOy+zGHVcdPtGrvtxxDyVEeG7cGnLz/gXyFgaKtaD0=;
	b=oHKmHZaKIXl4j8ReyqPZQ2WcReejk9f8VEb24AYWK5qW6uR9a8TK1F9rIIlRdAdqKVyI
	 MdBQq6Bmxlh9INLsIsKPdYB8JKFdvVAuBu4TCuujf5RkSRlIQaOM/kdYJ9jG5IBYGYXj4
	 736c9/Q4ThR3bDLVhQEf68DJVdxJxlyDlriAbCoaQutHQbQ/JWLmNSOWrV/bFy5yiFuEm
	 1hl7nnQzqvNH1pFv4gh9Azl1zuQRbkQ9ck04anKuUY63/RWTrUfCcZjiPO13irDS4c+8w
	 uABRqDsGIZDPG9/pJDwqqhLTy7qD2dMHrlK1eFs/fsynVpT55liWgjzW/DU/67rA7OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJWJG0Q7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812B606A31B;
	Wed,  4 Nov 2026 14:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iJWJG0Q7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52FD21F000C1;
	Wed,  4 Nov 2026 14:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793803855;
	bh=svOy+zGHVcdPtGrvtxxDyVEeG7cGnLz/gXyFgaKtaD0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=iJWJG0Q7W1l6azSsYDSq5vCW6Eju7uEkBt5YwV9zZNskQYjiIAWYi6vjNcZd9ZpBM
	 UCjd6e3WnHN5i0pbnxcrHI3NxC5rS5R9wby3Kn1rdY1ANhjaNU76Ch1TXTUnySsCwJ
	 d5SAd/pkfFlGbiHm5VgDz7YpzxFs254KhEmz5hM/8eSqlCCp9q/H1vm+hSveDz3CAL
	 Xeb9WQTUkaaW+oGKEdodctPK0n1K0PeLSxVongMvguA1KYQPxALMt9EtbxoEnZklLw
	 GuWsaIzLfyWoBa6AZnMyHKqlTLCDdh+8eprTqBIKj8wkAe/FZHAL2+tO4oFKMKHkPI
	 XaXlSxeTGzG0Q==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: mediatek: Correct white-space style
Date: Wed,  4 Nov 2026 15:50:42 +0100
Message-ID: <179380380614.180018.397702707593418404.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210230.383532-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=543; i=krzk@kernel.org; h=from:subject:message-id; bh=x5HsLXS0bKM72nb91uBkXiIG5mm31kpwC4VdQSHnrRQ=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq60ZD06u1G1n/zgc9/oR6+85pG/IfJiym/3MSi EiU318L0gqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCautGQwAKCRDBN2bmhouD 11N4D/4yNeoNn2rzSwthfdq41ma6IfRgjAUZ0jT7sym7LAkp1Rjy4vp2VDu1IFcLyVwmHAs+vgj CBEQHvngYF3d+Q8vgZxdIhIDi0G3qXCIS/woM2AoINk1XmHvIpNFy10bncKRfaG3tiA7SyLwsUM W1RjrYheHmfX8wx1Yep+cgSOQU5Hg9x2uawid7LBB4INWdOPxWtanUaO6KTr1E+YaoN7XOm9VTI jbX04pN4In4Qobyn79HXgeNo6UOWt6JJkmywtkX8wiXIxEi+RvPs29mnJyN+qUamCIQ6Sm18wQl lip3AYw5LN18qBJ0+XsBapE7747FPjTwhbXHC83amt3rDmUFy7mdSHCdwl+K0vrw9kz8KRErarz 2AjnQFCxcdecjGZPjOGhqx9XsJLIuMfqPRBgcQG9CaFOzBSnCskGogNq+zkyU0VOxeuqkjkOGbC 9O1bhur8OJKZ1FrGfFws5839KkcqsFBptGzA0hJEqak42Z5GYbGlW/tOZcd3iooidmV8J8TqZjV qggQP6yqQtbFPTDixHCmnBpq3oRQI6Nr2ESzQFDx3IdXzMFMyxyy7Jx46zvPngAen57Mt6U1bFN 8pGjTP+c87ybgyPx8MATaN8dDR6fAhwkFfClLcEifxgNFoi1FZLang+lnPlRikf0sAGmi0aUoN/ I1RX1mzKmln6Ap
 Q==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit


On Sat, 01 Aug 2026 23:02:31 +0200, Krzysztof Kozlowski wrote:
> Correct a few white-space issues, like redundant space before final ';',
> which will be flagged by dt-check-style ("redundant-whitespace"
> warning).  No functional changes.

This is waiting for three months without feedback, so just picked it up.

Applied, thanks!

[1/2] ARM: dts: mediatek: Correct white-space style
      https://git.kernel.org/krzk/linux-dt/c/e0f010b24f4e29761b9d7a37103928f58ef6c21a

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>
