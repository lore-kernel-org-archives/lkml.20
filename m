Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8084548AE36;
	Fri,  2 Oct 2026 11:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790939782; cv=none; b=NbvC5l/JwtbIaoi1BNilYjJDFRl9K+xynCcEL2hcOjMdFKw0Un3v9ejo/NDriYi4w1R3H5rB4WX5/2djHwegint4A1/mL4k7Wdk4AKtY/yGg/cI0voeprbiU+nkhSQK278Gj6sRjN7AvZxgOv+zvuzYRb9z1/hTRilIi2eBQvwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790939782; c=relaxed/simple;
	bh=/Ii96rEFAHsGptP6buoHkN/GhKXzIJhG4MPWS5eECIk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PUYjbsdaQNB1F6owBYa7kDNCwLEbUBBID3zZoR/bBGcesnJ1GjHDtNKBh198EHPQ6jZQniCsvs6yJc6qnps4OKLRowYxFhtbjXj2VMGdosX+0JwvlhHb76h0iJ31HZaTabusTfJh9jpr4AZhD6GdFqurQfLmu/+GkcV8CYtA90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cXlrr7Qq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cXlrr7Qq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADEB01F000FF;
	Fri,  2 Oct 2026 11:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790939781;
	bh=o+qDQz6MDbJgHtGmVbS+vsSr5mB3oq9KHjE3DmnGWHc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cXlrr7QqrjDb82E1XQgj0WUDa/HVphwP+xT92QAHp9/1u9QZ8wQzyR2mLXWjE9J2A
	 P7zKmcx360P4zlk1oFXcJDp+7BgHhcRXUseeXsgP7lODfzvF0PXR0OFXKQKjiIwWYw
	 I2Bf5PwpHQdKEOapCdY2ImNSLKbvik3zDtCmU9RfxGnc5Yg7wrNO7xUWu7Ty4sY9Ye
	 b5QqQVrCmnLnSTUCSxaBaIw6DwneUyaabU7XP8HcuUdzBJR4N9L0ruQ2a48nRYu2an
	 oud9KEeUrI/WV4GSZr4sBVKrYlNA9egeesAiKQIMI6mXVuKm8LjW3UWAjJ0Y8pQgCc
	 eflkUPJGiVnAw==
From: Yixun Lan <dlan@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	Jennifer Berringer <jberring@redhat.com>
Cc: Yixun Lan <dlan@kernel.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vincent Legoll <legoll@online.fr>
Subject: Re: [PATCH v2] riscv: dts: spacemit: set console baud rate on OrangePi RV2
Date: Fri,  2 Oct 2026 11:16:14 +0000
Message-ID: <179093968156.1235108.5825486456769564907.b4-ty@b4>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20260929120227.1791356-1-jberring@redhat.com>
References: <20260929120227.1791356-1-jberring@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 29 Sep 2026 08:02:27 -0400, Jennifer Berringer wrote:
> Set the baud rate to 115200, matching what is used by U-Boot on this
> platform so that the console is usable even when console options are not
> specified in cmdline.

Applied, thanks!

[1/1] riscv: dts: spacemit: set console baud rate on OrangePi RV2
      https://git.kernel.org/pub/scm/linux/kernel/git/spacemit/linux.git/commit/?id=789eed2d8bfa83d79e24d185f736b038a121b3ce

Best regards,
-- 
Yixun Lan <dlan@kernel.org>
