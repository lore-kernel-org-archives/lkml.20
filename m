Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793528434;
	b=XqZoxU7rcaJ9KbY71LnrRRCYj9xw8AOkWXSEjDkwH8/9MerUFYu3a7CHHhAS7DAqT5oS
	 m63jmfeAKXzr+7VSi0vTTdA0UR1HpCCkSFKhD4qtRcGv5chbQzQ0dLZKHiD+C6NTqVts/
	 K3qGp4VS3+ZFmFsrp0KEF/eYGg4CPt/8cszxezTon+V51m51L+2JTGd1FhP2Sncjiy7na
	 h6JVUhXevgRyGz1tWOCbr4aBNDsr0crLfmicxZKHo7M/8KOd/cuequgoX7X61SgkBb86T
	 b5Thc4LnN2xBimhe2Wn4SFwfxAiEpi1uzd2MBPgEgspuqvRRbtpW5nuPQJezqn5MPCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793528434;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=TkstfqMwLVi3O9Geq9Sw8ekLhOvsr3GA+4QG8GJigxk=;
	b=Eck2fKXltsZ3QqnwcuvaiYtCyFSOC61tOFGtki7rDGpE8c6Z7qa5a/4ghsvPZEAPv6X5
	 W7c1iujtml14/nigWomINJCkEvuL4bM1u5v4lgasI4+9Lyl5xwTG2SBq6pv+n111wzSX0
	 eWVMrys59hfxp40X7W74cUqW33TFq4KCuFGl/mtUb+sTMY5gWtQGJZ8dQ4Up9he4bPM1+
	 hCkCJbGagfcGu4qVygLAw8DYwarU7qk279M+ZMPQLnLdHEX35ZnYOvCyFbX7XMrVlh++E
	 jcppaYOBd8uy3301PMfb5BMh3/pd2Ozf/WeC6Eb+GKqoSuJw6OFd3s+QIAfTWMMQZwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+nHu0+b;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DAE606A324;
	Sun,  1 Nov 2026 10:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P+nHu0+b
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F161F000C1;
	Sun,  1 Nov 2026 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793528433;
	bh=TkstfqMwLVi3O9Geq9Sw8ekLhOvsr3GA+4QG8GJigxk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=P+nHu0+b5rfK+aXhEmjWLD8w8GrD3O3uu18WH0lMRQ4sUXSIdqTNP9iyJ4GuAkxUh
	 OKppBIwkP5yaYkwup61QUAjbSRjAMdhnenQgRgWsuJiR1aVU4LO4Dvy2nevN6kSeIG
	 1XAY+SExgSVwzuL6Xkr5HF1msUj9+Q1xUCdw1TKVCPfa23YqGqSVMpuMZVc9bPv+O5
	 1ERct4siCLQ0LN4Byw825y83ABAnHVSCDOiUbrhEotRJ3e5weoovsQ05jWmnCrk3uf
	 f6zXV6ZyTRm4AAGnXNfbEhQOhCmH2xe68DRySVRK2+/kJLyGnDw1U9SCg9S14pydmd
	 mlZU1AD5kDDCw==
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
Subject: Re: [PATCH v4 2/2] phy: airoha: add support for AN7583 Gen3 PCIe
 PHY driver
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261016071225.2092-3-ansuelsmth@gmail.com>
References: <20261016071225.2092-1-ansuelsmth@gmail.com>
 <20261016071225.2092-3-ansuelsmth@gmail.com>
Date: Sun, 01 Nov 2026 15:50:23 +0530
Message-Id: <179352842351.2955.1473721252992943972.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=476; i=mani@kernel.org;
 h=from:subject:message-id; bh=QM9ES64G5eMGECElOm5ezgzKCyheAyccn8+aOEbI0Fg=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBq5xJuJhIJL80l+IydUaS6U2TPqyRHet4HuM9ew
 Y8yUhlL8CyJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaucSbgAKCRBVnxHm/pHO
 9cm3B/4lSOxWPTXOja4ew2u8cVg06zJcuAYJtyd1F8s+DgKJYRb/B1bbKu46J6EBaFvhD8dkusG
 pcCDP0OrFyTRKlw+FiuRDAMAgLJNCcm++Wl/D5OwNZc8AV2u4FBl0ODdi2Q3AmcA0Fg2bL+jHRT
 aqfRlc9I7f/RIp9Y/EA2vjkpNSQhwwBV7oKkUIZHM7+4AOx6z/btmXejbTjP+489QOMsQX/h8wb
 zRTi3PsLctWQXlGFphkM/6sxo69nFcwSxtLyYtGKa81zp/QBkNrXkFU57WcNLtSwsDFltQ5/bFo
 QvqNmaZFUdzw09RtlMFijjORR3sArnDcZMpHn7SSgJV2pxoq
X-Developer-Key: i=mani@kernel.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008

On 2026-10-16 09:12 +0200, Christian Marangi wrote:
> Add support for AN7583 PCIe PHY driver. This is required to make the
> Gen3 PCIe port present on the Airoha AN7583 SoC correctly work.
> 
> A different setup is needed compared to Airoha EN7581 where the
> calibration process and the register map greatly changed.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani


