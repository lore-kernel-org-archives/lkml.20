Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169437;
	b=alURRHXFotSpLS4XQO49efJtiUHDbjwTtsgRIeASbiksE8oVyAYnYtDgipTn1ltDVVDJ
	 aIL8epBfQYNq8eaofzu3W+hq2yDAGkzgrOQb7TmG/7Q8OQNMV0lvnk/ul7NuFFEeqD7eH
	 CLdawOH8A8Rr9xz+e+/NqF20uKn+WrHd75NWGAI7ZTLqaKuC591lEvHdAiDCnxt6iSytn
	 wmJ9u0A0KaUIEKx7tXb5k7aenEsIdRpG8t0+PMx/O6/CTz+YB0LgeKKM0vN3BF1hs52Qz
	 smOLG4EEHeQeK3A3Kggr2HqZTk9ze8Mgz5nFEyxXmQRVMX7qzk9nYWNE3QXqeDkDktA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169437;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=EOuvkZGjoqdAJ+SsqA9nlZOgNgVUmg8j/+ZfM27XG3I=;
	b=Foq7kKeHFmSwd4F/Fm3oRBDi8WtSWDYzGSeslz3+TQHsAd1QU3O0TwzwwLIlUcJddHyu
	 jYXaVPQsJp/Ifst0Bzq+8sGSbwxSLzqoctic/f4JeQvRDlCnFB2BCh7i8K4DcGfK4beOI
	 dhuS9ZRadnPeqYOZb515qQ4ri/0xFQ2O4HYQQ52SGIL7801Jj8xGsEolqxa/D76i2olpG
	 aloz0IOoxxejvdZY95THre6RJmlUgazSIw7WCGCLLT0kR2kZD3bHWWUtj5MwaUjVpRxoE
	 OPAF2IxdNGuOdlsP9YwoTHKJ+uVVj+iNha3npZ3P3PMRXXnGnatEurVS3HJpQhxrB3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdYGZXky;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51BE660759A1;
	Sun,  8 Nov 2026 20:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kdYGZXky
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403C51F008A3;
	Sun,  8 Nov 2026 20:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169437;
	bh=EOuvkZGjoqdAJ+SsqA9nlZOgNgVUmg8j/+ZfM27XG3I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kdYGZXkytXaYNYIpYTNsRR585ps0M6wyXQshAGBRQdNqL6/gZO6zZGoUEnO3SAzzj
	 +/Intdv6QDH2l8SofaLWkZlfGwkk/5k+cBRpdo+134EZ2cNOCfZtHUcoDXU3DCJm0M
	 VZ+VsPh1t16tGABQvA/z7uMwoiaVXnkTVkET/JyYQ24i8ED9yJ2vStHq8kCcTOibvB
	 tn6kL2P6RWSJiX16yn02N323e5RzVI/3Z/8FrhL3eouAbQ1Pf+WEl/Jd94WUfn1Wa8
	 47ycgCkOdBvlvkdI5F5Zt/uubyV6u0xFTNosc58FxEbLZfo9i6/rs43snKOpc/s0Us
	 UAKf+6iYckNiQ==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Luke Macken <luke@phorex.org>
Cc: abelvesa@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	srinivas.kandagatla@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add Elan touchpad at 0x15
Date: Sun,  8 Nov 2026 14:20:36 -0600
Message-ID: <179416929384.628393.4815391569642209330.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261014234949.1730808-1-luke@phorex.org>
References: <20261014234949.1730808-1-luke@phorex.org>
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
Content-Transfer-Encoding: 8bit


On Wed, 14 Oct 2026 17:49:49 -0600, Luke Macken wrote:
> Like the T14s Gen 6, the Gen 7 ships with either a Synaptics touchpad at
> I2C address 0x2c or an Elan one at 0x15. The dts only describes the
> Synaptics part, so on Elan units (e.g. 22A7000VUS) the touchpad@2c probe
> fails silently (nothing answers at that address) and there is no
> touchpad, while an I2C scan finds the device at 0x15.
> 
> Describe both, as x1e78100-lenovo-thinkpad-t14s.dtsi does; the absent one
> fails probe harmlessly. Both share the interrupt GPIO, so move the
> tpad_default pinctrl state from the Synaptics node to the i2c0 bus node
> rather than have two nodes claim the same pin.
> 
> [...]

Applied, thanks!

[1/1] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7: Add Elan touchpad at 0x15
      commit: 06b7a31608876dca5a99a9ea528281f2c8dc18e1

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
