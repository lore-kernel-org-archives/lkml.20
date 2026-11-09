Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794234621;
	b=fIbG2YrW8vAJBwMPS8vP2YmIlIbGwWFXGcttosef/Ik2IXoYpSVmrwGTcApxqn/szfu1
	 /XVU6ZE1xOegW21Hjeg7qYnPRSfBIO25NnYWtVavA7IofL2oZsVGxbbfMFuVytTfVCVAG
	 NFWbA03PN9BesrN/Cn4FPTdyvSc+GZgrnsYleEHCqYuAGqFumUHDaYBY8PYI/15HyUSt3
	 eJAVo2j7Z3yw8K89ytH3f5z1fGPSUpqomtEhI+YB/iIgae//p0R2e0MCKFDXWq3bF7AAX
	 FzAhR7Q34lRKrk/ZH0vEFizBYnimJ/7wZXa/VMYKnMUkP9NEX13e7ox8g6GNkISCITA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794234621;
	h=Received:DKIM-Signature:From:To:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=O1xDtpctIj9eDWUNnE+v2u5RtKT5EFtDRLjjoHZha+A=;
	b=3cgK+BM+VVdvTRT8687Hw3uGZcFoYg7UhPEE9nzwzYYpeuzKxcoO6hxHazMpRgke18Gt
	 odYZTZn8LSwipunH7yKeyVwtGIqt9MI3pZCd/OPUN6cvEnIhlPwsubRMbZpaFa3vmLfBW
	 8GP1R1kNp+TCuxZ7Xkv7Hx3p7AcB/U50LA75rjeXYao0mxVfzH8X4MnoqHGouCEOb7j3f
	 fzBO0ed3oyjPvBm8fgDA58bNKEyvp8SKZG4ytvvgD9MGwerS25A+dbf3wQ/qx7/Twzi3T
	 kgxaYoAI3ZejYB6spHirDTVNyBZ9PWug6bJytzMHRZ5QJYBOB8gy2PKc02VP04Tyayg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TS8VsHtO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73F0606A331
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TS8VsHtO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70DB61F008A5;
	Mon,  9 Nov 2026 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794234621;
	bh=O1xDtpctIj9eDWUNnE+v2u5RtKT5EFtDRLjjoHZha+A=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=TS8VsHtOLQHtHrgKYFyibKX4PNR2JaMvxvwEcF3S2Zp2jjL1AXPNlXoX6qAvs6Ka1
	 koBxYLbR8lFDLa+wA5VFjKq+hxr6bccNHRfEguITmlRwOrCuymKLDMYNt9KEkL7KzM
	 545Eku9SfujA484REwNSzvdCLpAEyBwwsEXl+5kju05vJYL2xyu8z8wIprZZ94ONJa
	 IojkOkdk8pGxxcXgZftDm/egMZeMK88V1fC/+s/rtjX5geMr4lVDzfkZVkcWyuUhGQ
	 lopxNJ8WkNUv8HjWpn4MLqLraeb6Xhin7yc75zrtgZwbkQwQxLi5Sfer1JQWuzqJ/q
	 bmIaar//GTntg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20261103201702.350717-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261103201702.350717-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] .get_maintainer.ignore: Add Krzysztof Kozlowski
Message-Id: <179423462009.181759.9877465731641161687.b4-ty@b4>
Date: Mon, 09 Nov 2026 15:30:20 +0100
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
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0


On Tue, 03 Nov 2026 21:17:03 +0100, Krzysztof Kozlowski wrote:
> I have been doing various drive-by all over the driver tree, so my email
> address does pop-up purely because of past commits.

Applied, thanks!

[1/1] .get_maintainer.ignore: Add Krzysztof Kozlowski
      https://git.kernel.org/krzk/linux/c/83427926e94f01aa50f40adf10c516ec0a1e7d49

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

